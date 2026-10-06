Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE2E34A791
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 04:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262245; cv=none; b=HeEcNSFExg9kPOlf2MivhrRrujSaiPH+SEIM5cuiGceQR7PiCi6vNSUSKjetmW4lXs43WTmoCa/cmYCoDO/kiBVYOBLYZcngzjWTm/BfUUb6WbAGjDPBi0hIozYltoQHDH/8tLDZXfaltQZe1Rg0VV6eYxiFcsBeDvusAD6Qk6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262245; c=relaxed/simple;
	bh=N2dqD9oDAslSmVXglflxtsPusgZbGIROFq0AkRcGJuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obaZ93mDz0jJunPpKcR7EnKPuXvBwypWBeiDIpl96RYJSg7kqOaUpwRvrRgBjbWZiT2t3F3ZBSczfw8FxtFFHSQSL3uulSv37DP4DnfobnBwCxuYKUkN/XNOEkthpOYnuZ2KAQDFXyCq+JrrJozc/kW/II2R4UuZXJxXXHNGje4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3e4BDat; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3e4BDat"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4be28b82so138228f8f.2
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 21:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262242; x=1791867042; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AZTcEpNIkmijk+TrbdyJk/7ltqjN6rjFrhnfuYd+A6c=;
        b=I3e4BDatPi/8f0BjK8ck6PD8zufAFQFxqyE678PfHw9TLzv8kcW0HFnIx1QegzGYKy
         oe1b4OvGhCOa9SW7/YJe9y1sYDyOEw0szxWF6a6Mpf26ILjv4Fck1+HFwPSC9zlFXcSU
         9tjYgXZxr42Qigzntc+QK1bI6yu3Be40DiyphIo+mmH1AlD2auHBXSbaIrKkZXzKULIG
         kqJU7c0Q4ITBNp3ReWyJq4itB5ITafOzIMKNpke8TA3YhHlEUDhHZMpDI3ZUDYEao0tx
         j6PZ6fCvfo2A1Z9GLXQFX6HYVeRLKv1mf+pJkZTVAtWW9sqx4YcF9ujwb5xPFFPXFwhr
         Hgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262242; x=1791867042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZTcEpNIkmijk+TrbdyJk/7ltqjN6rjFrhnfuYd+A6c=;
        b=vWmfAzlYkqZNrRgdnLVthrPjTEnYpFrgwmUMW4i/0IObuYEc2PKuk3/TNG1NNmecZk
         ZzqIYusm2TWGhBlOMmbIY5YSzI/5MX8i0JHv6oP48cJ2YBE4mNi2sJmvYgD/Bs3PeYx+
         X6ie7tS7ITRKQ4wszCINo3TA2dZdsYIUUHyn+ZJ8fGO+4k3XKBwVtTGJNRourz9HlHvE
         lbimRlSCsLXor22tZxcWil+Li/4D6bbZ9nPutqTgA3LzLJzLPJ1yLv1quLNP7F/2O3B1
         LLpcu4epmHzjC8pzGCNCHek6iYXAQVlOC9X2fNMNWoTfBvGUpwU9D/IcTfzdxWxwBnNL
         wqCA==
X-Forwarded-Encrypted: i=1; AKwUvBxoO7rnIPjUflR7x9ucCwmAgVxvyd279uhgSjtlW80mTTDcXFLLhxrEUb5Xu3K5jqmu1ERO@lists.linux.dev
X-Gm-Message-State: AFq9FYKx0t/6DZLcQOXqSB/Ub/1UfjrY7Px26+SW3ADQOgcrwkzE3DRf
	LXcoVSnayoV+H5yU6+oCetXH8DjL/+H3jJpIVvWpLLrJT/dxIuzseWLy
X-Gm-Gg: AYBFou1B5uqO4hTmOmRiAOGmKLuhD+z1RlNMKHGi9fRySZUS70nT+8zLKyNUJJp095W
	qpL5ts8P2kDS1k8bwtu0/5XKqMvEul05esfivUSRgyiyRb5jn6mUQwprbLoA0teYSYfNcRfnafK
	63wnv6Ey/ebUdoTkeO61kHpHgIs2ZrhVpQTNSdgADeKfgDTfe9kYptL+B3IlBVJnyP3+ght/oo+
	18+SubxXCgGa17SYtmpmE3WIfsHvLwatYVThDJEUiZko63V77otl9orGvzkJNFLsZyHQdqHf9JZ
	oozFVKbJoLUzdOReqU2Q13KRuOzVV/lH6CYJulZezzq7wSiZ9wLuja7S5Kjfns63dGosCD68FNN
	xne3dsbuNe+6jUueqBI2jPrg/60lS07PaDvP4lZvwq4ugJHHx+yuePi/76l2DSikUp2W3MhX/9k
	ZWtTlg4RYtv4uhThvH3NsLLykKJHLhOt6UKUjGiNZCR16DyPjeQTLe9rFXf/WCFkoyOO5W4zNGz
	FYC0cQbSilSwAqeSz++ZMS+0n0qHXWK0YHq5SfkHhrgnx5fNDfRCBKtA8noj/jR6tJVVeTsbUFr
	KmqkPKPWdvU9gVnDdZSWMtvrm1+hsESU
X-Received: by 2002:a05:6000:40da:b0:487:88b:4681 with SMTP id ffacd0b85a97d-48c6d16d91fmr350123f8f.10.1791262242252;
        Mon, 05 Oct 2026 21:50:42 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704a5sm18265831f8f.15.2026.10.05.21.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:50:41 -0700 (PDT)
Date: Tue, 6 Oct 2026 06:50:10 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ntfs: fix two kmap_local bugs on 32-bit kernels
Message-ID: <asR9jHZMwy6Atpmz@gmail.com>
References: <20261006043810.5393-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006043810.5393-1-kmehltretter@gmail.com>

On Tue, Oct 06, 2026 at 06:38:07AM +0100, Karl Mehltretter wrote:
> Karl Mehltretter (2):
>   ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
>   ntfs: fix kmap_local leak in ntfs_check_logfile()
> 

Oops I sent patch 2 with an old draft version too. I will send a v2
without that. Sorry for the noise.

Thanks
Karl
