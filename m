Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803692F6188
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 04:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261582; cv=none; b=SzXItxKtUWeC3OtBWJjlbVezItQSjN/3mVvw1HOpnqJrnGXttAVqbz+qRXs5cjxHY28UJptiNQ1waU92sfMqCdOkryKMV/aVknCUiI/Ax6JBlPGg3OQMIF2bRx88wH8ddQjmprrK9Y1rnqTlmtG+81zM/ScEjoZAvSDLhi7yJDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261582; c=relaxed/simple;
	bh=tWsplIKQlCrKEI3znVxfP3UflojL0jxV8E4AkeIkcUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=URVJbB9C7bK44D8N2l96n3vLZH4wg9WmLxhvHiKZZlYr52rMDtDci5R8iyyjreQBFHvwx6KkoJUDlQ+Q6F/fE+PtNTQpr+jDPfjFXFDzkugbywJbJeaLm1OEh3IXn34WrfhdgX4RcH/SavPmiYAe6tc5jsWIxfRInaMmOEDLN64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn8g/KuA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn8g/KuA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so1760535e9.1
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 21:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261579; x=1791866379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNnyigt47m4RvfnCZkqOS4nkufUVHYq8Muto1Qo9rTo=;
        b=Mn8g/KuAj1kCPW6szGlbPHthKBBZ8ZOQ/nkanJm59gBT44/3LrDchmBjVKd9CZN+p+
         wkqTersLOV8u675Ngek5OyTJT5FC9iog40d1/RRs5Xdwhzx3uql4XiWVULDthLNgzK2M
         aCpBeqy1YfMczbm53uuLM0ndGddaM2QCxZoYorg3qb4Tei4QOLkKujjWaq3FB8XrNdjg
         HF/Q0jEi+PYU9DVIok+NPl8oXKonYITJWcq1MY03GVYfHbeS5joBDprtnXqk1QkecFzF
         R65f0sGh+9RPhbRESFTkianj8eyYGjKcy88RQXhUDN/x533EaXTDszoHJ57bK1NhyA3I
         Wwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261579; x=1791866379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNnyigt47m4RvfnCZkqOS4nkufUVHYq8Muto1Qo9rTo=;
        b=eD/iLLTlOZ8tv7g5U7gUjwcaKEw8WX1CnDUtHjc4hRRkkPRDLAi0jiWW05r0pOEoMp
         HGdYZvHYgr+zU+yd6TQ+ybdymDe7q0j1iLnntbftlzJ4YQB/m1zVFSsNV4mOBFXjJ1N6
         u1KprPoUlKhfHZz9+aVO7w+IUfk0Mlm33hrJjMmNoVQhPBctDsPjl09Hp9dnus/nLOJk
         M4nEErLbKN24s24DfkfeV6wHZak2nFwqfYGL90RWeXcGiI/BwatguswZh1BbXRnordez
         8mmv+PbWYGY5JurZ7ikYt5tyWY0F+8RN/dJQVTELRdPgpfT7K+J2pTTaJFBm66kqVt6y
         BD3w==
X-Forwarded-Encrypted: i=1; AKwUvByP56QZY0CEP8DpIf9qrdnq52qJZp702SvYExqOAvSTiOreqUaPNQIZzaoxIsRSCO2Mvzhh@lists.linux.dev
X-Gm-Message-State: AFuF++k3AcI4b6Y7jxY7H+Nair0JBXGkQ3Jlm0kBQ9EuTYiGaJ+p2tNw
	H52Nuk4NYAq1jgTxVcEJgZ2qOsRnAwoNYVALkApqTwdDWbABQ+TgcdHY
X-Gm-Gg: AYBFou0cxOiFmLXL6Np8RXtPFPzRmBvTYTTBe9dTwzH/PghQxGoEIEt/rr51KTu2OP+
	IB05DJTslj7UuAYw6uh6u6vzPZh4e8wEBRQU9UrrUtgzWxoNSn3r8K5a2uVgRRAtSjMNrfs1w/E
	+C85QZv3kbkZp7NjSC5JIFvlMSSNGq9+ASZwQ6bWUyfF4n+lQHCxWuD2ab/ii8AkVfaNzhU1LQ5
	VERQ9bDs17TQ3HX6f0G45ptXf67EcdrKu3hRUBhUTHNcyR2KMzPL5VT+pbOnlvz518tH9VewPI+
	+j8so42bV4+urSaj9wgT8BrD4gucF+4bnEXUSfY/w3lJ2GCk5IzKvZr7ZkQWY8o8ujsQCg7uyoO
	dMd1TO/b+7UDihAqPEOuS0kvszUpBcKC5lTGdn/wep0pvlXB+3B1aVslP4dnOKr04gzN3t0zf+M
	ocOxY/3EcRjBHcpMdZ4lh/pGozn6N3sDUCBR15OvX7FXYWNIoIVkDFHRuW44lsswQrTtcG6D0xC
	oCVWkZkmM1WARHIzayK/bJRZL9hRrkde4QUN0s2PMdgyv7F25L66Ic06vw744lrdWwjuDSU+Wjw
	DIB0r1rwm2F+6OJSW9a23mienJqDz7jhF0Y=
X-Received: by 2002:a05:600c:4e55:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a17b54a224mr3366195e9.18.1791261578618;
        Mon, 05 Oct 2026 21:39:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm62744995e9.14.2026.10.05.21.39.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 21:39:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
Date: Tue,  6 Oct 2026 06:38:08 +0200
Message-Id: <20261006043810.5393-2-kmehltretter@gmail.com>
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

