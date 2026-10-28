Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176992;
	b=saL3VDY2EHxg7elsN8VXf8czqurKrrruXA+gy2HD2LiVwzdZSGxA2xGzdDnJ5xXWLeHH
	 dL303MNdbyxgs26ZpDr2OUoKR23TuFDbbFgLjkkyOnZy1/emb5vyy5y4wpIt/MqlkZkRU
	 NbAqKAPHdzHSGp5wDZMVA4yHOd5wE8w0MJJZOyDad7Dg/4nJAQecxoPXR5lpcIo/dwHQA
	 Mzi2CzOBnCPhboUeZ2EcOyx/O0S8r7UHW/IMcWthkfk1/KR1GB198l/9c8sZNWJaQNtYn
	 ZkLpUFMQb4qEROowwU6f8I4A765/j5iwahmckIPPesYzY0j2/gv+7PxQxH/0R7MiqSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pOU2cAiKY0ib0Jjiwrji+UcpbiJ4VGJehcK9VLg1hAU=;
	b=Y4XBQpcduIAAemb7jf4ojVWPY2bLmC2xSJs8C1KM2FwefXvRlU9xu8mPvsIYxb2R89yH
	 CO66QNPN2Bu6ImUbVuWcA9fcK+9w6ILUFZZp1GZ4Tog1RgIssWRgmkxTAtIOaK2tgPO2+
	 /MVgejq/bF5BI135doUd9AZyaEgKSM4MqipQ8yBTzcUfExlsGjQNfQMNQHoYQnAWxvPCA
	 bnaQJm2Rz5pP+K8DBxmr2mh9bU7XJ1hnNeTnIanrFsqrDRXTIio2i97ugpClaY2k99iNo
	 5Tk3ul3HOI1b1uqpEMQMUMuKVveHZU/WhGHGjBHo4w7JLbobXvYCQnOaGOad6LevBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NbjqoMrv;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983A606A31A
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 08:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C983A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NbjqoMrv
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e831e86ebfso4023545ad.1
        for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793176991; x=1793781791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOU2cAiKY0ib0Jjiwrji+UcpbiJ4VGJehcK9VLg1hAU=;
        b=NbjqoMrvugw7yIO/vY+QMG2ulE3AAzviScGw1trV0VnxryjDCSbianXdfNF6IWAGHA
         OcZjHArGain1OGQHmPfogB6ZdPERslRcMFwKyZOvvKB841+XOBiq71CepQj0FTq58Syw
         5fRBG+W/IiV7u2Sdzc208HL1GqaJgWrgeYpYAdrQXF2ZKEBmdLT/vc6cYVdNv2vLFWe7
         7ZujZCi4qMhIDLZhJMu3IGSLeqGgY/vXAuGtd85PP7SxK3hIccpBPOVCUF08ssT1YqUS
         2wxPlQ139r/Em84YXOP/8nL0KcVVzzJ212ImEHkFmjUF1RfK5oxLxJSXWfs/BS+DRXqO
         QFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176991; x=1793781791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOU2cAiKY0ib0Jjiwrji+UcpbiJ4VGJehcK9VLg1hAU=;
        b=VBTTLdquwr06tOlw30LZn/bIzGXAuEWrrp/XpSxJlUU1B+BgZereBg/HWHpVKOHtIZ
         VdCtRTjOKU1Ba2SBVRhfQkVLljk0o5PWTIq/gN+CpmXZbMupvF9m2MdXZNXLnByqVtR9
         KJpi6DRPL23Wi27AqTikZ9nwT1TA6JWHA2S67A2GiXLXDY90bIsVswqKvN2DJFfvxdQ3
         xqUwgxnePIUveZgG1a1NFOkWaRxSEf1rFlI6PG7aAJ0h1NOF0WfrJTZhWL+od5hM+ZfJ
         lcfLfK6UDN5+OKpcJylWAQtji+3T5BTxsK0asCLm2wMT2DQtepnkGGwI5BHnKnV2RtTa
         YXxw==
