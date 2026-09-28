Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58BE459ACB
	for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580326; cv=none; b=t4h0pW0sWwA1PtXEGIiBHkF5QPsck6gdNPb+ex3+ejlKD+DdpDGy46XzWY7xc1RXFDn8Mv5xu5xBmtUDIo/vfHtKAYlfDvT8AZibxsFq8AegmZnZJb8CZjb0kckcN7N3jl3EgzrLSb3aWD5daWHtW3GQuUAsPcW5WV1eSN9ESUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580326; c=relaxed/simple;
	bh=w+ucCQBBxwqrw5cxZ2Qgf+RKtvkRszqRv3oF6oet1aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NTfARO+fqT/L+UrITi7BUkPuDwqT0XUibmzvuBsTlRiQ9S0SntQN+pLwmtiRLyGcgXoab5rBKGDD95kjqCCUxo6bjrkgViZba5iW9EIpQA+z5xKBo5Y5ckKhU4jEJWF2ID5jnvdWDR6CUX46EMyxOwrQcqFQKmYW20WHIyzdRLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWq6pcSB; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWq6pcSB"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so1493933a91.3
        for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790580324; x=1791185124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtrU3BdzOhlN6H0C3u1xoHAdKOKacRT4EqldSEc1nO0=;
        b=NWq6pcSBPCyfRrRGS8EfZztlpCAe8vXrKqpMdPLIzD0U5DAVwAUkmy5Abw4qYn26tN
         4JTAO5aBnGV7dS98cntSrQZLqnc81mS5ozgU4uBbvP8ZwD6EB2m6EE2/gEeBlQBlJWTQ
         JHHYTTlmYrcsMelvs0BzpTuHk7Z8rAkb7K+nhK4MFYH2yHcwgouZh8CMKRaSAxOjPCEQ
         n+TlLAojBMVfRqvsSgXETiId0sIP/VP+d2anNYNq9G2Ei7oE5X6IBUmQ2+VlX7/+REfO
         aOpkvadvVcadV2ilF2f95MZh8XSFBU8MnnaKp8bgu2TT6dYMD39cG+VzDPCAWwsv3k9c
         o5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790580324; x=1791185124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtrU3BdzOhlN6H0C3u1xoHAdKOKacRT4EqldSEc1nO0=;
        b=Nj/4lsIGzLTfa3GfqVe11srxDDi/aqHqTvDmDQfMaT1Vx94nFKRmvrEPJLSDE2fp28
         c0/GRwB6a8KhfKy1uAjM93fTf1uBTi+Oi882nMHEVcw+7gK8KYW+073frtdNv0v5DYyw
         EJeAQT87nz8gSuvqZmPd97Was+3t1hep2cGyLzYFtW8ZaY9GZqHSoR/OcpW2Twd2FGl6
         n1ule7J3xzX5yeCE33ZlVod9uXXbQxWPaUMmjoRSUA1NvwV7CXsKZ12HxQZo+A2d839e
         72MVBjhLVJNsZi0jEPWiCH9rPxKywe4qIvP84BFbxBmeXu5CxiIkvC35qO98yGGK4I2t
         JfnA==
X-Forwarded-Encrypted: i=1; AKwUvBxteXbnklFJxcEenoYA7Uf7gEyNXvz+J77J7KH695U/IgcF92lfMzoVsBFP9UjWBa6OK9Wh@lists.linux.dev
X-Gm-Message-State: AFq9FYJft144zigox3zkuymoJkIrPD9GzcyTqwygbk0YcolM/8VCVmXe
	TrERkiDfRToGthjnwYFZ5l9mnL4wT5d+cOtNnOmInsAXYFJZ6XCeJqt8
X-Gm-Gg: AYBFou1pRbrIkDGSUVMhrlk987wL0+X2YEsP9JzInX4la8MnDXXniwydVOfZBsrF8R5
	g6eIrFNN4RXWstAH02NfaPBHrdgcHRCNgQjxKTSB/A54KPSW4Jx1Fy+0zVaiFPZ1llaxhK5SQ+f
	vIUubn5eESIRfHlPWijtjAVikiRHyyYI0e3Q2ztpODUggPtrWl5wY8xh12efh45CwqD2ys0yhNM
	Rov5fzfBJKlzow+BC6qbDeUQdODmGk01bTyHh5gZ5PPbdbz9StU2iBDsegbwkeBk/py6BhsSpDe
	PPfWS9LdGlNTOvZv1Y5xNNgQUQTK4mBhHUEwn9KL+9tbTpaqps7HRpERXRsxlWbCUABg4iNCODK
	lr8Rzzm5aRZoeVYz73f7mNmLWuUOpJZ2ak/Fald468KYbmN7c6gEUZQay6zd9X8JAyf7bE7PhdR
	DpcEj5H5ZoayzHO3y0xX9X6EEdnFugeInnO2tDX8gfIXVEpcCBw6M3IOLDMTpqzcvOFeorUfIqW
	SAi3zwaG7fcwUo=
X-Received: by 2002:a17:90b:3b87:b0:39e:4c7f:7305 with SMTP id 98e67ed59e1d1-3a098b53e2amr10256529a91.28.1790580324043;
        Mon, 28 Sep 2026 00:25:24 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e0784510sm5187261a91.2.2026.09.28.00.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:25:22 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH] ntfs: accept standard sparse compression unit
Date: Mon, 28 Sep 2026 16:25:13 +0900
Message-ID: <20260928072513.1776685-1-hyc.lee@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Windows native sparse-file inspection shows that a non-resident $DATA
attribute can be marked sparse and record the standard compression unit
(4) even when the file is not compressed.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 9583b2c6c7a2..de848180749d 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1148,14 +1148,21 @@ static int ntfs_read_locked_inode(struct inode *vi)
 					goto unm_err_out;
 				}
 
+				/*
+				 * Windows stores the standard compression unit in
+				 * sparse attributes even when the data is not compressed.
+				 */
 				if (NInoSparse(ni) &&
 				    a->data.non_resident.compression_unit &&
 				    a->data.non_resident.compression_unit !=
-				     vol->sparse_compression_unit) {
+				     vol->sparse_compression_unit &&
+				    a->data.non_resident.compression_unit !=
+				     STANDARD_COMPRESSION_UNIT) {
 					ntfs_error(vi->i_sb,
-						   "Found non-standard compression unit (%u instead of 0 or %d).  Cannot handle this.",
+						   "Found non-standard compression unit (%u instead of 0, %d, or %d).  Cannot handle this.",
 						   a->data.non_resident.compression_unit,
-						   vol->sparse_compression_unit);
+						   vol->sparse_compression_unit,
+						   STANDARD_COMPRESSION_UNIT);
 					err = -EOPNOTSUPP;
 					goto unm_err_out;
 				}
-- 
2.43.0

