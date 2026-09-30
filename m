Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FB4E322C
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775367; cv=pass; b=Qk4gf58ou9p8G41wipK/h21FsL8L8iPazqBejKTXfBhLrMh9oOKCZM0IPF6onl73jnL+LjcIULXEFFPpTgWMjqFX1hKv1wC8McUzZs6ZnfUBPyBEyZs9LUrbovgsUaQCu9gpKsJXwDBPNkxAR0xMQsPSnZakstt+qIpkHtEHIak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775367; c=relaxed/simple;
	bh=SXhpmvBhQ+TXtxniHLWeCSa452bmcr1rqYYurbJuz+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxhlrUuSC9mVqGUdx2Sk5Ci9i2BkdZeqH/8hHf1N4axv5JXPq1m0F8XfAPjvsQ6+Hvx5f+xkAJwQ+Q2075ALVlUsgDD+hM6gxQdD/pmIZxV++vwfZiREuAquRvPzXvyA5D7ztDG+9tFAd2GJ1IfJi23FU5icVZu6Po8shFG43dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qeuqde8I; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qeuqde8I"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae185cc40fso633509a12.1
        for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 06:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790775357; cv=none;
        d=google.com; s=arc-20260327;
        b=ZDocXPL5+oYTfkxFB0h4OKhb2KYbDnu1Y0zYrf2zSWr8ZmNV02NphDzf6UauhtifI7
         ARBM4aqHG385gUPkbQkiFHpYG3LImUrKUUdfpUc9wpDARGX9/f0lQAe4MVXe1BKeyjN0
         v//whCFsPEJgVrN1L/q9BvUH/Bzkfx0ONKcgHXRq6tOi5ynlW7DaR5bUtjPqfqiG3afw
         8c5WOoM1qVvkzVBU9NammbU45B7KzZewfwWwHS1bfbe9p/aVwN/jXMw1NAlBUobE4HS6
         UsPvKc0AXIeOOit1KIjRnHYa8W3RanFfNry08t4JDepGVEFhUqNa7PVHXOqiqPnjwIER
         1bCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4QchkhwI1w5bSASLXqcxUjuWuiosjQacZxJlQZryO/o=;
        fh=a7p1ksjm1uJjYwtkp7VJXpWyvm/k1yLcjILY7x0N9J8=;
        b=IbB0OebKn4fK8FjWBUf+NpQinbG1rxY2WYJNIL/lDI1NugujJy1vhKEv30spaW9h3D
         T2nJtHCZRKniKFVBnLB27Au9pS8jWeotzTy+QMXKv88KTU8DYj4pFxKD4qDcgdwQ2Sik
         DJ/X2N8RuSR8ZLzvOGaP+pxm2xmI0wVdu2r6J3wF/nHJzdMt+S+YKe/7drBCQotcTipp
         3Kf3WVsNQ4O0jPFp9Bsy1guTtcHPAQa2X8eUFwtgoSZcuVfAEB+eNvXI2GUIIOFYxBaG
         PPzE2Km9N/DWTvp5ANTR4J4U7QlWoajVm7deVbJ9dp02tuG4GXygUAwjrj9pZrW/e/3x
         xGCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775357; x=1791380157; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4QchkhwI1w5bSASLXqcxUjuWuiosjQacZxJlQZryO/o=;
        b=Qeuqde8IhgmE6WzROaBH0z+GgJ1MR6IONk3nLHZy+at/ZhZ6JOP7ySLCGrSU2uJY4q
         elUqWcVtxWKW2oN0+I4pYC3ag8JdD1igz3/b/KJRdLCDdlvI+Q/dKSteEwvUakEcMQh1
         9RoMLE4jO+TC5lFOZB+7ZQHnqMZUxW6BeiwE2ilZeVjJVCGOrb33QTDLRJNb8/vk9zgw
         S0Scl8+IkKk4cOZzpmi1OCtKdYKBwrWc5u7q7wUaaw7jYvK3Hb5Ez7b34MwbjiCpKqfW
         mvW5d/DLnJ65GrXlxzaxeF03xhBqTcM/UPP/BojgCNUvyv3zGJoSqSlIpAppK4U//vh4
         4rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775357; x=1791380157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QchkhwI1w5bSASLXqcxUjuWuiosjQacZxJlQZryO/o=;
        b=xgvgBuQP/dzjxJpCLxT8tsnNBX1tH2XaN4UtU/rAWYvOvXKxzfsbCRiDwwER61v2EI
         htH17i8iNAfgFEns955kE3+hHvMdgfPfAsykYlIJPFaSTE2A38d5/jQUotIpGYCNHq9/
         F+y3SqTOLZcH2verGHVBr2kZOT56yCCxmvKPQcTkRhZ3SPhjx8EKI7wgW1+HqvJxPFWB
         GArzHc/uuD0i2kUlTP4y/VqO82D9gnRqgoOwqz00cVdEgdUNZ1fC83dvHja66zmE2rzG
         D5MpY6C3BoMMMCQlbSTg96Esv2TAkVo5Qt8+ArCSLj6XNA/zA05/ZH1TII3PGRuYc7zC
         cyEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzR1XZiySktqrFmgsKUse+dWDpxRxrb1AaGTQ2lR1QVbwfz8JlfsBVUrc3OisOQqwV/Wv5k@lists.linux.dev
