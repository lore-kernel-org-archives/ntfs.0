Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6261E379ED2
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 02:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525460; cv=none; b=GkAskJJtYYPvSnkh9Ho9srtTnqn9Jeh/70TlqxGbPvIGNJ9AFftW6g+OWvHVctX0fNsBIVGlSfZIbXZtTZIJnQV8wBAG7iisMRqAoPlDnKfu/QPP8fLUKylG1l4SvbuigcRvF0yr6xHlclLyVWpK5gtZVFjl2rfiDqvZnbWwZck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525460; c=relaxed/simple;
	bh=Gf+QfnqldKJoDQjFkBmyjkwn0AB7BeFnOle3Wo9umS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJ8hs2tGz3vskVxugMluBp0Jfv4QnUt6v3gIJcdHCnBupyzM4NQXvmJgRuw0p3FzdDXni042yVFQxOJazRGWbZY+bVtaGAf0+N8haD/rFtnfX8iKedTaNJjbVny9TYMo5W0Kgrp0lTjyWTurjJHTKdRgU4dHuOgDj733mIYx8ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BaC6whjW; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BaC6whjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=GF
	rL/09p2yHSVNvezjjZk89Fyb0BNmPAHvLqQqpEmNw=; b=BaC6whjWMLpf3Yx7m7
	l0KRN/J2t0GeqQH00UzKJ3myVDcHedEmmo8nK5iytpWj+J9velb7FDgCalvql3w4
	khX7kt9yueYxwVh2w89fHxXKF3q5L10nB7qmcMThNkVfZs+WSbdgz/lqiurhn25i
	BStiJueSCcvrANNR8Z81TtsR0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3J2qz_alqzNjjAw--.2073S7;
	Wed, 16 Sep 2026 10:23:59 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 5/5] ntfs: report shutdown errors to fsnotify
Date: Wed, 16 Sep 2026 10:23:45 +0800
Message-ID: <20260916022345.1151836-6-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260916022345.1151836-1-liubaolin12138@163.com>
References: <20260916022345.1151836-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3J2qz_alqzNjjAw--.2073S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyDXr4DZFyxJw4kJFW7CFg_yoW8uF17pF
	97Ar93twn7tF12vws2yw43A3WSv3WkWw4UK34UGw1Igw1kKr10qF4vkF109F1F9asY9w48
	Xw1jg398uFW8ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcb1bUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwh+zfmqp-b-E2wAA3O

From: Baolin Liu <liubaolin@kylinos.cn>

Notify FAN_FS_ERROR listeners when NTFS enters forced shutdown
after FS_IOC_SHUTDOWN or backing-device removal. Keep the shutdown
state transition and notification together in a dedicated helper.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/super.c  | 12 +++++++++---
 fs/ntfs/volume.h |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 7f6812d27fd1..a331188286da 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -352,6 +352,12 @@ void ntfs_report_file_metadata_error(struct inode *inode, int error)
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
@@ -368,7 +374,7 @@ void ntfs_handle_error(struct super_block *sb)
 		      sb->s_id);
 	} else if (vol->on_errors == ON_ERRORS_CONTINUE) {
 		if (errseq_check(&sb->s_wb_err, vol->wb_err) == -ENODEV) {
-			NVolSetShutdown(vol);
+			ntfs_report_shutdown(vol);
 			vol->wb_err = sb->s_wb_err;
 		}
 	}
@@ -1911,10 +1917,10 @@ int ntfs_force_shutdown(struct super_block *sb, u32 flags)
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
index 7daac7048a4c..09f92dc1117b 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -252,6 +252,7 @@ DEFINE_NVOL_BIT_OPS(SymlinkNative)
 
 void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
 void ntfs_report_file_metadata_error(struct inode *inode, int error);
+void ntfs_report_shutdown(struct ntfs_volume *vol);
 
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
-- 
2.51.0

