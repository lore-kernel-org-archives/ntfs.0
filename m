Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A04A9D61
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531673; cv=none; b=Ms4/seJNF7IfPzD4329rx52FvN0lG6Y0DIhTytMRLhtdHcxH9HCXI4JPyYIkwu8rM/0xPgUTF0dIxqYxrJFZg1jL6cctq2EhB0n03nEZBDi+LA4vXHJf3SfmBQKNAHPtg42XNsvFyI7ooQ9o+yvu+rLu8qgb845bxw/WenDwJmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531673; c=relaxed/simple;
	bh=NeBnIrH18xAqXQiTHvvp01rSHsDW2BUroEcS/dwrxIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJNMVaY0dlFyySK7ZQEgPCPpNHRois01tvYZqAVUB5q89+g0tcoW0ow1SrvhmluliLFVxk4DnUlpBVRF9vjd9DcRyfRFhmhMgLtIpep8tcElUAhMyhDRvmO0lxTIe8n9jim9jKMozS186SP4hyZKVLx0kkZlsF53iQmAjtdYqrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcrdzQB2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcrdzQB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152171F00ACA
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 14:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788531671;
	bh=G6Do1pnQ8gB9LNM15RMOJ8sYBZDiMWThp6aWrUBP4fw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BcrdzQB2Y1TzdUctwuCRYEWXdhlTnRTIauZUs8eG125CLanl8st4eH746+sC5oqxn
	 qBbb5ZRmSkBKtZRdh6v+47pdReYDENUCzCdmaNqZAG4NjsV7EZQP6My7mW5AX5ppJb
	 A++HuTocmobN0JvVqPPL/2LsDhVDCMDcyprs4V4wSohtKzRnyyTSyldR1EgPFAtXSh
	 EVa5B+b0sZrwBeIv4BUyGHSd50o+95n0izXqjafao44tRpx6jjuMBYfUQwMx8AnDJg
	 ZVGlmPSfaVkzsyDRTjKL4NE2cY48VtjWHsvme2VCEcTB/UeuwXRz1r13Xnif9ftwXV
	 BlicwAt5TfgVg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1670dad7a8so160487966b.3
        for <ntfs@lists.linux.dev>; Fri, 04 Sep 2026 07:21:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJHUrc/48uKVnfqH5kWyqyTsOxUiVnPPbKPUfb/qTFRleRtEFTc8Umbj6l0FAKbHmNefkJ@lists.linux.dev
X-Gm-Message-State: AFuF++njgl3Xyh1AKF+yr8n+54M+6JqietXi4N2HgtEEO0Xi//xx1G5F
	8rHbHBI4X/r8/N/98TRqBSpWlhJL+UkKdmobLH4W9fAlY37xDFWh0HMCyhPIFjFHx3nyllx/oca
	vgQ76aJLijhCqY8g4BmNGJocCGZtf3FA=
X-Received: by 2002:a17:907:94c1:b0:c26:19de:9134 with SMTP id
 a640c23a62f3a-c2619dea036mr158064166b.39.1788531669724; Fri, 04 Sep 2026
 07:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904090054.3365538-1-liubaolin12138@163.com> <20260904090054.3365538-3-liubaolin12138@163.com>
In-Reply-To: <20260904090054.3365538-3-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 4 Sep 2026 23:20:54 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_5ZcxzTP7OD9yv+ns-KYqjz2-BKaNmdi4YmtbVxJBq=w@mail.gmail.com>
X-Gm-Features: AcwNN1X3d-mTLZGydCG9B8LzZayjPb117obymelYl-4TEMTeSdjC6pdgkj1F9ZY
Message-ID: <CAKYAXd_5ZcxzTP7OD9yv+ns-KYqjz2-BKaNmdi4YmtbVxJBq=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] ntfs: fix error handling in ntfs_extent_inode_open
 and propagate errors
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> @@ -2968,8 +2967,10 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
>                 i = (base_ni->nr_extents + 4) * sizeof(struct ntfs_inode *);
>
>                 extent_nis = kvzalloc(i, GFP_NOFS);
> -               if (!extent_nis)
> +               if (!extent_nis) {
> +                       ni = ERR_PTR(-ENOMEM);
It overwrites ni with ERR_PTR(-ENOMEM). ntfs_destroy_ext_inode() must
be called before doing so.

>                         goto err_out;
> +               }
>                 if (base_ni->nr_extents) {
>                         memcpy(extent_nis, base_ni->ext.extent_ntfs_inos,
>                                         i - 4 * sizeof(struct ntfs_inode *));
