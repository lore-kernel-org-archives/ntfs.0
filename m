Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43AD378D98
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 05:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548068; cv=pass; b=qToz/5xpP1lKASznjPTU2VeoErxYjS8ZIAi5CUk8DwlST2hVVpSJcJe6avMRzJ51/9BuPppCfG5ZN8TxNFfwI5Zl2Bk06qOIY3C6otVs8PhstXYOUeZ9fQg+ZJjx9AVEt0M+EHj4qEb4yRX9Zjbpwnmg9/6CtSu1htiGzpPcpWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548068; c=relaxed/simple;
	bh=yYA7mCLsGF8yYZAqTRBSK+bY736TrS0XVx43XX/n8yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZeZGhRhCEc21L1GBFmw77gi13b2WiBtySOFa1r0CeFohynbQtZOSMBUXE0wI9cvO0RskhvFTeTxC1pBX7iorb78wGCeUhKpMBkomgDaPbWexh7P/cC/4urJEc1LdghulhKhefdt6m8pjFsUgTtIL6bwNauW1LGrMb8143vmSPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeIDQBv0; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeIDQBv0"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so3423464e87.1
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 22:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787548065; cv=none;
        d=google.com; s=arc-20260327;
        b=OANOvxiqfYrvnnTfG1mwduBzAeplE5W7O6xwwHo88oomvGHpdYMGsBqj8g0zOdsz7h
         LNYTNt7WOBYrEWNmQYCGe/A5vAPjeGrpxj6sKarn0f3g4liGfJFWJWaGGh4RY7r2Ctut
         iTcVxJfh/ZKihMwgMG+fKueCeHYlKeO7EdRQrej83+mADQmEtipGrqY5DhU7DY3slREq
         iQ9x3EBCesFoC6YIH6uPUmMQMRwmUaA3KiD3PONqhZFyQeA7NrOIp8M0rqzZCC8nslzE
         DlshtcdsyMI+m7fnG7QZmiS7V31cbZN3H8oGgkmcSttf0EPwfj+RfV5izApp+Ri7YOce
         s+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgHosOgvzcNpgjlWX5eUy+lddwEiJeiFCcSgu4fp2OU=;
        fh=zUYDT27VmT6EPq/Fo+tzS0dTc6/QL1J26a+Gwc7ljLc=;
        b=TjdbSaogscSOckeKdkcSgC2wJt8nAnofF8pJW6Oht43vcwNTSiNOdXGnAJgYAv/hhT
         D74A/KUTH7D7m6vSVOuwMz51/eVzBsuUa68TzwxaQc6/YD47YevXGqf9vObyPFGb26rn
         JxK6xlArTEs9y0KJPn7z53qkj5d0SvL/s1Ih2JaGuzyX/GbuEPkBICTNbd0M0OhUxLOg
         Y3QHL5T2V9EZCKF3guZFdJR6H1yqKe5r6gjJcU0bfB/JPju2JcVgIKnVEcV8TtomVj/l
         4xtKXt7mLc5jzU2PSEqnaln1Y43kEuVAFhdAgoGaAteNu+U1ME379Yq+YDpnr8WUXN/U
         qTEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787548065; x=1788152865; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgHosOgvzcNpgjlWX5eUy+lddwEiJeiFCcSgu4fp2OU=;
        b=NeIDQBv0g01icic9wgAgLxNClnhBj9hV2/D355bvQ5uO++zJwivT5V6w9BirhP3j2J
         FrEgHeDXfldZ+C1sy/6jFSFfsJWKmafarv72MQFPghqQG/EFgcptvSOMdyyeH0akU8Ds
         RL6JshCDSyun5QE26bLX7hOW0KV0l/DNDCgMRaQONzzAzqbSg5HvX3Yk+VgGvj+mT/14
         vJ55amnJVEK4lwT99nDDX0Mu17E6dZvO7NX0qEquw70cNbsi9koetsrsIDXUwlf+zLBj
         vSp5s6a9B9ycQhWTv9gpFIvMzMb89TIqA/P0lxB4lGHqy/usmQt4QbIQwOPAHD/wqyIH
         Y2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548065; x=1788152865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgHosOgvzcNpgjlWX5eUy+lddwEiJeiFCcSgu4fp2OU=;
        b=ZxNCGI+EUht5ELcSULUHjtZ35+s++OX2mlhhHoSZcgURFPZ3qYPZmLkJOOK1eUAUqy
         oTBOTdNfwEP0XnY3t+7TMF/rslYwu8Cc2Z/IDOv8qtySni7f+yZO2Nbptd0o5fGv282c
         4nV5/BnoJlaZqyeCVpMxyRFQypqoL8Z2Sgs6wBOwsEm8g9wm6c63yKXzToBuzdtAgojF
         uPs3xsG/i6C9ZJXVs2t4DDcTYmG2vvzoqkpq6s9m/mrMKlUa/MLAXrShGZ+IQHlDXv2t
         dSRCFa9csCvspO3xAtubNLYxHMuZbDPZ8IGXnOh68/QR6aoKxlxuL1ZLATYEpM8/PcVO
         JjTA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2iSV1NDu/x36laZ5gBxSzIA2lLYXDcCdOQ6EJJQD2tPH3p36ehP4PvZRp8WOcFSEXP7Dz@lists.linux.dev
