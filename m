Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED4B37996C
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 05:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548332; cv=pass; b=s9sgtt5aTU3MBPeHJR61AaIUPfFPTdeTblo6CtpfH0SnVKc8YcOMpN3yG2OMq9zDi6jplKBC+gB8nervuUosrczY27WlwAU3HAse4zH7RDd6tFm/tgTdX4SBWOugvqqWYlOAcEFhq+EMxn8rZhiPnLFKD/mnhOHsy0pjxxDKyZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548332; c=relaxed/simple;
	bh=/qwqJ9T+/6/W7k6i/MMO/gxbotFD7a9Sy1Dr/Cc5SCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPojmUE3dwUrpzA47ANRX+u/AZUH/zNnML8CD+cXOM96heLwDWl3uHB6kj6905BnJG8R+7BZ0evASfHnmH8tdek+vOAhkGgUWjQ9Z8+Ql2va4AWgYXEOgo2lWb0IqftId1P0OujDLPkSiF4kxrUbl8l8kzdufcnFXVngPhq80Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSicoXlx; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSicoXlx"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b48ced973dso1948290e87.1
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 22:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787548329; cv=none;
        d=google.com; s=arc-20260327;
        b=FwoMg48dC1+x4S5ReR+e5tjmuVEGPGsAyHnFP+9f71Jk/Ls2Df3HW066vBIJvVqvtt
         oAaxRriwJKQWvX1qgZI8dXEJ4tEL44R0Q+fi88+7dgyXQIXAY+Oqm2oS9Jih5JmRyT+i
         2KYPaQCPM7Uq7zpLfnjR4+hmJ49tsk8apY8YKUQ4m6SP/bBCXyP7cyiSMkuX4N0ufq3J
         PXtVe3tdmB2KcdxVqp+g23xDujrsp6UIoUjUqZmex9gXcUEp8yRHwZ1m2kDvPsoXsIfk
         0l7tO0t0zeIc0QnhSi/c1SCLg0scLn30D4wcGnpA9rH9NxVXBMHIIuPhDnU3NU3B2x9v
         mMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YHby6Osp7wpSOEvUX5tk2q2qCWOGTnF/+lGVwveGKMA=;
        fh=rqKMmLJHr542Snat+c4yaWfzixEbXVD3xxNDYQHfIuU=;
        b=PawSXtekvNMqRDotl78hBCyEyKR//jQcwzCH2Xts8I5/ogiKPy3wG8jeWOOR9NGFYt
         QQK/CWz5M23wiK1/Xhu9zxMvlLY0dMtwc4Y0KqcNqCj51OO6qRS3gJZTN7Doek1gy3fJ
         1Cb+IhA1040XBVB7BFdpJHOw3zvGXc0u3ztxSnZAC0h9Fym32OAz+5qgARIiRYs4QVDR
         M86wjSZ2oYOlMtV/lhccwDh8WXTpRj/n4AXvIDZQonqKf8LXrN8FmzOzT0Ag4LEzI1JK
         m3x9oR0izmTEPow7hIHH4WZaLmwVMV+GPgLqcgHlN0LS5v/hpcHb6ev8XC4XbnoojoSP
         LcdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787548329; x=1788153129; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YHby6Osp7wpSOEvUX5tk2q2qCWOGTnF/+lGVwveGKMA=;
        b=PSicoXlxsqPJXrBVEXrq2Jr7LCF3uxlXbSK4idK7Ic4/jNTqtQ+0hkwT8N+hhX8RBw
         XS1ovkd4vlickOEegkseKsPaIjXzx3f7aOsNaudQckQwfxJ2/yOpPUadrMUo7haFDJSu
         YBb6M0p6CuBlwdeulh+obiiFYVhur1edAFDyHGtDGrneMA5Wrt6HXTEobMZ+GAwpMIll
         18qYJy1kfPp5L5hrkFM5P1G4DhRWgIiY6dedexDAChkYkv27wWwRaw+1EhVELPr+Tn77
         72+m6SesVZ9Px6ArM/uI/deVDWY2QxWaaS+56aBqO5iL+htQCzydiy+oV0m2G3mlOzqu
         XsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548329; x=1788153129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHby6Osp7wpSOEvUX5tk2q2qCWOGTnF/+lGVwveGKMA=;
        b=JnAV6R58YctGneHRMAlTPW65qMCpJL0CvIlfU5BmCqz0OVYpkTbYfv/b7EZyclC9hp
         81MNav+FsbIn5LpOCjMagpg7RLQpfINZD3KcEJRD0Rza3gvynP91WHxwxtH/pjlfF8ak
         6rax5X1aed6gRAth6JnHzPXtk+Q4olEjsuSTJ1jkEFY9ANXhZ/uFKcpTJcmtL1ulBqHx
         dj5R7sYQ2lh6OKt2RCf518mDKzGU2mDes53+j29JrE4a54ZFskVm+F5ucHMfbklAu/ft
         gfttmsZL0eLafKj/fKeifQzeYEu5DmODwZ30DtKS3Wu9qjyMVWTW1qApVsxJItUQiU6m
         3oQA==
