Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB181331EA8
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 05:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548031; cv=pass; b=OeWCvT39+DCBDq/1o0esQXn63gYtAVGqGBKMoMWOQ+KLqu03xGnxuj6BVnygv9DA8LUZSYt6rkiT2GfAXxfInBI502MaKMEoSwVqMzeTG1e3qYCqgaQIxbdZsamEEJASaI/06eIv0XZc9iAngbd+3dlRbiRgzpFil2WiZbdDRzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548031; c=relaxed/simple;
	bh=uhkcX9dwkSQNe+20fR2mIhuB92NHadH8dLnsX8fQvaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGn9tnmQ7sV0WWw5KXvUEIbFQwAtjlTt668Xthpnts/d3CvLHUfmGxjlSW0zdVWiLSrERIdpgrG9cZysQV5cI339uaJxgBvn1nYnCFD1sL0l7q0/OvmbDm6uhlwNuMIJ+/IgMbRvCr/uP0FGjsLK8D4xNGh18cB5fHspb2lKmTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0D8ivEF; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0D8ivEF"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso3037661e87.1
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 22:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787548028; cv=none;
        d=google.com; s=arc-20260327;
        b=doO8rPqTPVfU/oDajqZDVqKAyKAvGpvOsDjqctLkLqDPIbDtmLcoT+LIGrdoP9E8yd
         g1G9FWxH5XKy8EkcQb88ftEI15cYjMAf/j4e2/XbQF8KJb82VK+2eILEPeONYcrjjlms
         oZrvW7ba6JO0SlFeBvn2rtuGPmYk2R3Zu5PGGcQzV6py4DRlbE1+fYYTjRqQ2Sz//KnI
         tTzfWzaZ1AzvVJG5bHw0BD1NyPTV88BfFHRjRcsFfQN+RawFjnWj4zqxKYj0/JUtijV5
         JNIpXgny/vH9xfV/McVpE6RPtF/1x14DSlTsJBwCjQvMjeMAJXHek6rqI9oDRE9GY+rC
         zJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvoeDo2wsK6oFmKXKgm3o/Al5al/A+0hAdhfFFiIgS8=;
        fh=SysWqrcvhdhm9KeaY1uLKkMDcj9rNjYmcHyuDod6DoI=;
        b=mZ+B0IsIDPsGwBp06hoLZL5tC3SxMrT4LpXcWaBeRabxUy1dw8DpxyWo3kmd1EP4Eg
         QqJRoTzK5wFo/KnVofzPw8Y0yPtXZXFdMQ7Ct6pBXOHV2vV/6tdw2GrSlwGS4xZEXWO9
         duszuy82pfZLrYDydcppyWmHH4Zxt/G3QYa8NHoQwlovdDDkavhgggFrSVq0FFverlLm
         lkJEbLNmTOrTR+xBytQ9e2bJZOne8SFI9adsvD36YHt/9S7CMdZBtX0YOkqA2dfKMxw/
         o8P2imzz1VSd+XTt474Y6lr9Wb2lv21qgl6WHHu/r0T8YDlVWxQ36ZZdyKDUkA45BKB0
         ALHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787548028; x=1788152828; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvoeDo2wsK6oFmKXKgm3o/Al5al/A+0hAdhfFFiIgS8=;
        b=g0D8ivEF8oXI5tt6oypbbpu4MmWmM/iPei9JLI2TuFyswwy374DrJIXEepZgZ/2jGg
         OJmB5VJq0A+DPCo7ZbNpAyk63X/RXZMw+nAw7zMHFFDZs3vl0kgefxYeau7JP8UBiIJd
         Awx9gbulpcVJ2HvvJYUOmeKbuxybE046TwdM+x7++lTNpwRif0UjxIv0z3wrwx1xKhm1
         N4xAxN9rV83fSMhYrd2PRQJ6NnmKSIODIS5iE765XWYCLkKJjlytDT60w3yBHSkPUzAr
         3gp5Vdgsz4b7q4wbvCjwPzEVZ5vyCntYeI+0zzWCMg09UFExVxTKd/P8SQX9A1yvXYo7
         cl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548028; x=1788152828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvoeDo2wsK6oFmKXKgm3o/Al5al/A+0hAdhfFFiIgS8=;
        b=mJ5ye/9XXlwvZ8tv463ASqzO39/koEo/uFowjxyx55pd+D/vxfrYeraoFvJWhWR7+5
         o62h6Nkn9QyP4eQlofiRUpocJ75oZFhR6q0Urro52Tc9d3+yVk70mOyIt6I1jgIJvupO
         72TNbQrhMgmxtigUZ+P+dV3G/u+2FQc3lEXSvPOoyeOPp89hbEhCUJwPdVl9yJS15Pll
         0HLIycCIl9r0nIzINJpxVP6vmJVTl3RHAOa0Bt+De2CctdY4Kx5SoGQtICGHLjznwLXB
         t8U83lA8LWaEMRnn/hBWziDZIbRtVe/GsoAHIB4DUUtsqWHnpiCX8Jm4iT7kQqH8886d
         PZYg==
