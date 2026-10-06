Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD07376BC2
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 04:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261584; cv=none; b=fHSX+/S+RFUJMoyxMVZJhiVQxyFIhqArZ2joXlZwKzjrO/vCBGlqfeAr1yLZlfEHI67YezhxZq+RI/i5qASj0z8RMxleDybnctcUQwTLBgnTy3jfpHwcKC4J2WBkzTXy7tH+oXldO0KknyZZuUjGiAq5zKx3qIGjdsJtJh4sCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261584; c=relaxed/simple;
	bh=RCnWkqLEl9N57ql9V/Xk7Pcb/7984IZaCMasgW9VyEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j23ZPwRWuJdfoETSdmAtjZ1udeolnIZ3P6O/6hloL8demvETTiVgapNPwRWlQ48EbAuBigrrHzI7GCIQgH1SRfbNyoJBBiVpAI+wKF3TGkA5qx7aQSl9ZumN/2u+wQA29qH7Kv00WTDptdateRvwZSCE61anYbwE4D9Sy/bU05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdJJzGSq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdJJzGSq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so2957945e9.3
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 21:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261581; x=1791866381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQFJVOeQWH/dUEdqrozbevZ9AdUQ52aXCjTZt8hK/iI=;
        b=SdJJzGSqOLBrfoHyMkYniLeJczKJ06XAnxvVQwXUmKZGQRd1Ta3BjnXENAoR/r/NnS
         P/yBTVv1zW+mJ9Z7+ZoE1x+Qyaa6OdCJZJ1N/B1X1vSpMiX3xS1CreytN+EPw1LXwhZ3
         RyfHBso1qnupSn2kHgLBV5TFRHBHgbVEPhEWnvTqWXB0Z5HeUXBta1Zd4D9PmohPNw2u
         G5HNg5UvnOd6eWMzt6B242ohzW6n++3uAEgTTFoltgswmKEUsn0mki7IB8DUikP7x5+b
         WzH+1ASMaiCnibxsyFvqmYxP+Uyl4dFMql42y4UY3OF3hE+DeyZGCrdew/qpolD+CA2j
         dtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261581; x=1791866381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQFJVOeQWH/dUEdqrozbevZ9AdUQ52aXCjTZt8hK/iI=;
        b=rfk1MCEjY0k77MqMWk6psQqTT45xj/nzmjvptRLFrH1Skrusac+I6SlRCsFt0r7Qkx
         RDq52EuAAg32afOkcRcfTbtg6l4q3vs7/Uu9JAT8eSFSlNJcAQxHH+ZLR7E3XjRq9cAz
         RMywSQA56fZal3MbseiEvAjBCgc3LrZv1rnaGLI5n0yjYt/q3782epu1cuYxQEPk71aD
         cEDxNRM7lsTlAn+YmtlAby0flCYU09HSYc8FEbrVoQeFoDmjsdD9y/sEmZXzoqkTmrlt
         3vTRFtq9iUgjSdnP2+qFPTk1ue2G6I4fjoLGf1lOMb+pmdaC29N7BWHWA6BVsPECY3Ro
         U3PA==
X-Forwarded-Encrypted: i=1; AKwUvBxIwZDEpcdQYxiX0mU1Htgc5vcmPJqdR67TSJ2ilyceJdXLxRKoW7Bmxhk0dsSAOs9/YVs7@lists.linux.dev
X-Gm-Message-State: AFuF++nUwCf7L4ptfV9EV27gP4uDOC18BwA1YNHbwVckyqaC3VY3HGmZ
	MN2Yr+qvEOJGe0ieaDgHNViqrCCrrsZ5FnT8cH1X8q94oEv8EgUctN9G
X-Gm-Gg: AYBFou0CZQCyxxc9pv/Q+6wd3mFkPgCpOEznlQDfRviCVi0YwxhpOa/J1Eo/5BbR/gu
	LOOQQRTjFej6IfdfmlccAIRl8o4+gwztat+mtRwQsDOC6ABTZIykH7nsdnx9hVflkZheT1bgm3g
	uEwgPRIqZscfQgFQ1C5jQpivCIBoq1vIMXHvMMY+SdwNLo88ZLsIRvgbdlI67X9EMEttBN437wa
	/Dgg6Wc0pP42gZLIsoIVBaTqIcWvdVkAF50bhd2WOg9m8EpP0k/G2EZkiQvSOAfpRKeIwyzNIjI
	n7K9y0PiQ4nljCIbklAY0GamlD/vLSdlpc0QdQgXWgG74TUKjDas8vUIBr9cz9OyA1Y/hJNFFIE
	yQj+tpi84PtSFbiYSkbMPOdsTL2KxYT4b+4DE9BFlqf7R3PK65N1O3hGhmeei93UWTg7bFxxd5V
	WIdob9xTrqHbKj6ydHgsfImeIYQ2eBWiweOwXaCLsUZ7cwlSWwo7ucyiLKsrSwEIdOz+8FbC/yV
	XkUJVKqywcUahUCPv1wbeJ1ySsSqsq/TA4gBNelY2Jl/xKaeVr5jCQp2ACijWA6T00Ecmz+JLSn
	JI7QT0YyKB76hVLOJO++w36RGdXbO2nlmnI=
X-Received: by 2002:a05:600c:1c08:b0:4a1:70ed:882b with SMTP id 5b1f17b1804b1-4a17b536678mr3932625e9.8.1791261580590;
        Mon, 05 Oct 2026 21:39:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm62744995e9.14.2026.10.05.21.39.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 21:39:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ntfs: map each LogFile page once in ntfs_check_logfile()
Date: Tue,  6 Oct 2026 06:38:10 +0200
Message-Id: <20261006043810.5393-4-kmehltretter@gmail.com>
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
search loop but calls kunmap_local() only when it moves on to the next
folio. With 4 KiB pages the positions 0, 512, 1024 and 2048 are all in
the first page, so every mount leaves three entries on the kmap_local
stack of the mounting task.

64-bit kernels do not notice, kmap_local_folio() does not touch the
stack there. 32-bit kernels with HIGHMEM return from mount(2) with the
mappings in place. With the generic entry code that is a warning:

  DEBUG_LOCKS_WARN_ON(current->kmap_ctrl.idx)
  WARNING: include/linux/highmem-internal.h:17 at __do_fast_syscall_32+0x21e/0x550

The stack has 16 slots, so a process that mounts ntfs volumes five
times hits the BUG_ON() in kmap_local_idx_push() during the fifth
mount:

  kernel BUG at mm/highmem.c:480!

Map each page once, when it is read, and unmap that address.

Fixes: 5218cd102aec ("ntfs: update misc operations")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on top of patch 1 in QEMU with a fresh mkntfs volume and a small
program that calls mount(2) and umount(2) eight times in one process:
- 32-bit ARM (multi_v7_defconfig plus KCOV, virt, 1 GiB RAM, 256 MiB
  highmem) and x86-32 (i386_defconfig plus HIGHMEM4G, 2 GiB RAM): without
  this patch mounts one to four succeed and the fifth hits the BUG_ON()
  in kmap_local_idx_push() on both. With it all eight complete.
- x86-32 no longer warns when mount(2) returns. Three mounts in a row
  with mount(8) are clean on both.
The other kmap_local_folio() loops in fs/ntfs (lcnalloc.c, mft.c,
bitmap.c, compress.c) unmap on every path before they map again.

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

