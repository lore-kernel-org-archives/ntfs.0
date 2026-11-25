Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592163;
	b=2rrIOFRrPUSRW/2kA1mcRtUrFl1KEhw16nUNA1ZqzSHe87SKa59DNJJl+LfIKe8MvsOy
	 +nLtvg29dBb719bzXOK218nunsu+wWbAckjpYdSr4JfWtsc4v80CJXXqtSC6M8SU7JMAC
	 DHjjQNO0R7daF6TtI/2okYzO9G2SM58ShqjfdPUy1G0o/EpF3df2xAFjBugY5dosITovM
	 PsZDpAwe+ILVSCgAyD0h77QGvdcxbZ5m/nBTSSpqk5gHG81CneDEqL5u5ISGJ8TnkxJI5
	 zRV5xqvgieZPyt4z29QzrZeKDNqxixhQdHMnpj3nax7i17D4yl4qFXOe2BOAk3+ZcEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592163;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+9dGfIVE1U0VGIqTmh0uJwdb72ZWjKlrweV5TD0dad8=;
	b=z36KSDbCRrJQ09CJH2bfJCzuqgVvDUSMKRPSIYVttIkeamebBxnb9yC/DJNBK+LgA3lN
	 UOmfHBZ9AWcWrzbP6P8L+0klH/k5UvYcbhoFyEVmbi+M0GlMLEysewoI6lLSLvT7ZgmL0
	 S+oqyZ9OYAnzp8d280oZeKG/FzXuWsY2kiPdHNDDnttCNtDaXeAxNaIrlTMM/qdf21Z6c
	 i/Vb4PLO4aEROUkqn/+D8zwRffIZjq2HBVK0J2lSIFvMv5H/8vHH0dcMUChv6MgvRRU4q
	 p7YcdIUp5J9y1tCDJxTpXdnRNvdXJ8bSW+g3cJ8FXD+hsMyD/x1d1GMKk5zUwzfdzSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED55606A33C
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 07:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED55606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d853addee8a211f19a56ed5b684f684d-20261125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b9014b47-4238-40ea-962c-f42bfb91ac40,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:e337752a1f28bcc68832b7da0cbca5d8,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d853addee8a211f19a56ed5b684f684d-20261125
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1425986722; Wed, 25 Nov 2026 15:35:53 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH 3/6] ntfs: read initialized_size under size_lock in the iomap paths
Date: Wed, 25 Nov 2026 15:35:44 +0800
Message-Id: <20261125073547.154150-4-zenghongling@kylinos.cn>
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

The iomap read paths read ni->initialized_size without size_lock.
ntfs_read_iomap_begin_non_resident() reads it twice in the length
adjustment condition and once more in round_up(), so a concurrent
update in between lets the condition pass with one value while the
length is computed from another, which can yield a length matching
neither boundary.

Read initialized_size once under size_lock in the resident clamp,
the non-resident unwritten mapping, the length adjustment and
ntfs_iomap_put_folio_non_resident(), so each decision is made on one
value.

