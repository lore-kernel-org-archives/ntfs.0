Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820288;
	b=l8Ho+xffbKLHS6eknCpvlp40qAS2eNyUsrfz4EU5f6z+JoSANgGzuuuWOOMHzCRPgmMj
	 buDkFP0VG6ayxPoEcH84YTeaTrJ0q4tPlBDSfYZudNOFpzNS2UKNlpiacGPI5A/bo99vq
	 T7sxW6PazHxY4c99x6bJaWCsLtAR+mIUJylzQJVwAoy0/gGbwNnL+wnMR+fu/cYUkUb5j
	 6H2GOTiV0vi3I6NUZPp3ZVs8DKzF0swMNkDPvLXEAnbp2m9ecgXGI3iFDPrIgrtDW+iF0
	 Iyd4Ewdj5HHl8Rcq92KZii3XfauDb11D62A/IEw19TRN/3wuaB6x3vi/+Csv+LszZqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QuJg4mFjV8o+bewKGTUYwBsLOBBN5sR9GT1t3zfRmcE=;
	b=nKF/pUfb77cr2Kfug4rm2EhW7i5bV+vqBMXHk5neJ8JID00YHZ5xsp6INBZnKtIJnvQz
	 QOIyw5aThgJRAJ0hdduian5+8AcMgXd18DNCp8/Y+VRCL/9qPrPpzo/cJbLkVnlHnR+ZU
	 911O1xCi9codU1KT2Ix0zsyRz+l4xXLiLpxTUDwKrr0Oa6eCGN0DkHIVyC4N5GXUq6kZo
	 EGMBrGVRbDlAlbUXdggzmKZRhXdFw+pIbQaZji94USYmZAnOCpbMLBIZO3zs9PqxuKheP
	 2UdlZdRE/Bfk9QunmMcSuTTtcydsEMar8afksCnlPzxoVMwxz1LG8xSOvHq3Cu6HGfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ioTmaOpk;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E492606A329
	for <ntfs@lists.linux.dev>; Mon, 16 Nov 2026 09:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E492606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ioTmaOpk
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e946155442so35389825ad.3
        for <ntfs@lists.linux.dev>; Mon, 16 Nov 2026 01:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794820287; x=1795425087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QuJg4mFjV8o+bewKGTUYwBsLOBBN5sR9GT1t3zfRmcE=;
        b=ioTmaOpkUcH8BqYD6+s/VEWqFk7S5VukUwRr3SegTQ8F4MbbUiBZVoYDP6iReHXwIz
         5HpIpJH3rCQvsTKbXeDmlrbvZgQeAmcvgW3UGpKuZANzzpHTDSZ6uK1w5m/2cXATo+Z7
         uCFyC15abYITQQfotlgh8XgUUWXEnjS20LE5UWG6GfrnJ+kEGSuABiI+ycwzXCRVtb+a
         RA3QSOsxCi98jevKeTFkKsXeAz3LLkDOc5i1yZl4/2CVuz4MGD7REYINahnZe0J+xL9j
         1mYMWtYVHxf/NcLYeFtRyrOC7/IghHtvzl5JxvqSAIhlRi0m0mcVaNj4sAT0Y13WRWJh
         +Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820287; x=1795425087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuJg4mFjV8o+bewKGTUYwBsLOBBN5sR9GT1t3zfRmcE=;
        b=maCfsVgPEqxMLicee/MWQFp5DpQolcCdwLMl+YSGExeHG5OuD9l0vKd4Pbnpl85QLa
         BE0KUMuF8T+rjY+QOLct72UQwfi6/HY0bqV1HYjo42hMQGyYudSKfJ2BM39XM9/Qj02D
         6MRMSbzbbzmwoGsWLmALLWMbGFIPqviCy9oC26uu1/qnCFwtD/EqqEF/TS8v8Whjd/oV
         X+TyiwjfH/9i+Q5qe0x0dn+mYVl4U3dGi3foupYuGYI0KHArttSquW/h6QxuExirmcfr
         4QrTvsn11b7IoG1RYjRp39pZlZZI1ttVNZb35DY/ZXrk+MxZ/imDDm8DOU/1jRqh714K
         5WCg==
