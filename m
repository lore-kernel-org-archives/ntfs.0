Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793941051;
	b=m+WZEQrZV9pTcM8/wOrYGqvXTEUk+CVmor76KWfcwNpKMvdCDxJuveOpuILiUXcoaEs+
	 AkPDA+56H4ukyT6xVRx8mHp7jaq1X4LHsaX4wH+p1/ey/zdQiTf/S6dzf0yVawCqOWx4U
	 Cv11D3i6XLYqO1Ul6tx8XovF7br6FNz5A4fEhhdxxiru8uJCggpGn0F7prykvdqX0z08b
	 GgRmqnOnQmqOQqTQ/1rniAHbVw9VR5qIrLltc8Cm/KJDAx1sgX0O+j1X12Tn8027pA5CB
	 x42EIoMdfsO7dCef9Xr4jU7XvKSEyTq5i6aNjAAiIfUwuIYU9+FGzUjnDuQTCbftXpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6NWM9VuPZ6/E/oWJvm69QVGVJxdjPEsFNw978dAXWSo=;
	b=U5Mffa0mhEK6on5kBnXXhPyy1jjMwBIXpfdyZgRIOG1O+XBz5cEcBXqr9LBw8FT+h0CS
	 X5lHHelj2oKcw1bgbyTU+zDouPpMrNlAskQb1BFjaIJE8Dj/QPz0kK663JLpB7rewHzpP
	 4vWBj0+JjZOIufpS3tESizwVKhiJLYz+y9RyRAh02TrkCm4rD3m/C+EiEWEmYv7Dd+7ZW
	 hsXq4xk5j0Ezrf07uEuI0VJjplAN23hVk9NXVDQTBeZnvYBUnoJwxTciE1zowHVz/uHIB
	 QtEAFcSvrESJw2TazbaYAynqJZdk5G0w+s31dwCwFu6d3Qqc2d4SsioZ/iwvT/IeixQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl5QzA1y;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E12606A32C
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 04:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E12606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl5QzA1y
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so402875c88.1
        for <ntfs@lists.linux.dev>; Thu, 05 Nov 2026 20:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793941050; x=1794545850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NWM9VuPZ6/E/oWJvm69QVGVJxdjPEsFNw978dAXWSo=;
        b=jl5QzA1yFvFgZL/Malgkt91yRyAfc/WojSwTLb43TWehSH27bnrCjSuIXTn5Bn6ut8
         snfiWCNK0tK2e+Rvfxpces33K/igCOM09N9YCBT5XHv+tRnllt1Ded/nKH2Mbs30qJ0t
         SObST2mUCsV19M3pdPOQgqfdA1dAn+/gQ0y5yzKSzX6Psi4LExCEJ/hPCXiOti9S1mfk
         HWiy+3nsxhkcmSuAVnmxjSNTVzH9WwxMMgSgiXMG3ZTZH0mq9L7/EOY9ZoscghMCmvis
         6Q4w5uQh4dctq7OM04gl6CeS5gPv30Lacbw+ttUWc+gWpanYmA4+eDNVyLZUR3S7Cjth
         2SMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941050; x=1794545850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NWM9VuPZ6/E/oWJvm69QVGVJxdjPEsFNw978dAXWSo=;
        b=siZMqJ1gQlSYe6FKlpHP7ZBjN1kVNOq9jP0qYjHfqZJnRxQxgGNyNm7YYaiFLJFUEG
         VNn4pOwUwlSdwpu8tGgKlJqBKHGiLULl5RKPF8FboCqF6aCtHoZXN4azG0PHFd4bKZX1
         cY61lOrE5JA+BGjT8D7HbX6CfyY0kZ4wSWCw5EVBeIUpX+jlSLZrEAcp5m2+J4rZmuw8
         3lS2+ZpCzP5Y8RDVbbGV4/zxJuUA8hlquOJjM2FFXL31pyApjM2Hg5EdRbgT1VIVWdu9
         t30MFIjFvMbF2tDA9iBqTP2RAhlXlDD6ouvYyrqQbpUk6wpGCXX8FsQtVziB5cgdR3aw
         26Jw==
X-Forwarded-Encrypted: i=1; AKwUvBypV1bghlp3NHYZr30VFn2WtAFVUXUf1e5ke6QUIBXP/a7ZqHhE9hNEVAyQ2+LQzZ245BWl@lists.linux.dev
X-Gm-Message-State: APuU4Z/5UXr7/y+DDsE16WZG8AkEEqdQnm16GtKzhPPcxTrq77uq7JiI
	EXCBvOboWYKznLMgG2ZTf7EVRuvQMdoPOlZOfzMogtD2ScmHKKPZ3iGC
X-Gm-Gg: AYBFou3sWvL0U1WWONAmDLeH+hDG2ZtkkNp58VhNgsRG0bhPqeLBUct9hgb0P9YBnka
	YGJxigdBCU17pxr6k44CB/iPDCeEa3xy3kBPZGV8MCENjtB9/rR4i56v9Up0VY3DyinpP2PrHBf
	/lJElbapmCD0RKR6Pb+n5PrbWjNiEJj1JFmY5aTPmyhsSXv3+nwsgTGK+w2Rz8+bxYByPkK47ws
	II5FRnJ7ZY8Qf9cNfhL7P/TWSAaH6BnHi9dX4qsyd/2GxlYfUpVaHd5Qi++iUGsmLxDL+GPhtfG
	W16i6lO42zAaWhKEg2viUUI3y8Ule1+1cXENA3IiwSDZUVkhwdlbENpQHdyYTdo4Ea9HrSPiUvg
	8jRB/c5ZLy5Xg432vKuJcrRTsmfJEvShAqLkdJAg1zXl3aCB0GjzIUApJjRCM7TOvGkpeRYfRdI
	Dvi5JhUnTz4aJ1l1NBz7LMWd1sdiJDpJU8IuC32rLOID4AoWYJ7wlHtpTnqFaDJQSGVpuEk3qOQ
	pHINjxVg7wJExhZE0HTg1szEeFJl87JwqjV5xVdjEM8BGezReYQm8g7YT0ZB23z53thKiqbfGm8
	gKqdbBWOxSvjiCJtTG9A1LcnbADxdclL3F4brwS0eP9TuA==
X-Received: by 2002:a05:7022:f51c:b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b25d3153femr1419262c88.9.1793941050171;
        Thu, 05 Nov 2026 20:57:30 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4c41eesm3038969c88.15.2026.11.05.20.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:57:29 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [PATCH 1/2] ntfs: don't write a compression block after a short copy
Date: Fri,  6 Nov 2026 12:57:25 +0800
Message-ID: <20261106045725.3047943-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <au0zsi-oLfcprQxI@hyunchul-PC02>
References: <au0zsi-oLfcprQxI@hyunchul-PC02>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hyunchul,

> This patch looks good to me. But the second patch in this series
> appears to be missing.

Thanks. My mistake, I dropped 2/2 before sending; this patch stands
on its own.

Thanks,
Zhan Xusheng
