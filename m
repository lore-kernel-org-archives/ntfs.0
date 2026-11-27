Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805478;
	b=aEp+Sqzc0VNUqFNcJDAWIoIZ3vMCChuQXk5Q5bnCPnP4xBVoR8JAMfE+Qq/SpO/Dmvug
	 3kA+H9GGhetXcaMA2QukdfIs00fwmuC0H5by5arWcxodeY4ghR57+VUtpyHrg20Ut8j86
	 RW6ZvwkPEH1xk+iVhtql2jYdn5U5ia+T0tqbm5hInZjfUFL+4xVai8rUzN8OerMpzz0gV
	 MjqmBuFWCfdGSZncSgUVylDu3uCXyQUJ4FpEo5fMvMT7r+D8TLklRy8JwbyrbPA6xw/J3
	 m+XPp7rBIkt6JUaFJcfG4w8anaOcrOzbD0fbM3cSpf+y935j5B7oQLsM57VnIn7+FVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=JmL8LoMVs76VvbagqtHAZXdxFbOYrgh5zmv9OUe36GM=;
	b=HxAQ5Tm8TvIbHeiNNM5GOR278MINX2YNgMUpkJbBewqoSgYsxjW4/18mDdOX4DKrxg9W
	 TkkobEOtKKKquYZ8oxiV7+uZIYc5BCTWcE2LSA+6c/2+BJCQ2xc87/BogI3ZW/E8zoHNA
	 s5VcQ1vT8nq//uC6xDEQr9bBMSf6H+tSOK4TWobN4W25RZi2lA3VYzw8lRY01QR/vwhx7
	 5OswsUJS0KPJNeonMXOoeJX38TWJfPy/aQK/T7zpw8kyn4PBk37ZPdHZJuFIOr6Xhnqi4
	 8icOU+vDSHXZa5q7Yah5qY0B/u2Wq4Mpwi9fw2S1YpV0WWx9Zx4u2n63DM4+FFQ1x3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qgz7+JmU;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C993A606A31F
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 18:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C993A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qgz7+JmU
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so4995025f8f.3
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 10:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795805476; x=1796410276; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JmL8LoMVs76VvbagqtHAZXdxFbOYrgh5zmv9OUe36GM=;
        b=qgz7+JmUrWomKVw8qsLrlRx3ndTC+Rz9E+8OubK99cYAVoxKk77C3VepAWjPXpyP+w
         LtrRuNWC+Jma0aTAzV0KePdJY+mOcM3D1OKXJi/aVknHP44TZxFQdJD7Wk2paizryBLL
         N0K8JTpYr0q+avjtof9j//0UhXnFgjJQQjMXNPGuao5LqtyrYGKw389b/VJ6HevzUnwa
         EkLzAvuEp/nTVVoDtc+9IjfyRaHiAKSfAOakigEi6OKIsLaChdzlo9JnOyVk2tRKzhTy
         JSCqK/tViPUxM9l8JCYGyCxP9evPLwo3ZnwYDiaFNnwsA90qjM3Oj8ahuNMbC8MdB2fm
         bhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805476; x=1796410276;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JmL8LoMVs76VvbagqtHAZXdxFbOYrgh5zmv9OUe36GM=;
        b=L/mGzzVJdlUmbuqW+Oa9JSycnhVpit9rFMqxVCIJzhOSGvvVQ2tvXrLWsyjbzi18rB
         X9kSuBXFQCDOgFqwHisrHDnoF2warXtTvt/Cq1336pex13zKkruR7EXaZUNq+yRwx+OZ
         8EsoAG8zdSygU5ep6Hnz5NTV1Ql7rXU75hTl9Ap8WBGDXtsCUm+Di+bbwelA1PUPqqNe
         pRvV3N+tfJDKzuci+V8NxqW9jGA6WWPSXKwIdQ0M+ihjb+MJcljEgJVcmU48D0+V2Sml
         xzXNFaZXyA56DflgG/XxoTHsNnYGIiPZmAwpTxaQzk3s4pm8I7s04jQSblqqHiaxCIqP
         K1Cw==
X-Forwarded-Encrypted: i=1; AL+hErF5KIV5TRB8bhn0G2Up7xmN9KtZd4ssz3KIB3jxSd3Glqfv9UoHOOciFcHqeXkO0IBktJ8D@lists.linux.dev
X-Gm-Message-State: APuU4Z/P8LwZRO3GPXBzi4T1k1BFz5jo8JuRofwrwXD6DWHxlIgV6ssW
	Jp3r2Uu69jPdPtW2+vHhIQb4daDkA5t2Ibuu0FIlA4Cud0UeS0NpKGlz
