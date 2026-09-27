Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D343D413F
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506649; cv=none; b=BltgfOuG4ghVRMpcPKHDingaGtOgt/wcdSCWb959+JQ2/EkXHRBbKssbcRzv35AO5Yv3RYVBrrI+lERLnkSIBVChlv5X8cJuXAU0oJPCRgoun6Px9kIYr53EmqJ2jLRpjPn0Ami1xJWzTCBuywEL7bCcKIZYfSZAII6FzC6l2CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506649; c=relaxed/simple;
	bh=j50b6HFpY691xsWjBZr7qmgD/1Uyyqi+7/IqWm3vVTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tw2leEY0siDobcHo/CNUjIKlozEA/CgajNw5hRFYPi+PZpV2tIK+5wy70NXB0bJOdWEjNDVKzJAkEqIdoBS56bSOe6HR08Zv2a8oIy6ZGh+D7B3Hj97HLKdJibk9QSzqa9l8hKJEx5l8htB9sMS+iy7SfDuacFHUB7F+Qxkhai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ex9CI34s; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ex9CI34s"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bcdf41a3so1045882a91.2
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 03:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506640; x=1791111440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qM1QolBILO9M6t8Cy7bQUCoiUPwrfyFsHodEhUYmYb8=;
        b=Ex9CI34sC+43FHgtVcCtSGPsjixdO9zNq2N7nz84n0UxP7SEYdO7MKvmfpp6BBVXs8
         Ue4X7zEXVcQFFnV4YS+HWTkoXPh9WrvEb4Ct+HDW5qWZzZ9mvpn6Bob9SD3jMmXRlbQ+
         m9INU52o2htWJO67gPwHmgF1FSyr6kA4KA6Pakr3swwA6AtZD64mM+VLeYTva/ieXK18
         +RKUA6SLgPhd4Ih0OnKJSCFhZPa4/9i9gBAYNCYR99kvz6sVqRsmyKtac0V+8eDFxuhz
         EnQ4LVKxd4pGq9nEYB/3Jym9mwodzGXGofkNjjcCUzJh0DEbHFz//YchkLIzu4z1qr3u
         lXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506640; x=1791111440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qM1QolBILO9M6t8Cy7bQUCoiUPwrfyFsHodEhUYmYb8=;
        b=EoasTcfemdyjZUdUb4xSvKDCgM+vraxYvtfKOTFan1NgOu+DhStmzwcpQgkZKhrLJx
         kEySRYJWhVTOAqH97IXyrgfXh5WsYGg5vOsn7ZfCkTDlFZPVpw26J7yMDcHqZZR6eoXr
         EBK5wKZhLUTuLLsvom/dpQFjs55hNVr5OhsI5vGii98sstJq9M3y3XAWiX2xAJhhFFlh
         iNPxW5zOZ3kYRiCc8xpcTZM+A23UMWhcqQsYnbUGy3LkDodP3u56YI35DI1NDxrLBr+G
         VaFFy8ooQGcrVjcp6Q3DpDVZ01lw7g8RRWcwW5aU6V/QTgFXRSZj7JIp8ziM5qVqnbi+
         pItQ==
X-Gm-Message-State: AFq9FYIQBGraP8QR3EXWITOerkgcvCGDoDH51GPKALbOJmWiFXJK4i4J
	4P/tGQ3TmXpJ1zBbtETBkBiIAoOJwbXUB1nUXjhEDFA/82w3UTCqk3U2a3EcY+cctoKmwg==
X-Gm-Gg: AYBFou23+vtMuVWJnZ4Ly1Rlqb+E74/5ZgiiKpk1c+/HC1NSj6VdHUtZeLy/0F5rzar
	mgEpyrpLuyvZczmq8NWsejq8zefqOmLozLPc7eW+0oTJfmqeltLj/DxI63VrmMB0eK10mvNG5vz
	0S1hc3VKk1nzSvf2AVCC85wXtR/qrFT6lhXOblazHqhog20lDF9Gd4i/74oHQ5ND1SWzxefBCMy
	J3Fzh/UQQgThDKrWNBeMAzgpLu0AofKX1valUVrR1bz9/K7VsDGQrCiQhk0ghiei5kIx88V2xlx
	2BuvIgiOCiOl8MUxEYmWkycfCvAEPoVWKOXGe+V6PwXQBfdGc4XnqEQwMq0G3f4mKMjl/wNcsYX
	3nrGwY/T+Oi62rEqR1lQfdHGdOREuZ+j5g/kgakE57kT41LLfnzGcD+JOkF1msbInjPGEqdQJFv
	zaotTJkRvvk9UC+xBUBBUwyfpo0J4FOSCWO0q2FV+eeWoljpMGuFE5lgSlQsxgDg0paGLI3fV3n
	WuPII6CPURVz8fD/kk7VcFuaLOQyAQHmyRtZKYZk1KMbAAaZ2vke9/SXQPyt9NHdv9Ivq/nGVas
	JYMsgvCNBOjBeDRo/JSXf8UNxlbRjfpdwZrigPNY1ieO5paJl0yX8K4BPuw=
X-Received: by 2002:a17:90b:51c2:b0:3a0:deda:3d07 with SMTP id 98e67ed59e1d1-3a0deda3ff1mr3267462a91.14.1790506639701;
        Sun, 27 Sep 2026 03:57:19 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5220sm14419192a91.16.2026.09.27.03.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:19 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ntfs: set the attribute list size before reserving space for it
Date: Sun, 27 Sep 2026 18:57:12 +0800
Message-ID: <a3db61194cd4c2a472963aa6d9e9563ceb8efd33.1790503811.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790503811.git.matthias.goergens@gmail.com>
References: <cover.1790503811.git.matthias.goergens@gmail.com>
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
index 1bbd2bc62c582..62dfb96e31a3c 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -252,6 +252,9 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 		return err;
 	}
 
+	/* ntfs_attrlist_repack() below reads the list up to i_size. */
+	i_size_write(attr_vi, base_ni->attr_list_size);
+
 	/*
 	 * Reserve the maximum legal list size while the MFT metadata area is
 	 * still easy to allocate contiguously. This prevents a later list entry
@@ -279,8 +282,6 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 		}
 	}
 
-	i_size_write(attr_vi, base_ni->attr_list_size);
-
 	if (NInoNonResident(attr_ni) && !NInoAttrListNonResident(base_ni))
 		NInoSetAttrListNonResident(base_ni);
 
-- 
2.55.0

