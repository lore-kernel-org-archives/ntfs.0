Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546115;
	b=wcx4IEr0nCJ4LaTbmnGc7S237yOUBgS/36SYhQviTRXyOC2af870z4EEPB43maZMrPhv
	 WhYVq0QzFOyxuR6R+7Yv6+rytpOquOehPXNq70CH4Fn4w+f1SqQ99Ih2rL5YbsuUQsbRL
	 dIOJ/in9gzmElQMBdfYmh2BBIuB2TogbJB12k74kXgsfcf6gkbSq/XrdJYivWrmzB2AHa
	 J4NcxW6Qq5pR5dngY6wafzata+wHmDZql8zlml52/sRCL1sduwFNctqvyzzk4hYHVo1g4
	 Hz4E27Bumpm1XMnKM7YsQDhqNhm0yze0eUOH8b4E2dQpIPYM4UHwORjLbgxuSJP6iyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ymo7yRI3qo02ZHVhmUVN7yVG+3FBZDE8ll04DLo8nJw=;
	b=Ge2iKh8jkoDphGScij/0FlOrfrD5FMuRKCMpClUL5bHs0vw8FFOvlUNzNZnZQDj/XlWU
	 SBE/SPL8XjC5QFV6ZL/PNMCGWLcWl04AvChMuVlSVc2k4Xntpmt19ZkHBf4M6+kK8SpWK
	 3+rUdFJltB1gBHCgQFRV6aS+/yvoshIF6rY1btvGYygxmq/PrEonMD+G0w8txGp4t3cpJ
	 FEfszQCS1JHI6/ozntoKjcnDc+x2JiS9vHwBIwao8+PQGVTjg5aLQMauqkW51+FXxHICj
	 zFdVbIiCN9htDYseo3qoZznlfYoWDvRNSFadXR1r0SGUS42/DS7l11GeGJiKd5A++jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TfUChhvC;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC2606A31C
	for <ntfs@lists.linux.dev>; Fri, 13 Nov 2026 05:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EC2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TfUChhvC
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3791619605cso1266578eec.0
        for <ntfs@lists.linux.dev>; Thu, 12 Nov 2026 21:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546114; x=1795150914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ymo7yRI3qo02ZHVhmUVN7yVG+3FBZDE8ll04DLo8nJw=;
        b=TfUChhvCBSyuCJsHdZRH9DObeLSNLi50kZglqJ6R4qXx+QldkDaitOpRkEsKD9G8fZ
         s1Wt5OXq1DwoaYhj19nPCUkC+nZ0eP5sUH/N5BnBv9J7lUv8zj4nFP2u2cYW43X8td+n
         NrqEMhQ3Q8CWkBbSJNeru9YUNwtqdZhuyqCN0wbp9jl5aX2lafqdosLTKiCFHRcjBOyi
         nt6IL1WxzkTC+GtCl3YfWRTj22Zr2ITQ8i03Z+jMFOKwGAthtvhUUcxAcoFnZOCdeZOn
         c3G8yzIJKwMkHpmhDNsdP0YJ1atx2JZxADtwPD0GlDbBWX7AzA9fabNkZGcwl50tA8QL
         kNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546114; x=1795150914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ymo7yRI3qo02ZHVhmUVN7yVG+3FBZDE8ll04DLo8nJw=;
        b=DoHi5Rpeb0DM4q6kFLxUa7djzH/5oZ2HdbRsraG39D6DYmvivrMifcYAgjBbj2IuWp
         +1+walTeXvhlj5kt89WWlbq7sX7oFhJvfTIkQwDnoJ1dxGLWRif00OLkooAB5MUng4Re
         jRqn5Z+OJ5vIYU/HW27EXa0dTufNU7SlAT+cngUatAOeBA46sVA+l6K2ufkwaFCFakLe
         ZvIBHIGwj0oPJyGK7r3/Z5WyoyYZAf13WkbB3qY6Ffmw+Rp+HYQ0dZlrUZXFnmraxKU/
         I2ivjQ1g+5OTkbNbhTsW9xwRH4W/YtAD6g/DKjtvdTni+5RrzmRzUo9+OfL+gO9WTGaQ
         eiNw==
X-Forwarded-Encrypted: i=1; AL+hErEdlYFa2IPZg/3CytKpnLgSEr2EReW8JxsDOXUusrjssTMN5oku/KkBFId9EsufgrHqoITv@lists.linux.dev
X-Gm-Message-State: APuU4Z/GAoi+9oHWOvA09YbbnsRrBII9Wd3Dbfjx9Hik8J9oI5Zzys9M
	qTZ5+PZNsKlUNR7/A9zKf7x69YVOpWkXbigr4VIrLliy6OqJSXx825DE
