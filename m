Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5952472A6
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 03:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740127; cv=none; b=ow0dk684dAML3pIA301zpT/tZwT5FkXlVVgoA68aku+9y69jX8a13GNM8yEnGDe+VKSvaNlKULH9cI/MfZx1FHtv/7YM/hdgojkEPC/f/ROTG7sjFcflDfE6XSUR8gpuLpwnxr36spNyVRekFIMKX6+oaohF/L//hrNFY+LRN8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740127; c=relaxed/simple;
	bh=ilYJIEFaKeXFHSbhkKu4EF4bAHsuP9d4TPnsAicmIGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TH1sUFtXTDdaGEfK/NV1KLjYK6bMxPq3suXFFBlmNJAehaTacCcQbsgd7WxQ26+jtnrZYgxudj8k9x86FYhjYtYu7/2cGdPRB+ECQFaskMVzhnXuJr1KbHaDNtdLBWofTpWGm+PzZbdNUCMpzRaua5vGez+01wUvSzYgsjetWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4yjczB3; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4yjczB3"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f38so21777965ad.2
        for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 20:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740125; x=1791344925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNTCOzpKxH+d7l2G2l79XMw+UFAGnoXC8Vf1ACPpqxE=;
        b=C4yjczB3OvbB+qncPsnu1YGIqdtsv7dRpGd1HMfVCr1Q2MK9O8cZMhIRvbjy/oDc1I
         mRVmGcDl/IgvQm9HAZL8bNo696YB7W+IJWfkHaxotdgUVnZex4bS65tAV5Bh7Ro3hWYa
         dmqOjSokYT7g1ctT4p4/qpFnf5DCYsPpx/txRAAqzBoCC6cNWsmBNnXS1AZhBSe1bdNj
         MYZMAv348OoP2hsgIw0YOXY5Oqt77QWge88MPV+xW/e9n+ndsvB3FLfw6xVZeipMu5sL
         GwTerx/RAmWjeTv78nBR9BNwTsPZMSeRWh9ID4LXHlHTtjYfcqs3sgBYWDlZELJgEeJZ
         SZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740125; x=1791344925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNTCOzpKxH+d7l2G2l79XMw+UFAGnoXC8Vf1ACPpqxE=;
        b=zPLIh5iabdvoHNKP0D7in2WzXj6G05KCbG36/gSe+gF61fuF5nACgF8Q1VSB/27xjZ
         mEN8az1Tqn2LI+ijjCasB/mzkGQYXS9u0xtFYjMFEk9KMPMH36uiXTy9YQqoPx9VF0Ly
         cR5Hd0ElbOFgnwE2l32J+58NPhT0A4lN0iJV9u7Dar36kvi5eynV5cVc2FbYWtQ0W3Xb
         nlB839f+2r1KR7M8Zn6WIYR2jsZc7TNcBgTyR3bsdhlvTXxBakusc42RbEbbTOxbXNrU
         rD3MsMawdhGNERf/vsbPcLimBqPbyLVHbmgq0owgJGXC0he4Zeqkrfl2bj0n1qiBwjxy
         +bWA==
X-Forwarded-Encrypted: i=1; AKwUvBxxlcHEAHbxwlsBLJMMnoWYPjozGTqJxy728M5r6tIgsb3C+WuMRkQfsCE8w0sZso0oNL4F@lists.linux.dev
X-Gm-Message-State: AFq9FYJqdTRJRSX404ShGr/hgewD1vdgUW6E8P0aLhLL0MLjTto2Oy3t
	HFwUUOFMMvxwdRCcmk3zVurhnmk3L5lNuwYYhucLuv6WEgvlHQDh2FFn
