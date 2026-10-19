Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06711481244
	for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390494; cv=none; b=h1yC5imVq7ADKCTMC7GyNGc5YMqNeZ9Mn0X5BvpjdySht2Ru+jRd+GJ8bJ8t7/RSSL03dbABFahyzz0oVa4an71q6HiC7kh+TeHUrhfSxyeb+XzTjoNPPq2AfbLnXJn8OfdQlYROFuMrZF9Zq5Apsw1AFbvnV5nxDx5FaYMjghM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390494; c=relaxed/simple;
	bh=hLviHrUQcnY9d6Hs59o7A7DhG6hJV3vxIcScsJNeYyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDYP8HL8qyuh1lnz7lSpnoLFVjI+grYm+P155hpQSna2Xz8Y95PclxJbaCKCaMLFV+qTiI8OURf0A3clr6Z/6wyEO1MhHT2TEE/zjJr+3e9k2MZRhQM33Sy4CPJ6lHhSe5b1ASF7kNZy3crIVDUtlq42wRel5ZHqq3TLC9bUOqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsAMJqf7; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsAMJqf7"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso597101a12.0
        for <ntfs@lists.linux.dev>; Sun, 18 Oct 2026 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792390492; x=1792995292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CH7/2Pn88Czop2CrZPadAXkcJAGF4wsEW/e1YNB1cxQ=;
        b=dsAMJqf7dGqTZbGxVwLIoUuVDVwEDvCxwVuBj5CI/eDj1bbHZ3NC9iHtp8dQdeyUbr
         Y8T5Bl2a51xi/U4+iwYIZNh604Og8hdoiFCLKPme5OrY5KbJYq7f/qniob0HFZ3JDiBR
         PRkktCBSlM9qzBUv2e55Gg3RtZxgGOorIodImuDB/ukDbvxB6C1kyJpU+yNx6lFaVeV6
         rdLkWonVPMZ+fvlJYyPRcscixnoKjIDPkYlZ6akbAtvdrydVEA9jnsT8CoUexgEHQ9T8
         +DXew2GxAp/YH2I/cZSUW4hdbweiQuP7rY1SCfZkiABYKwVYeonNksowNQXmCgmeXKq3
         rXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390492; x=1792995292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CH7/2Pn88Czop2CrZPadAXkcJAGF4wsEW/e1YNB1cxQ=;
        b=qTlKbHSmL0V2D6PTGUslZvPrNY6qEz6pyKri3+xD2pbTqZM0yB88d2aG9Ci5TE9Maq
         PHWvMEPoT7oNS/SleX5tDYR2ACGmV9WPPmrpEXJU84j4Z0G9HW1xNbV99cgVdpJKVB9+
         k0ToOtOD5OIePuPSMGZOacgRwew3dBQcXdpxRY774iRDveL7xeA/zLvXJATazbtGFp2J
         iU5ImyKjv9jTVr+gxdtTWlORj/ZXEuFnXcjGRcosRUt2sZ6LM1dGcIA2QfGCJRxjg02v
         QqeUm2jdb7RR3FzBXOLcKcfL7UsuaKu3JLrz7hX5zsdqhHdLLkMM1WDUfXZGQPIsmZiS
         jQ9A==
X-Forwarded-Encrypted: i=1; AKwUvBwbMBw57ZafY7cK586hUEzj4qh0ckE3PeaMPcwYtj7+ewzu3gsR1NbzCWBoYoPMRDrsi7u2@lists.linux.dev
X-Gm-Message-State: AFq9FYKujMKmY6cId02sF3ZrFtAytoYPI/3l1kymBTbrTSQ8Btl3Dqot
	03NPAUivZgCRvwoSzV+aFm1g+hLjaWbu7LKtTXr5A09+qBwHusCqrwbX
X-Gm-Gg: AYBFou2u5WT3RG9Wew7W9ESzWrre6Gf4XaZkdHvgM3A+36t5LEFRjtme0fHq7o2r77u
	GNgjE0NiHYOH7BXaFjcGb5k6so5QTG9DZIvhSA3KubsbkVHPav2Rk1pDmIua4lRPJsg0YWnIzMA
	dvvCD6qmf2uIny2n/ATQBdbj9WW+1EkdgBJk5aH6Q/JpfJTw4jeYA+FJ7drtDK/QTHuIX6C4/7V
	Wg78QAuypT+xrdek/SZFeWS9wLtvWYPi3NMQpBdjk19uwJxqug4kjeS1eq6/X393K9cYftyiRLb
	/6q0vldwoI4XuAXrwqdRy80ZhMgyUBoIld2lbkPPOGPzwK5vHm44ExMq5mitjCFAB95xXvNPXLr
	nPpoe0Lhg1wL9pYMvZGRrEB8mb33IuiugvBYrAmFVmK16r1Gx9Em5/AN53WrJvJG/lekB5NdjHp
	0PhEBVJ3JymprMyotJIbzduj6uPCQy/dGU1qt/urL95khPuoNnVZZFjaUW93u9
X-Received: by 2002:a17:90b:3851:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3aceeea8f3amr5078332a91.35.1792390492104;
        Sun, 18 Oct 2026 23:14:52 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm19035101a91.12.2026.10.18.23.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:14:51 -0700 (PDT)
Date: Mon, 19 Oct 2026 15:14:46 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>,
	ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	exfat@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev,
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RFC 14/28] ntfs: don't set SB_RDONLY after filesystem
 errors
Message-ID: <atW1VhJXAIvtYPfd@hyunchul-PC02>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <20261012-work-fs-sb_rdonly-v1-14-60743a3dc326@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-14-60743a3dc326@kernel.org>

Hi Christian,

> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 4066bacabe37..12ad2ce938ba 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -269,6 +269,8 @@ static int ntfs_reconfigure(struct fs_context *fc)
>  
>  	ntfs_debug("Entering with remount");
>  
> +	/* Mark the volume dirty first if an error made it read-only. */
> +	flush_work(&vol->error_work);
>  	sync_filesystem(sb);
>  

    if (sb_rdonly(sb) && !(fc->sb_flags & SB_RDONLY)) {
        ....
	return -EROFS;

Before this patch, SB_RDONLY is set, so remount,rw returned -EROFS. With
this patch, sb_rdonly(sb) is false, so remount,rw skips the check and
return success even though writes are rejected with -EROFS.

I think that the condition should be test NVolErrors(), for example

    if ((sb_rdonly(sb) || NVolErrors(vol)) &&
        !(fc->sb_flags & SB_RDONLY)) {

-- 
Thanks,
Hyunchul
