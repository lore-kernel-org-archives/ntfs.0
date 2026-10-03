Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB9C175A8A
	for <ntfs@lists.linux.dev>; Sat,  3 Oct 2026 00:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988115; cv=none; b=m83dDMh5FJTJ8oOQjpQSm2Xy358g5Y8hivln7G/JQ764HCig8kxcIdhsDbTR3H/MxaUioA8yYHwnVZeE+YyEDu1G3K9M+9mdCAX/R4Z2DLhssbhW7tcM0m34NFh1Sm6O3gquXX6t9pgfwWN/sI3AnTfgtDT4RIgWeR6vkMb1rR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988115; c=relaxed/simple;
	bh=/1Z6wx3oDkyHLz3uPZy99q/ng3vJ0tlKJTZSxc4LPJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNGcymnDHSd3expURjmR9b1Q+Eo7UGbr3zuRHUNh5XAJlw/dZj46IFWClQAaBdqRBjlMr3X7jrQzC386hVLCDJeDKf6p7mQYx2rYttvK4MarZ0ZT3aRZ8s6VvkUDp50sn3uQclZ7cHnTgv77TSY5Sm4bJoTb8ryJgqg7aq/EWZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQK/awGU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQK/awGU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435A31F00898
	for <ntfs@lists.linux.dev>; Sat,  3 Oct 2026 00:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790988105;
	bh=2auKVAlUJHBG2rXLyVvqvnu98wqH0ruWDeDsqC8nUvw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CQK/awGUnxX45lGHaG6nL6QJF43M8h/UbbkQcKV69bsLamHIZ3lypkwU7/qqfB0ks
	 SHZJpRt/ohrztX6+JYyjRLFg1lHFrvPbMj1Ue2nP4naOrKFK/ovzdlvN7Mj4xTuvjk
	 W7zX/o4DOHyJ4R3UCkxpXSC+YC6pDc28KaD/4ubJu1XAfbpDi9eSlPqn2NtzBLsntV
	 GWYvsGBkdb4mx6Wo/NLfq1YSSdP+TZi4veywYYGWuyZU4o7ke4jo/8sPHPjQ60C1Ks
	 nGcadFZqWNnKtPAh63Hda07fZ3ZorJVdS2MIUz0jfE3kOzKa+Cu8vHQ72vhkvls+6D
	 2BDbRO+aJXDcg==
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb6b726b5so27932a12.0
        for <ntfs@lists.linux.dev>; Fri, 02 Oct 2026 17:41:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+b2cuAhRX0+erlokF0TU+2cqpClnntPqNv/7MzIYdGsoPU2zQ4yScsz6d/R5uiLg3XpiB@lists.linux.dev
X-Gm-Message-State: AFq9FYJojPFUNJBnnZT+3uDukoqTMSASwt96uxCr+Pr7RkOeJMrgaaOZ
	Z3flSNlaapVT/CuNs4ljfJJXoPEXr2pvttGwisafDKwSC+y+JR7KHKaXNL7oGvArnlcxhk7FmmS
	aAAIFJLiMhziWD0+Ol7QEx6Ljzl/lNkw=
X-Received: by 2002:a05:6402:914:b0:6ac:bd48:b827 with SMTP id
 4fb4d7f45d1cf-6af9e36c864mr3307643a12.41.1790988103888; Fri, 02 Oct 2026
 17:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001150558.3970385-1-matthias.goergens@gmail.com>
In-Reply-To: <20261001150558.3970385-1-matthias.goergens@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 3 Oct 2026 09:41:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8rxOTO_xTa5=vSLYXpvf-n4U80BBv8dnX39m4f8tyjFQ@mail.gmail.com>
X-Gm-Features: AclHuK941BpibrtMfPmpXgj4F_mpvyLNSIygT-LwcJJ4kJPMyZt8kJ5aa-p8Ko0
Message-ID: <CAKYAXd8rxOTO_xTa5=vSLYXpvf-n4U80BBv8dnX39m4f8tyjFQ@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: hold the runlist lock while expanding a
 non-resident attribute
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin@kylinos.cn>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 12:06=E2=80=AFAM Matthias Goergens
<matthias.goergens@gmail.com> wrote:
>
> ntfs_non_resident_attr_expand() changes ni->runlist.rl while it
> allocates clusters: ntfs_attr_map_whole_runlist(), the compressed
> branch's ntfs_rl_realloc() and ntfs_runlists_merge() can each kvfree()
> the old array.  Unless the caller already holds ni->runlist.lock, none
> of this happens under it; only the rollback takes it.  Callers without
> it include the write path, fallocate, ntfs_inode_attr_pwrite() and
> ntfs_resident_attr_resize().
>
> Those callers hold mrec_lock, and the write path also inode_lock, but
> the iomap read side takes neither: FIEMAP, page faults, readahead and
> splice read reach ntfs_read_iomap_begin_non_resident(), which takes only
> ni->runlist.lock.  A FIEMAP running while write(2) extends the same file
> can walk the array that ntfs_runlists_merge() has just freed:
>
>   BUG: KASAN: slab-use-after-free in ntfs_attr_vcn_to_rl+0x19b/0x200
>
> A reader that finds a vcn unmapped in the stale array also maps it from
> disk into the runlist the writer is changing, which shows up as "Run
> lists overlap. Cannot merge!".
>
> Take ni->runlist.lock for writing around the part of the expansion that
> changes the runlist and allocated_size, up to and including the mapping
> pairs update, as ntfs_non_resident_attr_shrink() does since commit
> 91709ba5d6d7 ("ntfs: protect runlist updates with the runlist lock"),
> and hold it throughout the rollback, where ntfs_cluster_free() requires
> it.  The lock nests inside mrec_lock, as on the truncate-up path, which
> already calls this function with the runlist lock held.  Where the
> caller says it holds the lock (locked_ni =3D=3D ni), assert that it holds=
 it
> for writing.
>
> For an $ATTRIBUTE_LIST whose lock the caller does not hold, drop the
> lock again before the mapping pairs update: that update can resize the
> same list through ntfs_attrlist_update_locked(), which returns -ENOSPC
> when told that the list's lock is held.  Holding it there made punching
> holes into a large fragmented file fail with -ENOSPC.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks!
