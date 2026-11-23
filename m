Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403402;
	b=ZWlIMGHxQqUE639hgiSk41HtIEl7Q5+uTOirDxWHN3uJMVfa8LWz1/nNwkHEaybhxrgK
	 0EGWlFEVPm175hv1fPZ7YV4GHlGCMwh9tKhWCQfvkzlxutq0qtuxR50+LWLESGCs+qVPY
	 Zj67wa/w36KGao26k0LJcq8HU8WdRuR9l9uc5HchFBfF1K4IXFwf2hDFI+cG7CZENPK8v
	 IpCxgBM8qbCSm7I4MN+wT6A1j7YLUnzdb4AgpvJrph7h8Qav5tCNh0HeKYmf4b4t5d4Ux
	 Q1ajlkwL9lZy/pF/3lLXrCHKz9geAKRtNV/4KszF8F3unQCHDBh2KKLH5a+pC1GrElA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BKJVZaS7a8HTdoTnBNxg/XnU130zaQQ9ueEmJs3IAi4=;
	b=xsmKxDNXwC3rgOclsoSBLqhoTeKr5AKw+WxPyj0L9g2krmnhoCiaSmnZZxEiTp3elxFT
	 G9wVUGVtTMR136X5wjKVZew5FyAkxPy7ZXdF3sgdA+XaX77YKSnsQrdkZDm26DrHI5mDf
	 6UgkNdhIkSuZPLs/O8GI+kMI6GaTo6FVCMLMiaBXxk+8WWrDU/hIEewgQSoBy3Dndxfy1
	 6f+/FG9+DBLFsIzY+9OXqqodeHNC3kwj482dO9OPI1c3S8mpobnwOdzzWGcFEl6ebOglR
	 HE99WG815vANOHhDKfd4keBcEwYzxfKHTAKf+XAcUz61I82Xf6IOBOW0yOEc1KQ6cxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pIA8+xoS;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE84606A31E
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 03:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pIA8+xoS
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f04b676219so13547415ad.0
        for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 19:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795403401; x=1796008201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKJVZaS7a8HTdoTnBNxg/XnU130zaQQ9ueEmJs3IAi4=;
        b=pIA8+xoSUYjBipRjvjC8tVRWAmASVgnCh0bZ0G7SGyy22wHQUmnlWgx3jfRUdCpMKq
         WxIrkT9tL8mrJlCzc/8Hdvb2IDUw1sdqYMw8EZ5ebBLfUwUHvaKbrOwQHiCSKIYyNyS3
         v8U2o09KTGIDpmKgL9Qceikiy2Fm/llQiZ3XpHK1Xnx/D+AnpFgM40CAb7e+N3RDYAfY
         Y9MquWBj/kNHBKO4ap7HsxoZu/OkYLCf5StQj/CEaVWv4X0nFV91dmaaL/bzP3MZUXOc
         DjhFDjJWNSQSccZBKt7Co+Ej5+LtB9F/1++2xuOBv5lSN9gZ7z2iOxW8Sfdx1K394ylb
         dq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795403401; x=1796008201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKJVZaS7a8HTdoTnBNxg/XnU130zaQQ9ueEmJs3IAi4=;
        b=DVY2cUxYb/6XEC8GUCuRHM58SD8dx07tBX/G+sgM0KOUfkd7mRndehOlx+7JG4zO9c
         3Ch5SnDm9FnsG4QcPndXgVfjKuNSqnvbC8J/t8DQR2oJc18E0lUMAhXUmFshPCEtguG0
         RpDJ85Fci4jk/gbxDZKLDb0bxcWHhxWU5I8C54c8XlYHutI2P/qhmQe+qplTSQCl687r
         sThGYsmdK3VoxCSAhy9WcjzZoSZy2J6NL+orrci8Yh6be5lI5oMvo0C2oGsG5djKXFUq
         TUmJg60/uOPJmctWHgjtobLhyklVDClcBHpoLJx94qkjf3Sm4WFk+PWIjEQmo5tlposK
         i5mA==
