Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71FC31F990
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 07:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125435; cv=none; b=ODKfUV0dLdd8xy8Ps0SOTwVsY/WcdNc0VmeyF/pSimPPKINbQIEnLdnEg7Q4xyiyrcUBq6mXOHGRA/NiYuucSDlLOhP9ltf0iktGnXLFAUCXyzafn44ulT4VZ9bedqPrA5iAdXwEUv0Cyd0Ap4qzX3ACtdXO8Xr/ZLdS2V2s6PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125435; c=relaxed/simple;
	bh=ea6yZEUloFDa0r3TdhXYOiAR/RnPTFe196P5XmF649E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BMIqnOfgkHPcP2RqGVM7ziLOdxecJaJczzAApAHKube0svE/N8296TT/R7hgREs30yzwso+dQ/Q5v4LsRUwU/oVcJl311t9Wwdk51E5hp0qSw9mImJWKgvmH5qEyrL20VECfCzgKCSqvb+cuyVavGpW6iwgVuEAfnemhVmJ81+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpxta5Fh; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpxta5Fh"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso737985b3a.2
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 00:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125433; x=1787730233; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7GDsukNYW4VOdxxrGkDKt2EBp2i9zBMNoZjsMYUNX9I=;
        b=qpxta5FhiT/96/4Rt2PChN3j0T4KKNKtq9fTYNBPITtQ9BhpnNfgBLlVfMVKMJhkER
         cVOglwO5kyI+Kk6w4Zy3OQ6NZJ2TKn63Kqybn1xpHRWqn6B8xqk/H4gAAXYgc6E8lE/y
         VfDJANb3N8c6Sd9vtrfbQy8DYumlRcX+ffohJOvijzPAL3Xv7/CdcgzKMa7//qJWQ6Ur
         ilvmPkhfX+0nokyzAIKd6zx/EwCe4qJS5ydnnEMJSFPSObHlOD5YGh+04CAfktTdmRrl
         lsgcy1agaMKfUqj/s2ZJZNtMObxq5N44jrmA1/2neOHklWBVKglww3lWWaGiC3OwjVTW
         gPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125433; x=1787730233;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GDsukNYW4VOdxxrGkDKt2EBp2i9zBMNoZjsMYUNX9I=;
        b=o3TxDJJbKeF1ucA5hTK2Frq8StfdwpeorkCsTnqqrB+AmgtlMWFc7fpzG3E1rFb0Dz
         v/n0n6MxsqUEmPAmREIcV07N8q7//NaFr+0iAwx/na2G4QGh2Ue5OGv5d5o72Y9dZC/T
         FdOfDNTu12V/cFalGgkQWQAe1bPFqyYtUN8No5O7eGcUuCRMZAJnnzvnJclQpqlpHFgt
         /3MHgNHRUaWVwmdfcDvREQ8Ng7DJLmhg+A+zXKPTowfGReWsq3vu//zRCSYnHd2mqAAO
         K57A1AhIZJaFk9oZ4v3ul9/v20hzDPdgo0hKB+UFoxqXjzlIGdbHm9DCe3+sdq+eX8Oy
         svPg==
X-Forwarded-Encrypted: i=1; AHgh+RocW9pC8b5TeFtsA+w+Ws3d1DLFCWBeRFfkYrpkebFAMSngxE4CVrJSzE8MgXg3ZW82aZg4@lists.linux.dev
X-Gm-Message-State: AOJu0YxgB4p7tXO/uw6cx4bsMvwDMElAjzjACeAIF6Dr8iCflZqr4XFu
	Iris57mAF0mqrzGO3nAVghCK+77nSmJpksxbVmx6u3HWD7ilFxw7n7wiHZKMRA/W
X-Gm-Gg: AR+sD11S4IB7MHJ1b9Tm5GqQJiAJ/Nx9GxaDjr2zFQbARSRJDhx4zAzb2BiOd1ZocKH
	gb+8O9b2vU2t7kG5DaWyYEPtEQjXm2dYxEDI6N+XsJjtSWrCB7+nZT2AqmSz/Sk1ayPa/pqkH0F
	WTUyaT5zd67FppALcfxXw5CiiCNK5CJMWfTTYN+KoU89DGM5jNj43BvhAMgRJ8OgXAZFTSsNaVJ
	ZXbBwDbFLLxjbGwv9vAEzNEm8WNptVqC1uwwGA8KaQFZyXiu3zay152M9i3huWYYMbQ/sTD4lr7
	fb98qkJZvPhhKfPmH1EHtF5O7F863XjuVEU62hLcPph9OJqGvTOYnr6/PZKgkhkO8QszQSbT4A+
	U66JsHyLXXHs3iswFcnC14+RdmJ2Vc3YREEPG5n2ZNSWzkFomaX0VG7mqJrYyg3PufWU6Ty2zZY
	Q2PJKAwBM0ce3K/EfMMue33WHnyzdpI0pz+vPqzrNA+7TEolny0kmfwO0T9QPuMVmlj6I=
