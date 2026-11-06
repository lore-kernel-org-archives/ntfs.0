Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964487;
	b=f/ZL2VdX/azGl058w8/QAJH1+RfxxWtGkrJHcs0lmiVkk0I9cKV4esQ2VOEV9eNHXjcz
	 in4Od8CTANyUiq9rDKMd505I7isbCvL025N2ch0y/38bVis7uawCsnHRy44sxyxvaigKR
	 p4A6uC0DTJ+jaSD63YtrufqO3M09dcVMua+bQzZql0ljc2ORh5RfJK1AQwg0XRjYPpMQu
	 U6udPx5QbfVc/oPvvjQZp5lBo5PBOPuh5aH+nUXSkITn6iBeuMY5XVqMn0VMivZ1FSXOD
	 Z8QBGpi/xKUCbz16qc8QVnCWDdqin5WayX2pSLt/F2olPLRSWItAJqVN1vfSg6OqGaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=r0oGiXSXqPWt2ut4NcPnn3BOhuEor59O/W/UHXN5XZI=;
	b=sTznumE12wA3tG86DRb45037qqS91/yLWlQq9VIbgy8NXUq7kMMXXB4QE4+BAEMp8iiC
	 hUVPhaR7VqS1xD/t7WQLHZO4InTeB/KPIaNiilfJU66l5+U0RNSszjT8TwqumUD2qbOVm
	 CcWGMt2loh6o0JMjQbkzhEe3FF4LR5Gcw5KyM0KwpL3ETGcaRuJ0Aad/tLKDaoygPkk49
	 TC/kZiWVQ857eWxpuF0Pra7Ktl1WDfcSF5TGvTnYJLL5FirwbXPM8AUTejWANHFeGB7M3
	 99vwaBpkLOaVNgEGPB/YaGVGNzKyKyk2mOsA9TkzVx/NoqO/IFphOQqNtnnV6XrL+Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6iU+Yw4;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA40606A32F
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 11:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CA40606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6iU+Yw4
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3704d30b84fso169461eec.1
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 03:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964485; x=1794569285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r0oGiXSXqPWt2ut4NcPnn3BOhuEor59O/W/UHXN5XZI=;
        b=Q6iU+Yw4e/nCikRhKRYIOfznqzqnsG+ugyIG79Lqu7zRZRQ4FnrqVI6PwYMgWZ0biI
         jRw90ji1KJeSR7yOM/xeV3lcnXNT2D4iwO3W4cGmA21y7u1zDfMGLpuyIf/GFu646dbp
         xz19Xf94WPxezMODZakmbBJJd8Z/qi/wHcVtKNWk2yhnIg5FAv7zZDKQlMMdkKmJtWap
         PI69djdP2utBLwG6zyrvDtDmvORnLHwD6Ek3ovyk5RR0KbQ0vUnjdIUqtZelEDVXLPaY
         DB1YoNRrrMwDur/mzs/f45aCnZxj4MhmNn2H+PWxgLvaGiEO/yGqFMhWJk6y9Emaboto
         m+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964485; x=1794569285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0oGiXSXqPWt2ut4NcPnn3BOhuEor59O/W/UHXN5XZI=;
        b=rW0AcYDQTXOd0C1i4WRShOJT4tgMnioKVJ8m7MbvN+14SbHOacF/WJJ7UNufx68ydd
         v1OcYahXeusG7YfjkAW2GV/EEvVdLog22/mYYnYzYHjSF0gP3f0U3//OvCqHGLJKIyKJ
         jbuB8X1vnFjJFQXMkeat0I3mh0r5uULKpCJ19LJFgdEcxSwd3PgEOmHnqlYTDInzl/yx
         DPyYfK3wZrnpZSh8aW2zg2jMt5OEqD0aCDBIVcnZbMCkO44zzMDRsk4dlWc9g4qxRtBb
         QcQrHhRYPKDXA2vSyaIm6PokRM3DKfyouqA8cikBEwlEVIAGEgUAOIvoKFki9YKhH/cB
         nlng==
X-Gm-Message-State: APuU4Z8Aqa2OhIoe5eg3aBQeeftbi7wwtx1x04GI9i49P7HfI3CXesdh
	4AvRc+7ei/ny2oiZ1aw+BBNAd2ZMFNDoEIb/4IeARJJIZWqkCJ6ckSxI
