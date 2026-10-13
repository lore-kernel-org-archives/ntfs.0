Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C92D42255C
	for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903536; cv=none; b=EdHJoIcA9d6y08z8vxszp0guaxqc0Jxj0QCVitTDHM9W4pVINQxdB8IH7o/oJMZ3SK2iy2ArCSajh2L6RuFF/hQibCPl5i865McZ4q2Yddc+t2p/9lAmfdE47bcOog17IhNReWQ9/p4zxu/5fQNH3icIbQ8H1LkFxwmj8sx4mBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903536; c=relaxed/simple;
	bh=2z05PsLR0ucgKWMN9vPAks1g4BAjgoGGRk7Omt7dCw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2zh4LNjJshz0ZqzEmre6KfhOwH6Nx780B31ovMCykKlNegqc4Lj/zW4BxXQ6TYp5C3kbhN0FKHOuNJSbo2AQaxPUENX4zIU6tB/uk4ZIpAIPgp97A9T6qH4wbsTG+bQgEzdqKwLVG3PpOeoQoFMO4bZuTHvogh3XoESEX5Qw2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOc2hw/b; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOc2hw/b"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-887d902c651so319080b3a.1
        for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903535; x=1792508335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYeCLMrRw+7sZKn7J2Wy4tI9g40PN4nI4PwnmcaAXWQ=;
        b=fOc2hw/bITlWE0v8ugRW+3uZtJSk0VdRI+BMYwDtcRcKFw8y+ql6uITqz+ksnl3mhR
         fS/OYTviuM+Z1pKbZAtPWd9y7XQ0SHDFj89nWT55XCCAiOEV+Y/LHFARpEs5bkL9BrEJ
         H7/vLL9yi29TzRP98vxVjQC9xxjOD9eWjSNanBQlePmXcni/+II7nz2HOVboGzZc/pMZ
         u6nBLJUltDUYpqx7dYb0oRlZTJbhXincaoHlh/TFlfr+1gkxSTtpcdiHot7pymTvyaWd
         O5+ZLaPBzEDl+eMR8CPziT90r7QMXs2Kd3014fclnXHnSuF1neM8mKEqQHieI1HXVsIY
         k0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903535; x=1792508335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYeCLMrRw+7sZKn7J2Wy4tI9g40PN4nI4PwnmcaAXWQ=;
        b=ivMEjWxAo4ChdjOV8qTPP7bXIWhGWyvZPcvpRNc0ff6jjL5csQLq8B9G6lZIisv/n6
         rYxM7PiA0P0niLl1vScTMviwf1J3aAxmC+mESlUh3VKA1xmZoS+W7oSZt1GF+9ylrChB
         a7G0yZJT3AYlOJTZjQJxw92pAUj/LEBaJFU0MEbmZgNAc6GMebMkmoyUpFyrDzmUWqav
         zaiBa773/yNbYypW2OboNFgSOxFtrjs7NYoyT2ES5pidV38mg+tgUNSYEeR4SSd4Oy31
         bkGCCpEx8HF9XlZ1s5wC2jrMbmlhkNf0iYPe6CVnn+Bxa8wCaE129g6ZVqLHjkxKuhpq
         O/MQ==
X-Gm-Message-State: AFq9FYLmhAgygJk23bGQo8WbXQWjdF+e0MWUq1uh7z7bsM7YkgrpINoW
	Q0t/anx7jdVxF4MrNCY75IgsKedUXPTEu2A47iopg/TNWHWwSnihd3Z6
X-Gm-Gg: AYBFou10RjvMwsAW7+OQlG1OIpTigxixsYST2gQnCJOqpLuOdn8Fg40BSVyb3z/Oep6
	flbtZL+oqOMIQpw5HY3VY0zwW9EGH3FYxVoZV7lCp82uFN86aFlCY6Bhdd80Z53njGgqtWlpa4X
	RpjNR/MNaTWWizRAL6hs4KRPh5xSaRj3+3VOO1K0udiEI1rZzbRFsn/9bqLahA3zl59T6ewPATU
	lfueC93QlK+gP4mWDDqKJ7qeSn6KMVrWCeXmdfR62CtltHPxe+JAlxjhZGEoUT8Nbgv+UkPOVnw
	0xeko4k8AII84Aqa+byduCaKrZGdALDGytTCtakV1vUpRx1C8FaHRyKxZbsiIyKLQpAHKQph839
	kgHR5Ho+9K7qjNnDrTgSqRLCluqVy4bSWRwp7h2QT0LTLGAkWdxjjeLWgs69Hf+OFv+71IDSzsI
	NVzWjJ6bH2d9OZuYQNsJbrbMnZl5ZriHlxPNyWE8lKwSBFc4i3hnrkb5G4I/ybCVc=
X-Received: by 2002:a05:6a00:4906:b0:89c:9569:93cf with SMTP id d2e1a72fcca58-89c9578e022mr2814601b3a.1.1791903534922;
        Tue, 13 Oct 2026 07:58:54 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89a0724a045sm2987330b3a.45.2026.10.13.07.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:58:54 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ntfs: report block device flush failures from fsync
Date: Tue, 13 Oct 2026 23:58:45 +0900
Message-ID: <20261013145846.56415-2-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013145846.56415-1-charsyam@gmail.com>
References: <20261013145846.56415-1-charsyam@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_file_fsync() calls blkdev_issue_flush() after writeback but discards
its return value. If the device cannot flush its write cache, fsync()
reports success even though the file is not guaranteed to be durable.

Reproduce this with QEMU blkdebug failing flush_to_disk with -EIO.
On ntfs-next at 04fb910da2c8, a kretprobe recorded -EIO from
blkdev_issue_flush() while fsync() returned 0. With this change,
fsync() returns -EIO and logs the failure. The syncfs() path already
reports this error.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Cc: stable@vger.kernel.org
Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
---
 fs/ntfs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 58afd310d57b..afc2efb4b699 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -417,14 +417,14 @@ int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 	err = sync_blockdev(vi->i_sb->s_bdev);
 	if (unlikely(err && !ret))
 		ret = err;
+	if (!ret)
+		ret = blkdev_issue_flush(vi->i_sb->s_bdev);
 	if (likely(!ret))
 		ntfs_debug("Done.");
 	else
 		ntfs_warning(vi->i_sb,
 				"Failed to f%ssync inode 0x%llx.  Error %u.",
 				datasync ? "data" : "", ni->mft_no, -ret);
-	if (!ret)
-		blkdev_issue_flush(vi->i_sb->s_bdev);
 	return ret;
 }
 
-- 
2.43.0

