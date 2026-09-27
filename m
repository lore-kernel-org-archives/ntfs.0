Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891CB3A5421
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 05:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485719; cv=none; b=cnGg2M8fPLs0mcLbsminCFSb4rpzhnwtA4btDp836YuFy65mHaxkDTK8fXJ4eMxIUbg70az17ks3JVFGMedCiH1+Tblf9CbXKzuVCnKgPHjWQ8NOEg8/VCzrjLMptXOvGemBzNlooSabAoPs2HybMpcJUbPSuKJjrcSGE4CfYHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485719; c=relaxed/simple;
	bh=VwFLvYKsJzscPanK7T8iwvb3utgq+eA4nnAP3ul+4TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8BPcjA7Z8Yn/tLTvUwRB4HKjcLgmLUnuT7RsPvejZRLLVIzblCqW7owUB1krtHRJEaOuZDd2gXqU8/fIznGjcQWgtlpNx4fJhiIGbD4puKXT5iLND0h9eD8zkOClNdgnoyscRgN0fxzlyz+9u/BgTr2/xmsqjlwa1+JynvdaOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpWIt2oT; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpWIt2oT"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb65437so1165632a91.3
        for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 22:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485717; x=1791090517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ed0UOtl4W0jokNIthkI+uQMuk4LnWAdg3ee5pXHMshA=;
        b=UpWIt2oTa5cfUxcbJ06+Pbtqxs2PzoM6b/m87GjkYnaiP4bYPwKc3Tk70RSyHHfWO+
         ODnqVIqTTiO2sy3KBP6Cz4H645dEt2YBPE8Vao7sl47hJNwuxH3oOubJqA0FTn5U4KTY
         L/PnE6BaCe4LYKStbqlaSUe+rGNsvZE9tAfrdFamX5oSm5hH/U+YN73hJMnSR/0c4vUH
         amYOkHPIatOY/vsanDQjt17viG2hFWB821DMkLPY94kAi8rk3l9GTlNFRAwIKN8dQLg8
         GFwEdIiii9YnjcvM3P4SK6GWRF05P1a2cYkmD6NvNrSMoAAVvSv6eChwr2929Ln4Kv4V
         bQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485717; x=1791090517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ed0UOtl4W0jokNIthkI+uQMuk4LnWAdg3ee5pXHMshA=;
        b=AMuYNtt0OI+ei8xwXWSbZfzs1+qur7vXYOfKOaYZNT+hbpULMNSRCd6nTOAfjjtpTJ
         axpelVn1UH63TEnM4tbt+0eSln1445kgJs3cmlXeFOHDZWUWwL2NCTdg7ebHB97AJMp4
         IUps1Ut4ZpamzlV/rFZDC5kzI8Lx77a5jzA9REFFT+I7bo2T2x9nKDSgvUG0wZnriL83
         QfkZepUssMDtbc+4/5wTs2TwBtt3Xhi9t8Lg1n8sFq7Hmhpy259wyl5ygRuO1CkuP4YE
         CeTcsCr5BMF4XDLRXaC6MW7hKb7eH1fmNGVt8Q3E6SF4zY9zE36WHJoOvaQqjn5G3JH7
         xHcw==
X-Gm-Message-State: AFq9FYJsU1a/FW30ylRjU1DEPIUzKUyJchIjIl/QvKo1bzkpwDlyWrVe
	u5AuTd7TAsYhY5Pt6MGKWOuVqYF/Wbpkw+UofM90bhHDVa5/wsjTAQApboUJE3MMl0HRpA==
X-Gm-Gg: AYBFou1cTs0cGJWVrCNCEJ/Y0agWM5Wsq33ejz3Yg0Sxt9moWQjpJut5K51ESVThX+B
	FcPXm/86AM/3vkZbljOQOspVp6FZ0MPQCqZ4sc0vH2tB3ZSHKC0QfQ3r5s1FbE4MA1o+rO/Lmk5
	WnwmEk9zuF90UVZj62qLGztCEsF1UfVX4pI8vqk0uVIFs/TILWejcz1oYHWIQ9dBEVcwEb7re3H
	vP0Exkdrllat2dfKJTzI2kuO3CZJYpj4XG51j98J1c3GYsjOFM2Nf28vsjxsivH3ymcS7IeWv7F
	ZKgtuSejfeOCLQ2OB5xhvJrco52eZ0oZxRmXe97wC21lyA30sF8Mzjvw49dXBwS98IDZEf2pJcF
	grIEDLvF61MjYs35mtq76A4Fab3P8y89sfL+t78TPoQ8LtOS2hOgq2n54GlBFIVgdw+cYBk3ZDz
	VB7XO8IwxiRmB9b6ICcCUJDEINoTTh0tdd5pqNS49bBptbhH9YKAbFJIc+uZEvs91Ryvf45kXPN
	H8b+6XCqDZF3sM5bAD8nmg0D8fjQtnmkDjnSsdmN91v+AWir9H7H6DLRoASE75hnBRluVRbV1LJ
	G8fwcRfEfeBUYIZb3SCRtay7eT1fsukqerfRCF9l3qULoTXXpf+LNbBiQ9U=
X-Received: by 2002:a17:903:19e3:b0:2dd:c053:d73e with SMTP id d9443c01a7336-2df7dc3880bmr76790815ad.37.1790485716634;
        Sat, 26 Sep 2026 22:08:36 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:36 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] ntfs: fail the mount when $MFT needs its own extent records
Date: Sun, 27 Sep 2026 13:08:22 +0800
Message-ID: <20260927050831.2739166-3-matthias.goergens@gmail.com>
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
index a337a3429b401..eab4d8d32132f 100644
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

