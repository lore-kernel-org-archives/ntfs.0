Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5283F4DF3
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288521; cv=none; b=VWmRFzkG4yANtG3YXvKYM0QDtA5ZAE+wj9IDcB1/Mk3PNbd8aF2RmNeTzMz0l0K3enZB1PzVZb8BFDbM0kopUwXfqk54nCiZnvpXyuW0AgAGlvt8YGaDY/N7YzNmpGjVPhxqjJWzF/VRzHDLCtDI9W4Ebi4geNPuZUCcpBIIZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288521; c=relaxed/simple;
	bh=QMnzuWyuHZAGBwnsOoFuVmuVyGF6TQjtZ9hoBAIVq4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ED98Dperacv2Eu7YB24zvvdDaIKyOGDZFltkfk3xImTIUATY6x1vn+NNv9hZx8twgTnsAHvPUC4TiQW6VS1lBjle9UYguhrSipNIT5XsO5TV6PHD/FzU5f4Sxn5AuPD0d9oQbfhhekFhsFJcwsgI5GRl9zLdUUkW85zlfQxjstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kb+BXNvj; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kb+BXNvj"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso378090b3a.1
        for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 22:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288519; x=1787893319; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HTNaFepj9FJssoGDyHXWIAHl61etf7Re7Hr/o/H8uUE=;
        b=Kb+BXNvjACSgEdIVrGKZGKjZ2XzEVXfTLjR/zP2KSXjqjxcIwQzKLBQEmboXo/nq+W
         bnaxSvxmaWFOwGpgQNjHgLzWvh0ylxyBYDsuQ7ZGkz51GxzNq1eJHgjyG/uMw0OR+XpJ
         B3uusRqhVV43NKFFxrOXZfN9RkKVJaE8Edi4Nv3aCKTt51b8QS9qFV12CqFeWO1cfw3L
         +ZEcTd8bcLUStqf1DEuYWNjCO6XSmHYk6yGj/HV2nKKraLsYXfjJt/9GaY3Kc9D8FJoW
         CPZXdhHGNFU41+zdGkbw2igBnW9+Ttrw53+rxjatlKldjsCxmK+7h6NNiX2WOd03imFX
         /pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288519; x=1787893319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTNaFepj9FJssoGDyHXWIAHl61etf7Re7Hr/o/H8uUE=;
        b=sCL3wo0lK8TVsRL3Zt+6yrM6FmdN7Rqo03yRvYqQNx+XjkRABjFH15sUqaNrSAY8IL
         XHrXFMNQSDI9S3cvlcf5ewa/ysVuD8jezoGamDtCduqHdWOaLVg1RDMeAapgIAunttCc
         WjeVMI/0TVfaDS+AnHbmFi/9YCJ8hF6XePxt1qbPRhzxnf0OYuZ60Uzlv/gZ1UUE19R7
         mfhpDEsDMdQivCflIn2p0SBgGw6EOLspgJc5zZ8NFcc6jPOPYRdDM6K+3XlXANVfphUy
         rvg4yB0kpb7kZGT9hKBTtVglyvcCUBqKpXGXQb5Ka1E8PCu6wHvrpQYWakApq8itDecj
         vr7w==
X-Forwarded-Encrypted: i=1; AHgh+RrSp8cZ2vtE9E+g3sJfD59Z5IthwswjXIQKb1AyrEbBswI98QVMVgq7Y9enAYEen9dfsBCk@lists.linux.dev
X-Gm-Message-State: AFuF++lEBa4gFa/uzYcHSHjRmf3JVdv4Y+E5uOIMTdvxIBNc3Ky7gPS9
	qpezCHa8vy1qGi370/wxOBrlgKttWk+MBh8esACW5rWMkp9rRSDtK8Hk
X-Gm-Gg: AR+sD11vEG4QQJNWf018rlBfDgTazP3Z0Kb5yRCUdV63PpGHBlxIN8o4b5W9Ft4B4xc
	oGqI1rBfp4dM2ebEjBJZ5D0hvTn5HI8KsUpyfljGc7/jUIYUY9wkwPQh6agGV/ankh4McQRJ8qo
	VxgwXbw2bqgYrH3ye0pqtbiLnKvfawyppUVuj/jOpwkTACvQ/E0wV3i9jer66hzvP+hreNvzF9n
	sVwwULVUwwcM9jM2tR0/OsEBKd7q8JutCFcGdUQaU22PdWBhCVMHDxk/ncIU3j9/i6qeV1hDsCR
	N45kU1vO40e/9bTs3veqeOwcdfRxOZ/pG0qBSn6JYtssqA1M9XSIBKzNQlqIh8MpTnB5a9oxDWZ
	OZ83hlxb7brgNyqlI66pNB00lwMsYtfSB4xX8yMrrsIyhB+BXYe+dgwsCGouJ7bPRy7RvUBsTE/
	t/SCqrLZM3B0f9KdMOyKZ/jJzW91O8MDd+lNwzS4eb/y+Mzpsxcr9dzEOr3i+T7pL4dNE=
