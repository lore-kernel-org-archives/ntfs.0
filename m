Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452902;
	b=QR5FEv/Oue1zfAU0WALKDl/aByatONTGSG2GyzUHThqGf1pejKjtWu0iFhhf9QdRnbRJ
	 1ahqLtfJFkJ76gHUy72so210gWolsKQ7I1K5iajmSGidOpDbCryOJY65LWoRyOaFevcIO
	 JuFPjmx/E2vsYjSl/MDcJWtIm5NaUz7+a1e6ky3o2sKNvhvLCoyl+CKyY2pPlLQVUUJn0
	 16PSgyaliEL8LNLJRpHUsdGVeg0ft4yyrCMy2NlO9MTmpiWl/HVgCN+Vr9lgQ3EqjXZBf
	 poqPq5sIWv2sFNVKNFZ/0iupxQ/yE7SVp3LOHdl9kpLbiaBFxMiQSg9Yk5eMaL0NH0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UeXaSvr4SrCTOf1iO2sie7UdIT4yjGWoYerMUs70xPo=;
	b=cgEVvKgTvFQz2t2Rq+/Q8M1V+Z7UoH4WmYgFL6h5MNBiUu1HjfSVSz4Vv77Q6EFkfcHQ
	 e4kkJNDJoGZXOHhucdXS0BvkIlc45nbgz9PwYzbTcsaSgUofo6xxUMuJ8WsEiWF6uY0x5
	 MvIOoop7e6seJzZx1BEcr4kVnsxLGTud07eHyofhz9Ar/EBLJQHDPa3haod3JB6ZrMgD3
	 RYlgh+m45Y71Jn3lcyEKE7ZW+dArr0F8j7GbQ1hWYG9MZGhZxp2wH0aOfMBcR44+ILkPX
	 ipbuNeOCdvUeatqbrKmlL8zagBVhTtMr1uwCJZmrg/dsJLlOHCZ7AapV7HTFTlQwZ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuZps0PT;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12967606A324
	for <ntfs@lists.linux.dev>; Thu, 12 Nov 2026 03:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12967606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuZps0PT
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3720addb068so6825887eec.1
        for <ntfs@lists.linux.dev>; Wed, 11 Nov 2026 19:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794452901; x=1795057701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UeXaSvr4SrCTOf1iO2sie7UdIT4yjGWoYerMUs70xPo=;
        b=cuZps0PTb3ubfW59uykifPzU0hGq1wubSYlEJxQ4QZ/30BjWk1AzohWvhRX+gLhwen
         S8TSRthnjxuf7zJaaEyh2ZwlOGDzsvaHFEuph9vcQTDu1Nao0A+P+0ogG7neo+HGr09v
         mmhYTZET8MTsajqEaOolv+TWb97ym+YHsJsxpSWtD0B5dZ9OG7RTuEnR+7Wn8XGhgIBA
         m+5bDXOrlm9y8oA5CqUZIO0ImekGw+F1+2cZ3nz0QZOLF6GhQ8y52XJHJpmI2K+115q9
         RHgUFzaqq4quyhenHygsW+qPrcWINVW0Qr6yJ0zgJi5ulFGKE3fwBPieNC2KUmo+ruoM
         h1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452901; x=1795057701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UeXaSvr4SrCTOf1iO2sie7UdIT4yjGWoYerMUs70xPo=;
        b=HLso2cz2/LhLeW7Tz0MCRP9iCTc+vqwzoJ7CBNbnxcmlBpHo6mNLQzQz2XnM6zbRM9
         VwYHwMfZqFuEMEHf9OVuvOrgzdye8WQH2h7rQKHmj5te9cXw2lp7ScPKiBWdl6x019nS
         6ijvHSHmrKHJ6Oz9u2jpDdpRYluthFRfXuiRole87b9t+UlfjJ1do7GIG0rGnlQdQzl3
         v7Mstq3phzmDcsMuYR1qzlQ1+7Eb1wc1K5kCkQFheZqzdCJf07yTpEXxQkvgdzTenF9P
         k3KobwDDg681WjzWWwMvExoh4tSltlH5lskjmfD1ZSJsJvUQRAxU/o9OKrlYRrqEWdVx
         ByCQ==
