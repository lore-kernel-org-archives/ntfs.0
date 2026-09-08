Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4C449552B
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860673; cv=none; b=mIDiagIL8rkYxsCGALwF3qt7yjo2ENwWhVT+wKCP4rjSEVWsru8nqFoMdDe80UBEeOcQwvdGbtmo0ojMudt3zyiATESTvTjwfAg4Tzb2t6tKwvgFkY2sdUKjvk2JroCiI7WGcGr0gCPSq9YUS6Tzx1YhvLC4+lH61b+2I+3/rfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860673; c=relaxed/simple;
	bh=g/aABAW9JYjBRjiMsmmzDIDd23AJUFSZz/lnWmThbZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UOM2wR4TBZovaZrUP2HFW/Tgjox1qvyGocoKaabbFW9zvK/q6rV4AmliBUh/CzYv9y3Rf2PXk1TkPcDPZidXFCSy0AIYvyN5sHgzAbx4iRbtpGEeORXEZLHzlUGBOYmXUCZZh2k/eeDZH+5QDhzAbR0uVz43HCGIfru6TinKnO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqMl3wCZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqMl3wCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752EC1F00A3A;
	Tue,  8 Sep 2026 09:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788860672;
	bh=dRIMYUiBwIInSn/qYOWlWSQD4bD/yRMpBs8BW1vyG4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lqMl3wCZNHCVprLP3oFO8NPKeyc+tYxfnZ8zRBQ9/pgBqDqH3jNxSDLZG7/fDCrih
	 uh1Fca6y2o7Zqe5DZNVHfEWSC7gxp/4ptcIk2qXiPiCnx6oslokcAkmmpmQ/hrxUex
	 lgRJKurQToIJzU4ZdllYYwQGQ3OORqOmSlPwB23BswadkGKtIamomceeACnLEzJIqB
	 8N9kS+lz7RSr8b7Aq+8FbOMovZlt2z8psFr7ci5z77rBsPh47BGGiXX+Y1KCzwTKKL
	 4C46DgJdgsI9mFpHL0SZpKveP1Yxi4joJ+69trZvwgtKzdIj/ExMnEqe/nX7Bf+G3n
	 gJ0hZTbgIzBxQ==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] ntfs: repack $MFT/$ATTRIBUTE LIST
Date: Tue,  8 Sep 2026 18:44:10 +0900
Message-Id: <20260908094416.10534-2-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260908094416.10534-1-linkinjeon@kernel.org>
References: <20260908094416.10534-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Repack the non-resident $MFT/$ATTRIBUTE_LIST into a contiguous run
when its mapping pairs no longer fit in the base MFT record. Propagate
allocation and writeback errors, and check synchronous replacement writes.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/attrib.c   |  47 ++++++++---
 fs/ntfs/attrlist.c | 202 ++++++++++++++++++++++++++++++++++++++++++---
 fs/ntfs/inode.c    |  10 ++-
 3 files changed, 236 insertions(+), 23 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 81b9e0971b3e..d1696ce6acd5 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3844,13 +3844,13 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
 			 */
 			if (ni->type == AT_ATTRIBUTE_LIST) {
 				ntfs_attr_put_search_ctx(ctx);
-				if (ntfs_inode_free_space(base_ni, mp_size -
-							cur_max_mp_size)) {
-					ntfs_debug("Attribute list is too big. Defragment the volume\n");
-					return -ENOSPC;
-				}
-				if (ntfs_attrlist_update(base_ni))
-					return -EIO;
+				err = ntfs_inode_free_space(base_ni, mp_size -
+							cur_max_mp_size);
+				if (err)
+					return err;
+				err = ntfs_attrlist_update(base_ni);
+				if (err)
+					return err;
 				goto retry;
 			}
 
@@ -4522,13 +4522,39 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 					ntfs_bytes_to_cluster(vol, ni->allocated_size),
 					first_free_vcn -
 					ntfs_bytes_to_cluster(vol, ni->allocated_size),
-					lcn_seek_from, DATA_ZONE, false, false, false);
+					lcn_seek_from, DATA_ZONE, false,
+					ni->type == AT_ATTRIBUTE_LIST, false);
 			if (IS_ERR(rl)) {
 				ntfs_debug("Cluster allocation failed (%lld)",
 						(long long)first_free_vcn -
 						ntfs_bytes_to_cluster(vol, ni->allocated_size));
 				return PTR_ERR(rl);
 			}
