Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B10375F97
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548204; cv=pass; b=SkxBmAAjL9rJOIUajT/pdrNuHiN3CGEC7uA5e83EIbvNDPEosA7f0Y91kyUiu/FX3OdDV0W2lJsvID3YoDjfcQwvKEMN9Axu+ia9db8GB2hTBzvypkreMNScpze3cTnethDJkqdzkaZ1Lp9mU4v/M0cQnvU4/+Q9ckFJvO5kKEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548204; c=relaxed/simple;
	bh=c4KXW/+U4N+nFd+TSZuWBro4me1AHQbaFXcJAwQ+S4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHjjujUxDIkwdOTttv5LlNBJNgvfo/b6yBFaH4r80HXlyGKyhZg2ZrUtT0ccvBEaH2Th2+qtUZHXiSjustzRHULL9+TgaZkwclI7sPhCxguotJxgPkBLgfFXjyrbxVrBUBvjH9AWOTgVz88axupPL1BklolSI5r5HZyfotJzZUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQ88DDw4; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQ88DDw4"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so2580117e87.0
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 22:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787548201; cv=none;
        d=google.com; s=arc-20260327;
        b=BT8ZGbqTvGF5LiV1xqcFuiXALTK2NVmJjhoQzbnXbqKQldDGyel9s4Pupz36uYImwZ
         BYEdAhin44bIlsdRjeJlJXs+w3CueO12EGcCe17+MnLOizJr0EW0no3KWP29Kh7aPU83
         aGgvGyYQOFtmo3PVPtn1gkgx7EtYeY6VKmcaGWikfKBl/ABhAVQRSZJBTvm5pcvPj4XQ
         u9hM6C6OEOJ+9XXGjlBYh7L1X/nleX5QHYgR1TfHOh6M43HhYZY7i3LC6HjFYFITFMdY
         qWKcPqLQW7iD2I0kRY9APZnie/BWffiPYHqRXsNekBgCkj+aEItT6q7GWNzNBeB2fd51
         m5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YpnjSypwQ2J6HbuMu17kiGwvd8M88GI44T/eQuWZ/4s=;
        fh=3bZuP8CqM/zUwlyQCYR8xIFsI81IJg8ptfhyxRJlIyc=;
        b=YcZxfh1qzW8y3gLt3jYODlJL5C1RpyJp2hM/mjZApW2XdoKdIvgJvNKr8hLJqgvXYV
         QKX8NqRhWzY4YgsQOYoDSBV8t6Dz4MtPZxty3Ryaw5dylTxtuRihPeNLU/0LQORxyH9C
         yJB/L7IPSyNH81njdNtG0eEy7AM9JNvs/yg/AazvX4MrStSzDt4v9QzowYNO+B9wSJzL
         d/HiTZb45dP3YEIUmLUHRlih/dEy5IwEJdVu+hP1+InfGXCq0ckLmBeXU9yQkmld+daz
         iMVt7yl1fy7nw8IGflZU1BD2suBc77xVu48tMUHXABIr8NPH8rvEwkdEKCKcxjg5Nub2
         er7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787548201; x=1788153001; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YpnjSypwQ2J6HbuMu17kiGwvd8M88GI44T/eQuWZ/4s=;
        b=JQ88DDw4PKzPqMVr2yogRIOP7A4LbzndlOwDgQaZz9+TEanvcF2LKufimQqYfn25TO
         whd3k1uzA1tHfa7v3iEV73SB8eqEx+swCHS4u9QOx2ZUgboKZ8JpyERoffis/3PtNzBj
         iQAbu69Reg1PKenjN4k2TYcvX5GQBjAuGS2QDW+tzVRAcZ/ya5kka/uAhHW8USPfVKfn
         Ieo3YjlKJ0Q7F+Z+CogidyIah2IFoNZ4V45Il+eZ84OBLNzezB8Ye793E+/Sj8JU8BVJ
         7w5YrKgk+cXL+YoA8n68vG1zFpHk5sM9GI3TGGxq1xfj5K6zpKl9r1kYvLG+l3nA2/bt
         Dxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548201; x=1788153001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpnjSypwQ2J6HbuMu17kiGwvd8M88GI44T/eQuWZ/4s=;
        b=r0DbC7JOHVwdHBwZDUOQuHLmA91GvtH2s9wM75ZT4eD/gnbQnsFmZUNmz0MaybzZH7
         wUHd/ZU4oq5wn5CDFsvR8yrU+hHvvzf00iTeTpjHU8cPdUC2cCCfZLi3q2tHr81luGo7
         wMXDSBFUTvT9s3hD4rshrSTFn3PVCQbibQ8AzFAjZgQkJdOYIHHMamdSeDITbqEPwKjx
         Vcm7wEWiwcRUScYwzF9F7gUxLOVpMCz35yrkATHav+hc4S/K9U5tfqgw1L7b/LT0ABx9
         j0knmlUpk17DrPDK+A8XYgNsY6XX9ToKufFK99a/2L+SgwckfQurYrGaarNA2ZrBZidu
         HBCA==
