Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883725;
	b=CEok0Leogn3HVq7QqqmDr7zfyGI2QZiVvMxD91/Z4DloGWyDF0dfqRFo+X2JMnlB/Wgk
	 u5NwL02/GHotLaKBaf1uQY1pN235ImvL9w3GclzursOQkr+uNe9raSUmQWWncDiS74H5z
	 Eg4i3Jd4nRGxbrrV1XB5IS7uf50Vxa/wJXFvPUuNPdS9P6VQYYb8quqU/kQbeH5WTMIk4
	 W0P/VsomF+8UeedgUMq7MQ/zA2YMCF15iXj1pSXcLBwU43Kuo2G02pQZOpnlwW4bCV7o1
	 a/ufKu4NmgYeaADaWrIA64PVlojKY0uVgHpmqXXefk2KDi12b10UinHRygm1+jmCqCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zaZo2IN21mSc8I602pjnEtUM9ME8C1zumOrQwc4EBXg=;
	b=QvWd+k9ckzvc9w+QShWasDrsRKUgxcDtv7qnv15rgM5qyLPYpZxMP3dP3cm3Ou7ONnpb
	 l8QoBUB1s7aPq8nnIwSsNEkPm2OkKvAEj1EvXWV+HfkQ3BnzM9kbsCwgJxCUOpr783JvH
	 TzHF3Y/Wh2LRABWgLcMVPE6OnqOdivTSzqMiwpw3sbz/NvO+yEyDGsVkhfJId9/vcqBOj
	 L3MDZK+9Qkfd8Qf+ycLJI1od90Ax7ikS5dhcERAOpfi4yr9cGttP9SBGCknub8Gr3hpkE
	 NOfB0ESFdXso9MmYNrtBDOLtbx0PItFmSmYs0sUqhxusDI5ANVQtkK7zq2WfGOgIF6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oy5DMWK4;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B910C606A328
	for <ntfs@lists.linux.dev>; Thu,  5 Nov 2026 13:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B910C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oy5DMWK4
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2af4c8d00so657450c88.0
        for <ntfs@lists.linux.dev>; Thu, 05 Nov 2026 05:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793883724; x=1794488524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaZo2IN21mSc8I602pjnEtUM9ME8C1zumOrQwc4EBXg=;
        b=Oy5DMWK4qWmsUrFqQy04sOMx7qhuzYcHzz3TSa63nnWF5dxww1qYv/VH+Fv+rUCKca
         68bxzChh86OHm6VdN41uiLkcPfAKNywfSltTGgoZxFEoj7DhcoOTpqhaPJBvplUZBeKz
         OqNEY4isOB1FSKabBWGnjHixZTD8GQQu3Q0EIJubW6VnuySIi4m6AAq0rv+uR7ak8Vji
         mvP+hzJh9SXfvES9GNGEpADuVPJfSvRiQgQxubhokj53kcYvXljuhhuREFFdl65fmbXX
         JWQOZlnxfJd2bK8u6Rl5ZdkoQw0OrXwr8tDkGWGG+WoQNMJAYag6qW2Gqv6dj/gMqdI3
         tj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883724; x=1794488524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaZo2IN21mSc8I602pjnEtUM9ME8C1zumOrQwc4EBXg=;
        b=EuVSUOmqKw3+aPv1cN7eQOnMUeS/DzaIuclYBjkso8wVE53AmOnOvuYiFVDbxwpHHT
         iB72KQlrWaXpZuljs4ruiqXEqViSoES5dEFR5UuNUnjMUWSmo3bxf9j3NYw7JnKJpv5I
         PIWkOQLnJlOhf1IGSqXiw/aeeLQlw11iKEyfPpOEeuvU/7QCYgIG+hk7wCrpSFwj+q9H
         NbiYJHWraGRZb5V/DPvGOvvfqtJJclXUbK04F8UiDQANkvcYweWUDCiMGGaSh9T9jLdE
         f1eRn1BQ9OR4uEO/Akx2QktyzVXW2dXTdMpLXIaTLU0hEHZOFDeZzUkZAQTIw+BXLfMb
         qtBw==
