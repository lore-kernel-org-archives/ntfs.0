Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864084;
	b=myWklmm7LluZsRzgqznXMZUCElw5nA0Dg5EcfGrlTZGboqdINDrciXW28ToQXWtD5rd6
	 pNmqLiWWoasMHBnzwbN3WQ35POjK8ZHvT4eem6+IjcGNIMh5od3UVN+xpX41WmWyd+GJk
	 fF+kTlF9fGEV4f+vZkUhRrgpqVY+p2o08i2yjiZUcl9QC3onG/A4XPrKeIkL3q4b43yO4
	 N8qqj+jtKiRX+IIlv/bNt8cN7YvCajOuCkKOT9YnKiXZL+vdYpFlDo9/RPBZXk2IH+Vvc
	 iwHp0FpIZAptMvcbowuYU6FNKsCNBYUxYOChn+6U1xWEy4zvbYlU5todGGG6OZnlQEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Mailer;
	bh=HJuLq57E7BPGIjqWOOCyxznSzjq43LL+ol+MdavMl/k=;
	b=S0cdRdy/Yr9v5TycvBFC0ITth9o/dWpBB+ijOyRAgZyuq9t8jSC8crqLM2s+MOcU2fPt
	 L4DAvGSoIjvaFltWXBJqUTnPNdSj6RmSvtuoSu/vgOmJX290ewOVwKxvYStDFxqEY/xpv
	 gR9zzNyuuQ8GkNcs4QQ95gAFZ68EdtVeUaesM/9/CAYy2e/CLjX92w5UcfAcuzUFJKEwn
	 K3nvPQuYdbLUBSNqiwTL2PUNUW0g5GGe2uuunYun5NLT1nVBS0WMShFrF5l/ifWqtgagj
	 0xu1CTx2r005megmMU8oJl+7bXe8CyIYLzXB8zdAFpZRJp2C/uYPDaT4Grjd+V5Ew3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iGsl3ISc;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD52606A31B
	for <ntfs@lists.linux.dev>; Thu,  5 Nov 2026 07:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFD52606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iGsl3ISc
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b0c7cb835fso8005a91.1
        for <ntfs@lists.linux.dev>; Wed, 04 Nov 2026 23:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793864083; x=1794468883; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJuLq57E7BPGIjqWOOCyxznSzjq43LL+ol+MdavMl/k=;
        b=iGsl3IScvesUU0ZPDvcLgz3eWSdsjppo/1N9HIXtNzNTgE9E86Jw3LY7uhDORdl8Zk
         khRbWaVW1lo0Wb2qZbp4i2kAazFe/dEkVSuuwz1IM4ow7/oQVi/8Jrdfk657JnUIfhRy
         YFhvrFoOllI2p6dEWzd+I9ZwOxHW1MIS1mywFRnly0Aq+hzyTsE4iikCB0YW4VKLp0hV
         csFww+F0Sl64BPuLgwOB2UrEI07gTtJhYXbP5DMsTvZGjKbugE13/EuTdS+eSXaFXmmw
         QEII06OwBP0w+ZvTS7lzmQ4+Id1HPDB5AgsmE4vWUwR32j9J6mHHL8Lx6RE2UjZdM6ws
         T/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793864083; x=1794468883;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJuLq57E7BPGIjqWOOCyxznSzjq43LL+ol+MdavMl/k=;
        b=XKqBWDxUAdEO3G9ZgT+HKp/JKcFzf/WBuGkzzBJBuh/FbS85qqLzjcfOJsW5bPirNm
         crQMGIE991FT1/JF+uHgxhB+GliDjO5hKjK6Brj1Wk0hG9JMSmOBBIOyClp/ptlfxHYm
         MounIStDgQn15kASyLxUiKbnSYojBU9T2tGCVlMrbQN6yiTh0M/RffYSKuY0s8BUQdNI
         vG3X/Zl8+sT4pd1SYp4ODlBXXjVkYzgn5PJg4pqbJxx2ykfg9LCuQ3Up/6iienywiDhT
         W3IxZyXN83dPWSjMAjbcvK7dhFy2N9LwddQR8qdol07ByT2jCX05k+qIgk0Np8gcUzkT
         IN7A==
X-Gm-Message-State: APuU4Z9O87t/daw+r4i8YI9za6TkFDnKMho3hjENECwAF3OBPLZaU72w
	s4KKkQ+JZyg5Kt+biqQs1uCCI1HIXwde3zJANGoNCbzzTwwayCGiOcHog/cnaZxF
X-Gm-Gg: AYBFou1C90SHEyP9y5IEl9zOhEp0z//J4LI9WKjOv6Os7h1Jj6BnYAY7DnTiRR/Y5g4
	66TQbP9LcmksioQKQmvDvaVJ1rmNePnZOKAxudh98Nm5p6lKxDxGd0246Dd/8ZidJJ7soAjBssq
	MU2J33U9d5ULd5JWC/Z5dK5NLhMpSHOYcis+jXSTiKRZ6Q8s3ZbuyPT4Y1GxqH8ehBlH9kQNkni
	kMjEGApnPkFSPP0cvUbo0a1ivBZdohmDwoyxi7OMlVB+dxL1RHw2f0GbkigL5VH8PvEVQDzAHfs
	89fdzcu/XrGZTnLT2v38qs1OkVIC6vs2WpfqY6HEjTkllyD4GLfG8kFKCem3eai9aywt2oZUcd+
	gpx+E9kHfpe26yzCJGF9oL4gCFZSlMGv0NeEsmuUMcTBIsqL6EKwo9znYkbYurk0Ow1DLxBW6zz
	/o4aP5SBjjodBoZbR2+/eSHyVd4aZ3d2hRxJmwuv/iTPaDz+aPv/Q26aKvPl53iKiaI3P+NbJnP
	cu/GTUo0URpDvl8ONyB9htUzvUrNHoXdwNr603598Ys+MiwG+VMbU5OV6GjRBADlMveAnwhy706
	vZ4cJbGaiQK0ueZlpDVTvA==
