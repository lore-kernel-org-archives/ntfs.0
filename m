Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503882;
	b=Dmwxmruljkf8japuqvNC5dj9L/4xJspOl8tiUG8mAIaiOjcxvUSCTF00qxGG51CK++Nb
	 CkoACrH+M0/eKk5Fka5HzfGrVpHvvQcLKpvgIfJzVyX/lT45Zep+/ghgS0zdSccTEHTn5
	 XAeE4vuOdc3f6Kd2xKT4wJfJ9116fyImcY9L20L2blXWSUtTKHdMihWpXWG8fxim9Wdeq
	 AB3wTpqu1Zbv00Btp1AfG15D8D/tXGWJLXkQKF2uOLxO37fMx3TYd6fI5pCMlRyu7UzzS
	 c+MRUDuO80pUmWVsiJ3p4bzpMbJIpxYfVEZ3UJMnZyVfnkp/5Ml5MXL77jXTHGQGiGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1KnA8qJSnVaXvhcG07O90BVPJJO3cIpz1Me1LWhP5cc=;
	b=PhPWfY658dPMNrBXJn2WLatnBOIvVL6mSsxke8a4gc5nf6B72mj6YiH3DkBIt92uu9YP
	 g3Q/nv/WTlPBJq21FIrOaztUXJKWcTcqYCXmyA9TnR8ejHcP8ybbK/qdeMYK7B1cIkU9L
	 iL7XsKNi4iETtXgegcMI6agJqw7DRI6IlX9FhfyQhbdb1SXb632NKzHKPJRKLT4WjgkvU
	 bqgBQMZ6GXEy6Irie18Mru1GLLYWhLCfOznTiOkxEAEO8IRnm8mp0YiWKE69rvyrsFz3s
	 fb5vJeE66cUgktPeiFKndF2Go5/mHkcOBhIc4hQLPzCYCdxCj1jNm6fnWyWY55k9hyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r8dmw0U2;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9C860A261F
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 13:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9C860A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r8dmw0U2
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so2724404a91.0
        for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792503881; x=1793108681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KnA8qJSnVaXvhcG07O90BVPJJO3cIpz1Me1LWhP5cc=;
        b=r8dmw0U2fVw9noFZmuWiiUrx1FO8xB3DaF1PscTcGdFrNDGB42i3dvHFnlQzC5/XZz
         v1WjV/7x8nKw1TqZeMHp9oEUua59P1AsT2JGBY36R0jWaDHwCfT7MfMMXQC0Ik0z556r
         9y3gVLmWpVTiHGSxskasycl66VQipzmx6udAjHd0xPcTKtCPVXI5yEVcBWwg/L8Pp1Cy
         WFBgtPDpKMl0/iNterCCGAAHNa8cfkREGv/V5kPIEFarprLZ9B7JMRBDYHMCrjC0lblk
         h0O3O16z7U4WhFWfbW6+ilQ2H9FU6+PsSRaEbckrzMiTNW0KKKaNifyNjX2QXIL7c/hC
         WN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503881; x=1793108681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KnA8qJSnVaXvhcG07O90BVPJJO3cIpz1Me1LWhP5cc=;
        b=yvGREOdzFd4Hhwwka8MqInfuJHZqpFOwiVS9+SWcDI4dOxBULsHaP7Vcx3eT7n0qxo
         15O2iMLw0u4VMrX1AemMQjjWLcIPeU4i5Nq2vKafntN4RFfDBEBqJU9bQ6EhATbz4G+7
         5yhJB4zZW6fPA0JKoSz0geLlYPx7DpCGhknj7PNqmDqQId7iIIIKy+KKYooIUYyZuOOC
         dLk3p0Rk0mM6yOCzzyb+Lx7biqXk1yOB494PCeUrIHh+nlSQs3RRpd67gcLRSRISO8Jv
         cIa0rcRX8xhdP0D3LX8F6tITxroG6XKQcaDdWUKlYMows3atdfJvY4cxSI4RYFthOh1M
         JkLA==