X-Received: by 2002:a05:6a00:410f:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-851f972a856mr6122438b3a.1.1787288517878;
        Thu, 20 Aug 2026 22:01:57 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm2319545b3a.43.2026.08.20.22.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:01:57 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 05/10] ntfs: parse REPARSE_TAG_WOF
Date: Fri, 21 Aug 2026 14:00:54 +0900
Message-ID: <20260821-topic-wof-v2-v4-5-7a6fa10743b8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
References: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10020; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=QMnzuWyuHZAGBwnsOoFuVmuVyGF6TQjtZ9hoBAIVq4E=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqh9tO8/A7aBFbaEc2S+aYAUuzMycWrW1ug6BX7
 evlzUV/iyKJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaofbTgAKCRA08jD6945I
 0yGXD/0ewl6QznhNjN4/RtgOgGdx2W64YUKVeRpLOztBJ9YzWmxJcQfhbKljLpuaTDKVKzWZO2O
 No6gvwwMQl1e5xGIetvdpPbUa1BQfFFlhsWop9SCeVLFUL4RseyR2/A3ms/cKgOO5b01N9DPIl1
 hjZa6t3Hy2q3Nq2pGd/XKa88TUpU23ktkwBQ4GGxsDdHMMJ1vAp1QBJftLxk7MxnZcJjK386FOx
 hZjifZhLeRcOfkieSWqI5Bbr4evn0QKxiJvZmK+VRuoHp5xw+kta1Wqo5Jr7mmVJvvFxhAjWNoL
 7aN7/Em1sQyC7g8TfKkvNcP9P7xinuDEjX/EghwXs/kiMHtfa+ThTxCC6LkF8y2ASbdYZGDI5Uc
 jncwLFKqMrcVhPCZIBDk254PvM4E/WbzU3gy4cbcr9m4pOBUS8xP9NRsV0Prwb/JccgMt6PdltP
 gPhgJrsyDF22z/iV3RUNeVL5v9FJDFLQYtvt2wIkLWqJji/uBLa0aeBTieYfKm9cYhCvoUsUPUr
 2phazwcxT6HniHnP8Npm5/UecBnVuvj7gHBPWzc+lbAn+yIYWb/Y2Bw+o88PnTKk/0DCUIlQf1v
 hBvTIO34RMiuK1ZEdieOmRK8AvUxszIe2ZQLVLWC0uspv1BF9+Ic9WB1oK+9AUlK7S+9cPCFTSK dx+Yx/pDneXDdHg==
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
 fs/ntfs/inode.c   |   7 +-
 fs/ntfs/inode.h   |   2 +
 fs/ntfs/reparse.c | 197 +++++++++++++++++++++++++++++++++++++-----------------
 fs/ntfs/reparse.h |   2 +-
 4 files changed, 144 insertions(+), 64 deletions(-)

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
index b8d601f5500f..0e3ed9f520dc 100644
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
@@ -239,89 +280,123 @@ static unsigned int ntfs_reparse_tag_mode(__le32 reparse_tag)
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
 