X-Forwarded-Encrypted: i=1; AHgh+RrQfqhIyDE0yVUgGep5Qa+U8fgEDWLY+PxB93t9u1+/mLK6ipQl/mZk2JRB8MU/6nU5OR86@lists.linux.dev
X-Gm-Message-State: AFuF++khjDynp9bwAuNy0Urkp9ouTwAB7O+QfcxFtA7hz3YYNflwnFuM
	juk7Gs/d4Us1et2mSl9clbgasaZHCV6vIAlXyCPSIziaCUXeJTMRW2wz8J4u7WVQmOurVwPKyV/
	HusiH9x7+lRYVhQzvvQi6f7fv3nYxB08=
X-Gm-Gg: AR+sD13ol91FOyG6CeCQX6f0l0C4oFULM2rRc0PUppYgOMIDVEx4aJ0MwJiM0VnnA70
	DkrExnIsXP4NBTjX77j8Nx7Sj4ZQG4jgw5kre87Y49zeDC6tkwtYHzNyF5NC9Fe9iGkijr/kG58
	0RvuZB9w7cMviwRR3ECUwppUOAjiKNcN8PI1Z+JM0d4DmlQS6V8iPfsvN6x0O4tLdw7usBmLRzv
	cSR2PCKKN8CtuO8wLaBZGq5WDzgGDP+XD8RXIfrxYSpNkNgUUCFNeRfe/dh6Nc71WPrC2LKp6V1
	BSUo70KNs3sCrcGClXobH9cGRsMMOdISnKItoVrwNiJl
X-Received: by 2002:a05:6512:2315:b0:5b0:11cc:2279 with SMTP id
 2adb3069b0e04-5b484208ff0mr7134290e87.1.1787548200613; Sun, 23 Aug 2026
 22:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821053238.1281310-1-liubaolin12138@163.com> <20260821053238.1281310-9-liubaolin12138@163.com>
In-Reply-To: <20260821053238.1281310-9-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 24 Aug 2026 14:09:48 +0900
X-Gm-Features: AcwNN1XRWhv0_BEMBfC5ugzVO3Cctxwz7S_QzRhmLU6Imf8S7_rM1fEVRG7ZqMg
Message-ID: <CANFS6baAZz_Hv2Qes3O=VzCB-PEsQySp_3HnV6cc6LGfvexYsA@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] ntfs: only count successfully cleared runs when
 freeing clusters
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 21=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 2:33, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> ntfs_cluster_free_from_rl_nolock() adds a run's length to nr_freed
> whenever the error bookkeeping condition is false, which includes
> cases where ntfs_bitmap_clear_run() actually failed - e.g. a second
> run failing with the same errno as an earlier one, or any failure
> after a non-ENOMEM error was already recorded. Since a failed
> ntfs_bitmap_clear_run() rolls back its partial modifications, no
> bits were cleared for that run, yet its length still inflates
> vol->free_clusters, corrupting statfs output and the allocator's
> free space gate.
>
> Only count runs whose bitmap clear succeeded.
>
> Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator=
")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/lcnalloc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
> index aa2e017a4384..795f71d26895 100644
> --- a/fs/ntfs/lcnalloc.c
> +++ b/fs/ntfs/lcnalloc.c
> @@ -53,10 +53,10 @@ int ntfs_cluster_free_from_rl_nolock(struct ntfs_volu=
me *vol,
>                 if (rl->lcn < 0)
>                         continue;
>                 err =3D ntfs_bitmap_clear_run(lcnbmp_vi, rl->lcn, rl->len=
gth);
> -               if (unlikely(err && (!ret || ret =3D=3D -ENOMEM) && ret !=
=3D err))
> -                       ret =3D err;
> -               else
> +               if (likely(!err))
>                         nr_freed +=3D rl->length;
> +               else if (!ret || ret =3D=3D -ENOMEM)
> +                       ret =3D err;
>         }
>         ntfs_inc_free_clusters(vol, nr_freed);
>         ntfs_debug("Done.");
> --
> 2.51.0
>
>


--=20
Thanks,
Hyunchul
