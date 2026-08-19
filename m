Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A003D6CD9
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787123998; cv=none; b=Pr/7MqbK/+3rnfYFDXGi58R6X22BHI4Ka/ZTwbTQubIJYRZlOyB8ZqR8h5cmqu3YNZXyd6ZAztS4ReCtzU4OTKL844iRed2gI16ekywKi6p6FQKsZqFaT7E+SG9IwrSDQM2oCQy5D7G+sDiYs3To7Om9ZUoitz+0lTifTnxcE64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787123998; c=relaxed/simple;
	bh=SewbY+Oo/Tw2nPKoLGNKhKQUEz+hTDmNyK4kBYHm99Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=feL9gMucVQzk4TwIaE8WTtklnhCaAewjgCSFWeSo7Te4OovGVu3KZhTvd7cQdShsl8eMqoQZD69UYUJ8L5/FxO4n1fAZCGqyVBfO/sn1pEXkaocfa9STHPzbeniHUvEhK/gADz8iganBkRkNZQn/T317UsUniwL+f7sJkwnDvzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgfPfdFO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgfPfdFO"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cee9b74ee1so4982685ad.3
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787123996; x=1787728796; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLTbrtg2Gwo+sdFIDsdeh+A0HG/11by1TkaHcpf2lKA=;
        b=AgfPfdFOz0eo9pZLqWLXq/If1o19hXpQyY2lxqQE60AlqzPvVcEqeSjyucMn7d+G8F
         xfhLsR1qwjc2fzWJJlrTf5QjJ/v122mx9Q30Lp2ucK+W8i90LkdfvAuIyBPB4BKSXAG+
         rez2kXDuDcA8//+drABpu56/G21lXegar2gXE30UgR/yCzhgAJp96G1BW6S3/vjY1f+a
         0rEzmIJcjHa3M9C4akOtVxXrVb6YlAD1TVR0gvOD/H0ZJbxMPdOpLAQviYRz/xOkE0kq
         NUvxSd6I7ajIunfSTKqlMcJcxXC5rKDJmrU/0t15oLhrq9iZAs5jSxx+ruw/Zs0/QYSQ
         m5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123996; x=1787728796;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLTbrtg2Gwo+sdFIDsdeh+A0HG/11by1TkaHcpf2lKA=;
        b=SMoGy4/JJ4+icBLl23X+G2U3G4XMexcHkTeRAfR6WKyLCKO/1SOPmOK7TiTDEgveGO
         k377dmHB8kZUb1F5OpQpEl7htxajf04svVKrpEGnH6jko8lRvdvqMAw4t257dnCUdgFV
         ftuugTeO89MJiKWsTHFSSWF/mdkFjzXWUmnfY7M9dG9i3olqOCVtffWPfAmMzFDW0gKw
         XMgA9nLm54nuoyXiOHRStfu5A/NVw7AtyrSW9mArL5Yax1/k3uSAloJ21k8EKaCwyBi9
         XoJ6joP+yMGrTMzUPx7FpoCZDwios5cLlBSG9ezLwPXgqAdl6i+neTUjS33PyAfXAf2q
         pN8Q==
X-Forwarded-Encrypted: i=1; AHgh+RoD1yH+f77GayTn1tYKoAcB5uvy4I9Rn6z24sQ4Qrhjxhk2t0PdZSWqtkOmb/ZrlPGaJiCj@lists.linux.dev
X-Gm-Message-State: AOJu0YyCIgydCx6JM0M7mKtliYuKV+KHNK6C08qjTgt3Br4N3VWk0KW7
	meLMUuD41hlhnbMKFyVx2jXKv8kSYcqTFI3zpqJmIpXhT7Q+N4cHY7/5
X-Gm-Gg: AR+sD12G41xoI/VV9MzCrGyKm6m+MxDu+yojgzr/FSUgBZ0wdLkL4xhJttAVFWZ3sIX
	9RElCefW8sNsFZP6TNjbOsceoQll2OieA2o/eJ9Gt+wPPdXsavLro5UUDF0yG4C0DjlGTl4LI7F
	F/gHQRCH0ML9qNmxaRoVKt4PoT8enpVG/ijwMH04b7qMnIT028qFPXsu5yaoTrR4pKMI0aHeyyE
	EWsql74ejdwGhxCn4XGS6AM8W/gMGUlpGfSU5J2YSg7DgET/NK74Audjhs2XloEWhI3IBCRAHko
	ozUJOgQ/bV8OnsbSoF47Z/WcLInWg5iRSOKKv204sWx2X/XOfk7mcRWFeTGzf/Kve3ghHU6EFnn
	d0Rur0Ctl77kGdhwez1mSVEjSmO3m1gD2UVwhHZMa/5xc2pDYtdPSDMszNfP1yGM4tjwEqa76L/
	tLO6pNrd7rBdHbMnVvea3pBk0r+rYkPS9Ke+cee0f1YvLSo0BUL9sAXUusKHj0oWTqF5tcPLqTn
	Dxigg==
X-Received: by 2002:a17:902:d48a:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2d5fd6fbe8bmr34571825ad.14.1787123996366;
        Wed, 19 Aug 2026 00:19:56 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ee476bsm20833395ad.75.2026.08.19.00.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:19:55 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	rtm@csail.mit.edu,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] ntfs: reject invalid MFT LCNs from boot sector
