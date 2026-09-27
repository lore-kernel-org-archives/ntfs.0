Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DF7195B1A
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485714; cv=none; b=qIkCYBa4/LIvvGKcG+6pkgZsDHO9pFmnM6/A3jp/c5Rzsg05V48gbQYzr0wZ47EaYOC6wLB2lGumexzJL5516F5CJkde9buOU/f12Ld8krMAg9dJ/6W3t+QiNSv3IK0kmkpJuazXMNPV4N6xNkwoD+X3rzPOElZd8EMSuiudcns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485714; c=relaxed/simple;
	bh=YFMedcLY/M4zuhaWIeBEi/XLzTwpA8jS3WV4wGPTyc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pyqjl0j4Ay09DaqcDCjcRnS7yUe1BrkgZpDRMm3qOiMFzMvxw8ZZQX4YSOXqlXs2KC2lkCG3bcvxcczl29jVdhMpQPVSwTUoBuXJmtplKZKL35ywB4lY08gRpKk9jR0GAxY++rm/WUBJ9IUxeEeuzl/yR4Y5HqOt5ty5/vaqzDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHtPUOIY; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHtPUOIY"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso8701135ad.0
        for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 22:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485713; x=1791090513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbQX4osT0iHuALCntOuZ42CmWUb/HAhxOLR/MsgsY78=;
        b=lHtPUOIY1um4q1DVmnw3r0IayriM4pylBQKcUa+y3IJZSrnToDdy1udE7RXIJniTJA
         Whlm92QuR8AiRRpxEmmKLmSPDQMhrizJKA8+ReU4Af4oAWbXPLmAEBEZoyAqkmo/rbMO
         FYOseUqq9reqq8QRAbhyCVwQxejPXWYmCFPO7BB0TCsgIrCb/m+QD7jewP88I8wCWiU4
         iinaqSuAxvucUDIpkYp3qb0oyyut7WDGc/1G7orv1SipVZAE14i4++mXhe/TmGQKCbH5
         25s405JPWkALucxUq/VO23eepMTyKDspzcIqd45a80QGrQ5zD96rMYWxM9BQb94dN5DF
         BAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485713; x=1791090513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbQX4osT0iHuALCntOuZ42CmWUb/HAhxOLR/MsgsY78=;
        b=T1tJLDOgqDvMp5Y/pci5QohLn8tDeDu1JGx7ygj7k543LeXmXKQERq6DNjgQ7v/K3c
         sxQyuE2LyxG1KsMlR3YcYpkfsnRVVw4c48zUM7YKuVt99pIXGrCGAhwTArfftMm6kD8z
         fB3vkS67WGolnvT72IYAEGnukw7hI3pwQa2Zm3M7iD+k2H1hhpn78rxovXG67J9Gc37q
         WZXVV2A7KaVt5ds91rnt3oVnwb0s6S5En4ZZs44rn38fA6L05mO0+8xKRw1JlXYmwhCD
         6IUBOK6FTnj4UsLHr2vwPcYniTe+iQMWAzEXrA4RZTZF7Og6Yne4BdicTa0MvPnL2RSk
         STVA==
X-Gm-Message-State: AFq9FYJWb0LSHsYPZ0cHtORNynW8PKp/lMBd/r6vPxGfxQvAXI4kR04p
	/qKdT/pSs+pT2rqkrLeBDVPff9yvNmYFpmwuhSeV7HxUc8xLRtS9pjrlt2LqnatdUuCybw==
