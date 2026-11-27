Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795801738;
	b=s9+7i3jyg5M+gTXSPN+lhfPQv9LYq7taGiNYCJN6CfOnmEfs6l5abTybq/3v820YJalU
	 8/oe4fzzSv5itPvoJt3zo2lKNsR9xmG0KbMVmbxch7kJ2Ptw2MpekcMUZPPiAb5Fn3cqp
	 EiX8At4ouA7RaeCG4r/7qF2kEJ/xJ1EYjxED+shMgLrY91jg/LpYM+BpmZ5UIC9b2C/7p
	 miKl8UxJXl2sLhK6X1kQdS+exjo1NvkvrWMObjt+0byENBRZktpYsMtA0Clnd1LYamnr8
	 NHgejKqlS8hlqGQSDuxAO6atDXb09M58UoofJ1O07TenkbJael156FEiol6a407E5bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4NP3xmdcvcjCS2SZQyHbU7Q7bT0EyXEC69nEAnrWWLo=;
	b=dHkwWvaoGzMWFFtPsYc1hWwXwXjaCs9AgfANZX2fDgHjW16s+aLWRirsEUfvxxJekKVk
	 2ZKwlbWuC+mAW9ZAAGX/Yak+dJxYM+JXDntd080xHnWuUxNPJL2fv7vXf7ttksvb11kM/
	 y6VXqNloQGcZlhktGZzdNCV83HbCfh5WGYdScTe2pfkoJgiVsiKzbS/IfQvRg8M7wpxNP
	 I0NkziVbYkVBs4KuTTJjaJiAAoNv+OTBUQCPbmN/OTq0HmFJs21tbDwdTrDxtP3lM+VbJ
	 tuspk1GP3yuwML5G/VEBorlfAN0GsGnNT7eekCclv3RPlT8kON3cqneTBTFiFSkpYIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yH5ConTv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3917606A31F
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 17:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3917606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yH5ConTv
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5198302d38so658756666b.0
        for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 09:48:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795801736; cv=none;
        d=google.com; s=arc-20260327;
        b=Gn8nW/x+//9ZyIZvCOa4Z6AfHZPKmYuvwFuW54dmajoBYQSIZaUk5vHfKCyR+6/8g4
         L3VwWjA90q8SUHCBd9HAyv9cWvnw8pWlE4JPFf9UoUgcdSIrWx3bHSpYt1L0UsDM/6Mx
         ipKHOQHqLzMA/2jTTNQP4XSa3luSJyTcJsa8KO1L91HOZBuUPOEkYD0kbeX4Fvl5EgTy
         6yU2ibOPNxT2QLBx2vqfpBXnFEJqpTFPv1wt3uGH2XOwLkuhz+dkIOh70L3MlHsDj9G1
         CNcHXIk2mdYIPortx1ZDlWiuGDy8/PV6MoYRdVN74S1jP+7M+uh37/ab8DkYYPgQ6GWQ
         WmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4NP3xmdcvcjCS2SZQyHbU7Q7bT0EyXEC69nEAnrWWLo=;
        fh=u7Xkodt/H+jCoLY/RhPyQ536UHh0lGg+lDKLU7cJG10=;
        b=beatE+KRm4BwUYazj+Zm4OZAACl1Yxsw8XQ/uzZ9SVD9QEUWtEE2K12vmffBkNKKsn
         tEs5kRpxrCi4YEjPQC138K+joBIqBUalA2QH2gEhxDAaz1XWy//QV43SyEcvIhdlFEjn
         MlaKSFHsGnGt0Wc38xFqClAIPTA6duL4lQtaVHjIKiTSTqKegKFymOiWciYxu/olYwjA
         dio9i2qVFGjFqfTCbw1+kGXhzCZ2N5SqYTu1pijdT8C+0uR2+XR2UyyaKOyPTfxzDusO
         dJswxgIUHjcgeuT43gLlB3rsZh99LFGx9yriSBZnXMvh/AKDZl0Agi2yf7r08x1wnDXV
         NvzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795801736; x=1796406536; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4NP3xmdcvcjCS2SZQyHbU7Q7bT0EyXEC69nEAnrWWLo=;
        b=yH5ConTvSz1lCiw3C2kpOwD4IimMeX95SMQTfjNzMVTJ4kEyNMGLiaQEDV4uQRt4wX
         LTu1Vnr/3ZobYT2zPLMaExKj3yj18BWQ6B7i8M0KMVpXjM9W5OupV1iTpCCHs7xsQGgt
         yO/i1f37kNHTrLk1eseG1drg7LYruodEJMqFPEe9GXz0aepLLRaySM/z8X7RB6btYL/X
         84JTCPwLhDQ3WFH6hIpAFFyYomlHCTQRxynqzxQ9UnITi4yIqtgpZBlw0bRLbNz062OM
         M8+2r+rhNBtJcIv+wxedNFE1a6jSDJDopHrcjhjisau6vDGd73PbGNtVNFwctqVlUdDP
         +ftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801736; x=1796406536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NP3xmdcvcjCS2SZQyHbU7Q7bT0EyXEC69nEAnrWWLo=;
        b=ANzWb43PGPmVFosVJSyOZ5gUYXPPlanmQu2dDVsBGo7kQET3+NgBABtmZA6E/pHOrE
         FWGvqk4PTq8++qfKCFauAkzPi3TtNkPlb0L5DYbS5RHyOxUnw8c9xPR9gQVzn4UprtLr
         eunf+pbkqrQZoIG3WSBDOe+bKZbXUn5E9kKcHtVObZRbTFS6I06R7GemtEilQ77GVgsG
         p5i6a8reMXp7eBt0DzNFNmhnFZmydpVNmc2cunG4p8tL69o0hMVyoDAZNkzoVnoHIPM5
         buTYj/csVlWhSEnbBL1aE0YZU1CBm0H38wzbmVYv1VnnIA2CAXPkAJsmjq8jatJNX0n1
         JZJg==
