Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795438860;
	b=A67ZJFSikc02ETZzCfbl0h7PZ8P87KPkKrPAC9Pz7M/KM7kZevEDct5RAaJdms2NXS82
	 NogpJweSixmKJeRlQlmJyWoHdS0AYQLkecSRHLk/W8UrFidLnEiwj6Fmdg04PxfQXrero
	 1OdWPRiMmX1ODZOYsW+0sRAjCjn3h7/VE7ckfuo8ORM2+Hl2Rru2BEPlyvMqSYjVYOrIo
	 f2pvwgRpklppwlu80dAKGR5eQ/x4eKcoGZymNNMC+nm8FTOYccSSbSG8nrp+F67UK5ACp
	 rRCu34ioXagPb64EiojZ569po/cMW8nXWIiTDZWRwnZVXKXymWu03bs2r35dD50rCjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AMCJ5wbvnIEodr6Bx3XwSyi7m8Nqsc1HfBhVMog/o3w=;
	b=MY9vsa4Xc/VDqS2gTOHG59sqQbJ/bYAERVqaUzPswKYeXxICtZVyRpuYTtuF/M3KdXFH
	 yFzUaqRuNPVFc2dZzVkrdHvFC1ydNs1AKsQjLDbCiDa8/puTR5Jipn4D1e1iw9SzUq22Z
	 o0XdZpzbOiqFZwcz7kthRhfepNgInq/Sv1GAIXGBjZjolbUkN8ps7sfv86skYY6iAcLIy
	 sCqeZB+nHM1GRAwSmg/PI/yri/BLlwP66SiGf/LYSVVppNJOQVfYTwm6o6mSYQ4zPKmY8
	 1O+fKdS+OpUCbzkgFn8L95iYaDlRX6GqB1o5JAZghORlYxupz/5LLbbaj7tVFsDbOxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Olt9lg+C;
	arc=fail smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148BA606A31F
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 13:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148BA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Olt9lg+C
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so3828191a12.3
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 05:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795438857; cv=none;
        d=google.com; s=arc-20260327;
        b=ZfmY/ccakb/stT+C2TDKDXl3izdLshcJpWML6oTUgEmmR/grzSEEf6B99zaFux/pOZ
         Xw+OY3DYjJQVk1P4A5nofzfmN/qtGOp+OEMIjkfKMM0OAlExy4FOZWmVsMAOctg0W52v
         3eYE43VBuQiPt3jK03gJ+03BT6G58hEf2WiyVO8kWW1426Uxc1qzRN6wJYSF+yIbXdUv
         cQxTib5tW7ylhZhT78UYzgNWV8B5BDe7yVsOFwbMbBtfLEB469PQO6JMEntb/yiHBfMI
         et70mwq5CgN9qbBY8wvKrH+tzCzVy0DP/qqVnp8q1Auev7GUWPcrRLvL2/fWfxw5KF/d
         Pe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AMCJ5wbvnIEodr6Bx3XwSyi7m8Nqsc1HfBhVMog/o3w=;
        fh=xvPebdFjE+sq+CixufcJ9ye5zLIUeYombq1WEusik4s=;
        b=GimBKP4K/f5gZu3Te75ICD7mNP69g0YifdlkMOFbVLAmYiwQP8+DDkKFOFMBvHk4as
         iuMmYyLGkh7x5eWmswD7XGbKWZjQ4BQk+clKtWPSRY2suyICQzTYqUseXaGSoR06PGWJ
         VsCkN5b4RQSWCB85qmnC10CqBWiIVttBy5McRpxXjqoe06cj457cc1jDbtrTOEQxnYbv
         ily3aKV/G/ggqQhCWZy+gLPz6rszlOII0Z33huLTe1+IaKwOAoO+zdV5MTO2ZWwA8Siv
         IcVkCq0diLjlE10gW8SEMrbCoLXG4q00Hi3ObnQwr3/zkubdgeBIFuaRjwHMBYBd2meq
         K3Fw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438857; x=1796043657; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMCJ5wbvnIEodr6Bx3XwSyi7m8Nqsc1HfBhVMog/o3w=;
        b=Olt9lg+ClKigO2fnzjsoZ2Fgc/nsOZfEsPANYv0M3bdkl25ktcqA8d6Qr8VBSgLxTH
         QctbWTQEAhTAdbVD8GgSgm8AFgNViY/zWSrnn7Ay0HUlAKw65W9AYsrPXs8+mxDsxp23
         Sx9dNSxqTcLt5FSGHRfuVrI/KlatEu9s8YwJzYqiO4SJHEIJBqOnRB7v0CMC/UWjcK6i
         uelcEXr6r6/Wy/gwfW3XO+0klIYCdxEkuZzxQabLmN2bTuoOjjS2pech2R/+knk6Rx6R
         nLSxX613bApaTUC1WhFyoMSaB0Od+gkIQSaumps+OdGSyVK0lp2x2WnZgyMKCfcis4bf
         oMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438857; x=1796043657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMCJ5wbvnIEodr6Bx3XwSyi7m8Nqsc1HfBhVMog/o3w=;
        b=o3jBCS5ojCTn5V066SYUhc63jAujvq+oJzORlrZqPddQVVdTyRVrjInQJTRZ1hgtUs
         AcwP+qQ9n0mIA1t95oz/1AYO+cgSAQDwpcUOvi/Go1EGUJg8hsuF9v4KuD1SVQw4speV
         AzXsprWUmXaO0GoGZK1FYy/U+nrAyjOnAWVj330Ta8Q50YQ+uCMLzlNxglSBADm1PfRM
         a4oMz8YhIuqUZRLGzWZN0wnxLpSN6FGpixjBpg2X47cHIeUDvbOA5yGS/URECbdVkTqZ
         YcPtrzOjT/9KlwzpRd/YacpFJnV9rwFxqq2OMvfU/XIuzPQ/LsLX27D50+s0rm3laydb
         sj9Q==
