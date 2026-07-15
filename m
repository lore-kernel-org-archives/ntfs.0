Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDD037BE6A
	for <ntfs@lists.linux.dev>; Wed, 15 Jul 2026 01:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784079539; cv=none; b=Ku88bZvwsmRxxoO3z4J9EzNWNEadpHh4MptBmsNHRQG1Q+urji1QsG82aLxbCgWXPXl8D9xxx/X8JGZiqUfYX1s+w/dPtEP48JQBsjOmYPFZ37d+FAa2kPvGxcDinKuEciRpjvaiXQIP3VDXq/Bs3A2owolFnCCnn9VgiBAN6qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784079539; c=relaxed/simple;
	bh=D4gkVYCuyVDuPE1Buvk1JCykg7DPhV5nQTFUmlWKvPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5cnzXKG42rt2s4UI1ZimQvr/xmhGHeRdGpgxUj2Voy61WARXqSmfmauBUycOWOv+AkqTl/ruLKHdTZ57i3462bC2SSrPLiLWHfg803BeQK2WoqyeMV5Mp9WK96vV/GpbgcSJtSHKHjo00OnimM/oKeOr2Zps2Y6d2h8/xN7F6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEtC/rkf; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEtC/rkf"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485b358552so5422980b3a.2
        for <ntfs@lists.linux.dev>; Tue, 14 Jul 2026 18:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784079538; x=1784684338; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CbeGLYld02CCONXLbMpcn1oEJP7Cj6rliwiy7C/rsVU=;
        b=AEtC/rkf6RltXIgSTZF/u3BwRHcQYeiS1UVn/Q3tNoQUf6g0SVFM2/C2TmTQ5b/nlY
         JJT6E8Hvw4LrdlEyUJvVMPvj3jtjvxJ3nZaum1v2SQNZNQLCRgV2ylpOdHexG/F9MkuU
         sg2rKZK6UOfhJJYRfSk0Cd1CvuToYrXH0iTu/SJEj2C6VHWpE6406Xp6NZbACCnCmdMt
         h/b9B+3ak1aAtXF75MrRKh0K/s/aKrXgD4I9c+Al+msn6IiESRikHo/D4Ia4c0psuhHp
         Ma8fKQ9YeaJyxh5HZYhkU2ds8rDv6bWOzlmOdVniiXpwDNa+A200EQ4JQwabv2SiA6fu
         0IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784079538; x=1784684338;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbeGLYld02CCONXLbMpcn1oEJP7Cj6rliwiy7C/rsVU=;
        b=f43jWxPgwlkCQPW9FJfhb5WDXooWgCm68joa/ZtdTnA0n6WxLavXeJ6S5Q1zFWz4gq
         wdhgKvjXiJ6yp8k/ImJThXR7UsynTBQq0W5TG5Rjm3YPsXBJp0yue61Z79ThbsCLzu7y
         7SF+9XimznPsAx+T4oySE9r2tfAlwpQvfNGJjKqMPORUwqrg0qAOJ+8u1gPvIlDbIohH
         PSjjxBMUx0mG+18KpgjYaszPPuCLwXkHNRwraVVbuKzcFOJupIU5uzm+26OZJq77Zz/F
         +/vIRNy1CxRKUuUiJl7LoVork2zIMHyLSBqVUj4zCYSxbE4+ook63Q3DMZfziBk1AZC2
         FEVw==
X-Forwarded-Encrypted: i=1; AHgh+Rrnd466TflQn3zHkHsDjrGndGv1Hbee5WMDZBfF2XPKgcsTQv6Mrgzl64lAbORD56PInM6z@lists.linux.dev
X-Gm-Message-State: AOJu0YxnTEHqSSpioHHcGMQVVyFGBy5g3FzKMe4G+mi98AX52nSsUE/M
	goH16j9ZKMXI5aM09u2Rw01Uu/ZtYCzmb1f2A8kaxndOE8b7tEsh0+W9
X-Gm-Gg: AfdE7cmYF8QD2qV1SI5Ez5YTxMqN7W4hTc+mQLswGh62lDZaQp31qHWipAyPTYNM88Z
	9BFzEbEuO55FVXhhXKViPahEzKIHISxr+SUwf6CNEmmjPQYal4F6u8PsA/P9YapD3HOoBiMXlqV
	sv0/ClobvwqKhqgvMC5oZYzCN7Kk2hP92JUWxom5dFCOHeQ6F/MlQIJ/Fzp1ct2rcyz2sBXelWV
	eoIM4OQcQPnl8sQ70k4bg5U7HenrV/GJCuHriZhaSejJ1Bc1yUAW8+X72xysD7dMYwoIEwBbkb2
	9ef7w9+qkpePskHvqlCbdGPxB/UhBgWl12JkyVvpCxfWixFUdZ34V8fvb2KywEm8CQf/UqDAyPq
	k0/ghGwvtoRPC7u8TrzDjulbHYmLRjsWVrYE7woQsLziVGSoYdTz4jG3jUurUiLRAG7XGENsm0z
	dntyo5gom6ONBPWa344Xc=
