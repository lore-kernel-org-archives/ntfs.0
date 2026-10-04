Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28D2408602
	for <ntfs@lists.linux.dev>; Sun,  4 Oct 2026 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107778; cv=none; b=r35ot6ezdPQwTqHNqUVllIKd8n7sQ9kcSoc8NHuNeh3m5vsZButrWH/fZQWcA/WX/Lh1R3nmCS/Cyg7z/TrglJdxOnB8zvaFcqY4/EJOdO3HdrqgZgiwirVV4+CunlovVnz7dhTOr1jgYuxiDef7yhHCQdcFPB/EfqxHRQSkJCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107778; c=relaxed/simple;
	bh=+GGAOb4rGJgpXMxIngb5vc1ci0qSp8bUnDzlGkuVbHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baBvKYVG7BMYzDGhM5eMeSGrkJkdzqVjR5glgtdqysWM8GMhU/cRLBels05y3aNbi2Q+MAZT3AVImr5HWzQZGiP+VT17xDtEtAxK1bqt/Y76EWC2t2fSTeU3ZN4fCSusQhNeKUp4XlNhQzxbj6QiUHYzQSY0yfDtrhVezrL1cCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zbuul2Kk; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zbuul2Kk"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-887ba76d5afso260100b3a.2
        for <ntfs@lists.linux.dev>; Sun, 04 Oct 2026 02:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107776; x=1791712576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6dhwlhuHfppNHFWGhV6LLMGTjzCNhvMr26duFoEtJc=;
        b=Zbuul2KkRqDHHb5yy/6Aw6C+xoND1ty53jfkffEGIzg6O/qR4+aiAmRbe6s8G3Xi0i
         vWC0evnTgv4rWmtzwzqMAA5zvuOJvDFcJEamIC33/yb2XbjgRFy+vbETpPJWiJ6+rDFV
         BWHCHurNjABuaPT2AL6shRZpR4ytRFac/W0E3sIize9d22ZKwN5KQ+K7XjuELy03eTxz
         TbadWcIl00jBlD9J97EJcOtbhbETjDhmHIrlOS4yBQCODVnH4IEwzZPrvWROa3wvawYs
         pX57cOLTLhj75i0Ym36Hqj8fgTWtzu7eDXnSu5m7yYlSejJAGkgfYsU0NxpdXtQ6u89U
         YtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107776; x=1791712576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6dhwlhuHfppNHFWGhV6LLMGTjzCNhvMr26duFoEtJc=;
        b=BtGkGvez0RZwUcTQJeso8f8fGMjW2J4wyrV8rpZRWLlfwrkVrVBDcOw18o/wHQrK3p
         0CpQXiisr5Ov4FkVntu2h7+VogzybEKSBIVhRAiC5r7mEO0LE8+7yB5qNuJX4qmvOCbk
         76fFyf6Cw9MGZgndDTrDTz8JBwf3+8J+t2cjqNmCrMiYH4Il4h+DZnH+aziANYHfN2XZ
         Q9and95lYCpjs19kVD4qrXuGtCIZLhqyqzx+HVcMwfRnbMatMgjuqlU+tjbBrl8LJEbq
         X+6+ycLYiFAQOmKldjWEW+4mE99wwc8RcxWFB5olRoYiUsJsZcdTk/xMlPlKasXgOkv8
         uTfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7T9Um94HrHZpxL/XC04ZqiHovRZjywl05MSw29K/wayQWlaVypdzUqMinNNXl/5C+fFUM@lists.linux.dev
X-Gm-Message-State: AFuF++kuUKuWWUSbbE7S5oyVCNVA8zaeoKIG7luSJM1hE8++audPk+6K
	2P/wVEdcd6ahk0zoswU0/uaTAkZvdcr+Cwa/Wh3DJvAShhh6b08KZ6JgSuq+ntnr9T4oXw==
