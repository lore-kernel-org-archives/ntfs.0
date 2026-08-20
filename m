Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5269319F115
	for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 05:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787204984; cv=none; b=YxANNi7skUrdIR6bG3fMQUjyuMcWwZysv0qSY9hIkfVva3WxJTGMM0Du2FHvo3YkvUjPsdy/+MvCGGLaDf8PhEzvfnc6+PR5Ij4kfb7FEHYKMEZb0dySq3nGLN2vI2vNyxQNpMLFUhauVHTeejzF4dXShfO2M90tihvhZ0xr8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787204984; c=relaxed/simple;
	bh=RcUnZ8bJFYZR1Fooy9aOzukcPRTXY5z2l/khc2t+xCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pMQHGUy4raLuozAxk/7Gjh2rGPLU07GGPIGeC0NWdVM4TINuyh7ctIwl82bA679J2bxik8o3gCis9FQr+oxyYNw6Kcs0U4bcokko/SXBzRXjtfDyzEoUXLp8XMrV71GEhEl+oAdL9jis1N0P+YHlhxwiDB2pCO0XS5n6xdRzcGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTNsFJr0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTNsFJr0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc61541f8cso6696295ad.0
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 22:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787204982; x=1787809782; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EKhX0mlhzl4UH5sPFFS9et1hkPwhijj7k8EEd7+S6/g=;
        b=UTNsFJr0XXGc2jkuQpkqi4bMoHDzlP3z+tKxzWbPiPFF4PX35vfv6e0A0Xckmpxoib
         k69J0jnjtOiH6+JpfdHSOxL8MZEm20i2ykKK8QxzoFIsDsX+IKwAkiek1UwV5gTCCGNR
         /bv8taFrtl13TpRJv8KQSxjYPpINXex8kIsWyMf3kPGSWTV/WNNGFt0gL36s/FRCcTZz
         jReuJDKKWYhsTY7AeSpWgk0n/C/KkearfTWB4SKrK706BuM11rNC7eqehcpMWW9d5ULu
         RkdC98HZDnQb04Qos3pBvkTgpUVjRFgAIW1wAwG4O+d/hK+MW0dbJMV9B1p+jGcDDeQD
         fegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204982; x=1787809782;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKhX0mlhzl4UH5sPFFS9et1hkPwhijj7k8EEd7+S6/g=;
        b=g+KWLB5NRJLqN3YYwDegH934JXAEe34WoEz9dXqlr1fPtem+0byRNZMTb5DQv902yB
         gND7+k2BLsm4tZYfhHKWsk0hAzgizylJ2TPGypRCURdoRc+m+R9dPo00XxnNtZDVnNMw
         yaCR0lW6/2F9q77EExZMiDULKQv0/dKjcZDePaxFwTX8mTqU7iSHLv8WYkZlhYDiU9u9
         +WAAZP0zyL+YLvK2Z/Ld6Ru5aggRH8s6iAAgKXFlTSC80ralWgKRE/AqTl5DDauItwKQ
         leFoPduZm8xXfH6Rl+wiV9AbGxRJ8hLBGCUhCM2BO2Pi0EsohK3X6FNQFDaXxjA+8V8h
         d6fw==
X-Forwarded-Encrypted: i=1; AHgh+RrAEI7N2IkxDbSABlDThg3kUBxYki6Uoc8hLTbFLT/g0gtIk7d3Lh1/wXo7/gkt5QPtEeC/@lists.linux.dev
X-Gm-Message-State: AFuF++m1/TP2ijCeRq6Oxa2YoRxzi5Pn/aTC0YgUSrFuPwUWIkjtljln
	p8r8aVd0XnAsPb/NsUHNNBzXKu8hBnZI/AwkLOriJaLrYxmXeL+APAoR
