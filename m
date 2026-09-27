Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3042E736A
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 05:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485722; cv=none; b=Y9zTW1vUMxVV+pYo4afWmzcD0iQUAH0K3J5RNddAsWyQOOqOOkZ8ZMNc8PBFfsDygpm2vlc1KWOoN3rsB4enYU+q9yDKKD8wEfkPCRjEnNeZBiwGuE5hWoTkboL/R0pZ1YktkC0bzOmSi8oUjDKZ/eWbHslH7Thi+t+nDWsu2iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485722; c=relaxed/simple;
	bh=WRPywmVYQO0VtIPWxm29CrmFWUlUwbhwwdpQgzpRPMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPyTq9qqhJ20/ns7Zxir+1ulYz/DeGDpi2hp1ZQrZ1LssilPy3/XEDzIy7Vz3HgUQ36Lc1gvLt0IQc8RJQhb/f7JWEcHTVs6P8eQ0Da/SZljh3WrYleS7exJ1jeO313Uo2V99U7WvPQvlfmKWAPdMiOY0mJOV2O8Ig31iLncS6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i74nTNRq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i74nTNRq"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fdc579daso13249875ad.1
        for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 22:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485720; x=1791090520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufLJ+ytiFqLa5W5DPoK5dh+B3PH/RjJJE+Ibm3U4zmw=;
        b=i74nTNRqcP1WmPtTZfIKuaMmwTZ2xSem/2INOCnG9mBxh6brSsZzmzsW5258Txhh0I
         S8lfN5J5Osx7QrEsSsxkhw+6wPYtv1OORCe78koLKOvs6GXlcN2Xu+OXvarDf2ycEY5Q
         qd51MDAQy1ZEAORDxW3Na40v66v7/hG7KVAA0ACy3hvOecn1HOjVUNAaSW2uZWeRpEFL
         gmqT9d6AWSlM18TbWniYmSgkA6bkYgECKHd3Bx9EUp4VzS+h925ErFctYWHVw730hFix
         DX+oBAi1dFW4Yty6T+cv7G4gTNjrOZsVlyAEptqCfqb90B773R0iDvXx0jYB8z5Xsijt
         omTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485720; x=1791090520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufLJ+ytiFqLa5W5DPoK5dh+B3PH/RjJJE+Ibm3U4zmw=;
        b=b1J899IWxDKteQ1LicugZjUOZbQORNGnnQkdeYyu7geuznB8ZGfolY9nWue1ZFXDXj
         VJAZWMLWHZtmp2pwqrHrUJ1VckJn/Smib0AZcyHxX1DrLTVBleXPa+XMGUGT6IixxAsa
         rKlQ5jsBV4ck7cooagZGmHL0RXuEKRhvgpHuDdKx9Jn8oG1626C+QZ6dyDtQoFmQzNGn
         eBcC+nwxwhXdg+vs0JuMsKWzls9ugDTjdA4WekPyOiNxtAHFgB1id2mMfJbrBWBChukU
         TEYppWPLczXXk8FskRCwHSW/wydD62ei789FeemJ2vWwSlagEYqpyi6CHqtk6K9xsjiD
         clbg==
X-Gm-Message-State: AFq9FYL8VpchcQUemwWAyczaLM94hhpT0ApcYjAXg/Kx3LN8SferPht8
	XIO2+fFGxr9AR1jNSBzXu2g8mIKzA6Y+GJq8/wM48TYLgghaU2BVmNz6J6eLVKt9LObJjg==
X-Gm-Gg: AYBFou3S+/8uAz4d3Vwsf69DZCFwnDBkCiLcq1BoaeiIp3jYiYfKZO+FSIKhVrhoF7e
	5ouv59xncdhillEKukerEGtY+Cbu7ITYjT8CfhmGHvmluT+pe2hjYLcpZMpozyx3wwPwC0iyIep
	hF1tzCk+rBWx5BTK240pDYHTd6SDhv+E7RrllNhFE2qVfVLaFrHAO0b0rsq+Ekl33RacP2zZX/K
	7sIJFbR9MJ5j1rE03jzDn1/lozp7hxCUiVDfU7+2JccVH55/43IYCZYLTXsvcJHTAPndps35q0f
	xXaJ4fA3eUJfGKB26u0dll6m8N8gyTkBCaTXoMzIbvNErEdNsUDFToLmUfPoPgERBkALnc2IXOX
	mZyP6Mmx+XAuOYYA3zIkQNeiTq/mlioMAwl2l0LVGGksg7R2zsisBBBllnLlGwlLSz1V1umjr9K
	jBV5y72wWxvGTEdPOTTQUc+VKDOH+ua0OZqPfLGraAtphm8Ylh17Cakw/27yo4VeIt/wS90jtaK
	2Wn8UrPc1W88VFtXthl98SjpN2XvXl0UaXw8YQisLyucA7fpmKT/2IveJa96nyrP3zNHPQfNgQE
	h/FDx5XPJdKguetcygqPWJYf1QRBwYIxa6VaWz2sgOtTWvnHW4dw6qTejJQ=
X-Received: by 2002:a17:903:2b05:b0:2df:950d:8f44 with SMTP id d9443c01a7336-2df950dbafdmr52321505ad.31.1790485720400;
        Sat, 26 Sep 2026 22:08:40 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:40 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] ntfs: fail the mount when $MFT's data size exceeds its allocation
Date: Sun, 27 Sep 2026 13:08:24 +0800
Message-ID: <20260927050831.2739166-5-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790417653.git.matthias.goergens@gmail.com>
References: <arMoap0ZgeORuktT@hyunchul-PC02> <cover.1790417653.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_read_inode_mount() takes $MFT's i_size from data_size without
checking it against allocated_size, unlike the resident case in
ntfs_read_locked_inode().  mft records between the two are not on disk.

On a crafted volume with 512-byte clusters whose $MFT is cut to 4
clusters while data_size still says 27 records, reading the folio
holding records 0-3 finds the end of the runlist at vcn 4.  An unpatched
kernel hangs there on the folio lock, as in "ntfs: fail the mount when
$MFT needs its own extent records".  With the previous patch vcn 4-7 are
past the allocation and so read as a hole: records 2 and 3 come back as
zeros and the mount carries on until check_mft_mirror() finds the zeroed
record 2.

Refuse such a $MFT before anything is read through it.  The mount now
fails with:

  ntfs: (device vda): ntfs_read_inode_mount(): $MFT data size 27648
    exceeds its allocated size 2048. $MFT is corrupt. Run chkdsk.

fs/ntfs3 rejects any non-resident attribute whose data_size exceeds its
allocated size.  This patch checks only $MFT; the next one covers the
other non-resident attributes.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/inode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index a61f1519549cb..9c97fc3f9e5ff 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2136,6 +2136,16 @@ int ntfs_read_inode_mount(struct inode *vi)
 			vi->i_size = le64_to_cpu(a->data.non_resident.data_size);
 			ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 			ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
+			/*
+			 * Records between allocated_size and data_size are not
+			 * on disk, and would be read as zeros.
+			 */
+			if (vi->i_size > ni->allocated_size) {
+				ntfs_error(sb,
+					   "$MFT data size %lld exceeds its allocated size %lld. $MFT is corrupt. Run chkdsk.",
+					   vi->i_size, ni->allocated_size);
+				goto put_err_out;
+			}
 			/*
 			 * Verify the number of mft records does not exceed
 			 * 2^32 - 1.
-- 
2.55.0

