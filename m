Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830591A6803
	for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 05:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548252; cv=pass; b=MDFQLc3HbVyDbN518L18/SXYXU8qsf3mjqZxFowSosGEWrJrrNy1HNsilhlb7XPIoVH6PPksmD3rVLkxK+WEYbDWWvuiGe0Lksh0XPbyPtDJfw1PG2MA4CNE49kcOashTg/kH1mZ6v6n/IMuoqi+dwtAMsDHX+vFm5qd5U1yT0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548252; c=relaxed/simple;
	bh=7wG727y0Cck35UQYmtu04T7mNitl/9KBtq5d0RMvb7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxLdLTf4/U5nqTnmVcsK4VwUXk0CtuzodB1lenSmKgR8VKDM2BK0cPQqLoJvHgU0fa8c9AbxEWbsZ1o/cpqIW8w2dub3I76Chvq4ejZ6kRveD7WJq10fZ2Dvrqw0WaN6lKKrzXQsvi/LKFUrEFfQ0mx84UxMzdFtlPhXmHuc6hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evzgSvr6; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evzgSvr6"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b45f1cd80eso2699290e87.2
        for <ntfs@lists.linux.dev>; Sun, 23 Aug 2026 22:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787548248; cv=none;
        d=google.com; s=arc-20260327;
        b=IvpTotXcJldLSLDKJyMVVGpwu3BlMMQTQCzZR7EwPobLjwxBTRKziLMqS6PRgTlshH
         7hf87jWHSSYg4MwtUGwpNzlOQ8IvSbB+g9Kulw6XGqnqhDWMcEqOhAIeMyjNbvgoDSOz
         7CKBgnnDjH88pYW/rD/uWlQjqc04FFFg+5RqNFFA80cT8vNc8xX4dzBSpZ5l/Ux2wHBT
         k3ahqlEpxDkSgnxJSdJ8pgc/KPeqV+y8NTLfsg7okrrW71H4s2LqQoLsBqCiTRF3ljk9
         53c6UxPRaTWQTeykHywLwcmAS8FBU7b3VoMG3tM3pX7HjdCbrO3uQxRbc0XBiY60hxHh
         s5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0HPOP0e6Kvn5YDjgXDyoI3zotbYGLwyyFx5bxZX6j/k=;
        fh=bB1jOZBzbeObU7YNBXEqaYG9oBTkojXeKi3Ut7Ax4X8=;
        b=jmm+o1KTNXpBfG/iebU9k8FMLa0/Hl/hZOkSJSTykRF/yk95Io+1OIw1tfljoEAE3n
         k4YwIhPW9qEEZU9bEnR1bUpWvf32XhJIg75IY1vfNP8Q15auAubELOpXiuFiOJkJUCO8
         sqqrNpmpnnoZmT3ASRo00aVaOXr8amCFTlBDrCFi26J/lLGzie/wDTvOjEMIWOeLCGqy
         bvxVATYoAn4MUSexu6anE0ktWX+VMSpUZOP50epJBYZQqDD+fS/o0jhcDGJXTe2OXDbq
         0q8QY5iwWm2yrjhG/qcaZyvRmi7fD+cXUmjEHv4n4p44RjcI9OMJVR11ecPO9etBsKPQ
         FUHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787548248; x=1788153048; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0HPOP0e6Kvn5YDjgXDyoI3zotbYGLwyyFx5bxZX6j/k=;
        b=evzgSvr6BzsOSlozFhVFZho13EdTAnUvQN0XWkzgG/Dn87EmHP4BODpwXCjsxjQ+ac
         qTQB43Hw4CpljYxg3vDOflflGTeuizLKfbW32AiDubuziPsvH+p5aC3QHbmTCx6PUGTB
         bLl/xwOekTttpNJDVyxBMgJt7ZNpL8Of/KrdYPL+OL/CCEOrzBkrfhlef5FywKWhBQHy
         a/HJVfF0D4P4VSvO1zUD3k5IUdlFig6iS1TqttEyP9jtES0oao8K7u/CIt6D1U3MhZlb
         JT3EGo/7HXKXLe0hPiOFO2QgN8gq5Stl32MxQmY7do1cFLoIHS86k88LAQhAKh+URTa7
         AZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548248; x=1788153048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HPOP0e6Kvn5YDjgXDyoI3zotbYGLwyyFx5bxZX6j/k=;
        b=bpzfQtyxe1pPOn0QzySIaGjIOu+6hK7PD7sxt8y7uI9ym63rxOB0OvBoiZNuznE9t9
         LEluIYoVcpw3lYV0WfcrqtapgnusvpDFReO4x44uzkgAEnBtAh5ewyK2wv/KzXQuin5d
         Dk4yaJLMChqDJspGABG+0AlVBq0ygvwpCv3lPnDPtc0eHE7rGwPQjg2sCsGCpWFas0O9
         Nwa6mKfhahqaUe2qtniyoEucjwge+bdvVo6cqOXRiHiFSGQktTK82UTahMutqyP35iqA
         O9pj/qwQ+oxH8tGrAlV0iiq9W5Cv+uwz7/ykmYpkGGT+R3nloIfW64ie8ncnZVH4Auze
         ZYNg==
