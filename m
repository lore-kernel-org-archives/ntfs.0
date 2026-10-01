Received: from mail-ed2-f16.google.com (mail-ed2-f16.google.com [74.125.228.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CDF3EC691
	for <ntfs@lists.linux.dev>; Thu,  1 Oct 2026 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840041; cv=pass; b=sN7QiVrKqD6HaTCmyIp1JQkqnjPXx/kZVU29FDdFSSZ56y9YbVGcaWQQHac/dDWZediMGVuro31UznfG7u3T4cTC7QhLPAt0WnNAlh2RgRqUhWaj+nttqTD/rpH5Vo1OoZ1wAvuzYlvMZL+4IRJI/N+TX2Zq7OsoEyKAF3Ii2rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840041; c=relaxed/simple;
	bh=KLrl1JmKD/j4lbwTIj965Z/B9W7suYuEx4nj7ZOOSaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAwjUKDiBjkKaH21dxerwRj3xqrAW1YCyQ0GF2E8ybtVxjrdUdYyWcuJpPb/uxcPqv6xP4twh3KbiD1597A131YjDcs8ug0yFTiDDte1JeWEpoNFppd4ouKotSvfWgCsB5GuI/1p/odvDW9bm9N3e8rAlJGImKx6uUvbqNGFniI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnbVeGCf; arc=pass smtp.client-ip=74.125.228.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnbVeGCf"
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso10543156a12.0
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 00:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790840037; cv=none;
        d=google.com; s=arc-20260327;
        b=D5wG//MD4sndG4Lm8C5ybeorEzDVThLbqiVmoG1OBc1WraHUnOUVe6etg2Z+P6kOpv
         JzmZOcieiRSz2+3jFTZDp7QQSicn5Jupsd+xEKV2HWBKYB68DdQ+w37GQGdA1agAa/9L
         A1dIE/W5f1Gkh3Eq56E3tPjpYlR3M+Ql82WqlNjyBadA7WWKMPzQszR8DhBIQUdWV9ZM
         LS2stDYyuAbp2n+faJsqjISDhIAlyVp6Vt4Hg9U9AhC+WXUbdv8SUODzyeMGOA5Yo1Q+
         /Zq7XUiADjiptWPswaNEd78BAlJUhtX2I50aDO7KaPMrhGBT/thDGOabRSjVuH2iU/k2
         7K5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WTf1zoaT0Wsrc4m5L9oFar53LMEzHBHomKhDhLKQLu0=;
        fh=g+gS8tNoacFZH3gD+Us2wT0twuX5lQutQRz2/kc52M8=;
        b=CNyIrD3rfpZdQ5+Z9bSwde5jCUtYVNcXAwGvYntciCGHXFoWmUu78tPXIOFZUSCCqB
         KADiHR6zOhwCbMtvJs+5QUAlbWtECFcQznNVNxg6p89ip4ZfzE4FtN9otr3X3vlfZIoG
         SJUA/Ifg9xlfYN0y/6uHmRhgCOKbf9GOlu7E2klGBn/LQro/WzpXad4KsRTe1xTbzLvT
         U1vkiqVuOwHHY95maLlaUfnPAS6Qhr7JjIx00YSmKps3NGpUqGgqHtqS9+WvAvcaKkHs
         5Wi//+fLpAcC1BLNXAA0ug3+hQx9xztw3vzdLs2QLJuZSEFNjKynd7QfdtCAMQxTvwb/
         5LBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790840037; x=1791444837; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WTf1zoaT0Wsrc4m5L9oFar53LMEzHBHomKhDhLKQLu0=;
        b=qnbVeGCfJqr2bdOmFmB/vVajHu69xnwZYtZTnHFhy1xICDvMd8v8fis05UQZn8wCQL
         Yc0hwKL2xzxEGOlVyeP8/HvSLbrdotSeGfwws5Jy8jjX9D6r9KaIaNMzbeUREWPPgUBi
         Pn4Nv01BLjcbbCnS00izZvtc2lbxotk3/9TTGQzjFKUbMf07OlvMFLqa4ndRppPs1Xww
         3DQ5GeMU0KPIZGIGtqTqTWDqZEeNwomT01/qISRmU2J1NKuWz/2gas/Nw6JK+BVoSfKG
         JZQYP8/pFW4b2F68lUPvepiAcuYsl46BS2Gl/YugkrfHCkUT5MN4zYU2ZhPf9F0ZLOr0
         +7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840037; x=1791444837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTf1zoaT0Wsrc4m5L9oFar53LMEzHBHomKhDhLKQLu0=;
        b=yuwZWFPmvs7e0gGDnEzpNQ86nV3Luky5Gq+PeKv5q0OUYQcio/qAj5CSk1DySpNWFB
         7wGSuCcppZCrj85umUgdsZskI9hYviU6qD6i2VmIxB9bQd6ruTwzEC/L5QzTw0XuTBnX
         K7QN+itDnvvCUVfCMMyRDmaR3wOsFDyvNjRMeKR6VfzoTjA6biOCDueN2eFsPkEq77PL
         pSaJZ/1xM/hd4tyqe8X+dxsHRVi4AvhL+jcRolDHM9iqlEoiaBjHcxUAxv83iT9H+5QT
         GGFZKGSQgfuF3V/IYdUGIBDXZ8UPyzknaOZtT/KHbOyQT91Xw54Uh+uDoSfH0V3ccIHB
         Bgvw==
X-Forwarded-Encrypted: i=1; AKwUvBy+le2o6zNyahIaBKOFdN571Zg6N0Ufp5+ilM6GJBsKAO6vG+TV21TspOjNdPMyn7C/64Fy@lists.linux.dev
X-Gm-Message-State: AFq9FYJ/09ZyS+R8KsHDRzMyBqcsB3civ4zkahh6MvTjuvgSGQnpvVWT
	O50NpqYdxp7XD8CbDX83XVph1lF8fI/KTpmJ2zzuRmll0fcVhxJNG46tLT1lDmWVwSNhC0VFWlO
	T4nXv8hXECvaYbJ/PTR+NXTn3SLNANv8=
X-Gm-Gg: AYBFou2HSy9KoSBXsd6fyMtco7AlMugTnpFhbNTRPgIFdQCSQyNHVr32X+3MEK0pPh4
	yHhToWM9ZXozTuYeeu16vlG8fgvc6YI4h9UU1AuKD7ypUtQaX68lXAAyr8ofJ7E44NYFyTk5za8
	3WgGakXDWoJpjNNNz0eiEDyzQ62zDPGncyrPct0HOkjBmeE9+XL96oJbVPQSu37jrqGydiyW1cm
	eYGMmUbUQ/jLtze7IYnJESwXow2xq3YgdufJPhE0XS9QbBQ28zDPskZcpj/Hb29tQCTlM8zhLDn
	aY/SlyeIp1fEfc8Nm6CM0lfeXu0GMBgY56q2dl4/n3I2ojLHMllhLtq2
X-Received: by 2002:a05:6402:3227:b0:6ac:9a44:d3ed with SMTP id
 4fb4d7f45d1cf-6ae1986075bmr3067340a12.5.1790840036710; Thu, 01 Oct 2026
 00:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929034158.1455429-1-neilb@ownmail.net> <20260929034158.1455429-8-neilb@ownmail.net>
 <CAOQ4uxjv3Ziqy+CjbCO7noAPse+a0066UO7pkFhStnnW9FFSPg@mail.gmail.com> <179080463287.37859.4262341831478331513@noble.neil.brown.name>
In-Reply-To: <179080463287.37859.4262341831478331513@noble.neil.brown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 1 Oct 2026 09:33:44 +0200
X-Gm-Features: AclHuK9MIhHprf4aDgaMwd_4tZZMvI-V-gvxwkigtEk9UN12WMcOwDyiP913px0
Message-ID: <CAOQ4uxgEG6Wt1z7JO+v2sjs=Aoav0u7eLz+Ge3UqhVG4msBkwA@mail.gmail.com>
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

On Wed, Sep 30, 2026 at 11:44=E2=80=AFPM NeilBrown <neilb@ownmail.net> wrot=
e:
>
> On Wed, 30 Sep 2026, Amir Goldstein wrote:
> > On Tue, Sep 29, 2026 at 5:43=E2=80=AFAM NeilBrown <neilb@ownmail.net> w=
rote:
> > >
> > > From: NeilBrown <neil@brown.name>
> > >
> > > lookup_one() is expected to be removed as it does not fit well with
> > > proposed changes to directory locking.
> > > Specifically d_alloc_parallel() will be ordered outside of i_rwsem
> > > and as iterate_shared() is called with i_rwsem held it is not safe
> > > to call d_alloc_parallel().
> > >
> > > We can instead call d_alloc_trylock() and then call the ->lookup, but
> > > that can fail if there is a lookup attempt concurrent with the
> > > readdir().
> > >
> > > ovl cannot afford for the lookup to fail as that could produce incorr=
ect
> > > results, and it cannot safely drop i_rwsem temporarily as that could
> > > introduce races with handling of the directory cache.
> > >
> > > Instead we rely on the fact that ovl_iterate() has an exclusive lock =
on
> > > the directory, so any concurrent lookup will wait for the ovl_iterate=
()
> > > call to complete.  We allocate a separate dentry and if the lookup is
> > > successful, it is hashed with the result.
> >
> > Please document this assumption with:
> >
> > rwsem_assert_held_write(&dir->d_inode->i_rwsem);
> >
> > and comment in the code. Having it in the git commit message is not
> > enough for future code reviewers.
>
> Yes, I can do that.
>
> >
> > Other than that, I have no further comments, but I would like
> > to have a review from Miklos before this patch lands, because
> > I don't remember him reviewing any of the revisions and this is subtle.
> > I am a bit concerned that we have no test coverage for this subtle code=
.
> >
> > >
> > > When the concurrent lookup gets i_rwsem it mustn't do its own lookup =
-
> > > it must use the existing dentry.  This is found, if it exists, using
> > > try_lookup_noperm().
> > >
> > > Signed-off-by: NeilBrown <neil@brown.name>
> > > ---
> > >  fs/overlayfs/namei.c   | 12 ++++++++++++
> > >  fs/overlayfs/readdir.c | 26 ++++++++++++++++++++++++--
> > >  2 files changed, 36 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
> > > index ca899fdfaafd..f56e33fd4d6b 100644
> > > --- a/fs/overlayfs/namei.c
> > > +++ b/fs/overlayfs/namei.c
> > > @@ -1385,6 +1385,7 @@ struct dentry *ovl_lookup(struct inode *dir, st=
ruct dentry *dentry,
> > >         struct ovl_fs *ofs =3D OVL_FS(dentry->d_sb);
> > >         struct ovl_entry *poe =3D OVL_E(dentry->d_parent);
> > >         bool check_redirect =3D (ovl_redirect_follow(ofs) || ofs->num=
datalayer);
> > > +       struct dentry *alias;
> > >         int err;
> > >         struct ovl_lookup_ctx ctx =3D {
> > >                 .dentry =3D dentry,
> > > @@ -1399,6 +1400,17 @@ struct dentry *ovl_lookup(struct inode *dir, s=
truct dentry *dentry,
> > >         if (dentry->d_name.len > ofs->namelen)
> > >                 return ERR_PTR(-ENAMETOOLONG);
> > >
> > > +       /*
> > > +        * The existence of this in-lookup dentry might have forced
> > > +        * readdir to do the lookup with a new dentry.  If so we must
> > > +        * return that one.
> > > +        */
> > > +       alias =3D try_lookup_noperm(&QSTR_LEN(dentry->d_name.name,
> > > +                                           dentry->d_name.len),
> > > +                                 dentry->d_parent);
> > > +       if (alias && !IS_ERR(alias))
> > > +               return alias;
> > > +
> > >         with_ovl_creds(dentry->d_sb)
> > >                 err =3D ovl_lookup_layers(&ctx, &d);
> > >
> > > diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
> > > index e7fe29cb6028..bc41da4bace8 100644
> > > --- a/fs/overlayfs/readdir.c
> > > +++ b/fs/overlayfs/readdir.c
> > > @@ -574,8 +574,30 @@ static int ovl_cache_update(const struct path *p=
ath, struct ovl_cache_entry *p,
> > >                 }
> > >         }
> > >         /* This checks also for xwhiteouts */
> > > -       this =3D lookup_one(mnt_idmap(path->mnt), &QSTR_LEN(p->name, =
p->len), dir);
> > > -       if (IS_ERR_OR_NULL(this) || !this->d_inode) {
> > > +       this =3D d_alloc_trylock(dir, &QSTR_LEN(p->name, p->len));
> > > +       if (this =3D=3D ERR_PTR(-EWOULDBLOCK)) {
> > > +               /*
> > > +                * Some other thread is looking up this name and will
> > > +                * block on i_rwsem before it can complete the lookup=
.
> > > +                * We will do the lookup in a new dentry and when tha=
t
> > > +                * lookup gets a turn it will find and return this
> > > +                * dentry.
> > > +                */
> > > +               this =3D d_alloc_name(dir, p->name);
> > > +               if (!this)
> > > +                       this =3D ERR_PTR(-ENOMEM);
> > > +       }
> > > +       if (!IS_ERR(this) && d_unhashed(this)) {
> > > +               /* Either we got an in-lookup or we made our own unha=
shed */
> > > +               struct dentry *alias =3D ovl_lookup(dir->d_inode, thi=
s, 0);
> > > +
> > > +               d_lookup_done(this);
> > > +               if (alias) {
> > > +                       dput(this);
> > > +                       this =3D alias;
> > > +               }
> > > +       }
> > > +       if (IS_ERR(this) || !this->d_inode) {
> > >                 /* Mark a stale entry */
> > >                 p->is_whiteout =3D true;
> > >                 if (IS_ERR(this)) {
> >
> > How do you test your patch set? Do you have tests that exercise
> > parallel create/lookup/readdir?
> >
> > It would be irresponsible to merge code without showing that the `alias=
`
> > branches have been exercised. Do you have an idea how to do that?
>
> I think that to trigger the 'alias' code we would need to instrument the
> code to block and wait.
> e.g.  when readdir sees a particular name it could signal the test
> harness somehow and then wait.  The test harness would trigger a lookup
> of the name which would block on the parent i_rwsem.
> The readdir then continues somehow and gets -EWOULDBLOCK and installs
> the alias dentry.  When it completes the lookup continues and picks up
> the alias.
>
> Is there some way to set a tracepoint to block?
>
> Maybe it would be enough to have something like:
>    if (strcmp(name, "MAGIC_NAME") =3D=3D 0) {
>         printk("waiting for MAGIC_NAME\n");
>         ssleep(15);
>    }
>
> and have the test harness watch dmesg for MAGIC_NAME then trigger the
> lookup.   Then adds some tracing to ovl_lookup() to ensure it picks up
> the right thing...

For this patch I am not asking for instrumentation with CI regression tests=
.
A word from you that you tested all the unexercised alias branches manually
and how (e.g. include printk and sleep test report) is the minimum
that I require
to avoid merging subtle test-compiled-only code.

For your parallel dirops odyssey as a whole, I think that proper
fstests coverage is
a must before the last step of relaxing the dir lock and the sooner you sta=
rt
with this the better the test coverage for all the perp series along the wa=
y.

Thanks,
Amir.