Date: Wed, 19 Aug 2026 16:19:00 +0900
Message-ID: <20260819-fix-negative-mft-lcn-v2-1-ed9e0d3ee814@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=a/O7jXZsnKbYL+CQh6l8K7m0G+bcoLnwdGb5IlUygRc=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhVecI4OSeGQI550f3CZhUIYaHNz3olNenYUUr
 VLEGbkB8a+JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoVXnAAKCRA08jD6945I
 09aND/9h2U+J3fZjkkKq6O0suhCRLvf4IUnRqUMfl+CaDiSlOrqtj9YMdRZf2d3gzqhOYX3/sRM
 cnX/I9TFlaXrgYD/sM6zQjTr4c2SWRHOzfFmQ55tf3NVx1ncIsg3Py8vBYIqX2AMKtmP9/mKn/k
 SdIG4Fw7/YrFZS2PqsdIDYAmU5tYv/eHG0dYOqKR5urfwUOkcKWRTn17mYbzZh1/oh2dy8eX8Xn
 r8IWgOxYF8yXWD/z+X7lbmf3hngkZJW1Z16JoYssZkzz8qReQiJ7ES+UUKXZJ7hQh+1iCXplBV/
 S5zW8xXlDQ7LGaIymGc13aevBmlFdwBCQlm9dN+pLSVS7XH9xBmGSqHuOFgBqhDfgdwdXiHja7i
 ITg0VGzphLAU4SqNRXU7ycd7lAiEAiygg+MGQMKb/xEoRdHVjjj5hvgTnDmWgVZ7XDuKEUdgHkX
 QQyVeYcjB/mqV54dyIYlvvy/nVo8lhfANt0B1trpKbdwlTTs0m7m01NefDuVIbsZ7hQBGnbPABN
 6D3qng8gX/wyCdibJyr5r37d4CaC2volvt0X7ClQ6rKHIeDocHZTIjYSBLgkDrNCznSoYzBaNq+
 Hk5+0o5uadkpE+2wRBpcj3wJoDskIAE8FK4kk7tbS079QnXHQxT/sXiVZRNYMUHx9iRELyNNsuT
 hPs0czHiT3jCXfw==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp;
 fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: quoted-printable

The NTFS boot sector stores the MFT and MFTMirr locations as unsigned=0D
64-bit LCNs, but parse_ntfs_boot_sector() decoded them into an s64.=0D
A crafted high-bit value could therefore become negative and pass=0D
the existing upper-bound check. The invalid value then propagated into=0D
the MFT zone allocator and could result in an out-of-bounds access to=0D
lcn_empty_bits_per_page.=0D
=0D
Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")=
=0D
Reported-by: Robert Morris <rtm@csail.mit.edu>=0D
Closes: https://lore.kernel.org/all/57514.1787000602@localhost=0D
Cc: stable@vger.kernel.org=0D
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>=0D
---=0D
Changes in v2:=0D
  * Change the pr_error format from "%lli" to "llu".=0D
  * Add Reported-by tag.=0D
=0D
 fs/ntfs/super.c | 12 ++++++------=0D
 1 file changed, 6 insertions(+), 6 deletions(-)=0D
=0D
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c=0D
index 8abe7bee4c0d..cd8fa2c13370 100644=0D
--- a/fs/ntfs/super.c=0D
+++ b/fs/ntfs/super.c=0D
@@ -645,7 +645,7 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *=
vol,=0D
 {=0D
 	unsigned int sectors_per_cluster, sectors_per_cluster_bits, nr_hidden_sec=
ts;=0D
 	int clusters_per_mft_record, clusters_per_index_record;=0D
-	s64 ll;=0D
+	u64 ll;=0D
 =0D
 	vol->sector_size =3D le16_to_cpu(b->bpb.bytes_per_sector);=0D
 	vol->sector_size_bits =3D ffs(vol->sector_size) - 1;=0D
@@ -755,23 +755,23 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume=
 *vol,=0D
 	 * the same as it is much faster on 32-bit CPUs.=0D
 	 */=0D
 	ll =3D le64_to_cpu(b->number_of_sectors) >> sectors_per_cluster_bits;=0D
-	if ((u64)ll >=3D 1ULL << 32) {=0D
+	if (ll >=3D 1ULL << 32) {=0D
 		ntfs_error(vol->sb, "Cannot handle 64-bit clusters.");=0D
 		return false;=0D
 	}=0D
 	vol->nr_clusters =3D ll;=0D
 	ntfs_debug("vol->nr_clusters =3D 0x%llx", vol->nr_clusters);=0D
 	ll =3D le64_to_cpu(b->mft_lcn);=0D
-	if (ll >=3D vol->nr_clusters) {=0D
-		ntfs_error(vol->sb, "MFT LCN (%lli, 0x%llx) is beyond end of volume.  We=
ird.",=0D
+	if (ll >=3D (u64)vol->nr_clusters) {=0D
+		ntfs_error(vol->sb, "MFT LCN (%llu, 0x%llx) is beyond end of volume.  We=
ird.",=0D
 				ll, ll);=0D
 		return false;=0D
 	}=0D
 	vol->mft_lcn =3D ll;=0D
 	ntfs_debug("vol->mft_lcn =3D 0x%llx", vol->mft_lcn);=0D
 	ll =3D le64_to_cpu(b->mftmirr_lcn);=0D
-	if (ll >=3D vol->nr_clusters) {=0D
-		ntfs_error(vol->sb, "MFTMirr LCN (%lli, 0x%llx) is beyond end of volume.=
  Weird.",=0D
+	if (ll >=3D (u64)vol->nr_clusters) {=0D
+		ntfs_error(vol->sb, "MFTMirr LCN (%llu, 0x%llx) is beyond end of volume.=
  Weird.",=0D
 				ll, ll);=0D
 		return false;=0D
 	}=0D
=0D
---=0D
base-commit: df7dce2090342170b7643d36f694204cae7792a9=0D
change-id: 20260818-fix-negative-mft-lcn-596257dd23c8=0D
=0D
Best regards,=0D
-- =0D
Thanks,=0D
Hyunchul=0D
=0D
