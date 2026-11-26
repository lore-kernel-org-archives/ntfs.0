Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682754;
	b=HQ7Z8gdQw/22aB2s2D7FO9lcquLmAdZ0cAIeEyvdUKN1cpxsmbsV1ijtdiTpEIIuw2XQ
	 rVA0Muzvu+GCpqHPOKJIEbByf+cOLw6m4yfNGpV9KHxEAoO8x5MFS7orK614UohnOCyTc
	 Cjl7RVmRS2bAchV8XCl6Zafbb4C24HGxE70Bqu/UxRWyyRdzAjHDFDMNpIdUtOBi7ZLwB
	 OyRgj1aiUIfUwoM09XNOCis1gubijJPStzYux7ojDoYdRladnQdjqGU9FYN4H51R73P+O
	 JgTHWkp7C7J6sycNp2qLnNKp6uo7/Wg1y0hlJd4TYWrTQgRprxB7HCgEYC0KWEen7kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AJu04eNoB1sBlEXHCPuiDkza8mteAHzav0QvwSSwQK0=;
	b=zhqXGVzWbA2qcVYgkdlwupELD5D64fvJFuS1nYOEonX5J5zoxjQmHtue/q1GToZDWeNr
	 rKmzFA9xV7KDwqpcSn2kMeBgDrTaf4B+HwUB3YBHD6B3H+KJtm39NQVYwQNp5z8JlLZcb
	 QfAp2M/PdIG49vPdm8IK1uEYiUkb7Y06jjpgDN+Wes98YxgP/LBMnFzhRfknC40eK3+Vk
	 WXSWllBmT9TgxZmGPAuJ+6wniC6pTC6qeG2ZVB03xXwHAVBKZR1OtxDJIxD5vQUQpU9l7
	 RieYxZaXh4dHyU38d42arzV+tj2FCWm152v9HRs0uovUGhv7L1a9zNnvsXRUUV69k2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nseGwM9l;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2085606A331
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 08:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2085606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nseGwM9l
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9ae391a05so47522205ad.1
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 00:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795682753; x=1796287553; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJu04eNoB1sBlEXHCPuiDkza8mteAHzav0QvwSSwQK0=;
        b=nseGwM9l3NkHhBEaQlF92S35AkDp2GlBAdR0BZlTdNwXWv7f0Sxr9Zv1+/3ZHDBTlk
         NlkEaxAhL+1LHEMeeKjFKiKjrF/OgRomzF077uIp/+9v69r6vnYd0Smz+6SIR6iLMuZ7
         rDaJr7poSKgkdslbTh0W3+RiLPOiDnBuRSI64aFzIZhK9a9fRSfhgF01j7qyemODaNuE
         cYgkTbLtcwUGPPldUwMH7DqhtIBUeywpO53+iEv55ldJ75UTZj2eyHtuxmaw/Zys3IeY
         zrbn+JRMUFNPKLZiG3lQUD0m92MCOS0sbdVCYKFHb103XybnvE2Ekp0+7ktHlPAS3+IA
         cbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682753; x=1796287553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJu04eNoB1sBlEXHCPuiDkza8mteAHzav0QvwSSwQK0=;
        b=QDiy3Phv/WrAAmhthwaJsOuzP58IvcOz69hyt3KBKGEiwTrYOT8oE9Qgj3XscWG0J8
         8ZBqbR+xlCABVQzRxC8tegcHz5bzb5KSn5dRe0FbX45kgjazz7ikM6SmhCzlAm26GCg1
         AnV2McqO9kcEorBfzgXj6jpXBd5Qhh5A444Ro9kZqIMiJ/USSpVP6XCnhma87Gepf07V
         8Zoxc54CB3CIqJ6ALJm2MIFLmCAm5VHC2MWp4nF5gxh5XA/G1ghcS0IBaNz5TjXDNXEo
         z1BcVOst6rZuhTI3whCjcLWIWp80Z3tJR9tcFZMJH+wG6qAmQpcbKXSvSeSN/G9SM3k5
         Fj4A==
X-Forwarded-Encrypted: i=1; AL+hErF98fYtE2Um6sS7UBNo9bqUQbxYwV8VFiG3zcd6sxF/JPG8vTtsc1NR75KnR6cXdotSlXPW@lists.linux.dev
X-Gm-Message-State: APuU4Z8IRr5sNR9FSpbroApsZUOxG4vBSx6It1TsSrKxlQ+CH5eB+ZZV
	l0TGfZVomyPvIlNuCKww+PvPyPORL6g/sFy2Plx3Y7rhSe0SYtSlFsIb
X-Gm-Gg: AZFdTZcZ1M+W3vddYfphh0grt/V3q/dy3kyb9ZQKDPRiYaHO4hZgRHj4aMMjQUMIyM8
	zETwD38SJpVe1ptNJdqloMiZJa4JmedxboQ2mVM0XqlK/UgA40baqyLiSc/4NfwiFk/WVhTKj8p
	GA2xaxzkWzrhopuUBvsxOSukPodLsmSAKb1J4Lc2v4SVPK6DIwSJkSr2mO+aADBEMQn7HgOmgRU
	oStabeV6A1ZYeq95T/Mz3Ady8hvfN/bI1aNkGFuq78kMcJifgx8O5rpxLl14jEZoCTC3Ko2nWLz
	115yorlvc0hDJClyXjVLF84G8xhp103LcZDjpzNZXW9v+newdXvqV2778zuwiw1A3d9NNPykSBo
	84NjaTlXojSA+kYGxHOIBPn2A7TZZw8ZrHwFd4pR1Yx4YJWdKnNiObmZw/QTlrJ/n2oQE/P47i3
	m5GEM8PV5zPkTA9txKQLxFr6+46EEwObJ9zmplQHeqg75mSi8Fe0UetZG2J5rEY44Cd5tMOP9e6
	vWW9kOCB9nxQJD4ylxtG1XSjWOapmWb3giPcTaqcOesiaet4jw1FFkjlhcTgprrh6CHYAXHfVxc
	swsT8GacNBImV2IzyHk=
X-Received: by 2002:a17:902:ec8b:b0:2ed:662:e485 with SMTP id d9443c01a7336-2f03efa420fmr137669995ad.2.1795682753264;
        Thu, 26 Nov 2026 00:45:53 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08d73dfe0sm65354835ad.69.2026.11.26.00.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:45:52 -0800 (PST)
Date: Thu, 26 Nov 2026 17:45:50 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/6] ntfs: read initialized_size under size_lock in the
 iomap paths
Message-ID: <awfxvg7w_i49JxBv@hyunchul-PC02>
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
 <20261125073547.154150-4-zenghongling@kylinos.cn>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125073547.154150-4-zenghongling@kylinos.cn>

>  	if (!(flags & IOMAP_ZERO) &&
> -			iomap->type == IOMAP_MAPPED &&
> -			iomap->offset < ni->initialized_size &&
> -			iomap->offset + iomap->length > ni->initialized_size) {
> -		iomap->length = round_up(ni->initialized_size, 1 << inode->i_blkbits) -
> -			iomap->offset;
> +			iomap->type == IOMAP_MAPPED) {
> +		loff_t initialized_size;
> +
> +		read_lock_irqsave(&ni->size_lock, irqflags);
> +		initialized_size = ni->initialized_size;
> +		read_unlock_irqrestore(&ni->size_lock, irqflags);

Is it safe to read the size again instead of reusing the first one?
And the size_lock is missing in ntfs_iomap_read_end_io.

-- 
Thanks,
Hyunchul