X-Forwarded-Encrypted: i=1; AL+hErHutBnljz1sG+eFCZyDQvwYUfOOhwvG3Fm9/vKz3iSJ0vGlXZhf274P9+Bea/5/upovryQF@lists.linux.dev
X-Gm-Message-State: APuU4Z8yXMtfdMclxFRv73jSR5elzvmQ+NimxrA1RSqhavQQcXtsfxr5
	FrO4gyeYYgFStvoNYTbleJuPx5HYZlUqb8TwljTNegOtA2kq5bRDPtDgmL6OB6iWy4HWhh5RyE0
	WQEbetm39a/GPsoJMbExOHi3016JsvdU=
X-Gm-Gg: AZFdTZej9NoOwjYgJhb3X6ykv3LtXj1dqtNLgMey8Whf+MFuOtVo/0bObStw9HeFWRx
	Zn410Rb3wlpvvgcxb8F83J3FaPJI3fkXDAvLThzwkCPOyQejiWdg5wJWcWbSi9IxypTMg9HOn47
	PQ2XsFDt9aEvjKO/HI/6LEce853hQQ/BIKTvebft4hqeMf4NfIgXAwCvHaMu+pgjcIMOTXdwqYn
	TuyyylKa05smlg6laeT5g3vHTFrZjbJ3mOl2d6Dm44vHLsk7eip5e8vUyxqaf5e7/a7xRqjS0Ab
	hdYFZ5LC+QgzCu/CoReP132dPBrG/aeoMVTR5UqibdL3dZiYvdPwUA2jSwsy0Oq6eBmv6gvIfB2
	WYmW6flE5phQTaxdyetjB5pnCwt4Ed3PYTRj7aDw+tjTfIOzfRuOYjBQrPzd5z97r45I+Zg==
X-Received: by 2002:a05:6402:501d:b0:6ba:659c:8ca3 with SMTP id
 4fb4d7f45d1cf-6ba659c8fb1mr5474446a12.10.1795438857096; Mon, 23 Nov 2026
 05:00:57 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <20261122000856.536902-4-koray.fra@gmail.com>
