Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592160;
	b=GQoG87dXSWm0M8qST7QDuLgquUhE+Pk4wXEOvwhJaVC27G+N2E+fiiX+pDTlqXkkIENR
	 zGqHGtKbOUTI1bv9ldXbNj7rMZhFxK28kSEi2U38D4twI9FylzewEl4aNeQ8KO1npz7SU
	 PUm9vdVnB19CLNgDRVFd6Ed6EBSsPF6Hq2Yy7qCGjB9byNLB1ILzJUiVoG3Hkqn+sr5IJ
	 EviyflVAXSmcC0VShT3thO9hdttAkLD1l45x/195ffBbQonZJcXKsBo4GBiqJv9mMgyWR
	 ZCKhJD96OrI2lSSV5kwKYBW0UJdcTPdpMyQ+AymtkeNMLjMxr+Rj+YrZv8c8pU+zTVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592160;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=11nUhNXSFqSohdNj+iplx2PDia7R/4rv+wO5nWYuzGw=;
	b=OD4d/cALqtqdS1DC9bquZ6XiqfKT80YPFTwmOb6VbO4tB1yP265i6Gn9GhIYYFqmXBvl
	 5eLL8fW0HiOctDWmNfwda00UP58XKVszOnnjhF+OAmKQdnEFRemc9VAldhGSyb9aRR7JJ
	 Ps2qkWqnK76R5PbKEg6uxdbORV8NFNlkpowYiFePr5+IUjCYt5JN/0hqLWekh+zBW9NWr
	 mu9NR2xywNJV6Jw+pye0L6Lc5FzcFcfMAmu5U/x+UAAj0Mgj9gKRw1GEuyxd/IHtKeIQX
	 sCpR41LTMlrg1b5hO5icHlTGZDGM1YbEgqUjKVBdxtsmbW3EaeAq46N1SHlJpsk3rvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B116606A326
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 07:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B116606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d7f9cb98e8a211f19a56ed5b684f684d-20261125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7d9a3554-ca4b-44b8-854b-5d7c7eade026,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:018b4539a730a144e05d4dbcfd6dc04f,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|850|865|898,TC:nil,Content:0|15|50|9
	9,EDM:2|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d7f9cb98e8a211f19a56ed5b684f684d-20261125
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 915519103; Wed, 25 Nov 2026 15:35:53 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH 2/6] ntfs: roll back the size update when the attribute lookup fails
Date: Wed, 25 Nov 2026 15:35:43 +0800
Message-Id: <20261125073547.154150-3-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125073547.154150-1-zenghongling@kylinos.cn>
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
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

ntfs_enlarge_attribute() truncates the attribute to the end of the
write before looking it up again, because the truncation can move the
attribute to a different mft record. If that lookup fails, the error
is returned but the attribute stays at the extended size, so a failed
write extends the file.

Undo the truncation before returning the error. If the rollback fails
as well, mark the volume as having errors and synchronize i_size with
the current data_size instead of the old snapshot.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 fs/ntfs/inode.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 4fbdcd459652..7d7bb741455e 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3842,8 +3842,19 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
 {
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct super_block *sb = vi->i_sb;
+	unsigned long flags;
+	s64 old_data_size;
 	int ret;
 
+	/*
+	 * Snapshot the old data_size under size_lock: it is the rollback
+	 * target, the other sizes are updated by ntfs_attr_truncate()
+	 * itself
+	 */
+	read_lock_irqsave(&ni->size_lock, flags);
+	old_data_size = ni->data_size;
+	read_unlock_irqrestore(&ni->size_lock, flags);
+
 	if (pos + count <= ni->initialized_size)
 		return 0;
 
@@ -3853,7 +3864,7 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
 	if (NInoCompressed(ni))
 		return -EOPNOTSUPP;
 
-	if (pos + count > ni->data_size) {
+	if (pos + count > old_data_size) {
 		ret = ntfs_attr_truncate(ni, pos + count);
 		if (ret) {
 			ntfs_debug("Failed to truncate attribute");
@@ -3865,7 +3876,40 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
 				       CASE_SENSITIVE,
 				       0, NULL, 0, ctx);
 		if (ret) {
-			ntfs_error(sb, "Failed to look up attr %#x", ni->type);
+			int rollback_err;
+
+			/*
+			 * The truncation already happened, so undo it
+			 * before returning the error
+			 */
+			rollback_err = ntfs_attr_truncate(ni, old_data_size);
+			if (rollback_err) {
+				s64 current_data_size;
+
+				/*
+				 * Rollback failed, the sizes may be
+				 * inconsistent. Mark the volume as having
+				 * errors and sync i_size with the current
+				 * data_size
+				 */
+				read_lock_irqsave(&ni->size_lock, flags);
+				current_data_size = ni->data_size;
+				read_unlock_irqrestore(&ni->size_lock, flags);
+
+				i_size_write(vi, current_data_size);
+				NVolSetErrors(ni->vol);
+				ntfs_error(sb,
+					"Failed to look up attr %#x and "
+					"roll back the size update: %d",
+					ni->type, rollback_err);
+			} else {
+				/*
+				 * Rollback succeeded, the sizes were updated
+				 * by ntfs_attr_truncate() itself
+				 */
+				ntfs_error(sb, "Failed to look up attr %#x",
+					ni->type);
+			}
 			return ret;
 		}
 	}
-- 
2.25.1

