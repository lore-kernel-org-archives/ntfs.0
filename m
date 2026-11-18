Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992862;
	b=J3SV64sXCwUt77F0CV6ufh/SqX9m/psLQYuCLtDT3R6Friwqb0lJn88bDdMeUsDSBEBC
	 QIBH8Dm4ecXR/sUaCPlD65r4gpITnmEfwRXfrlHB8yxFlSabI7tuLCbrwk5Csy9WHKaJe
	 r5ine0e433RlocdfIKX/FGreFfVWAiOPsXqM2oS27DM4UYpdruLyyDqmw1noMD/y01goJ
	 FyXiRplyKaOFByElcxV6vaCGIArY4NEtzwEh5ICbbQNdnzJrMcVC/GkLBuvnTlAF4zIpa
	 qzOPDAkvnj/D6PszgpyBopFirN4WWpcKIExcOG2uxM2ITTWz1Uda9BKkAbr4ulAjjhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992862;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=eMoIF6Lrn30ijyXWi6LQ4STmwyspf4I5H6VBobt1/us=;
	b=y+mCu4FnXAvSKOYtll8vKfIHD03a6SpJMVQbGgTUHC0VsMcw725BULFgIYrMyiXzDMDW
	 AOWldhOZLT5P7HGWpAYtlFR636zvPp1wQXZL6CnRhdig4OS+hD3oHeZzR+ySVRrTU0Rcu
	 mrXPxU9NODGCBNPkwpeCWwEo7cPSj46xL3s0KFALtQpWETNs4lgKbmCxuH9Sh4OJNi+6P
	 W0jj6ksJLqMOOr0pu4H1sGjJhJoWaFO4ge6EYvbCF/GCOqjYM4GtAckLEupkFrEmRZ6bO
	 GvTGIniJkZOJRXvqRcpceeLY345ibBpRw3JQGtRCp1gvWJyD6NbbitIKq5bOPuv344A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bno0E8Cf;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F04606A31C
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bno0E8Cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=eM
	oIF6Lrn30ijyXWi6LQ4STmwyspf4I5H6VBobt1/us=; b=bno0E8Cffq/LuDgXUf
	Jsq3UfK4QGaIYg/AxYx+MnzQP5K2hwOO7kw48Rr1yP1ZlG4iqzwT+HUp+oTARkLv
	vdIw0Bz+9sryKIL8iEbGnbur4wgZSZ9gSLFUP4aAh538vx+JsWwrqv4EOZ3Rk1ux
	w2ZJnei+8MM16ulvufy1xQ3eI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDn7yTNav1qnmzWIQ--.7895S8;
	Wed, 18 Nov 2026 17:07:29 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 06/37] ntfs: preserve compressed I/O preparation errors
Date: Wed, 18 Nov 2026 17:06:30 +0800
Message-Id: <20261118090701.1858849-7-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn7yTNav1qnmzWIQ--.7895S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFy7uw1fCr1rGF4fuF47twb_yoW8KFW8p3
	y3urWkKw4xXF1DWws7tw4Y9F1Ig34IgayUGrW8K3Wxt3Z8Krn2gF18tFn3ur48tryfJ39x
	Zw4UG3y7GrWYvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRfb1nUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzhHo0Wr9atHzLwAA3W

From: Xuewen Wang <wangxuewen@kylinos.cn>

Compressed reads discard compression-buffer allocation and runlist mapping
errors at cleanup, returning EIO instead. Compressed writes also replace
mapping-pairs update errors with EIO.

Save allocation and mapping results before cleanup and return the original
errno. Keep EIO for an invalid runlist result with no more specific error,
and preserve the result of updating mapping pairs after compressed writes.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Extract compressed I/O errno propagation from v5 patch 10.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.

 fs/ntfs/compress.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 82c7c7d29073..6a393e7fc1dd 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -585,11 +585,13 @@ int ntfs_read_compressed_block(struct folio *folio)
 	nr_cbs--;
 
 	mutex_lock(&ntfs_cb_lock);
-	if (!ntfs_compression_buffer)
-		if (allocate_compression_buffers()) {
+	if (!ntfs_compression_buffer) {
+		err = allocate_compression_buffers();
+		if (err) {
 			mutex_unlock(&ntfs_cb_lock);
 			goto err_out;
 		}
+	}
 
 
 	cb = ntfs_compression_buffer;
@@ -633,7 +635,8 @@ int ntfs_read_compressed_block(struct folio *folio)
 			 * duration.
 			 */
 			up_read(&ni->runlist.lock);
-			if (!ntfs_map_runlist(ni, vcn))
+			err = ntfs_map_runlist(ni, vcn);
+			if (!err)
 				goto lock_retry_remap;
 			mutex_unlock(&ntfs_cb_lock);
 			goto map_rl_err;
@@ -839,6 +842,7 @@ int ntfs_read_compressed_block(struct folio *folio)
 	goto err_out;
 
 rl_err:
+	err = -EIO;
 	up_read(&ni->runlist.lock);
 	ntfs_error(vol->sb, "ntfs_rl_vcn_to_lcn() failed. Cannot read compression block.");
 	goto err_out;
@@ -859,7 +863,7 @@ int ntfs_read_compressed_block(struct folio *folio)
 	}
 	kfree(pages);
 	kfree(completed_pages);
-	return -EIO;
+	return err;
 }
 
 /*
@@ -1452,8 +1456,6 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 
 	err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
 	up_write(&ni->runlist.lock);
-	if (err)
-		err = -EIO;
 	goto out;
 
 free_rlc:
-- 
2.51.0