X-Forwarded-Encrypted: i=1; AL+hErGMT4QKSLBpMvSq65ww43ZeDi8Xro2VUaUpjnr1Kfws/lhkuwwZdAL5xVe7w9NWVzvY9eVR@lists.linux.dev
X-Gm-Message-State: APuU4Z9mKfVbpdPeMH7SDKTN/bDblAdo+C2OMHvUnDOudJh1bnlNPS45
	qtaJcSsqHFWDKwijLtAhFsKqPrwUV/zNZKu1awfRZkC2m2y+8wfnALno
X-Gm-Gg: AZFdTZc/ORaF3vcbUaFHZQSoq1IfJnckYO8//Ague+DjxoTIU389SlcmWdcK/Mjnaj3
	J0yLhi5nxpUeGMCzqHE+MRX82kKhRu2PPKBhkOTa31wB02EMSNiesHgGuCXXr8hWtJIGwY+Nil7
	scoVj5iocL7TJs86+/K8vt+Q43j6K0eH0BQVq3t4oH1feXZHcu0XCsNQ4G43gDZcGplUedRwZF9
	9ES+xRZpP16jIgYDqJHK5pGJgaY1/5zo3JTDpHl6vnhExGSkJrY73fLWSudLKCxoE1e/Y7QH7uu
	mi6FraeoA3kVpzLeEWe/2vJgEeBEI1MQ6VaBTUl4N6RDqv4oKo2RwHMid6uECe9WwORi6D5DVfb
	Chlw/QMeYRjE1YpwlWvyXz61+h0HzHfMznF0hE0SnkGtKsvmf1paoADeAygDUsyhAbRN7k0w0Pa
	nlVbr1lIuDwjVpnqp+DrS4l91CWFgO8sATTP2OETU5vX8d24H5HSChSIap/hqRuGDNZ+6ZP8k/H
	OVgfiQfW5blDhtVA/KeSxYwddYYKToySIC8dpLd673o86moeYuLvSCzD4tlgCCNEeMVuaehJhPn
	JjinudjQWXaZAS5NYpC0tsM6TVawNQ09wYNWSE59ujpj9A==
X-Received: by 2002:a17:90b:2803:b0:3ab:be66:ddbe with SMTP id 98e67ed59e1d1-3b1b0ba1693mr10019691a91.28.1794820287377;
        Mon, 16 Nov 2026 01:11:27 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76f95sm15336398a91.17.2026.11.16.01.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:11:26 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: liubaolin12138@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v5] ntfs: trim the sizes after a short write
Date: Mon, 16 Nov 2026 17:11:21 +0800
Message-ID: <20261116091121.2547497-1-zhanxusheng1024@gmail.com>
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

Run the existing rollback for a short write as well, and roll the data
size back to the end of what was written.  Keep the initialized size,
as a page fault through a shared mapping may rely on it while the write
is stalled on its source, and zero what the write did not reach, up to
the end of the block holding pos + count.  Only if that fails, take the
initialized size back to where the zeroing started.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v5 (Baolin):
- start the zeroing at pos, not at the old initialized size, which
  overwrote data stored through a shared mapping below pos
- do the same for a direct write, instead of truncating the page cache
  and taking the initialized size back
- if the zeroing fails, take the initialized size back to where it
  started, instead of skipping both rollbacks
v4: for a buffered write, zero the unwritten range instead of
truncating the page cache and taking the initialized size back, which
dropped data stored through a shared mapping during the copy (Baolin).
v3: clear the cache up to EOF, not up to the extended initialized
size, which left the rest of the block holding pos + count (Baolin).
v2: also clear the cached tail of the last block, which v1 left in
place when the write stayed inside the old data size (Baolin).