X-Forwarded-Encrypted: i=1; AL+hErFEzhCiyafOJY/hxhbzKH5tUMSDhrShWOfUrvhYuUaL/vks1BhBSl3TT4wXguEV/0xG+b69@lists.linux.dev
X-Gm-Message-State: APuU4Z/t5ryXsGkrL3PPp8cjFlymC+nq/MqI+6/VJixaKfqIPT9EuL+o
	Lha48X2UToal2Hti1eEdi+JvJeUvbXcXioqaMIJjJKqHLtKtbJ2Ubg7Ks5/bn0Yj97k6BulS+4x
	2HfQUo8Qv/rN1vmPU7IZzTvWC8+QQ7PY=
X-Gm-Gg: AZFdTZex0WaoNkGI/bCDJPlHnyhm52kFkgB25BgT0TdvFkSwUOknmGaQ/a2sgM1967q
	NqaCxuzghXAbw2zImultkzzJO0Pn7oBjQdgDeABcKbEJWPW4v5zxjLsxbTx+oIkNI3DjgZV+w6h
	/YccvKFMefLifa9XBq+vEs88YAxAIno88ofUc2dvhSGedJOqBHX/7AriU2+Pw2E9w9YYGzK75Uo
	1bCFhJoVH//2MC0YfZRFAZDXcSGfBUdQNO7ArmlEVr0Job6CMOc7OHirAPTPoA4bQwS6syL21VW
	p/ekWpwfvTYHANm5V1FA19b3yp//meYfiG03dBlX8u4+31B2nFAeR2tANF7r4S9hc/G+UaPzr9I
	9M4IrzxOdLo+hBK/lav2p5m4ZEUYyrXpyf0pQQ1faBrqUx2ynCN7THqPvXXMBykx3giaHkQ==
