Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23B73812F6
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 05:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485727; cv=none; b=tfRsl25x7QUG3zkUl7ye+duC3fBvZtJq1imcjZ0KFexweQqinXi4W2zuhJv99ckfQ2wyDsI5acaz8Nil1WUKjS384w0LO4FpAF3kTtDmJ2Fkwvyddh32TlEEjonBoKOvQ1RVVaiMvJe8IUNU9iOlLf05ZFbllLh/2aQmnd7e99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485727; c=relaxed/simple;
	bh=REDfLQtZzmmDwuBX160AEjAwtc+N7agMbuNUHFz+Kow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKckFCnMtg1693oWOfsnbBQGDVjEOKO2N7mrLFwP0FYE+w0upWzrOLh3GggCeUSi91TIrIUdgDb5TbjlmSQRF7t58yMrgD04Mxvr0bp3DRBI01ZWrvPGKskDoon6dpJOR68lE/8dtjISPO9DjKim+jhxanhi5ntzoONqWYv9vtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WC1fIIE4; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WC1fIIE4"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06a25so8725445ad.2
        for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 22:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485722; x=1791090522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTByub4JfOdnK292ZVlOp8TwRfOmHJ36Ys8FX7Mo1vY=;
        b=WC1fIIE4KuGVNR186Unjx+ha+bf5n8kTsBJOFNXOa+0PD5tWkZQgfGBiW77RA7pGKU
         fnfDnpFLU3uXk75wHNyfnraQ18hq3YbKCpAhilNU6uI7gY5KOc0kTZjGH437IqYbBNWD
         BZCfZ7vsHEj4mrwr6LY+qFBwta2AJzqYWPNkK7GeT0jnlkt1UhcYF6yvViOTOdydPF/a
         w42iZc/tB/l/KISmOgqOSViD9vndFv6FAm1oSbaJY+X0yDYitEYfM0MVq7TPQbfYPOdW
         e7Uv7Ys84915aDnKgzIkKImwIOCyRHgwL0WfMC2BJSeTy6cACidKqBF1V7aJU86DsavQ
         FWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485722; x=1791090522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTByub4JfOdnK292ZVlOp8TwRfOmHJ36Ys8FX7Mo1vY=;
        b=CZHnXIccvK8rkzEl7bDfhXCjlisjFd15oYYDZBU9IHI+hXxSmRTAwsKUrExm42iVsP
         raA7HSlufJoOX5HV67HCL0Y0g8FmsTUNG85aO+JIt6XYuNBGTwVxahJGOnlqkcIuMe5V
         m+3fV6ocD14MXa2Pnv/uRZMaFwdey4CB2ylvpFWlSrfd0h05KLaC6zsaTst9M26Tz5I5
         CtN6Y3Pa7DTGPOefFwyMuSQXwurjtI7FKm61blsXqROBUoJN2gKPcmgc8IgklwzLmAk1
         /KUrMpzsTDwmiJ3MXgxF3n9ibAo/2pXQeHD7L01kEPc5jwiskVpx8beC9MHR4KfY2FJ1
         IeSQ==
X-Gm-Message-State: AFq9FYKY6aa1MCrL1UrK8EQrLju4K9o02uds3F7wS5S1YXbRkynf6n0e
	d2jGk25tN/eYKHKEvNfGAWmzcm6rvteRu705jr9qFq5DIx6EK0EVFrKnfFrcbO6d/3n9tw==