v4: https://lore.kernel.org/all/20261113050148.1466682-1-zhanxusheng1024@gmail.com/
v3: https://lore.kernel.org/all/20261112093233.1118469-1-zhanxusheng1024@gmail.com/
v2: https://lore.kernel.org/all/20261112030815.982026-1-zhanxusheng1024@gmail.com/
v1: https://lore.kernel.org/all/20261111093459.660484-1-zhanxusheng1024@gmail.com/

Tested in a VM on ntfs-next b025f526c5d0, with all free space filled
with a known pattern first.  Short buffered writes of 4M, old data
readable after drop_caches and after remount, 3 runs each:

                                    unfixed    v4     v5
  fallocated, ends block-aligned    3137536    0      0
  fallocated, ends inside a block   3141332    0      0
  fallocated, unaligned start       3137536    0      0
  same, pos + count in that page    -          0      0
  append                            3137536    0      0

Marker stored through a shared mapping at 64K while pwritev() is
stalled on a userfaultfd source page, state after remount, with and
without fallocate():

                                          unfixed  v4     v5
  buffered 4K at 128K, EFAULT             lost     lost   kept
  O_DIRECT 12K at 0, EFAULT               lost     lost   kept
  buffered 12K at 0, short 8192 (v3)      kept     kept   kept

A store into [pos + ret, pos + count) itself during the write is
zeroed, as that range belongs to the write.  With iomap_zero_range()
failing (injected -ENOMEM), a 32K write to a 16K file that returns
12288 leaves the size at 28K with no old data, also after remount.
fsx (buffered, no-mmap, O_DIRECT and mixed), compressed files,
fallocate, insert/collapse range and punch hole give the same results
with v5 as with v4.
---
 fs/ntfs/file.c | 69 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3213a0c9f96b..83e424a25a48 100644
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
@@ -939,14 +950,58 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 */
 		filemap_invalidate_lock(vi->i_mapping);
 
+		/*
+		 * A page fault through a shared mapping may have used the
+		 * extended initialized size while the write was stalled on
+		 * its source, so keep that size and zero what the write did
+		 * not reach instead.  [old_init_size, pos) was zeroed before
+		 * the write.  Past end, zero the rest of the block that a
+		 * buffered copy may have read from disk, unless such a fault
+		 * already moved the initialized size past end and zeroed it.
+		 */
+		if (NInoNonResident(ni) && !NInoCompressed(ni) &&
+		    ni->initialized_size > new_init_size) {
+			loff_t zstart = max(pos, new_init_size);
+			loff_t zend = ni->initialized_size > end ? end :
+				      round_up(end, i_blocksize(vi));
+			int err = 0;
+
+			zend = min(zend, new_data_size);
+			if (zend > zstart) {
+				err = iomap_zero_range(vi, zstart,
+						zend - zstart, NULL,
+						&ntfs_seek_iomap_ops,
+						&ntfs_iomap_folio_ops, NULL);
+				/* A direct read must not see the old blocks. */
+				if (!err && iocb->ki_flags & IOCB_DIRECT)
+					err = filemap_write_and_wait_range(
+						vi->i_mapping, zstart, zend - 1);
+			}
+			if (!err)
+				new_init_size = min(ni->initialized_size,
+						    new_data_size);
+			else
+				new_init_size = min(zstart, new_data_size);
+		}
+
 		/* ntfs_attr_set_initialized_size() rejects a resident one. */
-		if (ni->initialized_size != old_init_size &&
+		if (ni->initialized_size != new_init_size &&
 		    NInoNonResident(ni)) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
+			/*
+			 * Only reached when the zeroing above failed or did
+			 * not apply.  Drop what was cached past the new
+			 * initialized size, as __ntfs_extend_initialized_size()
+			 * does.
+			 */
+			if (ni->initialized_size > new_init_size)
+				truncate_pagecache_range(vi, new_init_size,
+						max_t(loff_t, i_size_read(vi),
+						      ni->initialized_size) - 1);
 			mutex_lock(&mrec_ni->mrec_lock);
 			init_err = ntfs_attr_set_initialized_size(ni,
-					old_init_size);
+					new_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 		/*
@@ -955,13 +1010,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
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

