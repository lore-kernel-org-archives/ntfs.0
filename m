Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189890;
	b=RgxbhcpSWinfLwU85if0xUUiy39ESa1/q08FqwuVGGUrYpACGtT9gpx8nLPMsfASgVr3
	 t9RaUwgQbllRktxaE47sPFuOPfr7gNrXJbmG2TCiekJIjoMjhYuBNB8rw5gYNqKydUrKH
	 oqDynTKZ0PoGOm95PlslZFKH8iGWKzm0zDB/yaHJCtqHcTY2UP2x3nw12KH6ERO5cCWmc
	 uTfs+Px1PizrfMw5bf8IvOfEYsxDoIjHAiWwz0SHgAkAuSFfRi+ZQdDGCFY9vNmDHFWkm
	 n5p5CptMMhEKh0wXNdVf88qbCov05+OiWGcY6+AyGo1UWzKPmkX1+NZqSPk0xdkDt3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189890;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=Xa+hjU1C7FRm7sFXOb3hUYs+ugWgEb89l+eyKkSxICg=;
	b=gvES/VsXaQmcc92T8FXJH5+FbTWIQLS8CGKC7sRFoHBnaiZ7QbL5NpqaT6sGnMonkgmf
	 /tUsFxT2KuaJHFjzy/DrA6XF8ta6Zq1y5X3I36jEzy4LzJ8G6Q+AY+dh7s6DYSg1NMBiI
	 knJErKx1XhjNADyyysr/nXSeLbC+Cq/srG3Ma2fg8T7t5iAgjCNcq7/XMg/X64t77Vqbw
	 Vg98Pn2RQoJEj8Ux2btxDMxvlQ0HAByjwZdPFwZJds/Ek6c14IhnOZiEaMJ00r2HS/EBQ
	 nE2RE2KQjIJURC8qcSrvqxs2yRz7jd05unSe+iab3ZUvbbh+g3ZpidM1mfAjRYxqbaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ib4yNxnw;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ECE606A32A
	for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 15:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88ECE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ib4yNxnw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Xa
	+hjU1C7FRm7sFXOb3hUYs+ugWgEb89l+eyKkSxICg=; b=ib4yNxnwqspco0VsSx
	R8BWtmt+uK7aZvUBP9FMw8SYh0g7X7x2rDIwyQrP/RKfPy98ZtgOO1V5crtlfDW0
	rLPw2FF73zHnv1w/2LABTWu44nJKcdnJT9dgEniy6jrL5PoL0+39Bil1BVJQK9XH
	9fRC5dVCeoVx76gp/OeB5x+1s=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnDz1SbABrL9dQJg--.55408S2;
	Fri, 20 Nov 2026 23:50:44 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: d3nchk@outlook.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH v1] ntfs: limit MFT mirror comparisons to system records
Date: Fri, 20 Nov 2026 23:50:21 +0800
Message-ID: <20261120155021.1618964-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnDz1SbABrL9dQJg--.55408S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF1kJw43uF4UJF1fGr48Zwb_yoW8Aw13pr
	sayan3tF4DJr1jywsYkFWrtFyFv3ykJa1UW34rXr4xWrn5tw4jq34rtr4rWay09rWrXw4x
	ZF1DKr1fGFWUAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joApnUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hQL1WsAbFT+qAAA3l

From: Baolin Liu <liubaolin@kylinos.cn>

Windows 10 can leave $MFTMirr records from record 16 onwards stale on
volumes with large clusters. Comparing them can falsely report
corruption.

Commit 749357bd48c1 ("ntfs: mount hibernated volumes read-only regardless
of errors=") made these mismatches force a read-only mount even with
errors=continue.

Limit the record checks and comparison to the first 16 records within
the mirror, following ntfs-3g. Keep reading the full mirror for runlist
mapping and location checks, and leave mirror writeback unchanged.

Fixes: 2beaa98b46c4 ("ntfs: restore $MFT mirror contents check")
Cc: stable@vger.kernel.org
Link: https://github.com/tuxera/ntfs-3g/commit/85e208176ffd16ce9a51a9f534b194f0ebbde6e3
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/super.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 98e6449fd79f..103d2b1b630b 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -1207,6 +1207,14 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 			++index;
 		}
 
+		/*
+		 * Windows 10 may leave mirror records beyond the system files
+		 * stale.  Read the full mirror to map its runlist, but only
+		 * compare the system records, as ntfs-3g does.
+		 */
+		if (i >= FILE_first_user)
+			goto next_record;
+
 		/* Do not check the record if it is not in use. */
 		if (((struct mft_record *)kmft)->flags & MFT_RECORD_IN_USE) {
 			/* Make sure the record is ok. */
@@ -1250,6 +1258,7 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 				   i);
 			goto mm_unmap_out;
 		}
+next_record:
 		kmft += vol->mft_record_size;
 		kmirr += vol->mft_record_size;
 	} while (++i < vol->mftmirr_size);

base-commit: 4862a81576e3b20ba40cb94a38c5df0450047ffe

