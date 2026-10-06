Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F680547061
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 02:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791253465; cv=none; b=NdnSBLmPjnL3xOGNEeny/MC3KE/VXEyaeLhERbIULrTiwXQXf460oZFJd+VpO51CvI7yha7P8uSuXFPvQucqKAoFt3bnunJr5TTMbpmjG++BmEp3yN61aGhI0Yhlcy22KDyHML7TTQhGFT3rzJuIMKh7GheBnUsBF4YEqIyY+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791253465; c=relaxed/simple;
	bh=6FvF9t/D18OR7fv5VlRJmEBIPVHaDADgkMnKxeXIxq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HsU87f0fphphm5Qjxon+tCbgIg0aJVrT3XUdkEYQjyBy+TfkiCbq5gH/W0dfkyFANjmUOGoagyzsPjHmdiXKb5jAFM5Es76Hrf5ZX6+yd7P0S9OelONIQKI1311tDoEM1Netvnfn1xYink79L+4vdz1BbGJPjEcpfxS97azuO6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV5rDIbF; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV5rDIbF"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbee846deecso1733496a12.1
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 19:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791253464; x=1791858264; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPj481XhqfdiSM2c463ltDE9YpBVtrrEieloSKmz5fI=;
        b=nV5rDIbFbblmxZFE/YRQcAAI8hzr5opxeWDgLNRXl33qlQr0C+jjhQa7gAnxZsoK3u
         qbSck6JLVMY31WaKa6kyS/qqFWZX+ckm+uwnEQjHzqjGL/o+ml2zyIqWi0fK8ZDS0LUU
         S28h/E6VoY7oqRPR55S1LY0joGTqcQZti3wmhuzZne7l8wwIf7ew2D/KjXoxj9Ll4pc3
         9cizql6Te3VQO6abG4xN+ZZ0160Z/7FltDoMTpRr5zueoUJfSPrqlaJubr0WPRFs7JQ2
         hAN7HSOZNhts5D+m3GhQosFGgM5QcfdIW1NEFqVhVNFcvJ5mypYWTeFqp7yiJUzEk9bO
         RKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791253464; x=1791858264;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPj481XhqfdiSM2c463ltDE9YpBVtrrEieloSKmz5fI=;
        b=lomQKDjPMxXz9YEqoVzuzFqBK4IGvFNbBH3e6TBAysZe8c+wLbcWlRgoW1vCcdYPDp
         E8iSDHF3VfU6cAGAbbJLedbMR05X+4BbzAHfnLPbSCGrBGLa1ad6o60QMjj1S/+5pFpl
         U6p6kerPTO/BSAnak6GxrLJVQVa601fppmokOnqM9PzfAKE6TSrURFuJFo36ndAilKJt
         qv3/XpZc/LM05mGOuE4r1onNpVzQWTQalhOxXbt/OE9aY/ZzyOIZKFL6HJQdhNXIWy3F
         +IDtnjFElirZdzMsgD2boznbbWj+TJOk6I+nLbeuBlmTmSLgeCuzDW6nJsRow7P5Nxjq
         4w7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTeknDql4sct2u+rNqf8cpYgsENiVYF9Dgw8ICqDVOxmhn8WVphJee7iFskNFQZp9DTGwO@lists.linux.dev
X-Gm-Message-State: AFq9FYJOHDPFIynEWBgQ3/65PrdX472KlL6WW6/uGwLRnSasqU0YPUmE
	q/uVk9MY7O82AP2KA7TuxYhrdI/KXl3VwcmXgWs+KEVPeBURwunJCDea
X-Gm-Gg: AYBFou1x7I9kY9cl2tSCnoKPFPWznRcj2w/1AtjB/Mt3InMFMkGTKnirwzeCg4GoO84
	rRpyDpi+zMcCkHMa2J4x0MPmzhecXxDfaN9a3KGRvemmjZrxQkK6BNb/etL3MilENT4WOgnT61v
	2pxEdo3CgppHeVDQ386lpcD3TUDH1xD4Yw+YealDopE5rh6zLKg+8QWT0orxKKCWcypUKQ2IRnY
	Ip9mEXshyi+qXwj2l5ewPdOp8y4VP0A7RWxkXySwhOgn/5eLU/bnEzvAxR1y2I76YQfeSCiz4kP
	puekTZi1lz5LAlrG26ok5PjNYCJ4tYEu+BqIRFMxt/2by7XF6PX7KCGIKri+kSVZC07NlYvwxeT
	XEaKacKWAxeaXAN6npYJFPnxrYqSCrgJisXP9f1ZJITTqQyNy/2Z/rexMVDqlDm6Dr+JcySibmF
	MvEjeEaUSe+4EKM67ZT/BQw1paEQ19dkttkhKYyI7GboUCulRJnXR4G6AfWhLLiRFpfknqctDuo
	5yOe9RskcgLwk8=
X-Received: by 2002:a17:90b:4a11:b0:3a8:13d6:f748 with SMTP id 98e67ed59e1d1-3a813d79022mr3578404a91.42.1791253463775;
        Mon, 05 Oct 2026 19:24:23 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853c88aa7sm2307119a91.5.2026.10.05.19.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 19:24:22 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2] ntfs: only require compressed size on first extent
