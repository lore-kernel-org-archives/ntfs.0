Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEC249E150
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000237; cv=none; b=Qx9ZmtoOmfj2jM76twvP48PL1wnuaSUy3YFvSsdPWTfPndLPaySje1bDaXT5bwwEok0RY2BfwwQJN2LFuZzwUZzyFHnU1nlrPVm+9ipbl1d9474lMh2F/PqLaVYswMzckH3VZcirIPJmwUVdbKmOhKyHOdm9D8hdXZ79GaxgLoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000237; c=relaxed/simple;
	bh=vqS6RNNSAGXzTafIytPK0CfCb3UpVoMrp/OuTIeyoos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjfDTe1JBYbUw9ku4UGAJRX3AooIK8i6pgZrEr1Ua6xvjRcXPkQ1VHq89AJ3jzQRqW7NOkAMObFyJ0Ta1DFQVzQi/luFMxb7jYDrEM62g2TGxtw7Tqe7p6lGpM2emHU6NNXwmmFjeQmQVLTGA30ATrH9dbSb6M3WtWEM9j4ZjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouSInDTw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouSInDTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB0B1F000FF
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790000236;
	bh=vqS6RNNSAGXzTafIytPK0CfCb3UpVoMrp/OuTIeyoos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ouSInDTw5EyIT2V+h75HO7L7nxJD52RuMhX9yT44t8Jh/pe/zN62pd0M2IAJGnivy
	 8/+wZAP9LJiaIy4OxfcRNb083T0Qx3nY7bIs3UwhnovbivEz6tDeKnVlHyCCUhyRET
	 6e085ceHp9Dom8ry6Q2ad0GVAS95xWtMY+NLaw13bJGHKTiFqSQKgITCUs8E+2jm7z
	 rmWyCbeNLuYzPjyeQuWQtBh+ReI6kQyNbO7HT7KJH26HdW15oGnX+o7sTvol3dkhgF
	 eZkwfEucfYsIvQL/g7z+phmuUbxgP42ldULIjNSPItAWmdhGkkoURJ6KTeBK2jok/i
	 YE/oX4gDN0MYw==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so459019266b.2
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 07:17:15 -0700 (PDT)
X-Gm-Message-State: AFuF++ndH+kBWSvPOcg0mRFnp4YcjsewycOUKlgVoliW/dMhKQdTApo9
	xMcp5sjj8Ru7t9a/U3iI3QwO3SHiqFcKP79LN+VOdOiglsPbds4wVTMOdFuVA2gXRvG8osTBIMA
	sk7zzD2jtNyvsv9wUQVS49f6WCF81y6I=
X-Received: by 2002:a17:907:72d3:b0:c29:d77b:66a0 with SMTP id
 a640c23a62f3a-c2a1578abf4mr861587366b.10.1790000234740; Mon, 21 Sep 2026
 07:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921095333.94659-1-hyc.lee@gmail.com>
In-Reply-To: <20260921095333.94659-1-hyc.lee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 21 Sep 2026 23:17:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-8SPROeoxvgfnGdOFEgV=DoZ5=A8i+prYTqzB0dzw93w@mail.gmail.com>
X-Gm-Features: AcwNN1VVJYpjCHqudEcmj0KzCJme3ng_weWzLRH7WeKp0QaQYvwjpAtTWhF0Q6Q
Message-ID: <CAKYAXd-8SPROeoxvgfnGdOFEgV=DoZ5=A8i+prYTqzB0dzw93w@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: fix FITRIM bitmap indexing for large pages
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, Baolin Liu <liubaolin@kylinos.cn>, 
	=?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:53=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> The LCN bitmap has one bit per cluster, so a bitmap page represents
> PAGE_SIZE * 8 clusters. ntfs_trim_fs() still used a 15-bit shift when
> selecting the page. On arm64 with 16 KiB pages this selects the wrong
> bitmap page and can test or discard the wrong clusters.
>
> Compute bitmap indices from buf_clusters, use the page cluster base as
> the bit-search origin, and keep the requested range as the clipping
> boundary.
>
> Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator=
")
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Cc: Marek Weso=C5=82owski <marek@wesolowski.eu.org>
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks.