X-Forwarded-Encrypted: i=1; AL+hErE1h8MS2rNll1O5YBlpkXxI8DiYmmDzntwaQe/zsyTAfTQxuzRRScP4gaNWzuvvhWAf1f1x@lists.linux.dev
X-Gm-Message-State: APuU4Z8R4VY6G15pSBKCbXeFbSGvEHEd0d+6ESw9cEwsVNA2wWyaVZ06
	+rHoNIv0PYIBPgaqA1Ae01XSH9aFk9dDwxlfMm/X3Y8gZCphaSLS2TWd
X-Gm-Gg: AZFdTZfsMar0cX2AKWrl1vZnz4+H2ZuJQllIxuCSt4n3xjQnC7OzT1yWRzykvGozo+t
	GQyEgGhsr1N6wIzlOd7SYky2b/fxcWC4fak4JiW8vMD92rNJo2vnsjqnAX+s4uU2y5GvwHIUrjT
	ZuTXFXSW5whJW2G8LhaX/lbODbRftdOeqnqcyV5i91lc1YDx07yd9WZIW9kmjN0WqYSV1ggQyNx
	zEZkJN7JJbF3NBj057XyzE85qNqBP6vazRmwR+37LnImA/HWkhtZD3TbTV+WBfhXdKcOF1UMIpA
	BXalZuezHOUOvZAhC0UhbnGxzoOiVr/ANxTZxqvc9y8oJqlVE8kahB6pZxudYS1DgDLsWEubTxn
	MF5Mo+ad0vqAk3GFVSfHQ7MIGT3ovX/itGozxp9H4nPkK4QiVMJK9sAkRUKF/8IusnYdgM2DNBP
	RDkIFkXyb9HOpHPKPrrlIDzZpUnWAA0FulMMv9kxHxEVsNZs7XIyPICI0k9/4LPBGZUSgXBxAuB
	nmGbkSHzyXSzwdEYzGzLikEiS4E4v01TdEb8I4ejY/2HI58WB6Vte9jaaGPL4cT1NkBlHeiYqR1
	Sc5XeQ46nCLMbf4cl3QDezbcXDopT2qNgMyKBwHFjUsn8g==
X-Received: by 2002:a17:90b:5887:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3b41c97c995mr10199877a91.54.1795403401097;
        Sun, 22 Nov 2026 19:10:01 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm15693445a91.17.2026.11.22.19.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:10:00 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: ernest.borowski.git@proton.me
Cc: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v8] ntfs: trim the sizes after a short write
Date: Mon, 23 Nov 2026 11:09:54 +0800
Message-ID: <20261123030954.1614965-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179537167473.2649834.14001007738076272792.b4-reply@b4>
References: <179537167473.2649834.14001007738076272792.b4-reply@b4>
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

Hi Ernest,

On Sun, Nov 22, 2026 at 06:21:27PM +0000, Ernest Borowski wrote:
> Zeroing from a worker when the caller has a fatal signal pending fixes
> it. Something like this on top of v8:

Thanks.  I reproduced it on ntfs-next f674e4b6c315 at 4K and 64K
clusters: with v8 the page stored through the mapping reads back as
zeroes, with your diff it is kept, and v8's other tests give the same
results.

I'd like to fold the diff into v9 as it is.  Can I add your
Co-developed-by and Signed-off-by for it?

> Patch 7 has the same kind of helper in fs/ntfs/iomap.c, so whichever
> lands second can share one copy.

They zero through different paths: the one in patch 7 calls
ntfs_zero_range(), whose ntfs_iomap_valid() only accepts delalloc
mappings, while v8 zeroes allocated clusters past the initialized
size.  A shared helper would need the zeroing function passed in.

Thanks,
Zhan Xusheng