X-Gm-Gg: AYBFou2hu9qPvNqgYUTJHOMwfYokS8tz2TZW/+qUCRnNWDAkz70YjYjz4Hz8OcFLYGv
	Q+JQgonJVhfeBg4KTge1tyKP0lC6Tg4qidbFwNpvdx13sjpX1zPHINsc1+PjWXs/X/MQ2z4sXzC
	HcnX4Yueo//bn0U1PBswkYw5QenYpj5+mtLOcWpkbK9qq5s/7DQa2JwBjqJBUy5fB5SC33/nHgq
	ux3rZVIpJhONiSPOzDPubCM7AvZamncXLHWb/epC0FO4cU5h+bZLJZ69EtnJd5NzX48z6oIIm3J
	+NcVIBbaeUoaA8DQZrMecJLF4+6iZ5i927PiNvkVqaXb7glz1aPDfe/s9IMCzoZfzbCNc6068vJ
	yHeN7cwXN2BrjWyVFyYI4At6ywj4lwaf1rqBd+Pgy5XwPIq40+AkH07U1lJDURKN7p+uwnxhTi7
	ymEbnoRNH937i46n+Z8uGPELxTPxo6Cn/n29ih8eXrI+glw/TXvo8om1NZVRJWEWh5Z6SgGh/kw
	MhgX8GQ6ije80ZMH92T+5PKPqJJwiJbKMfylKmXJOHtp5vxxoUBgjLup0tLrWpKLPzL77StqFUX
	Qmew2ho/bGU0w9uJpj47A6dgv21hiitL1XfZFBPHV2wU6nLDP6mfjr/RqMpAvK+S5m3JNw==
X-Received: by 2002:a17:903:90f:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2df7e39b86cmr85106485ad.26.1790485722012;
        Sat, 26 Sep 2026 22:08:42 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:41 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] ntfs: reject non-resident attributes whose sizes exceed their allocation
Date: Sun, 27 Sep 2026 13:08:25 +0800
Message-ID: <20260927050831.2739166-6-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790417653.git.matthias.goergens@gmail.com>
References: <arMoap0ZgeORuktT@hyunchul-PC02> <cover.1790417653.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_read_locked_inode(), ntfs_read_locked_attr_inode() and
ntfs_read_locked_index_inode() take a non-resident attribute's data_size
and initialized_size from disk without checking them against its
allocated_size.  The runlist ends at allocated_size and the read path
maps what lies beyond it as a hole, so a data_size larger than the
allocation makes reads return zeros that are not on disk, with no error.

On a crafted volume with 4 KiB clusters where a 6144000-byte file claims
a data_size and initialized_size 64 KiB beyond its allocation, reading
the file returns 16 clusters of such zeros.  A sparse file behaves the
same.  A compressed file instead fails with -EIO after a burst of "Still
have pages left!" errors from ntfs_read_compressed_block().

Require 0 <= initialized_size <= data_size <= allocated_size, with
allocated_size a multiple of the cluster size, when the inode is read,
as fs/ntfs3 does in mi_enum_attr(), and fail with -EIO otherwise, which
marks the inode bad and the volume as having errors.  initialized_size
above data_size is rejected too because an extending write zeroes the
gap it opens only from initialized_size onwards.  An unaligned
allocated_size ends inside a cluster that the read path treats as past
the end: a crafted 66440-byte file with 4 KiB clusters reads its last
904 bytes as zeros.

Sparse and compressed attributes need no exception.  Every non-resident
attribute has a cluster-aligned allocated_size >= data_size, holes
included, on eight public test volumes (seven written by Windows, with
LZNT1-compressed files, a sparse $UsnJrnl:$J and a OneDrive placeholder
whose unnamed $DATA is one hole, and one by mkntfs), on a volume written
by ntfs-3g and on one written by this driver, and the patched driver
reads every file on them as before.  fs/ntfs3 has enforced the same
checks since v6.6, also without exceptions.  The layout.h comment saying
that data_size can exceed allocated_size for compressed and sparse
attributes is corrected.

This also covers a non-resident attribute list, which
load_attribute_list() reads through ntfs_attr_iget(), and $MFT, whose
inode goes through ntfs_read_locked_inode() after the previous patch's
check.  The check was already missing in the classic driver; the Fixes
tag names the commit that brought that code back.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/inode.c  | 38 ++++++++++++++++++++++++++++++++++++++
 fs/ntfs/layout.h | 13 ++++++++-----
 2 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 9c97fc3f9e5ff..126c50b5a349e 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -651,6 +651,38 @@ void ntfs_set_vfs_operations(struct inode *inode, mode_t mode, dev_t dev)
 	}
 }
 
