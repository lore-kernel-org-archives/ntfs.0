Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6571B35BDDB
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 05:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969252; cv=none; b=EK2e7XG8d1l0LeXeJax5dTOYblcNycd+j49k+Bvc+6MV32+RLTLDK+LTf8+PksG/bs624cBhqQLiD7/WgbKFPmWbE5wg/OiCxsZmjScvsMa7Msd9mfSgx9XVKHyU8z3dC9ps9KdN045VZWenso/jQgbvv7YiCuuFUgrnunAy4do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969252; c=relaxed/simple;
	bh=7C8a8gl3+/V17z5Y/OdrJgOYp2YXwcYSofe0LRJp6bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiu+vLCdx9nHg5rETY35y6Io5meW5feMhVpj7FCmVqHwATmLIK0A5xHj3CfVte9+pIduob/NfrbWRPUDzCAMhg2d3c8iRmOA7Y7ALb9tWAsoTliOuL5PXZ6n7YgB6OeTj7VTZhokwEqhpY9NeEodIOx5RxagG+qJ2d/X6r8G6A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfKL0JgW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfKL0JgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028191F000FF
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 05:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789969251;
	bh=3vptOxIiwDK37IRk+ZQzrnUXBv/qwN+VTeIrsTCuA+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bfKL0JgWd1H8sQ/VclhYcN5smfcI/qdWO+mHDQ73ssYFhpAri228qYBhRAoorTFOE
	 pye/vPELiA1sQzHqwaNRzQFPTTJpc0UMUBVBXLfaM9iB3ooTMees4H9VM/RXCRvXEW
	 bTXybbdmLSkpnNv5Ih3Ma/89kytLwhHIewpXzvUMvjdEh4rDK7xaYyb/eB29HbQl98
	 S8h/3KcQJNWrWn6smgIOhmjAcnwxVcVKGQ9OLUe8g6hUHMl+qDt2VvZBWrhnMK1pwW
	 4Kb6puMdRRlOJ9qeeFYoQxzd7nz8xQSQsFzZQZzgIn0Cn3J1Nd8QNgWmaaiEcLbfCi
	 3r+uvT9Hjh1jQ==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ba73bee8so1846381a12.0
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 22:40:50 -0700 (PDT)
X-Gm-Message-State: AFuF++mD5uf4dbb7bnQWKn+/daebRZTSUeIdP/KKizwz3dxb+YZQhWBY
	fo80TYXVoHT2hGT97yAOnb6afbXq/rkl6YfzR7+QkDFHRyy+ASY0F+Si/D96/8rjTZ3cuuZjkca
	vWWwhWbcD6xFHCKlNZAeVkpBBMCon5r0=
X-Received: by 2002:a05:6402:a0c6:b0:6aa:1406:fd12 with SMTP id
 4fb4d7f45d1cf-6aa4f9c470amr6532916a12.6.1789969249625; Sun, 20 Sep 2026
 22:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
In-Reply-To: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 21 Sep 2026 14:40:37 +0900
X-Gmail-Original-Message-ID: <CAKYAXd85_s3dYWzEy--0guM_ugbYUR7F7m2PukUzpCSx1Cuzfg@mail.gmail.com>
X-Gm-Features: AcwNN1UtKL2V4W-u3jEvOHdiko1vEB3DADro8Ux0CywUgsmXPM0pq-9pP23Bpbc
Message-ID: <CAKYAXd85_s3dYWzEy--0guM_ugbYUR7F7m2PukUzpCSx1Cuzfg@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] ntfs: support 4K-native devices with smaller MFT records
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 9:20=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> Make MFT writeback safe on native 4Kn devices when MFT records are
> smaller than the device I/O unit.
>
> Validate MFT I/O geometry, map and submit containing I/O units, and
> coordinate direct writes with generic folio writeback. When a write
> covers multiple MFT records, preserve the unchanged contents of
> neighboring records in the containing I/O unit. Keep the completion
> behavior requested by each direct-write caller, while requiring
> synchronous completion before releasing an MFT bitmap entry.
>
> ---
> Changes in v5:
>   * Rebased onto ntfs-next from
>     git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git.
>   * Patch 6: Adapt allocations to the kmalloc_objs().
> Changes in v4:
>   * Patch 6: fix for the 32-bit ARM __aeabi_uldivmod link failure
> Changes in v3:
>   * Rebased onto ntfs-next from
>     git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git.
> Changes in v2:
>   * Fix compilation error in Patch 3.
>   * Keep valid but unsupported MFT geometries read-only and reject
>     read-write remounts.
>   * Document the sync-dependent -ENOMEM return from write_mft_record().
>   * Add Patch 9, which trigger page_mkwrite after native 4Kn partial-EOF
>     size extensions.
>   * Add Patch 10, which wait for attribute folio writeback before copying
>     a new non-resident attribute.
>
> To: Namjae Jeon <linkinjeon@kernel.org>
> Cc: ntfs@lists.linux.dev
>
> ---
> Hyunchul Lee (10):
>       ntfs: read MFT writeback bounds under size_lock
>       ntfs: validate the MFT I/O geometry
>       ntfs: write MFT mirror data in mapped I/O units
>       ntfs: serialize raw MFT updates against folio writeback
>       ntfs: track direct MFT writes until BIO completion
>       ntfs: write MFT folios through mapped I/O units
>       ntfs: write MFT records through containing I/O units
>       ntfs: use sync flag for direct MFT writes
>       ntfs: trigger page_mkwrite for native 4Kn size extension
>       ntfs: wait for attribute folio writeback before update
The Fixes tags are required to be propagated to stable kernels.
Thanks.
