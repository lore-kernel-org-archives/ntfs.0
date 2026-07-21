Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A74499A7
	for <ntfs@lists.linux.dev>; Tue, 21 Jul 2026 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627700; cv=none; b=qTd8VcoflpFof9qsddkTST3qx4PmrYMNoov+oEvI19LStraIxKEBHv/U8hSXlJSTid9FH+yGSOS9aek/9c6vnMHVoJW++xuf8XsA6LrT1NXs7LLBUgeZ408orjmFIisLyNSOdvhlvNjJMQYQGpNkIuKiVNEPMe261EB1+SN271M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627700; c=relaxed/simple;
	bh=Ej97UZKI5bpzbhNP+GgNwQoohC41z2yqR2ygTg3iNng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rRfPllQAPYkdde9gdqjYWPI5DQQQAjsUDg1y+sbhMBqIB1+EoLHUpAgU7fLKFEGMD6dDg7HZPjnqQADPKoRBS3XLmBuU/IHlcpHvvhXiyFtutMMyWnmPKX7Pr3Vp1dkSAwrkpRJtiN/K/gnlY92zsX8IcQGedDgiLni+q2tkyV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQ0NtXSO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQ0NtXSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDFC1F00ACA;
	Tue, 21 Jul 2026 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627697;
	bh=Q+mKGPG+8s+koabOJylQS1sXikalfXJt+v5JECdpgjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VQ0NtXSOBJ0DMp1c5YkwooSTKM0dvF9iJ0wTwhU6KBxMYwYkBcHA85ZWGIXWxGj/I
	 dnh1TBYh07hBeonJk5onj789HsPJScu9Xnwk/C1ccMr/At1j8itcjJJ8UgK0NF+9aS
	 VP7sY72PCPoDbVKzdh1G1hzf4GCd8UlHSSlVQ63hoQBuTnkICc9mw1gG5guAqMFINV
	 gJcMb4caDYEVj2Equbvnf/QEss6mjA6fcczsrd76HX0iC3/GABECjj9/dJDc1+Lv9+
	 icpOIlb0AK9lMa2KWtxxpzmuIQR6TH+jjkNeVsYjzD3fpsuyQeIaA84TKPSBiOBZKn
	 NL8bMHkMJElqw==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 05/11] ntfs: fix initialized size and page state after compressed writes
Date: Tue, 21 Jul 2026 18:54:25 +0900
Message-Id: <20260721095431.6619-5-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260721095431.6619-1-linkinjeon@kernel.org>
References: <20260721095431.6619-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The write iterator now expands attributes before calling
ntfs_compress_write(), so compressed writes must not expand the
attribute themselves. However, the compressed path still needs to reject
zero-byte iterator copies, advance initialized_size after successful I/O,
and invalidate modified folios after a failed compression-unit write.
Reject no-progress copies, persist the new initialized size on success,

and clear folio uptodate state when the synchronous write fails.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 5b5cd494e5d8..a993cba3b961 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1549,13 +1549,26 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 			}
 		}
 
+		if (!copied) {
+			err = -EFAULT;
+			goto release_pages;
+		}
+
 		err = ntfs_write_cb(ni, pos, pages, pages_per_cb, page_offset);
+		if (!err && pos + copied > ni->initialized_size) {
+			mutex_lock(&ni->mrec_lock);
+			err = ntfs_attr_set_initialized_size(ni, pos + copied);
+			mutex_unlock(&ni->mrec_lock);
+		}
 
+release_pages:
 		for (i = 0; i < pages_per_cb; i++) {
 			folio = page_folio(pages[i]);
-			if (i < ip) {
+			if (!err) {
 				folio_clear_dirty(folio);
 				folio_mark_uptodate(folio);
+			} else {
+				folio_clear_uptodate(folio);
 			}
 			folio_unlock(folio);
 			folio_put(folio);
-- 
2.34.1

