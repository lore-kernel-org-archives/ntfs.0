Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779540;
	b=Xvg8BY/nus0UcMa6Esba3vYV+KkbO6onVj9bLPZrHRmZ617YdxVmNnXkC3V+FA0Ozf/P
	 vU8aS2w83jVrNWa2jIQgBS19yah7JSGTcVtyux3Iix6Ad9dhD1+LqQ0cDObLusc6lkpBf
	 +p5qJnlKfTYEfT6206TfJpx4Bb4kbIScPb4eM0ry2+j5YJC+nf1gWc3ti9ORfl3cGPtFL
	 MxJqCgbtFecK1bod66FnWYDqi0zqyD8QmY8MhsnYkbxN+hf0b+PX4xx1YwGqUY7Dljg1z
	 fHm1hEii3vHw6Lo5YyBCNHPajqioQBTW5Z+0VvHjrcvCDZaaNpAR1qdzt4UBs/nW/8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=c9ZC6MWzu3Bp3v+qDNZq5DpuS0weGkOl2JzPS3hazF4=;
	b=a/uWGIz+oOyFwfRPgkM44BMJOeeClqKAf5b0H8d1/3/4IFe3rGIDmdmuAnjQWzv8Mq04
	 SwQ8GUn2gkzH+ggXBHYvKmct1pEiV8+w3Nw+uAKVdsH6Gtn7WyQGqmF8LdE3Sc/ai40Pu
	 qUgr08gsnxFzbV226Bfv/C+o0IJS4I7MI5JTPJ+omNX9/DKVxL9qRQWbY7RNcixPsKk7m
	 Aw+TPFTIkzOXryF75FNuKLBRag5WDlLhW3Xa+qo3nPp8V/dHqxhnCzy/T9IslAY7DZEPh
	 evGpPoig4AqWlvMgyPO3rqV9hUY/svVBuQFY6RV/42hJDEzU+iufhpRoU7jF2tiyTkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiDIZLis;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1A6606A321
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 11:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB1A6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiDIZLis
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49a92144733so4015073f8f.0
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 03:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779538; x=1796384338; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c9ZC6MWzu3Bp3v+qDNZq5DpuS0weGkOl2JzPS3hazF4=;
        b=SiDIZLisjqQbuiLngTgEoOuVf45UKN8wmtj8dAVJw1fePZfqkzmJC5ybd51dX9cBS5
         Qujc4DFmNOwBZyNWYG0l853AydB2SG3FzNzHkhDpAkdk8P9JsCGMJjF2m99Pc2wJTZs1
         scXKzR5iaSDM6B/iu03wAcMJprkYYI/2eMwvEKEuHB8FZqn7xSPXMZAwzK1H3+WQZZMe
         8CjQd3CG1NaHq5Y3wUMcMC0jbHawx2Z05BZbZ5vS8i5HnuVfeo8JUVQvbko+Gy2/m83l
         kDgi7vw+GBTjVXsFUmncSk0Mi90C14PHa0Wbda93x5/RRgHihivwx3B6c7rBXetXoFV0
         Pvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779538; x=1796384338;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c9ZC6MWzu3Bp3v+qDNZq5DpuS0weGkOl2JzPS3hazF4=;
        b=aSLK1tKzWTI3rbe2Q6ZvMcoMjJPi+cpqzTEiQF5Yl6Tvq8XJJzwmnr7drMBRFf/7pu
         lmttiKWXMPydYDjIvV7Wn81PIGRaBHRRMXL4qGfdLFj5bzb7X7ErrMX48nO7q0/0biEt
         fsxQWYp6QO0txeSq++Y8UL1vPb9YjoqkNDm8Ljvxsyf7RMO0JyeiiTFxgqIY+hioDlBL
         2wpS1Wz/0awOEE5KHvy8vh5R1PopiBqSl7IO/FS6+nJmQWn4/mvbFXAOqh3qFctBxDhA
         6s2cD8/87LDXHdtzONNK1bLOEVTrK2dj6+xIQCM+0ys7IUaxzockiQR2QZEpDN+4H51B
         5lxg==
X-Forwarded-Encrypted: i=1; AL+hErGB9oWVI9oGpeW0KXKNCdqFFl7BIFgpr2KBH1MyRUDLqUuHuTUVRKlVY7NkMsSGMNQN/1Lg@lists.linux.dev
X-Gm-Message-State: APuU4Z9/Jgzc1KjvM3sEdLo0iO/ORaUP9lyhVY3DbvUIkmmYmvk5Gc+3
	jdIVGT6mdHNzN/lwwgw9/cHuOEhElz9osZjAfLONC29gmjzZnbMzOB5f
