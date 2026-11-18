Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993122;
	b=ca9zl7dSagbD5L7niWsE7tmKq9pJw4PG4gdN5lBXQyim8uweoJWfXeWjvNN9GCMqzgty
	 sYIq2WZFAZyZYmyZLGCWqAlt24+FdXTx9a8HaFz3NhjDXBDlGM8reR4XZEiGbZzFKSy+P
	 q4Ir9JRIty//ZJr/qsc3np/LMxqaoKjzwUDAHgWNxYIQU92U5ldLuSfni4Bl4rcHhh6vp
	 RUd8ILxWGBg5e7k46UNcySGY+pm/cU7DO/NK7JQT3n90/+aC4tkx/QtkquerLRC/h84eY
	 UWXXNPBfmX+G9bc1LvNGWzW/aIISGwP2vFdQhXwqq5o9de5WoNHOpod1szXxqdQ+yAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993122;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=LQpqTkHXQc22bMMjMBvYHpBxm2gd9TGE9OXTuYmn1II=;
	b=3zzMncnKD91OX3cwEuDbTbPWf7dpnl32SW38Dvu4aC9lJ+moXuSgpOLPIZKGBVz/ZKmc
	 cN7lHsSYJKi84ObG6nAPspH0XRtpgz/Is6Yj9LS7RuJQIozK6K0+Pri6iKF2iuvWK7APp
	 CnlXj9Zo+uEtB9Im/ZtLM0izFiNTtfdVF4sRVIrYQDnkBnZ/f7e3sFMmrPI1wlfDE3kab
	 /eNxzc45V0zbgxCUWfc2zXRDsvtwhxG0utcxKcIsvpeJ9HbYnjDWvZf1iKffRzRcJfIKB
	 nYpXX6TjQ05w1AglarPCfhgwH3s0DqUKQNyxph2jta3r2+KF0CNDncpK6HCb72VopWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UbuYsCGW;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A7606A320
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260A7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UbuYsCGW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=LQ
	pqTkHXQc22bMMjMBvYHpBxm2gd9TGE9OXTuYmn1II=; b=UbuYsCGW5BH5HpvhZJ
	07IpX8fTTKfEPAIi+76eAIp+e2A1BtYUOHFAIohC+3joHuouMcYUswVorBq/czKR
	GEjaclDcXFQ33Rru+CVHAmRa4guVKvNVzzC/oxmMGPrXiaIIjprdtNmo+GFRu1Jd
	wpNqSuGYPc3nZu2udtJw0Qvpo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3v0nSa_1qVwxBIg--.34758S6;
	Wed, 18 Nov 2026 17:11:49 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 36/37] ntfs: report each shutdown transition once
Date: Wed, 18 Nov 2026 17:07:00 +0800
Message-Id: <20261118090701.1858849-37-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3v0nSa_1qVwxBIg--.34758S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr17tr4xAF43Xr4kGryxuFg_yoWrJry5pF
	97Ar93K3s7tF12vwsrtw43ZFy0yFn7uw4UKr1UGw12gw1kKr1FqF4kKF1F9FWFgasYgw4U
	X3Wjg398urW7ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTVb9UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzhUqE2r9a9UNkwAA3V

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
Changes in v6:
Rebase onto the updated ntfs-next; retain the v5 reporting behavior.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/ea.c           |  2 +-
 fs/ntfs/named_stream.c |  2 +-
 fs/ntfs/super.c        | 12 +++++++++---
 fs/ntfs/volume.h       |  1 +
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index acb782275edf..20e8f28c218b 100644
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
index b404c8f4154f..b44093af447a 100644
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
index 8ce2a54ad3bb..6e9e4498b746 100644
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
-- 
2.51.0

