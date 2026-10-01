Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7680E1A3160
	for <ntfs@lists.linux.dev>; Thu,  1 Oct 2026 01:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818256; cv=none; b=YUvvnbK/GRDSfdMW73cc4nwX9ZdMVJNuBAQQTTXGunM3VGsGiZfw9hxrUUOrZytHtdcwBuNxBjPPpTkoI/B5Zf58iZLb2+y4cdDzZj+4EJQI8pwOa8vpunREG66O8DmTTN1ZHpdWnAGOZgizvS6CXYA4+hifyx2a7kRm+f3lqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818256; c=relaxed/simple;
	bh=Vr4sD5gaVvIrwjNSmCbSMSDcqujXYvfNHZksLnesr9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sUIeXsH8icJLlkiQvg09+PJCD4JfHypSesSd0zn4aFRtj+l5qk+7OJy/jh0OsJuvl5lG3AGW906u4a7KKPtGgsu/9ci0CMCNMrmpIVhfxc/0QLiqQDznGHUr1VakGeq21lPM/sqnbclPYp95eaeO1NX8lfXo0bGH4vBk2HDjScM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiT/T/wO; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiT/T/wO"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2e688de2eso10053535ad.3
        for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 18:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790818250; x=1791423050; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbkEHAOXrrNr8qInc/nHsawXJy66lW4VufrCb59C0JM=;
        b=BiT/T/wO+Uxo4FMDILXIyJjIcdchtmzz40/FGuEqOt2HEJ4zKf05gsLtQ6ASVRnq/K
         +QonazGzGOAUgcCftA7pvoDvMBzGQqxPG5hSHzeVrzQq6Z79BVnnM4mw8nOxc6gCIc+O
         3VBclhlDuQ3XYCndfaqASNyhFmVFy53UVNmzmM4k2nyk//Izy3rxV5epQhCQtRqMe8v9
         2k1VrTUS1j249yzbuBGcX6pdthmYVPcROSWK6l+PLQOgFfhs/YIpXVVuj1DJrVimVAH7
         3nqf21Oqyveg2eAFEpx2FxdM/BLdaWEDeIaTJI4YNetEu75eHbj3aJ2gF7YKZV3lG0cD
         EYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790818250; x=1791423050;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mbkEHAOXrrNr8qInc/nHsawXJy66lW4VufrCb59C0JM=;
        b=rD1+kYUkEAFZnrUlPs2AjmrpY0zAtU7deTouYY4jYlAAEAZTmMgRmS3EZzXmD6JyIH
         RNQEXFfjn01P8ZwVYqzseB+ntjsCShRYB54NY8tVmRwYK5LaG9bAFoKozT2KjQ2AqLnN
         tBjnBB89G6OLgtpNQoxWuThiazVa2RvGnw4ZpoFVrJESDOVUbJCqxGpZGikOv3lXtnT4
         4G/qiPLrZdohhKNG39ZKckMvFeD6ni0QsdY75SOtrYu4owZvDsa10e4kz75QJozVaCGS
         CU/04hGQa7Uaw0mvkCkpfmjzW/EE2u3Iy0LyePSlFr57o3YZg/hU9F+rO1MV+gHu49PV
         N91A==
X-Forwarded-Encrypted: i=1; AKwUvBz1MoB+KLQpnIpN53Kcp8yF9mCugJfqoJpfuscNSEd3IxNKfcrBr+CJMk3zKZzhTtXFoWRH@lists.linux.dev
X-Gm-Message-State: AFq9FYIpjjY25ha/EBKs7b+KenYGShY9x+Q0R8sOVv1YgkE/lTVUGFxv
	ckB1bVW4fX/pBzf8rbxf4luXiz5aqsifNkZMhH7JpADwwUQ3+Scsd9zO