Date: Tue,  6 Oct 2026 11:24:12 +0900
Message-ID: <20261006-test-port-ntfs-oot-ntfs-only-require-compressed-size-on-first-exten-v2-1-080315ae06d3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3750; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=6FvF9t/D18OR7fv5VlRJmEBIPVHaDADgkMnKxeXIxq0=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqxFuC2Z1CXlPH3ovQtUTm6ffVX0Rzp7kXqCGxW
 qP008D1x0KJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCasRbggAKCRA08jD6945I
 076zEACaapxSIQ3YzAfyOBl9yBYdtl32hwwovKIrSPxrolz0yZQOP2PAwPMnkBARaggxR1CBuWl
 kQWtqT+Xvu/Te4qSEkiGayHKWIQZMA8umDv+vUmQaVdUsR3T8Q28h/HNeaKT32DZuZUUHSPbGr5
 60AvhAy0O+F96iQxYOxljgkxEeU2ZI2k2aggtubAULeDGgWykra22RhUt4FGQef/WV/9PZLcEM6
 VDVwAIcYUW8bTIoKQX9M8447JpOlAepTbdB5dbHAg89nc50TQMYHhdVpO4W+tsizCv0+3Lmrthz
 0ZOys+8mxhm7kYSnAgR+fZWCg6+h0PayekmCsHFdieIe2ZlYraEABAnMs1nWTnMQdY1k53hDt9n
 DCPp8484s3czLAw6DVLNByAma34w5pJQE2KX93BN4LLOpHUJ9O7+TJNPzzGaJblbUZQPRziThDN
 Nvf3aQRK2wX6hm0cpCpza7X/S+LhiKmuMqpyOOhEiBGwByVfhClpsxWAgwnLXKCvJX4YPb5XTd1
 885ub71CfcvBGHnukrckMl/vBD76kP+cB6lp1XE155DKCejCzVYdEacgJCdBR51IXpBWrdYab1G
 5acPj4Yee0zFUs260TMCa4MWth+53x/+4sdwue8xGjcNHqbn8D5qMWkQLtwv7Ow/ANS2q5PJp8z 3HPr+Ksb5j9pPqw==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

The attribute validator required the compressed_size field for
every sparse or compressed extent. Continuation extents omit that field,
so their valid mapping_pairs_offset of 64 was rejected and compressed
reads failed.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
Changes in v2:
- Check lowest_vcn before reading compressed_size in both inode readers
  to prevent an out-of-bounds read.
---
 fs/ntfs/attrib.c |  8 ++++++--
 fs/ntfs/inode.c  | 18 +++++++++---------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 333b3371acb4..6114368ae1b5 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -700,8 +700,12 @@ static bool ntfs_non_resident_attr_value_is_valid(const struct attr_record *a)
 	min_len = offsetof(struct attr_record, data.non_resident.initialized_size) +
 		  sizeof(a->data.non_resident.initialized_size);
 
-	/* Sparse and compressed attributes have the extra compressed_size field */
-	if (a->flags & (ATTR_IS_SPARSE | ATTR_COMPRESSION_MASK))
+	/*
+	 * Only the first extent of sparse and compressed attributes has the
+	 * extra compressed_size field.
+	 */
+	if ((a->flags & (ATTR_IS_SPARSE | ATTR_COMPRESSION_MASK)) &&
+	    !a->data.non_resident.lowest_vcn)
 		min_len += sizeof(a->data.non_resident.compressed_size);
 
 	if (attr_len < min_len)
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 9583b2c6c7a2..83ee35685373 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1138,6 +1138,11 @@ static int ntfs_read_locked_inode(struct inode *vi)
 		}
 		if (a->non_resident) {
 			NInoSetNonResident(ni);
+			if (a->data.non_resident.lowest_vcn) {
+				ntfs_error(vi->i_sb,
+					   "First extent of $DATA attribute has non zero lowest_vcn.");
+				goto unm_err_out;
+			}
 			if (NInoCompressed(ni) || (NInoSparse(ni) && !NInoWofCompressed(ni))) {
 				if (NInoCompressed(ni) &&
 				    a->data.non_resident.compression_unit != 4) {
@@ -1179,11 +1184,6 @@ static int ntfs_read_locked_inode(struct inode *vi)
 				ni->itype.compressed.size = le64_to_cpu(
 						a->data.non_resident.compressed_size);
 			}
-			if (a->data.non_resident.lowest_vcn) {
-				ntfs_error(vi->i_sb,
-					"First extent of $DATA attribute has non zero lowest_vcn.");
-				goto unm_err_out;
-			}
 			vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 			ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 			ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
@@ -1407,6 +1407,10 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 		}
 	} else {
 		NInoSetNonResident(ni);
+		if (a->data.non_resident.lowest_vcn) {
+			ntfs_error(vi->i_sb, "First extent of attribute has non-zero lowest_vcn.");
+			goto unm_err_out;
+		}
 		/*
 		 * Ensure the attribute name is placed before the mapping pairs
 		 * array.
@@ -1442,10 +1446,6 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 			ni->itype.compressed.size = le64_to_cpu(
 					a->data.non_resident.compressed_size);
 		}
-		if (a->data.non_resident.lowest_vcn) {
-			ntfs_error(vi->i_sb, "First extent of attribute has non-zero lowest_vcn.");
-			goto unm_err_out;
-		}
 		vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 		ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 		ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);

---
base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
change-id: 20261001-test-port-ntfs-oot-ntfs-only-require-compressed-size-on-first-exten-e6391bbfbb2e

Best regards,
-- 
Thanks,
Hyunchul