X-Gm-Gg: AYBFou0aMt7NwjQQqMrmIpsmtAZMkazgTxrYSC1tNXQPjPynmwpsBOcruIemA+MlmQl
	kfQZJRwlDwf9vicsE66H1rW5xFLr90r3rTlpArvaWrcuI/Z5EihTkcgS5klomvz0h3uXBNTRHn6
	DWlUTd3Fqr+eMVh+CMismlhDLeYStWwCJIt1Cc9ItGUL3jcYYLhqRA9Hltc8nApTYysGTwWttyQ
	5qRY4Z8SkUeQAGHZDD8j2vdjZonpYcOonr3dhstgu2gXBeqZiKVFvEaTz90OJqRGu2NJMp6ZiDG
	jkN++o1/jzv2o1/Z2cCvhLR7HKi9+s6zNfQsOcM1ZR2i8EFQ9imlvTDVwR5TvG+nAkkMfKWdEyC
	Gkogfkl6P6eoiyE4KzYleA7h8bfzfz9zovxbt29vW0zKh5p7GGVUUsIxolM70+LKCO02hdeVl8d
	eDT/mQGQ2soF7MarLkWz9JBbL2/+RdWVCA98ygFVa8pr4dshMcqe3BfG9bddMZTtsMh74KZiGA4
	gXPeU0Flq08Pt4EyZl2JE2bFRm6NrZrrjajRGpnwXRCsGMhR6q+jMxGTKKQ9jfb3L5qcqUywXfj
	SEGQ4wPvApqIFWKYEwMAOQkm9Jze0e0S98InVOAta0ct74yzRJCIrVzULYfBL0BKug==
X-Received: by 2002:a05:7301:4d08:b0:36c:a154:db1d with SMTP id 5a478bee46e88-36f722eabcbmr2881866eec.4.1793964484814;
        Fri, 06 Nov 2026 03:28:04 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6029179eec.23.2026.11.06.03.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:28:04 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ntfs: check the file name against the key length of an index entry
Date: Fri,  6 Nov 2026 16:57:52 +0530
Message-ID: <20261106112752.2552832-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ntfs_index_entry_inconsistent() checks that the file name of a
$FILE_NAME key fits in the index entry. It does not check that the name
fits in the key, which is what key_length describes. Code that works on
the key alone relies on that.

ntfs_readdir() copies key_length bytes of the key of the next entry to
resume the enumeration, and later uses the copy to search the index. If
file_name_length is larger than the key holds, the name comparison reads
past the copy:

  BUG: KASAN: slab-out-of-bounds in ntfs_file_compare_values+0x2d1/0x4b0
  Read of size 2 at addr ffff88800a4ef2ce by task init/1
   ntfs_file_compare_values
   ntfs_collate
   ntfs_ie_lookup
   ntfs_index_lookup
   ntfs_readdir
   iterate_dir
  Allocated by task 1:
   kmemdup_noprof
   ntfs_readdir
  The buggy address is located 0 bytes to the right of
  allocated 78-byte region

Two bytes of an image from mkntfs are enough: in an entry whose name has
six characters (key_length 78), change file_name_length from 6 to 7, so
the key claims 80 bytes. The entry itself is 96 bytes, so the existing
check lets it pass. The next readdir of the directory reads the extra
bytes.

Check the name against key_length, and check that the key is large
enough to hold file_name_length in the first place.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
This is independent of the three-patch series I sent earlier today:
https://lore.kernel.org/all/20261106091420.2461683-1-wahidzk0091@gmail.com/

It touches the lines just above the "return -EIO" that
"[PATCH v5 19/31] ntfs: report index validation and block I/O errors"
changes to -EFSCORRUPTED, so one of the two needs a one-line rebase. I am
happy to do it on whichever lands first.

 fs/ntfs/index.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 322cb371d..1abca298a 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -43,9 +43,11 @@ static int ntfs_index_entry_inconsistent(const struct ntfs_volume *vol,
 
 	} else {
 		if (collation_rule == COLLATION_FILE_NAME) {
-			if ((offsetof(struct index_entry, key.file_name.file_name) +
-			     ie->key.file_name.file_name_length	* sizeof(__le16)) >
-					le16_to_cpu(ie->length)) {
+			if (le16_to_cpu(ie->key_length) <
+			    offsetof(struct file_name_attr, file_name) ||
+			    (offsetof(struct file_name_attr, file_name) +
+			     ie->key.file_name.file_name_length * sizeof(__le16)) >
+					le16_to_cpu(ie->key_length)) {
 				ntfs_error(vol->sb,
 					"File name overflow from index entry in inode %lld\n",
 					(long long)inum);
-- 
2.53.0

