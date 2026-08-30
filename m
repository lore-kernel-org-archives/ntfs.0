Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8E26A1AC
	for <ntfs@lists.linux.dev>; Sun, 30 Aug 2026 02:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788058130; cv=none; b=b7v0M7YbDStte5Yjkhmtr7JPr0zKD5MO/hXTKdtLeoEdFpoQEa2wMaAz2UiDvCJ9jo4a+/hHJO45HFgqygViZQIOthLBPNJS0q9dohd7QdqJcbgOOcZU8s/Q0IiXjNV03LOkBhzuQblIvOLmM9Uj0tg1W/BA2dvZY20JHv0SSm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788058130; c=relaxed/simple;
	bh=NlQEp129kN3pCxTJpaZ+/2EhoQQ4R8elN/VBerk3BJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfkaD3QNZZxoORtaKCgBtC3VZNThlnI2dL4t1W1VQUixSDr2kI9Xu5pdorINAesRW0QB1jR4hLDLiO4ZpHQZO6ZuakXG2fpTwq04XmA2TEsDbimoFz+EHXm4a+i2bwR0JO2OYipa5XgPAiPfTH21gndBfIynKPzQe80FzHesoAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUiU+KTx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUiU+KTx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308691F000E9
	for <ntfs@lists.linux.dev>; Sun, 30 Aug 2026 02:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788058129;
	bh=NlQEp129kN3pCxTJpaZ+/2EhoQQ4R8elN/VBerk3BJ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nUiU+KTxe3hftQrO82Tt3lagO8CSwn55WkWwHXInasYkFvFF+rE6QdB/KaZRRHZlV
	 O7D3WZaNOoQgildoI1XBdKOAdZfKegfxarQ+thjczO+XqT0vBLWDTnMBUKM+2RDRU3
	 WCSy9oDABG7XIMyx7haKQBxKJSwz8t91LvL4hl8XVNCHo+HAPy1mKV7AE+Zmod9WCa
	 IrR58sdmCLSuva18bFlV6MYhu4Vl1k4kaSmXxAHPiSdCjNRE1Lz5pbgLa0USoep0je
	 0gA4ph3My8L/kj6c8dYQDzxUTGKy8THs122XlzrHUcyU1D0CAarmtm8RbU6PMM50+K
	 TEBn4Qd9KPYoQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so272237a12.2
        for <ntfs@lists.linux.dev>; Sat, 29 Aug 2026 19:48:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDQCJ6LvXGkuc7a6npZfhGchNmmtl5qOh/ySW8enhvgUeTkUSqwRLTOdhk3N4nrH/ADRnd@lists.linux.dev
X-Gm-Message-State: AFuF++kEtIYSIuhVI2TPO+c/6w6B1G6hpLASAwmfRD9GHNelWEysoGZU
	xdMT5pfvwL/dOz3L9mMvlAP43zEdlEpWwMbTmboKHuRHDLoHyVYHqfU+Caw7yUSTCb7f3lTlrKE
	+euLxTEFk2yVEJfoaHgGTXJ0/Uw635rk=
X-Received: by 2002:a05:6402:a0d2:b0:6a5:d6b5:cf80 with SMTP id
 4fb4d7f45d1cf-6a60d3933b6mr9431532a12.11.1788058127808; Sat, 29 Aug 2026
 19:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260830001536.30841-1-jacopolabardi@gmail.com>
In-Reply-To: <20260830001536.30841-1-jacopolabardi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 30 Aug 2026 11:48:35 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9U9XOSu-NAq2O7N2eJ-A-DaOYgrrQT3YH1Y21UA3yEFw@mail.gmail.com>
X-Gm-Features: AcwNN1WhzHEYJEsgG4TEoOKPc9DUOQin4JJe5uLruVZO0bt-rrg3fpfOt7uiTmQ
Message-ID: <CAKYAXd9U9XOSu-NAq2O7N2eJ-A-DaOYgrrQT3YH1Y21UA3yEFw@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix FITRIM range alignment
To: Jacopo Labardi <jacopolabardi@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Christoph Hellwig <hch@lst.de>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 9:15=E2=80=AFAM Jacopo Labardi <jacopolabardi@gmail=
.com> wrote:
>
> ntfs_trim_fs() aligns the start of a free extent up to the device discard
> granularity, but derives the discard length by aligning the original exte=
nt
> length down. When the free extent start is not discard-aligned, adding th=
at
> length to the aligned start can extend the discard past the free extent a=
nd
> into allocated clusters.
>
> For example, with 4 KiB clusters and 32 KiB discard granularity, the free
> extent [4 KiB, 36 KiB) becomes the discard range [32 KiB, 64 KiB), so
> 28 KiB beyond the free extent may be discarded.
>
> Align the absolute end of the free extent down and derive the length from
> the two aligned endpoints. Skip extents that contain no full discard unit=
.
>
> Reproduced with a 4 KiB-cluster NTFS filesystem on scsi_debug configured
> for 32 KiB discard granularity and read-zero-after-trim. Before this
> change, FITRIM zeroed seven allocated 4 KiB clusters following an unalign=
ed
> 32 KiB hole. With this change, the same data remains intact across FITRIM
> and remount.
>
> Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator=
")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI Codex:GPT-5.6 Sol Max
> Signed-off-by: Jacopo Labardi <jacopolabardi@gmail.com>
Applied it to #ntfs-next.
Thanks!