X-Gm-Gg: AYBFou3bmc6K7cAqw8i6wEzWFWECGhngb9MuOihZXNzP2SpRZ3UcpkSeib5DNOesyUs
	QHRkOwfxUmus31mJujFIyGwnsbyZ/DGTLouI5G/tH5rzu/+dD0+j0fK/JzwBQOLoGQuwU0KpY9K
	8TDaihg8SZzvIiadzCzPD6vX3AYwZ0JINEaelyPTI7AQrd9XQeS3TcBVQj791wI20Lbp2TWvf2Y
	8RIrCf/988U+eeWKCDUwhdgxB7ydhcl1MCfAh9uyd8i37bGCSbPn/uGbEI+44DD1GYcZOtIuayT
	J2UtUGtHyhIJ73CZaYLWPnqZI7/znFQvDkF9HoI1lTKGvIU+EaAQR3rXP9Fy7DdYWYufyuWAozd
	Q5PmKEAUNoC83nS39MTsdXLokhyb2NuwmnWdF/cJlP6RhABRZKCDsQAMGkWpnZx9Vcleq1pEZA4
	pXsahuP+DcE2AJcFVoqTWMdHXg+DnhMR/vfNitodNJoCHWH5dNVr8JAwSPVS/sW6enIVLw4wye7
	sTquA/slbcgK2zfhOCBkHHRRutiIjYBaCbqZvnBPKytnIo1vK2ndiqT6JFg4B71vJOaBaiPljHY
	rUY4AK5F0y+L6TD5qFalfCow8GKXimZAL0I9VCeBDojZXB6xq9ZiRfcscg9hvgYHyYfkAA==
X-Received: by 2002:a05:6a00:409a:b0:880:fd80:d629 with SMTP id d2e1a72fcca58-88af58d4ddbmr6837436b3a.22.1791107775821;
        Sun, 04 Oct 2026 02:56:15 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm2418175b3a.28.2026.10.04.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:56:15 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] ntfs: set the attribute list size before reserving space for it
Date: Sun,  4 Oct 2026 17:56:05 +0800
Message-ID: <f95082ee39faa2600158c7f66fbeb0506ad56d80.1791107674.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1791107674.git.matthias.goergens@gmail.com>
References: <cover.1791107674.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_attrlist_update_locked() resizes the attribute list and then, for
$MFT, tries to reserve the maximum list size.  When that allocation
fails with -ENOSPC it falls back to ntfs_attrlist_repack(), which reads
the list through ntfs_inode_attr_pread().  The read stops at i_size,
but i_size is only updated after the reserve, so when the list has just
grown the repack gets a short read and returns -EIO.  Only -ENOSPC from
the reserve is ignored, so the -EIO fails the $MFT extension and with
it the file creation that needed a new mft record.

On a 32 MiB volume with 512-byte clusters whose $MFT has a non-resident
attribute list, 591 of 1500 creations of empty files succeed and the
rest fail with EIO while 742 KiB is still free:

  ntfs: (device vda): ntfs_attrlist_update_locked(): Failed to reserve attribute list space
  ntfs: Failed add attr entry to attrlist
  ntfs: MP update failed
  ntfs: (device vda): ntfs_mft_record_alloc(): Failed to extend mft data allocation.

Update i_size as soon as the list has been resized.  File creation then
goes on until the volume is full and fails with ENOSPC.

Fixes: b1d732e62a5b ("ntfs: repack $MFT/$ATTRIBUTE LIST")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
The volume is frag.img from
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-mft-runlist
(mft-bootstrap/frag.img.xz); creating empty files on it until one fails
is enough.  Tested with KASAN and lockdep: after the patch the files
written before the volume filled read back intact after a remount, and
ntfsfix and ntfsresize --info find nothing wrong with the image.
---
 fs/ntfs/attrlist.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index 3660e7fd24b1..6edd5d2d9bf2 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -256,6 +256,9 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 		return err;
 	}
 
+	/* ntfs_attrlist_repack() below reads the list up to i_size. */
+	i_size_write(attr_vi, base_ni->attr_list_size);
+
 	/*
 	 * Reserve the maximum legal list size while the MFT metadata area is
 	 * still easy to allocate contiguously. This prevents a later list entry
@@ -283,8 +286,6 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 		}
 	}
 
-	i_size_write(attr_vi, base_ni->attr_list_size);
-
 	if (NInoNonResident(attr_ni) && !NInoAttrListNonResident(base_ni))
 		NInoSetAttrListNonResident(base_ni);
 
-- 
2.56.0