X-Gm-Gg: AYBFou3voQXH1TyR20L+W4VZxbe4SnyXPOSZdk+RvnVLXl/pSFTXr6/jt4gsdZBxZJu
	TPgmeSTDIK8UKwQJXePhSxiHDYJm3I8gpAh4rq0bj22Ya3GIsuH2ZRTvF9w9rmaO0Gr9HjpLixM
	hU5cF6nLlEmD/l4M9OK5+TuJvvvM2PgJc0Ggqicya5jvXWTTzCNzBMVXBngo50ATPaPt5m4NH/K
	v1HhMDpyGlx/mtPo64FIo1kIK3PoLtG5p9JOKT1BjBfqxaBQPhNm01F0AIt8cXBLsrKpNP3BNvc
	36aagy/BnM9hyOQ2+IYhssB9Fe9PHvWVUQxLus23lym0jlrjN1QCFWhYCe5IHpmTLiTcYrGbpQV
	At5u73iPOtz5Yt/3E9C8CX+N0n8e4ZJhLZL1zB4JRy8lnsmG5OkhzGjifMu3hzCyTWbpz3+Cn9R
	LYt7RMIyp79PtLs8yYk0h+4r0yQfPM877rB1vQYb904QfdHYiF04uRbEIFqoglOrL2DI5Hn0NGr
	baJFT4TB5DB7r5iA9R6fW7PiIFKcOPOIPq5LTACmSS1HCQIsoGVJwS33AfEQKRd1a2bLoLvqPr1
	kh0Qy/d2lqE38H2COxGsjhgfd18n4a+X49rSx+mBFQojeA==
X-Received: by 2002:a05:693c:87d7:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-37967125e78mr1109039eec.30.1794546113573;
        Thu, 12 Nov 2026 21:01:53 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm3157060eec.22.2026.11.12.21.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:01:52 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: liubaolin12138@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v4] ntfs: trim the sizes after a short write
Date: Fri, 13 Nov 2026 13:01:47 +0800
Message-ID: <20261113050148.1466682-1-zhanxusheng1024@gmail.com>
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
size back to the end of what was written.  For a buffered write, keep
the initialized size and zero what the copy did not reach, up to the
end of the block holding pos + count, because a page fault through a
shared mapping may already rely on that initialized size.  A direct
write rolls the initialized size back as before.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v4: for a buffered write, zero the unwritten range instead of
truncating the page cache and taking the initialized size back, which
dropped data stored through a shared mapping during the copy (Baolin).
v3: clear the cache up to EOF, not up to the extended initialized
size, which left the rest of the block holding pos + count (Baolin).
v2: also clear the cached tail of the last block, which v1 left in
place when the write stayed inside the old data size (Baolin).

v3: https://lore.kernel.org/all/20261112093233.1118469-1-zhanxusheng1024@gmail.com/
v2: https://lore.kernel.org/all/20261112030815.982026-1-zhanxusheng1024@gmail.com/
v1: https://lore.kernel.org/all/20261111093459.660484-1-zhanxusheng1024@gmail.com/

Tested in a VM on ntfs-next b025f526c5d0, with all free space filled
with a known pattern first.  Short buffered writes of 4M, old data
readable after drop_caches and after remount, 3 runs each:

                                    unfixed    v3     v4
  fallocated, ends block-aligned    3137536    0      0
  fallocated, ends inside a block   3141332    0      0
  fallocated, unaligned start       3137536    0      0
  same, pos + count in that page    -          0      0
  append                            3137536    0      0

With the sequence from the v3 review (marker stored through a shared
mapping at 64K while pwritev() at 0 is stalled, short count 8192), the
marker is kept on unfixed and v4 and lost on v3, 3 runs each.  A store
into [pos + ret, pos + count) itself during the copy is zeroed with v4,
as that range belongs to the write.  fsx (buffered, no-mmap, O_DIRECT
and mixed), compressed files, fallocate, insert/collapse range and
punch hole give the same results with v4 as with v3.
---
 fs/ntfs/file.c | 57 +++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3213a0c9f96b..5ac11d60be37 100644
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
@@ -939,14 +950,46 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 */
 		filemap_invalidate_lock(vi->i_mapping);
 
+		/*
+		 * A page fault through a shared mapping may have used the
+		 * extended initialized size while a buffered write was copying,
+		 * so taking it back could drop that data.  Zero what the write
+		 * did not reach instead, including the rest of the block at end
+		 * that the copy may have read from disk, unless such a fault
+		 * already moved the initialized size past end and zeroed it.
+		 */
+		if (!(iocb->ki_flags & IOCB_DIRECT) && NInoNonResident(ni) &&
+		    !NInoCompressed(ni) && ni->initialized_size > new_init_size) {
+			loff_t zend = ni->initialized_size > end ? end :
+				      round_up(end, i_blocksize(vi));
+
+			zend = min(zend, new_data_size);
+			if (zend > new_init_size)
+				init_err = iomap_zero_range(vi, new_init_size,
+						zend - new_init_size, NULL,
+						&ntfs_seek_iomap_ops,
+						&ntfs_iomap_folio_ops, NULL);
+			new_init_size = min(ni->initialized_size, new_data_size);
+		}
+
 		/* ntfs_attr_set_initialized_size() rejects a resident one. */
-		if (ni->initialized_size != old_init_size &&
+		if (!init_err && ni->initialized_size != new_init_size &&
 		    NInoNonResident(ni)) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
+			/*
+			 * A direct write did not use the page cache; drop what
+			 * a concurrent reader may have cached past the new
+			 * initialized size, as __ntfs_extend_initialized_size()
+			 * does.
+			 */
+			if (iocb->ki_flags & IOCB_DIRECT)
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
@@ -955,13 +998,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
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

