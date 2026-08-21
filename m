Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BDA3F484D
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288511; cv=none; b=jQCMd8T8DPPKizcehjRDMQhcu28Q/fazk2/6WITr9+DBbtV5GRyjd1Z0DAKpi7qKWnFSjXPMMH1oISyRIjN4f4sFSbXfMK5na1M3oRcW5GN+CmO1Xf9knteszFcXM++bxg3mR5zWnPN1bUwh5EgTu4e4h5wkwu9P9TlEPRmT5P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288511; c=relaxed/simple;
	bh=KU3RwXYWwYZAxp7ZuYracRGcY9IuXVWlqMdrcbX/8xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P3Hn2DR4fwZ8B4Vb9SEDGStxNK2Udri6rq/Zaj83IMElD9YsZNqfAq77vV1Rc98TczilhyDwwI5tk99qxIZXpCDKKNw2svOqBc5TlbTewym4ulNj6NKTSLCcvUnpRKHetL2KeqOabj1G8auKR48/L+heX9YKpG7RwfTmauq1Xqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkW7kHyL; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkW7kHyL"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8486ac3f347so1419582b3a.1
        for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 22:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288510; x=1787893310; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvAl7fow6WlnCUQ/rucyzETS6k/mjpdwq1DuDhIJcy0=;
        b=YkW7kHyLcgno9Sfx11fvuydNypjkW+WCPuayUAbFq+6Bv6/2Tc4452wgSkjmwE+Vsp
         bro06Q8hNL4JZBwGQOzUp7MFndpRMS6G1LFwbZaVWRfakLLNZw0wG3g4GIBKeOdfacaR
         wGgoGMYCHBAVs1n3ZWZ0SE8V6HLt10sfuJOKbT14U3ztX5J5C2ukZyGNgic+9pPaMZGz
         y/w912D5EqbmtrF6eRdYPubkOloM3JG1SRLxUJX3tHwJ+y/JIZIER4pYn5FMgo692sFV
         qXTEQSgF/YUEQ7cg/mxk0sb95GIKzCZDwH1d7fQjYKmY0v7SIAIbSFQ3lMy4AT4WTibP
         /l2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288510; x=1787893310;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvAl7fow6WlnCUQ/rucyzETS6k/mjpdwq1DuDhIJcy0=;
        b=dUvt9Pfd6M4FaGPnlrb3z48RryOXox2Wx7UyrihZetXoxtvHa35JxdxCd75QI3T/C+
         r1h/2t8fwtgiWWGe3XrUbJhTRJp1G7fWJgxMxV83N60u/ythNuoUfprk6jPe1t0c+N/A
         3Tg5y3uQ3lDe1bTkpEQTliHhYAm4DQFuO1sA1dZ3OAIsg0Bw12FFTc41Z6RHgsDu/ie0
         r3CEzejVftrkdUpogoxyK2glgLxUWXfRvkc47C1DitPhsnov0PtlJWYzFMCQgXe0eOYb
         Zv+r2oZHXl8Qv18lKxigzw44PdC6jjW7HWa1dpQxKSjQZx84Ymh0wgO4rZvF9FWspYHu
         Xlhw==
X-Forwarded-Encrypted: i=1; AHgh+RqATnKlDlmEQYeVMaPtjzD9Vx/n6x/+fAGIb6o2XVAYjtvlX+QJFlWVBeS1S51sY5tG9SG4@lists.linux.dev
X-Gm-Message-State: AFuF++m84zXRv3TfWjQ9sNsse+1A1zOPq6ZJNqUdaDuhXmWH6nCRvMKj
	bHDVo0qhU6H71BUCad8ijTiNqj42/Gz8sj8hsLWSzy5CXj0/b+1TIUEz
X-Gm-Gg: AR+sD13ZvPaK7doyAdHAzqnG7nbEMKSx1J9E6sQfXI1c993ryLedWTYhfJnT0t3Gt3B
	JNVSfg8FFbMP84UbZg8L7zKssr38G7m/a3vKY+aHnZPT2KyFeTIgxRbkeDdMwWKSKVMVieKzyX/
	SsTsYWvquNNz+TTc+xfUP1HVvqCp9KfhZvnKrlNmJK4fsclLiYCoXQiV2b2wNhaA8QAoeC8STVd
	EFHTpF/y+SdRXnSmo/IJcaM2JTEHOSzZLNmrTAj45sKjUPjVGBoc+v0nAUmKcrs2gnAI7X6qo4W
	/DLV+RGhZftVD+9UM8c7oPB0Ktj8ezu6qbaAmtdzqVw3rUUgdDuaS6kcIA2+d8NCZwOy/4QqARx
	hS57KBODf+UdFVkvq+SwA8FD7f3AGdGpBEIO6v7OAJKBqNtxOF+EBn7Bn2pY8pJklZT3+kp2wcr
	gwifOzU4lCUbESXwleRkj3sSF/nFkX2n/M6KOfFSG0CkOiZNEDHr96NbClY9GAhm9h//4=
X-Received: by 2002:a05:6a00:2d04:b0:84b:9a69:156d with SMTP id d2e1a72fcca58-851f9a2c87amr3053752b3a.0.1787288509712;
        Thu, 20 Aug 2026 22:01:49 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm2319545b3a.43.2026.08.20.22.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:01:49 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 03/10] ntfs: add WOF compression config option
Date: Fri, 21 Aug 2026 14:00:52 +0900
Message-ID: <20260821-topic-wof-v2-v4-3-7a6fa10743b8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
References: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
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
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqh9tNTnW8yg84F6AQC1jtN6GvDWxD3hYGtXmR7
 UFMS8cz5nOJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaofbTQAKCRA08jD6945I
 07t0D/4x0vywuDkcJ5YfwRfBhNiEfxjU/0JK12/cGMsJTI7l1F45/MrPgQI1/AeTLQbaGRjab+I
 Gg3JxQtSi3SXbcYHrPKi76ocmd2Kx5oWvfhFFWTon4hpNa+Ed5f9Wtg92QIuBYm7ElvZZ20SiIY
 LX8upzzFpzm5n9I/XSBjP1Kabarx2IsPwIpM7Lao+2cnSyvB8QBi38Vqw9Crq+H4mwGqxnqqzaO
 24r1fa+8AsF1HzHWIIKsV2BSNCBznONqixISNpndjRQAGjq3l1kysQIHY41BNleSrKkwltnFdAZ
 dFmhJQl4QO0mQ97jXH81/fVQXtBXv4RGs2e/B1SGvf2M4SyVi6EIhCyrYFm7ULcFRFPfNv7ngkz
 ZLwTUfyspJ+g1kiRqS6qiBGDdq05cbxQtCC2h6YZ7nEmvSBpBtiViDxXS3BlmOEp9c/8DwC4A2r
 sw4LE1KKKWjNqraaPOoRJMDXoVAlY/jVLAvTX2p6pvuytylssw3xc2QG1o0y/XLxSLTV1upYkzI
 AEeJrJUG2Shpbcpo6ztJR2PYZsOfbPYFb78jWC5K4l3z2OvbAgYmYQGAtcqv7btBsrFdPGwxr/8
 Ptuw4Vcvi7w43GXwN+D1vrfemnPKRgTJxgi3PCukZlSYFW5nfmUVdgxfhxW/C2GBmIrkH7UBLs3 h19Zw78fPNHqYKQ==
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

