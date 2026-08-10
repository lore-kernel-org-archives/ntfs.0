Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7F64B04B7
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 04:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337303; cv=none; b=RTpGB8U0ygDiUQwkZAjDXG/fe9emXhGV/b+3UfVCLRZiCLctkLBEppl7I3sckLiJvtFgwqr22WPB7XqLtOox8zovRYdpTJS3gDNPEZ5vFb+BWK5wGW6u0/Y5oWxHxSH09z0WBB12eNOg96eXPluJaW0fY5AFP+YOZGxMzYrKaUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337303; c=relaxed/simple;
	bh=XHcT7B/vhBhyKkEjau31V8G6/Au0tAzc0OU6HvK5hx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QB1Kv6UFw63vE/4jpgxQC0hsLd/sGPyNXiPDk++7n89mSp/Pg2FsLSr4gb0qQCGFajQm+B9dDA7tcf1xvJtQsuNbyfWAmKqm2Tj8/0tctb2xTTflWMDfQYfOwBK3N6ciNH+eIXAOaOIIRy5PazGvMVbIlgHTRtgQzsvwbffT2/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWEKTnLK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWEKTnLK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3811f512167so2066408a91.3
        for <ntfs@lists.linux.dev>; Sun, 09 Aug 2026 21:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337301; x=1786942101; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/g3A3lzLCezplOLfFdvS/f9q3q5lmt/mPbZ2fiSiNeA=;
        b=hWEKTnLKgbxskf34n8IhMRycyja5IJD0wO6fp4oV+F4jZINPbK8QEqPwhqVq8JdKXy
         KoP8MtKAB1XEHM+zHVkokmjfV7V361JUhkVcEiTQQZYMkmTU8A+AN5qBdlluy3oZIY5+
         KvDo2KbQbtmhJKIcNdrki6GnPtTxmq/41lZrlQSdEZIo7GiEqNLms6znVuZIID4lVkst
         FWn4Cwt2DcRgw5n+1ZYmsgpkK0qtQCdBkGKJXIeXxgay49pMKaz2+6TgNqQU91p0Qfnc
         x4NKhgafiP+DUmHiVcq8MJgxvN6FzpkxP1MGvTq8jPG3kX2NwPj1/xDC7UdX/sMvurx0
         fleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337301; x=1786942101;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/g3A3lzLCezplOLfFdvS/f9q3q5lmt/mPbZ2fiSiNeA=;
        b=JmWEd4RG91adoNfEoYu1Eo4JEMN2+oFsZ6QJ6DLDnHJRp2YH4rwpBlyvcDU58MPpKS
         SjzlV1sCQQCp8E4ptTx7WJIeFiFBTuZvGXOYqRvn7AP6KrJyoUw8xCU3Edtn+lNI+eNi
         VyuKNw9caTG0uvMWrCwXxMng9CJLstkX02MLoryPWGMqBuiO22+fA+ArA0cmUg3ut6mX
         n2E8Tf2NFCXxuxw3QtDgH0FJ4RhBVVzdw5FES4If7XN2hQtmmBSDxT6GEnYX+XAlAzx0
         e+G8rRXS3/j9dCMoFgE3I3dO2kEizGLYKZvU8jLKNoOCO3EnuqnVyycbq0wpwHWfRSbv
         +A0A==
X-Forwarded-Encrypted: i=1; AHgh+Rp6lpBIuaI9lx4zvk3XHiUmz7epHC6JBaDeFgAWGVzoi/aAtJ89vz9o8k+D2uFCkIDiyNRb@lists.linux.dev
X-Gm-Message-State: AOJu0YwmkGHE/2oWQ9RgKjWhaREjJ8g5oLIBl/8w8lyzXJZVpcGiyKtW
	DhWfZ1noHH+IELjeZOSnRLdgmWolsgng2QfEWTnf8EnjfDvYjX/No38e
