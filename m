Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8843F4DDD
	for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747288; cv=none; b=d3TzcHosD5TPdEQC4hvjXTeN9aCXdTefMIzRZ4notBhaOTfnDf734aa7C+0gIGgkfJRmDjK0zPwPzKnrKczOGeG4hOlVk5vLTTmDQJK/tN3V5xI8cT7vKXDc4FGHQtbVZ5b77B5ANAEUTNTX8/iipYb9+G8i8lMcIgJ/Mps1jaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747288; c=relaxed/simple;
	bh=A8j1rbFYphj6DzHGQlB3VRIzZvi3tCcteMsr1ckxQUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQmxg9JEMEd0ku3/2EEL4Ieel720Vg1BEx9oKrgc61NvxQmcIW/hpR8wXvjxC4LXOfk600ogEPjBk2s59wsZr4dOFjBzwkdObLvwe5hCZRYlTZT7bCDz7EZZ9ywrozzgJQFJUglvARsipIA2DgskhMS7BvMIUnrvtXakQsyF8zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FzpiAHai; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FzpiAHai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=R/
	MI/kx96pri+tgbhY62IIlE0SKRwiUVjetW81QUqOk=; b=FzpiAHaiQ6sBKWF4Ol
	2ayYXWYKPS15ufUJ+2ZQGkoJBTSdpsTDth4MZbXiPdKUKVBj+aBkUHsc70R/0EDr
	FNjsz7jR0VfNRezUpfqlPKsHJhu9h393gLLdpMCmj/BlXcyfAAf3YGaJixryGvZC
	Kq3i/QLPSgxILZ9eICKJs4t/E=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDHUCC4245q++wKOQ--.27428S4;
	Wed, 26 Aug 2026 20:27:43 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 2/2] ntfs: report forced shutdown to fsnotify
Date: Wed, 26 Aug 2026 20:27:34 +0800
Message-ID: <20260826122734.2129830-3-liubaolin12138@163.com>
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
X-CM-TRANSID:QCgvCgDHUCC4245q++wKOQ--.27428S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArykGFWxZw1xtr1xCFWDXFb_yoW8Zr4rpF
	WkZ34fJ39rJF17twsxKw43tF4ftas7u3yYyr4UWw4xWrn7Kr4UJF48K340vF4F9FWkZrWr
	XF1Yg39xury7ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jg8n5UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h9kL2qO278RfQAA3S

From: Baolin Liu <liubaolin@kylinos.cn>

Wire up fserror_report_shutdown() at NVolSetShutdown(), so that
shutting a volume down also emits an FS_ERROR event. This covers the
FS_IOC_SHUTDOWN ioctl as well as the ->shutdown super_operation, which
the VFS calls when the backing device is marked dead.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/super.c  |  7 +++++++
 fs/ntfs/volume.h | 15 ++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 5229eb27bb30..c61992506845 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -338,6 +338,13 @@ void NVolSetErrors(struct ntfs_volume *vol)
 	fserror_report_metadata(vol->sb, -EFSCORRUPTED, GFP_ATOMIC);
 }
 
+/* Shut the volume down and notify fanotify(FAN_FS_ERROR) listeners. */
+void NVolSetShutdown(struct ntfs_volume *vol)
+{
+	set_bit(NV_Shutdown, &vol->flags);
+	fserror_report_shutdown(vol->sb, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index cf1a75066157..fac7e90dbfa6 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -238,7 +238,20 @@ DEFINE_NVOL_BIT_OPS(UsnJrnlStamped)
 DEFINE_NVOL_BIT_OPS(ReadOnly)
 DEFINE_NVOL_BIT_OPS(Compression)
 DEFINE_NVOL_BIT_OPS(FreeClusterKnown)
-DEFINE_NVOL_BIT_OPS(Shutdown)
+
+static inline int NVolShutdown(struct ntfs_volume *vol)
+{
+	return test_bit(NV_Shutdown, &vol->flags);
+}
+
+/* Out of line, it also reports the shutdown to fsnotify. */
+void NVolSetShutdown(struct ntfs_volume *vol);
+
+static inline void NVolClearShutdown(struct ntfs_volume *vol)
+{
+	clear_bit(NV_Shutdown, &vol->flags);
+}
+
 DEFINE_NVOL_BIT_OPS(SysImmutable)
 DEFINE_NVOL_BIT_OPS(ShowHiddenFiles)
 DEFINE_NVOL_BIT_OPS(HideDotFiles)
-- 
2.51.0

