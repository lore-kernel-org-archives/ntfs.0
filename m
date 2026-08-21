Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE8470E8E
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307433; cv=none; b=RjaQoFzcu4UryQ3m6S9s32IVB/xTAopYGzI7PnC/j4zt/h76v+/2Kp5kQG2yPNwiUMiWKPp/9gajhvX3IPUq3Sz+gvHg+lYSO+zsPg0R2SJp6qkprrmcanVkU9+tU+y6GbpJU8HbBOZIRF7Pd5Abog51FxP+4ILLlEQZ4aA55Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307433; c=relaxed/simple;
	bh=1SzNxufBfvJUZorLx/0LyJ3L9HyuFDzXuxmgF6SVraQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n45wfwNktGKLLlKydhPSeNFaT2CDrQVTy+QiOcPwwouoD/kTYlSYdZ+8G210jRbYUD90Mncbn4Uzt7XZ0gIsySmN7wkXKf8gF790q0kOcH3XXZpiXqEGG8QBbScR5afA5d+QgqbJhUx1ga1xqoYaqlOm6qobqbPdOMAWlz2l6Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mngxfd+h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mngxfd+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA541F00A3D
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307419;
	bh=xsvCleKLncgdW45efwqLmiLanOAfeh9mW4F2tSqfh90=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Mngxfd+hArt2kKE2NlPqqbRX2LZiDVjVARyp0dadslBTHBLPfA7RgziumundygnCK
	 ca9z9lnSBp29/ZNfvzNdqv4Z7UsZHLr4XZPV7ilzRsEC5EtKsW7l+KkY4VGudLBMoM
	 mDuhMxSt1Y/qRSS7Ma2yGactXqgY37z5olLXuZl/w+HEc05U6ahU6DY9HPWLaK3WHJ
	 ThPOoepownncrLvZoWjsCroqK2AXlWi32LLOnQaAPNfqKmdSIbh+Y1zB7QtQyMFi7o
	 MPH68zzH4TZpbqWD0QjpOgeCq+qh5EX/XKPMV5mevvfFuC8+L9NLU4O2SQyk77DIE4
	 dTHdknRiSG6mg==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1677c91969so100834666b.1
        for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 03:16:59 -0700 (PDT)
X-Gm-Message-State: AFuF++kP/ofhmrpnvZtCufLkakFf0HInUkUJ747PLwV2fFSv3mztiJYC
	IeuGnEupbwl1M+/rZzzQBbzs2bZ5IJxan1Zpos/K9ADywTgKZ8I88rhCmPjXWyaeV7avIQbZD6D
	rpZp1vY+7XmtwgZKY9dnzv/erROkZ5Ss=
X-Received: by 2002:a17:907:c789:b0:c16:831c:427d with SMTP id
 a640c23a62f3a-c246a736bfdmr625376366b.21.1787307418227; Fri, 21 Aug 2026
 03:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com> <20260821-topic-wof-v2-v4-9-7a6fa10743b8@gmail.com>
In-Reply-To: <20260821-topic-wof-v2-v4-9-7a6fa10743b8@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 21 Aug 2026 19:16:46 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9COOLvx6ypsRW+9dZXvUj0-=1njHhdTgmSiw5JDLGJbQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xy5ihFi8xyNueLawgeG3_fR-pc_OkkQSFIeu-JwHhi0XjOcCPiQBufz50
Message-ID: <CAKYAXd9COOLvx6ypsRW+9dZXvUj0-=1njHhdTgmSiw5JDLGJbQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] ntfs: add non-resident WOF decompression
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> @@ -905,8 +925,10 @@ static int ntfs_setxattr(const struct xattr_handler *handler,
>         mutex_unlock(&ni->mrec_lock);
>
>  out:
> -       inode_set_ctime_current(inode);
> -       mark_inode_dirty(inode);
> +       if (!err) {
> +               inode_set_ctime_current(inode);
> +               mark_inode_dirty(inode);
> +       }
>         return err;
>  }
I can not apply this patch because of this change. It looks like this
code bled in from another ntfs patch. I'll remove this code block and
apply this patch.
Thanks.
