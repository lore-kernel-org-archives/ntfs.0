Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080207;
	b=2jRzKQ++BrL87yxWrz5wbuWnQ9Zw68Q8XsQfBQqDihFLKYlGSa6gC1ciamJNlzQE+/OJ
	 OkmU1q1feanIpTld2JEK8mCSk3xkODIyl2n0vnJiF/NsM2qNrGFrFfeiO2AB4fz18KOwH
	 hRpgAH3G0X+W0JByjj9GaN8zE1H7r+Ie3uSuvR3WT//8shUw9NxnhJnQloZWvGgTBJ8Dd
	 nsFW3zCyNA7e62NSaYYmPDqYgDFPM0pBogciRsHW7V7zfcZD4+aAWf07mVLFZAJj2WpHc
	 wPCEtSyUFkYxJwUz7EBS3L99zCgyTdtSLRHhRUd968HzJaMOW1V2RcaotVdxdQOHviw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X+HEVGecC2vlXZIUhRdFDMRPIoGMulv5Gor7+ZJ0UO8=;
	b=1BzQe+XjgDo/hZvLxR8W//eQQSuXsiFmjuqAxdyoN6oOE4JTEvETUEiwQ8casv53XjHu
	 DpAmyW7ehusblQov1M8Lcb+XlPrOqR/jO5M6sr2dSpCximO2CY74thK2tfyno+6CpwRVd
	 ZmjVMlk/PW/yCfjb5vLmq7mNyTI9pEBNba45SsF4U6O0imZ/Th2FV5743J2GP6V9w/ldT
	 CC2mfGYOs1ggUHb0tUISnfQbe51/whxdN9IP6aPU2Zm6KxYtAqH+w1C/MdLxpBS9F5rcL
	 1/6myq0ab+fJ/ifgEtfjqXtOxn2+bWbcolKyvyOkZKapXR0zH4rs7y8mYFiUcLcrq5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZZMZa7ek;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EC8606A320
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 05:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9EC8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZZMZa7ek
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so2649510b3a.0
        for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 22:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080206; x=1793685006; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+HEVGecC2vlXZIUhRdFDMRPIoGMulv5Gor7+ZJ0UO8=;
        b=ZZMZa7ekOEAoFrt6NlELJ00TvmETmH+S4cYj6T0wXZ0xx5TPXNAToziCutjC3SdDZk
         lIy4bXJI9EzQCgaX3jRo6Ap1ZSHCKrsf8/hW5UqW6i0UbyMrTiSN86aIfLMM+hk9B0pn
         3pPnOMsJignkdt2a7siTY9t8tKLW2aOECM/3gblaKkruPlbHsphqgISAxr7Xd6Bd4Xfm
         I604ZK87Hqv5Zn8IjGklydCG432u4B5qj63lAHzCgcB/Ji43YbYxuVr/DcE+WbRxmgT3
         u6/irBaBqQoTlpi7ztu7vHbKx+BcPrenGWd9YlqTiK2BKybGX9jN2oABhujsmOOnwkr8
         Xsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080206; x=1793685006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+HEVGecC2vlXZIUhRdFDMRPIoGMulv5Gor7+ZJ0UO8=;
        b=mGUS8l3VLOafL8XwatxLRWlWlpMczR+TlLZJsi+yYJCaYnlOUxh45GU49bEkin87m/
         tirYcStWcgEEenH+dcU/67sa6IVJNc9zaQz5cvbowicMIrPUKRS+JbWIq1lc1Rw3fdAU
         JcF+NOLXupxGGzhHUp1FhtQY5XeVgaYkI7rogQA3T8KtlvmpQm+J0j1aVQ0jbcKRZMLh
         7N5Z4DXIiGcVRCPIe1ue1/26O6A9Hkh3vLBFnjorPuNhoZGrSGcEVswNv4vD7wvjdmoS
         DVDoydPAiouCDKO3r/uldDpioHP5T8//c0Daa3riV2To/jUUS0LxTeqqJ+N4zF2Ctpb6
         VdRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIV+hlPUig3xTthdBXHl3D2RLCAhnmcVWK8zzRhzHoYcECBoAo9Bdr91t4XlgD/wiIcJud@lists.linux.dev
X-Gm-Message-State: AFq9FYL6L0q/WByaKkBRBGcYls1KoR3I/vWsgsYvadknKiR+TLGbdfwq
	iBOZpcqeEKVuKCSe27gsPemsxHRT0vVN8BsOBjWoDcZ/w5389crdw0yMGG34Yjfy
X-Gm-Gg: AYBFou3Al3tSoR19rO6b18chNLZIofCuW2NzJyVouayGjSwoMbYDEkr36CVODNpd1Tr
	t6x4AwPclM/nZs8jBb3tDAtY7309BDux3NX65BrCF0KoXImWfSmvp2IVyhD5taTZmLV3/uZG6B3
	abEB6Re3mTPA6IfKJsMUIqvzul+KB7x1aRXr8iT7FJ8XhbWSX4KIKso9ChFGuTXT4+32B2+86ni
	E7tpkELYDdbGz1GeHOtTNMBPuMtGQJxiLARECehbBaoAYWWZ15GQ2EKYyb+Eq795ANKUNa7AQc9
	fVYAtYm1lKbRBSArn81ytbjEn39XxIXiBUpoddnm8YKQNQ1i1wa3MlkElTP/1QfAjIYpPceWDbe
	buaH720yAA5aF3KVBS6VRZP77nb0+lLPlgI6IvBM+YpcxBF0uf8hTcSh//raQZ1x514AuneNDn8
	cQM1wbHLS7uPGiZr0j8QpZ7dsuXY1rAhWwVh6SCzFONZ6AlHKjukaLYT1gKDg2PE7nNx7Vu5B3Z
	Q4yWbK/VcvwyDEzlSu96UhthRj4q+sR/DhkJ4kqXgwMVtq7kXIQiyW7en2QM2jFxtUkHtSehNM9
	5s4XuaqdMEQx4fQ4s9c=
X-Received: by 2002:a05:6a20:5482:b0:3e2:b31f:b3c4 with SMTP id adf61e73a8af0-3e7bfbcbadfmr6078616637.43.1793080205882;
        Mon, 26 Oct 2026 22:50:05 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc666e9sm2190321a12.15.2026.10.26.22.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:50:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:50:02 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: Re: [PATCH v4 06/31] ntfs: report required system file and volume
 metadata errors
Message-ID: <auA7imuJoZKDGzpa@hyunchul-PC02>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-7-liubaolin12138@163.com>
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
In-Reply-To: <20261020084421.2196486-7-liubaolin12138@163.com>

> @@ -1685,23 +1718,29 @@ static int load_and_check_badclus(struct ntfs_volume *vol)
>  	size_t i;
>  	int err;
>  
> -	base_ino = ntfs_iget(sb, FILE_BadClus);
> +	base_ino = ntfs_system_iget(vol, FILE_BadClus);
>  	if (IS_ERR(base_ino))
>  		return PTR_ERR(base_ino);
>  	if (!S_ISREG(base_ino->i_mode)) {
> -		err = -EIO;
> +		err = -EFSCORRUPTED;
> +		ntfs_report_metadata_error(vol, -EFSCORRUPTED);

ntfs_report_*_metadata_error() calls seem to be repeated across serveral
functions. Would it be possible to move and call them right before
returing from the fucntion? Also, could you apply the same change to the
other patches as well?

>  		goto iput_base;
>  	}
-- 
Thanks,
Hyunchul