X-Forwarded-Encrypted: i=1; AL+hErEEfXrDY1q5h0rrA+QvZJWzW2oiy4IdRvWwnK6vlND2Ew8bIVRd0mRFKX1HH+lzB8ZOFTvT@lists.linux.dev
X-Gm-Message-State: APuU4Z/TDIn2VBC+RncbGs9pW4HrLi7a7GjTLEBPXnM4kZYaUIxDXv1G
	BvtEzLqtZHB+7V5kCDpQtxMQ4Od0ZUBu01+m4u9S8OhV9yzOvTWBGN6ue7ynovBV
X-Gm-Gg: AYBFou2d5fY5dNmmvLZR5JJKx7avcED0XLrZ+iylo6FSKzUdjfaBCVJBU7p6wu2+TpY
	0kWdHcBXANLJOIPa7LJuV3KeOd9hqMVW6gReWSspmsUDe6EJMaasLohbmDar3ujll4ZMmQ0Kw5U
	pVH2i9kaYNSVwVPDxyeik16Lw5DgDX061ndGGlzP7oObcBpqH/k5WLd5g5Q/USc3BXpRysjJq1M
	T4PVP1Af5acz8yKfsfbXOzsIazyQ89A24gdEEf8HLGXctoyufgvMK1zu1aorHLP7R6lQASeJNMg
	gziVWuMFABdh3pu6mGK4DjdWaybtzXM0907Dd9fMEn73e6GfWquV9A3HkXtfNG5lykhr/rFYHjR
	Qt75yPjou4aWX6lDgmQpp79940UBfBPW/+g5gvjyzde9S3m+Toa97oaHUJKpSVxwzVP0fyGj07K
	OwQAj1eAc1YbZ5fMglnBrLjZ6xm7JaU9yfsNjzRmiylfANVsFNpsoTKNNEI3wLiSrqSPTa3yQxi
	cEC3lCsJSJk4PtwHogEiMpur/4OYf26zOH8wA8Jny/+PULxDg+xvLHEadeU7Ij6YP5nd1ncBi19
	k0x09S3+IIt9AcLUwxLWbPjPrp+WwsGCrwgnTsyL0RsykA==
X-Received: by 2002:a05:7300:6dac:b0:369:f9da:a70f with SMTP id 5a478bee46e88-37685b7f916mr6937512eec.17.1794452900796;
        Wed, 11 Nov 2026 19:08:20 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm20406158eec.11.2026.11.11.19.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 19:08:20 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: liubaolin12138@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH v2] ntfs: trim the sizes after a short write
Date: Thu, 12 Nov 2026 11:08:15 +0800
Message-ID: <20261112030815.982026-1-zhanxusheng1024@gmail.com>
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
block cached as read from disk, so clear the page cache beyond the new
initialized size before shrinking it.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v2: also clear the cached tail of the last block, which v1 left in
place when the write stayed inside the old data size (Baolin).

v1: https://lore.kernel.org/all/20261111093459.660484-1-zhanxusheng1024@gmail.com/

Tested in a VM on ntfs-next b025f526c5d0, with all free space filled
with a known pattern first.  Short buffered writes of 4M, old data
readable after drop_caches and after remount, 3 runs each:

                                    unfixed    v1     v2
  fallocated, ends block-aligned    3137536    0      0
  fallocated, ends inside a block   3141332    212    0
  fallocated, unaligned start       3137536    412    0
  append                            3137536    0      0

A short write 1M past EOF, O_DIRECT, resident and compressed files and
full writes give the same results with v2 as with v1.
---
 fs/ntfs/file.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3213a0c9f96b..1779110a0c4f 100644
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
@@ -940,13 +951,21 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		filemap_invalidate_lock(vi->i_mapping);
 
 		/* ntfs_attr_set_initialized_size() rejects a resident one. */
-		if (ni->initialized_size != old_init_size &&
+		if (ni->initialized_size != new_init_size &&
 		    NInoNonResident(ni)) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
+			/*
+			 * A short copy can leave the rest of the last block
+			 * cached as read from disk.  Clear what is no longer
+			 * initialized before shrinking the initialized size.
+			 */
+			if (ni->initialized_size > new_init_size)
+				truncate_pagecache_range(vi, new_init_size,
+						ni->initialized_size - 1);
 			mutex_lock(&mrec_ni->mrec_lock);
 			init_err = ntfs_attr_set_initialized_size(ni,
-					old_init_size);
+					new_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 		/*
@@ -955,13 +974,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
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

