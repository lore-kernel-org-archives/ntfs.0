Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BB43AEF5F
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 10:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799267; cv=none; b=Ri8ccNnzjnN+Qzb1fYeYFy0Ho5RXd01px5setybHFCoEorEBH+Lx/+m6Hor65U/9AL1J0Zz7vqO50PSAobG9+bHsx9sPfgBiZVVGEzdYCwQ4K5kn6VSapF+zBi0JkQLs7RouHNTebpwZbKV0oImTBSe9v9RPcEkOE7F8chY3vHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799267; c=relaxed/simple;
	bh=wixS3oHduGmXaXx1QCURZVkYo4rRgH2HUCv85ZKvaNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQhAuCot2j4f8dBJ2okK7U//flkvq0I70RtHvwOtiu8tk7yt7u8++3iFaaaZx+KfnnrpnpmvoST/XKSQaxd3QUu5IJqHqgP8zILCPEuQ2vklo0bkyMAm/LhqsAOm/6fw90ve9XxsJSYUuQf7JNtxBJ9QOOm4DNF3c7DplXQ9uKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quG4yHY4; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quG4yHY4"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1231403a91.0
        for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 03:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799265; x=1792404065; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HugyZ/37YBIlGXyBPom5LHKMhfm/UdMpEclB1nn3ivQ=;
        b=quG4yHY4DTgzOtpNIYi8h1boPVFlcV+lTofoX2sDZ5MboVEVMOVVTgikqm8KYjqn1q
         aQ1HzFwDhFEwtHZNSL7HwoNCX2LMPhl7KIR6ymVzjUqT/XTDUuJoImh8JWpSD8w3ioFD
         KW/eASYBcfwPaV9iLbBKhCr/j+RpSm+sfDWBO4mtO7lpZkV0Vp1HrG794+TQEXwogoUf
         MtWVYBrNgNq3oMqoCkgFF9VowplnmoSKi7is20jrH7fX/yHp1KgXIZFhjZT83CTQxrQY
         asEVg/NipkfZ5ShAExEb9Qe5UI81/WbSy/yf+4eq8BMxo5ExSflSGtG7e9yr3SuJeviR
         OTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799265; x=1792404065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HugyZ/37YBIlGXyBPom5LHKMhfm/UdMpEclB1nn3ivQ=;
        b=JNWhRBiL5HDBkhL5Hei7SPe4TJwG9+4xWM7+yBSBV68OK1Yn0eD5VwxZJ+3+3Qtv9H
         1vZMdn8eEt5mR1QiAKeB0/Uhmrvoaobrj9/g43ZtvHbqirWmnsQs46gfO1SlPZSrhQv3
         HLwWhZ05SiqOS31ARGnOY3uStd6nZyZ4Rgv6hihzfiXmFZL5oovzLwqN9j4QhTvZWhIk
         gQxg5eO6OzU8rl0Z3xqtXQ64lob1uZtQVo4k6yf+4xyvU8rTRddjgCZEaODuWMGpXa0l
         rtVjy19LBjd+R8w0Xnkrv9xzb5lw5tqqggpaVzHpbpgcayqrpQCrtTVb1SsEJq7s9aNI
         26Uw==
X-Forwarded-Encrypted: i=1; AKwUvBzaNwfxxe2XAdT0EoJnSD3GXt1xKvw9fL6phdL+fS9TGWypLYRCL1YL5IFInI5EYxWdcahM@lists.linux.dev
X-Gm-Message-State: AFq9FYLVubn3QMX43VGxAsVylRlxxFBZwRtx6rYMvUmigfBDPFmEBrbm
	mw8jFurdNvaH2siaGlCpx81K2yAAZr21VcRTRrCGtv8yPNi96AtTYLdB
X-Gm-Gg: AYBFou3t3Eoi6Iro+hhGaKpKpVTYhEbc9HBn/Dfl9Wyn602Ml3JNxtNN8hej1l6U4TV
	JUsVpoOH0KvgEUmfJFwFWYCfOO7dh1LY1EnzVOyvPcIbSTBOp3JGqF1DrMAoi0WxqwF8cWx2aHk
	CmYk/YDud99SZOi3B6bCciboqAAZTeo4kLWiN3AE74atHHg0B8iZGJMJjPSeLVQDbcKaAtPdzT2
	0w7RE/yQ215trfRPN/IU9KudkFk3Txhgn9xaq+BoFF3QK1C5AkQ/T/drPsJHRnG1VatDnHTepMs
	Vd9Y21rsIByAjusWElCLkGgRU6u+PJa1AU1lPX3cT35tzuspCjs/Q3cWFJr6t959WFpydlut1S9
	jSFS7RXGUJBLZot8ocq3S3DAgKn34LzcsAMe3PGbb6StY7Tc35mGgJA1hlAPktsUPk9M3or4DUo
	yZJSy8KQ+CkOo1yJsKh5hCnHoRPNhCv+7M/PsnbOVJ971DsefU16oihYNSPGxv
X-Received: by 2002:a17:90b:3c04:b0:3ab:c80:936d with SMTP id 98e67ed59e1d1-3ab3a735ffemr7677500a91.19.1791799264703;
        Mon, 12 Oct 2026 03:01:04 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm15527715a91.8.2026.10.12.03.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:01:03 -0700 (PDT)
Date: Mon, 12 Oct 2026 19:01:01 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH 0/2] ntfs: enforce the encrypted-file policy on the read
 paths
Message-ID: <asyv3dcrnMUlisTp@hyunchul-PC02>
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>

This whole series look good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

On Mon, Oct 12, 2026 at 02:20:38PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> EFS-encrypted attributes are refused with -EOPNOTSUPP in exactly one
> place, ntfs_read_folio(), because decryption is not implemented.  Two
> read paths get there without passing that test and return the raw
> on-disk ciphertext instead, so the same read returns either ciphertext
> or -EOPNOTSUPP depending on which path serves it.
> 
> Patch 1 is readahead, which marks the folios uptodate so ->read_folio
> is never called.  read(), mmap(), splice() and fadvise() all populate
> the page cache this way, so one test closes all four.
> 
> Patch 2 is direct I/O, which bypasses the page cache entirely and has
> no such backstop.
> 
> Both commits are in v7.1.  I have not added Cc: stable; returning
> ciphertext rather than an error is a correctness bug but not a
> privilege boundary crossing, so that call is better made by the
> maintainers.
> 
> Found by reading the code.  I have no EFS-encrypted NTFS volume, so
> there is no reproducer; the paths were traced in the source.
> 
> Zhan Xusheng (2):
>   ntfs: do not read ahead encrypted files
>   ntfs: reject direct I/O reads of encrypted files
> 
>  fs/ntfs/aops.c | 7 ++++---
>  fs/ntfs/file.c | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> 
> base-commit: d6d3455d8751854e0d1820f14184682e23ac4475
> -- 
> 2.43.0
> 

-- 
Thanks,
Hyunchul
