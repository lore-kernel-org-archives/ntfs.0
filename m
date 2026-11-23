Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795440928;
	b=HM4CtmHbSMstPkEK7IgBDFKvQNH+fGUsL2MfnjhoM+Us8xdEC8vTpDfoSCXgyOPF3qfL
	 aUxP2egtZfQuoHRXIsHxxyrE6AmZw1hLrYE0N6qJ/BVx4/37KiTwcE7XnwwNSxITR0CPV
	 ycDNPIgO/48UVZzqx1M3tgkHJQAEJyKxKiQU7HytXKMemUJvdE6AcwoiG6A5f3xY0Ntd8
	 fsa2+CdHDiy2dtLqauFxccOF7tjntXP1OCB3O4wRIdvjvQKA3Qu38hHgLAClW4nIh9wJK
	 nXAoHX2Y4kUTjsFdg1f8ySaC2LSjIHyAJHkjSM/scPUJKmLB3cuaBT3+Q75G0LpiygQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wA48BtGM3vO5100Jfaf4088EYVNimRYHtUBWITFpY8A=;
	b=iIO86SDPLOQY/ezvDcRqVs/B8GPjpowK0kuSThkgpXLpskyCbghnfrgHzqPyfzo85VKI
	 cqz2nYYqvPaVtEbWcOgmtgd7bfcZbMY5ff6Zz0YrlghzFLoy6xeDWkeL8Govpa76O/+h+
	 NpiIxGR0uoYGHAbioPb50aQSXKpRrkwGzvgFZyxrWCB9sBcMQ2T8BPuXBNXORd3cXA3R0
	 DNc0QWUjYCAy9S8ncILhaf4iJN/WwEl7Q2HJp91P8R+fd+K79HuGr2mvAa/iSV8v6A+t4
	 GZCI7SIfO9xos2v7xa0s50VypsvrrkH5gmz0H0bdYLCY1gbD2sI9uRRdoXowHaFbu0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckWo9Udw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40687606A32D
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 13:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40687606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckWo9Udw
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3952489a12.1
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 05:35:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795440927; cv=none;
        d=google.com; s=arc-20260327;
        b=qBwM9n+HiJKsnZGHb16xhUla0/yEjlrRiQfDFRZpGiZd430j1uBgd0BZVQdi5wQRZ/
         TW2pL+e0eXTsn2d/oZEjMCLopa+dYvQafBsUGWV+EV0kyHN5JPNTD1R1BFFcEr1uxBjs
         W1/qBtowAt4y9RM9ofgTX+jUJq8Vxs+m7Ej5z7qjUtxNWiu7O4fsmBbPpt2vwQQAJDEH
         txDTRop2O1rFuJFSv9CyGYDhK+v1yw6ar3YMBnUekv60WFRzQ0bPK4p2CfFvznBUmqez
         RyYgD5dmOPtBK88kNi41cLZmPksJhuZNpGaK5MKAUFdnPPrUFv9M6qCwn776XNq04iVJ
         b+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wA48BtGM3vO5100Jfaf4088EYVNimRYHtUBWITFpY8A=;
        fh=k/eaUftz48IDIFWR1/AjIQBqpZ/8Lnw5RwOzQcOYgd4=;
        b=rigm9mhN6OscFTqJw6RMW6tJ4HM/fAdoywlx7qBx4ri7VE15Q3lSaQcYgma0Va8O2W
         APSSRRWKSA3zP7Lp7O7vPgU9b3vsAOVma9QodCAnSf7vi0vncVRmRN9xqo6GKBHdtKC4
         gRBn8KwgvI1eXFCmziEY5p2/2UO0Pase0+83GmwLvkEF5oe78Rj+IBugT17PVEn1jq6J
         Phr9YrhbObHXdf/McgtpTpEcI1VSVz1kKolIfPT8/jyoy5xepyjTl9DdJX1Fz8TAxUan
         fXZLgLUanBXtRnTXb3+agbTutCVASDS0uDVhQHT4TxVmjSmqyOFK1pOH/x4fMMppSzPH
         sm0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440927; x=1796045727; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wA48BtGM3vO5100Jfaf4088EYVNimRYHtUBWITFpY8A=;
        b=ckWo9Udwq5ULQRKorPycuCfZjtIHdz2kdrY5GXD2IDpAx1SY9NaOQgqbBeBhqemlCe
         77q/SZ6z2k/Vz87Y4pxTBBBuNjQOYQ+HeXLbDV622TcYj2+mhMKjhLkmBfzgI/n/fat1
         29X1NyNx6GuB+Ilz13b0fbUQVO8iRP17HAS6fCh9jEXF3LG9z/nmPzt+h0LlWUNGhprE
         3eMhXQnVoNN8xor9cMOzUdjkRZ/ZyN0LDLtP6dWRBy9ZVD+8jHJRiJfd5ORj3J54W4Z0
         mAsxhxpgA81EjEgkmef91i9+V8aKMAwtFS+NbSIFyk8t7v/F+n1Zy02ML2cdX74RJCOI
         4O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440927; x=1796045727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wA48BtGM3vO5100Jfaf4088EYVNimRYHtUBWITFpY8A=;
        b=qrDruDCZGpXk/tSYO3T32M/zqlnSnWntAgLaj/UXyCxO74Nc+tJmBJ0SNCp7WgdFpE
         l+yLRl6zTbqdajq8s5MLIxXbfDsbjcBvEz9ZttH4dLHXsR74aCW9RsfxeJLGtk4fA75D
         J5Pl9QtBvOTwVhfViUPer1xGFGB91fQMvU/TprEXEK9GoRF2TwaJEee8n6K4+1T7NNi5
         lxPKC6MuJY4Nju5aun+JCoc1W6heOkSZ+cNF0kwKgqkVwow6/RR5zvRVdPUzoGMqbI1o
         dCY8ksQJrOGSsCjd3RJcFNTtgF4GGvOVmT8RJxCXMpJo2DqnIXanlzzNpAx5sQ2u7QFe
         8GBA==