X-Gm-Gg: AR+sD11S86cHjszpeqzHSpv3gAoibkLZ8BibrkyjIh8yD3f1ts0Z4PVN4BEiD9PYjUc
	bndJbbB3FJ4WaSMUPuCNg+Zoe9legRkSkCcLKToWOwqkTh7S7onrln3k4h2mdipNQrrmTgWH/g+
	CgEQLx8zI2yk+AhjdGHPrCWoQpr3ALHmFotbbaDMTYfCv0Q0cmJneSLD3vPJ1HnUBZRYOnjDvy7
	+X4hCELykj/lmli405J/USaDSGj66z3d5CCDywaf542SH90RtS9wJgwSt84FHFEQMDM3lSaCaam
	hIrIIxOyLvfncqv5uXAz0A9qIBuclUWBPJ3s3RmP5zxyfXZzZt5DKOjQ4qsyKNWbKbxTiD6UrEk
	V7kagjw4AK2iG7nsfgUFVRVqvAbwrAisKDOdO/mcs+WPMbhJvb1se9qJXCsczPPF/jStdBatNHY
	3BDhCTi1Aqu092aAd2jwtBBJ5zx9o8t5R+Tbj0NYbEPt83pDJUhk4Kd/DIM2tyEIOInXE=
X-Received: by 2002:a17:90b:288b:b0:38e:8050:e63a with SMTP id 98e67ed59e1d1-3903c54d9a2mr43065827a91.6.1786337301111;
        Sun, 09 Aug 2026 21:48:21 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm13045106a91.3.2026.08.09.21.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:48:20 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 4/8] ntfs: parse REPARSE_TAG_WOF
