Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC4F37AA97
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 04:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262383; cv=none; b=mn08EraOr5AtYBXZZA5LBKNVUjetiKFzWbSYQVBoFPIKWtAJNAF1+Vt3j7g5Cw528M5o2pGHuaMENhTE6uSrkxgvKgSZfPpzQnHyv+oGbWgqx8kptn737oSVfr6qluANtc9GECSkzIyG+IUuVnExYT8nivyEBESdQLrKCNknAEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262383; c=relaxed/simple;
	bh=74GCVFBEaYoLkoDkeStCwsJ3MD5Xlz4Emhhsn4lIGSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YCpa5rfO7iQ2312pfFTOzgJIORFMYYDXOdeS2e3NdkOedfyq6gvcgXmPj9K9ycsponw7+cBKyGhho81OdgfKFrcBaVvO3a5TlRRCAREZUlE/Q4XQHmA5Ldr2VUkAXUia43ckK1PlLj7rxhmTTUZauTQADGIl796vRRRm2ke++LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBFbNvJl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBFbNvJl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso3625945e9.1
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 21:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262379; x=1791867179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HCOU2yJch70xiRkaLkSG3uKGxSg+aF17fZmWG9Aov0=;
        b=PBFbNvJl6J/3U13b4FUgRAdQcGANMk7XopvdLNaknNRiKp8cScD+HYdPRdamfiqoni
         B/MifaPvKSKuOlhjxHvBYkj0nYm2qEjFgTZh0AnPuE3Gs2RKlsCzZRzzYljDCx6dS4bL
         FxvT5b4/xcW8lBN+u437doRhXah3K1Djfl3xYsclyy/9UD6zCFiSZDxEE51r2Xzv1eB6
         0dogANwwmnycHgcP2zLR+rvX/NxFpF0pZwqi9MZ1rT3cJK5TgLAeuOQFnLESrnYc7yNh
         zvLrnUwFTUqHzKtZS9bZOBRWM/ehZyQEGwl6Q/hPrElMQEroRSkPBXa4Kc0LhWLjS6Ll
         AgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262379; x=1791867179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HCOU2yJch70xiRkaLkSG3uKGxSg+aF17fZmWG9Aov0=;
        b=mgMef7T7ai7+qm6VAUz3vp8kl6Zq4kNPI7dcQoWPA2xsvZC4f+UFjzC4rXlN+NHu1D
         yDTCSxoB0dr0YFT+S+FhHjqBSDef+TkuG3riYU3Va7ps4Hk0wSHmdnoywluLiMnNsz5N
         H8hXYpIli2BV9riNYSBLJGvWyzfiCcGqtpUH+Aw/ihfXjSzoLm8+bfq6Cgu4+YpCHThw
         M8GsR7ISD7Nm+2Wz5djPu3dgly5FSs9u4MD+X9I1ThpYrhS4ZkkanwCQ0QDnOH88V1AB
         9pi1b1iIUnh60p6weAuxZDj0JcMvq/pukKkeRSUq7Dl61Dd07qQFGPfQZ5HoI1Q38Ga3
         Vl0w==
X-Forwarded-Encrypted: i=1; AKwUvBw3mV4NJfsLhqxvaSHFLP9w+kD65j9uU2bT7bJ27MA295HsL6SFggEjOItZlEURE4EdaNpK@lists.linux.dev
X-Gm-Message-State: AFuF++lNp2jFjgVHEF77y0kK2eys1OR0u2rrPXQMhMA0uuJtMq3T6Ig3
	2ICbEjuaI7xnDvRcU4QLYwKLJvoHTvLgzTO2lLGyI2nCUMkNgMK2gQhT
X-Gm-Gg: AYBFou2QGs+ob5cQ5u7Lf3YDzOXaoFx3Mz8QsxqlCnSv5Opnj/I1M1tODjr4jB4wk8X
	ZTnn65PIvZpQ7YOta2BkGKVyo3uGHjxzLEiGnCM2WBJqQOei5sblAptsLi+Xw/1xGnYbKBW1a9K
	LhSNZMaWx0TQjf323JBvzIWCj2eDAfUPFGWjuWMOVzALMaY0HsgQA15qdHVeaSG22vwtrKJjJfi
	Hi0Lwj/a3U/J3kLZmW2yjLYAZj7pSldjOwgoIX5MGwJOUGkIp4ORkK63SP9vvS6F4kiHnBOJVMX
	/qy3fFkhjUKNKPB6FEyjjKKvZ0GkaSLHZevJRPO+tG5J9lkb2E+sXp1X2bzbml+IcZGeaRe6pJC
	JO0pHy9ysmviM8whwuzeTc/leGnihsOF7RS0eLsPlRzR7HsRm4OPd09SL/UoOEJANvMmC5C0uGp
	VaWU1ogB0QgfuJiY2spvRaQQy0c3zSt4MZvpx6Hdb+W/x7LOCH+gSD4GHudWNzsUngjxR9b/Byy
	XhHuZ/itoN3IhCZnwjcaiEGWKADKz04lf+6F6xTmW2UlDH0Jjn+1tYrIeX0VfWDBVyRoAIDFHFy
	4PJ6evW9z0B7gjA6FBaon4sW2febYjWiLQw=