X-Received: by 2002:a17:906:fa82:b0:c50:4b6e:329 with SMTP id
 a640c23a62f3a-c513a5eaea2mr1670240066b.15.1795801736044; Fri, 27 Nov 2026
 09:48:56 -0800 (PST)
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
In-Reply-To: <20261126163114.403846-4-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2026 18:48:44 +0100
X-Gm-Features: Aa3M54rplZXRDBhv3WQRBlPtKHvT79Bv4I4ULdt4TzjSZUQl0v3AcaIQB8R9sLk
Message-ID: <CAOQ4uxhA+93bo5WseLxe7cAvJHJ8eQodoQHLwh=iToyEVkeXEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] vfs: add xflags mask to fileattr API
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
> Add fa_xflags_rw_mask and fa_xflags_ro_mask to struct file_attr, both
> __u64 to match fa_xflags' size, and bump FILE_ATTR_SIZE_LATEST to
> FILE_ATTR_SIZE_VER1, which is now 40 bytes.
>
> Add equivalent masks and a has_masks selector to struct file_kattr, so
> we can know when a user of this API (userspace or filesystem) supports
> them.
>
> This lets filesystems advertise their support for specific xflags, like
> statx.stx_attributes_mask does, and userspace can specify only which
> xflags it wants to change without needing a RMW cycle.
>
> These masks have the following semantics:
> - fsx_xflags_rw_mask:
>   * for filesystems: advertise which xflags they support changing
>   * for userspace:   specify which xflags it wants to modify
> - fsx_xflags_ro_mask:
>   * for filesystems: advertise which xflags they support only reading
>   * for userspace:   ignored
>
> And they should be filled according to the following:
> - GET:
>   each filesystem that wants to implement this new API fills the masks
>   according to its supported read-write and read-only xflags,
>   then:
>   * for boolean xflags: it fills fsx_xflags with the current on-disk valu=
e;
>   * for value xflags: it sets the xflag bit to 1 in fsx_xflags and the
>     xflag value in the struct field;
> - SET:
>   userspace fills the rw_mask with the bits of the xflags it wants to
>   change, then:
>   * for boolean xflags: it provides the xflag value as a bit in fa_xflags=
;
>   * for value xflags: it sets the xflag bit to 1 in fa_xflags and then
>     provides the value in the struct field; if the xflag bit is set to 0
>     instead, this informs the kernel to unset/clear that value.
>
> Add AT_FILE_ATTR_MASKS at_flags option that userspace needs to pass
> (with usize >=3D FILE_ATTR_SIZE_VER1) in order to be able to use masks,
> otherwise legacy RMW semantics are used.
>
> If AT_FILE_ATTR_MASKS is not specified:
> - on GET, zero fa_xflags_rw_mask and fa_xflags_ro_mask and strip new
>   xflags added in or after VER1, so older programs doing RMW don't pass
>   them back;
> - on SET, reject non-zero fa_xflags_{rw,ro}_mask with -EINVAL.
>
> If AT_FILE_ATTR_MASKS is specified on SET with fa_xflags_rw_mask =3D 0,
> return early as a no-op after permission and support checks.
>
> To make both legacy and new programs interact correctly with both legacy
> and new/upgraded filesystems, add:
> - xflags_to_flags() / flags_to_xflags(): use fileattr_fill_*() to
>   convert xflags to their flags counterpart and vice-versa;
> - fileattr_set_mask_to_legacy() / fileattr_set_legacy_to_mask(): convert
>   between legacy read-modify-write API and modern rw_mask/ro_mask API.
>
> Also add the missing FS_XFLAG_PROJID xflag, to allow userspace to set
> the projid using file_[gs]etattr() by leveraging the new masks.
> In order to prevent the legacy FS_IOC_FSSETXATTR from accepting
> FS_XFLAG_PROJID, add a FS_FILE_ATTR_XFLAGS_MASK to support new xflags
> and use it to validate/clamp both the _xflags fields and the masks.
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/file_attr.c             | 332 +++++++++++++++++++++++++++++++++----
>  include/linux/fileattr.h   |   7 +
>  include/uapi/linux/fcntl.h |   6 +
>  include/uapi/linux/fs.h    |   7 +-
>  4 files changed, 320 insertions(+), 32 deletions(-)
>
> diff --git a/fs/file_attr.c b/fs/file_attr.c
...

> +/*
> + * Convert legacy RMW input format without masks, coming from userspace,=
 to new
> + * input format with masks, for filesystems that already support masks.
> + */

