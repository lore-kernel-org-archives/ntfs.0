Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944DC39A04F
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000302; cv=none; b=pcnSaS8ivdeVz9OZ4NBAnBGBCs2kcGrImSRSjZXiZ1vSJbBUrxTMegc7O0mEFEelVbRVJysKEXdAGE3pbMsJlAyT3u78PRIIYuvnF/sG6iIs7EtILEV1/fKsUlVhsWyrE3V3E65mrbTM3lxmQfQEBSotPKE8bzaqaIxJabNO1DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000302; c=relaxed/simple;
	bh=O1pcyfGii3Og1Bqx2QkLaUEPqGaifOl0r8h2QFwC8jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKerPCt5XdoDi5F/VrBZWuAGtS/uvFFUaF8aMUfEcrEbPjEF/uW/z9O+aiJC6IM7WqUiziC4VbCMUbXqwK1wg7vNf8DQ7OrFpIgVUjs3aqacpVOjAL0ayZ0fPk4pyXr1zU5myw++lUIrB8/sdAZ+wqFfpyzAbIjuqNhWCDcVBsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhSsHaxj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhSsHaxj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0AD1F00898
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790000300;
	bh=O1pcyfGii3Og1Bqx2QkLaUEPqGaifOl0r8h2QFwC8jY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NhSsHaxj9BlvJW2BNolakyQFUJliAqIbLxK8W90eUpzEmLTsfzaPb5zI+025AbI2D
	 VCqcu8oUhR4RJCFEM9tKCHmlMPMsh8wJgM4XdLwwje03mwKMvd0E/ed2NXGnNclVrk
	 XnJO6+uvCmQ8i1B5cS7RbzjlyfV0RPxrrjAZvfFTbO5O59EV2PvsCbYUyITkxRQmEN
	 kGCz8F9I04gxGTb6MdSpaSH3NojyAyDzT+RM+81neuc0nFmKmRu42GbUGD6kRGKDVf
	 35O/A/Titz8dLxmMWi6nm7h29xDAUQhUR4uEltIa6xiEeWdiqc2Oxp6OqBdemYqDQC
	 1HznF0hrw+HcQ==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so461869766b.3
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 07:18:20 -0700 (PDT)
X-Gm-Message-State: AFuF++kaC1amdxvwq5my138t1u6cnRtzl5kUyWxr9CUeMmE8A8YvcrZ+
	LPReQbh2IyTlNKwENfeJGgYaSaj2gRzIYRgzlUqwRDkvPC835H2KCdXu13Y54rYtU7N89gb8i5S
	R1m93P2SzZctJzlc3zzSYsnccdyru7+k=
X-Received: by 2002:a17:907:72c7:b0:c29:450f:bdbe with SMTP id
 a640c23a62f3a-c2a156dccb4mr921929666b.16.1790000298783; Mon, 21 Sep 2026
 07:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921014116.2781001-1-hyc.lee@gmail.com>
In-Reply-To: <20260921014116.2781001-1-hyc.lee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 21 Sep 2026 23:18:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_+g3PWFSUkY0E+_Bj2-n-VOzoK1e9SwNWfoTdK5oa==g@mail.gmail.com>
X-Gm-Features: AcwNN1VuiOw0ZAxpo1muT2nSq6_iN-9_uZdCQD2IGTfGWSsFZ2QWVXalhNvbeFM
Message-ID: <CAKYAXd_+g3PWFSUkY0E+_Bj2-n-VOzoK1e9SwNWfoTdK5oa==g@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix FITRIM bitmap indexing for large pages
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, gunho@lge.com, 
	=?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 10:41=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> w=
rote:
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
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> Cc: Marek Weso=C5=82owski <marek@wesolowski.eu.org>
Applied it to #ntfs-next.
Thanks.