X-Forwarded-Encrypted: i=1; AHgh+RqPfZ8Fh0OFXh7vTFyK2A8cvNxFUBD0U8jvecar4Yjw4lLkgO0PYtBDV6CoQbIeHH0AFT32@lists.linux.dev
X-Gm-Message-State: AFuF++m4ovLVDTQMSyo6u3uc7yEexpxOuibxOV/B0yspcNQ80XtujHTG
	b1UzMiiEAOaTFnwqQYXy3YJO9QG2d7iySIp3guOy5Zxd5RqskR5jlimFxausYZvfBpoYRwIByW1
	HbEe44zMGW5uSQNnOVpsPeKrdW5Ujfvc=
X-Gm-Gg: AR+sD12bgdbY5QCtObaJJw6Yq0emTQwd8BJgAHMO+PbsLJXW3VqtQloUfMEnENJqy7k
	548SzRcBLs/dxCQCszrqOsWixI3rtmnVlfxyPkdFVgHM5GqjFmBMy0WFERDOtKoZ709t78Qrsy9
	ci1JAKgAQ1OGrQFGAAeKE+2XJVN8/nfQIHWtImZY6hH3jtcN+oSwOkoxXsOT1BDdRzDv2y5/dDG
	qGOZYbHSMvfcmwtkI3cuz8HLb4fPlapBiLetZ2c2uEwFINCbPCagabZZgJlkGmBXSEAPzD6fzgg
	EaQc514Zy9k6yIZmZLjyewDzcr3pT5NEa0w734BceJRy
X-Received: by 2002:a05:6512:a34e:b0:5b1:59ec:2452 with SMTP id
 2adb3069b0e04-5b48421b64cmr4135504e87.9.1787548328664; Sun, 23 Aug 2026
 22:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821053238.1281310-1-liubaolin12138@163.com> <20260821053238.1281310-10-liubaolin12138@163.com>
In-Reply-To: <20260821053238.1281310-10-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 24 Aug 2026 14:11:57 +0900
X-Gm-Features: AcwNN1VyVji0TaKcqzSMGoPA2B-xmJu0Dknl8reXf7GTvU0RVb6ZVDz0-lxo840
Message-ID: <CANFS6bZqkFhDbM9Ac-pWx8-K-DxYXYcL+rfz8afJq78KdQ1xNA@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] ntfs: skip free cluster decrement when rollback fails
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
> When the rollback in __ntfs_cluster_free() fails, the recursive
> call returns a negative errno and the subsequent
> ntfs_dec_free_clusters(vol, delta) subtracts that negative value,
> adding bogus clusters to the counter on an already-failing volume.
>
> Skip the decrement when the rollback failed.
>
> Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator=
")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/lcnalloc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
> index 795f71d26895..0d6cd08ee2e7 100644
> --- a/fs/ntfs/lcnalloc.c
> +++ b/fs/ntfs/lcnalloc.c
> @@ -1045,8 +1045,9 @@ s64 __ntfs_cluster_free(struct ntfs_inode *ni, cons=
t s64 start_vcn, s64 count,
>                         "Failed to rollback (error %i).  Leaving inconsis=
tent metadata!  Unmount and run chkdsk.",
>                         (int)delta);
>                 NVolSetErrors(vol);
> +       } else {
> +               ntfs_dec_free_clusters(vol, delta);
>         }
> -       ntfs_dec_free_clusters(vol, delta);
>         up_write(&vol->lcnbmp_lock);
>         memalloc_nofs_restore(memalloc_flags);
>         ntfs_error(vol->sb, "Aborting (error %i).", err);
> --
> 2.51.0
>
>


--=20
Thanks,
Hyunchul
