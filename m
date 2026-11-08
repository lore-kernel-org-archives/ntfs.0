Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175959;
	b=Wc0rhG6bdYl5mPOJKvXtYKQBINjCynnyKZ2QblWsTChszyep8pDvixpEJbtaGZi5xh3Q
	 EwVOBUHDZrw6IQEdrgnZKSTT1HZK5gYwnHOFgO5+Stsrhmc5cZoYRlAy2tyrFGEb4kep1
	 kfQ1ETjW4Mz/2nOVlUyOXID4t2TXp+4zf6u5eRjOZqZbatNrR1TSdNPBDr1FDneuXRjtF
	 yg5LIWDIQt2e2ATabe2wna8gIZy0AyO62oy1ii2ObGKGCZojEsw1BcIsSZ36o6lYVkKt6
	 ugby6QKIUB4RwZVhTH8xt4OxESGikdTvl5rgISorzu3f3tUleH8Tr/YCshVMpSU7tHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b2QVcEh0btg1HMk0NwMa89lrKVc8kAcQU1mXuN1qs6U=;
	b=Bb0rh+2udcin5NjpRHqGnjmS7ZYueUHvLEY4HSzLeQ5zHv774DUr/3bTFhZgFpLdVJnj
	 8bluvXfl8Q7MRmvgfxcu0QtKoQZBZUNUH9e/wGVP9dOYbz79e1otOdEVcFGmZmnkCcPnK
	 l5q/vzploG8akXNejEMw3QBVDWCFZkEDHAQa2dMnQBKSEPDHMftcOYIDo9+gg46oijCug
	 AJiVRCueba5S1veY81dope0dHZ3JOa78hJmYY9tY7dPr4hsmlrC+AnfeXM1nco2e3m86T
	 N5395LS7OHp9j+YFTMKDe1ulD7XXLP5YxicU+3rVSi+scenpJYQHAc1fibBh6R2MVMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGhDs7ne;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414D3606A321
	for <ntfs@lists.linux.dev>; Sun,  8 Nov 2026 22:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 414D3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGhDs7ne
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so597655eec.0
        for <ntfs@lists.linux.dev>; Sun, 08 Nov 2026 14:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175958; x=1794780758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2QVcEh0btg1HMk0NwMa89lrKVc8kAcQU1mXuN1qs6U=;
        b=uGhDs7neQrsmmn/XXQ+fNnN6D0uwQ2HVHMILdyp0+uIzGi4lwdfQEUCSLuQRq4CPpg
         2iDB+8LCu4bXMLoUfdXhqhbLq0H2aGrwIPIe6zvPVsokDdQxwdnts+1R+Tazpat6FTo1
         Ol19clVmE3hAYwxmEGvf+ww3UmA4tCaEtHnF4VFRNcboK8FWvHnnywrAMxh1wGrgWKMZ
         YPVY4Dv3DGgz4zfnP34Q5PwpRbEB6fuDgZ6QOlOgQI2WsfTFt732Y+BRLeoyD0ML4uhj
         Me3qm4CmsB5ZZlldse6+JaqmGgxFc2b1kmsu3w3HZoFpPf28uVqhXAfzjy1pQVFDwQlq
         Iwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175958; x=1794780758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2QVcEh0btg1HMk0NwMa89lrKVc8kAcQU1mXuN1qs6U=;
        b=Y+hwci7lRMAQxdOn1J/uWD1ruKCmsOZLX8IvED7E9alIIa0hf/6o+kui1SRg/JmOl9
         400dtaY82QDuWLAnbodgG/2EWWMMyz5X8seOGXTTXAmPOG+ssMQKWy4IMLBIsrdja5zo
         8jJcbPFg4PN0paLWprQzC9utVf6yPdkJms6qeIVY87fDhFJO98F5i1Q1OC6YlB3cgv0y
         AkWWm+Yo+5HcYmlgPhP1FIaQt2mW8128+TiSw7jA4JoM4zWK2qDfxcX494zdiZCKeAZj
         uveaFqo0q3g7RinPT546ts7OdR2sPd9GRjB/R6lX/npBspX3KALVrAYGC0QcTup7xwYi
         JXGw==
X-Forwarded-Encrypted: i=1; AL+hErFI+Fu2SlNbe7a4azJL+PK/IKv0mjL6dcU2zxxm4FpQ2eK6OgBH3fqxON9bfo0vLFYUAc92@lists.linux.dev
X-Gm-Message-State: APuU4Z+jDAk3CiSFaugKTmYe84rHU6lG+X0EGxu2QY4qufydWbbhDe8X
	RqD7ccRE7MVpdivbPfcUpxArchV95DbBeREsZs118G2wjKlkAksgUcgz