X-Forwarded-Encrypted: i=1; AKwUvBwXWnQO+LtpIyv1b0Eu3KL1CP/XwyxnBdevoDbjJ+Kcqe88aZ6FtkrUQl/d80stCrXSUOLx@lists.linux.dev
X-Gm-Message-State: AFq9FYIb3/hbOak4Mv1zJObC9ex+qtxK5Myqf/cGkuZC721q5FJ3aVpw
	cPn2YSVEbFmGyVjA4ipKvnkdqToZNhQ8cX6q8V4ei6rTDsOkCGvMa1lL
X-Gm-Gg: AYBFou2k31L7zH7izlmGL9+TijfV7zun6fyp1GpVVd8yHatnXvMb6Eh1ztH+QqaiGl+
	IrQeBGoe+G+Ubv8x9wYlTrRKOsbVm9CFNR/qyspmY8i+O/0g4+zJUcd1hIG+AZJSElCu1H6hXeT
	2P5Oma0FnBGpO13Nm+hdfzzLCE8tG60mEojrXb5ig4mb5ZbRCdjvA4NySZzw6vaLYEXneL63jQa
	hVjbhNTWV4Z+WYpr+22sgK+CEdkNHYpsA5kGq71l/jRC6mvHro4d2zLXtKwgG5Bh/uAcASDBOEc
	RklXj2TQUKGOuqss1AZ7iy3fpCnZ5jFkhj8OtHY9TlAG6qLpxpTniLFK/EDaiEbHskWz+ftT4gb
	1FWMVhVLk+OQFzDBirp6dSTYsPZm92zdswt12oTKCI8HYjKQgFtKvsEnA7hnCG4GK1w8MJf7ueK
	qKAtVNahhe/NxWEvYnBspzMH0cV3nFIwkSJHtLTMNkUUyLlOAIA/vFsWynWBlKvLNak9s5mYHhi
	tm0WYY+jw9wHKUH4ALakSNQo3GNnahgmKS0OJKkMhSWBnj+HzXJ1S2Z+I6azRRVp9rRNyjvjzQi
	58Us3BZWtUxxiVvciG/NWa56mCCxXCk6bfM=
X-Received: by 2002:a17:90b:5863:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae581836a6mr1253042a91.38.1793176990857;
        Wed, 28 Oct 2026 01:43:10 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cc9b25a3sm3756367a12.2.2026.10.28.01.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:43:10 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Robert Morris <rtm@mit.edu>
Subject: [PATCH 1/3] ntfs: reject negative attribute read positions
Date: Wed, 28 Oct 2026 17:42:46 +0900
Message-ID: <20261028084248.2149976-1-hyc.lee@gmail.com>
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

A corrupt index entry can produce a VCN whose byte offset overflows.
Reject negative positions before they reach pointer arithmetic in
ntfs_inode_attr_pread().

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Reported-by: Robert Morris <rtm@mit.edu>
Link: https://lore.kernel.org/ntfs/10091.1793100344@localhost/
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/index.c | 39 ++++++++++++++++++++++++++++++++++++++-
 fs/ntfs/index.h |  1 +
 fs/ntfs/inode.c |  4 +++-
 3 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 66411a712b14..e6ba1a08741b 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -14,6 +14,8 @@
  * Copyright (c) 2007-2021 Jean-Pierre Andre
  */
 
+#include <linux/overflow.h>
+
 #include "collate.h"
 #include "index.h"
 #include "ntfs.h"
@@ -255,6 +257,32 @@ static s64 ntfs_ie_get_vcn(struct index_entry *ie)
 	return le64_to_cpup(ntfs_ie_get_vcn_addr(ie));
 }
 
