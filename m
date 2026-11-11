Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389705;
	b=C3jpXAOxf1bnpU5QmiAZAujAiIVQCYVr/eViCAb2om8/oOVo6H43UYPQsmN6q0FlAgqA
	 JrJa7cyz6XAijX4r2jQXpUTKIv7DEEcfieCtPLZRMkJgUFDg90ihkjg0nD5/s+V9FWrGl
	 gWlpXcdGHOYJFkjGIWNFZ0jtZjqV+LHyiedEG/H0DhBm4ABEVR3AsOxZOiCD4Mrb+qTN0
	 ZkWsAA/9ZLylxaE4t9Q8BeX9SjWLT7GcvYJ3DA822IA4M5hXj5kNvNv30C1zhzQZaNksi
	 gWfe/gD11u5NGOcfvfVN65ZTbfGeQn9ftC09+1VFfYkcT+ubYSWHqU1kw66n2Gkf5hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7/ak2wJxgQz/GEeeix3feX0c94ZhF3VpppiIw7196jw=;
	b=VIkppyP5zgeUTbG0tawMbv7SBHMcUMwMrj56Z9iCN4jhU6trI+U5vrbHnCWJIEQNxhtH
	 TxYgkMaZaCp7n4jsXr/kOfjhWEElbEU2oCMUekKPLihHC1J9P4XVPUFDpzIFb0Zb+RgHl
	 cG4b48AuzznvFx8SgttVbRD9etUBzY825K93352rWwBSHMv6tefDpu/437RGwG8xEvZkb
	 rZQ3uLLDnH1T8Syj28F7f10A1uCpRcYPtiLJmMzX/+6eecO2wzwb4XNiVVoQxG/xww80r
	 4Y8V8fzX5yaLjMa0LLkbAc84dtq8YF1hWY4oPfzHo4UncIiDX/4PppIEeJHX56n8f3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmFVBL4P;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCF9606A321
	for <ntfs@lists.linux.dev>; Wed, 11 Nov 2026 09:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCF9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmFVBL4P
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so2880635eec.1
        for <ntfs@lists.linux.dev>; Wed, 11 Nov 2026 01:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794389704; x=1794994504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/ak2wJxgQz/GEeeix3feX0c94ZhF3VpppiIw7196jw=;
        b=mmFVBL4P+94BNWynp1inDnwQwk8RO8An4HVmdeYkKKNOwyZ/oST58+69c7RceVF8Wx
         bb8yDeDMysXnCmYwpuASWM74kCpCrp6OuystT1F5IFmU3O26Wk2P5yFGnVEIbYoZSGbC
         6Il0SGMtKAwaUJpnMKuxyu4HBayW9OM0Ms0n9oei17BO8m4S9f/mvjEzuFOa0z1TbSxv
         3B+fEtTWpTlCLABh1rZh/KGFPfEucff5FzUD6TcsconWvlbCXAG0KEsY7W0+hysS+abX
         p11c81to8FUsTyVZhgRAh+ZpuiL0Ci8gGV5Vu3P/1FisjuLX1RiQ3PtTAJXHyp8gl5sD
         XMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389704; x=1794994504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/ak2wJxgQz/GEeeix3feX0c94ZhF3VpppiIw7196jw=;
        b=PuSd1e/HasDDo5uuyRoT5YzNQVY7TTdgOdLTOndao8d0mTX7uHRJi0y8GbeftPSfuK
         tg+Wv8yuGbeFVmZTnEWFYdW7LtV/XykD0RPNsVb/JzDug8KNfXvp4N3nexbl+/r8qArf
         brtkxxo5zA+q2oHQ3isTmwoSTFpnR9LZk3RMWLr0f8wJS0J2sRLyyjSv8qfdBMxKF4gg
         OZHZbELA+zAxcdpLZPJB0N0eWykLuenwXuskRy94pL54lJdAwxDx/7x6k9LA1bqRrdWd
         V+hSsnyfq2gMqIiXEDH/Ne9iC6SIiweWCSbQyXjqRw1CFRxCpTpk0YbF7NR9k1TIgMOy
         Kmfg==
X-Gm-Message-State: APuU4Z/Zi6063v6lTpX1Hp2H8Hzv3W4I8a1V4uvqWsycoLkhrKAtrEfK
	6296Dr1jqdT8SYHxcWXYCC29LKA3ULzGaki8kgL2VrqwjFddDoiLCf7a
X-Gm-Gg: AYBFou0zcqNgOw7w18HqHLqeDdXDDeGJ72bm0bz6b8IdLek1tP188LTZ5AGWP9f5dNs
	e2UJyL+MTq5DiR0WRnkDpxhxySZBY3+UdaiaGYqZV8rl3+TIk/otFAahqfI+GU5XXP9fcVBIOSC
	KB6z87SHBkZ94WnBjZlPHXIHqFQTooYdzY2dlwx+wYVaEPSTeFZjfSnCRqYQDbDh/bjjJv0UVv3
	FObHaKRoGv0xhTx43TTNYXEhwLsdWs5gcdYtvHedhGGXb/zcsllcS289HuKyIv+1WU0O4+L83XI
	H+LjJqBa9g5H/sgOXilwqd6hnXJt2ZHyEaL5stOazJjsPaNG1qx1Nm8kIlwMXlggOeCXD0iiOzy
	SnJK5Q4UDixG2fF1te/w2HgwyWkD1qx6KmZEDyNaswWgNLgOGQDz+drueBIcRol9CFsIl20yHfT
	a7veXJLGfBl2aRyxHpEA4d9CniseNd3Uv1k96/3gE/uJedziw+jVIurd6ijXIeE0LecIrdcCsr7
	aMsToPA+dDv3GaxQ0F5TqCNZDeuGYHycy646XN0Op6Lf6KGsmEe9nwRIUnqmhrexq3vCV+ByK1e
	mH0wZdjepOR1d/yY6liAZ13tSNGKn8mvxCdhaZivqbaSig==
X-Received: by 2002:a05:7301:2424:b0:36a:21b8:b6c4 with SMTP id 5a478bee46e88-376851ce3acmr2539201eec.8.1794389703938;
        Wed, 11 Nov 2026 01:35:03 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe3261csm12625718eec.4.2026.11.11.01.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:35:03 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH] ntfs: trim the sizes after a short write
Date: Wed, 11 Nov 2026 17:34:59 +0800
Message-ID: <20261111093459.660484-1-zhanxusheng1024@gmail.com>
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

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
A reproducer is available on request.

Tested in a VM on mainline b3dfbde62cf1, with the free space filled
with a known pattern first.  Short append of 4M that stops after
1056768 bytes:

                     write()   size grows by   old data readable
  before             1056768   4194304         3137536 bytes
  after              1056768   1056768         0

A short write 1M past EOF gives the same results.  Full writes and
compressed files are unchanged.
---
 fs/ntfs/file.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3213a0c9f96b..98bb3d5d420e 100644
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
@@ -940,13 +951,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		filemap_invalidate_lock(vi->i_mapping);
 
 		/* ntfs_attr_set_initialized_size() rejects a resident one. */
-		if (ni->initialized_size != old_init_size &&
+		if (ni->initialized_size != new_init_size &&
 		    NInoNonResident(ni)) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
 			mutex_lock(&mrec_ni->mrec_lock);
 			init_err = ntfs_attr_set_initialized_size(ni,
-					old_init_size);
+					new_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 		/*
@@ -955,13 +966,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
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

