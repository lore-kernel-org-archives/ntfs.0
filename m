Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB342F3C18
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 01:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789955008; cv=none; b=iHPIb1vpW2mCd7k3s5JA90Gk+9QSCu+dOrHtho1OPZJUYX4BZrnZgGo4HuP6pvfENWDUI5LUykgbqS2MZ2k7xWeT0J1Wehuy49UJSeEw8X2vT4WbXO5MJlSc3dmkIBY4VKaviqv5UMhJNinzp6Dlb1TnyF4R+Ms56X43B/Jvik8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789955008; c=relaxed/simple;
	bh=l0syW4wWkx47n85Un2x5YlOtdrIf9qBhckCjzu2+nOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NbrL7dmOtbu600cui9gINgVJ64OL+rC8ybmMnYcgUZSG9klnNvn7ZvuhHGd2h0td6GxyWwRANGWadsg0tdu6yMJfMlGImRUfrD7WQKbyiPUCCiNYm5uqBds59/l0FZ7OEA0DMxxPEBcqPHGzP9IbtVE473U9ioSxvLQx5pPKi5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocpKmruI; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocpKmruI"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a3490bso2605449b3a.3
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 18:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789955005; x=1790559805; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9pn/4Xw+v0qUIiO9G5hzdTP30+s8pum6BDFqqqYl/GE=;
        b=ocpKmruIxZ2hZv7oHGx/EEh4ZacmkRhflVqa16XNp09OfCgBWXc2jtVxi1elX76pQ6
         5MnYWpcLJ2pBO/5r3t7mkGPmiAn0Q02HV0GsMODDf96RoZ42Qiy8L/p9R1zUrqLRnGwT
         9yH4AIyr0BqT1fxwOtpfJ6P/SYILyjzI1O5Rx/LCDbNm3FzRDR3ADqhDihY4StzsHZXv
         NmDD9M0wdxdNC1gDyZcRMEy3+mN1vqbpcJGbEx9sPIDsvHMCz/CNRl6+EMOgysKE27NA
         TcEkHqVdlLred/BnAj7u+VnNHutVDhY02rJXuzp0LEu9o+KVaD12w+oe3IqBV9OkMWCL
         yA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789955005; x=1790559805;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9pn/4Xw+v0qUIiO9G5hzdTP30+s8pum6BDFqqqYl/GE=;
        b=r6o/FHGYsaz+FrLo1PAtvjhzqAYu5GUcL/ot7JjXAqP2t40ymhCuVLQLCi3UlTSf7k
         6u9fc8PD/KKZIcPiAS9wxLTxEa8/o7PgPsRcCIDd9OAYat95JiUpCfXisGPMqtL5fFGt
         CP4Fvp6JST36DjQHzpH6xkD3dZM7Bz7tXi8V/whWimRfR50rnd9KBGcGodLM5iPrVTdZ
         8y+pkohPiQhxCpHE2va2mruIknGIsvf7GZtdFH7tSmiomTT22ChtoEADs9bHzk8KbdJI
         7q3Q1yFj4zcqO6vbyWqa3L5vgKe1OKnr/XALjc2uZcfr+p9ATQCDtS7RenU5eetq5oMk
         I2OQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/Kv4Ihi4ZQ3P4ziUWuzxjwbM95Ht0GZSMDXAF+MyV0GJCy4q2aQmoauxR3HZYvspJABE4@lists.linux.dev
X-Gm-Message-State: AFuF++mMkYj3jmkZ63vSDD+UA0xFkIo4dZA+q6T1MOkACT/X3rATqlW1
	eIZyt5zHX0yoNlo1UInbM0OcoZBDpzo9EE5LqvtbBp3llx8y+C9McePw
X-Gm-Gg: AYBFou0kQVdovZInrWvchOgjbFNFQGCPedmGxh/NR/lua0cSbO/yom8X75/mmEfg4PV
	7lkUXjxI5X25kCBu+KdkR34PnxcWung/DFWYRTls/xVwQFZlcQK+0//EKitCIMBwbIeW8p0FtyI
	yl8mnRAMABRxKoAj5uCLz2xW4/Bp7uQ7I0zXKMyCa+OMR+wua+Fx64XM/pFRzh4Aa4M9JAm4aoI
	hKEDwRHN+BPRLHHf+7eeJs/VSNEBWFEnbnJ8t4w+queY5HHO6iOzou8iGpQkoQyp0I9O0/rTVkR
	gNgZxc1dl8QrYuKMcw1s7BdJYrPNzNg9O51PTLRwx5Efr2oYbdeLBzVzz3oY+MVRkoQcE37ZVZ9
	M9qvHmZjeS19HGxdAAguvaUsaGprKBl8L2OLg2E2JQBH7nTKdgTipiceHCvXzu7+lSRG7EW5ELQ
	OoIWnTCosUsJ59jw7QLxAS/3uF0d5f7jZFn7BTZRiwrXe7jWFEAQIQPwcITbDjThX5dyfYuSnHB
	u+UNGPcVQaihC0/OcqdMqk=
X-Received: by 2002:a05:6a20:cd95:b0:3dd:a196:69e7 with SMTP id adf61e73a8af0-3dda1967885mr8793861637.66.1789955005399;
        Sun, 20 Sep 2026 18:43:25 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aed5c05sm2581292a12.22.2026.09.20.18.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:43:24 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	=?UTF-8?q?Marek=20Weso=C5=82owski?= <marek@wesolowski.eu.org>
Subject: [PATCH] ntfs: require page-aligned full-page attribute writes
Date: Mon, 21 Sep 2026 10:42:57 +0900
Message-ID: <20260921014257.2790279-1-hyc.lee@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

__ntfs_inode_non_resident_attr_pwrite() treats count == PAGE_SIZE as
proof that the request covers the complete folio. it allocates the folio
without reading it and copies at offset zero. That proof is valid only
when pos is page aligned.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Marek Wesołowski <marek@wesolowski.eu.org>
---
 fs/ntfs/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index d5e526d3612a..0391e4945e1c 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3720,7 +3720,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 
 	index = pos >> PAGE_SHIFT;
 	while (count) {
-		if (count == PAGE_SIZE) {
+		if (count == PAGE_SIZE && !offset_in_page(pos)) {
 			folio = __filemap_get_folio(vi->i_mapping, index,
 					FGP_CREAT | FGP_LOCK,
 					mapping_gfp_mask(mapping));
@@ -3742,7 +3742,7 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 
 		folio_wait_writeback(folio);
 
-		if (count == PAGE_SIZE) {
+		if (count == PAGE_SIZE && !offset_in_page(pos)) {
 			offset = 0;
 			attr_len = count;
 		} else {
-- 
2.43.0

