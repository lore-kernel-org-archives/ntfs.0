Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877E83546EB
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 04:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337300; cv=none; b=k06Nmli518ryiR2m5DMPxBmmd8+bEIPNHDNsfId7EGc0YP2deAjqNWLz6baBi99cx0jZ1MpUqEYB97fiyybjxKCVP931gQwAbZPHV2QBv/glqT8eD53E7Sir0vpge4cgel64R/PKlePTUevaG+UVqsXN6UOywVzNsgvtlmsZOsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337300; c=relaxed/simple;
	bh=u0tdlhAP2CS/mm2D3vXz5YZo19dYUish/3KUJAzcdOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afLZt/DXulAZW5/dPrUsJ0MSOyiyti8J9B4LlrOztJesZ/YFYS0XhnczHQGCBFJ2KBE4oyX8fipVC3iQg7gZtXyJ8wooTTpPQm9W2qmseeJrZ+2gnQyW6zDa0y1WJTuvhCyHAJjxjDd5BywTJ0UxlJh6FeARoI18ZT85eH1M/RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCJwAgMn; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCJwAgMn"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so995745a91.2
        for <ntfs@lists.linux.dev>; Sun, 09 Aug 2026 21:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337299; x=1786942099; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d0sPVUfOuNbXWMjeDdrddQyiriK2GCl9OgpZbdLi480=;
        b=KCJwAgMn384mRNULSYXZAT59KeEYl7uhGIcvX5AaZbF4FUroY7ouM6unegBfyxyMDW
         9tgzKhQacGxIOu/2MOY55dtf5uq1XwfEDtMMKXfyVSvFEKZfKDBkRNPp5FJHUn9X7GNT
         HuK+Neru9RoU7s45GwBB4vBdaScHgjKsFANUP+8Md+r2ZQQQGqAqVFoytpBgx7WtYSdl
         bdV7Hjgi6T+m7ny7fE/NBE9tAY/VVKUwmunHVLpEKGV6FP1GZW+iB16IK6TCZ+BUvPcv
         jz7KvCnh0kdgwgu7YK29+X8Nxx719RQfs47EDfjV01EjyERzRRMa/wjEggFeyCCe3+hh
         24ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337299; x=1786942099;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0sPVUfOuNbXWMjeDdrddQyiriK2GCl9OgpZbdLi480=;
        b=KF/xmorMvAAmZ2aH4uoDVOjW4GICO//kUiuQqQ0uqV4ocVVOdIZ2GWm9eIyZMHGMaG
         xVFh9UvvA1OYCZ/2Tg6/u/szoTrRi1DfAqlwFFrQmLPJ+wb8euzXk8+uUFfUd5EAmdPJ
         p0y8hJZy975RM3N/jp8YVrTs1EqqXm+sL1IoxT1ZAagUSeU0OmAYLSuDao85d45nYOST
         zbkp/Tx69O6t0+pGwcrFGMEU8tA23gcnWYJTD5llAggmxw8BOw40yhz+3I2flkz2tqT8
         G+L+gPViNPThiUWV9iJ5t6OdlrK/m9r1Kq0GXw0yVtUGgqdPaRVkk8vIhB5G2V0zvLqi
         mtOA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/ogyDNUGyijomrgSJ/EKN8bv98etxyMbugNfQHPPDK9dpoN4dg1wOFKBxqSaQMSLu+3h2@lists.linux.dev
X-Gm-Message-State: AOJu0YzLD0+FAkS+dty/2qCmefX1+PT/lU27HQxYB+Ju5PahjIOY2Btv
	xQZ15L0jX1Pi2otiiIqzBQtTisbwtp08v4NV3YJiElstznFtlLpdtiw1
