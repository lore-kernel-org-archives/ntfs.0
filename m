Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795779355;
	b=rotaKsZCXgA8yPQZLfxcSV1dGHZB1LT5WyyMofRpjCu9vREiBd++ygde4DU3Ylv55YlY
	 RLyvUfXnMxiwQ7lYPsTwaFB23BVkLlGxc5Aum1WoT2pFEz8oa44P09hwedacZnPaC6Kpl
	 BefFZ3CVcitZOaoVNK7RrMDdf7UF9UEHn98uTfXjQbXb2LPF7c3/kxvv77HzhyVPNSRhn
	 i4wwmr6jrxBXisaCRi/wvO5Dts5BwaL/6PK1g18ai6nxmxaihxOdsxvM+MoI2N9aV2NDD
	 gZb2keuynDFSl8f4qXZlFbw1CuZEnmVYGmRUND9tQtKaBF96sOZJYJdlBcsjxnmvnhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zckLxKTSVIvkUKQrRBT4ZQPN8xSZzGvjPSGz1nKrgeM=;
	b=ejf5jV9AkoAXcZuLlYoqM5BFN/i+Bdj0m6C5j+7UYwBm/iYiwPO4F4CyrdSaCJm/+Yz3
	 gcPu48kKEJWBu8c92xTeTO2Q9uMpvsBY+7sCJt2UR+CAYKAQgiIDLWbRB3hQB8tZT3mqK
	 IWwSvoNRwmem9/pmjzZLahfc8x19jvxXAngQNZHdA+CmTx3wuZLDZkb79PzsPXOGIfzTL
	 CyFScMS8dUzh17GABYyL1i/10/40Qki6Ylg+1yVujThJByZ4kU8cK3Nkxfcu7tff4pnXq
	 fQ+aNHZqvuZfJ3/cg/kBoa1J0EqaKCLlBeqJnmz7bwvPOV+1mYvwCniECuNNAFvwp7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FlDkgFAf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A540606A323
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 11:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A540606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FlDkgFAf
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso9764425a12.0
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 03:35:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795779353; cv=none;
        d=google.com; s=arc-20260327;
        b=iIyoaCPTgTqkv6tSp6t7XseiVhcX97dxpRIXOO7XuJywtwumxa0FAbOPv9iUN0zxFR
         4x1eLPotkJhKtDE9jRwax5FOOjKvr89teTJng5+m1AvnEsz4CAikuZQVDssOVQKv299j
         ISfV1MnE0Vso3ivmB4OvtnrM8kPYKDXZwkerYmaApBZD1LAYos0LCicLpoU9PAXXxu3K
         sIBUD9JlFH/iyA9ojBAC7swc7jMz8C6bzyfV/vZRv4y8yH9QwWK2Z4WrRmZMc2ehcQZx
         EtdzJ0I66BfObHZ6KTZ7nCzU1jhuwbBXLrYQ962dBWIasoR1mVzjvE+ZJ9sU8KSRla8q
         0Gjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zckLxKTSVIvkUKQrRBT4ZQPN8xSZzGvjPSGz1nKrgeM=;
        fh=jYP28o2EIlzKv6F9KoVXXep6XOg7knL8ynga0JSjLNo=;
        b=dnn+W7mQYIol3DFJyjetXO5NtNyUT+27mbDM8ckLDIRCQQwUaYpE5WB86gZTN3a6Ys
         Udmc1KrqFwtXtCPaXx8pL9kdZA5AJ9P6hAVTEaoEyhqISGnEt+KSB5SUgBTxcownhmpM
         gSE2pwlbAAuboz1yNhOEFQWunuLI7oM5C+8S2+fuLfPzTp0/2ZJWrx97xIn6rqwl2J7Y
         biy8Yy/a0RAhJTKAorvANzos2v+l5/dDl9UcpZ+YsPxkYm4B1mxK98p//2iyitVq8in9
         LideILug3wAu7k5Q3nqtv/GpuiMU9YjqGGPrd7uVoD+CweAav11+ncLOj7p2Qqz8HgNt
         RKEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779353; x=1796384153; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zckLxKTSVIvkUKQrRBT4ZQPN8xSZzGvjPSGz1nKrgeM=;
        b=FlDkgFAfSzM7eBrAZxerMP/NdqSZ2RnfoQRgX4BwqF0QvrAdUBOTb0ILX9UKKec+RH
         /xZ5d7NZ/9FcaHVkaqTs63h9/v17EAyX3jY7VSjbSvWNelleUVDgQiUMYf0SECkiOpMC
         OPYG10MgJ3e6jDZSjqfcedfuBuQdgpM1OVOP7jjJ/VIcbtuFoAV2d2NBjaAreeY2Cvqv
         EUSCFQfJq7/DLRrnK4FmxrDeop7TkdOp1Of9eqnweefYDFk9Y/w9/CFHyXIrKFSW0qkM
         kwfjyzGENKdAQdOPye5aAV4DUT3r43DlPW30txn/mtjoOwMfD1EiV0vse+0dYKR9SVcG
         k6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779353; x=1796384153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zckLxKTSVIvkUKQrRBT4ZQPN8xSZzGvjPSGz1nKrgeM=;
        b=TQVIO1CpcriKdBPV1P+JJZMVVml+kpADgyzo+Ugdcr6GWHfgrdmJz/J3gXm72udz6B
         mabF3wSx77gj8kt4GBe/CJbhWUGBIL/dER0bouuh2lnOBemw1VN61Odkpk4snfa9e0KK
         upXelqz56wav9kelkYV+LQrG5s+loqdPntm8AhYTER6ustMeU0Vdwzth9IFBfdOQu5o8
         XtDLPjWL8mbJxR/T9RyZsFdv6x5YQsKiGFHki4qFbog3du+odzQO3BDQLSLTkY/kKE7K
         zxDOmnn/CIMNVAI0OWD3LmoVUc44BkOWEcTxN8GUZoRtVf/kV5AAv6WqiKY2w06hCkbB
         rrYA==
