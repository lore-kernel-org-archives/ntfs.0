Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC80643F0A8
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241017; cv=none; b=NQY5621T3dVW6NZibcjH8vlXdw6yUIClANVGm6s2KzMxYsk/sz7IWS/e39fyUnWdRXwQI65ucmRbp1y5LL4JSAoCVA9flHP9SkoesreVPULFVYQNU9gtM0sO82W2LNWewLZw/GKQqHUl4lOOxrPxk2FOLwFx9o/m+uXAYxmo2U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241017; c=relaxed/simple;
	bh=7uEHxsgEEWbfXSBtdV00xO4YRe9KGT4M8Pq8AI20HD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6qUMYIrSgklI50qGtA7X/xFrcnOH/8CxI3Ot2dwiHu3A0QL4GxGlDgQn28sIu4m9e+mYb6N6ztU5RtrXAwf83X0vfQcn6sgKv4+aD9E6nxAhMJ/qxShhUjc0Czp8L/MSviSdTcnufPQ5vPeHWa/KAFvvBfisrg7SHb2Z6otuMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8RM38gM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8RM38gM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0161F00899
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790241016;
	bh=pvkzn62xsyMcI3eTrHQma6sMJwCxs8n+dIhKQeqiiPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m8RM38gMXTfZQ/dk+iZ2zMQJtfoK5eBfePx9S7CmshdbTG7gP0cvAfLOHrNc/ztWO
	 INXJDS/ERiXkbq4Hs2InjQOqYAvEF7UjsO7X9zc35DwyCMGTRLcOelsIcJgZAOvPG+
	 tx0ZUaOrohXSClIYeFpJ/HU1HQfUh4Df42DgDjDSJYsWyVpmVHux1PLG3koNcFraIL
	 nhiuRHpLMF5YJhhUvDSpE9vequwXKHWTid5aI4HR2Mxot5eChDndczMiy+//NpOjzi
	 V9Hx7URcPF830HcORRS0dow+leFFDi6p27HlQkQ5dLT4wjtxl/jj+bNUypRz0FmoO1
	 2dsxrJKHqVQQw==
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so229131866b.3
        for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 02:10:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzr6CqSd+Dj+AI2doVNC2BKh9J+t5K8bGQ7pM2qO+Cm255LJc723YRtcaxixxEfTJqy3eyQ@lists.linux.dev
X-Gm-Message-State: AFuF++l8qE7Gg00asoXiQFqDVxsQSKqwHcg2MPPt/aGSl3NNG3goUxFe
	t2x4SXZKdH8myq1UVn6sDtHIDdt/gkpHX0Q07TPttGPRXm57PUuoLShcnM2uVxsydr4Jr8kn5hU
	jaut09gxfmyrrDHEg/8se7XtkBUkVOHc=
X-Received: by 2002:a17:906:7947:b0:c29:d3ad:4f72 with SMTP id
 a640c23a62f3a-c2ac52a245bmr96844166b.16.1790241014947; Thu, 24 Sep 2026
 02:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924014207.1678305-1-wangxuewen@kylinos.cn>
In-Reply-To: <20260924014207.1678305-1-wangxuewen@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 24 Sep 2026 18:10:01 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-MXbNht9r+Sx5+pHtcKVfSdxQ8_9Ob4YB0eGkVL5zDhw@mail.gmail.com>
X-Gm-Features: AclHuK-w4Wgn4QaeXn5q7VW_3VPFZGXvTtxIycWSTlRFCgUYGI6cKT8RiJ9pvOo
Message-ID: <CAKYAXd-MXbNht9r+Sx5+pHtcKVfSdxQ8_9Ob4YB0eGkVL5zDhw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] ntfs: fix MFT bitmap extension allocation
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 10:42=E2=80=AFAM Xuewen Wang <wangxuewen@kylinos.cn=
> wrote:
>
> This series fixes four bugs in the MFT bitmap extension path:
>
>   - The adjacent-cluster candidate can be outside the volume. Check it
>     before accessing $Bitmap and fall back to the regular allocator.
>   - The allocator can return an adjacent cluster that merges with the
>     existing run. Preserve that run when rolling back a failed extension.
>   - Rollback can wait for the initial $Bitmap scan while holding a folio
>     the scanner needs. Wait for the scan before starting the allocation.
>   - Direct allocation changes $Bitmap without updating the cached free
>     counts. Update both counts and honor per-page accounting and space
>     reserved for delayed allocation.
>
> Xuewen Wang (4):
>   ntfs: bound the adjacent cluster in MFT bitmap extension
>   ntfs: fix rollback after MFT bitmap run coalescing
>   ntfs: wait for the bitmap scan before MFT bitmap extension
>   ntfs: account for direct MFT bitmap cluster allocation
Could you provide more details on how these patches were tested ?
Thanks!