X-Gm-Message-State: AFuF++lSqQCndOvo6lwy285MwIv2D3v9iG/kzNsz5xwbMKjouNXpFsqE
	W6+1aOZl3RIIbBjshmb3bvqt26gOCEuNGcrpiNw/xNW2HNrNG9zvlpjRuGrWP1r6kJcLINRNYSF
	YeIJBSa+y2oyvEiz3nK4PV0g6D4wSt8Q=
X-Gm-Gg: AR+sD135JVGlHu5HqhV1TWJRFfb4piWO5JheXI4xG1m8+HICDOiRXoxo90/O7TwgplN
	HMn4s5VupcP4e0TcP2IEsOnPepzDZ9HDIQtqDZSGWXzgxjhojF6L7klJlyOdjbFZxqyPD33d5uP
	BiIqpjhya4/Ca+tpFk7ChqV5mYvKrHdIN6bx+N25Iy5d0uTIAbVSdJuTjP9dJUJCXjInji5veh6
	FeFJFHf+fw7/T6m7FowfdGDbZ9tPRnfY2R3ShVxKtiFiFY7i0a0M3bhZ62ZNf3kkvvfc5+xcXge
	Xh7T3G5yfcUpNkhxDJI6m8Q+m+3Mqs7Md++wCJ2+i3IC
X-Received: by 2002:a05:6512:2308:b0:5ae:b819:7880 with SMTP id
 2adb3069b0e04-5b47d4d1a9emr6491595e87.6.1787548064531; Sun, 23 Aug 2026
 22:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821053238.1281310-1-liubaolin12138@163.com> <20260821053238.1281310-4-liubaolin12138@163.com>
In-Reply-To: <20260821053238.1281310-4-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 24 Aug 2026 14:07:33 +0900
X-Gm-Features: AcwNN1XKFoMMYrROULwpdV3tL-vFFcVX-e6Ps7BRi7i9sZAx1CVmP2SCU7d70tk
Message-ID: <CANFS6bbxOC33QPxzi7tEeXYgem60sRvNUSn4d60F=q34jbwhSg@mail.gmail.com>
Subject: Re: [PATCH v1 3/9] ntfs: propagate reparse index insertion failure
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
> update_reparse_data() ignores the return value of
> set_reparse_index(). When index insertion fails, the code removes
> the just-written reparse data as cleanup but still returns 0, so
> symlink(2) (and WSL special file creation) reports success while
> no reparse data exists on disk. When there was no previous reparse
> data (oldsize =3D=3D 0), the failure was likewise silently ignored.
>
> Propagate the error to the caller.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/reparse.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs/reparse.c b/fs/ntfs/reparse.c
> index a8e413c61353..905ee08422d4 100644
> --- a/fs/ntfs/reparse.c
> +++ b/fs/ntfs/reparse.c
> @@ -618,8 +618,9 @@ static int update_reparse_data(struct ntfs_inode *ni,=
 struct ntfs_index_context
>                 goto put_rp_inode;
>         }
>
> -       if (set_reparse_index(ni, xr, ((const struct reparse_point *)valu=
e)->reparse_tag) &&
> -           oldsize > 0) {
> +       err =3D set_reparse_index(ni, xr,
> +                               ((const struct reparse_point *)value)->re=
parse_tag);
> +       if (err && oldsize > 0) {
>                 /*
>                  * If cannot index, try to remove the reparse
>                  * data and log the error. There will be an
> --
> 2.51.0
>
>


--=20
Thanks,
Hyunchul