+/*
+ * The clusters of a non-resident attribute end at its allocated size.  Past
+ * that there is nothing on disk to read, and past the initialized size reads
+ * return zeros and writes zero the gap they open, so the sizes must satisfy
+ * 0 <= initialized_size <= data_size <= allocated_size, with allocated_size
+ * a multiple of the cluster size.
+ *
+ * Sparse and compressed attributes get no exception.  Windows, ntfs-3g and
+ * this driver all count holes in allocated_size (the clusters actually in use
+ * are in compressed_size), including for streams that are entirely a hole,
+ * and fs/ntfs3 has applied the same check to every non-resident attribute in
+ * mi_enum_attr() since v6.6.
+ */
+static bool ntfs_non_resident_sizes_inconsistent(struct inode *vi,
+						 const struct attr_record *a)
+{
+	s64 allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
+	s64 data_size = le64_to_cpu(a->data.non_resident.data_size);
+	s64 initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
+
+	if (initialized_size >= 0 && initialized_size <= data_size &&
+	    data_size <= allocated_size &&
+	    !ntfs_bytes_to_cluster_off(NTFS_I(vi)->vol, allocated_size))
+		return false;
+
+	ntfs_error(vi->i_sb,
+		   "Attribute 0x%x of inode 0x%llx is corrupt (initialized size %lld, data size %lld, allocated size %lld).",
+		   le32_to_cpu(a->type), NTFS_I(vi)->mft_no, initialized_size,
+		   data_size, allocated_size);
+	return true;
+}
+
 /*
  * ntfs_read_locked_inode - read an inode from its device
  * @vi:		inode to read
@@ -1184,6 +1216,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
 					"First extent of $DATA attribute has non zero lowest_vcn.");
 				goto unm_err_out;
 			}
+			if (ntfs_non_resident_sizes_inconsistent(vi, a))
+				goto unm_err_out;
 			vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 			ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 			ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
@@ -1446,6 +1480,8 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 			ntfs_error(vi->i_sb, "First extent of attribute has non-zero lowest_vcn.");
 			goto unm_err_out;
 		}
+		if (ntfs_non_resident_sizes_inconsistent(vi, a))
+			goto unm_err_out;
 		vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 		ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 		ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
@@ -1675,6 +1711,8 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 			"First extent of $INDEX_ALLOCATION attribute has non zero lowest_vcn.");
 		goto unm_err_out;
 	}
+	if (ntfs_non_resident_sizes_inconsistent(vi, a))
+		goto unm_err_out;
 	vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
 	ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 	ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
diff --git a/fs/ntfs/layout.h b/fs/ntfs/layout.h
index 8f5792139d719..2de83d4ca40b9 100644
--- a/fs/ntfs/layout.h
+++ b/fs/ntfs/layout.h
@@ -811,14 +811,17 @@ enum {
  *                                  on XP SP2+.
  * @data.non_resident.reserved:     5 bytes for 8-byte alignment.
  * @data.non_resident.allocated_size:
- *                                  Allocated disk space in bytes.
- *                                  For compressed: logical allocated size.
+ *                                  Allocated size in bytes, a multiple of
+ *                                  the cluster size.  For compressed and
+ *                                  sparse attributes holes count as
+ *                                  allocated; the clusters actually in use
+ *                                  are in compressed_size.
  * @data.non_resident.data_size:    Logical attribute value size in bytes.
- *                                  Can be larger than allocated_size if
- *                                  compressed/sparse.
+ *                                  Never larger than allocated_size, also
+ *                                  when compressed/sparse.
  * @data.non_resident.initialized_size:
  *                                  Initialized portion size in bytes.
- *                                  Usually equals data_size.
+ *                                  Usually equals data_size, never larger.
  * @data.non_resident.compressed_size:
  *                                  Compressed on-disk size in bytes.
  *                                  Only present when compressed or sparse.
-- 
2.55.0