X-Forwarded-Encrypted: i=1; AL+hErHex+ggRWFtbc9UJdCxzasieFqoK4JiABsaToimwCI8wDov0X32G8qlW+q7gMnD/xZV61iN@lists.linux.dev
X-Gm-Message-State: APuU4Z8UKIMVTqG6O1nw40xNkxiQiJL2Y55vJhHMvbsqnECtTWm359Lk
	VglaSUxfF9XQ8UaDXPXnk0S5QZFswXVKGG0h6ZijLQ0wtsBCNC6qGtmnHpLT2r0Z6jdU7QvSBtr
	d8X7rMz/tt14VvP5R/NH6QNIlGBbsKyk=
X-Gm-Gg: AZFdTZf4yhocptalYHRAY+/rdm9K5ZMb6Ohoqd0lcazKqtd8CNzionXetPEkNXpL6rs
	zAWYa9Cr7elHIM+QrM2ifxaIOFYaLxN9472kPF8PkPRrvyommHTh4yKAET+akGTIKVQ+aJStNGg
	pHbL9kwk0Q/zkwXtAlOzrPm5+ulWyMaRLVBxHQTCLqbqIpSpZk3J8S5kex9sfYss45ZFjbdjj7L
	KZyHWRsG8r/ODZCQ7SRX6xp1/pEMILmyeNdiDW0Vyz05BlmxRfjqtcwn0D6Wfw3m8TrGmy+PmWB
	8Cm042zA/FrJnSoffCnw65nRdsWz0hd5Kfb2nsox691n7n26+NwaIqFiXjHleH9BYN/IZiqXsgw
	du14r8QgU1R5bNadpgDtPMqcUYoMeZpRrdWhL7lfNhOkaSkiM2AhVAZNqCHH2kM275Ma+MQ==
X-Received: by 2002:a05:6402:42cd:b0:6b7:b872:27c0 with SMTP id
 4fb4d7f45d1cf-6ba37ebff16mr18720566a12.44.1795779353347; Fri, 27 Nov 2026
 03:35:53 -0800 (PST)
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
In-Reply-To: <20261126163114.403846-3-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2026 12:35:41 +0100
X-Gm-Features: Aa3M54oDVUmD4L041vA_Ja2kzcuIcnu49jvnV20FPfNA1gUDEEUT8nV16GU1jvk
Message-ID: <CAOQ4uxjGLfuZMFABCwMvdXwnU+P24G_aTJLudWbjeSmWwyDF6Q@mail.gmail.com>
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

On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Update fscrypt_prepare_setflags() to use FS_XFLAG_* xflags instead of
> legacy FS_*_FL flags.
>
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/crypto/hooks.c       | 10 +++++-----
>  fs/file_attr.c          |  2 +-
>  include/linux/fscrypt.h |  6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
> index 149498bdab94..52d6a33fc9e9 100644
> --- a/fs/crypto/hooks.c
> +++ b/fs/crypto/hooks.c
> @@ -182,10 +182,10 @@ int __fscrypt_prepare_setattr(struct dentry *dentry=
, struct iattr *attr)
>  EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>
>  /**
> - * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_SETF=
LAGS
> + * fscrypt_prepare_setflags() - prepare to change xflags

prepare to change the file attributes with file_setattr() or one of
the legacy ioctls

>   * @inode: the inode on which flags are being changed
> - * @oldflags: the old flags
> - * @flags: the new flags
> + * @oldxflags: the old xflags
> + * @xflags: the new xflags
>   *
>   * The caller should be holding i_rwsem for write.
>   *
> @@ -193,7 +193,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>   *        another error occurs.
>   */
>  int fscrypt_prepare_setflags(struct inode *inode,
> -                            unsigned int oldflags, unsigned int flags)
> +                            unsigned int oldxflags, unsigned int xflags)

This here is a backporting landmine -

Changing the semantics drastically without changing the helper name
or signature.

Please rename the helper something like fscrypt_prepare_fileattr_set()
so that backporting mistakes will be caught at build time.

Thanks,
Amir.
