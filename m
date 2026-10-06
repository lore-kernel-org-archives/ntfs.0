Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D83370D61
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 04:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261583; cv=none; b=csQHsJoPou1X3PFCAGtyNbr2LQl++u5MFYwOKTeyQqtJx+yLu/CffRUVEREoTv5VIPY9/CXWkl6lXmOHwR+QdeUSdRNe3g+vhJ9IiDO41c1JheTfyVg/MZRbPoyf5pOSxaOF2UVSCyPHr3ADJwAQljYfYLnrUO/x3EhYnnT/C3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261583; c=relaxed/simple;
	bh=74GCVFBEaYoLkoDkeStCwsJ3MD5Xlz4Emhhsn4lIGSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QrPNWWzSYlvCHJxv0btMWYzSh6Vh9J44wKJoDHUKCzCmFiJm1FmsikLkrYhfg8B3w8ZROerpaR8Id8uzD/ECd+vDslPeHJ308K+uiinMF+ApSNsi/66bVh+pLzatpYOAh1u0Tu3CIEVlVxphk1xGvp4a0TPNUghkOXRQfzotLuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/Fxzg3l; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/Fxzg3l"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a168355946so2981795e9.0
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 21:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261580; x=1791866380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HCOU2yJch70xiRkaLkSG3uKGxSg+aF17fZmWG9Aov0=;
        b=U/Fxzg3ly7MHSnIFTO76htwuOAoJtxpl7At2IuMOGrM5oM33xiKKyPD8bMOa1IOBiU
         7vIU+EYxgEYuXe/trmMbxLRr2+whP4E2qWNXofsrvCQQyC6DcN2/Alk2rtutHiBbA4iN
         a1yut0ZD+E/LJPu8lGfvm+lsGeiRj4VT7Z9HFh7/+/NrSrmKT06/jPcd/4VxRjDewn+t
         A9axNfx8UjJeG7UzjzTi1+KHR0SIDPauwhlbebSiCKNCAircfOAo0DvUO4AJB6kv7+G+
         hKbXHtYpNhH+3+uPxvWIV7S9NYT8VZk44jvCaXGqVduSXGjmzm4TxG23dIyj6M9N+qUn
         zQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261580; x=1791866380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HCOU2yJch70xiRkaLkSG3uKGxSg+aF17fZmWG9Aov0=;
        b=WMeCDTEoq/lqeazHxfA6EfBAWMPfMmkAB1797jD2XzJdb+5yqdpoT4KnhE4Cw7t2bX
         UpZcXQdqeGsYzvkoDkEalA2wYFrogVS0ICiN0aClO1haE+Zngod7YrJxlfb/LgV671li
         qbYd0OvN6Gdw+xtrDseTgrQmpSneCz00CdQLD6HY1ZUAhx6WQ45mn0ybZ4Hj2Kf0QSau
         cyyajZZlTOY9UpNRk0DBq7zdjyUexHxRqO4LiJfXQdAHKuJOeLd/Wz+2jQbeOZdbAWvk
         t7UIe4DTXxL5EBjoBYtf/iRPGODauuq00fJp/gzhkh5U04r1hOXXH9YqW8kxqr+r8gSN
         vKnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5o1JK6icnp0QKNvTXKtVDqEZVqSkaCglDK4KCTTEwDguM/msuQGWod4Q6ZjWBKqZIC6Oc@lists.linux.dev
X-Gm-Message-State: AFuF++nH3HbgybHBx5sXBpq/VXNE8UPU28sbCVjTfszYXMz73G1OTIIx
	IayORkfpBe8V9ynfjPgdSqk+ZxSfsGWDqrzCi35RzFPSAEhVzik7GEGi
X-Gm-Gg: AYBFou10GkPSPRWSJ4EoMsg7y3u4DAC9oQbH9uAFkxg7tMUo+zcz0HSFIq08i8Vkvi0
	NUpEZTJlPMTR6S0JFus7kT8bO8mBwAIPojzXMsmlrXQaACaUfZS43gp7ahE+qdo+KnMOgQyX28D
	8tzp6+/0ynriqbOqxET3+bs+nLeWHnLtEuftHigXsBkZqbWukjHCmBug/P8+ub05UrnncnIASuh
	tY9yJIUWFRyiuikt+KlqBMq3EpUR9UCLRhZlkexeXvCs4m16AdMHJcON0tqp7g5LL51zqw0wAQQ
	4fiU+109tXO6u8DDTjwyjJxmNQY5ndS4g6tN33fYMoI37x1vyOHPnbWDIAn/yit5Ojwo4HEJI5z
	3K/VNEqnhHzfk1DvANY94xBcTwUEggO0OnPQdSgLslDUKzGK699GM1UENJmRdr/yEgU0D7wpOMg
	dYIlGELajSSjGvoKfc8MjCRzHIRMnB8IfpYe0wO9lEA2HTU3pZNLpBcw5J/7C55RX0+oJUpvJdm
	saaxmaXLmk5rbIM9rGY4V5citOiO9fA8LK810OmBkLUOlqf6Z7hOA0aJOq9+wQYgI9U0VB/Hl8m
	tX2vnHXMRSXhwmFG/RG2IRcaWeVKP3XYPLY=
X-Received: by 2002:a05:600c:1552:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a17b559685mr3252685e9.24.1791261579681;
        Mon, 05 Oct 2026 21:39:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm62744995e9.14.2026.10.05.21.39.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 21:39:39 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ntfs: fix kmap_local leak in ntfs_check_logfile()
Date: Tue,  6 Oct 2026 06:38:09 +0200
Message-Id: <20261006043810.5393-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261006043810.5393-1-kmehltretter@gmail.com>
References: <20261006043810.5393-1-kmehltretter@gmail.com>
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

