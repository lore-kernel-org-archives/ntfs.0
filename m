Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C2134041B
	for <ntfs@lists.linux.dev>; Wed,  9 Sep 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929320; cv=none; b=lYUz0/usUPD5WJ5VRigWodEwMVKOnq9z9Sk0JOrLu1dWLVlerElYahy0gmA4BlA2eCdv6kzJvnhHrDEtZW2fit2fx618MU3ozTp+oPqT6spVnRiYxOX44aEB7Sxa2KLuom4JPObAl1c2GafFVpQkwC0NfR7aKMuGYOdG0GMqVv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929320; c=relaxed/simple;
	bh=yD5Y5BmgUWPFI9m9pI/awi8thfjSxH3wLCddpSluKcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnYW3V2lBuQE2T/7UQu5vFU0glttd3KITekPnn9jNujG3sf6sKVevzeEK9zdDi2JvMAri1jPtVdrIXm01n83ZTVyGv9fBlYMPRVIKUur+Dh1cPjEkC3Qt61glPX2fJCEjMnhqsHvsh9yKpAKayR/noVcaJlu7MTJDWyZYsrCjqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kN0qDaKo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kN0qDaKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB0C1F00A3D
	for <ntfs@lists.linux.dev>; Wed,  9 Sep 2026 04:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788929318;
	bh=4nJRHZ6k5P4Zo0sn1hB8NmjdNIqKFBIgdxyFwGcvX/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kN0qDaKoGAwvuInG6O7KgDxPhZK3C+rw/kDG181TzdRdZT9RiALZ14mOwm+Y+88lY
	 H+1KfA7tXspgoQzEj6kABzGXN8mOC9OskDvQcLOh5PSa3h8wzUBIxn0RBSDhAr/af+
	 6GYP/raJeTC2r/kUIJNE3zPFSuA2sEPoue6xToNMhG6NRZUcIaEjtoTIQqrAJcFU0O
	 9DLLv/44vLxSuM7njBDrzmtujjWr02+rF0F7TfrULV2ehMo6wZzSrW2yWRvmP5tklY
	 rH734ghRHi/XYXyDN/YTbbMvK7euZc1EQwDdsXZriIadgcH9uNDBYDFhKQukHJoaV4
	 q7SzRCRvoQTNQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso737313466b.0
        for <ntfs@lists.linux.dev>; Tue, 08 Sep 2026 21:48:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLjQuLnzUlpaj7+LuWUo9db8dSW1IJTpDe/ttfrP6t0Tmg63wcXbreI6/TxECRd98s0DhP@lists.linux.dev
X-Gm-Message-State: AFuF++nmBqz4cvTqDxHEHj1Pyb9Jxm4I8rOrs7ye++zGoJogp0QPg0xf
	VXsOk0xB1u2v4o9b4NvunWE2VwFh+EdsrDmuoCgObZnrvEtZRPaLpf2GCUygH24pMvr9aW0B8SD
	HzM/4mM1SoLPC1FkkF3hR9N6il8g0Ymw=
X-Received: by 2002:a17:907:3ea1:b0:c25:31b4:5f15 with SMTP id
 a640c23a62f3a-c260c6ab5f6mr1242204066b.1.1788929317384; Tue, 08 Sep 2026
 21:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901091519.2885376-1-liubaolin12138@163.com>
 <CAKYAXd9HVhS8K3zXhcfUz1H09CDaqADpDzXt0dO9FV3Pa7Rs0Q@mail.gmail.com> <4a46d66d-6c15-4b45-be8b-0d98d3472659@163.com>
In-Reply-To: <4a46d66d-6c15-4b45-be8b-0d98d3472659@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 9 Sep 2026 13:48:24 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8L3_x=K+pk18R0NUpsTpXAm5dhWFyUjtTz34QxSGfO1w@mail.gmail.com>
X-Gm-Features: AcwNN1XBpJ2DnqKxTu5yTNoBTtlFEqpS2l4fNMhxfgGQhKYEZE-ua7F96PclnkA
Message-ID: <CAKYAXd8L3_x=K+pk18R0NUpsTpXAm5dhWFyUjtTz34QxSGfO1w@mail.gmail.com>
Subject: Re: [PATCH 0/2] ntfs: wire up the fileattr API
To: liubaolin <liubaolin12138@163.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:31=E2=80=AFPM liubaolin <liubaolin12138@163.com> w=
rote:
>
>
>
> =E5=9C=A8 2026/9/2 09:44, Namjae Jeon =E5=86=99=E9=81=93:
> > On Tue, Sep 1, 2026 at 6:15=E2=80=AFPM Baolin Liu <liubaolin12138@163.c=
om> wrote:
> >>
> >> From: Baolin Liu <liubaolin@kylinos.cn>
> >>
> >> This series implements fileattr_get and fileattr_set for ntfs so that
> >> lsattr(1) and chattr(1) work on ntfs.
> >>
> >> Patch 1 wires up the fileattr inode operations and implements support
> >> for FS_IMMUTABLE_FL and FS_APPEND_FL. These flags map to inode->i_flag=
s
> >> (S_IMMUTABLE, S_APPEND), so the VFS enforces them. fileattr_get also
> >> reports the compressed and encrypted state, which the driver already
> >> exposes through STATX_ATTR_* in ntfs_getattr().
> >>
> >> Patch 2 adds FS_NODUMP_FL support, which dump(8) and other backup tool=
s
> >> use to mark files to skip. The flag is stored in a new ntfs_inode fiel=
d
> >> and reported through both fileattr_get (for lsattr) and ntfs_getattr()
> >> (as STATX_ATTR_NODUMP, for statx), so the two interfaces stay consiste=
nt.
> >>
> >> All three accepted flags (immutable, append-only, nodump) are kept in
> >> memory and do not survive a remount, matching ntfs3 behavior.
> > This patch-set does not persist these flags on disk. So, the settings
> > survive only while the corresponding inode remains cached. inode
> > reclaim caused by memory pressure or drop_caches can discard them
> > before unmount. Could you find a way to persist immutable, append, and
> > nodump in metadata without causing compatibility issues?
>
> Hi Namjae,Hyunchul,
>
>    Regarding the persistence concern, I propose storing the
> Linux-specific flags in one private EA entry in the file's existing NTFS
> $EA attribute:
>
>      EA name:  $LXFLAGS
>      EA value: a 32-bit little-endian bitmask
>
>      bit 0: immutable
>      bit 1: append-only
>      bit 2: nodump
>
>    The three flags are boolean states, so one bit is sufficient for each
> of them. Using one 32-bit value also leaves room for future expansion.
>
>    This would add an EA entry named $LXFLAGS to the existing $EA
> attribute;it would not introduce a new NTFS attribute type. The driver
> already uses the standard $EA/$EA_INFORMATION mechanism for $LXUID,
> $LXGID, $LXMOD and $LXDEV, so this approach would reuse the existing
> on-disk mechanism.
>
>    The inode loading path would restore the flags from $LXFLAGS, and
> fileattr_set() would update the entry. The entry would be removed when
> all three flags are cleared. This would allow the flags to survive inode
> reclaim, drop_caches, unmount/remount, and reboot.
>
>    This approach would not require changes to mkntfs or to the NTFS
> filesystem format.
>
>    Would this approach be acceptable? If so, I will implement it and
> submit a new revision as soon as possible.
Could you please check whether Windows CHKDSK or the Windows NTFS
modifies or deletes this EA? If neither modifies nor deletes it,
please implement the proposed approach.

Thanks.
