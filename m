Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732A13148DD
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 04:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337294; cv=none; b=dhbVH9MOVNB8dVE7uRzqqt0T9F59ustyxArEYIEkli7PZE7LXfHlTI5N4HCHy5bpfoAazX2ZukJ8Cp2um/L4ioJl0ugJE/dA3KGCz/6W4+zPIWeXdht8BpbNUffdrwqXand4dBvhGC3x7fq/SMLnsgUieQghwx8DDKrnxyM7eFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337294; c=relaxed/simple;
	bh=d6Pja7zubfObPodcltrShtyChGU6Jo+dGQwGDWMuNII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e1XbVxnw6droFrlYqPJZ598X84sSjQpTq4xStp5HcDVxh6obE3mu2zTSTriBNbvFFKA/NwNQRg5AlNIi4EELP/p7m/i7zRbM0PCeI4bf74tonjUJ4wWNdIaWyn2JTpK+Eqn37Tz/+P0CIqRcgHtY94Tu1c4kcDXgdnZCAcD3pIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdOahUxw; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdOahUxw"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso1154708a91.1
        for <ntfs@lists.linux.dev>; Sun, 09 Aug 2026 21:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337291; x=1786942091; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yn1IIl75f49f882Z1VEDwsIyWvIYn22SJWTNpPrtomw=;
        b=SdOahUxwHzmGo3Alwb/ZqnPdbuwWj8JcekghE24bluwOM0CL8wBNinoN0uZL+ffy4K
         vRwtJXLQEuJNTmRwdZT4Sif2ODgHcYVwE8/gboQw5c8qFmDlyYfjwWVrAbZy/FHSrpT/
         u6K0l5baKrsnFjHTjvFvy5VmRcZ/O4LFjtC9EOgr7vzyqwcVlDwNogyWLB2b5NygAvki
         gkRxV1GPiZzvKXwiM1LBsblJXul5SS8hxOTTrijG9Xv2z+qWdhKEJ+k2dHKGfeVz4h1F
         GjM72vH/xBFq7XdKkmyJfZpMkQmgKRSQq672HxJZMNlaIUn4VYcBk1BAFsf72AISycJv
         0BTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337291; x=1786942091;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yn1IIl75f49f882Z1VEDwsIyWvIYn22SJWTNpPrtomw=;
        b=RjQ4Wc71w0zwh8bavv+Tc0Nr3jmjOsoEnPCNvBAMbY57Rv5G/kZEYP87skGT/X+kRO
         r+aziUWBPHrQpkcTcgUGATV4cVs3qoQSSjp12qpwjfLTZGDlsfT/JqWt/qQhfx9XUCSB
         z8UN3pUwdUdPvp48L/UfqqQnsqLqXmVR2UEzO/R934dGNISvhwLlqzms4Un9+nck+PA/
         LsJteY4wZKDGdYL7u0a2ZC0MMk6W0moFK4Sxsl8262vFHJ9FZl/H66VGAQNzSKteXFBO
         RsmM27PyGo76KCIviaei/xqqatHvj6mtrlPfJWACwzZDeCzFE5ncCtQAHGelZBAYfSvT
         0bZg==
X-Forwarded-Encrypted: i=1; AHgh+RoWizSyUTbAq0J5+HAZ4SXOLrqCFPukcuU7Yr6uYFcqWA+pkPenSw+od1IPbANGhi2ad+qi@lists.linux.dev
X-Gm-Message-State: AOJu0YwUP69NTUiIE6n/705Ujc3tw0095usFbaQZdXxsNaI++FpWzGLU
	3lJb0Nic/sTtzxMKWizjXzUrufiopXBW3BvTIwwJfmL0onycmSUCA2dr
X-Gm-Gg: AR+sD10B2Ob7Op0qQDv9CIeE7aGMHdYgd2Lkwlc9VjJLUkMGZBrqPa44tE9IHOQHa07
	A7LZ+jgL7xEJToaca9J0UvIjxzDNoPm8ys60RHQlxonuqD8rTmWxNKot0ImbxoAEIN0jDxAOubp
	Wd9dJFaDG6VrC35DjEzXt6Zf6WYMdic1N/g1E4+dk8yISysCBVWwb6U7XcbaudZsoLnplNeyj66
	CAsw65RQhlGY3mO+iBpU3YsmD3xYtfh6tGe8h3jZtAJv0KP8cq2sIbiVUEb8AqTf/RZrB23pHwi
	nFSEUunoG5vKVEOmc3d1x/xluBRpqAZFE7l/IU+KpNqwPE7zbC0tUp+JWT9WryJhEfZACA+N9dF
	YHU4kurPzKp/+3Z9I2NFt2mJvHgc7SbeFihBcRVpHjGzAsTzwyV0rG4uereTnDv9Pmu59tCx2oH
	WmSw9rnI8CA/ZfYkxxDWHV8XAUxONbivQ8lz3G/Eal6/UEtw7xpbtJmc9KTYnS2HuUA5s=
