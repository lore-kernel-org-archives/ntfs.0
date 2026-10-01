Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763C451EE15
	for <ntfs@lists.linux.dev>; Thu,  1 Oct 2026 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866187; cv=none; b=FN5gHcLaVmbraYWyBUd92CuLDWSyWrzXPlDekftd191UAMidqM1MdV4yepDIO3bNyN3ycHoAguFr5N4aLUvZ8r9esbWgaaw7Do8yqdQMzGAF4M+pwCTY3yIsbrp5GonmzlgRpx4wmwN/1MMx1ycCufrlnNYOxs2P1HBLzKqgGI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866187; c=relaxed/simple;
	bh=od5UOGqE7GtEqrYf/tsxbzP7F5YC9LcKKBOi7OU84K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7X9qj2Q6NCzERDSsEcDbkL/6SSmdzR23m+xE4fH3pFLoZnX39JJXLVN6OAdhOhbOVUSh7tI7Hh5bFAAyKnSKqrcL7EtBhA/5xTUaqra3hQcYNCvfdGcON62RkWYFlt48sHzKseLhH/amWTbDEay6XbgzTkqyC7VDce4Hmf7hJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S65+2eis; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S65+2eis"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db710396ffso2850205ad.1
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 07:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866185; x=1791470985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RW0gC8Xa864mcCPKJ6lllOafsP+DDzzv6dxQC9lX8Ik=;
        b=S65+2eisjuKV1U8nypJgXuwbsU33midQTnHYpEXVGID5+UZq5BETX3/8C6uM1Yd3NI
         YLEQTKL8usQKC3g0itB/qWSTJK1nuZmfPetVyisWJDMXL+SzjAesbpCYPzQXJR7hYy8A
         rofT/bhgVGrzwmspghPHj7WninLcd0xP2JNVacORnCSvy81Fg4rqVHP2iZJivvwVWBWF
         dIg14NJ5/b0wKFGTbcku2cZqLJZh9a1edYQ9QBmTAHrUvVVPB8LSYLbDVzycOLBYodnv
         rORvA6XDJhoCJoehN0B7t65f1DW53Wq6ron+gfUj1KKgaSM5SGOKyjpdqDGAL4eeeCNr
         BHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866185; x=1791470985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RW0gC8Xa864mcCPKJ6lllOafsP+DDzzv6dxQC9lX8Ik=;
        b=vWyNvt4RCv5/vZENjxHm9tpDXi7Mnf5GRK7ZGuWx3Du93DjM1+tBPxu1kAjQDWejmy
         7/fzRCRMNEerSONc4QTCR4pXfXN/Ii63bfUqgccPeAehI6e/kN+JGK9SmqYf6ZfwiRML
         /KF0bSj1j7AJWf7XuEKK35ZVwdM0wxKxNvsym3iNoSICp6H5ilqclAI3yT9R6r7isV+Y
         xhWQunrmo2l/3TjM70FoAfWe9X89WQvHDWITQbmFAHoTPp2/Kbzq4+WyzA/rh4FNAcGY
         2ZXqg3ykXGoFT6DCZ5MiBEWyWmHnyT/Oei+lXV6KRtYrusWenoAi6Pk0sRWIsMy1umSZ
         kqSw==
X-Forwarded-Encrypted: i=1; AKwUvBz1qy17YuxZFq9GU5hOR5tRg0pT0I9FniOeI+MjEx9Ob9rAe9x+KVhgBAW62j9NbZNhNCnQ@lists.linux.dev
X-Gm-Message-State: AFuF++m20otxJlC4B1gKiRI55TrGxiqxYdy3Z3L6e13Rgme7Ab9UkD5I
	rYf3QxasnwabfwjrfzCVHi6x+cbUFWlS2eO6IV06WX2BeSS53BDyjNtg
X-Gm-Gg: AYBFou3cLNoH6rueMINSwVBNB0pRlPtxEgkF62E4y2NJc2CBefJROQZ7SsyS6+Am7fw
	X2MIwFEey3ZejM8jBn3fffc7SlTCvq318WB+/odwUj76AbZFAjjIlbzWPr6rQGUplosdZwbwY2h
	t0Qd2ZZVCGgyARFu3vqMFSbY5PR+/q+SJNuLBss78Rni6qNk8xGhD90+MMmt0fVrADViFAKsXvn
	+WYZCTkVN224DoVvKzng7anRoKyZ81CVeEBSznhyhRbqYlYWewM34+SENUP73M2wbLjzJKdk0ih
	B3KoW0nZizqmbDRBVtaTs+g3mg+u+m3JdRZ3P6PMzY9OJr32e1Yl+ZXJ8BiTN1q2e/3xC1SuZrA
	opDBYvSfC2M7n7por+qbJWTiEubGG9MwJ7Ql6z6/96S8IGGmpmd0bmDG7dJO2hF4H8RxyJV4e+I
	Y8SMHNjbRW9sOuabtHBdLo6p5bG68Fsc93ZdqrPqLGxjqlJLbiXcDTZuxsF/w0S1zAWaRZCGhxi
	gMnX9n0dwBCDNa+8xE9a/MwNUFVcqLIlAB0O8XNF3xQ1pehu9+qJGl1KBmTxrZDE7y0Iwj4Kcev
	22XVRtKe4NWdbC/ATjOlUjSBsHOjliWwYuTXfs1sGSdJWVai7QAOYUJmTQE=
X-Received: by 2002:a17:902:cf41:b0:2df:b675:22c5 with SMTP id d9443c01a7336-2e2ff199cd2mr18864605ad.0.1790866184464;
        Thu, 01 Oct 2026 07:49:44 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e317cd0624sm6636775ad.30.2026.10.01.07.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:49:44 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	liubaolin <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] ntfs: set the attribute list size before reserving space for it
Date: Thu,  1 Oct 2026 22:49:36 +0800
Message-ID: <4923ad1070694beb1b6ee07c07cfb0a38015883d.1790853718.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1790853718.git.matthias.goergens@gmail.com>
References: <cover.1790853718.git.matthias.goergens@gmail.com>
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

