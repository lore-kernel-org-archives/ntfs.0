Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625490;
	b=f42n30rxdsntk6D1Mnvt5Rz7K+Tj7HuYXptLuhDJzfnhyZl4pTOS6nRKJ+K648uByy0A
	 0WRZeRDHqAEd91GcsHSOm9c190XqW8c2jsnsDH7CfH+UDvoQyyKuvzyfhPYmkaN5P0nBv
	 M9Vw8dVPOX/MCD3DpZCUXJUITKE9cWq+0d588GfOwRGHL8DVwYQni/BV6gHBxiwGjt+mf
	 6PsNrUqS6OEaPbDntcmOGn2o+IoznJJVrhbvyItIXRrswMaQXUAjOe9q32CTwS6yPZZlc
	 DdcLFsk1TDjt6aJRhmq0J+xqj2BniG5fJSf161faiGP68Z7VgLuebrjKIisnzVD1yzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RXQk5HMe2BJYtF6nqI/dEd/GRzh+7/vUyfQ0kGs8Dkc=;
	b=uZelF2v0ZmnETIegojy3+kH4qltdi3wFHS/R8Sr3U/ntSVwP7Msst+kcejDgjpT6IiaQ
	 oIwJG/WckrK2UtoKZiWj80rpH9o6zylZ9tNIxnWZEMwwal3gORS0BFC0DrOJLrqkBW2IB
	 gp4czKSOl/N7UC4QGpg1X6nx+ojidZXvOXXCmbFTA3EFgeKj8qumK6aPVfwFaoF5bmpvf
	 ffCA0IQU75A0ghM9cSwuFmGyNX1HTAouxTQ+udFJ2v34AvTvvMkOhFbtKI4jDI5PQBXyP
	 9Ji5IJIaa+bTtYujra3yO65/axR3XmcFYfW6+G5MmmP/CvUtJTFRXdY2Uf2MuGhH1/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+53zlYI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929CF606A327
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 16:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929CF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+53zlYI
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so9046113a12.2
        for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 08:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625488; cv=none;
        d=google.com; s=arc-20260327;
        b=SwyA3rq4RZoK7F25qkM1syPtsxU5xC1r8gFRRpZSoelxEoIDNPfZ2YR4Vn93vGnPMT
         sP7WpZQ7srQJjHS9/CDSGDrSELcreYO8CCiIjDNO9wtesVD27Bl4H2z04qKgraQ24k0o
         o9EFsQH+b3RyXYxy6VHxJ+RnzMWOqgp5E4wL7/hKEv3geCY5MsniYGbADEd9LBb5OFGE
         dLe48yZSEauinQMaPbOFHSXbK+8ksMGXFNdzK6GChKazo01hWsIt0MHiUfaekdQzU94R
         iq9GD9AIdSUALMTwOX88z9XJEVwEf4rWgqbiSKqNXIkX8YN0jDpSMOfwUF8LNXUT/1M2
         3Llw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RXQk5HMe2BJYtF6nqI/dEd/GRzh+7/vUyfQ0kGs8Dkc=;
        fh=s5I6GqOVo9BfLOGXlPAgNib20fgLpAy3fgNixdy/Tsw=;
        b=iadmqMAQC9KbE866DuwYHbee0XSRe2EYLN0vOcLoAWmQboEJp1sSWE3QU04lc3tp9q
         nUB333WVeEMuxD7psTOVrJzKL+tt6c5VWdUYZMgUHwXE9wGVe/JhLz7yJXZjdM1S/AgF
         KBXBHJsZU/HuTTYUnUMqqzTHK9CYuYRyYUdZ5wz+6zDrVa+EIlsQTK/Hjs/Jis7cSBMd
         JGAVNyAR6sytOuPbaMwBuz+4D+jiHOwr1HHuo74YnF8IIsB4RVonyLNJbGlWEIgZndXu
         7XWN+SUpBnYR16Ym2gAXZrvCHTs15Qvlb5Zo88YptKSZoeS0t2PY1sLn/qkfQev+Z4Sa
         RbRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625488; x=1796230288; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RXQk5HMe2BJYtF6nqI/dEd/GRzh+7/vUyfQ0kGs8Dkc=;
        b=N+53zlYImGooejDDvLNYJPT8o5Ul8SlpMP2rd4P44LnbkDsa87PKpQzb9yLzPAdrKo
         dyDwVc2rCIDRNK+YtatXAfVU/GD9Cr6/5LrjpsMy8IUq9ouIyTR5W7BqETOZF1tMQtd6
         P/iZYS06hD0OokLuH4KWC5kTbmMK7ZUHDe6vBziV9TkLdg2Mrgfzgi0+0wiDdy7Eh6+g
         CSQDh8mQqsDxS81mtIvOsSvfVcaB39z7ngk7a9aGLOfADgFHbXcr4XYmu/DfnAHD/v4m
         6aUy9u7i2O2oqUq2grDOAkbn30YIXL9m0MF8DQORH5s5TLjdr0eZRFDsnld93juGUVrj
         cj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625488; x=1796230288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXQk5HMe2BJYtF6nqI/dEd/GRzh+7/vUyfQ0kGs8Dkc=;
        b=jS8i7dzoKeJIO6gpKTh0VkH/n/rycdaMYdUlwRJ8396Cuxa/jDJSlH1PXU2tlpTXcc
         XDqXacAS3LA7xqgYSa6nNq2RD/dLcenu4FwpYk9QAL8lZScCXCMg3gM71EN8c0YREi2J
         V8cHbKE9Rpua2BVCiIJLMyIySsGb+zazaiiWUkVDIhv+hwywla3om0ZgE5gSoat1K/Oq
         Euf5QqtcevivErJx87MJT3of9YacUFKk9Q2FE2MMh3tkRVM4RhV1OGI9oLM93ff/+H4F
         a6pFDDO5bYtIcn5flCinQu9hKTjLktz4gyc9sudU4pd+xdNqvG4EtCwYtr/eyaY7KKC6
         bbAw==
