Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979794;
	b=k68M9XZASHZ6grsYUcC+Bc2ASTOz6q5UeWY70RmasmZSpOvLmpcRFuJTcsVY8CjRncON
	 G3kLz+I+fjABH1oN26RkP/URfEC/pUchnE06UF3CCLInnkIKCpDufgfPN11uqD9qvkrge
	 ONNrPyjsoKq9VWQ9c9zc9eds7GI4nZ6XRYLkAatwqCuXx9dxTsJynfZsCvZPH23omKbJC
	 OZlN+KTSC+UbkJyvJGtZz3NwnFTosyVLVwAnLTuCewt1pST/5Ax0GGLpdEdts7K0wIk6c
	 Dm9zArRwSeOUjKzX1K26nxcNcWJVMDhBPBsa6a4uWuLLIISK4fyEgmKk0SfGmyq0fpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FmarotRNBTJapESQa6reZSmrXE0VRisYQBm/EcrfnMU=;
	b=1E+wMdB3lgrBKAAsFUCiNz+LL9o2Oox+wYWMxZ51/NsgxycXVN7psxIzjduiS1uWQq4t
	 fV8+R6GTqVlTfHr1sz3/uGmJdTB+qjEXauHRWJPSPJR0xse/nt1XErJ7P+aWVUChOAO/V
	 lSYhQVw5q1X6q57+Dgl2Xnyk1RlOjYTYKoQ5a9fsOtzaxlwsPptWyW9WEGJZEbTK14BNx
	 v9rEkk7JVGB9U7U3ExH7Ytn6d9sAw6Rr3PBV5vozKAt74NVsXMnwxsR8+WF7A0mik3sk6
	 LaIhDO/c97J5ZCHuPvzn6IOiG/kjdEHcA8SBwA2TrxjpEuJgyauofj77KNPXjsMmNpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rIR4nyq1;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B935606A31D
	for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 01:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B935606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rIR4nyq1
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so1241884a91.1
        for <ntfs@lists.linux.dev>; Sun, 25 Oct 2026 18:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979793; x=1793584593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmarotRNBTJapESQa6reZSmrXE0VRisYQBm/EcrfnMU=;
        b=rIR4nyq1gfJnVfBjWWaLhiUQaTQF5jBW/+ljp2P0Ir4ruROZXQtJdxLz2Tagpp67HJ
         S/jUjd34HgBLopekjny47IjzfazVR2/k1Gve//QaEEoHV2YVvbVP6BmpO5cGrayv4RF5
         gVqlCwBuff+aPujARM9ByiTGmvYA+SfT9UEjbZ5pWs4kBPcf4LfzRadB28Is1f8oFTLf
         oiIXBCOg6INNfBCOIMEmSvc1OG//L1i5EOFTbJ04CPEAbIk51Cr5R7tTSWJNArzB9BF1
         Wbmn+2I5T2JxzKRu+4UNyoRDrGGlczwsmALtKVuf58z+bkuvMOGHnqHLakD98DbsMKPV
         R0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979793; x=1793584593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FmarotRNBTJapESQa6reZSmrXE0VRisYQBm/EcrfnMU=;
        b=1nvMH8YG4B5W7JWu23B2FVZ+Y6hU9H8LLIOJXRVjMc2vU2oja3Hutv57TNlj2IZTLc
         zU6uf6UepFewtt7LSX0f0pK0JJH62OdTHCQKOIgAMNpqIcNG8NNNTHQ3dlR3jqIEuZED
         cK8AaYkIpcftDdNO+P9UMU0/ONVlsH0ju4OSmFBb11FqTDpP81Abtyjd/Nre2OQCUqpD
         IEbPlo64ymveWHwAu0MmHlA0Jftvy750Iw2nKyzZtRktHvbHJz08VZTASWoFBGer4gG0
         PeIN22qgZ30qf0cnGoHX5Gd0B4xz+1Idx9oWpIbxZq3VgKeFezpKrAY6qePifS4x2d4K
         Rmaw==
X-Forwarded-Encrypted: i=1; AKwUvByRvXlIjllA4DHatsl4kJjeKBPxeLnOnMQcQg5HEYaiEdOLXW1NEy26teT8wFr86ZeXIW5J@lists.linux.dev
X-Gm-Message-State: AFq9FYIl2kjTfP5JpQfBiIlb338ej8a5TJv8KOLJcxwwnVBsABQlQm5A
	74ztjPpTaUAevXkHA2K++mod5mgVDrL9Kk6bqmsb2mqYsMkjzInY0+F/
