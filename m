Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804930;
	b=M/Z62a/+QustjNa/BzVdvU60L6s7vWDy8UqEm1rvpis+jHOcuUBHqsu4WHi74WqupeqT
	 HK3/O11AZop2CkFojWv1fCyNWcHM5moWLzi7QuwUBWA01dscjxms0mE0767RmfC36HFxh
	 DEVpM5PIKOUoec4Uv2lEhXlO5uns22Qq3WJLxpaMQJqO8nq5EPjozY+jwRd/UaCUwRQoe
	 xAHN9OS+dyFBQSQrpF2xwlXOVPG2m+9IP+ODkfImHi9o62ojzr0bXT1KiQAux0nnTvoCL
	 EwC/6e/i2HKRL7AreKdygOxZlKFsB39cAbZuDzM1mqL1ESfPRBoc2fYx52qxfqUUDzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TUljqXlhZxTlbThpwiTid+WCRjyQRpD6xEshdFq1HmY=;
	b=W1+RdLQm3a++NSqHlQBJT67qofxYFy1dQ6oqdlkcns+ptcbxLQUCkUo6uAohxfb0NK6V
	 OsT8+AjskLUMwl0HpO9XADULC8y/xs4xglror17clRqvXQq+4crgUwcGfJ/Sl6h5T8+iN
	 6z1VxDByXU98qmIghdeErDAkiMqJ4x4mlp4aKRXE/nqlkrHySjOfIf/H3IIG3cUMQbg0C
	 Sr1mA6TYSz7shBS2xWvM3RGvlOA2bMt/BVRUc7IrZbYM2dU/H6anuRGe+KcpJuMyn56Fq
	 aCnF9lIqEKLH26R8SiBzqkx59EZFv4EHSsZlwdQqKt2eQqMhJOwwQysIVDO4LWsPuxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3kVTrhV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD924606A31F
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 18:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD924606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3kVTrhV
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so9857340a12.0
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 10:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795804928; cv=none;
        d=google.com; s=arc-20260327;
        b=V9HpoXrNFf+YZY3f2erP/20jPnKm9wkIrv2SQsHa7/Qp1MS+YeWpwBS+SWQ8wU/h74
         5MYw3Ko+s0xxwI9VqwogyTDL414m1DkeGqEFvOpDjoeZwmarmxSDJJqDCBYLVTY3oWDX
         2NVdBEszvRn5UbYMiDUNcIZYfFkIYUCuHM9zJBu0iOH60zthjDC3efzwCAeGUx75MX9q
         Qf2DAh4eaCXG3q65BiTdNLnbAzPnBsQ7mWuP1TtVAL72IHeAZpMF2rdl+x7cgrHcq2ua
         iWbZ7Qkeygqr/SdeoB7KTCf4Cks+uxePJMpC4qw9Xd/M/wO7LUmINcl8Xj2/894b4HPm
         7+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TUljqXlhZxTlbThpwiTid+WCRjyQRpD6xEshdFq1HmY=;
        fh=s+gLd6JODqHzbOttAXZrv0AUyc1EFaxK9q+rwRvUajE=;
        b=e540yr+xbd494P0Oq1nbP5faTQvtUbpdsupnLP5FGwYn9ULDILBTCTFkAKD/JnnnlO
         425KWcwUplh8ZG+HrEzPymxECiDwwELjBJsAJc1SWuq1c6Ik6fKikboXnO4LmlUwcGqP
         OkAxvDEX6+0OHCmNETViodTPm80aUkVMICUjm1gf7DvIItuQ6GAVlcn59yIWVHSYv/t1
         +IG9OVo2UZRMLkQ2oUEtcaq1LRSJx0tTfpSbvRoRTC/CAv6adwc24TcmZb1cib+zF27X
         2CXw569XyRa5lsLVUNQF8FStNT0KjvLkZ/9L2ZdousI09cgBRzj6dKxhENueM86zkNaH
         SZug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804928; x=1796409728; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TUljqXlhZxTlbThpwiTid+WCRjyQRpD6xEshdFq1HmY=;
        b=q3kVTrhViOZOI/YYF24b7p6ioyOFYch2Bbjs+cSG7aAW+f9bAiMaxqpeBWx5fcID35
         5E1LuDPaTF2YRND4hm64fiCGDMD4j3thBQCpjn1Rxp8TdOnqGHfUG0f2YedLj2FkM+oI
         z1z6r19TqUxfltf4iYQTQX7ntSfEi0pofC6fj8dVFpkSiEib/4lmWbdnIkLDyX4D1xfj
         OvDbBfdfURGClQNGcxWZEtNjNg2DyliTe1zV/iMIimSrMPyEmU4mP3baCy/CHDhDAGVi
         QnFldjYOjW9eCP9AeNsNtC2fDALj4t8HWEY5TKQJ39K/0ZR/9kbSm8sU4q0eMfuKlZYX
         y6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804928; x=1796409728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUljqXlhZxTlbThpwiTid+WCRjyQRpD6xEshdFq1HmY=;
        b=ETY3zBy5IrtUkRXe5D4ct33vjhZuWTNMG9yDVdnQKuGTlOnlwaEOZBJu+bQRCvPQo/
         5m8URz4NdT/1zu03j1v6jZOaIrMt7MXidYw3tCBsKP+vp+IRAEAMHrIodyhqQVkX3s0o
         0QeOaxSFYgnl894dg/HlbEn1Gyz41PGXdltsepsmIGDf66NBuUDej2poVvLRPHYQ++NJ
         /AEDKoKicHrDgPkarI76zGofFfMcyz9JD4X4QpprqnqUmICKDJohIkSFoeVDeSDi23GS
         RrVjLwhrqTbgKpVC1W8inhafMqI4SwwPp49WDa9XF9AMbKVniCBQSjtY3D+JX93BKfhT
         wfHw==