X-Gm-Gg: AYBFou2NgNjIPVN50RfXa4c53R7v1E5or+LyQ1K6wp/E+f343zcdeGk9dwGHT8A4Sdl
	tG3iy3Kf3WlDpi/eVxb5ffg9IRnAIVvx3YEbQtnqLBUTpjxoE7ZjBHHxEeRFyb3hkdcT53iqfaG
	dBgOJNw2hhaP49cUv+Hrco80dreqZCsSYmDftGbj87cdIruMufbUnNOLQv6spKuQlakacFqAusc
	/PUy6/GZyxHuCAAZzZugiWNK4zR0PyBAWPm08M6rBECVSmwGGl81QRs10EmwMyt11MpuDKtu02X
	HGrUhLwWOVZd3DiVj8nWlZHaLV777099gUxAQD7lmSg04bNlN17J/emqlUeQZQnSrS9DFrtqvpz
	4te6Oe8u9K9NrmacyPO8/Ag8MiI2nKTvBH+P86wSEOdL+TWy5fC3XJnEWfWFpbC6JmosrqqI7wq
	i7ctwIHUhOA6WGz2FU/GPQfTX5fz8kCMz3Hvf2yEBqTC5RgW9mqfV14/Pg+4qLfosDd3HNTO49c
	AQ9JXfbfezGkNJmRQZVhTmTBJYKLIDVRHlMuODLjYvN/Y9UauCqMOSDmXCaIdotAOkoTds4O1no
	cQ21vZrS/7CpHpo+IsK6B1kzoPlW+Q8nzyJaDgoU7GHWiQYPbMUZlRt8o/1epyVQxg==
X-Received: by 2002:a05:7300:d10e:b0:36e:aa5c:7851 with SMTP id 5a478bee46e88-372570db210mr4300108eec.27.1794175957931;
        Sun, 08 Nov 2026 14:12:37 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d78ebsm8097933eec.27.2026.11.08.14.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:12:37 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: linkinjeon@kernel.org
Cc: hyc.lee@gmail.com,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5] ntfs: convert a named $DATA stream safely when making room in a record
Date: Mon,  9 Nov 2026 03:42:27 +0530
Message-ID: <20261108221227.1083022-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd9=crUmmGbO1vcPsdz-GmWoHxD_W_bRv2PQ_Db3Q+EkCQ@mail.gmail.com>
References: <CAKYAXd9=crUmmGbO1vcPsdz-GmWoHxD_W_bRv2PQ_Db3Q+EkCQ@mail.gmail.com>
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

When an attribute has to grow and the mft record is full,
ntfs_resident_attr_resize() walks the other resident attributes and
converts them to non-resident ones. For $DATA it always opens the
unnamed data inode of the base inode, even if the attribute found is a
named stream:

  tvi = ntfs_iget(sb, base_ni->mft_no);
  ntfs_attr_make_non_resident(NTFS_I(tvi), value_len);

value_len is the length of the stream, so it does not match the
attribute that ntfs_attr_make_non_resident() looks up for the unnamed
inode, and the WARN_ON() on entry fires:

  WARNING: fs/ntfs/attrib.c:2115 at ntfs_attr_make_non_resident
   ntfs_resident_attr_resize
   ntfs_attr_expand_locked
   ntfs_expand_for_write
   ntfs_file_write_iter
   vfs_write

It does not need a damaged volume. A file with an alternate data stream
whose record has no room left is enough.

Open a named stream by name with ntfs_attr_iget(), as is done for the
other attribute types in this loop, and keep ntfs_iget() for the
unnamed one. The loop runs with the mft record lock held and takes no
lock of the stream inode, so converting a stream from here needs more
care than the plain lookup gives:

- A reader of the stream holds the folio lock and then takes the mft
  record lock in ntfs_read_iomap_begin_resident(), the conversion takes
  them the other way round and waits for folio 0. Take the folio with
  FGP_NOWAIT in this loop and skip the attribute if it is busy. The loop
  only tries to free space. The same inversion exists for the conversion
  of the attribute being resized, which waited for folio 0 with the lock
  held and hangs against an mmap fault or splice reader. Use FGP_NOWAIT
  there too. The resize then fails with -ENOSPC while such a reader is
  stuck on the lock, instead of hanging.