X-Received: by 2002:a05:6a00:9284:b0:848:3fe2:c88b with SMTP id d2e1a72fcca58-851d37f62a4mr4148085b3a.6.1787125432654;
        Wed, 19 Aug 2026 00:43:52 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm314623b3a.43.2026.08.19.00.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:43:52 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 4/8] ntfs: parse REPARSE_TAG_WOF
Date: Wed, 19 Aug 2026 16:43:22 +0900
Message-ID: <20260819-topic-wof-v2-v2-4-40f56903e7e7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819-topic-wof-v2-v2-0-40f56903e7e7@gmail.com>
References: <20260819-topic-wof-v2-v2-0-40f56903e7e7@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7135; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=ea6yZEUloFDa0r3TdhXYOiAR/RnPTFe196P5XmF649E=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhV5wmtoNuPfm9eu/ZcwvQ6Dz0QiKLYpS5j33a
 bY1sgfBq6KJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoVecAAKCRA08jD6945I
 084cEACx18f4AzON4Ni+mfdQOe+B7cMPdktrjicRtXDvbBwkXaX83AX2mTde/6slBxpu81ij75C
 ebrwLv+wJRsN6/Ox9+UstzeGKTA9QI5uR2zhQLUc5kC1IObYqeAyqkQ6C4AaNP73u/a1Oy0aV//
 b//gx0R1ApsmWjzlPYgwbBitgBD3EeiueI6XV/euskxoHN3SBOIV+zQjo0NNOziY7v9F+kc2IFJ
 ae6AjxdjJ40nmqRRt46trh9eJFH3x9Yy+pbC32RWzkz9zzjFUvf2EIsqLUNwx4wIrqbpD1rqE99
 Hhn7J1ReJ0tFk0x9kyoMrxHYfESS3W3LZ2X8bM+5jlyfOdmxJ04KViRopvcOw+YwWLoy6ZEKDti
 hQEeA4r4ZgxEGyJX3WTi9uaW3tiL9/WSVRurtIHSs6WeIGNzNJIRFInzAU+3z4bfUb2bfc/vwt7
 iXiyTpVeEM26KXF4L7By0uqhPBcObldGkSEk+imrpAsf/OXfJKWXUHMHuG+Q58Ji7ARmFdTrMas
 JudMbweJCxDBobpS0ipHdSBSWzuT3jRpXe86J7grVlkyjyrcbLdnPyFqgw9ZAs1UrvwKIaYWvUY
 iEFND91nCyU9qBAfquVkpovdgTX0es+H7JyyXJyQ3QOfea9malma8OqxNCVuyYsFnqpTPH1RpY+ g0DYu/eyoLqig/Q==
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
 fs/ntfs/inode.c   |  7 ++--
 fs/ntfs/inode.h   |  2 ++
 fs/ntfs/reparse.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 fs/ntfs/reparse.h |  2 +-
 4 files changed, 94 insertions(+), 14 deletions(-)

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
index 0d3988992119..5c2771e82c65 100644
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
@@ -239,26 +280,32 @@ static unsigned int ntfs_reparse_tag_mode(__le32 reparse_tag)
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
-	if (reparse_attr &&
-	    valid_reparse_data(ni, reparse_attr, attr_size)) {
-		err = -EINVAL;
+	if (!reparse_attr) {
+		ntfs_error(ni->vol->sb, "Failed to read reparse point.");
+		return -EIO;
+	}
+	if (!valid_reparse_data(ni, reparse_attr, attr_size)) {
+		ntfs_error(ni->vol->sb, "Invalid reparse point.");
+		err = -EFSCORRUPTED;
+		goto out;
+	}
 
 		switch (reparse_attr->reparse_tag) {
 		case IO_REPARSE_TAG_MOUNT_POINT:
@@ -306,20 +353,48 @@ unsigned int ntfs_make_symlink(struct ntfs_inode *ni)
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