X-Gm-Gg: AR+sD11597rbexHeIKmyH26AujsNrvXWCl3FlvOd3AALeg7+TscoOQi3KSZXsaF3SvF
	ByNkR5hGVgE8M+gZJUhjh+M+iIWpNm6DiKhE1BUqFIDCW69h4KvOj5BcpQvIlZxYYVZRaEw/wtS
	ydM1lYCguKeZ0+HTfuU0YiRGJ+ZAYh1jf/GQR09oOSFigSAwpxAp9xuL20z0OFjQR+aIHcGQYfy
	UI4gUEiRq3beETqN1SzHGhU18cOF+yds5N3VeFGHxOM8NpUNuf1jx/hfJRBnGX58fI3CVQWZWnM
	7SqdIuju6UDJOV0TvQ7Rzli6HvmtOGkoXMVJm4uDbP8WqvkPuv/78/rO9qD2M2zUVh5ID5LtiPJ
	+XmggQfDWAYW3i+cJ2whP2s3D1Ze1jJWKVnnnkNQh0LO08Gt7gXucIxJ52IiaUuRMKqbf1hPhS+
	iza+gwQ+B8XXo8SDz9UEhIn0CxajRqwVPKbbAYYlnfwibnBHUnClhjKIb28wqHjMLxXec=
X-Received: by 2002:a17:90b:2e42:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-3909d7d2f85mr29451782a91.5.1786337298787;
        Sun, 09 Aug 2026 21:48:18 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm13045106a91.3.2026.08.09.21.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:48:18 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 3/8] ntfs: add WOF compression config option
Date: Mon, 10 Aug 2026 13:47:57 +0900
Message-ID: <20260810-topic-wof-v1-3-6a97cfa3bb59@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810-topic-wof-v1-0-6a97cfa3bb59@gmail.com>
References: <20260810-topic-wof-v1-0-6a97cfa3bb59@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=u0tdlhAP2CS/mm2D3vXz5YZo19dYUish/3KUJAzcdOU=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqeVeQ+CkN2fDLS9hk+IId5MDw78VY4T9P9tyHU
 g7A6pxh1suJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCanlXkAAKCRA08jD6945I
 0wZKD/95A/o3vyJFfPM4+tpO1cGemPszNsPN5Igade+X+d/auvIwwkgCUul0TAxc8TKbNwf83bc
 ar+s5zknKcUSM2dXYXfBuBvFkDf3dRbL+dKwFdyoLI1C8/mpMcH4zw8YamhuOHhmrUOqoq6TL3g
 GcprYw/43EpElghIcD8wG1z6gioqUODfthzYRIlWAwfWac2T1nD3tLEMiQsMlmup5u47aLVSnYb
 +rjkwQTFyxo3AbvlIfvzIhRXEgpObpf8517hb9s9LHRfLuWM97ZBEnYruCSyIF3dhRxr+WTCrlS
 ZuPoc1M7ftSqF0MjVxMa/ilRw6L6c993+tAo7JQjRoyIyO6/a5tybGBIxup+7q2M62z6JXRIsTd
 mTFhckvfpPbHRt1oKzXt16ij5A3a/ZdPhECrRUIeBAcs5YVBOchnpnTJJv/lurBwtmeU9XYgZtK
 M7VRsf8M8pAfHGdtHiyl4nzFIagjeKxEl11/uJjMpWtHF1s3xveN3XsXt+vbjVobKJgZyxESycr
 Yq5l1DRnrfG7rH4mdE+OsWAtxhSbvD6Ju49sJLcZTZ3Mk1p9fKGvZysYT+SouZaYPaT0OvwMKd9
 3+ld6l/sz+3NtnbIPkTU9LskPxxr6o0QS+Zl+c5tej8wE3N5Rh4ZjgAG7CiNMCZ5LKAsntGOvJt Zuo6ROi5fJQFucA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Add CONFIG_NTFS_FS_WOF_COMPRESSION for Windows system compression.

Build XPRESS and LZX decoding code only when requested.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/ntfs/Kconfig b/fs/ntfs/Kconfig
index 6a6acde9ba91..9c962484dfc8 100644
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
+	  and DLLs using system compression.It is optimized for files that
+	  are rarely modified.
+	  Enabling this option builds the decompression support into the NTFS
+	  module.
+
 config NTFS_DEBUG
 	bool "NTFS debugging support"
 	depends on NTFS_FS

-- 
2.43.0