In-Reply-To: <20261122000856.536902-4-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 14:00:44 +0100
X-Gm-Features: Aa3M54oIZEz33KQbWl8M_WOYBLraeDplxcWm8_8Bl8KeH9NFv_L8S3OGX6_s9I0
Message-ID: <CAOQ4uxgc6pP+_xvJMbqj6wOdGzS75Vn6x6i_vUfCJDD46DAA_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] ntfs: switch to the new xflags fileattr API
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Darrick J . Wong" <djwong@kernel.org>, Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Switch ntfs_fileattr_[gs]et() from the legacy FS_*_FL flags to the
> modern xflags (FS_XFLAG_*) fileattr API with masks.
>
> Introduce FS_XFLAG_COMPR and FS_XFLAG_ENCRYPT and add them to
> FS_XFLAG_COMMON (and add FS_COMPR_FL and FS_ENCRYPT_FL to FS_COMMON_FL)
> to be used in this API switch.
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/file_attr.c           |  8 +++++
>  fs/ntfs/file.c           | 63 +++++++++++++++++++---------------------
>  include/linux/fileattr.h |  6 ++--
>  include/uapi/linux/fs.h  |  2 ++
>  4 files changed, 44 insertions(+), 35 deletions(-)
>
...

> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 50be49f4c913..fde6fb2fe39c 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -155,31 +155,37 @@ int ntfs_file_release(struct inode *vi, struct file=
 *filp)
>   * @dentry: dentry to report the flags of
>   * @fa: filled in with the flags of @dentry
>   */
> +#define NTFS_RO_XFLAGS (FS_XFLAG_COMPR | FS_XFLAG_ENCRYPT | FS_XFLAG_CAS=
EFOLD)
> +#define NTFS_RW_XFLAGS (FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
> +                       FS_XFLAG_NOATIME | FS_XFLAG_NODUMP)

Nit: checkpatch may allow 100 chars, but this due formatting is not
easy on the eyes
pls break to RO line and indent the broken lines below (


> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index 4faa40febf11..219e7c8eb601 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -7,12 +7,14 @@
>  #define FS_COMMON_FL \
>         (FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
>          FS_NODUMP_FL | FS_NOATIME_FL | FS_DAX_FL | \
> -        FS_PROJINHERIT_FL | FS_VERITY_FL)
> +        FS_PROJINHERIT_FL | FS_VERITY_FL | FS_COMPR_FL | \
> +        FS_ENCRYPT_FL)
>
>  #define FS_XFLAG_COMMON \
>         (FS_XFLAG_SYNC | FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
>          FS_XFLAG_NODUMP | FS_XFLAG_NOATIME | FS_XFLAG_DAX | \
> -        FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY)
> +        FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY | FS_XFLAG_COMPR | \
> +        FS_XFLAG_ENCRYPT)


Rule:

You cannot add a flag to common without carefully auditing all
filesystems that support the legacy flag.

FS_XFLAG_ENCRYPT can go into common but must also
go to FS_XFLAG_RDONLY_MASK because it's read-only for
all existing fs.

COMPR is rw for some fs and ro for others.
As with CASEFOLD, you cannot make it COMMON before
converting all casefold fs to new API so that each can say
whether it wants RO or RW.

I think there may be a way to deal with this easily since
ntfs doesn't need to set either but not sure.

>
>  /* Read-only inode flags */
>  #define FS_XFLAG_RDONLY_MASK \
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index e40806b3a69c..09fc7e066485 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -275,6 +275,8 @@ struct file_attr {
>  #define FS_XFLAG_CASENONPRESERVING 0x00080000  /* case not preserved */
>
>  #define FS_XFLAG_PROJID                0x00100000      /* project ID */
> +#define FS_XFLAG_COMPR         0x00200000      /* Compress file */
> +#define FS_XFLAG_ENCRYPT       0x00400000      /* Encrypted file */

This is a mistake of patch 1. the newline should remain above HASATTR
which is allocated from the end.


>  #define FS_XFLAG_HASATTR       0x80000000      /* no DIFLAG for this   *=
/
>
>  /* the read-only stuff doesn't really belong here, but any other place i=
s

Thanks,
Amir.
>