X-Received: by 2002:a17:90b:4b92:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3ae897fb684mr15091965a91.63.1793864082940;
        Wed, 04 Nov 2026 23:34:42 -0800 (PST)
Received: from hhost ([2409:8a55:3161:10c0:6a05:9852:2c87:88b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312e45dsm3146052a91.3.2026.11.04.23.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:34:41 -0800 (PST)
Date: Thu, 5 Nov 2026 15:34:04 +0800
From: Xingyuan Mo <hdthky0@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: "open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	Xingyuan Mo <hdthky0@gmail.com>
Subject: [PATCH] ntfs: fix out-of-bounds write race in NTFS_IOC_LIST_STREAMS
Message-ID: <20261105073353.433854-1-hdthky0@gmail.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0

NTFS_IOC_LIST_STREAMS walks the base inode's MFT attributes twice:
a first pass sizes the output buffer, a second pass fills it, both
times filtering out streams that ntfs_stream_unlinked() reports as
unlinked.  That filter is the culprit: it treats a stream inode that
is no longer in the inode hash as live, which is precisely the state
a stream being deleted ends up in.

When a base file is deleted while one of its named streams is still
open, ntfs_cleanup_deleted_inode() sets NInoStreamUnlinked on the
stream inode and removes it from the inode hash after dropping the
MFT record lock.  Nothing serializes this against the ioctl's two
passes, so if the flag and the unhash land between them, the first
pass excludes the stream while the second pass includes it, and the
ioctl writes an entry the allocation never accounted for.

The per-entry bounds check cannot catch this divergence, because
"offset > required - entry_size" underflows when entry_size exceeds
required.  With a 1-character stream sizing the buffer at 48 bytes and
a 250-character stream surfacing only in the second pass, a 544-byte
entry is written into the 48-byte kmalloc-64 allocation.

Close the hole in two steps:

- Reject base inodes that are being deleted before walking their
  attributes, like the other named stream entry points in this file
  already do.  This also stops the listing from reporting streams of a
  deleted base file as live, which is reproducible even without the
  race.

- Make the bounds check underflow-safe so any remaining divergence
  between the passes can only produce -EOVERFLOW, never an
  out-of-bounds write.

KASAN report from the reproducer (timestamps stripped):

BUG: KASAN: slab-out-of-bounds in ntfs_ioctl_list_streams+0x7a9/0xa00
Write of size 500 at addr ffff88800b1931a8 by task ntfs_ads_race/305
CPU: 2 UID: 0 PID: 305 Comm: ntfs_ads_race
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x73/0xb0
 print_report+0xd1/0x610
 kasan_report+0xff/0x130
 kasan_check_range+0x10c/0x1c0
 __asan_memcpy+0x3f/0x70
 ntfs_ioctl_list_streams+0x7a9/0xa00
 ntfs_ioctl+0x3b6/0x420
 __x64_sys_ioctl+0xd1/0x120
 x64_sys_call+0x2a5/0x2220
 do_syscall_64+0x109/0x5e0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

Allocated by task 305:
 kasan_save_stack+0x3d/0x60
 kasan_save_track+0x18/0x40
 kasan_save_alloc_info+0x3b/0x50
 __kasan_kmalloc+0x9c/0xa0
 __kvmalloc_node_noprof+0x2dd/0x800
 ntfs_ioctl_list_streams+0x57f/0xa00
 ntfs_ioctl+0x3b6/0x420
 __x64_sys_ioctl+0xd1/0x120
 x64_sys_call+0x2a5/0x2220
 do_syscall_64+0x109/0x5e0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88800b193180
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 40 bytes inside of
 allocated 48-byte region [ffff88800b193180, ffff88800b1931b0)

Fixes: 48996054b706 ("ntfs: add named stream ioctls support")
Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
---
 fs/ntfs/named_stream.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/named_stream.c b/fs/ntfs/named_stream.c
index 95a3c05f9821..70c589207713 100644
--- a/fs/ntfs/named_stream.c
+++ b/fs/ntfs/named_stream.c
@@ -1632,6 +1632,10 @@ int ntfs_ioctl_list_streams(struct file *filp, unsigned long arg)
 	ubuf = (void __user *)arg + sizeof(hdr);
 
 	mutex_lock(&ni->mrec_lock);
+	if (NInoBeingDeleted(ni) || !inode->i_nlink) {
+		mutex_unlock(&ni->mrec_lock);
+		return -ENOENT;
+	}
 	actx = ntfs_attr_get_search_ctx(ni, NULL);
 	if (!actx) {
 		mutex_unlock(&ni->mrec_lock);
@@ -1731,7 +1735,7 @@ int ntfs_ioctl_list_streams(struct file *filp, unsigned long arg)
 		}
 
 		entry_size = ALIGN(name_offset + name_len, 8);
-		if (offset > required - entry_size) {
+		if (offset > required || entry_size > required - offset) {
 			ret = -EOVERFLOW;
 			kfree(sn);
 			sn = NULL;
-- 
2.43.0