X-Gm-Gg: AR+sD10OEh+Lb/zgEJnpIyLliXKObbMXYZYWerRD3XAO0wKHTSeC/4cQ3GdzXJRuhMU
	nrM9zDIOM1KzBgMe2YnTV8H/8wlgPr4jSrIoGf0tPL6G3vwpoTLeLfRM306okevvAjQyqeEN41V
	fNdCp7pq6vjR5rrWxa5hF+VaRdDkqFBM9kATwqzZUMkvtTphdW0OOgrT/Cjh3QvRjCeKV37FDYi
	lrbDcE8tTRba5HDs/eLA6E8A7FHQR9AUPPWAB/ZZEKcGX166Kh/JZT+x5qZPJgflL11gesZ4aOH
	qQI5bc2ch5guB9JzOVwo1YZ0Jpnw4uAwmns08m+FsGzFGbHkHRN6p2ztXcfdFzbGTWwptTaxp3S
	7IWcA7EyTNbZU54c1x/Qv2YulBJeGawbso1o/CLFIGj5TFXj9zz0llsfXcwl+V3PbEy9jj4AJuo
	DrovaBUpDAt7IsBhsOZSsPhJA+oh/1dssU1C7vyjAHYSRzryxdh7CKr6M8OVkESCj6JOg=
X-Received: by 2002:a17:90b:5846:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-395a00e4cdfmr4483540a91.0.1787204982476;
        Wed, 19 Aug 2026 22:49:42 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395b66bccf5sm106766a91.2.2026.08.19.22.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:49:41 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 5/9] ntfs: parse REPARSE_TAG_WOF
Date: Thu, 20 Aug 2026 14:48:18 +0900
Message-ID: <20260820-topic-wof-v2-v3-5-ef6149b4541e@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
References: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7248; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=RcUnZ8bJFYZR1Fooy9aOzukcPRTXY5z2l/khc2t+xCs=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhpUMiAjoc3xuaYDWbnYHv/M3fBMlF4zr1xhMG
 9vsaAgSrD6JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoaVDAAKCRA08jD6945I
 01OpD/9Aeg4sl5Zbzn060rwaOX5SQeB/EYoKS+F6QZyIH2BZTwbrlOyTEuRQZUceVPZO3BgaFKI
 dKa6mUW+aqhycCmSt9yvE4FpL1E0GZinbsNApqsFio46RxRYruGidZL6Gkxspylgh+e2W6SJN+f
 1u6JG3SUOX7T4o/wItb/68fhuFOFBN5Lcs9+Rk3zCPNYc/y7tIeGpr6Wgv1RBSw3wcNl7zS3iSm
 Diz9NM6Ra3rtUtsF/+VohzUI4HfSZfaEpbD+wBd0QV3r76ZC44ud5natRJKoQd5urBn/IzmI2/Y
 lle0bkTUxCpmSlL4ucC/cnZeF2Ka7AiWRDTbXC00NXF06kDUhUXepDRRfBTVm+bXmhM2PA4Ei7e
 AItHLBErIJW+lp1LVRFuJACnGzW3/ZCBTJCX5YniNkqrl/MgGe0N3oIdipATgycw14vVW94gb0j
 V5MdCrUZRqZUjo/L/mR54D8VvfPq5Aqk2QQxd5e4M/WNVORmtKBh+R0ILVghvoayqxKqgGfYIhT
 iMALLH5DqzrrEap2S6ASimfIz8KpTXaxs/tBp9XmKNFSnqgcVuLf3c1Xd46QiiUvnjOIKfTgeE1
 lOtM34v3Nh3lcv/HnGLCRpo3jzApoEVfSxQhrJyNk5nvObHoY1oVvt0webmuiNygb3zFEfBus1n qZ1+lDVLPmZF1aQ==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Introduce parsing support for REPARSE_TAG_WOF reparse points. Rename