-		switch (reparse_attr->reparse_tag) {
-		case IO_REPARSE_TAG_MOUNT_POINT:
-		{
-			struct mount_point_reparse_data *data =
-				(struct mount_point_reparse_data *)reparse_attr->reparse_data;
-			const __le16 *name = (const __le16 *)((u8 *)data->path_buffer +
-					      le16_to_cpu(data->substitute_name_offset));
-
-			err = ntfs_reparse_target_to_nls(ni->vol,
-							 name,
-							 le16_to_cpu(data->substitute_name_length),
-							 &ni->target);
-			break;
+	switch (reparse_attr->reparse_tag) {
+	case IO_REPARSE_TAG_MOUNT_POINT:
+	{
+		struct mount_point_reparse_data *data =
+			(struct mount_point_reparse_data *)reparse_attr->reparse_data;
+		const __le16 *name = (const __le16 *)((u8 *)data->path_buffer +
+				      le16_to_cpu(data->substitute_name_offset));
+
+		err = ntfs_reparse_target_to_nls(ni->vol,
+						 name,
+						 le16_to_cpu(data->substitute_name_length),
+						 &ni->target);
+		break;
+	}
+	case IO_REPARSE_TAG_SYMLINK:
+	{
+		struct symlink_reparse_data *data =
+			(struct symlink_reparse_data *)reparse_attr->reparse_data;
+		const __le16 *name = (const __le16 *)((u8 *)data->path_buffer +
+						le16_to_cpu(data->substitute_name_offset));
+
+		err = ntfs_reparse_target_to_nls(ni->vol,
+						 name,
+						 le16_to_cpu(data->substitute_name_length),
+						 &ni->target);
+		if (!err)
+			ni->reparse_flags = data->flags;
+		break;
+	}
+	case IO_REPARSE_TAG_LX_SYMLINK:
+	{
+		struct wsl_link_reparse_data *wsl_link_data =
+			(struct wsl_link_reparse_data *)reparse_attr->reparse_data;
+
+		if (wsl_link_data->type == cpu_to_le32(2)) {
+			lth = le16_to_cpu(reparse_attr->reparse_data_length) -
+				  sizeof(wsl_link_data->type);
+			ni->target = kvzalloc(lth + 1, GFP_NOFS);
+			if (ni->target) {
+				memcpy(ni->target, wsl_link_data->link, lth);
+				ni->target[lth] = 0;
+				err = 0;
+			}
 		}
-		case IO_REPARSE_TAG_SYMLINK:
-		{
-			struct symlink_reparse_data *data =
-				(struct symlink_reparse_data *)reparse_attr->reparse_data;
-			const __le16 *name = (const __le16 *)((u8 *)data->path_buffer +
-							le16_to_cpu(data->substitute_name_offset));
-
-			err = ntfs_reparse_target_to_nls(ni->vol,
-							 name,
-							 le16_to_cpu(data->substitute_name_length),
-							 &ni->target);
-			if (!err)
-				ni->reparse_flags = data->flags;
+		break;
+	}
+	case IO_REPARSE_TAG_WOF:
+	{
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+		const struct wof_reparse_data *wof_data =
+			(const struct wof_reparse_data *)reparse_attr->reparse_data;
+
+		switch (wof_data->compression_format) {
+		case WOF_COMPRESSION_XPRESS4K:
+			ni->itype.compressed.block_size_bits = 12;
 			break;
-		}
-		case IO_REPARSE_TAG_LX_SYMLINK:
-		{
-			struct wsl_link_reparse_data *wsl_link_data =
-				(struct wsl_link_reparse_data *)reparse_attr->reparse_data;
-
-			if (wsl_link_data->type == cpu_to_le32(2)) {
-				lth = le16_to_cpu(reparse_attr->reparse_data_length) -
-					  sizeof(wsl_link_data->type);
-				ni->target = kvzalloc(lth + 1, GFP_NOFS);
-				if (ni->target) {
-					memcpy(ni->target, wsl_link_data->link, lth);
-					ni->target[lth] = 0;
-					err = 0;
-				}
-			}
+		case WOF_COMPRESSION_XPRESS8K:
+			ni->itype.compressed.block_size_bits = 13;
+			break;
+		case WOF_COMPRESSION_XPRESS16K:
+			ni->itype.compressed.block_size_bits = 14;
+			break;
+		case WOF_COMPRESSION_LZX:
+			ni->itype.compressed.block_size_bits = 15;
 			break;
 		}
-		default:
-			err = 0;
-		}
+		ni->itype.compressed.block_size =
+			1 << ni->itype.compressed.block_size_bits;
+#endif
+		NInoSetWofCompressed(ni);
+		VFS_I(ni)->i_mode &= ~0222;
+		err = 0;
+		break;
+	}
+	default:
+		err = 0;
+	}
 
-		if (!err) {
-			mode = ntfs_reparse_tag_mode(reparse_attr->reparse_tag);
-			ni->reparse_tag = reparse_attr->reparse_tag;
-		}
-	} else
-		ni->flags &= ~FILE_ATTR_REPARSE_POINT;
+	if (!err) {
+		*mode = ntfs_reparse_tag_mode(
+			reparse_attr->reparse_tag);
+		ni->reparse_tag = reparse_attr->reparse_tag;
+	}
 
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

