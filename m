Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744283C0A00
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000562; cv=none; b=IcxlPsM0p0B4f+friP3jc9Nm2vemDe3QI+JwmLXF/3FwB9uK/zFyJKbSgpG7QWGkmUM5el0yW2VPcwEwo6TSolsy59GS0YqrWQrn2cSKCrA4NpYAjYmg3PovRNIprvAugLVJqX3AjqD3B+DORCy9tTvBamEergGB8srMreiWl9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000562; c=relaxed/simple;
	bh=rZ+iIZqg9Sn/bCZn5A9Pz9Lv+qXAskT5Ny/hU/1hQyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BczPMebhDKNkp28auqGtuvwoefnO69lFeyPFCt1CVFc/jQLfe1w43jO5AlPAW9BxfbpuWcDK6fFdonn3FKUE457aXFKXH15snknZk8CbqEKpXZ3SnwxRR0NqJkZdp5+tsAkb+cqwaVy+LXTk/ztgvXreFPO4HGyb3fhBz4+jIFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHodzdxp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHodzdxp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B39F1F000FF
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790000561;
	bh=rZ+iIZqg9Sn/bCZn5A9Pz9Lv+qXAskT5Ny/hU/1hQyM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hHodzdxppD0gIyr9dyfCeqF9nKFfZ8pyJ+YmCT5dPtU+LHWga+bFMvYlm+MWon4Ww
	 DmG16xSENl+velbmDzQiHci5R0K7MMjv4D6HimgZp+0SQoDHQc3prWYdxLfUK5naWy
	 3ynqz0SFDz+ZlrvW/xT9YexjJw5PEMYUUmjeamaSLULFHd/zs93iT0VbBX86EVi1ui
	 HdQKss5b6OCMLyg1eGiKD727cK86XL8ZAV3sOaS87zX2Cb1G1/5JQQh9Z2SlFwehVz
	 0wA25vuh4k7T6IxZan9kW84kKG6jkBkTSUfQ8IOC4167lLQUuZkDeWt9DUXgoOY9kP
	 ezGjmo27TaYfw==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so388159666b.1
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 07:22:40 -0700 (PDT)
X-Gm-Message-State: AFuF++l2/LLL5psL+YXktxGDpxJzjHhlQm80gts0DFqGJIG2+1Plx82e
	KXcVvu/uoZKN8mWgFxxufLuDeIwoGeqXcq62qTmiFqg8LfU9CJ2pSybWCwkLrsG6SZMtTNvbtfo
	i0VZqoWEfO/OyR7orUF1dgRgzuXSoZiA=
X-Received: by 2002:a17:907:9618:b0:c26:19de:9adb with SMTP id
 a640c23a62f3a-c2a157fced4mr922237366b.26.1790000559678; Mon, 21 Sep 2026
 07:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916131837.28568-1-marek@wesolowski.eu.org>
In-Reply-To: <20260916131837.28568-1-marek@wesolowski.eu.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 21 Sep 2026 23:22:25 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9SQ_6fLm1v8nxj3WrnBT60S4Fy8_oZrN+Oi+0rOw2aEA@mail.gmail.com>
X-Gm-Features: AcwNN1UqfKdnlshHlNumHxtIBG7Uc_UJE8folgdPusMuccOy9DwfGsiMZi5hH58
Message-ID: <CAKYAXd9SQ_6fLm1v8nxj3WrnBT60S4Fy8_oZrN+Oi+0rOw2aEA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: stop MFT writeback at allocated boundary
To: =?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>
Cc: ntfs@lists.linux.dev, hyc.lee@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 10:18=E2=80=AFPM Marek Weso=C5=82owski
<marek@wesolowski.eu.org> wrote:
>
> ntfs_write_mft_block() tests vcn in the loop condition before
> recalculating it for the current MFT record.
>
> When a folio straddles the end of the allocated MFT, the stale vcn from t=
he
> previous record admits one more iteration. The recalculated vcn can then
> equal end_vcn. Runlist lookup fails and the volume is marked erroneous.
>
> This was reproduced on arm64 with 16 KiB pages, 4 KiB clusters and 1 KiB
> MFT records. With allocated_size 0x13000, writeback of folio index 0x4
> attempted to map VCN 0x13. Creating an empty file left the volume dirty a=
nd
> the next mount was read-only. A mount and unmount without the file creati=
on
> remained clean.
>
> Calculate vcn for the current record first and stop at the allocated
> boundary. The patched driver passed file creation and deletion, a 64 MiB
> fio write/read verification with crc32c, sync, unmount and read-write
> remount.
>
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Signed-off-by: Marek Weso=C5=82owski <marek@wesolowski.eu.org>
I can not apply this patch to the latest #ntfs-next branch. Could you
please check if this patch is no longer necessary in #ntfs-next
branch?

https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-ne=
xt

Thanks.