X-Gm-Gg: AYBFou1cjCLKpcC8FxTseil9OX8XmYOZu/vZ4FYPOLPrGGMJFm7PEXeC+06Tj/1fNLY
	/b+zivwuaLrECKMyd75WBphqa0xI6lV+L5DsIstUx7bVT/rlxvDoNtQeus7W9YSK54CtRxxWggs
	tsftD10Zc42CTBOozvmgYaBb7WOxbj+GIV/HjF+243jpQ3lhTKCx04FKqjfngFAbdXdezxpn2O7
	98WIlwz634pC3Aw6rgY+bKEU9D/1VH6UwZ14gNdtXcqaUIPn/kfGEqnqU6Job2LiiTQ6eYMZLjC
	zQvnwgMHROLjEIz8xaIEK3l/qZm/ib/Dko2l3UyoGrCe5ny6SqngueoGzTjII/GklfnADC5cp6A
	5ooPvGXgYVSxwiOhQaRV3r8x5+pyxm31YwRMFNj8iXqSr4s8NgkHP/V7UGIbbuVFLa9mo7NB8pv
	jXxKW6+xz5nYf8iaQzrQYCxfXJ4/NYliE64LqcDQB1uWBqhaNOyNxjQUCHn9xN2HzVVDkSrDTZA
	muwcqzgZHphypCYpHEMTWt6HiDjKZnjGf/uVUSI4rKZmtdKQH53UOd7dv7wnggvAenmJZ8+jlNw
	e2w6orP/kX9KxqfT64YyyYL+l9BWNl0+eRnjEaSdBuqVtECMZL/FVY/01aU=
X-Received: by 2002:a17:903:2f87:b0:2dd:c100:7cc7 with SMTP id d9443c01a7336-2e2e4b2eccdmr1329455ad.67.1790740125094;
        Tue, 29 Sep 2026 20:48:45 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:44 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] ntfs: fail the mount when $MFT needs its own extent records
Date: Wed, 30 Sep 2026 11:48:32 +0800
Message-ID: <93db42d097a460fd089106521ad806ecda33bbb1.1790684177.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790684177.git.matthias.goergens@gmail.com>
References: <cover.1790684177.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mounting a crafted image hangs the mount process forever, unkillable at
0% CPU.  Only the hung-task detector reports it:

  INFO: task mount:74 blocked in I/O wait for more than 30 seconds.

  folio_wait_bit_common      <- waits forever
  filemap_read_folio
  map_mft_record_folio
  map_mft_record
  ntfs_map_runlist_nolock
  ntfs_attr_vcn_to_rl
  __ntfs_read_iomap_begin
  iomap_read_folio
  ntfs_read_folio            <- already holds that folio's lock
  ntfs_read_inode_mount
  ntfs_fill_super

ntfs_read_inode_mount() assembles $MFT's runlist one $DATA extent at a
time, hoping, as its comment says, that it never needs a part of $MFT it
has not decoded yet.  If $MFT's attribute list puts one of its
attributes or later $DATA extents in an extent record outside the
runlist decoded so far, reading that record re-enters
ntfs_map_runlist_nolock() for $MFT.  Depending on the layout, that waits
on the folio lock it already holds, as above, blocks on $MFT's runlist
lock, or dereferences NULL in map_extent_mft_record().

Mark the volume for the whole $DATA enumeration and have
ntfs_map_runlist_nolock() refuse $MFT with -EIO while the mark is set.
The enumeration decodes each extent itself with
ntfs_mapping_pairs_decompress(), so it does not need that path.

A validly placed record can trip the check too.  The driver puts an
extent record for $MFT's own mapping pairs before the first vcn it
describes, but with clusters smaller than a page, the folio holding it
can still run past the decoded runlist.  An unpatched kernel hangs on
that layout as well; with the check the mount fails.  The check then
refuses only the folio's tail, so this patch needs "ntfs: do not map an
unmappable runlist fragment as a hole": without it the tail is
zero-filled and the mount serves an all-zero mft record.  The mount now
fails instead of hanging:

  ntfs: (device vda): ntfs_map_runlist_nolock(): $MFT needs its own
    extent records to describe itself; cannot mount.