X-Forwarded-Encrypted: i=1; AHgh+RryCDMj4gvEUuX4shLb05Ln/LJShUYdTM0fyON/XX2yd6Bw7kzY+QlP2or1MtfEVVGF4YUF@lists.linux.dev
X-Gm-Message-State: AFuF++npFoRdS149g52kVtcl2RbSKblc4iG+7nS97ZPWrN3XVxQ2B9Q/
	jcdRixm+1RseaV3Vec0upLWq1OFWKkm1x342LSN6O/nznDZdNGkoq7f7tB9lWOxqSv/cKqxP292
	dswR2VTuRz7+iKXtcyt/5x6xUMuG7lYU=
X-Gm-Gg: AR+sD10b1N3hVG9XrvH6VzTFLwwn6oWBbrBNHIbJSm6pIkOAeZhAKiMlEUxNsZU5QFE
	48geivS5Jh8vXTcCcwRhjbXh17G3r0YGAJsg8Z5YqXMbPzDJsGRe4Szqw0G9PSINIVtHbETQQUv
	/EmAHGqj1CDZrvC7eLsePId+Em9DrzYHCUe7bV9SkKTeH+etN83f6+xRtIGsnA2VqMx4P7PEPkI
	UGjON04gs2VZceiOOirFedGOVit4H8sORkd0gMY7e9XV9pea8hMyIN8kkjojpTX1SS2aUui1B3z
	SPyK+lhG5W404VnqegM9R5tgihXwgAxxYwUKUUBcwQyr
X-Received: by 2002:a05:6512:3b2a:b0:5ae:c659:f01f with SMTP id
 2adb3069b0e04-5b48b7874b5mr4212820e87.9.1787548248337; Sun, 23 Aug 2026
 22:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821053238.1281310-1-liubaolin12138@163.com> <20260821053238.1281310-7-liubaolin12138@163.com>
In-Reply-To: <20260821053238.1281310-7-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 24 Aug 2026 14:10:36 +0900
X-Gm-Features: AcwNN1Vb3lS5ed1oTBU5sZVhnUKeZ4QJw64IsoEtqWiU2HCWyNWS5xzF4G3Vejo
Message-ID: <CANFS6bagc57dHH3K1rgx00+5ZymC5Fa+451M8p-Ns7Uxz9Tg9Q@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] ntfs: return real error from ntfs_non_resident_attr_record_add()
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
> ntfs_non_resident_attr_record_add() returns -1 at its put_err_out
> label, which callers propagate as -EPERM to userspace.
>
> Return the actual error code. Every path reaching the label has
> err set to a negative errno.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/attrib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 3d0b305703d3..a2502eee717e 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -2639,7 +2639,7 @@ static int ntfs_non_resident_attr_record_add(struct=
 ntfs_inode *ni, __le32 type,
>         return offset;
>  put_err_out:
>         ntfs_attr_put_search_ctx(ctx);
> -       return -1;
> +       return err;
>  }
>
>  /*
> --
> 2.51.0
>
>


--=20
Thanks,
Hyunchul
