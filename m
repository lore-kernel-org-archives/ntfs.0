Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6102B4B1CE0
	for <ntfs@lists.linux.dev>; Thu, 17 Sep 2026 23:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688670; cv=none; b=YBIwzLoap8adLQ854RkyLa6pdCXM0zeSw/570KnyTDVPN1y4VhnMMFobMcTFSDK0SF1DqfW6Br5Oxo/og6OEcQNn6lxmKsTGn96iTB6TE5II0O4q60mYOpK1K3l5JKJenuCHEG3gEmtrIQjbfj+ix7rUnko69Tx34XeEa+IQBCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688670; c=relaxed/simple;
	bh=WS0J1yLSbAuVdC5y42i7TWMsWDLvSpJv6nvpFOXlltc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PG0mIFQi92gMkdxF/pRNXk/MldjN9MlyUyvXpBu17wzgnVVKrc82+1FHj0jlaYhhnmOlvuNJ5fQrzP6gpGkOSEBzxOlsdiJajR7PUCp7pufMI6osXCVCR6OLfSdIX/VU2SJqwuPX+BdJOkKz9Bke6oWLy+tDZZYSI6VzcjQMXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqo0PGtf; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqo0PGtf"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so1281775ad.1
        for <ntfs@lists.linux.dev>; Thu, 17 Sep 2026 16:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789688667; x=1790293467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XR1n9oQCUN1SNWpgYcfT0i0kDZv+VNTvvaG0v4HP1s=;
        b=rqo0PGtfyK/uYHMShZ1jd8mC0MMYVp15f+Fx4JuOGWwXVYj1XIgg3WBzRngBVJsTTD
         EFLPZXZoWjackFQyqsAf+NPkXilZLthi7d8lcU7dwazBT+iHPQ0sPdWoK1kUcoK46Pol
         P9nAS6ut9DogKa6ZElt4+8ym3JdhLa9VTMhqaQMceWF+F23qGDlcpY4IJ7TVKvi9+FgF
         gzzWP2NRBMTrtNQWSOxS+9Lw0bCnNpj2V3EcW8HKKnwyKiBiStzf0WXYeiygFlTk3gTT
         cirWUPm7L7arLnTbTCoNCw0RkGGG5nQk/0ozlmGLin85Xa/RJR8rhKq+WQqW9XQlimh0
         b/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789688667; x=1790293467;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XR1n9oQCUN1SNWpgYcfT0i0kDZv+VNTvvaG0v4HP1s=;
        b=iVXfOHtgENujXt3gk1zIr4lGT8u+hkdkd0PtmxzkF29SwvOITHinohrCcBtbhxXwkp
         rM6/OAOncwIV6zU7980oBQpYKJ3rtnNQfrMQgUGdCXVL5HjWU1rb0MEeiz/p1p9apv5k
         bMZdtXjfozfteG3oeBYqBPJe3et508tDdZ2l9I8Ov764qk7xgIEz9ii34r6xBhf7HdCA
         rsNIp7E3txEdRi0e6jGhOqPy1dOyo7IkYQeGr3YcsDp1Yw0YX9YdrzQkRXOWR4tsKbfa
         wrK/kODQj/3iWrdizFKxrXQ4P2hTACLNJ7bNiQODrbezizhRfd4VnG9SMz6xcWPNt5pV
         4hVg==
X-Forwarded-Encrypted: i=1; AKwUvBxa2MlcrPkNhkiGe0+3OpitJ9JrznEh+NmF7xHiJaEMX5+P2fmOuw4yds3RRcX8fetyMnlw@lists.linux.dev
X-Gm-Message-State: AFuF++mKXsyMbaMKR702zU5L3rkkrzZ7xk5/4SF4gSEMP20kayruGS41
	iLBKocZVuXE4BMy71h5wQi3ISKCMqe3GVnZ+fFh9eUqvbs94Alkqm5Dk2ksSWA==
