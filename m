Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538D16A395
	for <ntfs@lists.linux.dev>; Sat,  3 Oct 2026 00:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986744; cv=none; b=STy818rKhoXwJGj8myT2fk8z6fBnPRxvmO+c6HTV3uSboZd415m42He44FK41n3bYBOTdBIUwYZnVJeqkCgO06wP2NGRP76lcCKZa3hvDtx4ZhQRILtKB/5Ds5kAtpR77oOyOcYfZSK9YVywo7jK+si9DA0FuP0eb2/88S1v/bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986744; c=relaxed/simple;
	bh=jb8tDMN5BREbPPRm4J1x8zQ12bVCU2HD/D2M+TN+V/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQsezjcAbj4cGGm7M+chCR3wYzMbqsIq+mSDmkcJYbLWl41vHq6mPFp5wkzry2l3v1TFEi2vNEcDbpgtkFwsWgqDSxl38C5PLNiWqTLH2MgmbMuEUK3zgWB+SMSerkRXv47w517hd2CrHCdtFwBAAysKMNBD4mPyKZcihDOW7N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeStXf6S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeStXf6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF44F1F0089B
	for <ntfs@lists.linux.dev>; Sat,  3 Oct 2026 00:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790986742;
	bh=aC1MiZ6b5NL2ys9VFPiUcmJ37MsX+hzpWeJIpXiLRrQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SeStXf6SG7MWPAgHuEsvOjtZVH1LrhN7kS8i17tIaYvk3FxQTqk/RYzqrm+f7mKgf
	 S835xBRvkpSgUekFYHS++Kjit+bT/GnayNkfOJ4hAXhVXsRqSzeIjAoMz/Zpzq2Olh
	 EGggGUrQKdeTwmueQ7l7A6pZ9Vele8vK+Mp2g/XPXR/Tf1oVBThMD3pQbd+/EgBe32
	 gYgykohHjHrB99JFy0vcl4Kn4IGy//x+gFGJfCXaCHjV9JzKQXOAkZaxMigzk3tW/5
	 PmOg07hJqHzEDLdad8r5tOyKUhuZDdjixTbp3abMv3sr6Aei8SwHBazO1Xd7FKrGTp
	 qjp4epbjlH7Ew==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so93259a12.1
        for <ntfs@lists.linux.dev>; Fri, 02 Oct 2026 17:19:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdl+sdky7KY+bxgu4b72efViYN+pFWZ0fBtIgcsroHjTAx6iJdTPaLSs+aGAqswQmnRE9E@lists.linux.dev
X-Gm-Message-State: AFq9FYLRAbXtsaHNo+dyuf5Lf8tb/91mDdYiRPRwLJhFc9I5MPDP4H9q
	z0UirBTTePxwRushGBbZFd1goRJG1djGETzV8c8dIKMFyA4ObzOhn4dSXVCpJTQZLea7d6MuTR9
	74e0yupNPlf1/veYSBP2sQz84WukGXLg=
X-Received: by 2002:a05:6402:460a:b0:6ac:62c2:bd35 with SMTP id
 4fb4d7f45d1cf-6afad8bd818mr736705a12.13.1790986741312; Fri, 02 Oct 2026
 17:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790853718.git.matthias.goergens@gmail.com> <10fbacf8091e8e5aa7210b1c64750f20b655d960.1790853718.git.matthias.goergens@gmail.com>
In-Reply-To: <10fbacf8091e8e5aa7210b1c64750f20b655d960.1790853718.git.matthias.goergens@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 3 Oct 2026 09:18:48 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-agPFvDj2-HvjP3SLtG7AxkqUeNPqYyrLt-BN7fT8w6g@mail.gmail.com>
X-Gm-Features: AclHuK9duH6Hvvl-7okpEfFYSz6E6c3d6fFBnoO-JWdMYsL1H_i4ROf6uguQhk4
Message-ID: <CAKYAXd-agPFvDj2-HvjP3SLtG7AxkqUeNPqYyrLt-BN7fT8w6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ntfs: restart the zone search when the allocation
 hint fails
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin@kylinos.cn>, 
	liubaolin <liubaolin12138@163.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
> index 0d6cd08ee2e7..c58e689fb585 100644
> --- a/fs/ntfs/lcnalloc.c
> +++ b/fs/ntfs/lcnalloc.c
> @@ -506,13 +506,32 @@ struct runlist_element *ntfs_cluster_alloc(struct ntfs_volume *vol, const s64 st
>                 }
>
>                 if (!used_zone_pos) {
> +                       /*
> +                        * The run at @start_lcn reached the end of the buffer
> +                        * or the zone.  A contiguous request gets that run
> +                        * alone, not a second one from the zone position.
> +                        */
> +                       if (is_contig && rlpos)
> +                               goto out;
Could is_contig request still return noncontiguous runs after
used_zone_pos becomes 1? If the fallback run reaches a bitmap-page
boundary, goto next_bmp_pos can skip a fully used page and allow
another run from a later page. Since ntfs_attr_map_cluster() merges
all returned runs but reports only the first, could this leave the
second run unzeroed during fallocate()? Should we check adjacency
before setting the bitmap bit and return the existing short run when
contiguity breaks?
Thanks!
