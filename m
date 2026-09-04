Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10824AA1E2
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531738; cv=none; b=HLA6dg8VGJmey0cAFUP1R5VMVhJSsoRH9GYL6TQ5Hn4cPhCCmWX8BmyufEdjg2Zff8aylIX0Zwx3qP7jU9xcoUgsHil6AY2UwZXX2qUI+Tfoi1JtZR1dYtoZd/yFZ36KmGPiX5vCyRP4j6lZeqn54LMvmV4heZXQP9NlKrEyA7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531738; c=relaxed/simple;
	bh=pOFw3UsjOUXB4sr9hjcOOUgi2UuDOCrrbXSic7YL12A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnh/CYca7LtJMI41i22D9DIfUQi74gq6A+0OWAsvuX0O8nEWuPz93Yd7fg3R6/uTVMfP8xZzXLb1bL67EqvnuFmWPGWiuz3Lna2/RHY8QmovYfZzZUWcfGhgoF/kAgz4QC10Agqi37KhssTVSzqXhk6FVc0vpnAEKfpvxPPNEMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqAj9jX5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqAj9jX5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805E81F00A3D
	for <ntfs@lists.linux.dev>; Fri,  4 Sep 2026 14:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788531736;
	bh=H8yO+CXhh/ga4FpBhnMOmErOoh9NP0L+DBKN6No1PQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AqAj9jX5EC7Xmarfh9fOG91N2OsL1mxtjpY+R7zRufp91Sgsiqj6toBo/q+MaQKWx
	 3iOvWoPhdLbpBv5Rzanku7XnHTLki+mxwjvzo1peeUUrrk5psnTAOJ2DZRciaMnvL5
	 YFXa+FofjdB4n7iKlfsnXSYq+z14V3vG8t3x7OtQF3EFwnk/JjZYjpGk01+9238qiH
	 q2i67HfYXe1HIq2O3CX7oTwasOhYPe3DjngI3gcOweHKBKIlWgEZJEiXH1984HvUvi
	 L9XGZVaAKgrAs4kgqe/MdqWlMwIXoTyolRxalEWAkF+LPV34zd/cO42bbKXmwy1LQm
	 mUuh2IdOQpEPQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2529b3139fso132264966b.3
        for <ntfs@lists.linux.dev>; Fri, 04 Sep 2026 07:22:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZmIrG6zGeApTmlDyiS+0K96JL+p7RXZbpNP0Ok3vEH5D7Ir0Ez62xWXzB8WJ4ittM07qF@lists.linux.dev
X-Gm-Message-State: AFuF++kw5xkON3U6miCeFGIzkJbHe5rPHeY6drwTY9v1MYOz9ONsfXHm
	rspSSNnkN1MOczGm89jvyzTvq3OuRDbh9TGBu6yUvhpTLD5dt2r5p1EPW0G3597BRTxVPjBuOhL
	R+wE+sZTGlG/D27QKJIsRrsPWHqIZr1c=
X-Received: by 2002:a17:907:9492:b0:c26:19e3:e98d with SMTP id
 a640c23a62f3a-c2619e3f00bmr135382566b.45.1788531734897; Fri, 04 Sep 2026
 07:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904090054.3365538-1-liubaolin12138@163.com>
In-Reply-To: <20260904090054.3365538-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 4 Sep 2026 23:22:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9V_rPOaoy2keiWxeJOf2Op=zr=c36hgJug6m+HUDhv2g@mail.gmail.com>
X-Gm-Features: AcwNN1WSSgCwey1vhga4SHVJGcXioluXFkH9GI57nt5hapI8JJ9tTFeRcfUQzJU
Message-ID: <CAKYAXd9V_rPOaoy2keiWxeJOf2Op=zr=c36hgJug6m+HUDhv2g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ntfs: fix incorrect error codes returned to callers
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 6:01=E2=80=AFPM Baolin Liu <liubaolin12138@163.com> =
wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Changes in v2:
> - Patch 2: Fixed ntfs_extent_inode_open() to use ERR_PTR() instead of NUL=
L,
>   so it can properly propagate error codes (suggested by maintainer).
>   Updated ntfs_inode_attach_all_extents() to use IS_ERR()/PTR_ERR() to
>   preserve the actual error code from ntfs_extent_inode_open().
> - Patches 1, 3, 4, 5: No code changes, added Reviewed-by tag from Hyunchu=
l Lee
>
> Five places in fs/ntfs/ return the wrong error code: a real errno is
> replaced by -1 or by a hardcoded substitute, so callers and userspace see
> something unrelated to what actually went wrong. The fixes are
> independent of each other.
>
> Patch 1 is different from the rest: there the error is not just
> mislabelled, it is not seen as an error at all. -1 is what a normal
> comparison returns for "collates before", so ntfs_ie_lookup() acts on it
> as a tree-descent hint, and a malformed entry in $Reparse/$R or $ObjId/$O
> is silently treated as a lookup miss instead of being reported.
>
> Patch 2 fixes ntfs_extent_inode_open() which had two bugs: it treated
> map_mft_record() failure as success, and returned NULL for all errors
> (losing error information). Now it returns ERR_PTR() with the actual
> error code (-EIO, -ENOMEM, -EINVAL).
>
> Patch 3 fixes a -1 return in inode.c that reaches userspace as EPERM.
> It loses ENOSPC among others, so a full volume misreports create(),
> mkdir() and link().
>
> Patches 4 and 5 restore errors that are already available as an ERR_PTR.
> Both collapse -ENOMEM into something else, so an allocation failure is
> misreported.
>
> No control flow is changed; every callee already returned these codes.
>
> Based on ntfs-next (0fecc393f206).
>
> Baolin Liu (5):
>   ntfs: return -EINVAL from ntfs_collate_ntofs_ulongs() on bad length
>   ntfs: fix error handling in ntfs_extent_inode_open and propagate errors
>   ntfs: preserve the truncate error in ntfs_enlarge_attribute()
>   ntfs: propagate the map_mft_record() error in ntfs_attrlist_entry_add()
>   ntfs: propagate the ntfs_attr_iget() error in update_reparse_data()
Applied them to #ntfs-next except 0002 patch("ntfs: fix error handling
in ntfs_extent_inode_open and propagate errors").
Thanks!