X-Gm-Message-State: AFuF++mMwTPETM82XpN8H7H6wqtmChgtl5KoEeTL1th+XNyXRoJaUD2l
	OVIlUWPWXLjg+SzbRWLOHjxETOJZj4+jKX1kCbFE0p4frTPvFoJKq3FCWcZ/YLPx4x/Lspq1od4
	nDhAXBxlQ+ZnCq+wQBcC0Tsiw/GAOb3M=
X-Gm-Gg: AYBFou2Q/WEh0Q2I2OIWCr0SAkH5yI78EKq1wO/sUB6b/3KuXSlwepdX19fGo/gF/lR
	ryaH5bF2sFjuOH+7OWrMlKGVnwEyFCJZ9sByPB9+7D88WLeL+lxPP4IVrV+lY4FvCv3J18gTwL9
	kCm2aVGQ5+2Cn77q3cXX+sqqCQnmUNdK4Gal3WveNku9c1D6KjBV1M5e6GfZyuJvqD6Us3qW7eo
	fauv0JVFdIzARVm2hTTeaPvNWIQiSSVzoROu7DZHtSdaAGyKOly5q+2vvOCmDL8+lqQ5E9wQOxH
	zNNseNAlvaNvPpO1VE88fdG4/NXhp8xOWTR4qsf+T9IUCSzoV+8e54jCzMBBTgGVeGdH
X-Received: by 2002:a17:906:6a05:b0:c2d:b9b4:f4de with SMTP id
 a640c23a62f3a-c2e23d9207amr125564266b.18.1790775356627; Wed, 30 Sep 2026
 06:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929034158.1455429-1-neilb@ownmail.net> <20260929034158.1455429-8-neilb@ownmail.net>
In-Reply-To: <20260929034158.1455429-8-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 30 Sep 2026 15:35:45 +0200
X-Gm-Features: AclHuK-7IYZDCVZREHuHZMSP_wgME-NMrM9tsJnpybGevda7U-xOXfVzEqygZdo
Message-ID: <CAOQ4uxjv3Ziqy+CjbCO7noAPse+a0066UO7pkFhStnnW9FFSPg@mail.gmail.com>
Subject: Re: [PATCH 7/7] ovl: stop using lookup_one() in ovl_iterate().
To: NeilBrown <neil@brown.name>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	Joel Granados <joel.granados@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Breno Leitao <leitao@debian.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Jan Harkes <jaharkes@cs.cmu.edu>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Hyunchul Lee <hyc.lee@gmail.com>, Carlos Maiolino <cem@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-um@lists.infradead.org, 
	codalist@coda.cs.cmu.edu, coda@cs.cmu.edu, linux-mm@kvack.org, 
	ntfs@lists.linux.dev, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 5:43=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> From: NeilBrown <neil@brown.name>
>
> lookup_one() is expected to be removed as it does not fit well with
> proposed changes to directory locking.
> Specifically d_alloc_parallel() will be ordered outside of i_rwsem
> and as iterate_shared() is called with i_rwsem held it is not safe
> to call d_alloc_parallel().
>
> We can instead call d_alloc_trylock() and then call the ->lookup, but
> that can fail if there is a lookup attempt concurrent with the
> readdir().
>
> ovl cannot afford for the lookup to fail as that could produce incorrect
> results, and it cannot safely drop i_rwsem temporarily as that could
> introduce races with handling of the directory cache.
>
> Instead we rely on the fact that ovl_iterate() has an exclusive lock on
> the directory, so any concurrent lookup will wait for the ovl_iterate()
> call to complete.  We allocate a separate dentry and if the lookup is
> successful, it is hashed with the result.