X-Gm-Gg: AZFdTZdkmF3T4/Pe3j6GUfQ1xoMsrr7G7YL1VvviKOqAcisGUe3YrVQPjJrVPJ2Jaaq
	X7O1YrjdnNJh7Wc8eNjQVxphXDCVrFouRsfp5j2/WBuphBA3RTGKkMOb+KUIGi5ftdNZOBxhZJM
	umR4Nl6dgcm48+1kunSibXSkQiDtfFE4zFmee/fZ5/MdQixlE90TkGq3nBB6NuZ9K+C1xEuFdc0
	uRxJs+D7d1SKQ74QQ80zhT0L+D/JOLZQairUIf8huDXKrFJUd8Ch8ufI/FZCi2djlUjXCw5pr2g
	mEx9qn2dPE7rma47M/KmOUHJ2kWN0mPhCdnRFX4tgViwAYeuYu60PJarGlPW4jXopyjEeIr4ln8
	7fjsj0WyyMvveaB2w3LZq6rx8rw+nM7imGlg0uSGiaoKe4Nz29BcFqpCL1DI/v2XhhafJu3B/bF
	TxrVuKxnW8aeNCGrFw686vTMRwnEYJspH8c/1tjqE6GlEWgVRyrabLd35w3JNcNEQaxBuIICkYK
	fEgvpCDbYksCPmnker4BlIVQRyltbcgu9Qle7d2lgkp4oVbnxav6XjoD91xbu3JgdrK2cFT68Qz
	MTbpAMsBKCSVfh+lKoC94yOPrQ==
X-Received: by 2002:a05:6000:4812:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-4abb55185e4mr49465105f8f.50.1795805475952;
        Fri, 27 Nov 2026 10:51:15 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4bef07f9e0dsm4921752f8f.53.2026.11.27.10.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 10:51:15 -0800 (PST)
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
 boundary=3d0117b6230d8b8a6a185cfbfe10dda73718c7f46272653fffdbe69dff91;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 19:51:13 +0100
Message-Id: <DN67WTNVL19F.1D5GOBP57BP1L@gmail.com>
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
Subject: Re: [PATCH v2 3/4] vfs: add xflags mask to fileattr API
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126163114.403846-1-koray.fra@gmail.com>
 <20261126163114.403846-4-koray.fra@gmail.com>
 <CAOQ4uxhA+93bo5WseLxe7cAvJHJ8eQodoQHLwh=iToyEVkeXEA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhA+93bo5WseLxe7cAvJHJ8eQodoQHLwh=iToyEVkeXEA@mail.gmail.com>

--3d0117b6230d8b8a6a185cfbfe10dda73718c7f46272653fffdbe69dff91
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 27, 2026 at 6:48 PM CET, Amir Goldstein wrote:
> On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Add fa_xflags_rw_mask and fa_xflags_ro_mask to struct file_attr, both
>> __u64 to match fa_xflags' size, and bump FILE_ATTR_SIZE_LATEST to
>> FILE_ATTR_SIZE_VER1, which is now 40 bytes.
>>
...
>
>>  #endif /* _UAPI_LINUX_FCNTL_H */
>> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
>> index a13c7b32a1bd..63d88ebe3420 100644
>> --- a/include/uapi/linux/fs.h
>> +++ b/include/uapi/linux/fs.h
>> @@ -238,10 +238,13 @@ struct file_attr {
>>         __u32 fa_nextents;      /* nextents field value (get)   */
>>         __u32 fa_projid;        /* project identifier (get/set) */
>>         __u32 fa_cowextsize;    /* CoW extsize field value (get/set) */
>> +       __u64 fa_xflags_rw_mask;/* supported writeable xflags (get) / fl=
ags to set (set) */
>> +       __u64 fa_xflags_ro_mask;/* supported read-only xflags (get) */
>>  };
>>
>>  #define FILE_ATTR_SIZE_VER0 24
>> -#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
>> +#define FILE_ATTR_SIZE_VER1 40
>> +#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
>>
>
> Man... we really need a bot to review all UAPI changes
> Please someone tell the bot to check
> NO LATEST/LAST/ALL constants in UAPI headers!!!

Forgot to add: maybe Sashiko can do it if asked nicely :D

> Your patch does not introduce this constant in UAPI but if we change
> it we risk spreading different versions in installed headers.
>
> Honestly I see no reason for FILE_ATTR_SIZE_VER* to be in UAPI
> either. For other UAPIs those constants are not in the UAPI header:
>
> ~/src/linux$ git grep SIZE_LATEST include/linux/
> include/linux/fcntl.h:#define OPEN_HOW_SIZE_LATEST      OPEN_HOW_SIZE_VER=
0
> include/linux/seccomp.h:#define SECCOMP_NOTIFY_ADDFD_SIZE_LATEST
> SECCOMP_NOTIFY_ADDFD_SIZE_VER0
> include/linux/xattr.h:#define XATTR_ARGS_SIZE_LATEST    XATTR_ARGS_SIZE_V=
ER0
>
> So please move those contacts before adding/changing them
> (can be in the same patch IMO).
>
> This is a high level review.
> I did not look at the details of the conversions and validations
> Will do that for v3.
>
> Thanks,
> Amir.



--3d0117b6230d8b8a6a185cfbfe10dda73718c7f46272653fffdbe69dff91
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawnRIQAKCRDmj22qf5IG
XJUmAP9OYQdkwBS0FIjyqP9a3I8gdrfFrp/bZms8ThGuY3SovAEA9zGXlhLiGxhC
iuYnX95tMjFyQ2w7/Y0yIwxjSTRZ7gg=
=DR0g
-----END PGP SIGNATURE-----

--3d0117b6230d8b8a6a185cfbfe10dda73718c7f46272653fffdbe69dff91--
