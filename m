Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2F0443ABB
	for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319460; cv=none; b=qG8oJFoteKo2y6slz7EQqORZqXWQXhyPkAeODpQFhRAzyhOguSHzH4uXlkS/E04Y/hk3Kn69/tuMA5T+KwP4cUIglBPOe8SFRsAoddIktDTdnKcwLZVIJaCHxfIuwCQe5inDlauT/bEOFBMkOnWFtDau93xJm6LrcxFrH9ML6q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319460; c=relaxed/simple;
	bh=kWRx1kjwda1G9qRD+SMtrEHCa0olFo5FTP5TU7XIMH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sf05upxELR4oOXZ2BvXHmrhsJzqgdy8Ebv1Zsz5/0duBSPJze40J3BvIwUMiS/XYa1RgSsAswXHOsNpdYVinYojPqX/WXqZyIxQOstCoUV3xUSy0m2LMLUJ+QTFljU/VIb1FABqZbheAjySUrC2C8k7LWaccLHqPTYwEPc7EgzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjTBfP72; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjTBfP72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018D41F00A3A
	for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 10:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319459;
	bh=74pNv2RB77Qgy5pIO5wReNRWrettkXOdwYTLwdjlJY4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KjTBfP720PkPRhHoZdf0yQ3LIpVL7EccnKHE5p5QH1fTn3VPLzLRNiJt6fr0hTaoB
	 7gEBEgm9eRcROMXmYeDUqbbcXCpm+Ut/+kK6xnVa4U28nGES8/8F7+FuynVZ6Tk3hY
	 Uwa+7B4p3cgGQ+hRIb1Jr4v7Enl/9kR0Bj4eCe35qPLHieSacpYB+N7aZ4EOUM/II2
	 jjtZG++XQxdBnQ5oiqxRpEqL8PIy60aOnK8DTvE0n1OmTyBD6yEULdrEbwigpM5e59
	 DvCLrVGEEdqm0Ca+yf86Y7GMLeEU0SxKCFigdTFFNlhLeHLWJ4QZkjyWSV2+keY/oC
	 J2goWnhr1tzlw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c169ae1cb26so329669866b.1
        for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 03:04:18 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyo9v8g/jiW1KrK5jGtGiau1DGcDRwfAHfe0En03OFSY0jA6Dwv
	D587hGTdZCIwzdYQV1pYB9FI/CCoOzCTn256r8l6ki4DFkm/ElIA8wwQ+7Jcii61R8zpwgOarME
	oJeoHGtFXWcZmO40Yr3A29UN4fCMVyR0=
X-Received: by 2002:a17:907:5cb:b0:c16:acff:51a8 with SMTP id
 a640c23a62f3a-c1f8cdf4114mr105017266b.17.1785319457667; Wed, 29 Jul 2026
 03:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729-topic-attr-list-lock-v6-v3-0-7f690b9b98ad@gmail.com> <20260729-topic-attr-list-lock-v6-v3-1-7f690b9b98ad@gmail.com>
In-Reply-To: <20260729-topic-attr-list-lock-v6-v3-1-7f690b9b98ad@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 29 Jul 2026 19:04:05 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8AY6N6+DMPvyqoaDfDnOFmMGmWDMTtvnybxwxRZbQSwQ@mail.gmail.com>
X-Gm-Features: AUfX_mzd687pQ7-OEsJ1EC4UmEXJZKdrr4n4kMauIEY6pIsKi8a6ubvFb0dxitg
Message-ID: <CAKYAXd8AY6N6+DMPvyqoaDfDnOFmMGmWDMTtvnybxwxRZbQSwQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ntfs: replace raw ctx->al_entry with restartable
 attr-list locators
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, Cen Zhang <zzzccc427@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> @@ -1129,6 +1220,7 @@ static int ntfs_external_attr_find(const __le32 type,
>         u32 al_name_len;
>         u32 attr_len, mft_free_len;
>         bool is_first_search = false;
> +       bool attr_list_locked = true;
attr_list_locked is initialized to true, but type == AT_END jumps to
not_found before down_read() is called. That path passes uninitialized
al_entry, al_start, and al_end to ntfs_attrlist_capture_insert() and
then calls up_read() on a lock that was never acquired. This can
corrupt the rwsem state or crash the kernel. Initialize the flag to
false, set it only after acquiring the lock, and avoid capturing a
locator on the early AT_END path.
