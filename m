Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E294F399889
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 07:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125432; cv=none; b=sD65IZYub93hKAgVU3YVp8nurmC16gUA6Hc1ZTWbiNCZTH89u+Qqr5+i75Hd7kIwLFglTfZI9+M4KuHsyMWYJY8oeHbFqdutkDqovqmLKhH0Q/6E4tJVwh3DZhVSEpNjYbVwKgWx31VtblA0eSSFlYbD9UjbXOeQnPb0w2CsXig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125432; c=relaxed/simple;
	bh=KU3RwXYWwYZAxp7ZuYracRGcY9IuXVWlqMdrcbX/8xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kX2f62TcmjMQfakOKu/WNaByofQ16npyELpprISX2ScE0fi0241A/Foiq3yAi4ku8C4RFErPVgpm1smcqNLXbo+ZpQwHoxg1hdPrcMPfmmdTqpyE4mvW4VMBUlUpugYa79gUvenvj8zO3nr//QdGXLpKwRysxNzXk4O9ppV2v+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nypUUW4f; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nypUUW4f"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e507b079dso478860b3a.0
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125430; x=1787730230; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvAl7fow6WlnCUQ/rucyzETS6k/mjpdwq1DuDhIJcy0=;
        b=nypUUW4fjCCjq3H7ufSHtTGJqp5fp2iRMZEB6IDUujWbp+0bRM3/fkmiJv6Y0KTi2o
         w+64L52hHZ8TnX7DxW5t5JJtma2nd+q0QBdRbrgISCzK2qUh8AZ+ZkUDsmb0OyImm1ud
         tteV3gJ0dh+TWmuR85BapwuuksVrMgjMGui+xyk6PKgT2zbHXesowsn6ir3f6YVm+BT6
         TuCJTLqEn+boN0+01DUgDKIaJaKrcebsZHKTkL+Ap4pPNfEwE9fnK1TSMq92ckdjmkOl
         rzynPCfDKkcSC6UztULq8t1EAIrcKTC6ORSuVYI5Bq0V1RAMUPueBxfttrnaZWTypFAP
         uTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125430; x=1787730230;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvAl7fow6WlnCUQ/rucyzETS6k/mjpdwq1DuDhIJcy0=;
        b=hc8O3/pO2XdSTbc8bxl9FuzSrWZ9kd2ZdqlVxANuc0AxQh6tpuLYcAJbL41UFbQNKd
         GwAvnroUJcY9OWFdWmOrYf8L6vYxIqOe1S7wDnvrTpfX5MUO8XI4BDJd8Hg95PI/ZISp
         hRzeTWB0C4sh8CV9jjhhE2YeySXAv9i2hiuEHrfz+jL+uyJX3QD+L0+aw7Jiavev6xgG
         IVw1KrWbkbVj84MoYF6UzFH+bO1y5TyCQCsSoxLOChQfaXbrqI/PKw/wixaZAFw4FwDA
         r8AAtsw4sI4nQPejnG4M8VG3gO+mQT/6oJusm1qU6qbKjY9TgYs4RkXaUqUrSStgrLuT
         WtcA==
X-Forwarded-Encrypted: i=1; AHgh+RrhB9UJaeygKj4PIK2q9lu7sedAlDtiVfYOwofjLBL17d36h01dyiVUabyn1EqVl9grkAIY@lists.linux.dev
X-Gm-Message-State: AOJu0YykGGLuuzxNONNaMxC3+jCyN3Eo2IhQdcFnyHljK4zfTL5NMGZr
	/BBWKdIlB7PAsyxbbtgXMDfZItO26uQVNdd6+UQ65RIHRAb/CJDfZioU
X-Gm-Gg: AR+sD12RSU1p+nEQO9wqRta6hP8yDWhLvd7DuV+WfkLRdVDkKwt67kXCVq5FG7EpX8I
	6KZqVpgcPXy/x5WkI4eZuRHnGoWT+qG6MVU58WWNdXVeb6VbBo1BUkeVZbM9Ec2PKmQ9NDpWtJT
	QbB7vv55kNxJMvLoTHhGcDA0z6bCU0Wfus+XMc6BH6gvGb8Tpnxlsg+e0PgaYb3dHH8HTj1RAFf
	S2pfCDQCZ4AwCykVxJJWwFUTew8ImxFNgS/dK3TkFRA8XD9Yt08877C0H8+nGVYcVehJnMBfeWn
	E/85gaF3gJ+sGPlGjC6Uis9ijPDZNpI52CxVYg2NoF6MoD6u+lSkQ+P1xwe9vvoy9zZLZgLMmMA
	SjgTezbxYKmfIpKD5c/vLXGaxotAomS5nvc4dVLZXeQ/r7P6P4yfa3k2TI+116nq0zR8NgziZB6
	ZWhd8inZLdaRaOAEeZko2Nrur4KpMC/D1WdX9W5Kjql+ZVAs09iDElvbuoQh4b0Sqwnxg=
X-Received: by 2002:a05:6a00:ba8e:b0:847:9267:2104 with SMTP id d2e1a72fcca58-851d394802emr3927834b3a.12.1787125430003;
        Wed, 19 Aug 2026 00:43:50 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm314623b3a.43.2026.08.19.00.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:43:49 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 3/8] ntfs: add WOF compression config option
Date: Wed, 19 Aug 2026 16:43:21 +0900
Message-ID: <20260819-topic-wof-v2-v2-3-40f56903e7e7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819-topic-wof-v2-v2-0-40f56903e7e7@gmail.com>
References: <20260819-topic-wof-v2-v2-0-40f56903e7e7@gmail.com>
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
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhV5w9SfE/Bxx387hHnwGmljKASDa8s/N6B9kL
 CBAAZ7LKaiJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoVecAAKCRA08jD6945I
 00BxD/9aCan4S9ZD4gSYuhdOfdCilieaCk2SgIK/eX4xnEvC74/DQwqXk0e0m0qo3UAHHgEKChz
 4GRf7e2P1CRSYKN0pyTO1m6MEVHn61TTKaghv4MLG05ePOAtCg0kzuieWMSh1hhBmwl0Gr9Ufq9
 ZAcT0o2nLamalcb2lBxPPPT8TxQbcHtShieZgNEGS0Z+4FnhMbs7Of+7aXXKSMUO2LXzigsfZHS
 BUOs1SMGiIgV4vqtdiW5rpCLsLEbT2NG3S4SO+WdqzfMk8QiK5j04cKp82RFyON1t9s1L0g0uWK
 hU+lv2FW2L4Iynl/jMvbwqtQOV4v0aHne7Qjr1PJ+sgtRUqhSIu9dcvmyOigzyKZmr9n5dAORx3
 2lAPcPzaJCXu8IgEW/AOxJYB7OkSyufjbcXk1QzktMznb5dDDawMjjy27N+GlqUPuqmOw1p44u/
 r5mk1RHdLByKlVBYiAA6wEJQeS+/2a+dE9Z9VtYL+H4Y1nqhK8EsEbvFR0uVQ0fglDQohdyawYw
 YtP5twizPjOI8VRKogSd1UqrFtR4t8TDMuY/LOtLBPGWjmL5l1693dmRxBZkjxxo1QJKKv02HuI
 f5Lw/0Y7spCaoB56T4NNdwSDPefujvfGLb2Q640aLiKc+t0TjusSVsmOxApHle1Dr59GojDO2VL NUqEt9ceU7K/zlQ==
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