The term "legacy" is always a bit ambiguous so best to avoid if possible

So maybe something more explicit like v0_to_v1
...

> @@ -283,20 +485,62 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap,=
 struct dentry *dentry,
>         if (!inode_owner_or_capable(idmap, inode))
>                 return -EPERM;
>
> +       if (fa->has_masks && !fa->fsx_xflags_rw_mask)
> +               return 0;
> +
>         inode_lock(inode);
>         err =3D vfs_fileattr_get(dentry, &old_ma);
>         if (err)
>                 goto out;
>
> -       /* initialize missing bits from old_ma */
> +       if (old_ma.has_masks) {
> +               old_ma.fsx_xflags_rw_mask &=3D FS_FILE_ATTR_XFLAGS_MASK;
> +               old_ma.fsx_xflags_ro_mask &=3D FS_FILE_ATTR_XFLAGS_MASK;
> +       }
> +       old_ma.fsx_xflags &=3D FS_FILE_ATTR_XFLAGS_MASK;
> +
> +       /* Convert between formats and initialize missing bits from old_m=
a */
>         if (fa->flags_valid) {
> -               fa->fsx_xflags |=3D old_ma.fsx_xflags & ~FS_XFLAG_COMMON;
> -               fa->fsx_extsize =3D old_ma.fsx_extsize;
> -               fa->fsx_nextents =3D old_ma.fsx_nextents;
> -               fa->fsx_projid =3D old_ma.fsx_projid;
> -               fa->fsx_cowextsize =3D old_ma.fsx_cowextsize;
> +               if (!old_ma.has_masks) {
> +                       /* FS_IOC_SETFLAGS */
> +                       fa->fsx_xflags_rw_mask =3D 0;
> +                       fa->fsx_xflags |=3D old_ma.fsx_xflags & ~FS_XFLAG=
_COMMON;
> +                       fa->fsx_extsize =3D old_ma.fsx_extsize;
> +                       fa->fsx_nextents =3D old_ma.fsx_nextents;
> +                       fa->fsx_projid =3D old_ma.fsx_projid;
> +                       fa->fsx_cowextsize =3D old_ma.fsx_cowextsize;
> +               } else {
> +                       err =3D fileattr_set_legacy_to_mask(fa, &old_ma);
> +                       if (err)
> +                               goto out;
> +               }
> +       } else if (!fa->has_masks) {
> +               if (!old_ma.has_masks) {
> +                       /* FS_IOC_FSSETXATTR / file_attr VER0 */
> +                       fa->flags |=3D old_ma.flags & ~FS_COMMON_FL;
> +               } else {
> +                       err =3D fileattr_set_legacy_to_mask(fa, &old_ma);
> +                       if (err)
> +                               goto out;
> +               }
>         } else {
> -               fa->flags |=3D old_ma.flags & ~FS_COMMON_FL;
> +               /* file_attr VER1 */
> +               if (old_ma.has_masks) {
> +                       /*
> +                        * Don't preserve non-common flags since filesyst=
ems
> +                        * with masks only use xflags
> +                        */
> +               } else {
> +                       /*
> +                        * Filesystem doesn't support _mask API yet, swit=
ch to
> +                        * old rmw format.
> +                        * PROJID is supported like the legacy masks, but=
 will
> +                        * be stripped during conversion.
> +                        */
> +                       err =3D fileattr_set_mask_to_legacy(fa, &old_ma);
> +                       if (err)
> +                               goto out;
> +               }

I stand behind my earlier comment - this is too much for open coding
here. I won't suggest a better factoring I am sure you will figure out
one by yourself. focus on readability and reviewability please.

>         }
>
>         err =3D fileattr_set_prepare(inode, &old_ma, fa);
> @@ -390,7 +634,8 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char __=
user *, filename,
>         BUILD_BUG_ON(sizeof(struct file_attr) < FILE_ATTR_SIZE_VER0);
>         BUILD_BUG_ON(sizeof(struct file_attr) !=3D FILE_ATTR_SIZE_LATEST)=
;
>
> -       if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) !=3D 0)
> +       if ((at_flags &
> +            ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH | AT_FILE_ATTR_MASKS))=
 !=3D 0)
