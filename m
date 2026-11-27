Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795780980;
	b=G3e+uDM8y1EY6NoPGIutgYGGtjIeTMXPjYlqPmpLJXdjdYTk2dEsaO9P0XrHIcxWWRRI
	 NYl6Wf0r8Mx0CwsZhgA9Ex996GGqxH8JtD61uTqt+igOS+DT5Wvy58z+kUJa/CToG3sxj
	 UCHDNbEsouaZkHwj995JVK2IyRjqlNpA3Yzy3j3wvHFg0IM96sj0Nz2iTmv1tgLfgox6I
	 T4QsLtL/FV64TTTw8eritpY+1neiaBBfPMvJ1rttNq/iRPQ5KTGKAcMIUWP4ZL34lHz3D
	 jpMdkTzX7aPTCXo3qalv3RQgZFu/tLPDrGuz/p8bQY8A7QrPwVKc202vLF6XmsF09Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sKBAqoHb6dKCB8lGd+jVvxodjbVVN2AMGRa9Yq/Mby4=;
	b=uT/5WrdWmG7FvHJkF3im10HHsG3lb9hOskpOqUyn8FN5HPpbsT4AMGGQg8Q89yloFOmS
	 KA24XBf18LE2SbmdSc9X+9axLK+xXyN76jQPEf0LUCOhvPOiIhiJKjJznEOhfswZM6nOr
	 1Sdoj3msDAnK9LG3vk9WYT/aDaN+ONPV8ccNc57HjFCJ51BVlK3FcYa7y5bqDLMBiSN1S
	 5uxmUPf8mGnWq7vb+8p6RWQ497d6C/L0ZY11n0kQNMkUe3fGnU8QYUcD+g/lOqaPTlF4W
	 nA83x8/U9pKcxRU7aXai7Wwn4Js/RUn0UmEhgtorYk+Y85emkg3uSWKYNE1NbO/St1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYBRbdcT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1852606A326
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 12:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1852606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYBRbdcT
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae85e3685cso56214881fa.2
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 04:02:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795780978; cv=none;
        d=google.com; s=arc-20260327;
        b=kz1xn/KyoYclGpeDKJizmDQVKxkQP504vny9TsZi445jFEi0aVdgfEDFeJWQTVeuib
         Ql/+JB1MuLb8ofQfNHsuZLORMVDseUAc/vbgvywg1Aqrei5GgUFZ0m4qUaRqBH2ChUeY
         d98jw7/z8sn0WdKh/BCos2+LAC3PoV+TgA7Bq1fY5z3BmEuLAWD80IuTXQ1MLcnM32GL
         MAyBOyG9wyGF0wVh3SgA/dklBKEiMfstvrUFjt1g5d/AY6kNxO2YcqreSBBPBmishPM/
         7cryb/rw2GxiH1oPdbV9NvPNz24XDdlhcWw1t7cPp2uN9TEj9mZiFGNhC877ZNGtxemO
         zZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sKBAqoHb6dKCB8lGd+jVvxodjbVVN2AMGRa9Yq/Mby4=;
        fh=d4WVjsK1UXfxUvWMts80MygD3X/MmVgvu3pS5R4pOqU=;
        b=O5AfhOw3LeOfwut0NGFkkQGPF0m73NvC8PgTjm5hPFpgCrPz8vKXDaMqwYWu/IhetG
         osNMOQ1zAXysECXeDkCpRo/i7sUP7jbDQA91ixJMw0AXwha4+vVhZb2ZDU2gTguvnElA
         ihFSTlHm7oED/27cUixraTbtUqOAOyFu7+NqhKiK/IX8RXIMwWrWD/NOMoB2+3RYp+bk
         YPro7BXYMY5qC8g1n2bOL5vgcovJzQzyhGN5YWPRfFHVjqrOqHZfMrFcxu9XW/eIlri/
         yDSG518f/uDBlvKbDfq0PtJKPPjIeJfQf94SwvbILhtQaLC5FvDd9VO8Fu210SCg3uxP
         NvYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780978; x=1796385778; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sKBAqoHb6dKCB8lGd+jVvxodjbVVN2AMGRa9Yq/Mby4=;
        b=JYBRbdcTjrmSfrzPTtc/NpKz5CuD96N0AD8SLz/FBmDrQcWeMar+uOqU+UkIsn425D
         6gRTcsHs8vZHAi39YjBLWM51iD5n5gBW5aml0DsqkjbhubcwPjeoZeXusZZSKYScEuEu
         3iFwhHRrFERRX9SvKt6jGLyG/nl5l/JRvHX8B8QHVGYwUsOfj60sferdIeuDdrrck3Mr
         /2MYN1CbNonYjL4UXD97tR5Oe4mvLdZsvgsJjtpA99LW0jHV9XOWKUHYNxk9WhgFHIOq
         Q9TDoz+JWoKeAlyXNuD4fXUaxUc8l3EdsK02G1I9nkQvKb7tI1X6SjbaSlaVjQfUI2jk
         XmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780978; x=1796385778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKBAqoHb6dKCB8lGd+jVvxodjbVVN2AMGRa9Yq/Mby4=;
        b=k2gc8bnRhKRswDjzCZWuugBnUy2RtaUmbzzVu+nSnLGDPr2ySJMSPZYkxo9J0zIuLN
         Ov1oz+clyizkCgZbdFTNgQz2PjEkoicRfmeRA/pfudmqu+qMbWRNcx7ufzQoaoKG8PED
         EyZZ6WRzkodhZOcJq8Qy5rDMXEebD/X3enoRO2aY4IfpKiULgld3RgX5mr6CIO9thWK+
         EOjt2AdVjJsjuDrXoRX7upTGDAG1UW4SPH6JvqMLil2mCD+rooiFLlKpI38OCH/Sw6Ii
         jwCX2HHlB83xwpgtJt96fEdx/bbErqMOEWF26BgkKiuOXr6bflQjSI58QdDdaofM3/sz
         O0AQ==