+static int ntfs_index_entry_vcn_inconsistent(const struct ntfs_volume *vol,
+					     struct index_entry *ie,
+					     u8 vcn_size_bits, u64 inum)
+{
+	s64 vcn, pos;
+
+	if (le16_to_cpu(ie->length) <
+	    sizeof(struct index_entry_header) + sizeof(s64)) {
+		ntfs_error(vol->sb,
+			   "Index entry with node flag has no VCN in inode %llu.",
+			   (unsigned long long)inum);
+		return -EIO;
+	}
+
+	vcn = ntfs_ie_get_vcn(ie);
+	if (vcn < 0 ||
+	    check_shl_overflow(vcn, vcn_size_bits, &pos)) {
+		ntfs_error(vol->sb,
+			   "Invalid index entry VCN %lld in inode %llu.",
+			   vcn, (unsigned long long)inum);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static struct index_entry *ntfs_ie_get_first(struct index_header *ih)
 {
 	return (struct index_entry *)((u8 *)ih + le32_to_cpu(ih->entries_offset));
@@ -326,10 +354,13 @@ static int ntfs_index_header_inconsistent(struct ntfs_volume *vol,
 
 int ntfs_index_entries_inconsistent(const struct ntfs_volume *vol,
 				    const struct index_header *ih,
+				    u32 block_size,
 				    __le32 collation_rule, u64 inum)
 {
 	struct index_entry *ie;
 	u8 *index_end = (u8 *)ih + le32_to_cpu(ih->index_length);
+	u8 vcn_size_bits = vol->cluster_size <= block_size ?
+			vol->cluster_size_bits : NTFS_BLOCK_SIZE_BITS;
 
 	for (ie = ntfs_ie_get_first((struct index_header *)ih);
 	      ; ie = ntfs_ie_get_next(ie)) {
@@ -348,6 +379,11 @@ int ntfs_index_entries_inconsistent(const struct ntfs_volume *vol,
 			return -EIO;
 		}
 
+		if ((ie->flags & INDEX_ENTRY_NODE) &&
+		    ntfs_index_entry_vcn_inconsistent(vol, ie,
+						      vcn_size_bits, inum))
+			return -EIO;
+
 		if (ntfs_ie_end(ie))
 			break;
 
@@ -566,7 +602,8 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
 		return -EIO;
 	}
 
-	if (ntfs_index_entries_inconsistent(vol, &ib->index, cr, inum))
+	if (ntfs_index_entries_inconsistent(vol, &ib->index, block_size,
+					    cr, inum))
 		return -EIO;
 	return 0;
 }
diff --git a/fs/ntfs/index.h b/fs/ntfs/index.h
index a898e348f2c9..bc2f1bbdfba4 100644
--- a/fs/ntfs/index.h
+++ b/fs/ntfs/index.h
@@ -98,6 +98,7 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
 				  __le32 cr, u64 inum);
 int ntfs_index_entries_inconsistent(const struct ntfs_volume *vol,
 				    const struct index_header *ih,
+				    u32 block_size,
 				    __le32 collation_rule, u64 inum);
 struct ntfs_index_context *ntfs_index_ctx_get(struct ntfs_inode *ni, __le16 *name,
 		u32 name_len);
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 206db4e99ef1..b8a1af8c4cea 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1034,6 +1034,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 				le16_to_cpu(a->data.resident.value_offset));
 		if (ntfs_index_root_inconsistent(ni->vol, a, ir, ni->mft_no) ||
 		    ntfs_index_entries_inconsistent(ni->vol, &ir->index,
+						    le32_to_cpu(ir->index_block_size),
 						    ir->collation_rule, ni->mft_no)) {
 			ntfs_error(vi->i_sb, "Directory index is corrupt.");
 			goto unm_err_out;
@@ -1684,6 +1685,7 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	ir = (struct index_root *)((u8 *)a + le16_to_cpu(a->data.resident.value_offset));
 	if (ntfs_index_root_inconsistent(vol, a, ir, ni->mft_no) ||
 	    ntfs_index_entries_inconsistent(vol, &ir->index,
+					    le32_to_cpu(ir->index_block_size),
 					    ir->collation_rule, ni->mft_no)) {
 		ntfs_error(vi->i_sb, "Index is corrupt.");
 		goto unm_err_out;
@@ -3715,7 +3717,7 @@ s64 ntfs_inode_attr_pread(struct inode *vi, s64 pos, s64 count, u8 *buf)
 		}
 	}
 	isize = i_size_read(vi);
-	if (pos > isize) {
+	if (pos < 0 || pos > isize) {
 		mutex_unlock(&mrec_ni->mrec_lock);
 		return -EINVAL;
 	}
-- 
2.43.0