>                 return -EINVAL;
>
>         if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> @@ -399,7 +644,10 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char _=
_user *, filename,
>         if (usize > PAGE_SIZE)
>                 return -E2BIG;
>
> -       if (usize < FILE_ATTR_SIZE_VER0)
> +       if (usize !=3D FILE_ATTR_SIZE_VER0 && usize < FILE_ATTR_SIZE_VER1=
)
> +               return -EINVAL;
> +
> +       if ((at_flags & AT_FILE_ATTR_MASKS) && usize < FILE_ATTR_SIZE_VER=
1)
>                 return -EINVAL;
>
>         CLASS(filename_maybe_null, name)(filename, at_flags);
> @@ -424,6 +672,17 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char _=
_user *, filename,
>                 return error;
>
>         fileattr_to_file_attr(&fa, &fattr);
> +       /*
> +        * Caller doesn't know about masks, so it also doesn't know about
> +        * xflags added in or after VER1.
> +        * Zero out the masks and strip VER1+ xflags.
> +        */
> +       if (!(at_flags & AT_FILE_ATTR_MASKS)) {
> +               fattr.fa_xflags &=3D FS_XFLAGS_MASK;
> +               fattr.fa_xflags_rw_mask =3D 0;
> +               fattr.fa_xflags_ro_mask =3D 0;
> +       }
> +
>         error =3D copy_struct_to_user(ufattr, usize, &fattr,
>                                     sizeof(struct file_attr), NULL);
>
> @@ -443,7 +702,8 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char __=
user *, filename,
>         BUILD_BUG_ON(sizeof(struct file_attr) < FILE_ATTR_SIZE_VER0);
>         BUILD_BUG_ON(sizeof(struct file_attr) !=3D FILE_ATTR_SIZE_LATEST)=
;
>
> -       if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) !=3D 0)
> +       if ((at_flags &
> +            ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH | AT_FILE_ATTR_MASKS))=
 !=3D 0)
