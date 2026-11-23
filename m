Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795447798;
	b=k1WGVamInBRfcIEIL1GBIi4C8z8DXwvqKZZt27VsyA0c5St5avy8/vNDEHdbeM2xYuTt
	 vOFYntbJtSnbXaIkdrqT9and+Dn3kY8Uiem12PYrPfCJvh/CFWkjIV5Uo+zbOr8BYB2py
	 Flkfa3qQIJSb+B79+t43JFYAr8ShTJO+GtnZ4V4sqREDWrNRAeodOReohVaEOvSaWHZ8d
	 4o7u5OFVCDKEM0iKVJhGtcqpX89F0aV7N22AZaq8ndAUXU7gBigV4SvD/WUJn5m7AS2MW
	 SHjwUlIAWKCbQOZMVYq//WJxgVgPYixLCinG7E3ABBAkktzMV0Vdr1bFOmsITQK7FtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XTqD3jTsvce7PV4dxiBL4DNg4qThdQn7thVX1pxBbRQ=;
	b=x6h2TOLCtrkNSFM0AiQB1aF15tL/c07j32QpM9MnV/SwPExjQQAJ/D72kgXKii0MrFlu
	 VymIOi61yaFRBxm6iwL9WzR+ZdGPZmJHkNa9LBhx1bdAZqW/JnJCQYucSX7O2HDkMrlig
	 83TxRALNWgwk4PtihhSRb5eDz3m4aclYqW5KxQznJTglqRe8JUNBB6XWaO5/nwBit44I9
	 Woy1xmAILg7+ZM0XHogqhZEhYfMXkJHovB8gJ19LX2GwSXx09KktKvMPtDBMWerX4wJXP
	 8dWxBXPs6qAQd+Pq9KVhoi5g8ZnuHjmGc3dPWAWjZMvbf8K+IBaVyQhm8yNCj+8JOaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2RibgeA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A9A606A32E
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 15:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A9A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2RibgeA
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso4439282a12.3
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 07:29:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795447797; cv=none;
        d=google.com; s=arc-20260327;
        b=CKp/VyXzF4cYpr/7+ni60hjBIZsUPMymk0NgGoqh6AVcu4sQ7wq+UI0qBVLzO519EP
         hs2jptC4LUpiv/2VCFydJ/U+aVZxFK61vDyoU/cUNdOY8FDxiyKvpqqy4lYsh6/AxS9N
         XuEtEJQAi4j7+Zvg3ZBFZG7HT4cRLwtkLUUQ1Mfx1/StedaeWRpji2IOiO0VfnqLkGC6
         pUJjgH48PX+UDNuXLW95j1u+zhBBUoVJ2m8YPqhj7o4NqRu5TvyAd9XAKWnSYZEJGVwd
         Fj2qtdH1wiTMvaQr1a3kMe8sOIMzz78qOG7SnrxcreH8U1ZOcLE7hTOP6XTahlqddmyG
         Mk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XTqD3jTsvce7PV4dxiBL4DNg4qThdQn7thVX1pxBbRQ=;
        fh=CV/3m0d5UBKuXFQNbPVli7EO5pzxOOQsNt0QUmyavRQ=;
        b=h+mqx5zx8KvSdmSlEOto5qVC+oq8T558medJzLdBOaVs9DhPpFZ+CFL0IniNvuflXz
         luScahygMMBNfbirJWY+1LcIRh8+3LRokirL/s9nX2goRpESZmoSojdOnuQ/mAv3AGUy
         nuukHK2HIzsFUFywCNR4yowG62qmIvJx7YghLq7xV+RNMyO9p6aTlPzfJx9ckZl0SBfJ
         bv8E9R11B9ZFkvArZ56WzZRnROlObyiy9vAtm6pTeSHEojYKP+oXA+cHOFlZ1hb+wwP6
         JuMLu/0alNAghZvdA21F0byeiYwpEqMifMmmjd0tN3cvJCkMTrFMsqawE1hxsZHC5GmO
         UWwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447797; x=1796052597; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XTqD3jTsvce7PV4dxiBL4DNg4qThdQn7thVX1pxBbRQ=;
        b=e2RibgeAlSHfDKFhK1+Mk1DewaMV4yktb82/SCEyHwCDFyg2ZpqV8Ee7iDw1nD6hIE
         l0x7b4YCZzM1qs3aUHfkymUugPXkvmBd74yxPFt26FsElRzQJOiFAz6ofttIIIcFrPl4
         MTDw9UsSHTWvlPaL9QPF3X+d9H00OFIvKrRaLfVSDrCSc8RuvjcCHjpds0Q3Nv7SVPm/
         y59RZWC1FeFXvQ4dGdH+2B691sH7Xx2RD0fuH1cwaDWggepfHlfFNk8QNRkzAW8yIHK3
         1iLwN6mMKh3wDQiBMCByPj9nwBLbxKmLfDk03qRoVALVwbwuJtjRfvb0qEZ1tL4myjE8
         FdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447797; x=1796052597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTqD3jTsvce7PV4dxiBL4DNg4qThdQn7thVX1pxBbRQ=;
        b=kOLSZdDVadus23pTA0R0hNFQE65Jllo9jSDcQ/gDdsuDp6HwrSAzffC+dBzbj7+VcW
         wHcVDIWbGv8tUgo6H23fqbNyLYznsJWxwYbHAMjRdcikOwXSpBpzz6kqZ101UCs+yhJ5
         OAJvH89OBhSszI4cJxd22QftPlQg8mKpUKw3wUwz08/Iem4znWGhnLwt7jmmg6ZM6sY0
         +5Q83LvTpL5ORF6sMMLAMqNZK9/pncCsd3+911X/cU/sgYwI9pGjEmPoikTV5DwAKF3X
         gt4CYW6D9f4N2tFSio4vM4tZl5AU91L9XnIELrcJAUesV+96j9Dkat5THU9zYSFny3mL
         HGew==