+			/*
+			 * A contiguous ATTRIBUTE_LIST allocation keeps its mapping
+			 * pairs small enough to fit in the base MFT record. The
+			 * allocator can return a short run when contiguity was
+			 * requested, so discard it and retry normally if necessary.
+			 */
+			if (ni->type == AT_ATTRIBUTE_LIST &&
+				(rl->vcn != ntfs_bytes_to_cluster(vol,
+						ni->allocated_size) ||
+				 rl->length != first_free_vcn -
+					ntfs_bytes_to_cluster(vol, ni->allocated_size) ||
+				 rl[1].length)) {
+				ntfs_cluster_free_from_rl(vol, rl);
+				kvfree(rl);
+				rl = ntfs_cluster_alloc(vol,
+						ntfs_bytes_to_cluster(vol,
+								ni->allocated_size),
+						first_free_vcn -
+						ntfs_bytes_to_cluster(vol,
+								ni->allocated_size),
+						lcn_seek_from, DATA_ZONE, false,
+						false, false);
+				if (IS_ERR(rl))
+					return PTR_ERR(rl);
+			}
 		}
 
 		if (!NInoCompressed(ni)) {
@@ -4921,7 +4947,8 @@ int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize, const s64 preallo
 	ntfs_debug("Entering for inode 0x%llx, attr 0x%x, size %lld\n",
 			(unsigned long long)ni->mft_no, ni->type, newsize);
 
-	if (ni->data_size == newsize) {
+	if (ni->data_size == newsize &&
+		(!prealloc_size || prealloc_size <= ni->allocated_size)) {
 		ntfs_debug("Size is already ok\n");
 		return 0;
 	}
@@ -4936,7 +4963,7 @@ int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize, const s64 preallo
 	}
 
 	if (NInoNonResident(ni)) {
-		if (newsize > ni->data_size)
+		if (newsize > ni->data_size || prealloc_size > ni->allocated_size)
 			err = ntfs_non_resident_attr_expand(ni, newsize, prealloc_size,
 							    NVolDisableSparse(ni->vol) ?
 							    HOLES_NO : HOLES_OK, true);
diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index a1c00e426e80..b280af3c4b77 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -12,6 +12,9 @@
 #include "mft.h"
 #include "attrib.h"
 #include "attrlist.h"
+#include "lcnalloc.h"
+
+#define NTFS_MAX_ATTR_LIST_SIZE	(256 * 1024)
 
 /*
  * ntfs_attrlist_need - check whether inode need attribute list
@@ -51,11 +54,151 @@ int ntfs_attrlist_need(struct ntfs_inode *ni)
 	return 0;
 }
 
+/*
+ * Repack the $MFT/$ATTRIBUTE_LIST data into one run.
+ *
+ * The mapping pairs for an $ATTRIBUTE_LIST must remain in the base MFT
+ * record. Once that record has no room left, extending a fragmented list
+ * can require one more mapping-pairs byte than the record can hold. There
+ * is no attribute that can legally be moved out in that state: $STANDARD_
+ * INFORMATION, $ATTRIBUTE_LIST, and the first $MFT/$DATA extent all have to
+ * stay in the base record.  Move the list data to one contiguous run. The
+ * caller supplies the minimum allocation size so a recovery can use the
+ * smallest useful run while normal updates can still request the maximum
+ * legal list size as a reserve.
+ */
+static int ntfs_attrlist_repack(struct inode *attr_vi,
+		struct ntfs_inode *attr_ni, s64 min_alloc_size)
+{
+	struct ntfs_volume *vol = attr_ni->vol;
+	struct runlist_element *old_rl, *new_rl;
+	u8 *data = NULL;
+	s64 data_size, alloc_size, nr_clusters, written;
+	s64 old_alloc_size;
+	size_t old_rl_count, new_rl_count;
+	unsigned long flags;
+	int err, restore_err;
+
+	if (attr_ni->mft_no != FILE_MFT || !NInoNonResident(attr_ni) ||
+		min_alloc_size < 0)
+		return -EINVAL;
+
+	err = ntfs_attr_map_whole_runlist(attr_ni);
+	if (err)
+		return err;
+
+	data_size = attr_ni->data_size;
+	if (data_size < 0)
+		return -EIO;
+
+	if (data_size) {
+		data = kvmalloc(data_size, GFP_NOFS);
+		if (!data)
+			return -ENOMEM;
+
+		written = ntfs_inode_attr_pread(attr_vi, 0, data_size, data);
+		if (written != data_size) {
+			err = written < 0 ? (int)written : -EIO;
+			goto out_free_data;
+		}
+	}
+
+	old_alloc_size = attr_ni->allocated_size;
+	alloc_size = max_t(s64, old_alloc_size, min_alloc_size);
+	nr_clusters = ntfs_bytes_to_cluster(vol,
+			alloc_size + vol->cluster_size - 1);
+	if (nr_clusters <= 0) {
+		err = -EFBIG;
+		goto out_free_data;
+	}
+
+	/* A single run keeps the mapping pairs at the minimum size. */
+	new_rl = ntfs_cluster_alloc(vol, 0, nr_clusters, -1, DATA_ZONE,
+				    true, true, false);
+	if (IS_ERR(new_rl)) {
+		err = PTR_ERR(new_rl);
+		goto out_free_data;
+	}
+
+	new_rl_count = 0;
+	if (new_rl->vcn == 0 && new_rl->length == nr_clusters &&
+		!new_rl[1].length)
+		new_rl_count = 2;
+
+	if (new_rl_count != 2) {
+		ntfs_cluster_free_from_rl(vol, new_rl);
+		kvfree(new_rl);
+		err = -ENOSPC;
+		goto out_free_data;
+	}
+
+	old_rl = attr_ni->runlist.rl;
+	old_rl_count = attr_ni->runlist.count;
+	down_write(&attr_ni->runlist.lock);
+	attr_ni->runlist.rl = new_rl;
+	attr_ni->runlist.count = new_rl_count;
+	up_write(&attr_ni->runlist.lock);
+
+	write_lock_irqsave(&attr_ni->size_lock, flags);
+	attr_ni->allocated_size = ntfs_cluster_to_bytes(vol, nr_clusters);
+	write_unlock_irqrestore(&attr_ni->size_lock, flags);
+
+	/* Populate the replacement extent before publishing its mapping pairs. */
+	if (data_size) {
+		written = ntfs_inode_attr_pwrite(attr_vi, 0, data_size, data, true);
+		if (written != data_size) {
+			err = written < 0 ? (int)written : -EIO;
+			goto restore_old_runlist;
+		}
+	}
+
+	err = ntfs_attr_update_mapping_pairs(attr_ni, 0);
+	if (err)
+		goto restore_old_runlist;
+
+	/* The new mapping is now authoritative; release the old data runs. */
+	if (ntfs_cluster_free_from_rl(vol, old_rl)) {
+		ntfs_error(vol->sb,
+			   "Failed to free old ATTRIBUTE_LIST extent: inode %#llx",
+			   (long long)attr_ni->mft_no);
+		NVolSetErrors(vol);
+	}
+	kvfree(old_rl);
+	kvfree(data);
+	return 0;
+
+restore_old_runlist:
+	down_write(&attr_ni->runlist.lock);
+	attr_ni->runlist.rl = old_rl;
+	attr_ni->runlist.count = old_rl_count;
+	up_write(&attr_ni->runlist.lock);
+
+	write_lock_irqsave(&attr_ni->size_lock, flags);
+	attr_ni->allocated_size = old_alloc_size;
+	write_unlock_irqrestore(&attr_ni->size_lock, flags);
+
+	restore_err = ntfs_attr_update_mapping_pairs(attr_ni, 0);
+	if (restore_err) {
+		ntfs_error(vol->sb, "Failed to restore ATTRIBUTE_LIST mapping pairs (%d)",
+			   restore_err);
+		NVolSetErrors(vol);
+	}
+
+	ntfs_cluster_free_from_rl(vol, new_rl);
+	kvfree(new_rl);
+	err = err ? err : restore_err;
+
+out_free_data:
+	kvfree(data);
+	return err;
+}
+
 int ntfs_attrlist_update(struct ntfs_inode *base_ni)
 {
 	struct inode *attr_vi;
 	struct ntfs_inode *attr_ni;
-	int err;
+	s64 written;
+	int err, retry_err;
 
 	/*
 	 * generic_shutdown_super() clears SB_ACTIVE before evicting cached
@@ -74,21 +217,55 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni)
 	attr_ni = NTFS_I(attr_vi);
 
 	err = ntfs_attr_truncate_i(attr_ni, base_ni->attr_list_size, HOLES_NO);
-	if (err == -ENOSPC && attr_ni->mft_no == FILE_MFT) {
-		err = ntfs_attr_truncate(attr_ni, 0);
-		if (err || ntfs_attr_truncate_i(attr_ni, base_ni->attr_list_size, HOLES_NO) != 0) {
+	if (err == -ENOSPC && attr_ni->mft_no == FILE_MFT &&
+		NInoNonResident(attr_ni)) {
+		retry_err = ntfs_attrlist_repack(attr_vi, attr_ni,
+					base_ni->attr_list_size);
+		if (retry_err) {
+			ntfs_error(base_ni->vol->sb, "Failed to repack attribute list");
 			iput(attr_vi);
+			return retry_err;
+		}
+
+		retry_err = ntfs_attr_truncate_i(attr_ni, base_ni->attr_list_size,
+						 HOLES_NO);
+		if (retry_err) {
 			ntfs_error(base_ni->vol->sb,
-					"Failed to truncate attribute list of inode %#llx",
-					(long long)base_ni->mft_no);
-			return -EIO;
+				   "Failed to resize attribute list after repack");
+			iput(attr_vi);
+			return retry_err;
 		}
 	} else if (err) {
 		iput(attr_vi);
 		ntfs_error(base_ni->vol->sb,
 			   "Failed to truncate attribute list of inode %#llx",
 			   (long long)base_ni->mft_no);
-		return -EIO;
+		return err;
+	}
+
+	/*
+	 * Reserve the maximum legal list size while the MFT metadata area is
+	 * still easy to allocate contiguously. This prevents a later list entry
+	 * from needing another mapping-pairs byte in the full base MFT record.
+	 * Failure to obtain the optional reserve must not reject the current
+	 * metadata update; the repack retry above remains available if needed.
+	 */
+	if (base_ni->mft_no == FILE_MFT && NInoNonResident(attr_ni) &&
+		attr_ni->allocated_size < NTFS_MAX_ATTR_LIST_SIZE) {
+		retry_err = ntfs_attr_expand(attr_ni, base_ni->attr_list_size,
+					     NTFS_MAX_ATTR_LIST_SIZE);
+		if (retry_err == -ENOSPC) {
+			retry_err = ntfs_attrlist_repack(attr_vi, attr_ni,
+					NTFS_MAX_ATTR_LIST_SIZE);
+			if (retry_err == -ENOSPC)
+				retry_err = 0;
+		}
+		if (retry_err) {
+			ntfs_error(base_ni->vol->sb,
+				   "Failed to reserve attribute list space");
+			iput(attr_vi);
+			return retry_err;
+		}
 	}
 
 	i_size_write(attr_vi, base_ni->attr_list_size);
@@ -96,14 +273,15 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni)
 	if (NInoNonResident(attr_ni) && !NInoAttrListNonResident(base_ni))
 		NInoSetAttrListNonResident(base_ni);
 
-	if (ntfs_inode_attr_pwrite(attr_vi, 0, base_ni->attr_list_size,
-				   base_ni->attr_list, false) !=
-	    base_ni->attr_list_size) {
+	written = ntfs_inode_attr_pwrite(attr_vi, 0, base_ni->attr_list_size,
+					 base_ni->attr_list, false);
+	if (written != base_ni->attr_list_size) {
+		err = written < 0 ? (int)written : -EIO;
 		iput(attr_vi);
 		ntfs_error(base_ni->vol->sb,
 			   "Failed to write attribute list of inode %#llx",
 			   (long long)base_ni->mft_no);
-		return -EIO;
+		return err;
 	}
 
 	NInoSetAttrListDirty(base_ni);
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index eed48e1c90e5..f35d6370e2fb 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3746,6 +3746,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 			u64 rl_length = 0;
 			s64 vcn;
 			struct runlist_element *rl;
+			int bio_err;
 
 			lcn_count = max_t(s64, 1, ntfs_bytes_to_cluster(vol, attr_len));
 			vcn = ntfs_pidx_to_cluster(vol, folio->index);
@@ -3788,8 +3789,15 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 					goto err_unlock_folio;
 				}
 
-				submit_bio_wait(bio);
+				bio_err = submit_bio_wait(bio);
 				bio_put(bio);
+				if (bio_err) {
+					ntfs_error(vi->i_sb,
+						   "Synchronous attribute write failed (%d)",
+						   bio_err);
+					ret = bio_err;
+					goto err_unlock_folio;
+				}
 				vcn += rl_length;
 				offset += length;
 			} while (lcn_count != 0);
-- 
2.25.1