X-Received: by 2002:a05:600c:4e43:b0:4a0:c4:a1e0 with SMTP id 5b1f17b1804b1-4a17b53bec8mr3771995e9.9.1791262379239;
        Mon, 05 Oct 2026 21:52:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm72322225e9.11.2026.10.05.21.52.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 21:52:58 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ntfs: fix kmap_local leak in ntfs_check_logfile()
Date: Tue,  6 Oct 2026 06:51:36 +0200
Message-Id: <20261006045136.5911-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261006045136.5911-1-kmehltretter@gmail.com>
References: <20261006045136.5911-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_check_logfile() calls kmap_local_folio() on every iteration of its
search loop but kunmap_local() only once per folio. The loop visits
positions 0, 512, 1024, 2048, 4096 and so on. With 4 KiB pages the first
four are in one page, so a mount whose first LogFile folio is in highmem
leaves three entries on the kmap_local stack of the mounting task.
Kernels without HIGHMEM are not affected.

The leaked entries keep migration disabled. nr_pinned of the runqueue
the mount ran on stays raised after the task exits, so taking that CPU
offline blocks forever in balance_hotplug_wait().

The fifth mount in one task reaches KM_MAX_IDX (12 leaked entries plus
4 in the loop) and hits the BUG_ON() in kmap_local_idx_push():

  kernel BUG at mm/highmem.c:480!

On x86-32 the generic entry code also warns on return to user space:

  DEBUG_LOCKS_WARN_ON(current->kmap_ctrl.idx)
  WARNING: include/linux/highmem-internal.h:17 at __do_fast_syscall_32+0x21e/0x550

Map each page once, when it is read, and unmap that address.

Fixes: 5218cd102aec ("ntfs: update misc operations")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested in QEMU on top of patch 1 with a fresh mkntfs volume, on the ARM
and x86-32 kernels described there. ARM and x86-32 behave the same in
all three tests.

- One mount on CPU 1 with taskset, then writing 0 to
  /sys/devices/system/cpu/cpu1/online: without this patch the write
  was still blocked after 60 seconds and new ssh logins hung. With it
  CPU 1 goes offline. The same write before the mount works on both
  kernels.
- A program that calls mount(2) and umount(2) eight times in one
  process: without this patch mounts one to four succeed and the fifth
  hits the BUG_ON() in kmap_local_idx_push(). With it all eight
  complete.
- Three mounts in a row with mount(8) are clean. x86-32 no longer warns
  when mount(2) returns.

 fs/ntfs/logfile.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index 1404664dacc0..ce38ce87f8fc 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -457,7 +457,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 	struct ntfs_volume *vol = NTFS_SB(log_vi->i_sb);
 	struct address_space *mapping = log_vi->i_mapping;
 	struct folio *folio = NULL;
-	u8 *kaddr = NULL;
+	u8 *kaddr = NULL, *kbase = NULL;
 	struct restart_page_header *rstr1_ph = NULL;
 	struct restart_page_header *rstr2_ph = NULL;
 	int log_page_size, err;
@@ -511,7 +511,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 
 		if (!folio || folio->index != idx) {
 			if (folio) {
-				kunmap_local(kaddr);
+				kunmap_local(kbase);
 				folio_put(folio);
 			}
 			folio = read_mapping_folio(mapping, idx, NULL);
@@ -520,8 +520,9 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 						idx);
 				goto err_out;
 			}
+			kbase = kmap_local_folio(folio, 0);
 		}
-		kaddr = (u8 *)kmap_local_folio(folio, 0) + (pos & ~PAGE_MASK);
+		kaddr = kbase + (pos & ~PAGE_MASK);
 		/*
 		 * A non-empty block means the logfile is not empty while an
 		 * empty block after a non-empty block has been encountered
@@ -574,7 +575,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 		 * find a valid one further in the file.
 		 */
 		if (err != -EINVAL) {
-			kunmap_local(kaddr);
+			kunmap_local(kbase);
 			folio_put(folio);
 			goto err_out;
 		}
@@ -583,7 +584,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 			pos = NTFS_BLOCK_SIZE >> 1;
 	}
 	if (folio) {
-		kunmap_local(kaddr);
+		kunmap_local(kbase);
 		folio_put(folio);
 	}
 	if (logfile_is_empty) {
-- 
2.53.0

