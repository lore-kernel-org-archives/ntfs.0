Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0EA44C67F
	for <ntfs@lists.linux.dev>; Tue, 21 Jul 2026 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627711; cv=none; b=GOI8vV4n+Av+F83gcWY3YQPjnfYIuITEVzWFhOJ1y/EWpUmTASSgh0OU55dWYNoYKumFx4Saplp/fV6FnU4Xrx4VDs2HzHWJ8HoCaoHWdFD+hwKCviPGKAJYhpER73bInjlLxJNr18y873CkvaAAPBV4geVh1ELD7e2nW9J+80Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627711; c=relaxed/simple;
	bh=4dKhfif08s32B8xphCubF92djmOb1U48YaI6DUFoz8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aZEmlPwvARv7FfRlUL4kWpBhKR3ecjAAP8n7tYYq7CB9dxJVW4UZbJn7j7Mva4uRvAklypyi42KG98eEPeeCTY1SFO43/MwL87uEQDbPFhUjhe+5b8jqryCBkDgmtagTJ1h5kOLWLfAtDwHptOOLJZMh96DI9TycQXZnmJDoErc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSV34CDn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSV34CDn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F0F1F000E9;
	Tue, 21 Jul 2026 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627707;
	bh=FexciWDreyYDm+GAgUVBnYX3cZTEj1b4huNpSwvGtXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lSV34CDnCi0AwHISoDyHw5wMago5qUrfGGZ8TXuFJyIef4kjshFBY9T1pSM5wSgo4
	 oBsVrbf5gTA3bAyFteV1NQtdbWa0sRhsGmRqpTraZKV6X7pz6f3kt1LeRGvLm5jxCI
	 G6kOYW0SvGulBKyaE0I8+ADc+A3Pev2fzSW2joDtbUQmES868/EdGYWr9upbGnqYXa
	 ubPm9TkaCXtXoGVJfqsusd3VN/13ZX3m0Tue0+SB8M/PE3YUiddjGvC/ZaZ3Fj8ZhR
	 xP/AXf2tas7Hav0Q1H+p3nvlUyyl7n04JKollA6+02267ztG/gMBKFDmLPVzfjb1uA
	 06kM9c0XYKfeg==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 11/11] ntfs: move attribute payload before shrinking its record
Date: Tue, 21 Jul 2026 18:54:31 +0900
Message-Id: <20260721095431.6619-11-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260721095431.6619-1-linkinjeon@kernel.org>
References: <20260721095431.6619-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_new_attr_flags() resizes the non-resident attribute record before
moving its name and mapping pairs to their shorter-header offsets when
compression or sparse state is cleared.

Shrinking the record first moves the following attribute over the tail of
the old record. The subsequent memmove() therefore copies bytes from that
following attribute instead of the old mapping pairs. Re-enabling
compression on an empty file persists those bytes as a malformed mapping
pairs array, which ntfsck reports as a missing or invalid run length.

Move the payload before shrinking the record, while retaining the existing
resize-before-move ordering when growing it.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/ea.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 95587b9a7129..4fb10d51211c 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -631,7 +631,7 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 	struct attr_record *a;
 	__le16 new_aflags;
 	u16 old_name_ofs, old_mp_ofs;
-	int mp_size, mp_ofs, name_ofs, arec_size, err;
+	int mp_size, mp_ofs, name_ofs, old_arec_size, arec_size, err;
 
 	m = map_mft_record(ni);
 	if (IS_ERR(m))
@@ -726,6 +726,19 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 
 	mp_ofs = (name_ofs + a->name_length * sizeof(__le16) + 7) & ~7;
 	arec_size = (mp_ofs + mp_size + 7) & ~7;
+	old_arec_size = le32_to_cpu(a->length);
+
+	/*
+	 * Move payloads before shrinking the record.  Otherwise resizing moves
+	 * the following attribute over the old payload before it can be copied.
+	 */
+	if (arec_size < old_arec_size) {
+		if (a->name_length && name_ofs != old_name_ofs)
+			memmove((u8 *)a + name_ofs, (u8 *)a + old_name_ofs,
+				a->name_length * sizeof(__le16));
+		if (mp_ofs != old_mp_ofs)
+			memmove((u8 *)a + mp_ofs, (u8 *)a + old_mp_ofs, mp_size);
+	}
 
 	err = ntfs_attr_record_resize(m, a, arec_size);
 	if (unlikely(err))
@@ -736,18 +749,12 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 	 * shrinks by the compressed_size field. Update the in-record payload layout
 	 * to match the new offsets before exposing the new mapping_pairs_offset.
 	 */
-	if (name_ofs > old_name_ofs) {
+	if (arec_size > old_arec_size) {
 		if (mp_ofs != old_mp_ofs)
 			memmove((u8 *)a + mp_ofs, (u8 *)a + old_mp_ofs, mp_size);
 		if (a->name_length)
 			memmove((u8 *)a + name_ofs, (u8 *)a + old_name_ofs,
 				a->name_length * sizeof(__le16));
-	} else {
-		if (a->name_length && name_ofs != old_name_ofs)
-			memmove((u8 *)a + name_ofs, (u8 *)a + old_name_ofs,
-				a->name_length * sizeof(__le16));
-		if (mp_ofs != old_mp_ofs)
-			memmove((u8 *)a + mp_ofs, (u8 *)a + old_mp_ofs, mp_size);
 	}
 
 	if (new_aflags & (ATTR_IS_SPARSE | ATTR_IS_COMPRESSED)) {
-- 
2.34.1

