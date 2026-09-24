Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D02DBF75
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240526; cv=none; b=irCoXT8bjXXxDvUp22UbALYoN2zNl7m4cNTD3Z+gUfHqkn3LGfVIjFweadd1++8dF290VKFd7TSZmyQuvstZFcYZOwWP5P4KG37Nc2plp219x7mc6rmWr/Q6c+lBSEmIzVR2wjuQ2h+/3s1yzjiWwL0XiCNtHKdUT9XeRbZBn1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240526; c=relaxed/simple;
	bh=9vNjSL90J4yX9kw1EA3qLyad04ZhUpY0Tkov9iZfDhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nj3unhzWu6b+rsyOmapFcpkLlryTWju1d5hV05Y8v02c/MCdempeZrNlaDg6LxRWkvOdH8twie9IdauhbId+exAEzhF5/LVBepfAmSqMt5u8x6Q4xLxEJIRL+Bghgm5zvzaconJsYLT4+cDzjkKbHnu6zuzjQu1hEOoluGij1mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=o1HW+vr2; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="o1HW+vr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ul
	cahvz8a6nzlF4ykRPpW3Il7se8hI2AGVvN4y2l3qE=; b=o1HW+vr2OsMyIUMO4W
	JJV2I/ccg0RTYSUATHgrQXDdaAKghCfgJ1nQAmw3uthXE5ugwKu7gocaJQXbbR7M
	RBbhJVTzJoLhYQYh9OIh42oPBbzFiG2AhrW0DbH8k5g1Vp4+v9SkMvD3zrhstJl+
	9lFp8aj5p2lTJgYyDgACQhgmA=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3H73Q5rRqL6EhAg--.34883S8;
	Thu, 24 Sep 2026 17:01:17 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 6/6] ntfs: report shutdown errors to fsnotify
Date: Thu, 24 Sep 2026 17:01:02 +0800
Message-ID: <20260924090102.2865942-7-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924090102.2865942-1-liubaolin12138@163.com>
References: <20260924090102.2865942-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H73Q5rRqL6EhAg--.34883S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyDXr4DZFyxJw4kJFW7CFg_yoW8uF17pF
	97Ar9xtwn2qF129wsFyw43A3WSvFyku34UKw1UGw1Igw1kKr10qF4kKF1F9F1F9a4F9w48
	Zw1UK398uFW7ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcrc-UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6R24g2q05t33iwAA3W

From: Baolin Liu <liubaolin@kylinos.cn>

Notify FAN_FS_ERROR listeners when NTFS enters forced shutdown after
FS_IOC_SHUTDOWN or backing-device removal. Keep the shutdown state
transition and notification together in a dedicated helper.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/super.c  | 12 +++++++++---
 fs/ntfs/volume.h |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index a7a7ecf9d074..a0d3934ef6c8 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -414,6 +414,12 @@ void ntfs_report_file_metadata_error(struct inode *inode, int error)
 		fserror_report_file_metadata(inode, error, GFP_ATOMIC);
 }
 
+void ntfs_report_shutdown(struct ntfs_volume *vol)
+{
+	NVolSetShutdown(vol);
+	fserror_report_shutdown(vol->sb, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
@@ -430,7 +436,7 @@ void ntfs_handle_error(struct super_block *sb)
 		      sb->s_id);
 	} else if (vol->on_errors == ON_ERRORS_CONTINUE) {
 		if (errseq_check(&sb->s_wb_err, vol->wb_err) == -ENODEV) {
-			NVolSetShutdown(vol);
+			ntfs_report_shutdown(vol);
 			vol->wb_err = sb->s_wb_err;
 		}
 	}
@@ -2086,10 +2092,10 @@ int ntfs_force_shutdown(struct super_block *sb, u32 flags)
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
index 366e9f5d0443..648fe8991304 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -256,6 +256,7 @@ DEFINE_NVOL_BIT_OPS(SymlinkNative)
 
 void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
 void ntfs_report_file_metadata_error(struct inode *inode, int error);
+void ntfs_report_shutdown(struct ntfs_volume *vol);
 
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
-- 
2.51.0