X-Gm-Gg: AYBFou2bh5cG8eyYIX74EcumXZnHZ29VqPToztAEvY/n5FwgCehnTaHHWhRjnq+XBTk
	PlOELlDzBHnfiXVDcDO9aCoUl/0bf0xSyBdJF1G+CjMfJUj/RsNzYy+f+KikR6NcHcVayK2OI8j
	juwQBK64AffFlLl3mVe7xhyn1CCwPQkEUKJCHyUawq1RprFhL65UJlUXxolEtIzqT8/r2FZ/IVQ
	mDPqDyG+CK22hKRWcp2UO7UsscX84x9ALPAiEj2tr2E0n1N/x8m1iELkxivXY+RqxB5jk9r2yFW
	uvAZUdsCbfcae1D015zRVb9aeK3xL+rgTezlm66oYnH+gKWki3WGQgb47IyuUDr5LQ5l7OktVjG
	7KkHLPjtcm+pLTjHc3EA/xEuInYGPu74eEUio55QhVvVy4mUV4KCT29GDWxGdaniKr/irIgcPug
	bASk+Wu76jyG3MAD/w8V3MRzduUNxGqccWDApKS3/v9WYqWbPYs1Ag7N39B+sN5sVr1EAp0poWn
	M0aJ8X+WRcvoKtVQxxwZgpthhqro2tuJQWf31QDD4VDQdPctcmFyagSvBQetA==
X-Received: by 2002:a17:90b:3a48:b0:3ad:6ec8:35cf with SMTP id 98e67ed59e1d1-3adeae70722mr4713682a91.51.1792979793060;
        Sun, 25 Oct 2026 18:56:33 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb8240b5sm5115612a91.0.2026.10.25.18.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:56:32 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	liubaolin@kylinos.cn,
	zenghongling@kylinos.cn,
	ntfs@lists.linux.dev
Subject: [PATCH 7.2.y 2/2] ntfs: take invalidate_lock in ntfs_filemap_page_mkwrite()
Date: Mon, 26 Oct 2026 10:55:33 +0900
Message-ID: <20261026015533.1124816-2-hyc.lee@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026015533.1124816-1-hyc.lee@gmail.com>
References: <2026102240-impending-elusive-74a7@gregkh>
 <20261026015533.1124816-1-hyc.lee@gmail.com>
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

[ Upstream commit 0fecc393f2060e6bc25138df32cb923ec7071c6b ]

ntfs_filemap_page_mkwrite() calls iomap_page_mkwrite() without holding
mapping->invalidate_lock, so a concurrent truncate or fallocate can be in
the middle of invalidating pagecache and rewriting the runlist while the write
fault maps blocks and dirties the folio. This races with ntfs_attr_fallocate(),
which merges clusters into the in-memory runlist, drops the runlist lock, and
only afterwards zeroes the newly allocated clusters on disk; and with the
punch-hole/insert/collapse paths that free clusters after truncating the cache.

Per Documentation/filesystems/locking.rst, ->page_mkwrite() must ensure there
are no truncate/invalidate races, "usually mapping->invalidate_lock is suitable
for proper serialization". xfs takes its mmaplock (= the invalidate_lock
rwsem) shared in exactly this path.

Take invalidate_lock shared around iomap_page_mkwrite(). The read-only fault
path is already covered because filemap_fault() itself grabs invalidate_lock
shared on instantiation/read paths; only page_mkwrite was bypassing it in this
driver.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Cc: stable@vger.kernel.org
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Co-developed-by: Namjae Jeon <linkinjeon@kernel.org>
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/file.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 317bb249150f..8515560e2a4b 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -620,12 +620,20 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 static vm_fault_t ntfs_filemap_page_mkwrite(struct vm_fault *vmf)
 {
 	struct inode *inode = file_inode(vmf->vma->vm_file);
+	struct address_space *mapping = inode->i_mapping;
 	vm_fault_t ret;
 
 	sb_start_pagefault(inode->i_sb);
 	file_update_time(vmf->vma->vm_file);
 
+	/*
+	 * Serialize against truncate/fallocate which hold the lock
+	 * exclusively while invalidating pagecache and changing extents.
+	 */
+	filemap_invalidate_lock_shared(mapping);
 	ret = iomap_page_mkwrite(vmf, &ntfs_page_mkwrite_iomap_ops, NULL);
+	filemap_invalidate_unlock_shared(mapping);
+
 	sb_end_pagefault(inode->i_sb);
 	return ret;
 }
@@ -1119,13 +1127,13 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 
 	err = file_modified(file);
 out:
+	if (!err && mode == 0 && NInoNonResident(ni) &&
+	    offset > old_size) {
+		truncate_pagecache(vi, old_size);
+		pagecache_isize_extended(vi, old_size, offset);
+	}
 	filemap_invalidate_unlock(vi->i_mapping);
 	if (!err) {
-		if (mode == 0 && NInoNonResident(ni) &&
-		    offset > old_size) {
-			truncate_pagecache(vi, old_size);
-			pagecache_isize_extended(vi, old_size, offset);
-		}
 		NInoSetFileNameDirty(ni);
 		inode_set_mtime_to_ts(vi, inode_set_ctime_current(vi));
 		mark_inode_dirty(vi);
-- 
2.43.0