X-Forwarded-Encrypted: i=1; AL+hErErH91zcsaPYOgWoU7iteMvSLiLxpBQBxdIPwhR5uZJ77LY3R7IfhzKKYt9KJ/URQZ232hG@lists.linux.dev
X-Gm-Message-State: APuU4Z9h21iRTMATyUr9YTUx205gq49LrAt3u2lNa8KHYpCSIYCay6yB
	lD2+FtkGIX+mGcNx7h58GXjv4lCh1AblbgasO4LJCfDTdLTb+mudS/b4aweM77YzoccUJJOaPfw
	PXp7mY994KdsipDdZG9gxSnLsuARmVwji7dpBrnE=
X-Gm-Gg: AZFdTZd+b5dvYhAxXaOamdDt2zjM2H8PVJKnWsmqmZ+xmr6QEK4O9DHflQzH0Ew9Kyd
	A3KI+HBA1KdSTdXoMPdEoEWAO+FsEtlxCQ/NsfWcmPx8JHrs/kIN4svd2+1RRgZPE5g/lGEUShk
	Zc726zQ0XtWddXFRWPmejF4pd1rMpQXhvFfhqwQ/n9QkJKHVKcBrCajo2LnzAnb4fWcHKJnUnUE
	RNaNCUsfDKAuxYateho0obK1THanric4bgbzmvu0Hykvt9Qsvd4+SMq91mWT+7XIT1iET6pxu5v
	7fKKpqmL8WibnWs21+ZYyXiWO+O3ybtCLo7IuapnHIA4vNohm4ewCgkRPjozUTU4AcoJJZBtBNr
	MrdPRXhGVpvu/NJZ24Kgjf8L8/U5loncalE8kk7WgcPkbM4hZISlsKxH2l+itT4dTA4ibdg==
X-Received: by 2002:a05:6402:e05:b0:6b4:9919:b54 with SMTP id
 4fb4d7f45d1cf-6ba37f04a34mr8166206a12.42.1795447796335; Mon, 23 Nov 2026
 07:29:56 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <20261122000856.536902-3-koray.fra@gmail.com>
 <CAOQ4uxhegn1z=41_MHL1Zu2hXuPtzNhC=x4gd371oaeJE4-weQ@mail.gmail.com> <DN2N6A68PBO1.2QT8ZOARF4I6L@gmail.com>
In-Reply-To: <DN2N6A68PBO1.2QT8ZOARF4I6L@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 16:29:44 +0100
X-Gm-Features: Aa3M54rXlfF1ti3csfwg-SOdn_z3DGpZ_P359TQjfteI3PWichkZOxWgdTC23l0
Message-ID: <CAOQ4uxhDQqEQ3T9NveBFpUmSU032BxrNV5D+_zHj8u9LOQY+qg@mail.gmail.com>
Subject: Re: [PATCH 2/3] vfs: add xflags mask to fileattr API
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

