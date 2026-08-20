Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3EA19F115
	for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 05:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787204978; cv=none; b=LAz9WwPErO89J4r9TLO7RCdKV8XO+MPlipi1HQcJ8OZKcjB/6DF4WnL0Vm47kGeaq18eQylg/0PFZ+DwQSW01Saz3jZO1KIMrwl1Iezmqd8vZb7nCvktP7lA6UGJ7851SYnhJI0LQGIJp1lFUCz2IW8+IGCmbbuIVkgi0Itc7Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787204978; c=relaxed/simple;
	bh=KU3RwXYWwYZAxp7ZuYracRGcY9IuXVWlqMdrcbX/8xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nfuIAHGBL8hIZaLuUpI0nZqFNzGFoEjugo5FhiNph/PSXB/zoHNRFWpMWQGcdbMPhiVXmpmCEpTlSoRsMKK1RaC4ij/8KJ4CHV25ygYPyivQz1Wek9hvHNDWsnkLWpPOfyju/4UKkUzCkkGV4UcIoH8LjGthTgome3/nTB6pv0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIS2GZ3Q; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIS2GZ3Q"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so1077128a12.2
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 22:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787204977; x=1787809777; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvAl7fow6WlnCUQ/rucyzETS6k/mjpdwq1DuDhIJcy0=;
        b=gIS2GZ3QuQ/H4ia1290A/0HRlxRuM9HGwh0L+r+2vhxjGxMqbdPNxThuRZroHQ8eoP
         OwPg0hk2dfeOF6FraUxvT6mG5jkfVuI5attYL6fEfKOxI/TN0CyoNLgfxVBzEzwO5Lqt
         C8cv/7ig8zr4VJ8xKyjcNrk6h6IQSc6mgDqgbLdvbBocEv7eb394YErC1iMV4xnIsw7f
         XB+MrSYzQgUObHB4YOVQ4J7xYraFrJNCF8jd/BRszfMPU6t838oXKDkrV1tP+t5S0OPn
         kAFBZUqbTI4wMQj9nU533W8/rgRH8ZIosn8wV21vAplyc7oZP7n7s0AG5YbeCZiya24Y
         9cuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204977; x=1787809777;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvAl7fow6WlnCUQ/rucyzETS6k/mjpdwq1DuDhIJcy0=;
        b=Pw1WIRPVMM+l3tlSlQpW8EIRqgIO2WB6ZGTXwzixOc4a2FPT9onyIeevBAGF43tjyc
         PnCyDAj289Vjp3O2Y7E1ejW2MtomzBWf5ll8o6FK0MKQUQfBTO0BxRLzzvg9g+fj5p98
         Oui6lC5Z0S3OcXOOtk5xhvasWsNnw3i9g4TKjqPCrp9/qMWbk1sOWZDN3+CPXh7HswvJ
         JsWfKDNvf08IQCKT6vv72aFCHw9mPIXouiTwe3P3PMh8GDNeReipZEH2b9HPZ7PZdIQi
         8JtzXjpNEqyOXp8BGu1bGgWFsdt/AL6dG28/R3CwuHQNU9vc4JN56MN5kZVurypL+sm1
         UzKw==
X-Forwarded-Encrypted: i=1; AHgh+RpE4oTJPojD9Es9prIlL0ZGcxer/+M7r8mx73QMaZCNOQNiDB+T1Fux6aXaJ8poEPMJvKMg@lists.linux.dev
X-Gm-Message-State: AFuF++komPeyfl8u7Q3y7Ku/T+OnT4BVPlbZw3zeY61aTx2P7i0IiGUx
	YCV39Qhxjqtjy+j1UZfI0XNjlWab6fdyVrvWiJN3sVm5UYX0Z23JwgiV