X-Forwarded-Encrypted: i=1; AL+hErFcfEmp4hf/vKyRV8z4ndvfS7abxOLaH/2fnwdGt1AmG8LPKPMucb3I2opHOZrGefgr6w/G@lists.linux.dev
X-Gm-Message-State: APuU4Z+UJJa06KcXI8TTnnkt6MQXwQPLBQvSD3X6y/aq1BPEmojpSYMp
	j2RNNTajfgQ3qnT4yHfEXS9gWkfbGivS51OP8Rxiocm8CnLOU5htLU/18bOE1BxIUDIi/epMOzd
	YRiBFT4FDz79UnRgB/W10fDklAv8sYrQ=
X-Gm-Gg: AZFdTZczKs42fD4iri2IWaK6kYLUfD+/jpieaNTe5H2UlIt+rr19pjAmHSd2LchIAu3
	h4XVEvHWp282U0LZch56oWfWJ0xBfrT+M1/2F+AO9uvYdQpoffEWOSG9mJztjQA1hP0DArb5iZd
	9SYECrHVHW1teVc8BdQI00qRzad7EaV4qZr/ngBN75q53v7kPOwa54j8cy7t8vMkuVDUQotwQw6
	MwkMQJVBhZJ45PkJBayXlwEdeYjHTEc1lDh5utkZnHJkisLvayrEH1AH8QHjSzWYzagwr/7iC8/
	NgRd52SDp63oIMb03H49Xlb2mofW9jsZkFqTu5NLPC9B8jqyaCdG2cS88PDHOx0SvlFe1RHe3Qa
	zUQpXw5/Khhxg2UX84NsBEZaYYodyjSGYi4iXWulIuZzlOBz59OICMEX+afeuPeRxoKh/ug==
X-Received: by 2002:a05:6402:1ed4:b0:6ba:7e42:d88b with SMTP id
 4fb4d7f45d1cf-6ba7e42da5dmr4190054a12.12.1795440926543; Mon, 23 Nov 2026
 05:35:26 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com>
In-Reply-To: <20261122000856.536902-1-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 14:35:15 +0100
X-Gm-Features: Aa3M54oltothA2ZyBgLZ2dfkBmCeGTagh_PAD6Wp2_FkqMP-qy6jOW6gmvjqNlE
Message-ID: <CAOQ4uxgf2KE=Ag13EPAu5=KnrFwt7zRH=im-qmLc8+i10Tjd+Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add f*_xflags_{rw,ro}_mask flags to the fileattr API
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
> This is a follow up patch series stemmed from [1] and [2], splitting the
> _mask change for the fileattr API into its own separate patch.
>
> The first patch is a preparatory patch so that the code in the patch
> after can be formatted better.
>
> The second patch is the actual implementation, which introduces:
> - fa_xflags_{rw,ro}_mask fields to struct file_attr
> - fsx_xflags_{rw,ro}_mask fields and has_masks selector to struct file_ka=
ttr
>
> These masks have the following semantics:
> - rw_mask:
>   * for filesystems: advertise which xflags they support changing
>   * for userspace: specify which xflags it wants to modify
> - ro_mask:
>   * for filesystems: advertise which xflags they support only reading
>   * for userspace: ignored

Nice!
I think this API description is very clear and coherent

>
> (ro_mask for userspace was also proposed as a "verification mask"[3] but
> I left out that semantic to keep this patch series more contained, and
> can be added later if needed.)

Not so easily added later.
We cannot change the meaning from ignore to verify without any opt-in
later, but we could use the combination of
rw_mask |=3D X
ro_mask |=3D X

to "verify" (set it as long as it is already set)
all we need to do now is make sure that the API returns -EINVAL
for rw_mask & ro_mask on set.

>
> This allows userspace to not have to do a RMW cycle when using the
> file_[gs]etattr() syscalls, avoiding possible race conditions and
> simplifying their usage.
>
> Patch 2/3 also introduces the missing FS_XFLAG_PROJID flag so that
> programs like chattr can leverage the new mask API.
> FS_XFLAG_PROJID is kept out of the legacy FS_XFLAG_MASK and so it's
> defined as part of a new FS_FILE_ATTR_XFLAGS_MASK group of xflags that
> will be used moving forward for any new xflag (like the one proposed in [=
2]).
>
> Patch 3/3 converts fs/ntfs to this new API, to show how it can benefit
> filesystem drivers too.
>
> The series has been tested across NTFS, ext4 (with project quotas), XFS
> (project quotas and extent size hints), and Btrfs.
>

Judging from the number of bugs reported by Sashiko and by my agent
on the COMMON flags change,
I think this needs test coverage for the old APIs, especially with old bina=
ries
chattt/xfs_io that do the get/set cycle and re-built binaries with new head=
ers
both tested against old and new kernel.
Sorry, but the UAPI issues are fragile...

This is one of the changes that would have been very hard to audit without
the LLM agents. Hopefully with the agents it is doable, but need to guide
them how to review/test for regressions.

Thanks,
Amir.
