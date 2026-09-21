Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1C04A33ED
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000252; cv=none; b=oRTXoquQya7+gMGmitbYS+JdIdFMQzzcoF5Fm0bRO05sDwWUp8D8z8zO6LtpTBYoM623DepmchpvmLllMBmJsue7MufOwtAPrUfKgTGEwD2Py+63Fhg/CEqeVPBgUkcCZOfv1ESOvrjJisnnTCBRSB97x9O0gXuT7eiHGMkmjCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000252; c=relaxed/simple;
	bh=uV/HdIuJFTYRnrBlT5tbRtXzXZIq3UnaIYpogTFQYCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBEzYlDC3HXjWP6KD+DUzYvD3kHHsJ8up21fcy4YqRH0JIo3EQdEwIjeCBu6JE7a/nZqKMi9uwD183lLhSiyAr+hWGThsUTzmrNDzmQeq0E27ueh/5Ho9lotVHVr+MaPMfZb8Zg04ljPUJtR6x/xSlQMbaGNCJLPZpSqmZRRCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5rjHPeE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5rjHPeE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5281F0089B
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790000250;
	bh=uV/HdIuJFTYRnrBlT5tbRtXzXZIq3UnaIYpogTFQYCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=V5rjHPeE62PtkwUrUj5XrThEbA77SGFCtt0C2X2+F1ySwNdfFES+uUzD+WRWos/XP
	 mq2qFhsq9MalbFNMHEDWQ/Ye367IK+DGgx/ihhecLyCdD8LyiVt4QJQIEyhEerC35G
	 zq3oI23jkgB65HVXLAQExujy/JODO7dxBqM+s23v5sJPWNM9lnYGqNffALkDLXivzY
	 eXn57Hr6wqEygIQ2/DEfwVCxHNn8tup/Ki/DcBlK1QWTmmANmzXnljMqY3SSa1Mpg4
	 bwcqi30AE5ypDNUNkFO5nmKqo76jLVGd+ytapJ53FzRUnwaRlInoZoeQqPat6pCsLM
	 lS8QSVGXPICCw==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso4420379a12.2
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 07:17:30 -0700 (PDT)
X-Gm-Message-State: AFuF++lR5fmsddZJi7EryiivwAKg93f2KNW99n3ukYf4ySeD8epqXH+2
	SqkyQRzxHMuNiq4tgDB1adwQcswT79lR7c29BUbY/jtvqw/VMjVO6qislIKxYBrA8i9hhy5IGwS
	PjkkfAq3uDJ/SbH8JQEG7LAVS+rgL6h4=
X-Received: by 2002:a05:6402:2712:b0:6a9:98dd:afd1 with SMTP id
 4fb4d7f45d1cf-6aa53cece94mr7420106a12.37.1790000249117; Mon, 21 Sep 2026
 07:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921095333.94659-1-hyc.lee@gmail.com> <20260921095333.94659-2-hyc.lee@gmail.com>
In-Reply-To: <20260921095333.94659-2-hyc.lee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 21 Sep 2026 23:17:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-WDBLwOETdqfg9xhNAPNe0FsNKtGVX6_Sev=PPTpyP8Q@mail.gmail.com>
X-Gm-Features: AcwNN1WmP5xVlphfX2uQkxdd6TKenNH_PF00FlRhXgxhAGU5HR_YaDlZtkUd1FQ
Message-ID: <CAKYAXd-WDBLwOETdqfg9xhNAPNe0FsNKtGVX6_Sev=PPTpyP8Q@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: require page-aligned full-page attribute writes
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, Baolin Liu <liubaolin@kylinos.cn>, 
	=?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:54=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> __ntfs_inode_non_resident_attr_pwrite() treats count =3D=3D PAGE_SIZE as
> proof that the request covers the complete folio. it allocates the folio
> without reading it and copies at offset zero. That proof is valid only
> when pos is page aligned.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Cc: Marek Weso=C5=82owski <marek@wesolowski.eu.org>
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks.