X-Gm-Gg: AYBFou1TS+wOyFPnj29OWgygKbUd/FkRSXP1OoGfsqJbenveqtBFl4cgJaVS8vEXOHQ
	pvqRs1bR8qXdiaXJo5rnUzeqZR10UJ5fjHjiWpAzufehIawKeRZMNXbWZDZtOxWFJXwnT0lY4i3
	PtG0f6OZND2hoPapX2E1CKVwZtg3HLs6c6fSx3u8Fpal3waNSjcqwNpYv3McU6jMjGp5galCfQT
	uwrSoCtOX46H8XfbbEghMijGHLA/fTf3SVT2Jv94d22Mw5E1DtAJxMq077D/1k5TAHuWLuR8LUm
	znXamHCVReIoQ8W/+6k3LD6OJAvFcn+Fjok1fzt6qXZ8Lkbzb+W77VpAxqGnWUt9KV/s/abbLaT
	TigakNUQp13dhh65m6WK6O+pH8PPwk5sgcMCY02rrNZpO8iN4crblIcYIEa1HzO6oP0ZQOK4fd8
	PrW9+BdjzHvpoY2wAMttkrcAgwJlJp16/Tg0OiWhHeHVwm6jXdCUlVc+7EJI2gwzLyjFh9LZ0Gq
	yY2/sXh4YUwzEud7Q==
X-Received: by 2002:a17:903:3c43:b0:2d1:134:b86e with SMTP id d9443c01a7336-2ddb1acac1dmr17740565ad.2.1789688667430;
        Thu, 17 Sep 2026 16:44:27 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89e96cccsm32927865ad.22.2026.09.17.16.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:44:25 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH] ntfs: fix incorrect VCN units for index blocks in large clusters
Date: Fri, 18 Sep 2026 08:43:25 +0900
Message-ID: <20260918-fix-c8k-index-v1-1-b65c8c68b0d4@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5344; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=WS0J1yLSbAuVdC5y42i7TWMsWDLvSpJv6nvpFOXlltc=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqrHsBgCVmbX1+OoeWcFZx8Ain09AXFLaxkwkXy
 LiNrKi6/iWJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqx7AQAKCRA08jD6945I
 01FpEACunvhT3wMZVveduwnPu1EP5TH14G1VSH1AJ1/xzlyQevuzXI7DhPWoOi++h6aPfdy72yS
 VTGHY8zu/c/oAswxOAkFKbcDreI44zeNvEGRHvHVZzIjYyMiIG3UxE4m5NplujrXwofFSX88ruR
 upN39+vV96XW7+GQgS6lK+/qf7CLcqvX2S513GCWXBIM8Q+rsgXlCNhrCEGvNCyOU7mL4UWAzsU
 Srp1HoaurH/NNoHtZUx6LeaCxoEKUp3XfYQFhRk6tWLYRlqK+iqRhF4q9bgdqPq2fhFs7ERkTYd
 /h7KqbaEswabbcAG5HPQYBcvO9/37Pz8U3g0JYwVl+CfjPPpjPVnckAntu493DXygUaVIYnKN/x
 sN+DspSn7/qK0fdfXGxh0ePg8b8snhPMgELXvYHRtSiV17AfssfqLPAtRZCrEh8txV+YooFGku+
 G+LcKqOrgibr5n0NheNIE3T2b3UFR405bDivDIUhSPWFNVO/5kcdsjnJrAt14aSPco0oaRCa897
 /ezaDtHhWGO1hK47V5loE93iyfNv0Dp4uQBETWEk3iWf3oB0PmVOpNpcXyJ2HgcfCu3sfyAacJA
 q4BkW31J6X61X456A2EPA91w+aqAamszimgneM8t0xyRQJ5pjjQdgMwRboHM7dcyC1ONZcey2UN cueqyUhXoudH7SA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

NTFS stores VCNs for index blocks smaller than their cluster in fixed
512-byte units, independent of logical sector size. Use correct block
units when initializing and traversing these indexes so directory indexes
are located correctly.

