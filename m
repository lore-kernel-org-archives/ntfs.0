Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD3B43B6CE
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582531; cv=none; b=EevVOgT6lZnqAm+HQVK7jpGlM2WEZu2Bgu2qETiSOUn0nFi5h1F1U+o6eaJHn6DkfzM0zJXV9kabenGI1QfrFZFaT+VRlcKFCZcHnJJIKayIcvSDIGlnoxA/NvQlpa80NXg6Nz7/LstCGA52pBCQQ+NmhEY1x6qh483/15RLbIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582531; c=relaxed/simple;
	bh=5pUkOkLccK36XELXD3ceBO77sDrh/+6Ylu/iCl1SdJI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elIFd6bTuyrgD+tFYagSgipf1gube3F847erSOLyuZQKpRW5j6WxFtKyBq+jrZFvdGsQozYC8t5F35psuTOPmIhSR8HB668Iuv0SqHo3q15i4AA1Ujb7RW8CSBO+E6T0YTix6Gk5mfP7jPW+yLxlrVNgr94ujonjwpSicQe9t+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcU/7bL6; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcU/7bL6"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4364725a91.2
        for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787582528; x=1788187328; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DrGOfNzbzyg2Ng3Zf5oeNisggqc5WFaWkkGNciHOYrk=;
        b=PcU/7bL61iAij4R1XCeVNNvv8HCfI3gN+zCk4fW/NcMzF2ac7W3esqBWtv+/z3owx6
         X0SCOq5BgPAcjWl/FAhj5qbgBpmhOYFsEVLuJNxPC9dsomvCS5K9Es0xbgzo84uJuDA1
         H3dUonenbEloz4LHACTCVeXZLy/PiWbRMhGLzG7u96lria6j0Vc9R3OQEB10p9Jmrank
         znvlNrvUPzuw/99yF2Mt2AdQWGcPLzpkc7sQaIoiguk8uNLJAeZoHIwsbCJ8Sxr3dTh1
         P7Tkur5dHoj3GHvOgLpADJ3BZWi4+ulhOBfHBkKORlp950aZDRbLQc2oWQoYnhyg6s0a
         bJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582528; x=1788187328;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrGOfNzbzyg2Ng3Zf5oeNisggqc5WFaWkkGNciHOYrk=;
        b=sCrMToIwMcM0Ka3PrH9g0TDTMByVOHjiXLE3TslGcMuoXD8aPHhrEyKeXJiRBeSfwH
         fGOgouEbGtdxGzUuz/ogRtwRyisuklGnpeiGVttIn5lc5p3dMBWD5xTjFFisUxv3zAyF
         sw2ZCnKk2oDStsbjkqQNH6QM/BxXVBTU0MJejJIBUqL9Ag/0j7hc0nQ2fBilesXOogLs
         fOpPBO9Kcc6aW+N/5nYblGHMv2uKeK5gdNxaJfCtn5jBgvpTFaUlBK7Ck5gTV5ipXF2p
         +pyDAlaCjY7AuzLtcfpHa4AQDQeXGf8sjxXzVYwEnXQLB+dzG/JPwQ/kWbwwYl8iomS5
         3CTg==
X-Gm-Message-State: AFuF++lunytqxYhP6dhgrcvXL6L0GQ4d9saToy92WK+PXVOPYorgowAI
	N4m4/Py2PpAUE1n4SJkiI6KHGRdY/NNMadhnDnXs4jcqJaaaIHlYzldp
X-Gm-Gg: AR+sD10itL8q1lIHXWwYRqNpV9q1V/erWK5tNMg1LqHFE06MD68lcbR7tP9+LNLF1FC
	XZv8GknVz2WaM/4gG91w9M1Xo0VV2w/kGy5d5h8favCRAY/uXLM57WvPQDJe25gDUmOiv4PBieI
	CPqQeRFj/fsO2oiHBzg3RtWI3o2kYd6beN309P/EnBJpLsKhYJGok3RLCM3CzhT4B0NKrDarKax
	V3VQ6v63LFunan6Kg0bo09GAsSFSPK3+32Yy99PlKicvKAjmffLtIfK31YbA2Nff0Bq925vXXt0
	xtsltSr4Y2Y/qlF++dGjFqU2hxDxDGySqDoxs9oRTbiq2DK1P+g+3sBcW37aJpU8hpiYno+0T5e
	O1jxD+vln+kuXMfhWacsOcLdyt+iavxYE1cBu8A2KsRa3q02BC27wCy+j5spB2cxR2iqntu/oFE
	+wD6tntuM9W4T2dfqW/jH0SGHQ93dfnfrc1vT4PmgqqMQvSqkEV9UeufBLgBcpvk0xUArGXeYer
	kmVsYBEDBx2sZdey7XG7nCo90pgh4GLOG6SXIVxkbgKts281ZU03rit