- A stream that is in the inode cache can be open, being written, being
  removed or already unlinked. A write that passed its residency check
  before the conversion carries on with a non-resident attribute, and
  a stream in the middle of ntfs_stream_finish_remove() is converted
  under its feet. Convert only a stream that is not cached.

- An attribute inode of a file that has no links left is evicted on the
  last iput() with its dirty folio, so what was converted is lost and
  an open file reads its extended attributes back as missing. Convert
  nothing, of any type, in a file that is being deleted or has no links
  left.

- The unnamed data is opened and converted through the file's own inode,
  whose i_rwsem only a resize of the unnamed data itself holds. When a
  stream or an extended attribute is being resized, a writer of the file
  can have passed its residency check and carry on with a non-resident
  attribute (iomap_iter warnings, recursive mrec_lock). Convert the
  unnamed data only when it is the attribute being resized.

- A WOF compressed file reads its WofCompressedData stream straight
  from the device, not through the page cache. A stream converted here
  is still dirty in the page cache, so the file reads stale clusters
  until writeback. Leave the streams of a WOF file alone.

- The lookup of a stream ignores case, so a stream whose name differs
  only in case from an earlier one resolves to that one and the length
  does not match again. Compare the names exactly.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
v5: Sashiko's review of v4 found more, each reproduced with a forced make-room
    pass and a debug delay, fails before and passes after:
    - the WofCompressedData stream of a WOF file was converted, and the
      file read stale clusters until writeback (249 of 250 bytes wrong)
    - an attribute converted in a file with no links left was evicted
      with its dirty folio (open file reads its EA back as missing)
    - a resize of a stream converted the unnamed data under a writer of
      the file (iomap_iter WARNs, recursive mrec_lock)
    - the conversion of the resized attribute itself waited for folio 0
      with mrec_lock held (hung task against mmap fault and splice)
    The six v4 scenarios still pass.
v4: v3 (convert a named stream via ntfs_attr_iget()) can deadlock against
    a reader of the stream and has other races with an open or removed
    stream. Each is reproduced with a forced make-room pass and a debug
    delay, fails on v3 and passes here: reader/converter deadlock
    (hung task), write continuing on a converted attribute (iomap_iter
    WARNINGs, recursive locking), unlinked file with an open stream (mft
    record reported corrupt), stream converted during its own removal,
    and a stream pair that differs only in case (WARN in
    ntfs_attr_make_non_resident).
v3: use ntfs_attr_iget() for a named stream instead of skipping it (v2).
 fs/ntfs/attrib.c | 82 ++++++++++++++++++++++++++++++++++++++++++------
 fs/ntfs/inode.c  | 19 +++++++++++
 fs/ntfs/inode.h  |  2 ++
 3 files changed, 93 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index ce7c1b524180..5af7bf191295 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -1975,7 +1975,21 @@ int ntfs_resident_attr_value_resize(struct mft_record *m, struct attr_record *a,
  * inode i_size is that this is not necessarily uptodate.  This happens when
  * ntfs_attr_make_non_resident() is called in the ->truncate call path(s).
  */
+static int __ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size,
+		bool nowait);
+
 int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
+{
+	return __ntfs_attr_make_non_resident(ni, data_size, false);
+}
+
+/*
+ * With @nowait the folio lock is only tried: a caller that holds mrec_lock
+ * must not wait for a folio lock, the read path takes them the other way
+ * round. Fails with -EAGAIN if the folio is locked.
+ */
+static int __ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size,
+		bool nowait)
 {
 	s64 new_size;
 	struct inode *vi = VFS_I(ni);
@@ -2056,10 +2070,11 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 		 * outside all ntfs locks, we need to get the folio now.
 		 */
 		folio = __filemap_get_folio(vi->i_mapping, 0,
-					    FGP_CREAT | FGP_LOCK,
+					    FGP_CREAT | FGP_LOCK |
+					    (nowait ? FGP_NOWAIT : 0),
 					    mapping_gfp_mask(vi->i_mapping));
 		if (IS_ERR(folio)) {
-			err = -ENOMEM;
+			err = nowait ? -EAGAIN : -ENOMEM;
 			goto err_out;
 		}
 
@@ -4895,8 +4910,14 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 	/* There is not enough space in the mft record to perform the resize. */
 
 	/* Make the attribute non-resident if possible. */
-	err = ntfs_attr_make_non_resident(attr_ni,
-			le32_to_cpu(ctx->attr->data.resident.value_length));
+	err = __ntfs_attr_make_non_resident(attr_ni,
+			le32_to_cpu(ctx->attr->data.resident.value_length), true);
+	/*
+	 * A reader holding folio 0 waits for mrec_lock, which we hold. Do not
+	 * wait for it, try to make room some other way.
+	 */
+	if (err == -EAGAIN)
+		err = -ENOSPC;
 	if (!err) {
 		mark_mft_record_dirty(ctx->ntfs_ino);
 		ntfs_attr_put_search_ctx(ctx);
@@ -4933,18 +4954,59 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 		if (a->type == AT_DATA && !value_len)
 			continue;
 
-		if (a->type == AT_DATA)
+		/*
+		 * The attribute inode of an unlinked file is evicted on the
+		 * last iput() together with its dirty folio.
+		 */
+		if (NInoBeingDeleted(base_ni) || !VFS_I(base_ni)->i_nlink)
+			continue;
+
+		if (a->type == AT_DATA && !a->name_length) {
+			/*
+			 * Only the caller that resizes it holds the i_rwsem of
+			 * the unnamed data, a writer of another attribute does
+			 * not.
+			 */
+			if (attr_ni != base_ni)
+				continue;
 			tvi = ntfs_iget(sb, base_ni->mft_no);
-		else
-			tvi = ntfs_attr_iget(VFS_I(base_ni), a->type,
-				(__le16 *)((u8 *)a + le16_to_cpu(a->name_offset)),
-				a->name_length);
+		} else {
+			__le16 *name = (__le16 *)((u8 *)a +
+					le16_to_cpu(a->name_offset));
+
+			/*
+			 * A named $DATA stream is converted only if nobody has
+			 * it open: an open one can be unlinked, being removed
+			 * or in use. Its file must not be going away either,
+			 * and a WOF file reads its stream from the device, so
+			 * the stream must stay resident.
+			 */
+			if (a->type == AT_DATA) {
+				if (NInoWofCompressed(base_ni))
+					continue;
+				tvi = ntfs_attr_ilookup(VFS_I(base_ni), a->type,
+						name, a->name_length);
+				if (tvi) {
+					iput(tvi);
+					continue;
+				}
+			}
+			tvi = ntfs_attr_iget(VFS_I(base_ni), a->type, name,
+					a->name_length);
+			/* the lookup ignores case for streams, ours does not */
+			if (!IS_ERR(tvi) && a->type == AT_DATA &&
+			    memcmp(NTFS_I(tvi)->name, name,
+				   a->name_length * sizeof(__le16))) {
+				iput(tvi);
+				continue;
+			}
+		}
 		if (IS_ERR(tvi)) {
 			ntfs_error(sb, "Couldn't open attribute");
 			continue;
 		}
 
-		if (ntfs_attr_make_non_resident(NTFS_I(tvi), value_len)) {
+		if (__ntfs_attr_make_non_resident(NTFS_I(tvi), value_len, true)) {
 			iput(tvi);
 			continue;
 		}
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 62dd5bd5bb81..ec9c7b219192 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -287,6 +287,25 @@ struct inode *ntfs_attr_iget(struct inode *base_vi, __le32 type,
 	return vi;
 }
 
+/*
+ * ntfs_attr_ilookup - find an attribute inode that is already in the cache
+ *
+ * Like ntfs_attr_iget() but never reads anything. Returns the inode with an
+ * increased reference count, or NULL if it is not cached.
+ */
+struct inode *ntfs_attr_ilookup(struct inode *base_vi, __le32 type,
+		__le16 *name, u32 name_len)
+{
+	struct ntfs_attr na = {
+		.mft_no = base_vi->i_ino,
+		.type = type,
+		.name = name,
+		.name_len = name_len,
+	};
+
+	return ilookup5(base_vi->i_sb, na.mft_no, ntfs_test_inode, &na);
+}
+
 /*
  * ntfs_index_iget - obtain a struct inode corresponding to an index
  * @base_vi:	vfs base inode containing the index related attributes
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index a18cbcf1c631..7ea52c59c04b 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -326,6 +326,8 @@ struct ntfs_attr {
 int ntfs_test_inode(struct inode *vi, void *data);
 int ntfs_test_inode_rcu(struct inode *vi, void *data);
 struct inode *ntfs_iget(struct super_block *sb, u64 mft_no);
+struct inode *ntfs_attr_ilookup(struct inode *base_vi, __le32 type,
+		__le16 *name, u32 name_len);
 struct inode *ntfs_attr_iget(struct inode *base_vi, __le32 type,
 		__le16 *name, u32 name_len);
 struct inode *ntfs_index_iget(struct inode *base_vi, __le16 *name,
-- 
2.56.0

