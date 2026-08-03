Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BC53BA22C
	for <ntfs@lists.linux.dev>; Mon,  3 Aug 2026 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748238; cv=pass; b=lMdbKpwEjcYd/Ximlul6GWrDGaQ0dTTMxXoC31xpyrgvXEWR5B3jfdmAcPOGoXonkCzuBU99XW3OlKRuxfMuC0vMsRnNdpLHWru0sGc4rN2Bvnahg9CYJGmcSNskofbv4BiikNSZn6u9Rxt9sziWWDASqlSVz64K26v633jqb/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748238; c=relaxed/simple;
	bh=pb4b9ti4Lu/3RkGlgEdrOnZL8E4Kq5qLvFGE6xSqQkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mr9zWoKiztOpHKSwVuTKSkNj5xZkvyLofzmSTAcgua6SpTo1V9k9acEsEsJkaO3n20yCkeZAHE2YeZ0ENtxnXkhKl4RlfpLl4vuiG1AW5zdO+n681A/M8Vz+bv6suBrF1AIk6561EJMlHxFEzXMcuRH8l6tGwv5EIW5ZMHx5FxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEuesJcS; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEuesJcS"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso4494197a12.3
        for <ntfs@lists.linux.dev>; Mon, 03 Aug 2026 02:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785748235; cv=none;
        d=google.com; s=arc-20260327;
        b=WfwSDtqx341Y1DTNcDz/oDWyWkAo3iB9MvO6VlXwes8lLS+/9LieRTIF7QUtvtd74K
         kCL2bhQn5jzURVwuvrePOkb2S/0jdDfbmRs5Qx17bIme/KSIb711tGN/rQGZ8VjILjQG
         8nR3LAiwxdIPplGQW4cmIQ5LnfHPzltkiKgVwkEo6lR7mI9jtXICsMRIJZInwAyFfLWd
         8Iq+110rKWhWaS3akB1gtgwZ4jooN2YLFDDbfpThdmvbtzvh5ifITzF2NEF96K4YZZoA
         DIho+W5pOc8ku1EOQnF2aICIS9crPOFLxxdy/jfoaGb+2BAFOxdgerxwsv7RWltDCYHS
         aPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7J6HVJzNjrFIN3yFUdHtYdOfwELL+FfzhQlBDyNUu60=;
        fh=2a/RGMkkouBLjPMe14FRfetv5jvmZWZ+pilRDVUGfjY=;
        b=nL3+HpAP2W1DtuiUdnI8AFmRHKcklt1o+WB5Xo/2M42Bylvur2YY8tj4Eo8THXGzsh
         6ARXj94Dd76nQQWaALYgtoY8TtbvnRYLxuRjZxhcHVrHZmVBQ9d2umO/5RSHY9tRfaAw
         DxPmBOdFjHFo5E9qGwY3Q9GwgBuxQ5hU29dpg6NyV5D2nOEMHOrliu43P9el/L67L5yq
         jz33Cw4NcsJMcIEMkRgqjQVkLnUmcGrqzmlFcjZW61vjfyWRJRhne4bBruO5cJMC6COf
         XifZSW/4cLqy8g777aj8F7xyBT65DmOuyPplv5dfHBVcoJfWLCeI2nMFgSymoEu93ajF
         JZhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785748235; x=1786353035; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7J6HVJzNjrFIN3yFUdHtYdOfwELL+FfzhQlBDyNUu60=;
        b=gEuesJcSV+jCoUK+mlOjhwt+TxWkEyhZmxOtuSwiWC8DRWoGxcw6kM7JJt0w4saZfv
         CkhScFbre7vO2zmF4iIVXvy2no/LQH187LFHMHc4s6YOi7svn5ZitE6rvZQlxeotdK/h
         QrYpylEdGCC/ufw7o1dvovn8uz1R2KeSiIJ/dPJsOsSeRVKAWo0bmSNcPT3KL4FcWOCp
         +JbPYXxo01B5UrloNwZzAvtTFH1+1RsJm3jSvO6DGLEW5UBoFA3Ow60cE6dcGlEYttXE
         005fKGQ5cwPdkrWDzS4OhXhmPKUP5IQqVqZbpS7Zh9CdNKewYHSw+g+9d1ELYNms6hYR
         nysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748235; x=1786353035;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7J6HVJzNjrFIN3yFUdHtYdOfwELL+FfzhQlBDyNUu60=;
        b=rORbSLOGdgoNRKyC2KsYGEtQBn/06+sAxiwC26VpvnLAYGgeaz4T/dcn0E4HRMSag2
         iESb33YPaikEG3bOInSYhxiXdOKi/aiNZxtvRTe+WNkmIdr/Mk0K6NniNctMZ6hZGS8d
         2Fk4102YGGWcsfGl3aJGOTcRnbkNIHv8AWtK3iL8w8yhbzRNa0QRXqraHEiYnJ8jgRYk
         UgAhVY2L5WxEHUJClZlzf+kAWB1gftlZAurJfdwwG8nS2A6eOh5aeRnYNcZcK8/oZ0Qs
         eUwVLeN1q5gbDEqz7k50+qP+vIFkCMQzJiRl1Eww2UhS9vpQH3MzBfGHYN1+9zgzclu6
         XyOA==