X-Forwarded-Encrypted: i=1; AL+hErFOisDWMS0yO/q8N5zU9PRhcIFZ91M1Q2JGd3MKs9FDKRkTfSeMNDA+ELzT4biYl+ePNRvY@lists.linux.dev
X-Gm-Message-State: APuU4Z9/GB4m0q5MAymaAJnIjUAfbDxZENKZVUUu1v1/Zfunz8IcW7md
	DkWEao4gtrNLtEeN6NSundXgakyBh/ppwP3WJ0p7+uMn/hm+utbVDIdPLtu/OzmGN0j/rN8ixRF
	PQTUYHQ92Qh41zhfnM0ItcIKF0Ble8tI=
X-Gm-Gg: AZFdTZeDRdAL9du4lwo5v3G0HH650jbCjBNUrPLVCxfWMrEEiJCr1QA7pq3Vt2ztNFS
	vubvDome8G8HBKu8nW9OiNFmDTw8Zn/PpFE+sb8qEUnK7p+zyt8sWx+sMEW+VivE0sEBfJcFbvR
	aHuEBrWQ1FJSxiKx8VlyhOs1VrJ8BlYqky0KTs+IEHZsmbadeeA/HapbkN3wTUAKoP+e4mGqeHR
	NOVqYP5/759I14IHYQW27IKNHq5NEglhOhwr/rETfj3EAHPgLWLyCwIhryuAXkaA1qcdPi4xU0y
	lWzJGzu993urtSW9Y7IJNZS1RZiI/ZB/8LVyka0M/zbPiLp3Bw7fKj5/nI5duvlDJu1QVixjS1H
	v/fLTc6UumZ7xlXL9+bpsavsVjwwbjdu0p0u56d2fUY73/IjgmAbN5hEsdFK374KV+MBNrw==
X-Received: by 2002:a05:6512:1148:b0:5bc:cc46:1849 with SMTP id
 2adb3069b0e04-5c1bc874b3cmr6981033e87.54.1795780976912; Fri, 27 Nov 2026
 04:02:56 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126163114.403846-1-koray.fra@gmail.com> <20261126163114.403846-3-koray.fra@gmail.com>
 <CAOQ4uxjGLfuZMFABCwMvdXwnU+P24G_aTJLudWbjeSmWwyDF6Q@mail.gmail.com> <DN5YPR39J7QI.1S1LCFLNUCZNL@gmail.com>
In-Reply-To: <DN5YPR39J7QI.1S1LCFLNUCZNL@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2026 13:02:44 +0100
X-Gm-Features: Aa3M54ohq34732gC99y698hjwvA-0NF3EsaW7G0zij4KAugMs04c_-FFLASygdQ
Message-ID: <CAOQ4uxgzmB0dEpQCVGKOc8reJ6OFV=BxDMgRW81aKiCMwDSn_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] fscrypt: update fscrypt_prepare_setflags() to use xflags
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexander Aring <alex.aring@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 12:38=E2=80=AFPM koraynilay <koray.fra@gmail.com> w=
rote:
>
> On Fri Nov 27, 2026 at 12:35 PM CET, Amir Goldstein wrote:
> > On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> Update fscrypt_prepare_setflags() to use FS_XFLAG_* xflags instead of
> >> legacy FS_*_FL flags.
> >>
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
> >>  fs/crypto/hooks.c       | 10 +++++-----
> >>  fs/file_attr.c          |  2 +-
> >>  include/linux/fscrypt.h |  6 +++---
> >>  3 files changed, 9 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
> >> index 149498bdab94..52d6a33fc9e9 100644
> >> --- a/fs/crypto/hooks.c
> >> +++ b/fs/crypto/hooks.c
> >> @@ -182,10 +182,10 @@ int __fscrypt_prepare_setattr(struct dentry *den=
try, struct iattr *attr)
> >>  EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
> >>
> >>  /**
> >> - * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_S=
ETFLAGS
> >> + * fscrypt_prepare_setflags() - prepare to change xflags
> >
> > prepare to change the file attributes with file_setattr() or one of
> > the legacy ioctls
>
> Ah yes.
>
> >>   * @inode: the inode on which flags are being changed
> >> - * @oldflags: the old flags
> >> - * @flags: the new flags
> >> + * @oldxflags: the old xflags
> >> + * @xflags: the new xflags
> >>   *
> >>   * The caller should be holding i_rwsem for write.
> >>   *
> >> @@ -193,7 +193,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
> >>   *        another error occurs.
> >>   */
> >>  int fscrypt_prepare_setflags(struct inode *inode,
> >> -                            unsigned int oldflags, unsigned int flags=
)
> >> +                            unsigned int oldxflags, unsigned int xfla=
gs)
> >
> > This here is a backporting landmine -
> >
> > Changing the semantics drastically without changing the helper name
> > or signature.
> >
> > Please rename the helper something like fscrypt_prepare_fileattr_set()
> > so that backporting mistakes will be caught at build time.
>
> Yes, though, would it maybe be better to just use xflags_to_flags() in
> the vfs patch instead of changing the fscrypt function at all?

Yes, much better. I agree.

Now looking at the /* initialize missing bits from old_ma */
hunk my reaction is to look away its huge and it should be
using helpers probably called from within fileattr_set_prepare()
itself - because if this is de-facto preparing for a set.

Thanks,
Amir.