Date: Mon, 10 Aug 2026 13:47:58 +0900
Message-ID: <20260810-topic-wof-v1-4-6a97cfa3bb59@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810-topic-wof-v1-0-6a97cfa3bb59@gmail.com>
References: <20260810-topic-wof-v1-0-6a97cfa3bb59@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6180; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=XHcT7B/vhBhyKkEjau31V8G6/Au0tAzc0OU6HvK5hx8=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqeVeQOAv9VDpVdUBfWUDwlyfTvF7QmtseD1unO
 2Ia+9iOxbSJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCanlXkAAKCRA08jD6945I
 0woiEAC7WnpHtOeBwfSGp8LBBFl3cuSHLgoQUN9arL0FnH2XkugmTyZefKpBhWff6RwZB7s810w
 tiIdihDzmWSFwypu5x8XeGZCYqiYo18+PkeraOJk8B8HwG9NfefYuSoMXqgskANoslgQw2+y/DV
 VyJkv6ggygftl26yzSjyV2QWQLx0LuuOV4Z3oNlHHm/wSRM/aV2bS7rBYxgJGszw9zCEWvDM0sX
 5AwYjdO387IaZwYxf1bHBWC0j02kG0zM+I7kJyl4nMZ/LF12hXWtsVg3fAM4r/WL5kwNfSicgBP
 +OVYMP6OxzOe0wAbgdNB0fxuZMm1oW6MiJ1kD2+NtPU0A8uRzisWZAHwI/qqeyBbXVe+XkCckKj
 wDywKpm5mYVtaI/MEI+IOtVvjDqkMTC8J2p8TJZL+68/0pGdTkepaPEJpmOA6hCB1+4jZweyloT
 bO/huCt/dbpcZIvQjSjkWtgS/cPMRCYy/6aTyHuCwjvxN//qbdlTlONXeDTVUlb7O+KgvcmuYft
 05qy7Sm0igkBTsQ4AES5lqpggSJ3+FmUOxMPbYHtZPNCjAlrPAqGANtFrYXI5bUViLTl2ulclBQ
 2sGdgcjactbCGYMMCWa4xzuysXgs9BDhpNNUBxWuUD4OgSpJ+vNtbtcyLVv3OC7mdylzulnK2N5 2kZGkSN87JUvB3g==
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
 fs/ntfs/inode.c   |  5 ++--
 fs/ntfs/inode.h   | 11 ++++++++
 fs/ntfs/reparse.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 fs/ntfs/reparse.h |  2 +-
 4 files changed, 90 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 39c7fd8c1149..8d9bbc151309 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -869,7 +869,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 	if (ni->flags & FILE_ATTR_REPARSE_POINT) {
 		unsigned int mode;
 
-		mode = ntfs_make_symlink(ni);
+		mode = ntfs_parse_reparse(ni);
 		if (mode)
 			vi->i_mode |= mode;
 		else {
@@ -1214,7 +1214,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
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
index c6d065aaecd5..943a2960f029 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -189,6 +189,9 @@ enum {
 	NI_NonResident,
 	NI_IndexAllocPresent,
 	NI_Compressed,
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+	NI_WofCompressed,
+#endif
 	NI_Encrypted,
 	NI_Sparse,
 	NI_SparseDisabled,
@@ -248,6 +251,14 @@ NINO_FNS(MstProtected)
 NINO_FNS(NonResident)
 NINO_FNS(IndexAllocPresent)
 NINO_FNS(Compressed)
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+NINO_FNS(WofCompressed)
+#else
+static inline int NInoWofCompressed(struct ntfs_inode *ni)
+{
+	return 0;
+}
+#endif
 NINO_FNS(Encrypted)
 NINO_FNS(Sparse)
 NINO_FNS(SparseDisabled)
diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
index 0d3988992119..8269fab33f38 100644
--- a/fs/ntfs/reparse.c
+++ b/fs/ntfs/reparse.c
@@ -24,6 +24,27 @@ struct wsl_link_reparse_data {
 	char	link[];
 };
 
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
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
+#endif
+
 static bool reparse_name_is_valid(size_t size, size_t name_off, u16 len)
 {
 	if ((name_off | len) & 1)
@@ -203,6 +224,30 @@ static bool valid_reparse_data(struct ntfs_inode *ni,
 		    !(ni->flags & FILE_ATTRIBUTE_RECALL_ON_OPEN))
 			return false;
 		break;
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
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
+#endif
 	default:
 		if (!valid_reparse_buffer(ni, reparse_attr, size, 0))
 			return false;
@@ -239,9 +284,9 @@ static unsigned int ntfs_reparse_tag_mode(__le32 reparse_tag)
 }
 
 /*
- * Get the target for symbolic link
+ * Parse reparse point data and initialize its in-memory representation.
  */
-unsigned int ntfs_make_symlink(struct ntfs_inode *ni)
+unsigned int ntfs_parse_reparse(struct ntfs_inode *ni)
 {
 	s64 attr_size = 0;
 	int err;
@@ -306,6 +351,34 @@ unsigned int ntfs_make_symlink(struct ntfs_inode *ni)
 			}
 			break;
 		}
+#ifdef CONFIG_NTFS_FS_WOF_COMPRESSION
+		case IO_REPARSE_TAG_WOF:
+		{
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
+			NInoSetWofCompressed(ni);
+			VFS_I(ni)->i_mode &= ~0222;
+			err = 0;
+			break;
+		}
+#endif
 		default:
 			err = 0;
 		}
diff --git a/fs/ntfs/reparse.h b/fs/ntfs/reparse.h
index c11a5bb7e6a5..3bd30cb36561 100644
--- a/fs/ntfs/reparse.h
+++ b/fs/ntfs/reparse.h
@@ -9,7 +9,7 @@
 
 extern __le16 reparse_index_name[];
 
-unsigned int ntfs_make_symlink(struct ntfs_inode *ni);
+unsigned int ntfs_parse_reparse(struct ntfs_inode *ni);
 unsigned int ntfs_reparse_tag_dt_types(struct ntfs_volume *vol, unsigned long mref);
 int ntfs_translate_symlink_path(struct dentry *dentry, const char *target,
 				char **translated);

-- 
2.43.0