X-Forwarded-Encrypted: i=1; AL+hErG6rksz/dqh/CD/vSTmFP9+CCzbTCDSAbkJvLXW1e/cUz8knZmdkcDI0uPRCA7HJ/jk7N9l@lists.linux.dev
X-Gm-Message-State: APuU4Z/sgeuwbfEeFhRKzCw1TkXgL4VCzOVA2i6CJn5ls+PF8u+aXn1X
	X5ruNau897GaSNTv29Zy9HYreiRs1NLTORgU9HbXU0aIdTfLROUYMqOFW8g/GCK2fKMkiQVYR9t
	BxDemvQ6pw+uFC7xfgwp6zwGs4GSGAZw=
X-Gm-Gg: AZFdTZee71dxyX9mcFfLUt3v3Q9tx9gU3RrZgI2oirSkiqVJ20ikrVU6/iKlWYAwRG/
	2Dw1IsP2hcTm43vOHTzKOpdGPO432jnvAxyPuL0G2Wp/yKm65tjTRGjWViEXj19kJZoboSglq5p
	EaJZTG4/+K+DY/ebNPYh9pcdsjJhyGGtYrzBx+XLaT97fc+NsfbYqC8ePPOH2Icvfsrov2+B/qN
	3lo2SEzXRxsdl0DtXhFv+3x7rz1RLgG43M2/u6vbOZZwn6DLVi49jH17vCzIPFVz95xmLWaGfNB
	y2X9CaCnG1SfbSFgkDbmwPvSu24Hy/izV7VWXJ7HiSFlsIRdslYUa90Vo/6Sg7eHSrDYfdxBDub
	EnBAnCLY1BVItF5G1BioPJGjELzT6TGarRCpDw5dr16lJe/Jhj8j+5QrNdGcDXYwMbXnm3A==
X-Received: by 2002:a05:6402:84e:b0:6b8:ac39:bb7b with SMTP id
 4fb4d7f45d1cf-6ba37f07a02mr12784419a12.45.1795625487513; Wed, 25 Nov 2026
 08:51:27 -0800 (PST)
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
 <CAOQ4uxhegn1z=41_MHL1Zu2hXuPtzNhC=x4gd371oaeJE4-weQ@mail.gmail.com>
 <DN2N6A68PBO1.2QT8ZOARF4I6L@gmail.com> <CAOQ4uxhDQqEQ3T9NveBFpUmSU032BxrNV5D+_zHj8u9LOQY+qg@mail.gmail.com>
 <DN4DRUYPHYMP.20U4DYV5VBN7P@gmail.com>
In-Reply-To: <DN4DRUYPHYMP.20U4DYV5VBN7P@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 25 Nov 2026 17:51:16 +0100
X-Gm-Features: Aa3M54qBSzc52sWJyl_AAZDXWvCmiaZo0RX22LaXSRo3u2ihdyPPNj6mbzgC3-4
Message-ID: <CAOQ4uxg0g+XkPb3-kQS5ez1-rp7Q=BkYDHW0CGOFhpbcf70yMg@mail.gmail.com>
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

