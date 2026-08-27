Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DFB459AC6
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835118; cv=none; b=IZ2m2j8hJFGD9khVcIyRDoJOFdtatqTNDLPkVQq9iqCduDRrjSk15+o+yJaQI/g8sphFwFrQAlnlyaPn1552ZXEby3ABNd9idlgP0r7Ilb6HnUzGSEyD3fyu2coJnWHlNylCFiSUFY3qB6Eyu/mJvfSq51xXBqXaIFPYFJ4+Yqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835118; c=relaxed/simple;
	bh=v5jl+aCSpkkvQGNIYYVrCrKyR7mWn2LR3j2JbpKPgPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LCOCXwuo8oqYKK/UvLoYOdZaikwy3k/LRoWfyt++gAU/DjQNiP4D4y+s1J4JEJ/rXuqtwbjnuoGKKXsDjFvnQKGqrznHQ5hQfSlfAMVA0l4ryp76tSvmx21f2XTBPzsRZAGeKgGb/J9ABvi+9ukkKiLr900XXL/VFMKFavaJM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtQTj6od; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtQTj6od"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F751F000E9
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835095;
	bh=v5jl+aCSpkkvQGNIYYVrCrKyR7mWn2LR3j2JbpKPgPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KtQTj6odrNbQo+tcT34S+sezcdJj2BTCjN3wknjvnntYyUiI90qbsBzeTMVewApK0
	 c8DIsw4Wgzvso6nc6gmt81XPnusTt3oDL3rt0GekLCuVXJJ1SXDVS/feVGxFozA20T
	 4r7wZbL3byPi4iq8xF3BNCVpz2xuHYpr7iUDBMmuOHMyQ4SETwJ7HOo3o8b3bCK/Jq
	 K6rL04LtSK3xSpIuXCu4OukxiKEJDDD0ez3oHVPSK1jBGdTyAmETfiiWNPreyynodX
	 3zV5mV/0E7KDRg0/mZm0M/5njbYkF2BydadedBDcenOEo0YZCX8+lBtKIDKV6cQfId
	 QjY8sLiy1HAAw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c20e70a0962so90215466b.2
        for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 05:51:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoQJDoha6crI63k99vc4t3yK/Pk83fqqeRq+5WLTWwthNezLMB1oNbq0MuI6JUxQQQuhgin@lists.linux.dev
X-Gm-Message-State: AFuF++mDDSv5vdITTxGUhmHWOFEa4GQDPy9v932UqwWq86YZaUie8NAG
	JgOXGEvOsHYbqEnot/qInFegyAYO1C42GSo7/tKeIyG5mRM8IhV51N18nlIn6wr1hAf4Urz3ujV
	+DXZO6Rkiupref5q3/eHDysWYz3TRsNw=
X-Received: by 2002:a17:906:2083:b0:c25:2a78:15ed with SMTP id
 a640c23a62f3a-c252a782276mr972912466b.6.1787835094458; Thu, 27 Aug 2026
 05:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824075935.170457-1-zenghongling@kylinos.cn>
In-Reply-To: <20260824075935.170457-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 27 Aug 2026 21:51:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8ZW7oGWVkgdW04WH828EAM2RwKptUxmobWJ9q2STsCtg@mail.gmail.com>
X-Gm-Features: AcwNN1VXPH_P87koasaLISpCwL-nDqmjfpElMWmTsmzod6L3siUJMK1CCNs9_5E
Message-ID: <CAKYAXd8ZW7oGWVkgdW04WH828EAM2RwKptUxmobWJ9q2STsCtg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix memmove overlap in ntfs_new_attr_flags
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 4:59=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> When the record shrinks while the payload offsets increase (e.g., enablin=
g
> compression reduces padding, making arec_size < old_arec_size, but the he=
ader
> grows by 8 bytes), moving the name first can overwrite the old mapping_pa=
irs
> before they are copied. Move mapping_pairs first in this case.
>
> Since mp_ofs is derived from name_ofs, they always change in the same
> direction. Checking name_ofs alone is sufficient.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
