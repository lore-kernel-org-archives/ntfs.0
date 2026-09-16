Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D859450C297
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566901; cv=none; b=EfSZiyv05ay0Bv7U8BDtuHzyZCldGG2GbKISUx53uukNjCsSvbrHo3lfrONAX8DDhI9PEKEeoY7O5Ikl92LgvGwxxs8OkNowPsjet19nKnfGF83emqTS7Aa4iFi8GJ7FzY4CKAYI/CjTTYs2hIu1jR7qcxoVNnWwUIdv2cchfDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566901; c=relaxed/simple;
	bh=KnvsFIvnA32FFLd5RxZjujAGrvrePRqTiskbu2mxv0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMcICmMXWe1iibAU4k/MPDxh8KZb8FRb1IH+X/EFUpIfgyGp06QuVq1Dp0N4Gh5Sfs/RUZhKIsKXeB7rlE4p92PgSA7Ci7RqXYbwYiBVOtJMDiY3Kyzv1KeVO3+4H6kX+ZdqthrwZljHrY3Xocnbot/zztwV8CFbM4e7PvDiUcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJQZj+Bl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJQZj+Bl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A623F1F00898
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789566892;
	bh=KnvsFIvnA32FFLd5RxZjujAGrvrePRqTiskbu2mxv0Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QJQZj+BlpxfbRNKCwIkhWZp6Bfz8TEARsvxiPstUXVX5tixK3LzKWmoSuFbzztx2W
	 5o5nqvjW5IiC1dsnqj0FHjrpwQdZC4xciZVEiTaRrcYJ/q3/+kt8qykSv/w0Iu82yH
	 H3n1S6jsPQOOOR4TjYZ1izBpYKLjCP1Vv+8doSioQDG5P2HAXBkoupTV6nGtWlK+sP
	 q2lJUJCn8huoc2mP4c9P2hYmJYosli1NCTbnNHyk9zmr8K3hyElOPW3iHwBVnEnoP9
	 xtX9vXvyXDTnwjh60K2W+fLehw/oMRwq4kn8FGZvgEc0lj16q+p+nuWPA+92iQI7Qt
	 BOYJPYZFfvh9g==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa650c8so173633566b.0
        for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 06:54:52 -0700 (PDT)
X-Gm-Message-State: AFuF++lNtnqnaxeGL0X+vZJ/gN2wBxMVyJJFWP6S8hLvajvTNtuDINbg
	JprMxYIxxi6loV4TTM+lsL7NhtN0gPlKCEiWQt8LWeZNmK6ct4XcOE6LhoB4h7H5pg7RngCP/bB
	Rx9DSH7/XMsZ9JBmhHclznZYwDsZRZg4=
X-Received: by 2002:a17:907:9482:b0:c29:3838:dd69 with SMTP id
 a640c23a62f3a-c29e5327601mr185546266b.39.1789566891327; Wed, 16 Sep 2026
 06:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <81955f5b-ee97-4856-bb77-bffc739a8f5d@163.com> <20260915074722.27533-1-marek@wesolowski.eu.org>
In-Reply-To: <20260915074722.27533-1-marek@wesolowski.eu.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 16 Sep 2026 22:54:37 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_nxjah6_Q0PxD7BwXMR8Q+T=sz98TLPSxTpqe-p7c9bg@mail.gmail.com>
X-Gm-Features: AcwNN1XDs5BJybDjlPAAE2hWxDvQjQ68rQl1hFZK3IS-juYJkW0ba-xuCn-MYiY
Message-ID: <CAKYAXd_nxjah6_Q0PxD7BwXMR8Q+T=sz98TLPSxTpqe-p7c9bg@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: fix directory lookup on large-page systems
To: =?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>
Cc: ntfs@lists.linux.dev, Baolin Liu <liubaolin12138@163.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 4:47=E2=80=AFPM Marek Weso=C5=82owski
<marek@wesolowski.eu.org> wrote:
>
> ntfs_lookup_inode_by_name() copies PAGE_SIZE bytes from the index
> allocation mapping and applies MST fixups to that entire buffer before
> selecting the requested INDX block.
>
> When PAGE_SIZE is larger than the NTFS index block size, the USA count
> belongs to the smaller INDX block. post_read_mst_fixup() therefore treats
> the PAGE_SIZE call as not applicable and leaves the update sequence words
> in place. A directory entry crossing a sector boundary can then be return=
ed
> by readdir but missed by lookup.
>
> Select the INDX block first, apply the fixup using its actual block size,
> and propagate fixup failures before validating the block. Report fixup
> failures through ntfs_error() so the configured errors=3D policy is appli=
ed.
>
> Return -EIO when post_read_mst_fixup() detects an incomplete multi sector
> transfer, since this indicates an on-disk metadata integrity error.
>
> Reproduced on arm64 with 16 KiB pages and 4 KiB NTFS index blocks. The
> affected entry was visible in readdir but stat returned ENOENT. Both exac=
t
> and case-insensitive lookup succeed after this change.
>
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Marek Weso=C5=82owski <marek@wesolowski.eu.org>
Applied it to #ntfs-next.
Thanks!