On Wed, Nov 25, 2026 at 4:01=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 23, 2026 at 4:29 PM CET, Amir Goldstein wrote:
> > On Mon, Nov 23, 2026 at 2:58=E2=80=AFPM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> On Mon Nov 23, 2026 at 2:24 PM CET, Amir Goldstein wrote:
> >> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.=
com> wrote:
> >> >>
> >> >> Add fa_xflags_rw_mask and fa_xflags_ro_mask to struct file_attr and
> >> >> equivalent masks to struct file_kattr.
> >> >>
> >> >> Also add has_masks selector to struct file_kattr so we can know whe=
n a
> >> >> user of this API (userspace or filesystem) supports them.
> >> >>
> >> >> This lets filesystems advertise their support for specific xflags, =
like
> >> >> statx.stx_attributes_mask does, and userspace can specify only whic=
h
> >> >> xflags it wants to change without needing a RMW cycle:
> >> >> - on GET: each filesystem that wants to support this new API fills =
the
> >> >>   masks according to its supported and read-only xflags, then:
> >> >>   * for boolean xflags: it fills fsx_xflags with the current on-dis=
k value
> >> >>   * for value xflags: it sets the xflag bit to 1 in fsx_xflags and =
the
> >> >>     xflag value in the struct field;
> >> >> - on SET: userspace fills the rw_mask with the bits of the xflags i=
t
> >> >>   wants to change, then:
> >> >>   * for boolean xflags: it provides the xflag value as a bit in fa_=
xflags
> >> >>   * for value xflags: it sets the xflag bit to 1 in fa_xflags and t=
hen
> >> >>     provides the value in the struct field; if the xflag bit is set=
 to 0
