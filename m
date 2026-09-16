Received: from hades.hexcom.net (hades.hexcom.net [94.130.240.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D353C8C49
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.130.240.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564740; cv=none; b=WqtSPOoUoPdbdBYlVDl7+RT2H/t5uVCoZVDAD9Mz8x+Yyc8pbOeXvdEMqESEanLNyFyxSfkuxR5IVbt9wcu3CBESBVFP20qFnoZ9DKW43uWki82MLC67VxC+jEh/M066Ek1R/kHZT/vqTrBfgcZEchnECgieNngb0Vl3BTLzum8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564740; c=relaxed/simple;
	bh=GXwPMyaBvjTBwdPMMxSocAGTZN9pbXeraMkHxZUQoqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OeZ2Rjj9heTDzpfrt640F/FsBJAL7OnSB1AYpMiWnnbG4aa6K34TZ6nUGzat+BAqjqn3h31/WUu2v957I9SwncT/TN/f146xkgjYLKWt73ktpj9QPRYhYP/CHfQZswyFWjB7jlH5qDJlLic8BmNEp4KLHR+3KhTBm3Mb/fSVr6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesolowski.eu.org; spf=pass smtp.mailfrom=wesolowski.eu.org; arc=none smtp.client-ip=94.130.240.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesolowski.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesolowski.eu.org
Received: from [78.30.104.81] (helo=PI.tailc0d925.ts.net)
	by hades.hexcom.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <marek@wesolowski.eu.org>)
	id 1x6pXD-000cyx-7h;
	Wed, 16 Sep 2026 15:18:47 +0200
From: =?UTF-8?q?Marek=20Weso=C5=82owski?= <marek@wesolowski.eu.org>
To: ntfs@lists.linux.dev
Cc: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Subject: [PATCH] ntfs: stop MFT writeback at allocated boundary
Date: Wed, 16 Sep 2026 15:18:37 +0200
Message-ID: <20260916131837.28568-1-marek@wesolowski.eu.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-YourOrg-MailScanner-Information: Please contact the ISP for more information
X-YourOrg-MailScanner-ID: 1x6pXD-000cyx-7h
X-YourOrg-MailScanner: Found to be clean
X-YourOrg-MailScanner-SpamCheck: 
X-YourOrg-MailScanner-From: marek@wesolowski.eu.org
X-Authenticated-Id: marek@wesolowski.eu.org

ntfs_write_mft_block() tests vcn in the loop condition before
recalculating it for the current MFT record.

When a folio straddles the end of the allocated MFT, the stale vcn from the
previous record admits one more iteration. The recalculated vcn can then
equal end_vcn. Runlist lookup fails and the volume is marked erroneous.

This was reproduced on arm64 with 16 KiB pages, 4 KiB clusters and 1 KiB
MFT records. With allocated_size 0x13000, writeback of folio index 0x4
attempted to map VCN 0x13. Creating an empty file left the volume dirty and
the next mount was read-only. A mount and unmount without the file creation
remained clean.

Calculate vcn for the current record first and stop at the allocated
boundary. The patched driver passed file creation and deletion, a 64 MiB
fio write/read verification with crc32c, sync, unmount and read-write
remount.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Signed-off-by: Marek Wesołowski <marek@wesolowski.eu.org>
---
 fs/ntfs/mft.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 98ab686..5af0b6e 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2681,12 +2681,14 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	/* Clear the page uptodate flag whilst the mst fixups are applied. */
 	folio_clear_uptodate(folio);
 
-	for (mft_ofs = 0; mft_ofs < PAGE_SIZE && vcn < end_vcn;
+	for (mft_ofs = 0; mft_ofs < PAGE_SIZE;
 	     mft_ofs += vol->mft_record_size) {
 		/* Get the mft record number. */
 		mft_no = (((s64)folio->index << PAGE_SHIFT) + mft_ofs) >>
 			vol->mft_record_size_bits;
 		vcn = ntfs_mft_no_to_cluster(vol, mft_no);
+		if (vcn >= end_vcn)
+			break;
 		/* Check whether to write this mft record. */
 		tni = NULL;
 		if (ntfs_may_write_mft_record(vol, mft_no,
-- 
2.47.3

