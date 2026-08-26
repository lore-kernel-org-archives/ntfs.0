Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DF041D106
	for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747281; cv=none; b=EwBf5le+84JdSQiA0KQ0BUDdiDWo0K91OmgnQmc3Djy11sNFPLQWoreZpJtxuVGMIJfs+JGgkwOPi1ChlMoE4vzw+a61V5PIxEQ7M43Y/yJ0clg3QgNou5HI9QpFkfnjJ1m6HW6/ukI2TYVP1YjuDhf6kKGEaewRIznJ67zHAvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747281; c=relaxed/simple;
	bh=3q2rBVs86aGWdbyOrfsqHgDn+UlAr2tm2kY4ZHHDgRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D66KkCxpshuIjTquf1IMT+4qsN83WhT8NZAaOW5ULY10fuIIBpHJCKEJFhMTDB7rWXnxBmbs8sux7urtYKZ5BDyqxKuNiEELzxBQaj0gg0W3ZxAIJmyPtEi2EEJt5Dsd5SpRakNzpXt26vw2Q7Ll7/CC14l1M1wctbsKzO/ER18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Wf7oOgXn; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Wf7oOgXn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kt
	2kK9yQ4Wc1wTrmIy0zAfLAF65ecf5YAnNursAAmz8=; b=Wf7oOgXn8IKP9we+fX
	i59H+IdavZWOpbkNxeGJ5IEy9CH9940bNnGr2Rt9t3DFEiHUCwA1CO9W+44Fh+Td
	8l/XfJY8uQ1dZVQfn+NdnTyXdeHBDI62IdOZPaDVnC8cdon1Y/2G35XOc1DoDVpL
	d8JWTpKb5Wpp4jXj0bqv//wTY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDHUCC4245q++wKOQ--.27428S3;
	Wed, 26 Aug 2026 20:27:40 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 1/2] ntfs: report volume errors to fsnotify
Date: Wed, 26 Aug 2026 20:27:33 +0800
Message-ID: <20260826122734.2129830-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826122734.2129830-1-liubaolin12138@163.com>
References: <20260826122734.2129830-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDHUCC4245q++wKOQ--.27428S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1xXryrtrW5WF17CFyrXrb_yoW8uw1xpF
	WkCwn3KrWkJ3W7KwsIk3ySyF4Sga4kWr4jyr47Jw1Sqrn3tw1UtFs2y34F9F1I9rW8Zw4x
	XF1Yq393urWUZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7pnPUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6R1kL2qO27259wAA3z

From: Baolin Liu <liubaolin@kylinos.cn>

The ntfs driver reports volume corruption only to dmesg. Wire up the
generic fserror infrastructure at NVolSetErrors(), the point where the
driver concludes the volume metadata is inconsistent, so that an
FS_ERROR event is emitted as well. This lets health monitoring daemons
watching the mount with fanotify(FAN_FS_ERROR) learn about corruption
without scraping kernel logs.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/super.c  |  8 ++++++++
 fs/ntfs/volume.h | 14 +++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index cd8fa2c13370..5229eb27bb30 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -14,6 +14,7 @@
 #include <linux/sched/mm.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fserror.h>
 
 #include "sysctl.h"
 #include "logfile.h"
@@ -330,6 +331,13 @@ const struct option_t on_errors_arr[] = {
 	{ 0,			NULL }
 };
 
+/* Mark the volume as corrupt and notify fanotify(FAN_FS_ERROR) listeners. */
+void NVolSetErrors(struct ntfs_volume *vol)
+{
+	set_bit(NV_Errors, &vol->flags);
+	fserror_report_metadata(vol->sb, -EFSCORRUPTED, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index 65fd3908af26..cf1a75066157 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -218,7 +218,19 @@ static inline void NVolClear##flag(struct ntfs_volume *vol)	\
 }
 
 /* Emit the ntfs volume bitops functions. */
-DEFINE_NVOL_BIT_OPS(Errors)
+static inline int NVolErrors(struct ntfs_volume *vol)
+{
+	return test_bit(NV_Errors, &vol->flags);
+}
+
+/* Out of line, it also reports the corruption to fsnotify. */
+void NVolSetErrors(struct ntfs_volume *vol);
+
+static inline void NVolClearErrors(struct ntfs_volume *vol)
+{
+	clear_bit(NV_Errors, &vol->flags);
+}
+
 DEFINE_NVOL_BIT_OPS(ShowSystemFiles)
 DEFINE_NVOL_BIT_OPS(CaseSensitive)
 DEFINE_NVOL_BIT_OPS(LogFileEmpty)
-- 
2.51.0