> >> >>     instead, this informs the kernel to unset/clear that value.
> >> >>
> >> >> Since fa_xflags_rw_mask means "I want to change the xflags specifie=
d in
> >> >> here", if userspace specifies fa_xflags_rw_mask =3D 0, only check f=
or
> >> >> permissions and fileattr support without checking any xflags.
> >> >>
> >> >> Behaviour of older programs that already use file_[gs]etattr() is
> >> >> preserved by checking against FILE_ATTR_SIZE_VER*.
> >> >>
> >> >> Also add the missing FS_XFLAG_PROJID xflag, to allow userspace to s=
et
> >> >> the projid using file_[gs]etattr() by leveraging the new masks.
> >> >>
> >> >> Finally, in order to prevent the legacy FS_IOC_FSSETXATTR from acce=
pting
> >> >> FS_XFLAG_PROJID, add a FS_FILE_ATTR_XFLAGS_MASK to support new xfla=
gs
> >> >> and use it to validate/clamp both the _xflags fields and the masks.
> >> >>
> >> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
> >> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> >> ---
> > ...
> >> >>         err =3D fileattr_set_prepare(inode, &old_ma, fa);
> >> >> @@ -424,6 +504,14 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const =
char __user *, filename,
> >> >>                 return error;
> >> >>
> >> >>         fileattr_to_file_attr(&fa, &fattr);
> >> >> +       /*
> >> >> +        * Remove xflags added in or after VER1 so userspace progra=
ms compiled
> >> >> +        * against VER0 don't try to write xflags they don't know a=
bout (since
> >> >> +        * they do RMW).
> >> >> +        */
> >> >> +       if (usize < FILE_ATTR_SIZE_VER1)
> >> >> +               fattr.fa_xflags &=3D FS_XFLAGS_MASK;
> >> >> +
> >> >
> >> > This looks odd.
> >> > old struct size with new flags should be -EINVAL not silently drop t=
hem
> >>
> >> Right, and the GET path should strip any new flags, so old programs
> >> doing RMW will never see them, correct?
> >>
> >
> > Yes, I think so.
> >
> >> >
> >> >>         error =3D copy_struct_to_user(ufattr, usize, &fattr,
> >> >>                                     sizeof(struct file_attr), NULL)=
;
> >> >>
> >> >> @@ -460,10 +548,6 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const =
char __user *, filename,
> >> >>         if (error)
> >> >>                 return error;
> >> >>
> >> >> -       error =3D file_attr_to_fileattr(&fattr, &fa);
> >> >> -       if (error)
> >> >> -               return error;
> >> >> -
> >> >>         CLASS(filename_maybe_null, name)(filename, at_flags);
> >> >>         if (!name && dfd >=3D 0) {
> >> >>                 CLASS(fd, f)(dfd);
> >> >> @@ -479,6 +563,30 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const =
char __user *, filename,
> >> >>                         return error;
> >> >>         }
> >> >>
> >> >> +       /*
> >> >> +        * Userspace said "I don't want to change any flag", so be =
it I guess.
> >> >> +        * Still check for fileattr support and permissions, also i=
n case this
> >> >> +        * is just a probe.
> >> >> +        */
> >> >> +       if (usize >=3D FILE_ATTR_SIZE_VER1 && fattr.fa_xflags_rw_ma=
sk =3D=3D 0) {
> >> >> +               struct inode *inode =3D d_inode(filepath.dentry);
> >> >
> >> >
> >> > No No this is not what this userspace said!
> >> >
> >> > This user space is the same old chattr programs recompiled with a ne=
w
> >> > fs.h header file
> >> > installed.
> >>
> >> Oh, right, I did not think about this case, I hope it doesn't break to=
o
> >> much of the new code I changed already for v2 :(
> >>
> >> > When userspace does not set anything is masks it means "old API"
> >>
> >> And so a modern program using masks that passes rw_mask as 0 should be
> >> also interpreted as "old API", even if it kinda goes against the
> >> definition of rw_mask right?
> >
> > Yes, but it is not a problem to describe this backward compat exception=
:
> > When (rw_mask | ro_mask) =3D=3D 0, it means "no mask" "set everything"
> > but then vfs will not accept new xflags that were not supported in v0
> > syscall.
>
> Uhm, since we have no way to know on the GET path if the caller is mask
> aware or not, on mask aware filesystems and legacy programs recompiled
> against VER1, file_getattr() will return rw_mask !=3D 0, when the program
> does RMW, so calling file_setattr() with the old struct which has
> rw_mask !=3D 0, vfs will think that the caller is mask aware.
>

True. This is a requirement from the design of v1
that RMW works correctly when the program does not change the masks.

> This causes problems when that legacy program changes the projid, since
> vfs will see rw_mask =3D PROJID but fsx_xflags will not have PROJID, vfs
> will clear it even tho the program wanted to set it to some value.
>

Yes, this is a specific issue with PROJID itself, not with the
entire masks API.


> Unless I'm missing something, there is no way for us to know if a caller
> of file_getattr() is a new mask aware program or just a recompiled legacy
> program.

Right.

>
> My robot proposed 2 fixes: either don't introduce FS_XFLAG_PROJID
> (which, eh, not the best imo)

Me neither. It's inconsistent IMO.

But it is inconsistent in that we want to have a way for chattr -p to say w=
ith
the new API "set only projid", so we must have the flag, but we
mostly need it for the mask, we don't really care about its value in
fsx_flags.

> or add a new flag to be used in at_flags,
> like AT_FILEATTR_MASKS, which would resolve all our legacy vs non-legacy
> problems, but it would be in *at*_flags, so doesn't really make sense
> semantically (but it would work well since file_getattr already rejects
> unknown at_flags, so it wouldn't cause problems for old programs).

I think this is an overkill as well.

We discussed this before.

Attributes that have X_value like fsx_projid have few types:
1. 0 means disabled (all existing values incl. projid)
2. 0 is a valid value but cannot be unset (btime)
3. 0 is a valid value and NULL/unset is also a valid value

Only for type 3 does can the interpretation of
(!XFLAG_X && !fsx_X) be considered as an "unset"
and anyway, this will require support in individual fs.

fileattr_set_prepare() already treats the existing values as:
fsx_X =3D=3D 0 =3D> clear XFLAG_X

And xfs returns EINVAL for !!(fsx_X) !=3D !!(XFLAGX)

A simple solution is to fix the flag according to val in fileattr_set_prepa=
re()
if rw_mask contains this flag:

if (fa->fsx_xflags_rw_mask & FS_XFLAG_PROJID) {
    /* Possibly legacy chattr -p compiled with new headers unaware of PROJI=
D */
    if (fa->fsx_projid =3D=3D 0)
          fa->fsx_xflags &=3D ~FS_XFLAG_PROJID;
    else
          fa->fsx_xflags |=3D FS_XFLAG_PROJID;
}

Does that leave any problematic corner case?

Thanks,
Amir.