X-Forwarded-Encrypted: i=1; AHgh+RrlkQ8eaH6TuqkhVlPAf+6rn/RPIprJfH+o754eukuf51JeOCRCk0fXo9ogdJ2miUSu5uaz@lists.linux.dev
X-Gm-Message-State: AFuF++k8cEyoe2rnq5RtPI7kcvZ5DmooiNIZDc0M+TJ46+TJGzkqKvVw
	qcZsSsiaLjfw0DzedYx7G4/vHoWYCS191+d/aIgd/VY2QWWY0fznRKy/X4YBQPJTqh1x/kbwnvP
	CIRP5RmAlB1nEhH5rNeppvOmBN71Y6Tw=
X-Gm-Gg: AR+sD11e8sKJT+9uCfi5yZaA/j8mjM93L0rsklpVD4INKHrQYkD8VZUTrSbptOF1ds9
	MPpClD1fFZrxDo5x/yEmiezQmFOroIClcAIorW6eCYS8mD0PRVcWBKHjyro0hZVBqQeSuFycKQf
	N+k8CqU4w3OZFNBrf3rKsyvY0nHqzVGfj1+X8E3kO/QV1NXIfi2LQl9CcfZ/+tyNjZei68auD5F
	5uGle7B05TIhmmtXEmc7Mk02kn/2qcrbtJ+9bVLmt1vN4aj+ijBc+7fJs/voA1F8NoRgKKDrzuT
	WXEExwInJgu3vDOMGau0uhCwMDHIQgVjezv0LnQ9tVYx
X-Received: by 2002:a05:6512:6687:20b0:5ae:befc:97a7 with SMTP id
 2adb3069b0e04-5b4842142b5mr4110830e87.13.1787548027571; Sun, 23 Aug 2026
 22:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821053238.1281310-1-liubaolin12138@163.com> <20260821053238.1281310-2-liubaolin12138@163.com>
In-Reply-To: <20260821053238.1281310-2-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 24 Aug 2026 14:06:55 +0900
X-Gm-Features: AcwNN1UJy1AfsBCV0kVebsV-PRU_Nd2pHPYKBnRqj1WnBeHlFP-6fnUG6QqDCXU
Message-ID: <CANFS6bbeWMLV3jStN40oKo1qfK5Eiy_bONevEmmeshcFxjtt1w@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] ntfs: return DT_UNKNOWN on inode lookup failure in readdir
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
> ntfs_reparse_tag_dt_types() returns PTR_ERR(vi) when ntfs_iget()
> fails, but its return type is unsigned int and the caller passes
> the value straight to dir_emit() as d_type. A stale or corrupt MFT
> reference in a directory index thus makes readdir report a garbage
> d_type value to userspace.
>
> Return DT_UNKNOWN on lookup failure instead.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/reparse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
> index 0d3988992119..a8e413c61353 100644
> --- a/fs/ntfs/reparse.c
> +++ b/fs/ntfs/reparse.c
> @@ -331,7 +331,7 @@ unsigned int ntfs_reparse_tag_dt_types(struct ntfs_vo=
lume *vol, unsigned long mr
>
>         vi =3D ntfs_iget(vol->sb, mref);
>         if (IS_ERR(vi))
> -               return PTR_ERR(vi);
> +               return DT_UNKNOWN;
>
>         reparse_attr =3D (struct reparse_point *)ntfs_attr_readall(NTFS_I=
(vi),
>                         AT_REPARSE_POINT, NULL, 0, &attr_size);
> --
> 2.51.0
>
>


--=20
Thanks,
Hyunchul
