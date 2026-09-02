Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6892E738F
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 01:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788312163; cv=none; b=Woi5TD6U4eV36zXZiGkYwsPhugchfrls8NC6kTsmKQgYq8vTYqS+ylgTCeC47a2OPhmGRo7f0bXUz9mumFeLyuXzVDIRpqhFiQ9M9KfmptR4nfQ+bWREMQN4MQc9ygbbFkPtboH+eLPGkYbGlhQ86OWVzbBnKmrKiMIzNVTQmjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788312163; c=relaxed/simple;
	bh=yj0ghCrRDxJccOkYZ8+jq567DDQX3NLBqP+W9Grbvaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=smCPOgo7pf2/kLQ0RyETbXsd9aUNzrTfVYgqG+ATvBD+exlJat/41IP5lhu27irbULTpQpFouANX2r5o/3geNzlr4kqeBJpMvQ2/+ev1YJnXz/5nN2VZhm9dCz0yxBXH22l2iDHVSqHqpU0TaDSR7knWgvnGcoCBCX0YkD0yjBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiKhDW8s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiKhDW8s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198A61F00A3F
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 01:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788312162;
	bh=yj0ghCrRDxJccOkYZ8+jq567DDQX3NLBqP+W9Grbvaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EiKhDW8s/2zwV01oXmTT7rVoGPH0bP5TqGZUwWqrYubMOdCxKwj03r05rf+75jyWc
	 MCPsm88Px9tVo9fkg97QGwf1J26dLVFLUp7MZCiqtvwqQ0nbiFre36eYCt3Dwvco34
	 BuuFNKWj+T2m3Igofm9zEfcoiwKUCzamBYqZ8EOY01xJTJEP8U1TP2cSFXV8WPdHXd
	 wl+vBbBpFeTwusVPrk+4jgAlBFbeudipFoQ3cTP1tQRuU0IhFhS2M0mlkTQxsMk52E
	 JTSET59VRRzR5jkB1wqD/SCFFqbu1vVgztKqfLvvYj0HmI2Lg5FLXV8/d/BIIlPvE3
	 gslvkV0A0xb9Q==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2569aa5116so252307566b.0
        for <ntfs@lists.linux.dev>; Tue, 01 Sep 2026 18:22:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpx8ZXF9mGf/fg/39brwWEPyx9xWqbl2ClyTRRi9b/F98hj2xDUSpp2BrYWJSfo7Zzkz9r/@lists.linux.dev
X-Gm-Message-State: AFuF++k2VhxqM0zE62EWUOEApPfxWsXvwLlq+3zTc/SA0YoXMQLgTKCO
	6Dkaoo5DqZks4eIptEt1x5x9lmnpUHBi7bXIJjUWQJ0M+pcnJPjlcW9xidwffySZL+7SUBtZZMp
	sudHY1700GAzTSIP8z/Eny2NuOvCKmzM=
X-Received: by 2002:a17:907:7295:b0:c25:cb79:e4b5 with SMTP id
 a640c23a62f3a-c25d5c31e5cmr56186866b.3.1788312160667; Tue, 01 Sep 2026
 18:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901091519.2885376-1-liubaolin12138@163.com> <20260901091519.2885376-2-liubaolin12138@163.com>
In-Reply-To: <20260901091519.2885376-2-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 2 Sep 2026 10:22:28 +0900
X-Gmail-Original-Message-ID: <CAKYAXd94Hy-cEXAsfibh+B66774rg9wALwPWGfir91dqJWTtgg@mail.gmail.com>
X-Gm-Features: AcwNN1XXbxe6Otml9DNYEiNpIrjpOc4y89piP6Y3dHvqDp6vejv__cFNFFaYBBQ
Message-ID: <CAKYAXd94Hy-cEXAsfibh+B66774rg9wALwPWGfir91dqJWTtgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ntfs: implement fileattr_get and fileattr_set
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 6:15=E2=80=AFPM Baolin Liu <liubaolin12138@163.com> =
wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Wire up the fileattr inode operations so that lsattr(1) and chattr(1)
> work on ntfs.
>
> fileattr_get reports the compressed and encrypted state of the attribute
> and the immutable and append-only flags, the same states ntfs_getattr()
> already reports through STATX_ATTR_*.
>
> fileattr_set accepts only FS_IMMUTABLE_FL and FS_APPEND_FL. Compression
> and encryption are rejected because changing them would require
> rewriting the attribute data. Both accepted flags go to inode->i_flags,
> so the VFS enforces them.
>
> Neither flag has an on-disk representation of its own, so a value set
> through fileattr_set only lives for the lifetime of the mount. Note also
> that S_IMMUTABLE is re-derived on every mount, from FILE_ATTR_SYSTEM when
> mounted with sys_immutable and unconditionally for system files, so
> clearing it on such a file does not survive a remount either.
NTFS forces S_IMMUTABLE on system metadata files such as $MFT, but
this patch allows userspace to clear that protection. The patch should
reject clearing immutable for these files and for files made immutable
by the sys_immutable mount option.
