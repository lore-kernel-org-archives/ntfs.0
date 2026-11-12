Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475960;
	b=xSVfC1ej6XLqlqoPHDC6D/0rExtCC48Hty8MGCNHaXMXhEVBmXG/Z7nrlbXbthuSvA63
	 XgQjLfwccjnbquLRa4RMuOGCH91BIpK5vE4c46E3uYVih5Q2En99C/qDgbxOJ1qowUs8a
	 gAOL4HDRLHHKOIvvESMuUFHYsSXxpy0avYwSR4k9zLB8Zh1dAK7rqW/5kLeCfBd/fZ4p/
	 SybO+ZRbkG+EvOT4TKGTdwQ2lDQjAM2T3IxLcrDtwbI8qr529FdTHmiCKm+DN23dkBdEm
	 HmgTPC1ovmeO6VKxUmNEuDmQjfVBt414q+9EsjGnYlxSB0n6JVrl8ZfUnUvf7zjra+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/ULzW8QvK/EALUnGSLdjbhj8msZl7UoNbmnKkjE1SLk=;
	b=fb+tNFHNuqjqoxmDvp28gtxp6l9RwREzB7G2lJ4NXGxxgJqPNr3sO9vF68X7K6ifSuar
	 guWg0p5794LdfyS0QEjeQxNQ7RaXfjwtZnzeJR/DACkvq9uvgac/dIJy1kTLwXlm0JJkm
	 mwoODBWtFyikVpLqWgfBS9UsfJDqaQu+axejv0+1mpJHdKESHEKgIMZN8byBF3QJ9Avpa
	 zGBaDBd9bD6+LsxG3XfAE0F4zkHFtGTbwfQdC1LgBol8tcn0N7u5Ckmgbe9qbz817HwRk
	 NdwZyPNJcM2skxnrO5zDablwLWXP3NJcZN7yFOxfj8+ucHb4dNzUcDPjzuhlzMhBGgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIEmMQB3;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B87606A32A
	for <ntfs@lists.linux.dev>; Thu, 12 Nov 2026 09:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B87606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIEmMQB3
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8652399eec.0
        for <ntfs@lists.linux.dev>; Thu, 12 Nov 2026 01:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794475959; x=1795080759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ULzW8QvK/EALUnGSLdjbhj8msZl7UoNbmnKkjE1SLk=;
        b=RIEmMQB3meqkTnll/9SWSgSznkpOwFls9CpT8tLvvOnU206gQOGRN7g8seSB6duz1u
         gXVCaqOK3rHSH1JsYztUkUpgtg8JjPKqLwsIjQCYxvNmnEf+IO704Kb86KgBnPgwEszj
         4NGwl/B2sN8LEJhvLdtQCk8uIgi41fUXBaldMWDiSPNAxZ4PGvXlWfac5KCDEecpZ2Ql
         b3iknH6AHfQijQ4AsWGXqxTNbg7vtrVYWcPZJVf/WLLnk0Y2tPgHHxQV622lDfScZJM3
         1oGS5/UCEvwsG2uCjLmP10gXz081aZIptkxYlrM0BInAw4oJROsef2GuU//JcXrgrTAt
         YIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475959; x=1795080759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ULzW8QvK/EALUnGSLdjbhj8msZl7UoNbmnKkjE1SLk=;
        b=uWS5UVZIfI5aRKpK4BCjeKGqdZ3VfEDmnkoQjaEslBn9KnkZ/ERtlvlgdih4vJFi/8
         eKn6dUh+1qluQ/NfY0nl1ph8iyCK7O1/qhLkMPNlP3GdYUalXguRMKvvCP09WZ/iWiZl
         oJVcpNZ7XuLCR8BKR7JDs2JC+0BKP9FXDtbRt6Rf86z3LtIFl6UXtJLyCNxvbPlSuuy/
         8r5/oOe7yRejHRViiJiNpE/utNsmOTKz7HmzSuJAYWYeJGEFcbyhZACAmzd0eN1QrIhc
         ukUXagIZNWh/VEZwVBuEW74j+lzRnFvhIPuMIQGy8Xfg+GLNTXDMELCvpf20Kgy5DvVj
         44zA==
X-Forwarded-Encrypted: i=1; AL+hErETw1vkhFBbmhowB6r5h5EzD3e1BQroVuzIPKHl1IVqBpY/kC3LtAUffRzUC8ikm8MPzRvu@lists.linux.dev
X-Gm-Message-State: APuU4Z98b5XSs2lkfvkatYunfndVjiqdAEnKUL4PkdrUpGN9V8M/zNJs
	mNSWo+Jaj2nLPYVa4w4LB2fNdT6kWZAs4YOeraXYKAeL0qiOaFf6rTWI
X-Gm-Gg: AYBFou2Pnvl66vZK7bDfpaA9Lv955hcoE/ktSCX0d5kFSh7C1b5a85p/fHsqVTnKCsD
	7ExpteUan499mGA1mwlw3PWJ0dz7D3zwzlHYm33/rscMK7Srp3Z16zZirtQ+2GgHIhjG0EXWWzX
	FTCjBryhgIpBjiziq/CQJV51MYv2nhPqWSLTxvfK5xRctedkGxAHOzN+V5vl/pemSqywIi2aoiD
	LamhGKfRNjNM2T7TIJgaLDB7U+5xMniabBUAEkZdfKVX56gKIB35VRDibNDScO4llsQ9sSZGo/j
	2cDo50VlL888m/2S4evl36b1j1hDTGVfxFthhgFkPTZqBEZlGgAkG5Se2jFLGBXpQpohMYGLLUR
	7Lzy81LZlHe32pGtutxOMvfmP2QIQ4P4gtbMqqbmCZzdxD3gb3/Q0n9HsUmQZhHBZHX5F9x6rCm
	iU2h1r6Kq4Nip45Cf8oZ2uAmAyge+SRHVR+3O6pb7NVaMPgikzfDc/tDfGfxd2BuUZQZIG5/WhU
	qYez5EUCRA+mnP47wHODJCu767wsrusBAr2rxyQTcQhw/ixfjQXusr4WgLn4ffVYpQiuWJKS1YR
	BRmCQBEDhggybNp+dP/Eiqyx5KAulmVWNyWwf9kUGQnKV3XYb1lQt3W+TL6Q7+R7LFU=