X-Gm-Message-State: APuU4Z8LB5evFSdclx477i+EW6eZhh/90o0p330RcCPjdHgeldKdKmNf
	iXwRCVRyBkrTBdl5Sd49kgOmzC5k89biRv9xTp2Yvsu6O2YPZrv34Oce
X-Gm-Gg: AYBFou2hAHOgB0B5ahdy4LOHUkxMK1wf5mPqjPeUZ0ewT7DwY8dq4L28YluSaYiMANv
	UMt8FFWSCUb1DCxGdVvB2i2acdtMh18rCFjIBSfYjLMS2Wi9FiM0rs8xTaArlxO+Ve7m7vkQjhc
	GGpnX/+cbVLd+Sc9M7H9tKd+iNXxofYkxQ3XWRECGzrNZG3FxAjv862hvMEEWdWM0aH88o5ye27
	+ZBNdBuegP0Wp19SZZvk9GcmL3A/vZalrdf4Im/xYbqu6Y5tajk+f5m8famSZe9GKNwev0ltyTE
	FoVdETTxn9WXGJ08KLM1N1wwno+XUoetzDHAblBGhbfz88Oso+rAT1IYXjDfT1bR7qjTnf488rI
	hyBPO6u2PoYkrYSOPoTqgWNJShkZXJN9lpkj52Je/QzOpmqTIf0UOQQT19RCUVDYp5xQXHI9rBK
	bPeUom4BwQ+sCrnX0Lo8kVv5oKupUmHMRNG4p6vbSe4s4TpaBNhDWLgpmjdE4GHYmvFsuYeK+OP
	B/XTANxRGwllavOZ1l3Rg2yDJGV2x3TNRobcdZ2xvkI4tGLoPntbRG9iU5V2hLIiK3FjGiRy6pn
	R8ktIbH4epcIaQOk/SHBiYETYJeiOidOepC7tk6GNrxZsg==
X-Received: by 2002:a05:701b:4512:10b0:181:73fc:e53 with SMTP id a92af1059eb24-1ac5b7e21fdmr29165905c88.29.1793883723317;
        Thu, 05 Nov 2026 05:02:03 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm22945048c88.21.2026.11.05.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:02:02 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ntfs: don't write a compression block after a short copy
Date: Thu,  5 Nov 2026 21:01:58 +0800
Message-ID: <f385711f8772132f64462e1d6c13efadadc51bc2.1793874221.git.zhanxusheng@xiaomi.com>
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

ntfs_compress_write() does not read in the folios of a compression
block that the write covers completely. If the copy from user space
then comes up short, the rest of those folios still holds whatever
the memory held before; ntfs_write_cb() compresses that to disk and
the folios are marked uptodate.

The copy can come up short after fault_in_iov_iter_readable() has
succeeded if the source buffer is unmapped in between. On a volume
with 4K clusters, writing 64K at offset 0 of a compressed file while
another thread unmaps and remaps the last page of the buffer leaves
61440 new bytes followed by 4096 bytes of another process's freed
memory in the file. The write returns -EFAULT.

Treat a short copy into a full block like a copy that made no
progress.

Fixes: 5b676a77f3e4 ("ntfs: skip reads for full compression unit overwrites")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in QEMU on ntfs-next with KASAN, 4K clusters, page cache
dropped and freed memory filled with 'Z' before each write:

  before: 16 of 41 writes failed, 3 of them changed the file, each
          time bytes 61440-65535 read back as 0x5a
  after:  286 of 731 writes failed, none changed the file

The same loop on rootfs gives short writes and no corruption. I can
send the reproducer if it helps.

 fs/ntfs/compress.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 82c7c7d29073..287bd47282d9 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1567,6 +1567,16 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 			}
 		}
 
+		/*
+		 * The folios of a full compression block are not read in, so
+		 * after a short copy the rest of the block holds whatever the
+		 * folios contained.  Don't write that out.
+		 */
+		if (full_cb && copied < cb_size) {
+			iov_iter_revert(from, copied);
+			copied = 0;
+		}
+
 		if (!copied) {
 			err = -EFAULT;
 			goto release_pages;

base-commit: 564c7753647731d19170914c1c637d3b33d88d3b
-- 
2.43.0