X-Forwarded-Encrypted: i=1; AL+hErGzYMYmZDXGsq8gIGaRv+YMTyUnVCuU7GFf98qMrhd0p5bLcdm2VzdiAStbh8doXHC/6Z7k@lists.linux.dev
X-Gm-Message-State: APuU4Z9SFqmzB8vVrqFV2/5Cob/hu3CZhF9VEAlGRnChrYg5yuTFmMnR
	cMo/2CJRPgeXUNm8heKFmfvM8CHlb6Y3XvqpHYSIos8xW0e6Nkw1/eL9qX1tEcFj8ZcjDvgb2OJ
	j3DT8fSg5mJapT/UMgGpESXovwKOVE3k=
X-Gm-Gg: AZFdTZdZVVLW+YqCJbQE6remv8n7ZWxqcwykyGl6k+K1HYgH5TajPTBmyOQqNyMWndv
	uUcOl0a/feWFbGJSLfX2wVOujQSLXkcOq8qEUEfjpNB8T2flsuoXCciWHDikXQ32yAROo5sX/A9
	o6kCCYXZ02qZU7Pm7oT+qKSeghqsFITNFz8MIEMp1anKrkAQUlpH74TPBTbtUavkcQRW000F5FC
	6qzpVMz5pmQZj//1OszqEfhthtWaddsegAu1tlNGyqLolSRYDq0IautHEpKwHJ+Vq50yf8JPUhF
	7+lp/NwerCkrZKt7amjId1346uc7CJtw6LdT7X3HIeCjzSQcd/dtH+FAjdILAvbr9nwbZOslZ36
	pQpi3PvNcJnRwQvl1uzMLs/sAU6hZj8OMpnqynQcZXfaAb5abLTZMK5xGgL+fFb8j9x5EUw==
X-Received: by 2002:aa7:d698:0:b0:6b4:7b32:eb48 with SMTP id
 4fb4d7f45d1cf-6ba1fafc91cmr14967401a12.7.1795804927801; Fri, 27 Nov 2026
 10:42:07 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126163114.403846-1-koray.fra@gmail.com> <20261126163114.403846-4-koray.fra@gmail.com>
 <CAOQ4uxhA+93bo5WseLxe7cAvJHJ8eQodoQHLwh=iToyEVkeXEA@mail.gmail.com> <DN66YKVRVRU7.1062V6NCL4LUW@gmail.com>