X-Received: by 2002:a05:7300:1899:b0:376:b957:c01 with SMTP id 5a478bee46e88-376b9570fd3mr6726823eec.16.1794475959004;
        Thu, 12 Nov 2026 01:32:39 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm45498133eec.18.2026.11.12.01.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:32:38 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: liubaolin12138@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH v3] ntfs: trim the sizes after a short write
Date: Thu, 12 Nov 2026 17:32:33 +0800
Message-ID: <20261112093233.1118469-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_file_write_iter() moves the data size and, for a non-resident
uncompressed file, the initialized size to pos + count before the copy.
__ntfs_extend_initialized_size() only zeroes [old initialized size, pos),
so the range [pos, pos + count) is initialized only by the copy itself.
When iomap_file_buffered_write() copies less than count, it returns a
positive short count and the error rollback at out: does not run.  The
file keeps the size pos + count, and [pos + ret, pos + count) reads back
whatever the freed clusters held before, also after a remount.  A local
user can read the old contents of freed clusters this way.

Run the existing rollback for a short write as well, and roll the two
sizes back to the end of what was written instead of to the old sizes.
A short copy that ends inside a block can also leave the rest of that
block, and of the block holding pos + count, cached as read from disk,
so clear the page cache from the new initialized size to EOF before
shrinking it.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v3: clear the cache up to EOF, not up to the extended initialized
size, which left the rest of the block holding pos + count (Baolin).
v2: also clear the cached tail of the last block, which v1 left in
place when the write stayed inside the old data size (Baolin).

v2: https://lore.kernel.org/all/20261112030815.982026-1-zhanxusheng1024@gmail.com/
v1: https://lore.kernel.org/all/20261111093459.660484-1-zhanxusheng1024@gmail.com/

Tested in a VM on ntfs-next b025f526c5d0, with all free space filled
with a known pattern first.  Short buffered writes of 4M, old data
readable after drop_caches and after remount, 3 runs each:

                                    unfixed    v1     v2     v3
  fallocated, ends block-aligned    3137536    0      0      0
  fallocated, ends inside a block   3141332    212    0      0
  fallocated, unaligned start       3137536    412    0      0
  same, pos + count in that page    -          -      436    0
  append                            3137536    0      0      0

A short write 1M past EOF, O_DIRECT, resident and compressed files and
full writes give the same results with v3 as with v1.
---
 fs/ntfs/file.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3213a0c9f96b..aa58afd729d0 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -928,10 +928,21 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ret = iomap_file_buffered_write(iocb, from, &ntfs_write_iomap_ops,
 				&ntfs_iomap_folio_ops, NULL);
 out:
-	if (ret < 0 && ret != -EIOCBQUEUED) {
+	/*
+	 * Both sizes were moved to end before the copy, so a short write,
+	 * like a failed one, must take back what it did not write.
+	 */
+	if (ret < count && ret != -EIOCBQUEUED) {
+		loff_t new_init_size = old_init_size;
+		loff_t new_data_size = old_data_size;
 		int init_err = 0;
 		int data_err = 0;
 
+		if (ret > 0) {
+			new_init_size = max(old_init_size, pos + ret);
+			new_data_size = max(old_data_size, pos + ret);
+		}
+
 		/*
 		 * Like ntfs_setattr_size(): __ntfs_attr_truncate_vfs()
 		 * expects the invalidate lock held across the size
@@ -940,13 +951,23 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		filemap_invalidate_lock(vi->i_mapping);
 
 		/* ntfs_attr_set_initialized_size() rejects a resident one. */
-		if (ni->initialized_size != old_init_size &&
+		if (ni->initialized_size != new_init_size &&
 		    NInoNonResident(ni)) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
+			/*
+			 * A short copy can leave the rest of a block read
+			 * from disk in the cache, also past the temporarily
+			 * extended initialized size.  Clear everything that
+			 * is no longer initialized, as
+			 * __ntfs_extend_initialized_size() does.
+			 */
+			truncate_pagecache_range(vi, new_init_size,
+					max_t(loff_t, i_size_read(vi),
+					      ni->initialized_size) - 1);
 			mutex_lock(&mrec_ni->mrec_lock);
 			init_err = ntfs_attr_set_initialized_size(ni,
-					old_init_size);
+					new_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 		/*
@@ -955,13 +976,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 * the uninitialized tail, so skip it unless the rollback
 		 * above restored that size.
 		 */
-		if (ni->data_size != old_data_size && !init_err) {
+		if (ni->data_size != new_data_size && !init_err) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
-			truncate_setsize(vi, old_data_size);
+			truncate_setsize(vi, new_data_size);
 			mutex_lock(&mrec_ni->mrec_lock);
-			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
-					old_data_size);
+			data_err = __ntfs_attr_truncate_vfs(ni, new_data_size,
+					new_data_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 			/* Like ntfs_setattr_size(): stay on the durable size. */
 			if (data_err)

base-commit: b025f526c5d04929212c9d5fb7ffc96608f3eacc
-- 
2.43.0