Verified on a Windows-created 4Kn/32KB-cluster NTFS volume that when the
index block is smaller than the cluster, the VCN unit is 512 bytes.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/index.c  | 2 +-
 fs/ntfs/index.h  | 2 +-
 fs/ntfs/inode.c  | 8 ++++----
 fs/ntfs/layout.h | 6 +++---
 fs/ntfs/namei.c  | 7 +++----
 5 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 46a8b19c0723..3e901004bcbf 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -852,7 +852,7 @@ int ntfs_index_lookup(const void *key, const u32 key_len, struct ntfs_index_cont
 	if (ni->vol->cluster_size <= icx->block_size)
 		icx->vcn_size_bits = ni->vol->cluster_size_bits;
 	else
-		icx->vcn_size_bits = ni->vol->sector_size_bits;
+		icx->vcn_size_bits = NTFS_BLOCK_SIZE_BITS;
 
 	icx->cr = ir->collation_rule;
 	if (!ntfs_is_collation_rule_supported(icx->cr)) {
diff --git a/fs/ntfs/index.h b/fs/ntfs/index.h
index 9a03f53bba47..a898e348f2c9 100644
--- a/fs/ntfs/index.h
+++ b/fs/ntfs/index.h
@@ -37,7 +37,7 @@
  *		(maximum is MAX_PARENT_VCN)
  * @ib_dirty:	true if the current index block (@ia/@ib) was modified
  * @block_size:	size of index blocks in bytes (from $INDEX_ROOT or $Boot)
- * @vcn_size_bits: log2(cluster size)
+ * @vcn_size_bits: log2 of the VCN unit size
  * @sync_write:	true if synchronous writeback is requested for this context
  *
  * @idx_ni is the index inode this context belongs to.
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 4375ad477809..d389d89b3ff5 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1021,8 +1021,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
 			ni->itype.index.vcn_size = vol->cluster_size;
 			ni->itype.index.vcn_size_bits = vol->cluster_size_bits;
 		} else {
-			ni->itype.index.vcn_size = vol->sector_size;
-			ni->itype.index.vcn_size_bits = vol->sector_size_bits;
+			ni->itype.index.vcn_size = NTFS_BLOCK_SIZE;
+			ni->itype.index.vcn_size_bits = NTFS_BLOCK_SIZE_BITS;
 		}
 
 		/* Setup the index allocation attribute, even if not present. */
@@ -1612,8 +1612,8 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 		ni->itype.index.vcn_size = vol->cluster_size;
 		ni->itype.index.vcn_size_bits = vol->cluster_size_bits;
 	} else {
-		ni->itype.index.vcn_size = vol->sector_size;
-		ni->itype.index.vcn_size_bits = vol->sector_size_bits;
+		ni->itype.index.vcn_size = NTFS_BLOCK_SIZE;
+		ni->itype.index.vcn_size_bits = NTFS_BLOCK_SIZE_BITS;
 	}
 
 	/* Find index allocation attribute. */
diff --git a/fs/ntfs/layout.h b/fs/ntfs/layout.h
index 9438fd9b668e..8f5792139d71 100644
--- a/fs/ntfs/layout.h
+++ b/fs/ntfs/layout.h
@@ -1880,8 +1880,8 @@ struct index_header {
  * @index_block_size:   Size of each index block in bytes
  *                      (in $INDEX_ALLOCATION).
  * @clusters_per_index_block:
- *                      Clusters per index block (or log2(bytes)
- *                      if < cluster).
+ *                      Clusters per index block, or 512-byte units when
+ *                      the index block is smaller than a cluster.
  *                      Power of 2; used for encoding block size.
  * @reserved:           3 bytes reserved/alignment (zero).
  * @index:              Index header for root entries (entries follow
@@ -1921,7 +1921,7 @@ struct index_root {
  * @lsn:                Log sequence number of last modification.
  * @index_block_vcn:    VCN of this index block.
  *                      Units: clusters if cluster_size <= index_block_size;
- *                      sectors otherwise.
+ *                      512-byte blocks otherwise.
  * @index:              Index header describing entries in this block.
  *
  * When creating the index block, we place the update sequence array at this
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 3e0adb9a0ea4..75e201096525 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -433,9 +433,8 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
 			ni->itype.index.vcn_size_bits =
 				vol->cluster_size_bits;
 		} else {
-			ni->itype.index.vcn_size = vol->sector_size;
-			ni->itype.index.vcn_size_bits =
-				vol->sector_size_bits;
+			ni->itype.index.vcn_size = NTFS_BLOCK_SIZE;
+			ni->itype.index.vcn_size_bits = NTFS_BLOCK_SIZE_BITS;
 		}
 	}
 
@@ -569,7 +568,7 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
 				NTFS_B_TO_CLU(vol, ni->vol->index_record_size);
 		else
 			ir->clusters_per_index_block =
-				ni->vol->index_record_size >> ni->vol->sector_size_bits;
+				ni->vol->index_record_size >> NTFS_BLOCK_SIZE_BITS;
 		ir->index.entries_offset = cpu_to_le32(sizeof(struct index_header));
 		ir->index.index_length = cpu_to_le32(index_len);
 		ir->index.allocated_size = cpu_to_le32(index_len);

---
base-commit: 27d5cd2d940b53718f66fb682475587aa993d760
change-id: 20260918-fix-c8k-index-e91b078b1290

Best regards,
-- 
Thanks,
Hyunchul

