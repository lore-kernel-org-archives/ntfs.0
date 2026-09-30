Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411E5377A9C
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 10:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763404; cv=none; b=gLOEZheNSd2KYP3zk+s4fIj5P254iYuhkNCbG0EyUfSpQTLBkNW21jvCmldWemDLdL93HPn+fQKcdXNTxLpJ1oeDe7aB3B1CHj7cF8HCGnf6sYprF/ui/2qXbVj267S/ayYjFJBTb9MtxyXRLZ6hZ1R4mezpMnqGBvbzbq+eoOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763404; c=relaxed/simple;
	bh=A8CHchd/DQeuob/IKvMzAA6PQSaRBESgnbDq2V+pDLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djXHoXx7wa3vDXeyzbR7cSoR1N8HDiH2nEzst0Tc/nu7Lki2JykkH4TxtVnQupJlVj55vnOc1NA93NwiPhP6hWJLcfXY0U9FJLYji4b6m0mJ5qvf3/cCtD2GnMKP0uHreTkqJuWbkmaf+nCOLo34ihbyBNBWH5RnJncSOL1luYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAhNCoFS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAhNCoFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA1F1F0089B
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763402;
	bh=uHXOnZ9BNFSIN05Dg+T7/oEbdZnSWmLY544tdTXPE1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XAhNCoFSBa9mzkhUTRZ6s+LjfcUdKjtSgaumrDU0uiiH6xucs0AWf1M4JDMQ3A2Ga
	 K+MDK301g/xKlb4j0RmHffj9fNL9sY0U0ymQ53BK35xgSLHsdfJ42VnxyzDzm9GIi7
	 tq5atbM76nBQI4c6+e7AugGId9H1SydojzkAXzJspexuxdSApgWv8rd9ZxdeGOJnsL
	 Ad9tcdO6Ph0iqzFzEFCWaUUwHiG3I61e6QCni38RnlE5rvdVKiBRWO5sM5dYuuhDGW
	 kGtsZDhR/eT/mTzTkvk9s0unqe8vL01U0YQ/ZJSqRfINck8+6imoGNvq+VQta6cyqL
	 Dcv7dAQ/jwzfQ==
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e1195040aso124034866b.2
        for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 03:16:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwpJkX6fC5wH60WHlJQOWYoQTN/U68pnHImUZudCG6ew3IITbqxZaDf0Wx29bk6RlEkM/F6@lists.linux.dev
X-Gm-Message-State: AFuF++lpPXNxXnbLJ7hCQ7SQcMo8vIrKp7Px38zmo9tqWiz3d0KdP6kj
	YKv9ishHK9nI/kRU7vbFxkVIseqkr31e34jhHa+WNwB7tcpBQv1MkdJTP6+fxbC5/dnI2w0E7t0
	bNiblNrH+/6ij8oGf4JX5PtODg/BVpEg=
X-Received: by 2002:a17:907:6095:b0:c2a:50a7:d052 with SMTP id
 a640c23a62f3a-c2e2374b5afmr70014666b.7.1790763400537; Wed, 30 Sep 2026
 03:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790684177.git.matthias.goergens@gmail.com>
In-Reply-To: <cover.1790684177.git.matthias.goergens@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 30 Sep 2026 19:16:28 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_XDTTB2upyHxzgYfwODuaYpG-WXcuQ0Tjn3PtHoXr30Q@mail.gmail.com>
X-Gm-Features: AclHuK8-cC67NvzR-eTpsX__xkhD08L02GRBoaCQQaJYTSWwsBL-yfX3afqU48E
Message-ID: <CAKYAXd_XDTTB2upyHxzgYfwODuaYpG-WXcuQ0Tjn3PtHoXr30Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] ntfs: fix the $MFT bootstrap hang and reads of
 unmapped runlist ranges
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:48=E2=80=AFPM Matthias Goergens
<matthias.goergens@gmail.com> wrote:
>
> Hi Hyunchul,
>
> This is v3, with your review of v2 and Baolin's applied:
>
> - Patch 1: a failed retry for a vcn at or beyond allocated_size returns
>   the runlist end again, as in ntfs-next; only lookups below it fail
>   with -EIO.  On its own, v2's patch 1 also failed lookups past EOF,
>   for instance when reading a file's last folio with 512-byte clusters
>   (Baolin).  Baolin suggested moving patch 4's allocated_size check
>   before the retry instead, but that skips a retry ntfs-next makes: on
>   a corrupt volume whose allocated_size is cut to where a file's last
>   extent record starts, the rest of the file was then read as zeros,
>   where ntfs-next and v3's patch 1 read the data (with the whole series,
>   patch 6 rejects that file).
> - Patch 4: the if statement you asked me to merge is gone, as the
>   allocated_size check now sits in patch 1, and in
>   ntfs_attr_vcn_to_rl() patch 4 only extends patch 1's -EIO to
>   LCN_ENOENT.  The expansion rollback restores allocated_size under
>   size_lock.
> - Patch 6: the comment is gone, and $MFT's own non-resident attribute
>   list is checked too (Baolin); a volume where that list claims more
>   data than its allocation used to mount and now fails to.
>
> Patches 2, 3 and 5 are unchanged.
>
> The series fixes a hang at mount when $MFT needs its own extent records
> (patch 3, which needs patch 1).  Patches 1 and 2 fix reads and writes
> of a runlist range held in an extent record that cannot be read, which
> returned zeros with no error or silently lost buffered writes, and
> patch 4 does the same for a runlist that ends before allocated_size.
> Patches 5 and 6 check the sizes of $MFT's data and of every non-resident
> attribute against their allocation, as fs/ntfs3 does.
>
> Tested under qemu with KASAN and the hung-task detector on ntfs-next,
> with and without the series.  Nine crafted images that hang or crash
> the mount without it fail to mount with it, and six that read zeros
> that are not on disk return errors instead.  Eighteen images that mount
> without the series, among them eight public test volumes written by
> Windows or mkntfs, read every file the same with it, and six small
> mkntfs images still mount.  v3 gives the same results as v2 on all of
> them.  The images and the scripts that generate them are at
>
>   https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-nt=
fs-mft-runlist
>
> and, for the ordinary file of patch 4, the unaligned allocated_size of
> patch 6 and three of the eighteen volumes that mount, at
>
>   https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-nt=
fs-v2-extra
>
> and, for v3's changes, at
>
>   https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-30-nt=
fs-v3
>
> v2: https://lore.kernel.org/all/cover.1790417653.git.matthias.goergens@gm=
ail.com/
> v1: https://lore.kernel.org/all/20260922153931.1976405-1-matthias.goergen=
s@gmail.com/
>
> Thanks,
> Matthias
>
> Matthias Goergens (6):
>   ntfs: do not map an unmappable runlist fragment as a hole
>   ntfs: do not turn an unmappable runlist fragment into delalloc on
>     write
>   ntfs: fail the mount when $MFT needs its own extent records
>   ntfs: do not map a vcn as a hole when its runlist lookup failed
>   ntfs: fail the mount when $MFT's data size exceeds its allocation
>   ntfs: reject non-resident attributes whose sizes exceed their
>     allocation
Applied them to #ntfs-next.
Thanks!