X-Received: by 2002:a05:6a00:b4f:b0:848:2c6c:dfe3 with SMTP id d2e1a72fcca58-84a557a72acmr4640925b3a.17.1784079537650;
        Tue, 14 Jul 2026 18:38:57 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11080617a12.22.2026.07.14.18.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:38:57 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	usama.arif@linux.dev,
	lance.yang@linux.dev,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 4/4] ntfs: Remove references to page->__folio_index
Date: Wed, 15 Jul 2026 10:38:03 +0900
Message-ID: <20260715-review-matthew-v2-v3-4-3c996b687a5e@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715-review-matthew-v2-v3-0-3c996b687a5e@gmail.com>
References: <20260715-review-matthew-v2-v3-0-3c996b687a5e@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=TV938wPTTx1vq7N5CivmMeKJLnUw2a3r1F1VLwdVUKk=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqVuRvP9UTvRS5uVX1ah9v2gqNS2gsubF2PLPeR
 ORpW5CPeQGJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCalbkbwAKCRA08jD6945I
 0/D8D/wKAYg6NRCGVlCO3z2QWh2+wKwGfReZJgiY1sU2x48N70m3VykK9FF5PJpoQjKMWGmD84i
 0bbE3bQYLsJbMylEbyF3TLQTTVx5WnxojP2xw2kPZWBvLwPUzT26dd6lx8VpFwzmZ/T0LUmQ5r3
 nYmPL/PIXSWYfeVO5EyV4yrXhk6KaGCfXyG+GtrMjwWIe74uKbNOyYuwt9w4OQ8nShaeZG14ld/
 rpxs1ajxh3lGwCepZcfJjbnfB1loN45urxUIzG4WUiomQoGqxe56A4oBjbkKGy5wO81usSqpxwY
 9jZbSRMXB7jYD532TTQCaOpF4s1CswqXtyBSQv250fRv/vWF3VqaHFAJMBcv+K5dvViWW1V5stW
 EGTPtwWf3/Qapho1IpqP9tfbahkNulLDi1ue6SuOWAtLpg3AICzUxujvFIO1OR01oND95gWto3R
 3alXifAJNsegzSFf5jZO+H6pc/mqUKr/jlu4xU729Nm5bNUb2kKWDRYEeNZJl+1jdTug/HxWGuM
 foqLdacpaP7tqZVyqbDymA+clz9e9KOGz8d5gO0PI32mDurf1l5++W8OzB2rz8VQNsccXyIYxPw
 qVWYvKZfcKn7eVZ5s2smIZyy3xZjsZPJAt0Jiel8L1XiJgn42fB8RHXDjlYIW9lBZN1aZc00WLx 8bWJYqzbMOsxoUw==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Pages don't have indexes, folios have indexes.  Correct this in
ntfs_read_compressed_block() and also remove a use of page->mapping
while I'm in here.  Also convert the calls to unlock_page() and
flush_dcache_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index f03fae63c199..d83d3e8e06ae 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -456,14 +456,14 @@ int ntfs_read_compressed_block(struct folio *folio)
 	struct page *page = &folio->page;
 	loff_t i_size;
 	s64 initialized_size;
-	struct address_space *mapping = page->mapping;
+	struct address_space *mapping = folio->mapping;
 	struct ntfs_inode *ni = NTFS_I(mapping->host);
 	struct ntfs_volume *vol = ni->vol;
 	struct super_block *sb = vol->sb;
 	struct runlist_element *rl;
 	unsigned long flags;
 	u8 *cb, *cb_pos, *cb_end;
-	unsigned long offset, index = page->__folio_index;
+	unsigned long offset, index = folio->index;
 	u32 cb_size = ni->itype.compressed.block_size;
 	u64 cb_size_mask = cb_size - 1UL;
 	s64 vcn;
@@ -812,14 +812,16 @@ int ntfs_read_compressed_block(struct folio *folio)
 	for (cur_page = 0; cur_page < max_page; cur_page++) {
 		page = pages[cur_page];
 		if (page) {
+			folio = page_folio(page);
+
 			ntfs_error(vol->sb,
 				"Still have pages left! Terminating them with extreme prejudice.  Inode 0x%llx, page index 0x%lx.",
-				ni->mft_no, page->__folio_index);
-			flush_dcache_page(page);
+				ni->mft_no, folio->index);
+			flush_dcache_folio(folio);
 			kunmap_local(page_address(page));
-			unlock_page(page);
+			folio_unlock(folio);
 			if (cur_page != xpage)
-				put_page(page);
+				folio_put(folio);
 			pages[cur_page] = NULL;
 		}
 	}

-- 
2.43.0