X-Gm-Gg: AR+sD12uKhyj/m2ce8ehvbt5vXza4Fno08TKvsEfiZhl8PeCG6buooRgcLxLAOmphgc
	2W6Cm3MgmjSI0vmHO0bDoJP2JAvD34hbeNnhfDI7LX/SBfiIoEHumQB9BuaNiAX/2h/mjosxoTI
	WvoIv5bp3UJafmgW74qz+r/FG4wDGaXa+ArPLdGmEc9IlCoaYO0DsI5fBfw1/dnnMppeVKgZ9Zm
	c7QD0DLgXbXW54xx8CCT2AhI9+kV/hzhJIKiVA3OpGiAYOuAgabcjqF9DzpijKODh3gYjroOeLl
	qwiYEc5msjrHxvGynbGWs4i08GriS5jjDMrRXtVWUBenUMyodeC1wzK4XUOp2BtUDYC7NFBqFFB
	97h3mLhBJzn8HdVVbI2vZkxPXqu8RPeq9jEiaLg7DHuQTRoxLjXSag11nDnmp4ARnlJ9yMfteYV
	o0X6KwpxPFkK6pUoEndC1vk0z5I+VFyLzicu2HLSHzM4h0hin1n/UBdIsctgLpWKYNv4ZDbbrsF
	IuieQ==
X-Received: by 2002:a17:90b:4b8b:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-395812aa117mr18037324a91.8.1787204976853;
        Wed, 19 Aug 2026 22:49:36 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395b66bccf5sm106766a91.2.2026.08.19.22.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:49:36 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 3/9] ntfs: add WOF compression config option
Date: Thu, 20 Aug 2026 14:48:16 +0900
Message-ID: <20260820-topic-wof-v2-v3-3-ef6149b4541e@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
References: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=KU3RwXYWwYZAxp7ZuYracRGcY9IuXVWlqMdrcbX/8xg=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhpUM6n8+qDNAOW8nRXjGZgU7H0J44C9/cpEtK
 1U/m7tQ3IiJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoaVDAAKCRA08jD6945I
 0+cWD/9sBY4BGSBeEOSPKoc1XyAIFbHIRNwXdDval7btNJR91liXlDama2sNqlkNigqrG6t5Wxy
 Lr0N33P7rIh4vVYRL2ojY7qni83D+IkoQ5iXsuCTkCM1r9aeCPRs3IfiPFDtyRjh+o95QmgwDHh
 EmyR9rb/TbIGwOrHkdLOSn63kfTdWCXjY5krtwjsy3bJjtIfJBkZNPEBSINbk7EkHUU4cBJzSxw
 AE5vAIu0j9aMkHv5q30jV7CF+D8JpCgWB89VLMMIDHmsBkZ0RrDay76qpcuPWlUriqYSXdBr44B
 4PrRW7fcula0A1vvaI1+6u0JN9rY43pw6SrVKpIpEvYFqsAPlOdlZs4SwBJvXegymeQL0NbvT47
 Un9fcL4rPeYmZO0pCcxfBuSIsTzZndu7FwxegC5o4+coMwwz4P6L1WzE56Sd0fHpsMwlsAw7u3D
 URun89flOnjhcpSOYhVrZeg8PGDN0QqqyEIEvElmYy87kIgsV99iuZOivROEWEkKYMp4obm9d8G
 jBx+8o8qjjc+U79ZcNbE9+ndLS7w4OM4yGkooF0t4kgBdnfzsoLWoDVs3JYnk2mY7AQjIT3Twec
 oT5QVMb6O3Tu5wKHiIvRuzMoCiwMazqWFCQLWQKmnG0Nwr5ZLy+hnKI8WnbKMoc+aSsEsKHS7DF EWq+zS3lSm1W8Rw==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Add CONFIG_NTFS_FS_WOF_COMPRESSION for Windows system compression.

Build XPRESS and LZX decoding code only when requested.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/ntfs/Kconfig b/fs/ntfs/Kconfig
index 6a6acde9ba91..f88f4138f921 100644
--- a/fs/ntfs/Kconfig
+++ b/fs/ntfs/Kconfig
@@ -10,6 +10,17 @@ config NTFS_FS
 	  To compile this as a module, choose M here: the module will be called
 	  ntfs.
 
+config NTFS_FS_WOF_COMPRESSION
+	bool "NTFS Windows system compression support"
+	depends on NTFS_FS
+	help
+	  Enable read support for Windows system-compressed files.
+	  Windows more aggressively compresses system files such as binaries
+	  and DLLs using system compression. It is optimized for files that
+	  are rarely modified.
+	  Enabling this option builds the decompression support into the NTFS
+	  module.
+
 config NTFS_DEBUG
 	bool "NTFS debugging support"
 	depends on NTFS_FS

-- 
2.43.0