X-Forwarded-Encrypted: i=1; AHgh+Rpdp9A0fvhwiKfBazlYzHmKQ1yIBshzmw5AgwVXwLNMWFHjPiCjYrzuisTOCG+36N1Y0Kda@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/yoi1x8rj+/lQXjcgkftKwhHKVUXp3QpI9V3Repx1Dgatd4kN
	xND2siunFpZmtg29sLA74eFw0NeFcmy+Ag3T+tpEhZP3orE3j9pRuryD0VS2F9IGeA+Fbhe49e1
	f4wQSf2Hv62f+G7KC06VesrxV6ZO1C4c=
X-Gm-Gg: AR+sD13aPUeNx5l4Zg0+iiIE0zeBAeXL6BDf/V1T9g9KF+PHzBB+AwKP5g0R0rtrgBI
	+iX/TV7boMC9FUfLGlKsbCYgsqW7D2nQ5bHr6cAiJTTBdYitheluWqQ+b09ciQw4jPlAzKiF10b
	aWMxfGXPCPpEWpYFafx6GevR3b+NaD99HPiG166CX9uEuiH2XksSOyiNBdQRa+wdpRrTA29/k2+
	umgQ28JqOOlUBHgqTPZOKm/JeVgP/BOlNYUK+r6oxOwNeXfxOKV541S+2p4HBWE2yuY3PA+cpLl
	9x0IibQwXTxJZL3/jotiKrfh2D93Y6E2RH1mlvgNFYjqALw=
X-Received: by 2002:a17:907:1c94:b0:c16:9043:7973 with SMTP id
 a640c23a62f3a-c1fe80b9b86mr648019566b.4.1785748235175; Mon, 03 Aug 2026
 02:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729110036.12129-1-linkinjeon@kernel.org>
In-Reply-To: <20260729110036.12129-1-linkinjeon@kernel.org>
From: Lionel Cons <lionelcons1972@gmail.com>
Date: Mon, 3 Aug 2026 11:09:00 +0200
X-Gm-Features: AUfX_myjvaCFWmA02c1yymsrIEKUOb3dI7yRNTdkV8ooLN0Xyuyio_0Xubo8r9M
Message-ID: <CAPJSo4WUxiKcfjDkHuOVhqBmvHng7JdWX1dibsYFjW6qwTCUSw@mail.gmail.com>
Subject: Re: [PATCH 1/1] ntfs: add ioctl support for named data streams
To: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jul 2026 at 13:00, Namjae Jeon <linkinjeon@kernel.org> wrote:
>
> Sebastian and Cedric requested NTFS driver support for an interface that
> WINE can use to access named data streams.
>
> NTFS supports multiple named $DATA attributes, commonly known as alternate
> data streams, but they are not directly accessible through the existing
> file operations. Add NTFS-specific ioctl commands to let userspace list,
> read, write, and remove named data streams on an opened file.
>
> The new UAPI provides separate commands for each operation:
>
>   - NTFS_IOC_STREAM_READ
>   - NTFS_IOC_STREAM_WRITE
>   - NTFS_IOC_STREAM_REMOVE

Wouldn't it be better to just provide an API to get a fd, relative to
a filename? Win32 named streams can be sparse, and it is common to
punch holes to deallocate sections of streams too. Streams do have
their own timestamps, too.

>   - NTFS_IOC_LIST_STREAMS

NTFS_IOC_LIST_STREAMS looks OK.



Lionel
