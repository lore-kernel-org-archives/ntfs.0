Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34224348C5C
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 02:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787105866; cv=none; b=GljWXajF2sn7BRke09A4NxhoLa4rQ7sg6nVXkLqF+ARKj3xPgow5sg0nsTs/pnydu1Os8TyU0SfOUaNbiwWEvlQNfZ/8Ol77Z8zwsL+h9HRezrhy9id/M8cvI+0aQ1BwrPG+EAXYM7DOOXCLXir3Z48t58eAmT5Ru+cLCb+KuZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787105866; c=relaxed/simple;
	bh=n1wI5nHbuCgZ3Y7KzGRbp/pRLCeVdH6ZIE9DM0vGJJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qClgLsUUc9aGKiH3oz6F332xAo1rv1DpaE1/I5Q88QM+Cgw5BYbGcDlSzV0V8uWgnslbTieTCjmD0LINZ08q37EEsqmeAlIwA2LrFgbbtcbr/MYwH+uu3P8DtYJcJpQLyWi80tOPjlVXwkHiMXz39kPIaToQ2ZoQczzVrAGytQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdLIn9py; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdLIn9py"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3831F000E9
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 02:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787105863;
	bh=8gq/U+J0U5DTZQYefXk2BhSGP1xLN1iiOgXvNzTFUxY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gdLIn9pyjX9IE3CKrTpkyn9c/D6CbqZeAZK4Ba2KYzMAzVvQoHEJ4+T9u33utczNa
	 jRe77NEugKhk+gV7tPDRoCzLhLSNpeM2PAhhD5nyIcUjeOZRr5hCm/dtPGWDVpLkwM
	 Y3vrVAZ11wXeOviUx85rig83wVKnoFPOgs8I0gzMwlle+GKRw5UICFobp8t8bkuKCP
	 qG1FOjAr4n+PpCIGHdEX1C9KZ8Wt5obBfgiV0HC19mQTMvYKXulDpvDTJtk7Zvym92
	 Ds8x/zvP2I4GF+w9JAJjSNspGvvh8IhKSc1Y8wJGgYpPyP7GZo9Pjx5+rAB11pCLoY
	 o0mReJ8hgSkZw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2074710751so79115366b.1
        for <ntfs@lists.linux.dev>; Tue, 18 Aug 2026 19:17:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YxC7vbh00JhQYVNp29aUIgXIXJzWw1e+s2stOO/CfQEjmWvBkT6
	AC4BUiJOm3IXoHc9fZ9RYl0qagwrpuN3320Iyi2D2cyMrLwvb/bvyJQSYla0i/OeOnvWmkYT7V/
	ZWgvdbvI3c+xrbmKD/SFetYbXpeuAyQw=
X-Received: by 2002:a17:906:9c82:b0:c16:4df6:176b with SMTP id
 a640c23a62f3a-c242e3e6948mr49212966b.20.1787105862545; Tue, 18 Aug 2026
 19:17:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818-fix-negative-mft-lcn-v1-1-b7b0b206f2da@gmail.com>
In-Reply-To: <20260818-fix-negative-mft-lcn-v1-1-b7b0b206f2da@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 19 Aug 2026 11:17:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9TdWEMuMbd_uEuAW1whxsAJ_PvrWhBRypDNNHEWOTd_A@mail.gmail.com>
X-Gm-Features: AcwNN1U_xU6PlkK9T6uRny9PVvEw6F8bUnhWodQYBlj3NBGZ1wnRpAN183Z1e7Q
Message-ID: <CAKYAXd9TdWEMuMbd_uEuAW1whxsAJ_PvrWhBRypDNNHEWOTd_A@mail.gmail.com>
Subject: Re: [PATCH] ntfs: reject invalid MFT LCNs from boot sector
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, rtm@csail.mit.edu, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -755,14 +755,14 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
>          * the same as it is much faster on 32-bit CPUs.
>          */
>         ll = le64_to_cpu(b->number_of_sectors) >> sectors_per_cluster_bits;
> -       if ((u64)ll >= 1ULL << 32) {
> +       if (ll >= 1ULL << 32) {
>                 ntfs_error(vol->sb, "Cannot handle 64-bit clusters.");
>                 return false;
>         }
>         vol->nr_clusters = ll;
>         ntfs_debug("vol->nr_clusters = 0x%llx", vol->nr_clusters);
>         ll = le64_to_cpu(b->mft_lcn);
> -       if (ll >= vol->nr_clusters) {
> +       if (ll >= (u64)vol->nr_clusters) {
>                 ntfs_error(vol->sb, "MFT LCN (%lli, 0x%llx) is beyond end of volume.  Weird.",
Should we change %lli to %llu ?
>                                 ll, ll);
>                 return false;
> @@ -770,7 +770,7 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
>         vol->mft_lcn = ll;
>         ntfs_debug("vol->mft_lcn = 0x%llx", vol->mft_lcn);
>         ll = le64_to_cpu(b->mftmirr_lcn);
> -       if (ll >= vol->nr_clusters) {
> +       if (ll >= (u64)vol->nr_clusters) {
>                 ntfs_error(vol->sb, "MFTMirr LCN (%lli, 0x%llx) is beyond end of volume.  Weird.",
>                                 ll, ll);
Ditto.
Thanks!
>                 return false;
>
> ---
> base-commit: df7dce2090342170b7643d36f694204cae7792a9
> change-id: 20260818-fix-negative-mft-lcn-596257dd23c8
>
> Best regards,
> --
> Thanks,
> Hyunchul
>