X-Received: by 2002:a17:90b:28c5:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-395df11a0damr36710107a91.7.1787582528197;
        Mon, 24 Aug 2026 07:42:08 -0700 (PDT)
Received: from localhost (75-172-73-38.tukw.qwest.net. [75.172.73.38])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm39999434eec.16.2026.08.24.07.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:42:07 -0700 (PDT)
Message-ID: <6a8c583f.a4ccd6f3.2488d7.bd37@mx.google.com>
X-Google-Original-Message-ID: <aoxYOMhpMHpLym80@DESKTOP-HH660AU.>
Date: Mon, 24 Aug 2026 07:42:00 -0700
From: Dennis Tighe <dennis.tighe@gmail.com>
To: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ntfs: mount read-only when mft records are smaller than
 the device block
References: <CANFS6bb5BHY_XskcC2BoYQnB8iq0J0q90+r08xuANRoJNwHOeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANFS6bb5BHY_XskcC2BoYQnB8iq0J0q90+r08xuANRoJNwHOeQ@mail.gmail.com>

An mft record is written with a single bio of exactly mft_record_size
bytes. bio_unaligned() rejects a bio whose size is not a multiple of the
device's logical block size, so on a volume whose mft records are smaller
than that block no mft record can be written at all.

On 512n and 512e drives this is a non-issue, since both report a 512-byte
logical block and a 1k record is a clean multiple of it. On 4Kn drives the
mft record (1k) is smaller than the 4k logical block, so every mft write
fails. At the same time, other writes (like directory index entries) that 
are 4k will succeed leading references to unwritten mft records and a 
corruption situation.

Reads are unaffected, so mount read-only rather than refusing outright,
and refuse a later remount read-write for the same reason.

This is a stopgap. Writing these volumes needs read-modify-write at the
device's block size, which this does not implement.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Dennis Tighe <dennis.tighe@gmail.com>
---
Changes in v2:
  * Add the same check to ntfs_reconfigure(), so a later
    "mount -o remount,rw" is refused rather than silently re-enabling the
    writes. Thanks to Hyunchul Lee for catching this.

 fs/ntfs/super.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 30481e5d5dd4..5de07fab101c 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -304,6 +304,12 @@ static int ntfs_reconfigure(struct fs_context *fc)
 					le16_to_cpu(vol->vol_flags), es);
 			return -EROFS;
 		}
+		if (vol->mft_record_size < bdev_logical_block_size(sb->s_bdev)) {
+			ntfs_error(sb, "mft record size (%i) is below the device block size (%u)%s",
+					vol->mft_record_size,
+					bdev_logical_block_size(sb->s_bdev), es);
+			return -EROFS;
+		}
 		if (vol->logfile_ino && !ntfs_empty_logfile(vol->logfile_ino)) {
 			ntfs_error(sb, "Failed to empty journal LogFile%s",
 					es);
@@ -2298,6 +2304,22 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		ntfs_debug("Changed device block size to %i bytes (block size bits %i) to match volume sector size.",
 				blocksize, sb->s_blocksize_bits);
 	}
+
+	/*
+	 * If the device's logical block size is larger than the mft record (1k)
+	 * writes to it will currently fail. Reads are unaffected, so we can still
+	 * mount the volume as read-only.
+	 */
+	if (vol->mft_record_size < bdev_logical_block_size(sb->s_bdev)) {
+		if (!sb_rdonly(sb)) {
+			ntfs_error(sb,
+				   "mft record size (%i) is smaller than the device logical block size (%u).  Mft records cannot be written.  Mounting read-only.",
+				   vol->mft_record_size,
+				   bdev_logical_block_size(sb->s_bdev));
+			sb->s_flags |= SB_RDONLY;
+		}
+	}
+
 	/* Initialize the cluster and mft allocators. */
 	ntfs_setup_allocators(vol);
 	/* Setup remaining fields in the super block. */
-- 
2.43.0

