Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71D342515
	for <ntfs@lists.linux.dev>; Mon, 31 Aug 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173341; cv=none; b=IsOQ1NZ/BDsIq5vnsGGJGoDQ7lodFT8l30hWNeOj8PcKz1o//DwfkbV/X9L6yZ7eVHP10dCY/R2dpXwqoufr53qXZEurDmMNYdvA5OOjxbQXLhMupG2cYqtuja4pnKpTfgChbQHNY0EqnT6XaSf90drj0OImnwTb274BzUBoVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173341; c=relaxed/simple;
	bh=InUFVFoDCQ1R4NnYXlhWnvQLAIMQF3Yznq+IJ5k904Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oniHJwCQuc+MRNBDc6xwDTyTA2p908bBfviR8CRYfirwb+CjV/MAQivbjh2niRGDu4ls8reyTKdpbqmv/2q4r6sh78IoN9JZufREa1GPGi6k50azkkj06Y7AefcJEaN9L4dy2a7wfnbBgdKGr2urXXTs/1EewyjvyhHcPrOtrc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWMRIIrA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWMRIIrA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654211F00A3E
	for <ntfs@lists.linux.dev>; Mon, 31 Aug 2026 10:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788173339;
	bh=OBf49Cwts5N/xbDnDGbOmlCaZGVP+7okCnL/y1wmn9A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jWMRIIrAGfb+pq1367Kkg9CZi2qx68+X67xeCZ3PmMIcW4Q/Hs5CBcsXTAkKjdS2K
	 iqe6QD8FG660SaMW0rf8B/pV7ya7hun8j0K0fBj+IEUj+C4gtAb/S/3kjSgfauDHYD
	 GvUPCkELvQb9CiRlCASMlFL4OytWBNS8FyXSmpER+FwtSj3AbHiMIc06+ykkeCBlvZ
	 1Md6MmtPVKqM5QaJAOTb9+ASBeEVMnZHZrnWOpG+JdhIJrbvtugaLn9A9VBFA1HCYq
	 D+1IJVbp6Cd9F9zMm80tJ+p8QCPzOz1AHVvA+2jQiIQ1rWGmBdF/51FnInMlHpxY49
	 8roKsTK6wUyrQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2533d83e3bso545466266b.2
        for <ntfs@lists.linux.dev>; Mon, 31 Aug 2026 03:48:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RobDo5JZSqbj3MGIJr5oSFLe2Hbn4Purr7uwfFw7WVVRwUU3FpsEJggyftJyCJv5fd8rADS@lists.linux.dev
X-Gm-Message-State: AFuF++kaOMSh8sSBvBpNkDeRWdTtDHpVW8dlot3HwKLy/pzJKsHLCHxp
	Cl36iK9FezxtcGFBGK8aRozqMCTlmfCoMWtOFzBqC/+xMgwtnxe0ssSeKcTU8bpno46uGmXN0QQ
	C7cG5Q2P3npLKGo2AEsQzp+XIDaruZ18=
X-Received: by 2002:a17:907:1c94:b0:c24:d6f0:1223 with SMTP id
 a640c23a62f3a-c25ab4f3879mr159758666b.12.1788173338043; Mon, 31 Aug 2026
 03:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831083252.80732-1-zenghongling@kylinos.cn>
In-Reply-To: <20260831083252.80732-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 31 Aug 2026 19:48:45 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_-31u8GWP7ze4n3+T=irL6J2sYPAXqAdE1RF+Cpk4oVA@mail.gmail.com>
X-Gm-Features: AcwNN1WY4iEEhjrFcI0FdLJ6z1hIRAT0Ads6b1GC09s-OrqD6NRdaUYRtxJbir0
Message-ID: <CAKYAXd_-31u8GWP7ze4n3+T=irL6J2sYPAXqAdE1RF+Cpk4oVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ntfs: take invalidate_lock in ntfs_filemap_page_mkwrite()
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:33=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> ntfs_filemap_page_mkwrite() calls iomap_page_mkwrite() without holding
> mapping->invalidate_lock, so a concurrent truncate or fallocate can be
> in the middle of invalidating pagecache and rewriting the runlist while
> the write fault maps blocks and dirties the folio.  This races with
> ntfs_attr_fallocate(), which merges clusters into the in-memory
> runlist, drops the runlist lock, and only afterwards zeroes the newly
> allocated clusters on disk; and with the punch-hole/insert/collapse
> paths that free clusters after truncating the cache.
>
> Per Documentation/filesystems/locking.rst, ->page_mkwrite() must ensure
> there are no truncate/invalidate races, "usually mapping->invalidate_lock
> is suitable for proper serialization".  xfs takes its mmaplock (=3D the
> invalidate_lock rwsem) shared in exactly this path.
>
> Take invalidate_lock shared around iomap_page_mkwrite().  The read-only
> fault path is already covered because filemap_fault() itself grabs
> invalidate_lock shared on instantiation/read paths; only page_mkwrite
> was bypassing it in this driver.
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Cc: stable@vger.kernel.org
> Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Co-developed-by: Namjae Jeon <linkinjeon@kernel.org>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