On Mon, Nov 23, 2026 at 2:58=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 23, 2026 at 2:24 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> Add fa_xflags_rw_mask and fa_xflags_ro_mask to struct file_attr and
> >> equivalent masks to struct file_kattr.
> >>
> >> Also add has_masks selector to struct file_kattr so we can know when a
> >> user of this API (userspace or filesystem) supports them.
> >>
> >> This lets filesystems advertise their support for specific xflags, lik=
e
> >> statx.stx_attributes_mask does, and userspace can specify only which
> >> xflags it wants to change without needing a RMW cycle:
> >> - on GET: each filesystem that wants to support this new API fills the
> >>   masks according to its supported and read-only xflags, then:
> >>   * for boolean xflags: it fills fsx_xflags with the current on-disk v=
alue
> >>   * for value xflags: it sets the xflag bit to 1 in fsx_xflags and the
> >>     xflag value in the struct field;
> >> - on SET: userspace fills the rw_mask with the bits of the xflags it
> >>   wants to change, then:
> >>   * for boolean xflags: it provides the xflag value as a bit in fa_xfl=
ags
> >>   * for value xflags: it sets the xflag bit to 1 in fa_xflags and then
> >>     provides the value in the struct field; if the xflag bit is set to=
 0
> >>     instead, this informs the kernel to unset/clear that value.
> >>
> >> Since fa_xflags_rw_mask means "I want to change the xflags specified i=
n
> >> here", if userspace specifies fa_xflags_rw_mask =3D 0, only check for
> >> permissions and fileattr support without checking any xflags.
> >>
> >> Behaviour of older programs that already use file_[gs]etattr() is
> >> preserved by checking against FILE_ATTR_SIZE_VER*.
> >>
> >> Also add the missing FS_XFLAG_PROJID xflag, to allow userspace to set
> >> the projid using file_[gs]etattr() by leveraging the new masks.
> >>
> >> Finally, in order to prevent the legacy FS_IOC_FSSETXATTR from accepti=
ng
> >> FS_XFLAG_PROJID, add a FS_FILE_ATTR_XFLAGS_MASK to support new xflags
> >> and use it to validate/clamp both the _xflags fields and the masks.
> >>
> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
...
> >>         err =3D fileattr_set_prepare(inode, &old_ma, fa);
> >> @@ -424,6 +504,14 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const cha=
r __user *, filename,
> >>                 return error;
> >>
> >>         fileattr_to_file_attr(&fa, &fattr);
> >> +       /*
> >> +        * Remove xflags added in or after VER1 so userspace programs =
compiled
> >> +        * against VER0 don't try to write xflags they don't know abou=
t (since
> >> +        * they do RMW).
> >> +        */
> >> +       if (usize < FILE_ATTR_SIZE_VER1)
> >> +               fattr.fa_xflags &=3D FS_XFLAGS_MASK;
> >> +
> >
> > This looks odd.
> > old struct size with new flags should be -EINVAL not silently drop them
>
> Right, and the GET path should strip any new flags, so old programs
> doing RMW will never see them, correct?
>

Yes, I think so.

> >
> >>         error =3D copy_struct_to_user(ufattr, usize, &fattr,
> >>                                     sizeof(struct file_attr), NULL);
> >>
> >> @@ -460,10 +548,6 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const cha=
r __user *, filename,
> >>         if (error)
> >>                 return error;
> >>
> >> -       error =3D file_attr_to_fileattr(&fattr, &fa);
> >> -       if (error)
> >> -               return error;
> >> -
> >>         CLASS(filename_maybe_null, name)(filename, at_flags);
> >>         if (!name && dfd >=3D 0) {
> >>                 CLASS(fd, f)(dfd);
> >> @@ -479,6 +563,30 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const cha=
r __user *, filename,
> >>                         return error;
> >>         }
> >>
> >> +       /*
> >> +        * Userspace said "I don't want to change any flag", so be it =
I guess.
> >> +        * Still check for fileattr support and permissions, also in c=
ase this
> >> +        * is just a probe.
> >> +        */
> >> +       if (usize >=3D FILE_ATTR_SIZE_VER1 && fattr.fa_xflags_rw_mask =
=3D=3D 0) {
> >> +               struct inode *inode =3D d_inode(filepath.dentry);
> >
> >
> > No No this is not what this userspace said!
> >
> > This user space is the same old chattr programs recompiled with a new
> > fs.h header file
> > installed.
>
> Oh, right, I did not think about this case, I hope it doesn't break too
> much of the new code I changed already for v2 :(
>
> > When userspace does not set anything is masks it means "old API"
>
> And so a modern program using masks that passes rw_mask as 0 should be
> also interpreted as "old API", even if it kinda goes against the
> definition of rw_mask right?

Yes, but it is not a problem to describe this backward compat exception:
When (rw_mask | ro_mask) =3D=3D 0, it means "no mask" "set everything"
but then vfs will not accept new xflags that were not supported in v0
syscall.

> And other than VER there is no way to know if it's a SETFLAGS compiled
> against modern fs.h or fileattr VER1 explicitly setting rw_mask to 0,
> right?
>

SETFLAGS with explicit 0 rw_mask is not useful and does not make
sense, so there is no reason to support this in any other meaning than
legacy programs.

Thanks,
Amir.