ntfs_make_symlink() to ntfs_parse_reparse() since it now handles both
symlinks and WOF reparse tags. Introduce NI_WofCompressed flag to
indicate files compressed via Windows System Compression (WOF), and
configure compressed block size accordingly (12 to 15 bits based on the
format).

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c   |   7 ++--
 fs/ntfs/inode.h   |   2 ++
 fs/ntfs/reparse.c | 101 +++++++++++++++++++++++++++++++++++++++++++++++-------
 fs/ntfs/reparse.h |   2 +-
 4 files changed, 96 insertions(+), 16 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 46be4514b60f..45e013eb3541 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -869,7 +869,9 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	if (ni->flags & FILE_ATTR_REPARSE_POINT) {
 		unsigned int mode;
 
-		mode = ntfs_make_symlink(ni);
+		err = ntfs_parse_reparse(ni, &mode);
+		if (err)
+			goto unm_err_out;
 		if (mode)
 			vi->i_mode |= mode;
 		else {
@@ -1214,7 +1216,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	 * sizes of all non-resident attributes present to give us the Linux
 	 * correct size that should go into i_blocks (after division by 512).
 	 */
-	if (S_ISREG(vi->i_mode) && (NInoCompressed(ni) || NInoSparse(ni)))
+	if (S_ISREG(vi->i_mode) &&
+	    (NInoCompressed(ni) || (NInoSparse(ni) && !NInoWofCompressed(ni))))
 		vi->i_blocks = ni->itype.compressed.size >> 9;
 	else
 		vi->i_blocks = ni->allocated_size >> 9;
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index aee1c1fdb609..ff61bd402df0 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -189,6 +189,7 @@ enum {
 	NI_NonResident,
 	NI_IndexAllocPresent,
 	NI_Compressed,
+	NI_WofCompressed,
 	NI_Encrypted,
 	NI_Sparse,
 	NI_SparseDisabled,
@@ -248,6 +249,7 @@ NINO_FNS(MstProtected)
 NINO_FNS(NonResident)
 NINO_FNS(IndexAllocPresent)
 NINO_FNS(Compressed)
+NINO_FNS(WofCompressed)
 NINO_FNS(Encrypted)
 NINO_FNS(Sparse)
 NINO_FNS(SparseDisabled)
diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index b8d601f5500f..12a7baf1badd 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -24,6 +24,25 @@ struct wsl_link_reparse_data {
 	char	link[];
 };
 
+struct wof_reparse_data {
+	__le32 version;
+	__le32 provider;
+	__le32 provider_version;
+	__le32 compression_format;
+} __packed;
+
+#define WOF_CURRENT_VERSION			cpu_to_le32(1)
+
+#define WOF_PROVIDER_WIM			cpu_to_le32(1)
+#define WOF_PROVIDER_FILE			cpu_to_le32(2)
+
+#define WOF_PROVIDER_CURRENT_VERSION		cpu_to_le32(1)
+
+#define WOF_COMPRESSION_XPRESS4K		cpu_to_le32(0)
+#define WOF_COMPRESSION_LZX			cpu_to_le32(1)
+#define WOF_COMPRESSION_XPRESS8K		cpu_to_le32(2)
+#define WOF_COMPRESSION_XPRESS16K		cpu_to_le32(3)
+
 static bool reparse_name_is_valid(size_t size, size_t name_off, u16 len)
 {
 	if ((name_off | len) & 1)
@@ -203,6 +222,28 @@ static bool valid_reparse_data(struct ntfs_inode *ni,
 		    !(ni->flags & FILE_ATTRIBUTE_RECALL_ON_OPEN))
 			return false;
 		break;
+	case IO_REPARSE_TAG_WOF: {
+		const struct wof_reparse_data *wof_data =
+			(const struct wof_reparse_data *)reparse_attr->reparse_data;
+
+		if (!valid_reparse_buffer(ni, reparse_attr, size,
+					  sizeof(struct wof_reparse_data)))
+			return false;
+
+		if (le16_to_cpu(reparse_attr->reparse_data_length) <
+		    sizeof(struct wof_reparse_data) ||
+		    wof_data->version != WOF_CURRENT_VERSION ||
+		    wof_data->provider != WOF_PROVIDER_FILE ||
+		    wof_data->provider_version !=
+		    WOF_PROVIDER_CURRENT_VERSION)
+			return false;
+		if (wof_data->compression_format != WOF_COMPRESSION_XPRESS4K &&
+		    wof_data->compression_format != WOF_COMPRESSION_XPRESS8K &&
+		    wof_data->compression_format != WOF_COMPRESSION_XPRESS16K &&
+		    wof_data->compression_format != WOF_COMPRESSION_LZX)
+			return false;
+		break;
+	}
 	default:
 		if (!valid_reparse_buffer(ni, reparse_attr, size, 0))
 			return false;
@@ -239,28 +280,34 @@ static unsigned int ntfs_reparse_tag_mode(__le32 reparse_tag)
 }
 
 /*
- * Get the target for symbolic link
+ * Parse reparse point data and initialize its in-memory representation.
  */
-unsigned int ntfs_make_symlink(struct ntfs_inode *ni)
+int ntfs_parse_reparse(struct ntfs_inode *ni, unsigned int *mode)
 {
 	s64 attr_size = 0;
-	int err;
+	int err = -EINVAL;
 	unsigned int lth;
 	struct reparse_point *reparse_attr;
-	unsigned int mode = 0;
 
 	kvfree(ni->target);
 	ni->target = NULL;
 	ni->reparse_tag = 0;
 	ni->reparse_flags = 0;
+	*mode = 0;
 
 	reparse_attr = ntfs_attr_readall(ni, AT_REPARSE_POINT, NULL, 0,
 					 &attr_size);
-	if (IS_ERR(reparse_attr))
-		reparse_attr = NULL;
-	if (reparse_attr &&
-	    valid_reparse_data(ni, reparse_attr, attr_size)) {
-		err = -EINVAL;
+	if (IS_ERR(reparse_attr)) {
+		err = PTR_ERR(reparse_attr);
+		ntfs_error(ni->vol->sb,
+			   "Failed to read reparse point: %d.", err);
+		return err;
+	}
+	if (!valid_reparse_data(ni, reparse_attr, attr_size)) {
+		ntfs_error(ni->vol->sb, "Invalid reparse point.");
+		err = -EFSCORRUPTED;
+		goto out;
+	}
 
 		switch (reparse_attr->reparse_tag) {
 		case IO_REPARSE_TAG_MOUNT_POINT:
@@ -308,20 +355,48 @@ unsigned int ntfs_make_symlink(struct ntfs_inode *ni)
 			}
 			break;
 		}
+		case IO_REPARSE_TAG_WOF:
+		{
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+			const struct wof_reparse_data *wof_data =
+				(const struct wof_reparse_data *)reparse_attr->reparse_data;
+
+			switch (wof_data->compression_format) {
+			case WOF_COMPRESSION_XPRESS4K:
+				ni->itype.compressed.block_size_bits = 12;
+				break;
+			case WOF_COMPRESSION_XPRESS8K:
+				ni->itype.compressed.block_size_bits = 13;
+				break;
+			case WOF_COMPRESSION_XPRESS16K:
+				ni->itype.compressed.block_size_bits = 14;
+				break;
+			case WOF_COMPRESSION_LZX:
+				ni->itype.compressed.block_size_bits = 15;
+				break;
+			}
+			ni->itype.compressed.block_size =
+				1 << ni->itype.compressed.block_size_bits;
+#endif
+			NInoSetWofCompressed(ni);
+			VFS_I(ni)->i_mode &= ~0222;
+			err = 0;
+			break;
+		}
 		default:
 			err = 0;
 		}
 
 		if (!err) {
-			mode = ntfs_reparse_tag_mode(reparse_attr->reparse_tag);
+			*mode = ntfs_reparse_tag_mode(
+				reparse_attr->reparse_tag);
 			ni->reparse_tag = reparse_attr->reparse_tag;
 		}
-	} else
-		ni->flags &= ~FILE_ATTR_REPARSE_POINT;
 
+out:
 	kvfree(reparse_attr);
 
-	return mode;
+	return err;
 }
 
 unsigned int ntfs_reparse_tag_dt_types(struct ntfs_volume *vol, unsigned long mref)
diff --git a/fs/ntfs/reparse.h b/fs/ntfs/reparse.h
index c11a5bb7e6a5..b6360b0452e6 100644
--- a/fs/ntfs/reparse.h
+++ b/fs/ntfs/reparse.h
@@ -9,7 +9,7 @@
 
 extern __le16 reparse_index_name[];
 
-unsigned int ntfs_make_symlink(struct ntfs_inode *ni);
+int ntfs_parse_reparse(struct ntfs_inode *ni, unsigned int *mode);
 unsigned int ntfs_reparse_tag_dt_types(struct ntfs_volume *vol, unsigned long mref);
 int ntfs_translate_symlink_path(struct dentry *dentry, const char *target,
 				char **translated);

-- 
2.43.0