X-Received: by 2002:a17:90b:48c9:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3903c58f06fmr41603680a91.13.1786337290585;
        Sun, 09 Aug 2026 21:48:10 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm13045106a91.3.2026.08.09.21.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:48:09 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 0/8] ntfs: add Windows system compression support
Date: Mon, 10 Aug 2026 13:47:54 +0900
Message-ID: <20260810-topic-wof-v1-0-6a97cfa3bb59@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2271; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=d6Pja7zubfObPodcltrShtyChGU6Jo+dGQwGDWMuNII=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqeVeIDYLDWd8g/wABH3jljt4ObxEt7IzrPARuB
 aqzyV8liqaJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCanlXiAAKCRA08jD6945I
 08kDEACemEhiinf17rOFE5hAzogsOqrPEA65I682PkctoSrq6E4GaDVE1wY0UsyTtWf2mVwT3GG
 WRmWFfHWNMcha7zY7hbMzE7bFRAxDceIclsmLHxlqBSFRKjNOXPKGBnSfjMF1RZel14G9Hwz6wI
 5s0kU+9gl3p6GGRW72X/8wX+LO1sqBJqFJ9vTJr4p+RHoyCCRq0IizLoEVN0SfdbdZpb2+UknmS
 dvBGiRh8YiK8eEXIWNd8CgD4hZNrcgSDucFV0h6P9Z/wn4xiO6YSVY/8chyMKkX38SRbNtKckbV
 dM17nHq4SagUjy3MzPpNp7y9Vb34BgFxsrsOAn1CFyxUmDIb1iD1Md5oVxd9l7CVlYvcpVV48PE
 RKhHdGi1vDGIUDB9CIjvsDKrITfUDbLzaR3GdrMxGtyxd7Z5QaHUFvUY1ejv++V979OatftdAxN
 TnLenbegJnT/W9p2beVzklGxMR4ggDR0GfXubg35oWz1noUqIAhD04PedbiVXXsuvTA6fy29KeN
 8t1FtU+vDCq5Tc1OlOT5TkfYIDqTaQUEp0pG9tuATwjgROngjN/IMU6gWUUDqU/fQ3arfz3QCj3
 MQtnV2c1c9c6ay6g2vzH70xPkdAfoyjuINTk3jh2kjEd75rRtUBNAl5rL3Fa8C8l+OZBEXXxbM6 cAOA49z9phfws6w==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

This series adds Windows system compression support to the NTFS driver.

Windows system compression more aggressively compresses system files,
such as binaries and DLLs, using XPRESS or LZX.  It is intended for
files that are rarely modified.

The series adds a CONFIG_NTFS_FS_WOF_COMPRESSION option, parses WOF
reparse points, and adds XPRESS and LZX codec support. It handles both
resident and non-resident WOF metadata and compressed data.

The first two patches introduce the generic compression codec interface
and bind the existing LZNT1 implementation.  The remaining patches add
the configuration option, WOF parsing, decompression libraries, codec
operations, and WOF decompression support.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
Hyunchul Lee (8):
      ntfs: introduce transparent compression codec interface
      ntfs: define LZNT1 codec ops under transparent codec interface
      ntfs: add WOF compression config option
      ntfs: parse REPARSE_TAG_WOF
      ntfs: port lzx/xpress decompressors from ntfs-3g-system-compression
      ntfs: implement codec ops for LZX and XPRESS
      ntfs: add non-resident WOF decompression
      ntfs: support resident WOF decompression

 fs/ntfs/Kconfig                 |  11 +
 fs/ntfs/Makefile                |   3 +
 fs/ntfs/aops.c                  |   7 +-
 fs/ntfs/attrib.c                |   2 +-
 fs/ntfs/compress.c              |  12 +-
 fs/ntfs/inode.c                 |   9 +-
 fs/ntfs/inode.h                 |  11 +
 fs/ntfs/lib/decompress_common.c | 200 +++++++++++++
 fs/ntfs/lib/decompress_common.h | 444 ++++++++++++++++++++++++++++
 fs/ntfs/lib/lib.h               |  29 ++
 fs/ntfs/lib/lzx_decompress.c    | 631 ++++++++++++++++++++++++++++++++++++++++
 fs/ntfs/lib/xpress_decompress.c | 154 ++++++++++
 fs/ntfs/ntfs.h                  |   3 +
 fs/ntfs/ntfs_codec.h            |  54 ++++
 fs/ntfs/reparse.c               |  77 ++++-
 fs/ntfs/reparse.h               |   2 +-
 fs/ntfs/wof.c                   | 446 ++++++++++++++++++++++++++++
 17 files changed, 2084 insertions(+), 11 deletions(-)
---
base-commit: 5c244a0e9ca95468f4c2087b2c9269825429a13f
change-id: 20260810-topic-wof-4dd6eddbc852

Best regards,
-- 
Thanks,
Hyunchul

