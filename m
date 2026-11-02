Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605164;
	b=CnP/srgAuBG6O9xILpHJRZ0EzGv/G7vLAqP4fFJA2PoujInDSF6VzXcoRu3oHFfP9Av+
	 N1GzHwk5ioBJ5c+jcCNAyNb5KPL013kt8QT+x3i6xeCYZ5BEA3nI2syssoA5MeIXpf598
	 xtptg68/4SdkF5LnZi0hUay8r1GQul4VkIjoXRvi0HJKYdA9jSW0c1YXLCrPtiNshFho7
	 HK88BZoulGwIPcJO8J5p8ENqsPCp/7FvttCpdl5j4bPXVL3h+aJHHNmk3AppkzG3lDRxe
	 /s+G5Pl2MWd2yey3BnsZPqDYKaw7STvXLb7D8+6SCWD9YhsBFD6E/mbARl3itLvGNHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605164;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=A0kDpm3Fq4IPqPv6r7rDrNqAtnYQKwl5OJ653qPszw4=;
	b=ngRWcZ1XEqJ2yhAlTwObjMnN+0FPywyMfJRfldM77CPG6PueriLZ9jdParWbPxQILIDm
	 FXxDmVMmdXCly6oOGdGxxzbc7q7yN/LMf1+xVAk36vZZSp2KZjaMA+fQQW+7AyiIR9Cz4
	 p0Fn3au3zYCeiuhNQIZzbGcEPrY2PG2rxyIzLp2JeXOlY8cHo0HUR6dZWi8noXidgIR5Y
	 hHPSX5zeOg1vYzfHWEBEuKZj/0qWiB3p85HgjpbJojGkOkDGhyZqzZYlfBTdSrGNn3JLw
	 c1DcxyLUw03kcZzYtmKP/vTgI71c9SYbJbB6IOY+w0DLH6nqgZsDhhOlg794NEwa/3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="CVV/EDib";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C529D606A338
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 07:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C529D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CVV/EDib
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=A0
	kDpm3Fq4IPqPv6r7rDrNqAtnYQKwl5OJ653qPszw4=; b=CVV/EDibNJCmfQmBXa
	3T43oVcj9a8sxqQq6B/B4GpMVN0bVtayzTL+C4XIRP5ZfO+uMZrLhhkPxkN5m//s
	7EZrPC6PzAlYXW8k0Yug18yIX8VDbgMGBWTYoiMX8nfpciwGG2NwTdq4thf7bBWR
	8+PK9xRuBMZek8N6vR59o59qw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nygJPuhqucJHEg--.56690S9;
	Mon, 02 Nov 2026 15:38:53 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v5 31/31] ntfs: report each shutdown transition once
Date: Mon,  2 Nov 2026 15:35:32 +0800
Message-Id: <20261102073532.98873-32-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102073532.98873-1-wangxuewen_ky@163.com>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3nygJPuhqucJHEg--.56690S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr17tr4xAF43Xr4kGryxuFg_yoW5tFW3pF
	97Ar93K3s2qFy2vwsrtw43AFy0yFn7uw4UKr4UGw12gw1kKrnYqF4kKF1F9FyFgasYgw4U
	X3Wjgws8ur47ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UAnYcUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7w1nUGroPg1c-gAA3G

From: Baolin Liu <liubaolin@kylinos.cn>

The existing shutdown sites set NV_Shutdown without notifying filesystem
error listeners. Add ntfs_report_shutdown() and use it for forced
shutdown, device removal, EA restoration and named-stream rollback.

Use test_and_set_bit(NV_Shutdown, &vol->flags) to set the flag atomically
and call the generic shutdown reporter only when the bit was previously
clear. Concurrent callers therefore initiate one report per transition.
Keep the existing conditions that trigger shutdown.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/ea.c           |  2 +-
 fs/ntfs/named_stream.c |  2 +-
 fs/ntfs/super.c        | 12 +++++++++---
 fs/ntfs/volume.h       |  1 +
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 2fec8bfcdd89..7aa4e7a70efa 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -385,7 +385,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 				ntfs_report_file_metadata_error(inode, ea_err);
 			if (info_err)
 				ntfs_report_file_metadata_error(inode, info_err);
-			NVolSetShutdown(ni->vol);
+			ntfs_report_shutdown(ni->vol);
 			ntfs_error(inode->i_sb,
 				   "Failed to restore EAs of inode 0x%llx (%d, %d); shutting down.",
 				   ni->mft_no, ea_err, info_err);
diff --git a/fs/ntfs/named_stream.c b/fs/ntfs/named_stream.c
index 788a581d854b..a66375081684 100644
--- a/fs/ntfs/named_stream.c
+++ b/fs/ntfs/named_stream.c
@@ -665,7 +665,7 @@ struct inode *ntfs_create_named_stream(const struct mnt_idmap *idmap,
 				} else {
 					ntfs_report_file_metadata_error(base_vi,
 									rollback_err);
-					NVolSetShutdown(base_ni->vol);
+					ntfs_report_shutdown(base_ni->vol);
 					err = -EIO;
 				}
 			}
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 481d528884ad..51355ec2b1c4 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -455,6 +455,12 @@ void ntfs_report_file_metadata_error(struct inode *inode, int error)
 		fserror_report_file_metadata(inode, error, GFP_ATOMIC);
 }
 
+void ntfs_report_shutdown(struct ntfs_volume *vol)
+{
+	if (!test_and_set_bit(NV_Shutdown, &vol->flags))
+		fserror_report_shutdown(vol->sb, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
@@ -471,7 +477,7 @@ void ntfs_handle_error(struct super_block *sb)
 		      sb->s_id);
 	} else if (vol->on_errors == ON_ERRORS_CONTINUE) {
 		if (errseq_check(&sb->s_wb_err, vol->wb_err) == -ENODEV) {
-			NVolSetShutdown(vol);
+			ntfs_report_shutdown(vol);
 			vol->wb_err = sb->s_wb_err;
 		}
 	}
@@ -2369,10 +2375,10 @@ int ntfs_force_shutdown(struct super_block *sb, u32 flags)
 		if (ret)
 			return ret;
 		bdev_thaw(sb->s_bdev);
-		NVolSetShutdown(vol);
+		ntfs_report_shutdown(vol);
 		break;
 	case FS_SHUTDOWN_FLAGS_NOLOGFLUSH:
-		NVolSetShutdown(vol);
+		ntfs_report_shutdown(vol);
 		break;
 	default:
 		return -EINVAL;
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index 27f58beb4b2d..95ca0019906e 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -264,6 +264,7 @@ DEFINE_NVOL_BIT_OPS(StreamsWindows)
 
 void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
 void ntfs_report_file_metadata_error(struct inode *inode, int error);
+void ntfs_report_shutdown(struct ntfs_volume *vol);
 
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {

