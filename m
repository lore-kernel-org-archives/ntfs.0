Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794125031;
	b=4lhl+izdhiK4p9dHp0BccQN04D1n7rGUaJ3oLbRN08CccRZzZXEJkRTyb2WnFex42JX1
	 gVJnLuJT8mztSq9J+L7aQ5cx+thr8CM35/IVh6qXo/Fa6FVy2PTJ7/rajXcaaspQYwsmw
	 a35cDmUYVtVW4K6u7/IIa6qFow+CRgj9JW37ot2RbnD6tFMNgVC5794cw0/6di0nOTp2y
	 rZyNJrTUrfezFSIPURj3SUdvT23lLSqvFlLW4SFRL6hDGvbb8imCQT6fONkGi0C4BkUOc
	 P3epZEC2q18fBx67Jq11AbbgqtnOU47K2bMIRtYDM3kHhk9U1Au5aOfk6svCLJdi66A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794125031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JOX77fus2x/eG1WoZO3OzTindRAi1WdAyfHFy3V4a8g=;
	b=0/EL1gNtq75lKVJa2Tvc16DmF7pSxfGYVZZlc62WtQBBcXnYssTWemDW3d4CK50ERmyz
	 HqO6x6Xfx/iV9yDwO3aeP5aJg9mL+FFP/e8YStcILIKFLrr2DK4iIr14QwDsbAvqlTAFj
	 DnLRG7kQUdZV+HifBS3685jdq/3HBkO0Bq/0zFnU8VINSdl7uTonTQ5gPhwZ4XgOaRUJr
	 5A7JJ6mYMS/MieMpBbzR2/wmY1elq+Tf6BVX/2gghbMLvzPhvSVB3GqLU2hG60O0Ah189
	 9n7+D15XVgSVnYQgOZhWe0RJgosuqz1i0EjLp91O+mbPCuOCUb32ge6jBohDNyjVicg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zr+knThR;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F911606A322
	for <ntfs@lists.linux.dev>; Sun,  8 Nov 2026 08:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F911606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zr+knThR
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so655807eec.1
        for <ntfs@lists.linux.dev>; Sun, 08 Nov 2026 00:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794125029; x=1794729829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOX77fus2x/eG1WoZO3OzTindRAi1WdAyfHFy3V4a8g=;
        b=Zr+knThR35k3h8P7dbOkv5HNrq50OjzRWFWaJ41Q8MudYVTTYhjGyqCGgVEuGRbkIC
         T85us7wpinPz4aQUAB/jPub7lh40wgt7CB+k43Zgb2TftxpsiNuMbK/V0nEu7g8lrWE0
         Fye5Kn1KX02dLJXrpJG8dN6aIfQHDnk2B77azAOqfid6KZrKi4pVqJv5CxrpPeM7Ehh+
         33zacHyOmKtxzzQHgbd5iDq2BwpMdL4+FfN75uTcVrNKxLUdhJs6Ms5LVl2lbaAUUNCq
         7I71uyS89YpERlz1FP67UFvWZMVIyfQEpdvfT9NNH8GfGYN97IgUhOiayCN4iX4Dg9St
         K+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794125029; x=1794729829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOX77fus2x/eG1WoZO3OzTindRAi1WdAyfHFy3V4a8g=;
        b=TTlUcMveuHdIAyhbblmtZXt6NYWc2pV3lz4jiGk0JEDMRoUrnLhJnhiada+ibMCvYR
         KTEDvcdRH/cJBIzyki3l8toHypkGy3mxbYrDnA7f9UxLz0Y/0D6kWqKnOMwPzopk8eLF
         iIyBByB7LpFl/IKpIeRR4JAkULRUDwfWMaHgwgCLCMPtgXIJoP4Z/pmbIgQHuhL0AG03
         asdYRHFZnii372wHra2JwflvEyrt3Hv8w3YFfuJoyr1GexOYmQSFQCWWQjM78eKLLelR
         ht4vF6am1hJTkxQ/JmVz3UhnBE5EyeYD2rRbmcXV0J0IEWps5XF0vNWaPLWW2sQtwKs4
         wZFA==
X-Forwarded-Encrypted: i=1; AL+hErEoHzp3KloxK1Nd8j5a0Amy3H5OwXjYjwtH0Nffffo87ZXUqllqv+UMDOxT8Sjpw1ze5Kna@lists.linux.dev
X-Gm-Message-State: APuU4Z8h47l/TFb6E0fZzBFle4G9y0PWAtnh2kfmU+RGSvMdwFlXhXQz
	PRbulQrPsVccPS1R6VUQj7+uFGMZbOwie+RR2UeRmArOolX702cUtkIZvykITWasO7iY0A==
X-Gm-Gg: AYBFou1GmxKuuJ9Tgu/x8cZF2QNlyHsza53PtfdoAGzQJ4xThYAr97tNDJ9KLjJDzjZ
	TZLL2LZqZWIwLzodiMKi3N9a2ggD7kozCr6qLFVSXjVtdBBDm2llpZstzdGDIgMRYZqk+Vf4aDH
	UL6cxpvBo7VQyXijKiT8/a9jACA8GDGCuqPaFlcefaVDrFbHoxK4PAcXB7Z8/GDG/5g29DIpFtv
	eq7OCvh4RrsKq6QUCqWztJ/Mklmyn7wE/MApsS2rAS5hQcxSoyLHkFSBpnDpmJYdt/yndPopQzI
	Fm313UvmzRvX7kmhIACO15JBPBz3tIO0ewkbjRrXIBPNQlZT3TjXsoPcJ4FZd+HkgOpBVBPHKSb
	F2vwFLb+Vo9vtx0Yw5vGs/3N7RmhNhTYh/bfVIMg+RZ+UjrXRZtHRKtQxKrEzvffdYJ+HXjg2Kw
	Gaefz+dFXLmbC0rjrH4zfP9vLfHk6qOru0AtmU1jkKcGg0eKlJvRM83VlJ9Mtea+BzOWkHkNxpy
	UldCbo2U15qOLy9E5kqs2xOAanP/TYnujywIONdHZBt1WRToC9R3WHjkMhHC9IjxOkkCdtyyOMh
	cHF+j59CmVTfn+zGOEj1AjEmGrm9TH4gXY4DUPTHWjmeT9qdLa78KxqC3ZaiWWkF/A==
X-Received: by 2002:a05:701b:2616:b0:149:50cb:2175 with SMTP id a92af1059eb24-1b39fef4a85mr1364346c88.33.1794125029163;
        Sun, 08 Nov 2026 00:03:49 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm4681740c88.10.2026.11.08.00.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:03:48 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] ntfs: convert a named $DATA stream safely when making room in a record
Date: Sun,  8 Nov 2026 13:33:23 +0530
Message-ID: <20261108080323.468892-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
References: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
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
  only tries to free space.

- A stream that is in the inode cache can be open, being written, being
  removed or already unlinked. A write that passed its residency check
  before the conversion carries on with a non-resident attribute, and
  a stream in the middle of ntfs_stream_finish_remove() is converted
  under its feet. Convert only a stream that is not cached, and none of
  a file that is being deleted or has no links left.

- The lookup of a stream ignores case, so a stream whose name differs
  only in case from an earlier one resolves to that one and the length
  does not match again. Compare the names exactly.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
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

 fs/ntfs/attrib.c | 57 +++++++++++++++++++++++++++++++++++++++++-------
 fs/ntfs/inode.c  | 19 ++++++++++++++++
 fs/ntfs/inode.h  |  2 ++
 3 files changed, 70 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index ce7c1b524180..c824bd3ea9fa 100644
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
 
@@ -4933,18 +4948,44 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 		if (a->type == AT_DATA && !value_len)
 			continue;
 
-		if (a->type == AT_DATA)
+		if (a->type == AT_DATA && !a->name_length) {
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
+			 * or in use. Its file must not be going away either.
+			 */
+			if (a->type == AT_DATA) {
+				if (NInoBeingDeleted(base_ni) ||
+				    !VFS_I(base_ni)->i_nlink)
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