X-Gm-Gg: AYBFou2fhaFt7m/WTICWFIamAv1MlbhJGRyrb3TN0C50Kg5s1fOdrBOAk/CCd0cYaEb
	Bst+65JlDkCDSOxFj4jNmdx4u3Ez5Olp+7XskdcsQLcqQReIl8k7f6IcyLjIcLGOT/T/2aKXw3A
	Y8t8VMW6XBdmogmh7HXjn79oU/5M/JJRl5uRAEueJ9/DNVgkAfM9nAb192xnR0FxxB4tbM3x76i
	ICwTfNCV1ZguyNQYiEn9yI9SSWyzH5n/AF5SsLK3NKyppWnQiDFdZH7/5Tx43XmroOyUeEn/DC9
	KjeVlL9GOKBKODKexkgIpfOSZc/0l2DE1UVhVjjdY93H/tTITmN6krEcTOjyOw4CXGU8sUez7gV
	t8q9ESixWRC8qwOFZ9oWHeM6jDgZFvancXYfyK4NFzAUbDePAlUr+DTG1Lq3jwBgUxTq07XcAA+
	jItQierqQDMuuX/PPYoEgW41VVwUKIgS8oPcCQxUP6KSHGOdAXYO/xvNjkY8ENlGci/K552prmF
	aTE
X-Received: by 2002:a17:903:32c3:b0:2dd:c100:312e with SMTP id d9443c01a7336-2e2e4b6bff1mr23186575ad.42.1790818250210;
        Wed, 30 Sep 2026 18:30:50 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b8ff4bsm3607775ad.81.2026.09.30.18.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:30:49 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	Alexandro Calo <alexandro.calo@nozominetworks.com>,
	stable@vger.kernel.org
Subject: [PATCH] ntfs: only require compressed size on first extent
Date: Thu,  1 Oct 2026 10:30:31 +0900
Message-ID: <20261001-port-ntfs-only-requi-v1-1-b6504122a1a5@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=Vr4sD5gaVvIrwjNSmCbSMSDcqujXYvfNHZksLnesr9w=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqvbeL8oqgf496tPWERamFesVXH9RX3wgd0mKKk
 ej+QP9wEkaJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCar23iwAKCRA08jD6945I
 0/i0EACBNenvAr2jBOskdaN6DfbPGTzeZW2ZMHWcCouYuJlNUIKegfQWE6VTsghHNpw9xC2yYnN
 OF/HvXoEHg8mOO5FQdFkfnE8QeVeKyrnT8CP/mcp9+nRWfklJrpsnTjQdtW3xF6HSfunDDogdDW
 ljNkP4op1/5qB6UzDMwlchx+Qqkyu9kwYI2je6Gc5T9zGZubgP5y6wBl3+t9pQdqplj+YLbmrEw
 dEa8yxd34j0ul1z3AMFcM42bqT6afRYJBz5z2mvP9jHEKqtOUFjgQW7U92gmjkgKwWeQFWEaUGA
 /zzIoOXg/OSNuqhf+h4L9Jt1u7JAxyuNIW7NgMQNtN5ZQHvJt9hWShTp90/Y4QXKgtgndyLH+Gw
 8G+bxZdIYws+e+7s8QXW8gTfsVPOIJ/0QXFGtclpreBI58s67wNmw6T5srYpf8eKrn1DsixlfNh
 X/PYtCZJR/5gnQZzDc6w1a2uM3/32mRikDrgqkXDudezC/EXfGUgf2aaJURju/iU198wndthR8s
 rGBdRv0dS8P79THnOOQk+edtelknQrBRbXc0DFJptEGeNjIObFcR8cYIND8qzNCwzD98r2//rK9
 ps2ssGc7D2Y2lgSONSid2Bo5ZFvFCBSjqjqlLbrpqdqYVVD3QQ6RRLP/4sIr6rNRFTqUxsKB/Pd bE0mpRJqMOR52BQ==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

The attribute validator required the compressed_size field for
every sparse or compressed extent. Continuation extents omit that field,
so their valid mapping_pairs_offset of 64 was rejected and compressed
reads failed.

Fixes: ffc755828de1 ("ntfs: Fix min_len for compressed/sparse attributes in ntfs_non_resident_attr_value_is_valid()")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/attrib.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

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

---
base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
change-id: 20261001-port-ntfs-only-requi-a2d6f88542ad

Best regards,
-- 
Thanks,
Hyunchul

