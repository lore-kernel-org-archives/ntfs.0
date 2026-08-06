Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87BF38C42B
	for <ntfs@lists.linux.dev>; Thu,  6 Aug 2026 05:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995847; cv=none; b=FIrDZ+gzjIo/1Q/p4tghA1MUDJRaPSBNlpGnuW4hk1js/B2WN8a6/xYQa4dpNnH2+CtcpSz13mYfzIm9t42UvkbbNXkQDqG3uLz21mdSgWT+foiErDggRburBEFZOGczsOUdCycdGjH1kJB9dpxYKnjHHjNDyc5CtXDGGbQVtWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995847; c=relaxed/simple;
	bh=5KJgH9AWCbt6lJK02XsPTUdL7Gj+2UvDSOCD8IIlqVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wf1ZZTPJfVjYDub54ZBxAp7pW1Q1WHKtfjp4/5KJG3IMhXK209NMbKKLu76CnBmpaTr/jfouQgfBWEe/8xn8g/kbHJlYmqXZKXBsOeAVi7CkgURy/TMgij0djGSCy277nKb5I2WJ5yhSTJf+z+1lbK3840LHYRGRNA5g0uyfVEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ae46fc4c915b11f1aa26b74ffac11d73-20260806
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e80ebe31-7e75-436b-a9b2-718e96e03f41,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:bcd1cdca5728b022bf1d1261a3132ab2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ae46fc4c915b11f1aa26b74ffac11d73-20260806
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1186344515; Thu, 06 Aug 2026 13:57:17 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	alexandro.calo@nozominetworks.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH v3] ntfs: validate non-resident attribute offsets
Date: Thu,  6 Aug 2026 13:57:13 +0800
Message-Id: <20260806055713.42067-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_attr_update_meta() shifts the attribute name when converting between
non-sparse and sparse attributes. Converting to sparse also adds the
compressed_size field before the name and mapping pairs, requiring eight
additional bytes in the attribute record.

However, the validator does not check that name_offset is within safe
boundaries for these operations or that the additional space is available.
A malicious MFT record could set name_offset such that:

1. The name is positioned at the very end of a non-sparse attribute.
   Converting to sparse would shift the name forward by 8 bytes,
   writing beyond the attribute boundary.

2. The name overlaps with the mapping pairs, causing corruption during
   conversion.

Add validation to ensure:
- For named attributes, name_offset is within valid bounds
- Name does not extend beyond the attribute or overlap with mapping pairs
- For non-sparse, non-compressed attributes, eight bytes are available
  after mapping_pairs_offset for the compressed_size field

The space check also covers unnamed attributes, for which name_offset = 0
is valid and no name range needs to be checked.

Fixes: 7e2a1c554bc4 ("ntfs: Fix min_len for compressed/sparse attributes in ntfs_non_resident_attr_value_is_valid()")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Suggested-by: Namjae Jeon <linkinjeon@kernel.org>
---
Changes in v3:
- Move the sparse conversion space check outside the if (name_length)
  block to cover both named and unnamed attributes.
- Use attr_len - mp_offset < sizeof(compressed_size) to check for
  sufficient room, as suggested by reviewer.
---
 fs/ntfs/attrib.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index d354c3b0fae1..edea3d822b57 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -693,6 +693,8 @@ static bool ntfs_non_resident_attr_value_is_valid(const struct attr_record *a)
 	u32 attr_len;
 	u32 min_len;
 	u16 mp_offset;
+	u16 name_offset;
+	u32 name_end;
 
 	attr_len = le32_to_cpu(a->length);
 	min_len = offsetof(struct attr_record, data.non_resident.initialized_size) +
@@ -706,7 +708,28 @@ static bool ntfs_non_resident_attr_value_is_valid(const struct attr_record *a)
 		return false;
 
 	mp_offset = le16_to_cpu(a->data.non_resident.mapping_pairs_offset);
-	return mp_offset >= min_len && mp_offset <= attr_len;
+	if (mp_offset < min_len || mp_offset > attr_len)
+		return false;
+
+	if (a->name_length) {
+		name_offset = le16_to_cpu(a->name_offset);
+
+		if (name_offset < min_len || name_offset >= attr_len)
+			return false;
+
+		name_end = name_offset + a->name_length * sizeof(__le16);
+		if (name_end > attr_len || name_end > mp_offset)
+			return false;
+	}
+
+	/* Ensure there's room for the compressed_size field if needed. */
+	if (!(a->flags & ATTR_IS_SPARSE) &&
+	    !(a->flags & ATTR_IS_COMPRESSED) &&
+	    attr_len - mp_offset < sizeof(a->data.non_resident.compressed_size))
+		return false;
+
+	return true;
+
 }
 
 static bool ntfs_attr_value_is_valid(struct ntfs_volume *vol,
-- 
2.25.1