>                 return -EINVAL;
>
>         if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> @@ -452,7 +712,10 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char _=
_user *, filename,
>         if (usize > PAGE_SIZE)
>                 return -E2BIG;
>
> -       if (usize < FILE_ATTR_SIZE_VER0)
> +       if (usize !=3D FILE_ATTR_SIZE_VER0 && usize < FILE_ATTR_SIZE_VER1=
)
> +               return -EINVAL;
> +
> +       if ((at_flags & AT_FILE_ATTR_MASKS) && usize < FILE_ATTR_SIZE_VER=
1)
>                 return -EINVAL;
>
>         error =3D copy_struct_from_user(&fattr, sizeof(struct file_attr),=
 ufattr,
> @@ -460,9 +723,9 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char __=
user *, filename,
>         if (error)
>                 return error;
>
> -       error =3D file_attr_to_fileattr(&fattr, &fa);
> -       if (error)
> -               return error;
> +       if (!(at_flags & AT_FILE_ATTR_MASKS) &&
> +           (fattr.fa_xflags_rw_mask || fattr.fa_xflags_ro_mask))
> +               return -EINVAL;
>
>         CLASS(filename_maybe_null, name)(filename, at_flags);
>         if (!name && dfd >=3D 0) {
> @@ -479,6 +742,13 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char _=
_user *, filename,
>                         return error;
>         }
>
> +       if (at_flags & AT_FILE_ATTR_MASKS)
> +               fa.has_masks =3D true;
> +
> +       error =3D file_attr_to_fileattr(&fattr, &fa);
> +       if (error)
> +               return error;
> +
>         error =3D mnt_want_write(filepath.mnt);
>         if (!error) {
>                 error =3D vfs_fileattr_set(mnt_idmap(filepath.mnt),
> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index 09e32b84e02a..725efac15e76 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -35,6 +35,10 @@
>         (FS_XFLAG_COMMON | FS_XFLAG_RDONLY_MASK | FS_XFLAG_VALUES_MASK | =
\
>          FS_XFLAG_DIRONLY_MASK | FS_XFLAG_MISC_MASK)
>
> +/* Flags only for fa_ fields */
> +#define FS_FILE_ATTR_XFLAGS_MASK \
> +       (FS_XFLAGS_MASK | FS_XFLAG_PROJID)
> +
>  /*
>   * Merged interface for miscellaneous file attributes.  'flags' originat=
es from
>   * ext* and 'fsx_flags' from xfs.  There's some overlap between the two,=
 which
> @@ -45,6 +49,8 @@ struct file_kattr {
>         u32     flags;          /* flags (FS_IOC_GETFLAGS/FS_IOC_SETFLAGS=
) */
>         /* struct fsxattr: */
>         u32     fsx_xflags;     /* xflags field value (get/set) */
> +       u32     fsx_xflags_rw_mask; /* supported writeable xflags (get) /=
 flags to set (set) */
> +       u32     fsx_xflags_ro_mask; /* supported read-only xflags (get) *=
/
>         u32     fsx_extsize;    /* extsize field value (get/set)*/
>         u32     fsx_nextents;   /* nextents field value (get)   */
>         u32     fsx_projid;     /* project identifier (get/set) */
> @@ -52,6 +58,7 @@ struct file_kattr {
>         /* selectors: */
>         bool    flags_valid:1;
>         bool    fsx_valid:1;
> +       bool    has_masks:1;
>  };
>
>  int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __u=
ser *ufa);
> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> index e43e3de3e9ee..a6ecca6f5e63 100644
> --- a/include/uapi/linux/fcntl.h
> +++ b/include/uapi/linux/fcntl.h
> @@ -191,4 +191,10 @@ struct delegation {
>  #define AT_EXECVE_CHECK                0x10000 /* Only perform a check i=
f execution
>                                            would be allowed. */
>
> +/* Flags for file_getattr(2) / file_setattr(2). */
> +#define AT_FILE_ATTR_MASKS     0x001   /* Advertise knowing and being ab=
le to
> +                                          handle the struct file_attr fi=
elds
> +                                          fa_xflags_rw_mask and
> +                                          fa_xflags_ro_mask */
> +

I prefer AT_FILEATTR_
This is consistent with other AT_<SYSCALL> using a single word.
And there is no risk of misunderstanding what FILEATTR refers to.


>  #endif /* _UAPI_LINUX_FCNTL_H */
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index a13c7b32a1bd..63d88ebe3420 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -238,10 +238,13 @@ struct file_attr {
>         __u32 fa_nextents;      /* nextents field value (get)   */
>         __u32 fa_projid;        /* project identifier (get/set) */
>         __u32 fa_cowextsize;    /* CoW extsize field value (get/set) */
> +       __u64 fa_xflags_rw_mask;/* supported writeable xflags (get) / fla=
gs to set (set) */
> +       __u64 fa_xflags_ro_mask;/* supported read-only xflags (get) */
>  };
>
>  #define FILE_ATTR_SIZE_VER0 24
> -#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
> +#define FILE_ATTR_SIZE_VER1 40
> +#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
>

Man... we really need a bot to review all UAPI changes
Please someone tell the bot to check
NO LATEST/LAST/ALL constants in UAPI headers!!!

Your patch does not introduce this constant in UAPI but if we change
it we risk spreading different versions in installed headers.

Honestly I see no reason for FILE_ATTR_SIZE_VER* to be in UAPI
either. For other UAPIs those constants are not in the UAPI header:

~/src/linux$ git grep SIZE_LATEST include/linux/
include/linux/fcntl.h:#define OPEN_HOW_SIZE_LATEST      OPEN_HOW_SIZE_VER0
include/linux/seccomp.h:#define SECCOMP_NOTIFY_ADDFD_SIZE_LATEST
SECCOMP_NOTIFY_ADDFD_SIZE_VER0
include/linux/xattr.h:#define XATTR_ARGS_SIZE_LATEST    XATTR_ARGS_SIZE_VER=
0

So please move those contacts before adding/changing them
(can be in the same patch IMO).

This is a high level review.
I did not look at the details of the conversions and validations
Will do that for v3.

Thanks,
Amir.