Tested under qemu with KASAN, PROVE_LOCKING and the hung-task detector
on ntfs-next, with and without the whole series: six crafted images
that hang or crash an unpatched kernel fail to mount with the series,
and nine images that mount without it still mount, three of them with
the same file listing and contents, among them a volume written by
ntfs-3g whose $MFT has its $DATA in three extent records.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/attrib.c | 11 +++++++++++
 fs/ntfs/inode.c  |  9 +++++++++
 fs/ntfs/volume.h |  3 +++
 3 files changed, 23 insertions(+)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 5f5a91265af5e..2e72cd816d04f 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -103,6 +103,17 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 		base_ni = ni;
 	else
 		base_ni = ni->ext.base_ntfs_ino;
+	/*
+	 * ntfs_read_inode_mount() builds $MFT's runlist itself, so nothing
+	 * should reach here for $MFT.  A crafted image can: the read that
+	 * gets here already holds the $MFT folio lock it would wait on.
+	 */
+	if (unlikely(NVolMftBootstrap(ni->vol) &&
+		     base_ni == NTFS_I(ni->vol->mft_ino))) {
+		ntfs_error(ni->vol->sb,
+			   "$MFT needs its own extent records to describe itself; cannot mount.");
+		return -EIO;
+	}
 	if (!ctx) {
 		ctx_is_temporary = ctx_needs_reset = true;
 		m = map_mft_record(base_ni);
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 9583b2c6c7a26..a61f1519549cb 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2080,6 +2080,11 @@ int ntfs_read_inode_mount(struct inode *vi)
 	/* Now load all attribute extents. */
 	a = NULL;
 	next_vcn = last_vcn = highest_vcn = 0;
+	/*
+	 * Reading one of $MFT's own extent records in this loop can re-enter
+	 * ntfs_map_runlist_nolock() for $MFT; see the check there.
+	 */
+	NVolSetMftBootstrap(vol);
 	while (!(err = ntfs_attr_lookup(AT_DATA, NULL, 0, 0, next_vcn, NULL, 0,
 			ctx))) {
 		struct runlist_element *nrl;
@@ -2162,6 +2167,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 			err = ntfs_read_locked_inode(vi);
 			if (err) {
 				ntfs_error(sb, "ntfs_read_inode() of $MFT failed.\n");
+				NVolClearMftBootstrap(vol);
 				ntfs_attr_put_search_ctx(ctx);
 				/* Revert to the safe super operations. */
 				kfree(m);
@@ -2195,6 +2201,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 			goto put_err_out;
 		}
 	}
+	NVolClearMftBootstrap(vol);
 	if (err != -ENOENT) {
 		ntfs_error(sb, "Failed to lookup $MFT/$DATA attribute extent. Run chkdsk.\n");
 		goto put_err_out;
@@ -2229,6 +2236,8 @@ int ntfs_read_inode_mount(struct inode *vi)
 put_err_out:
 	ntfs_attr_put_search_ctx(ctx);
 err_out:
+	/* Also reached from inside the $DATA loop. */
+	NVolClearMftBootstrap(vol);
 	ntfs_error(sb, "Failed. Marking inode as bad.");
 	kfree(m);
 	return -1;
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index fdb57279de84c..0473b602084c5 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -194,6 +194,7 @@ struct ntfs_volume {
  * NV_Discard			Issue discard/TRIM commands for freed clusters.
  * NV_DisableSparse		Disable creation of sparse regions.
  * NV_NativeSymlinkRel		Translate absolute Windows reparse targets (native_symlink=rel).
+ * NV_MftBootstrap		Mount is still assembling $MFT's own runlist.
  */
 enum {
 	NV_Errors,
@@ -214,6 +215,7 @@ enum {
 	NV_DisableSparse,
 	NV_NativeSymlinkRel,
 	NV_SymlinkNative,
+	NV_MftBootstrap,
 };
 
 /*
@@ -253,6 +255,7 @@ DEFINE_NVOL_BIT_OPS(Discard)
 DEFINE_NVOL_BIT_OPS(DisableSparse)
 DEFINE_NVOL_BIT_OPS(NativeSymlinkRel)
 DEFINE_NVOL_BIT_OPS(SymlinkNative)
+DEFINE_NVOL_BIT_OPS(MftBootstrap)
 
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
-- 
2.55.0