check_mft_mirror() compares the mft records of a page with the mirror
records by advancing kmft and kmirr by the record size for every record.
It then passes the advanced pointers to kunmap_local(). After the last
record of a page they point one page past the mapping.

With HIGHMEM kunmap_local() warns that the address does not match the
top of the kmap_local stack. What it does next depends on how the
architecture finds the page table entry:

- 32-bit ARM looks the entry up by that address. It clears the entry of
  the neighbouring fixmap slot and leaves the real mapping in place.
  The next kmap_local() on that CPU that reaches the slot hits the
  BUG_ON(!pte_none()) in __kmap_local_pfn_prot().
- x86-32 takes the entry from the stack index, so the wrong address
  does not select a wrong entry. In QEMU the mount carried on after the
  warning.

With 4 KiB pages and 1 KiB mft records the four mirror records fill
exactly one page, so every mount whose $MFT and $MFTMirr folios are in
highmem hits it. A fresh mkntfs volume on 32-bit ARM
(multi_v7_defconfig, 256 MiB of highmem) fails on the first mount:

  WARNING: mm/highmem.c:623 at kunmap_local_indexed+0x254/0x26c, CPU#1: mount/85
   kunmap_local_indexed from ntfs_fill_super+0x224c/0x35a0
   ntfs_fill_super from get_tree_bdev_flags+0x1d8/0x2a4
  ntfs: volume version 3.1, dev loop0, cluster size 4096
  kernel BUG at mm/highmem.c:565!
  PC is at __kmap_local_pfn_prot+0x210/0x214
   __kmap_local_page_prot from ntfs_check_logfile+0x1fc/0x1210

Found with syzkaller. Kernels without HIGHMEM do not show it.
kmap_local_folio() returns the direct map address there and
kunmap_local() has no mapping to remove.

Keep the addresses returned by kmap_local_folio() and unmap with those.

Fixes: 6251f0b0de7d ("ntfs: update super block operations")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested in QEMU on mainline 551c722f4080 with a fresh mkntfs volume and
with the syzkaller program that found the bug.

  ARM     multi_v7_defconfig plus KCOV, virt, cortex-a15, 2 CPUs,
          1 GiB RAM, 256 MiB highmem
  x86-32  i386_defconfig plus HIGHMEM4G and NTFS_FS, q35, 2 CPUs,
          2 GiB RAM, 1.1 GiB highmem

In the table, warning is the WARNING at mm/highmem.c:623 and BUG is
the one at mm/highmem.c:565.

                          mainline            with this patch
  ARM, mount              warning, then BUG   3 mounts clean
  ARM, syzkaller program  warning, then BUG   3 runs clean
  x86-32, mount           warning, no BUG     warning gone

x86-32 still warns when mount(2) returns. That is the bug fixed by
patch 2.

The other kmap_local users in fs/ntfs unmap an address inside the
mapped page. Only check_mft_mirror() advances the pointer it later
unmaps.

 fs/ntfs/super.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 4066bacabe37..a53f9997c152 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -959,7 +959,7 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 	struct super_block *sb = vol->sb;
 	struct ntfs_inode *mirr_ni;
 	struct folio *mft_folio = NULL, *mirr_folio = NULL;
-	u8 *kmft = NULL, *kmirr = NULL;
+	u8 *kmft = NULL, *kmirr = NULL, *kmft_base = NULL, *kmirr_base = NULL;
 	struct runlist_element *rl, rl2[2];
 	pgoff_t index;
 	int mrecs_per_page, i;
@@ -974,9 +974,9 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 		/* Switch pages if necessary. */
 		if (!(i % mrecs_per_page)) {
 			if (index) {
-				kunmap_local(kmirr);
+				kunmap_local(kmirr_base);
 				folio_put(mirr_folio);
-				kunmap_local(kmft);
+				kunmap_local(kmft_base);
 				folio_put(mft_folio);
 			}
 			/* Get the $MFT page. */
@@ -986,7 +986,8 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 				ntfs_error(sb, "Failed to read $MFT.");
 				return false;
 			}
-			kmft = kmap_local_folio(mft_folio, 0);
+			kmft_base = kmap_local_folio(mft_folio, 0);
+			kmft = kmft_base;
 			/* Get the $MFTMirr page. */
 			mirr_folio = read_mapping_folio(vol->mftmirr_ino->i_mapping,
 					index, NULL);
@@ -994,7 +995,8 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 				ntfs_error(sb, "Failed to read $MFTMirr.");
 				goto mft_unmap_out;
 			}
-			kmirr = kmap_local_folio(mirr_folio, 0);
+			kmirr_base = kmap_local_folio(mirr_folio, 0);
+			kmirr = kmirr_base;
 			++index;
 		}
 
@@ -1006,10 +1008,10 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 					"Incomplete multi sector transfer detected in mft record %i.",
 					i);
 mm_unmap_out:
-				kunmap_local(kmirr);
+				kunmap_local(kmirr_base);
 				folio_put(mirr_folio);
 mft_unmap_out:
-				kunmap_local(kmft);
+				kunmap_local(kmft_base);
 				folio_put(mft_folio);
 				return false;
 			}
@@ -1045,9 +1047,9 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 		kmirr += vol->mft_record_size;
 	} while (++i < vol->mftmirr_size);
 	/* Release the last folios. */
-	kunmap_local(kmirr);
+	kunmap_local(kmirr_base);
 	folio_put(mirr_folio);
-	kunmap_local(kmft);
+	kunmap_local(kmft_base);
 	folio_put(mft_folio);
 
 	/* Construct the mft mirror runlist by hand. */
-- 
2.53.0