Please document this assumption with:

rwsem_assert_held_write(&dir->d_inode->i_rwsem);

and comment in the code. Having it in the git commit message is not
enough for future code reviewers.

Other than that, I have no further comments, but I would like
to have a review from Miklos before this patch lands, because
I don't remember him reviewing any of the revisions and this is subtle.
I am a bit concerned that we have no test coverage for this subtle code.

>
> When the concurrent lookup gets i_rwsem it mustn't do its own lookup -
> it must use the existing dentry.  This is found, if it exists, using
> try_lookup_noperm().
>
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
>  fs/overlayfs/namei.c   | 12 ++++++++++++
>  fs/overlayfs/readdir.c | 26 ++++++++++++++++++++++++--
>  2 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
> index ca899fdfaafd..f56e33fd4d6b 100644
> --- a/fs/overlayfs/namei.c
> +++ b/fs/overlayfs/namei.c
> @@ -1385,6 +1385,7 @@ struct dentry *ovl_lookup(struct inode *dir, struct=
 dentry *dentry,
>         struct ovl_fs *ofs =3D OVL_FS(dentry->d_sb);
>         struct ovl_entry *poe =3D OVL_E(dentry->d_parent);
>         bool check_redirect =3D (ovl_redirect_follow(ofs) || ofs->numdata=
layer);
> +       struct dentry *alias;
>         int err;
>         struct ovl_lookup_ctx ctx =3D {
>                 .dentry =3D dentry,
> @@ -1399,6 +1400,17 @@ struct dentry *ovl_lookup(struct inode *dir, struc=
t dentry *dentry,
>         if (dentry->d_name.len > ofs->namelen)
>                 return ERR_PTR(-ENAMETOOLONG);
>
> +       /*
> +        * The existence of this in-lookup dentry might have forced
> +        * readdir to do the lookup with a new dentry.  If so we must
> +        * return that one.
> +        */
> +       alias =3D try_lookup_noperm(&QSTR_LEN(dentry->d_name.name,
> +                                           dentry->d_name.len),
> +                                 dentry->d_parent);
> +       if (alias && !IS_ERR(alias))
> +               return alias;
> +
>         with_ovl_creds(dentry->d_sb)
>                 err =3D ovl_lookup_layers(&ctx, &d);
>
> diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
> index e7fe29cb6028..bc41da4bace8 100644
> --- a/fs/overlayfs/readdir.c
> +++ b/fs/overlayfs/readdir.c
> @@ -574,8 +574,30 @@ static int ovl_cache_update(const struct path *path,=
 struct ovl_cache_entry *p,
>                 }
>         }
>         /* This checks also for xwhiteouts */
> -       this =3D lookup_one(mnt_idmap(path->mnt), &QSTR_LEN(p->name, p->l=
en), dir);
> -       if (IS_ERR_OR_NULL(this) || !this->d_inode) {
> +       this =3D d_alloc_trylock(dir, &QSTR_LEN(p->name, p->len));
> +       if (this =3D=3D ERR_PTR(-EWOULDBLOCK)) {
> +               /*
> +                * Some other thread is looking up this name and will
> +                * block on i_rwsem before it can complete the lookup.
> +                * We will do the lookup in a new dentry and when that
> +                * lookup gets a turn it will find and return this
> +                * dentry.
> +                */
> +               this =3D d_alloc_name(dir, p->name);
> +               if (!this)
> +                       this =3D ERR_PTR(-ENOMEM);
> +       }
> +       if (!IS_ERR(this) && d_unhashed(this)) {
> +               /* Either we got an in-lookup or we made our own unhashed=
 */
> +               struct dentry *alias =3D ovl_lookup(dir->d_inode, this, 0=
);
> +
> +               d_lookup_done(this);
> +               if (alias) {
> +                       dput(this);
> +                       this =3D alias;
> +               }
> +       }
> +       if (IS_ERR(this) || !this->d_inode) {
>                 /* Mark a stale entry */
>                 p->is_whiteout =3D true;
>                 if (IS_ERR(this)) {

How do you test your patch set? Do you have tests that exercise
parallel create/lookup/readdir?

It would be irresponsible to merge code without showing that the `alias`
branches have been exercised. Do you have an idea how to do that?

Thanks,
Amir.