X-Gm-Gg: AZFdTZeDmHmGgpQKKmNhONmTYD5qfkD6n78pD3krU/2fgK+MBJr+pRSTIqS9pAKsUrT
	zVV3HAafq7NI+XezWbVISB7mHu0cgkyYoc8BwTXr7Bi61s/bYdQJWrBwaYbcdZw1KKISX+5B1Ku
	o1+huQH2ihxNJULMh4hbDNlgJK/RifSWakIkfEPhwFIGemYiiu8ekbarNW+QlSkNUQDKKPxUZk6
	xXpTjmA1WzIuLW9cB4ukvgzRohUDVkprJAgg+otciS51/haHur4fmXgE21KEM60SHCE13eWc1fu
	re7621aCCitmCa/zGvz1jS9HFLhB3u3JXso1ioHppf6H959AYcGwn6jxow97biyrrGJnwk10V0h
	wuUEWInxZltUoMwsTMSVcPRfeS9mNWo+A0MG8rvSSqGz9ZVYv6oVi0DlHmnoZfFqIQU5dthj2AJ
	6XcCVpNPW7vtMcNUk/4V02PJZrs1akw4wbP7qULrVULayxqL6f1v3bGuZXW6DIFtXkoedRxqZ3b
	m3hIvc7fJOvdck5ipKfP2BlLenpDzcdObZjpnVmaUEjsIZIzZTNwx8P6Qn+FwAzncJ2zpD+WNaf
	em2cs4+sEJ4GNyVBEsfJfT554j4CkBwvgp1l6EBJ5QFuqxkJ
X-Received: by 2002:a5d:5888:0:b0:492:5ef7:5d98 with SMTP id ffacd0b85a97d-4abb6651686mr44136319f8f.38.1795779537909;
        Fri, 27 Nov 2026 03:38:57 -0800 (PST)
Received: from localhost ([130.192.98.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm44099896f8f.26.2026.11.27.03.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:38:57 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=9ee92098a335c2a68fb67c27de6debd3005add5d1428b82089d4d2e1ae1e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 12:38:49 +0100
Message-Id: <DN5YPR39J7QI.1S1LCFLNUCZNL@gmail.com>
Cc: "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee"
 <hyc.lee@gmail.com>, "Eric Biggers" <ebiggers@kernel.org>, "Theodore Y .
 Ts'o" <tytso@mit.edu>, "Jaegeuk Kim" <jaegeuk@kernel.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Chuck
 Lever" <cel@kernel.org>, "Jeff Layton" <jlayton@kernel.org>, "Jan Kara"
 <jack@suse.cz>, "Alexander Aring" <alex.aring@gmail.com>, "Darrick J .
 Wong" <djwong@kernel.org>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Lauri Gates"
 <lauri.gates@gmail.com>, "Christoph Hellwig" <hch@infradead.org>, "Dave
 Chinner" <dgc@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <ntfs@lists.linux.dev>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] fscrypt: update fscrypt_prepare_setflags() to
 use xflags
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126163114.403846-1-koray.fra@gmail.com>
 <20261126163114.403846-3-koray.fra@gmail.com>
 <CAOQ4uxjGLfuZMFABCwMvdXwnU+P24G_aTJLudWbjeSmWwyDF6Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxjGLfuZMFABCwMvdXwnU+P24G_aTJLudWbjeSmWwyDF6Q@mail.gmail.com>

--9ee92098a335c2a68fb67c27de6debd3005add5d1428b82089d4d2e1ae1e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 27, 2026 at 12:35 PM CET, Amir Goldstein wrote:
> On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Update fscrypt_prepare_setflags() to use FS_XFLAG_* xflags instead of
>> legacy FS_*_FL flags.
>>
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> ---
>>  fs/crypto/hooks.c       | 10 +++++-----
>>  fs/file_attr.c          |  2 +-
>>  include/linux/fscrypt.h |  6 +++---
>>  3 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
>> index 149498bdab94..52d6a33fc9e9 100644
>> --- a/fs/crypto/hooks.c
>> +++ b/fs/crypto/hooks.c
>> @@ -182,10 +182,10 @@ int __fscrypt_prepare_setattr(struct dentry *dentr=
y, struct iattr *attr)
>>  EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>>
>>  /**
>> - * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_SET=
FLAGS
>> + * fscrypt_prepare_setflags() - prepare to change xflags
>
> prepare to change the file attributes with file_setattr() or one of
> the legacy ioctls

Ah yes.

>>   * @inode: the inode on which flags are being changed
>> - * @oldflags: the old flags
>> - * @flags: the new flags
>> + * @oldxflags: the old xflags
>> + * @xflags: the new xflags
>>   *
>>   * The caller should be holding i_rwsem for write.
>>   *
>> @@ -193,7 +193,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>>   *        another error occurs.
>>   */
>>  int fscrypt_prepare_setflags(struct inode *inode,
>> -                            unsigned int oldflags, unsigned int flags)
>> +                            unsigned int oldxflags, unsigned int xflags=
)
>
> This here is a backporting landmine -
>
> Changing the semantics drastically without changing the helper name
> or signature.
>
> Please rename the helper something like fscrypt_prepare_fileattr_set()
> so that backporting mistakes will be caught at build time.

Yes, though, would it maybe be better to just use xflags_to_flags() in
the vfs patch instead of changing the fscrypt function at all?
(Also to avoid maybe having regressions, I forgot to test fscrypt)

Thanks,
koraynilay

> Thanks,
> Amir.



--9ee92098a335c2a68fb67c27de6debd3005add5d1428b82089d4d2e1ae1e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawlryQAKCRA0bnTtJTDo
OAscAQCnLyzS8zZ9SFk9wktpq3tvXIGHHr6PhrHJzvvIIX5a3QD/d7iHp6UzpXcB
1oYG2CGEhM4jPCS3n/9+H/haKMzfdwI=
=mdIi
-----END PGP SIGNATURE-----

--9ee92098a335c2a68fb67c27de6debd3005add5d1428b82089d4d2e1ae1e--