X-Forwarded-Encrypted: i=1; AKwUvBxlsM6EtfVLE4wLOuPAMaO/kWbyDxtmzAb4uUwADoyL/V/EvYvZihUSCbkR9v5Z7T8kWqDV@lists.linux.dev
X-Gm-Message-State: AFq9FYINB6ihaLQaD1T0OpHSjVu5Mz9tzPEXjN6fFpB2fFxkJKu7yMtj
	5jDXpCTUXOjnEqaO4Z4YuIoaPLvkwG8jwC4cCPanmxHRLxVNLCAzHg8w
X-Gm-Gg: AYBFou2bBxvvtdWHvotlF8I2WZFheLKzcfNJ1WAwdAUdQYI8yLI6b0aN0e1UqkdH6fb
	4yJQbULo43aoDdmDACKoWKg+gkqKyjx8JuuHtf1o5+q+vCVTXfAtTedkY0PpMwJ7unhy1S/JK4h
	tcvf4mUgmbF0X6Kx5QNQaGAQw19UfM0OfoeFxXE8d7BEvMSFUnebkuPD3wqhVVpEIIK2dXGaBmE
	daft5txbXf6mAR3JvHSC/iXaSB12uxHL2U0ynBWT2i+giEVJs0GyTbPSTeOms/JGIOr+Akw7ozT
	HLAxg8AOcF7y0Ithrz+6we+2HMGbDiM6idkkGouUobS8/W875xAEv25mi0Yg4tEtD483iByfPv1
	QmNxH1qXPChqeCRm9V0lPjglN6Coj5B3nBW9acflThCenmHmgX4tqZv0rMCdgH6pfxAGNlL/yS1
	5uz4rceZ/uCnHv8l+93aK7TLg0nWTah7DDXMum+ly9DV6Pvm3iMrYRsh+IHSJXY5JXCr8co7ERr
	61ImTYdSix6e0M=
X-Received: by 2002:a17:90a:e7ca:b0:3a8:878:ebab with SMTP id 98e67ed59e1d1-3acef0c8905mr9887954a91.35.1792503880947;
        Tue, 20 Oct 2026 06:44:40 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d4004efsm3718231a91.5.2026.10.20.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:44:40 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Bryam Vargas <hexlabsecurity@proton.me>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] ntfs: fix u16 truncation of the update sequence array count check
Date: Tue, 20 Oct 2026 21:44:33 +0800
Message-ID: <20261020134433.1015126-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_check_restart_page_header() bounds the on-disk system page size by
recomputing the update sequence array count from it:

	u16 ra_ofs, usa_count, usa_ofs, usa_end = 0;
	...
	usa_count = 1 + (logfile_system_page_size >> NTFS_BLOCK_SIZE_BITS);
	if (usa_count != le16_to_cpu(rp->usa_count))
		return false;

The right hand side is computed in u32 but stored in a u16, so the count
wraps once the system page size reaches 0x2000000.  An image claiming any
larger power of two passes the check by also claiming usa_count == 1.

Nothing else limits the value, so ntfs_check_and_load_restart_page() goes
on to kvzalloc() up to 2 GiB for the restart page and copy that many bytes
a page at a time.  The size is only rejected afterwards, by the
(size >> NTFS_BLOCK_SIZE_BITS) != usa_count test in post_read_mst_fixup().

Compute the count in a u32 so the existing check rejects an over-large
system page size instead of being defeated by the truncation.  This adds
no new limit: the array holds one u16 per protected sector plus the update
sequence number and must end within the first sector, which caps usa_count
at 240 and the system page size at 64 KiB.

Widen ra_ofs and usa_ofs as well, as ntfs_check_restart_area() already
does: both are loaded from __le16 on-disk fields and every comparison is
against a non-negative value, so no result changes.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs/logfile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index ce38ce87f8fc8..2f27ae7a3927f 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -27,7 +27,7 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 		struct restart_page_header *rp, s64 pos)
 {
 	u32 logfile_system_page_size, logfile_log_page_size;
-	u16 ra_ofs, usa_count, usa_ofs, usa_end = 0;
+	u32 ra_ofs, usa_count, usa_ofs, usa_end = 0;
 	bool have_usa = true;
 
 	ntfs_debug("Entering.");

base-commit: 19dc08f1f2c5563ba4da6afd5ecace8eba163aef
-- 
2.43.0