X-Gm-Gg: AYBFou0fxOKwU2BApdquwJMek8XzhO6yrkvcsz+yIE9OR1eT1omydclWTs0wwN+/B0u
	zas1M4Zys6a/vP2jbF/y4cKdAhjf6JfKJ4XIPV9WD1mUSOwDaBW4yM/WY2GIkxXhBoOl/yHhrtL
	xs+/A+7hWBWQdBNnccOUdjXsNF1MhiRD8DJB5h6PoLOpgQ9XEOoKcFoMiq7zs6iuWCtdH5qN+Sk
	WoZwlaK1XtrFEAA09Ao/RFZvRJj5ZETgKHd/dbPvOgqvzLV7co+QZFpQ7f1b2gErOj3Gml/V4Q5
	rwrgiA0tRlYvgWSjsv2NwGTeTWP2Wrffdv0agEJGFvVgMGgmos3StQj5xcfdyP3nBUthJIraJNo
	lmE+wKR280JFMtIJ6FmEHOwkZNADowLTSMOsDsAs3BZBFWOmBsPqDHzV/Ta6J7KJwVPZxnZHvEh
	OUkkvBqou7+JkjatZzC/q8JJUd0giY6DJi8QD1ACuW6cKD84ubgYaRpsTyLqzZuqKw+uvbYp8La
	LOpD7FkpBrsWrR0i/T+YNBgrOHZ4RojFqPwFVwSCoRjtIRcYRSoULtFycoaT4TFLfhjkYFbSBIZ
	CGCWuSg3xjsC9h3wlOTVreyPv/hFvObIPLdWqvYRMEdK5TodkxczaOlK8Y8=
X-Received: by 2002:a17:903:228f:b0:2df:a4d8:579e with SMTP id d9443c01a7336-2dfa4d85a9cmr30233225ad.45.1790485712776;
        Sat, 26 Sep 2026 22:08:32 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:32 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] ntfs: do not map an unmappable runlist fragment as a hole
Date: Sun, 27 Sep 2026 13:08:20 +0800
Message-ID: <20260927050831.2739166-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790417653.git.matthias.goergens@gmail.com>
References: <arMoap0ZgeORuktT@hyunchul-PC02> <cover.1790417653.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the extent mft record holding part of a file's runlist cannot be
read, ntfs_attr_vcn_to_rl() ignores the failed ntfs_map_runlist_nolock()
retry and returns with *lcn == LCN_RL_NOT_MAPPED.  The iomap read path
only rejects lcn < LCN_ENOENT, so it maps the range as a hole and read()
returns zeros with no error.  The first read already does this:
ntfs_attr_map_whole_runlist() keeps the fragments it could read,
readahead drops its error, and the next lookup finds the unmapped tail.

On a file whose runlist is split between its base record (vcn 0-214) and
one extent record (vcn 215-1499), breaking only the extent record's FILE
magic makes the kernel log "Failed to map extent mft record", yet read()
returns 1285 clusters of zeros for vcn 215-1499.  A damaged attribute
list entry, which makes the retry fail with -ENOENT, gives the same
zeros.

Return -ENOMEM if the retry ran out of memory and -EIO otherwise.  Both
callers already handle an ERR_PTR; other negative lcns, including
LCN_ENOENT, are returned as before.  Reads of vcn 215-1499 now fail with
-EIO.  An intact volume exercised with buffered, mmap and O_DIRECT I/O,
fallocate, truncate, sparse and compressed files behaves as before.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/attrib.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 333b3371acb47..a337a3429b401 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -317,7 +317,7 @@ int ntfs_map_runlist(struct ntfs_inode *ni, s64 vcn)
 struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64 *lcn)
 {
 	struct runlist_element *rl = ni->runlist.rl;
-	int err;
+	int err = 0;
 	bool is_retry = false;
 
 	if (!rl) {
@@ -335,12 +335,21 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 
 	if (*lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
 		is_retry = true;
-		if (!ntfs_map_runlist_nolock(ni, vcn, NULL)) {
+		err = ntfs_map_runlist_nolock(ni, vcn, NULL);
+		if (!err) {
 			rl = ni->runlist.rl;
 			goto remap_rl;
 		}
 	}
 
+	/*
+	 * The runlist fragment containing @vcn could not be mapped, e.g.
+	 * because the extent mft record holding it is corrupt.  Do not hand
+	 * LCN_RL_NOT_MAPPED back to callers, which would treat it as a hole.
+	 */
+	if (*lcn == LCN_RL_NOT_MAPPED)
+		return ERR_PTR(err == -ENOMEM ? -ENOMEM : -EIO);
+
 	return rl;
 }
 
-- 
2.55.0

