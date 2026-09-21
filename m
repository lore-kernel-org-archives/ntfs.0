Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D649B5A4
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000382; cv=none; b=ksbZpGja6A+WKCFwdudJK7pG5f8lQSpbls4jA2JSfMEwj4rNndfA7XW1yeieA8N2k1RyzDFccL7wMXrBGhAjbMCxacrYxWoNTU2lu7lvYOfhJdj74ystjqTB1JBFLurD4zDZkoaI4w6Z9TsHYGXXGvPFsML8n1jW1s/CTnbhYgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000382; c=relaxed/simple;
	bh=aI6NTacOMrLKPfcVM3Xlyn7ShrQjcKJIHAhhMay+Fbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7GiZvZXk5f9n2WPyB5Fahe0pgU8hJ5waLjVxsestHSLENFL1cnVQUwnPICjIDECXkqqNqqZmgMglk5z3guOEP9dqpn8d/q3oHnNabotnPzltJWoz2R7jSZ9RfvS7pOE+8+UUx8FHm5wXyoitjaUObEd/eQ96VML+2OuR3rh04g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OP6+Svoe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OP6+Svoe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B24A1F00898
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 14:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790000380;
	bh=aI6NTacOMrLKPfcVM3Xlyn7ShrQjcKJIHAhhMay+Fbg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OP6+Svoeoxq32Thj3FeLpXJVMvvjLN2gGuIR12m5F4OFTxulhGF5Zey7C3EP/zm2y
	 we84OJTJT40OzxsdFkWmk4L1639jk85rqZCt8P8ABCB/TQsTBADJGNFFdRxVDPFgt9
	 yAF18NzODrqjC4S+aKGPqasWoIYw6ZEgnDcDMx3GVOhpRKKgskhFv0dMmoOco2m/H/
	 mPXssP5LB7P9vw8+eQb5eonq8U1c802f+HKDpsKBsksR9wfN/BJxOkG+mAfJMIm3Sf
	 zh7j2DupfNS3ArJ2dgRyQiOPr2ow4mHFKgFUDYXudekE+L0orV5EomS0IlgBdSak3x
	 9ZHHtgAsD1LOg==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a803458ba0so3991765a12.0
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 07:19:40 -0700 (PDT)
X-Gm-Message-State: AFuF++mfSTawiVE0kWk2Cl0okrVtx4QNrlrG+S0hQf38TZKHk73nUqOO
	CQlUzJLaH27uQFHyU61PplyKSq26Ii3058r9At4hy3nTpZh/C46R7OunWwBl6uYO4LuyjZv8LFk
	SvVNT8TBhD2ajmu8BP0iyMHltp0dV6js=
X-Received: by 2002:a05:6402:a0c4:b0:6aa:4865:55df with SMTP id
 4fb4d7f45d1cf-6aa5637bc93mr7728002a12.26.1790000378992; Mon, 21 Sep 2026
 07:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-fix-c8k-index-v2-1-7c7c5d0b78ac@gmail.com>
In-Reply-To: <20260918-fix-c8k-index-v2-1-7c7c5d0b78ac@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 21 Sep 2026 23:19:25 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8qYhB24FnBYn4OWbPdRm+iCqxo3GsGYoYQT5QNjguVxA@mail.gmail.com>
X-Gm-Features: AcwNN1XU05Aej4CswaAdqY72tUNs-Jojaq6lj5400djDHPQpPFbLv5o3_fehFtM
Message-ID: <CAKYAXd8qYhB24FnBYn4OWbPdRm+iCqxo3GsGYoYQT5QNjguVxA@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: fix incorrect VCN units for index blocks in
 large clusters
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 9:19=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> NTFS stores VCNs for index blocks smaller than their cluster in fixed
> 512-byte units, independent of logical sector size. Use correct block
> units when initializing and traversing these indexes so directory indexes
> are located correctly.
>
> Verified on a Windows-created 4Kn/32KB-cluster NTFS volume that when the
> index block is smaller than the cluster, the VCN unit is 512 bytes.
>
> Fixes: 27d5cd2d940b ("ntfs: fix directory lookup on large-page systems")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks.