In-Reply-To: <DN66YKVRVRU7.1062V6NCL4LUW@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2026 19:41:56 +0100
X-Gm-Features: Aa3M54od_6b5916mtsitDoA0D91NC5HrbGWcFpxN2v8YyDqaZJZ4Zdj0mvMUcHk
Message-ID: <CAOQ4uxi6oyFj_A9nPbgGeSufGo11L2N=QxLi2DW=ZKy25YQ5Tw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] vfs: add xflags mask to fileattr API
To: koraynilay <koray.fra@gmail.com>, Christian Brauner <brauner@kernel.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Chuck Lever <cel@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexander Aring <alex.aring@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 7:06=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Fri Nov 27, 2026 at 6:48 PM CET, Amir Goldstein wrote:
> > On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> Add fa_xflags_rw_mask and fa_xflags_ro_mask to struct file_attr, both
> >> __u64 to match fa_xflags' size, and bump FILE_ATTR_SIZE_LATEST to
> >> FILE_ATTR_SIZE_VER1, which is now 40 bytes.
> >>
> >> Add equivalent masks and a has_masks selector to struct file_kattr, so
> >> we can know when a user of this API (userspace or filesystem) supports
> >> them.
> >>
> >> This lets filesystems advertise their support for specific xflags, lik=
e
> >> statx.stx_attributes_mask does, and userspace can specify only which
> >> xflags it wants to change without needing a RMW cycle.
> >>
> >> These masks have the following semantics:
> >> - fsx_xflags_rw_mask:
> >>   * for filesystems: advertise which xflags they support changing
> >>   * for userspace:   specify which xflags it wants to modify
> >> - fsx_xflags_ro_mask:
> >>   * for filesystems: advertise which xflags they support only reading
> >>   * for userspace:   ignored
> >>
> >> And they should be filled according to the following:
> >> - GET:
> >>   each filesystem that wants to implement this new API fills the masks
> >>   according to its supported read-write and read-only xflags,
> >>   then:
> >>   * for boolean xflags: it fills fsx_xflags with the current on-disk v=
alue;
> >>   * for value xflags: it sets the xflag bit to 1 in fsx_xflags and the
> >>     xflag value in the struct field;
> >> - SET:
> >>   userspace fills the rw_mask with the bits of the xflags it wants to
> >>   change, then:
> >>   * for boolean xflags: it provides the xflag value as a bit in fa_xfl=
ags;
> >>   * for value xflags: it sets the xflag bit to 1 in fa_xflags and then
> >>     provides the value in the struct field; if the xflag bit is set to=
 0