The buffered write and direct I/O paths read initialized_size
unlocked too, when deciding whether the head or the tail of a newly
allocated cluster has to be zeroed first. The mmap write fault path
can extend initialized_size while holding neither the inode lock nor
the MFT record lock, so snapshot the field under size_lock there as
well.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 fs/ntfs/iomap.c | 50 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index 8933f432aa68..afc4494822e1 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -17,11 +17,14 @@ static void ntfs_iomap_put_folio_non_resident(struct inode *inode, loff_t pos,
 {
 	struct ntfs_inode *ni = NTFS_I(inode);
 	unsigned long sector_size = 1UL << inode->i_blkbits;
+	unsigned long flags;
 	loff_t start_down, end_up, init;
 
 	start_down = round_down(pos, sector_size);
 	end_up = (pos + len - 1) | (sector_size - 1);
+	read_lock_irqsave(&ni->size_lock, flags);
 	init = ni->initialized_size;
+	read_unlock_irqrestore(&ni->size_lock, flags);
 
 	if (init >= start_down && init <= end_up) {
 		if (init < pos) {
@@ -88,6 +91,7 @@ static int ntfs_read_iomap_begin_resident(struct inode *inode, loff_t offset, lo
 	loff_t i_size;
 	u32 attr_len;
 	int err = 0;
+	unsigned long irqflags;
 	char *kattr;
 
 	base_ni = ntfs_base_inode(ni);
@@ -106,8 +110,10 @@ static int ntfs_read_iomap_begin_resident(struct inode *inode, loff_t offset, lo
 		goto out;
 
 	attr_len = le32_to_cpu(ctx->attr->data.resident.value_length);
+	read_lock_irqsave(&ni->size_lock, irqflags);
 	if (unlikely(attr_len > ni->initialized_size))
 		attr_len = ni->initialized_size;
+	read_unlock_irqrestore(&ni->size_lock, irqflags);
 	i_size = i_size_read(inode);
 
 	if (unlikely(attr_len > i_size)) {
@@ -200,6 +206,7 @@ static int ntfs_read_iomap_begin_non_resident(struct inode *inode, loff_t offset
 	struct ntfs_volume *vol = ni->vol;
 	loff_t vcn_ofs;
 	loff_t rl_length;
+	unsigned long irqflags;
 
 	vcn = ntfs_bytes_to_cluster(vol, offset);
 	vcn_ofs = ntfs_bytes_to_cluster_off(vol, offset);
@@ -231,7 +238,12 @@ static int ntfs_read_iomap_begin_non_resident(struct inode *inode, loff_t offset
 			iomap->type = IOMAP_HOLE;
 		iomap->addr = IOMAP_NULL_ADDR;
 	} else {
-		if (need_unwritten && offset >= ni->initialized_size)
+		loff_t initialized_size;
+
+		read_lock_irqsave(&ni->size_lock, irqflags);
+		initialized_size = ni->initialized_size;
+		read_unlock_irqrestore(&ni->size_lock, irqflags);
+		if (need_unwritten && offset >= initialized_size)
 			iomap->type = IOMAP_UNWRITTEN;
 		else
 			iomap->type = IOMAP_MAPPED;
@@ -255,11 +267,17 @@ static int ntfs_read_iomap_begin_non_resident(struct inode *inode, loff_t offset
 	up_write(&ni->runlist.lock);
 
 	if (!(flags & IOMAP_ZERO) &&
-			iomap->type == IOMAP_MAPPED &&
-			iomap->offset < ni->initialized_size &&
-			iomap->offset + iomap->length > ni->initialized_size) {
-		iomap->length = round_up(ni->initialized_size, 1 << inode->i_blkbits) -
-			iomap->offset;
+			iomap->type == IOMAP_MAPPED) {
+		loff_t initialized_size;
+
+		read_lock_irqsave(&ni->size_lock, irqflags);
+		initialized_size = ni->initialized_size;
+		read_unlock_irqrestore(&ni->size_lock, irqflags);
+		if (iomap->offset < initialized_size &&
+				iomap->offset + iomap->length > initialized_size) {
+			iomap->length = round_up(initialized_size, 1 << inode->i_blkbits) -
+				iomap->offset;
+		}
 	}
 	iomap->flags |= IOMAP_F_MERGED;
 
@@ -383,6 +401,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 	struct runlist_element *rl, *rlc;
 	bool is_retry = false;
 	int err = 0, map_err = 0;
+	unsigned long flags;
 	s64 vcn, lcn;
 	s64 max_clu_count =
 		ntfs_bytes_to_cluster(vol, round_up(length, vol->cluster_size));
@@ -511,9 +530,14 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 		iomap->flags = IOMAP_F_NEW;
 		if (lcn <= LCN_HOLE) {
 			loff_t end = offset + length;
+			loff_t initialized_size;
+
+			read_lock_irqsave(&ni->size_lock, flags);
+			initialized_size = ni->initialized_size;
+			read_unlock_irqrestore(&ni->size_lock, flags);
 
 			if (vcn_ofs || ((vol->cluster_size > iomap->length) &&
-					end < ni->initialized_size)) {
+					end < initialized_size)) {
 				loff_t z_start, z_end;
 
 				z_start = vcn << vol->cluster_size_bits;
@@ -527,7 +551,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 			if ((!err || err == -EPERM) &&
 			    max_clu_count > 1 &&
 			    (iomap->length & vol->cluster_size_mask &&
-			     end < ni->initialized_size)) {
+			     end < initialized_size)) {
 				loff_t z_start, z_end;
 
 				z_start = (vcn + max_clu_count - 1) <<
@@ -581,6 +605,7 @@ static int ntfs_write_da_iomap_begin_non_resident(struct inode *inode,
 	s64 vcn, start_lcn, lcn_count;
 	bool balloc = false, update_mp;
 	int err;
+	unsigned long irqflags;
 	s64 max_clu_count =
 		ntfs_bytes_to_cluster(vol, round_up(length, vol->cluster_size));
 
@@ -622,16 +647,21 @@ static int ntfs_write_da_iomap_begin_non_resident(struct inode *inode,
 		if (flags & IOMAP_DIRECT ||
 		    ntfs_iomap_flags & NTFS_IOMAP_FLAGS_MKWRITE) {
 			loff_t end = offset + length;
+			loff_t initialized_size;
+
+			read_lock_irqsave(&ni->size_lock, irqflags);
+			initialized_size = ni->initialized_size;
+			read_unlock_irqrestore(&ni->size_lock, irqflags);
 
 			if (vcn_ofs || ((vol->cluster_size > iomap->length) &&
-					end < ni->initialized_size))
+					end < initialized_size))
 				err = ntfs_dio_zero_range(inode,
 							  start_lcn <<
 							  vol->cluster_size_bits,
 							  vol->cluster_size);
 			if (!err && lcn_count > 1 &&
 			    (iomap->length & vol->cluster_size_mask &&
-			     end < ni->initialized_size))
+			     end < initialized_size))
 				err = ntfs_dio_zero_range(inode,
 							  (start_lcn + lcn_count - 1) <<
 							  vol->cluster_size_bits,
-- 
2.25.1

