Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2BB339390
	for <ntfs@lists.linux.dev>; Fri, 16 Oct 2026 06:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132881; cv=none; b=dl7k+5IUcbKlMKrMRcmS1fbsUb0nfZFDH7dpqOKGykQl6aHrYnxGmSCa/EskekEFH6ulZf5YyYNAtt+sGZ0jJmkShQ3GR7CANnxKJy26zoxjSlgEy+Zr4JdbLu2b+BkQcIrgACIHBNRcBAs4ZU/FJasdRlwXzoiXvjqym4CYk1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132881; c=relaxed/simple;
	bh=uquwue6XMvrkNm4eLUHCbGQnJxu+hxeG8rmrTD1b26U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWUo6A2JK8D7Aeup+HQOfwJw8Ydl42SlFeGanqOHiKlrb5P5h3mOOBwiqAo4xB9FKjiEJ2clNN/1icCMdQwqOHCoNX0YJvoaFhZhy536NbTOXhjncoaosItmt9skchN4lwguURMAwp0X3WOZTBcsSvDCewODcGaIOFVTmFwl4+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocsfRI6g; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocsfRI6g"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-881269371acso370297b3a.0
        for <ntfs@lists.linux.dev>; Thu, 15 Oct 2026 23:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792132879; x=1792737679; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDpkaSjwddvZNua2Q0fpfEhsFLxnpvVyXp3SeATwy70=;
        b=ocsfRI6g5Nbw6HWsugQZGbAZuAoT1XiQ1GpUComdOg5ZKRhOSnKEM2OE3cjXxYXPKN
         GKOn50oRiO+4GbsyNCYXVpA+GRKSBrgML7WeCXuw/Wo7nqbbfOGJbgUI1IABfpqPkrwY
         2zVvZr+TSXWDR3Fi9/v54hRdJiw4gWGwalOhGitgYNvtrZxS+wEvz8IJ8pnDfnEyKaAO
         4POGMYlIstaEux31wJnIUc5tb3JuqDRMeF+HcXH3jAt6ufsaIncnJjm3zhj+8exjn7H+
         h187wj8YKIKEUfwaX7+2IA7IHChNnOxrQY2p3PVwLlhSsBujBWi58OHDPRXn3meQUylQ
         vSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132879; x=1792737679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDpkaSjwddvZNua2Q0fpfEhsFLxnpvVyXp3SeATwy70=;
        b=ELCUfPhuRRrMqgg6chsq0+wq5MZhRkrbRwbjWlOJoFgSFDNBpW6ACpsrs4ivUxWh69
         +ZNqRAO2QMwQPwhL+gCOqLun/rgWFNETkd3Gq4N9e1i1kz4jNIZ6KmkBexyPTxTVhD+j
         OyTjC3eIrZCTpDKHi/Wama2pMI2JgTTU+po0ISW2MejCdKplRr8GHqz3f+iyEIcQphGC
         B7YIGgcs3mrx49y3NXoP5z1XYtjI971095ueX87IqPuZPRDsWLjN/daCe/Qfv5PNGfn2
         O2+iSq2nsJB/Nj7MlzaUmrOOy/bjt8TsTkMJFs9558v2wyL/KS9J3UMU9EqcQF+dFpEv
         5gTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqVPmDGHVgk7QtfmOa+Yw34gcp3PxheB0FFaN1oJNEgf2kZEHw6tRqxH5VGXAR3VZsFhdI@lists.linux.dev
X-Gm-Message-State: AFq9FYKg2bedGavCM0yZiVIpGXUoJ9WEW43DMDjRe0FsjchH6ax/zQOg
	3vYN0Ocn8E2K3UU2+t2sHx4qyIogZoOVcc/CIXEHIXFPMZ/rPFc21l30SNCw5292
X-Gm-Gg: AYBFou1yBFVwCOuan8b6dXMUiGXXYKH7ZZBtQlYg8BOVbrxXeeOaXzmmatDtop3K+NS
	BLM4tzInENPxfFk+T9mw9x5wIJB2YfuigZTigkEMhzyg4biKtmqriot/rSzbP8hDVdoKXRsOort
	da8Yn+qrX3RF10In2Rrcdnmoz6eYnbl89V9U0+n/j9HrvhRXHCHP2HvSfa1Ou+eTDfWom7WPY1c
	JeqWFJKdWrwTRU/RW5LIfOfSWoBRWva15xUlAhurHzbzNseKS0Y332M1b3DI7nhTp/ImDTVoJe3
	dSnHXzIdWjFcOpy7oWWOCtt2ch3chdJML5vUsrpeLpNo/6O8fmN5QkhT+eecIbZa86RQ/c4I6y+
	OtDuSyT9l94vf6jn7vZ7ieK4/gWhuSKIGhqp3SEUY+lBbFT+fQWtaqhHIXcVOHKd90+fDWACCTp
	wz0Zim1GzkBIeAHJSzRHf/4VdW9whdCgPVtfAjcHLNvg63lDD+ZqkldBV6IQ91
X-Received: by 2002:a05:6a20:b787:b0:3e1:1b65:fff5 with SMTP id adf61e73a8af0-3e20223fa32mr1757919637.47.1792132879466;
        Thu, 15 Oct 2026 23:41:19 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65ab63cadsm231027a12.4.2026.10.15.23.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:41:18 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:41:14 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v1] ntfs: support persistent noatime attribute
Message-ID: <atHHCvRpa1cP1fRH@hyunchul-PC02>
References: <20261016030957.1053110-1-wangxuewen@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016030957.1053110-1-wangxuewen@kylinos.cn>

On Fri, Oct 16, 2026 at 11:09:57AM +0800, Xuewen Wang wrote:
> NTFS currently rejects FS_NOATIME_FL in its fileattr setter. This prevents
> users from disabling automatic access-time updates on individual files or
> directories with chattr +A.
> 
> Store noatime in bit 3 of the private $LINUXFLAGS EA and restore S_NOATIME
> when loading an inode. Report and accept FS_NOATIME_FL in the fileattr
> callbacks, updating the in-memory flag only after the EA update succeeds.
> The VFS then suppresses automatic atime updates for the inode, while
> chattr -A restores the mount's atime policy.
> 
> Document the new on-disk bit and that newly created children do not inherit
> the attribute.
> 
> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