> >>     instead, this informs the kernel to unset/clear that value.
> >>
> >> Add AT_FILE_ATTR_MASKS at_flags option that userspace needs to pass
> >> (with usize >=3D FILE_ATTR_SIZE_VER1) in order to be able to use masks=
,
> >> otherwise legacy RMW semantics are used.
> >>
> >> If AT_FILE_ATTR_MASKS is not specified:
> >> - on GET, zero fa_xflags_rw_mask and fa_xflags_ro_mask and strip new
> >>   xflags added in or after VER1, so older programs doing RMW don't pas=
s
> >>   them back;
> >> - on SET, reject non-zero fa_xflags_{rw,ro}_mask with -EINVAL.
> >>
> >> If AT_FILE_ATTR_MASKS is specified on SET with fa_xflags_rw_mask =3D 0=
,
> >> return early as a no-op after permission and support checks.
> >>
> >> To make both legacy and new programs interact correctly with both lega=
cy
> >> and new/upgraded filesystems, add:
> >> - xflags_to_flags() / flags_to_xflags(): use fileattr_fill_*() to
> >>   convert xflags to their flags counterpart and vice-versa;
> >> - fileattr_set_mask_to_legacy() / fileattr_set_legacy_to_mask(): conve=
rt
> >>   between legacy read-modify-write API and modern rw_mask/ro_mask API.
> >>
> >> Also add the missing FS_XFLAG_PROJID xflag, to allow userspace to set
> >> the projid using file_[gs]etattr() by leveraging the new masks.
> >> In order to prevent the legacy FS_IOC_FSSETXATTR from accepting
> >> FS_XFLAG_PROJID, add a FS_FILE_ATTR_XFLAGS_MASK to support new xflags
> >> and use it to validate/clamp both the _xflags fields and the masks.
> >>
> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
> >>  fs/file_attr.c             | 332 +++++++++++++++++++++++++++++++++---=
-
> >>  include/linux/fileattr.h   |   7 +
> >>  include/uapi/linux/fcntl.h |   6 +
> >>  include/uapi/linux/fs.h    |   7 +-
> >>  4 files changed, 320 insertions(+), 32 deletions(-)
> >>
> >> diff --git a/fs/file_attr.c b/fs/file_attr.c
> > ...
> >
> >> +/*
> >> + * Convert legacy RMW input format without masks, coming from userspa=
ce, to new
> >> + * input format with masks, for filesystems that already support mask=
s.
> >> + */
> >
> > The term "legacy" is always a bit ambiguous so best to avoid if possibl=
e
> >
> > So maybe something more explicit like v0_to_v1
> > ...
>
> Ah ok.
>
> >> @@ -283,20 +485,62 @@ int vfs_fileattr_set(const struct mnt_idmap *idm=
ap, struct dentry *dentry,
> >>         if (!inode_owner_or_capable(idmap, inode))
> >>                 return -EPERM;
> >>
> >> +       if (fa->has_masks && !fa->fsx_xflags_rw_mask)
> >> +               return 0;
> >> +
> >>         inode_lock(inode);
> >>         err =3D vfs_fileattr_get(dentry, &old_ma);
> >>         if (err)
> >>                 goto out;
> >>
> >> -       /* initialize missing bits from old_ma */
> >> +       if (old_ma.has_masks) {
> >> +               old_ma.fsx_xflags_rw_mask &=3D FS_FILE_ATTR_XFLAGS_MAS=
K;
> >> +               old_ma.fsx_xflags_ro_mask &=3D FS_FILE_ATTR_XFLAGS_MAS=
K;
> >> +       }
> >> +       old_ma.fsx_xflags &=3D FS_FILE_ATTR_XFLAGS_MASK;
> >> +
> >> +       /* Convert between formats and initialize missing bits from ol=
d_ma */
> >>         if (fa->flags_valid) {
> >> -               fa->fsx_xflags |=3D old_ma.fsx_xflags & ~FS_XFLAG_COMM=
ON;
> >> -               fa->fsx_extsize =3D old_ma.fsx_extsize;
> >> -               fa->fsx_nextents =3D old_ma.fsx_nextents;
> >> -               fa->fsx_projid =3D old_ma.fsx_projid;
> >> -               fa->fsx_cowextsize =3D old_ma.fsx_cowextsize;
> >> +               if (!old_ma.has_masks) {
> >> +                       /* FS_IOC_SETFLAGS */
> >> +                       fa->fsx_xflags_rw_mask =3D 0;
> >> +                       fa->fsx_xflags |=3D old_ma.fsx_xflags & ~FS_XF=
LAG_COMMON;
> >> +                       fa->fsx_extsize =3D old_ma.fsx_extsize;
> >> +                       fa->fsx_nextents =3D old_ma.fsx_nextents;
> >> +                       fa->fsx_projid =3D old_ma.fsx_projid;
> >> +                       fa->fsx_cowextsize =3D old_ma.fsx_cowextsize;
> >> +               } else {
> >> +                       err =3D fileattr_set_legacy_to_mask(fa, &old_m=
a);
> >> +                       if (err)
> >> +                               goto out;
> >> +               }
> >> +       } else if (!fa->has_masks) {
> >> +               if (!old_ma.has_masks) {
> >> +                       /* FS_IOC_FSSETXATTR / file_attr VER0 */
> >> +                       fa->flags |=3D old_ma.flags & ~FS_COMMON_FL;
> >> +               } else {
> >> +                       err =3D fileattr_set_legacy_to_mask(fa, &old_m=
a);
> >> +                       if (err)
> >> +                               goto out;
> >> +               }
> >>         } else {
> >> -               fa->flags |=3D old_ma.flags & ~FS_COMMON_FL;
> >> +               /* file_attr VER1 */
> >> +               if (old_ma.has_masks) {
> >> +                       /*
> >> +                        * Don't preserve non-common flags since files=
ystems
> >> +                        * with masks only use xflags
> >> +                        */
> >> +               } else {
> >> +                       /*
> >> +                        * Filesystem doesn't support _mask API yet, s=
witch to
> >> +                        * old rmw format.
> >> +                        * PROJID is supported like the legacy masks, =
but will
> >> +                        * be stripped during conversion.
> >> +                        */
> >> +                       err =3D fileattr_set_mask_to_legacy(fa, &old_m=
a);
> >> +                       if (err)
> >> +                               goto out;
> >> +               }
> >
> > I stand behind my earlier comment - this is too much for open coding
> > here. I won't suggest a better factoring I am sure you will figure out
> > one by yourself. focus on readability and reviewability please.
>
> Hmm, ok, I'll try.
> Can I keep the comments though? (changing them a little maybe)
> I think it's important to have them since we're dealing with bitwise
> operations and a not so easy to understand logic.
>

I have no problem with the comments.

> >> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> >> index a13c7b32a1bd..63d88ebe3420 100644
> >> --- a/include/uapi/linux/fs.h
> >> +++ b/include/uapi/linux/fs.h
> >> @@ -238,10 +238,13 @@ struct file_attr {
> >>         __u32 fa_nextents;      /* nextents field value (get)   */
> >>         __u32 fa_projid;        /* project identifier (get/set) */
> >>         __u32 fa_cowextsize;    /* CoW extsize field value (get/set) *=
/
> >> +       __u64 fa_xflags_rw_mask;/* supported writeable xflags (get) / =
flags to set (set) */
> >> +       __u64 fa_xflags_ro_mask;/* supported read-only xflags (get) */
> >>  };
> >>
> >>  #define FILE_ATTR_SIZE_VER0 24
> >> -#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
> >> +#define FILE_ATTR_SIZE_VER1 40
> >> +#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
> >>
> >
> > Man... we really need a bot to review all UAPI changes
> > Please someone tell the bot to check
> > NO LATEST/LAST/ALL constants in UAPI headers!!!
> >
> > Your patch does not introduce this constant in UAPI but if we change
> > it we risk spreading different versions in installed headers.
>
> You mean someone having different versions of the header, each with a
> different FILE_ATTR_SIZE_LATEST?
>

Yes, I think this is bad practice.

> > Honestly I see no reason for FILE_ATTR_SIZE_VER* to be in UAPI
> > either. For other UAPIs those constants are not in the UAPI header:
> >
> > ~/src/linux$ git grep SIZE_LATEST include/linux/
> > include/linux/fcntl.h:#define OPEN_HOW_SIZE_LATEST      OPEN_HOW_SIZE_V=
ER0
> > include/linux/seccomp.h:#define SECCOMP_NOTIFY_ADDFD_SIZE_LATEST
> > SECCOMP_NOTIFY_ADDFD_SIZE_VER0
> > include/linux/xattr.h:#define XATTR_ARGS_SIZE_LATEST    XATTR_ARGS_SIZE=
_VER0
> >
> > So please move those contacts before adding/changing them
> > (can be in the same patch IMO).
>
> Should I move them to fs/linux/fileattr.h?

Yes please.

> If so, all of them or only VER1/LATEST? (since they're maybe used by
> some userspace program already (?))

All of them.
I doubt that someone is using them and it's easy to
return them if needed.

Btw, nsfs.h also has this pattern:

$ git grep SIZE_LATEST include/uapi/
include/uapi/linux/fs.h:#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
include/uapi/linux/nsfs.h:#define NSFS_FILE_HANDLE_SIZE_LATEST
sizeof(struct nsfs_file_handle) /* sizeof latest published struct */

This is not as bad as defining it to a constant (40) IMO, but
I also don't really see the point of defining this constant in uapi,
when programs can just do the sizeof() instead.

Thanks,
Amir.
