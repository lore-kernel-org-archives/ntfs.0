Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB9D4FB9DF
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565463; cv=none; b=meJasawHV7Mu0VE8+E0wanKz70qAzlptPbp3ovoWSsrZ011jUVqsXtrEly7MA6P1XvZFGWs8+2IZXGq6oPGcVka22wm5S8uGrC/vaqlcYjz3F3cv3PPNMZ9oyK4gpaZmeTn+EHkJ44fMRdcQIC4s/L4rJBFdblCRg7L8A00GJ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565463; c=relaxed/simple;
	bh=qlEK7tiP30h3OSCMI+KHE1Fw5+eoWN3Xk/2DByBV680=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=joXd6N4DagTspmzJhIGEr85VWvqTVxuYG2t1oFeZ34mHiN9/PjJ0uG0EzFdDMnMFC1z3/Ew6v09Z/Kcw4vMVXS45yeSc+qjmk/a8ngdrTubZvVpNWioPdFuJ23xL6JU+7pXvssx5WEYz4hokJLUFOCdYFUy0JAJPM0u5VWsmejY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBQT7zJS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBQT7zJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0741F000FF
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789565451;
	bh=qlEK7tiP30h3OSCMI+KHE1Fw5+eoWN3Xk/2DByBV680=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dBQT7zJS3hTSuDBdIV+IzPcA9phr7xcZkCqt882z+rsGW15mmbdCsRGZLAdYJLL+f
	 1ZxNq3wBwg8lsX/XaOBNGVRycVUS7d9e/+O09OV0J55I2c801OdvPperWzQsZ2fS0x
	 ZSj6cDDwYC6Y82mbOWH6/nm7mh/CLfAoBC+n32DMIldg+IoTO4xZow5gnpURhTYzTL
	 KkKNIIEE8DbwS/VzQDf2Qv4FWiHOwc7qcIMquyNbdsLMKm9pRD392TaS2Ki+a66V+H
	 NcwFlR/fIApi9pgt89Joj4IiiJcVUTZFDGjLupPSd3tiIrbsh0rHlLFnqVq//EVDr3
	 8/GoEvipoImLA==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so154599766b.2
        for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 06:30:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7QOpHGHwkcCSX+7g1PEQYRfew4gff4wBpcxp2/aZvhWXTgi4QxBvdlUmM8d7RYJSqm+HQ@lists.linux.dev
X-Gm-Message-State: AFuF++mtwJAsh44GuppJ/Bwrw0qcfyICpVcsoOiRSSIOuf5W42OalOrh
	G5UsDlzHZULKElLCd6xFOwqXIl0tdWcheKb9EWzmz1C486LRLDWNh0BifVw1b9SeA7QIhINHWu0
	CN6GNhTQ+4MZu1kXoe6IrdrAR/byHRuc=
X-Received: by 2002:a17:907:948a:b0:c29:d3ad:4f72 with SMTP id
 a640c23a62f3a-c29e5207917mr230325266b.16.1789565450410; Wed, 16 Sep 2026
 06:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260913010236.17541-1-liubaolin12138@163.com>
In-Reply-To: <20260913010236.17541-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 16 Sep 2026 22:30:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8W8eTiBxdv8RE_2x2-BophuNvHZesDodbz-+35+svvtQ@mail.gmail.com>
X-Gm-Features: AcwNN1UxOGYq1cRI5Z2g4F4DlLRY76pTKIm_pBILamh95nsxwXEx13iwr8_6m2M
Message-ID: <CAKYAXd8W8eTiBxdv8RE_2x2-BophuNvHZesDodbz-+35+svvtQ@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: fix lookup of POSIX names with Windows-invalid characters
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 10:02=E2=80=AFAM Baolin Liu <liubaolin12138@163.com=
> wrote:
>
> From: Hyunchul Lee <hyc.lee@gmail.com>
>
> POSIX FILE_NAME entries may contain characters such as '?' that are
> invalid in the Windows namespace. Directory index lookup currently
> passes an invalid-character error value to ntfs_collate_names(),
> causing lookup and removal of such names to fail with -EINVAL.
>
> Allow callers to disable invalid-character errors when collation is
> used for index traversal, and suppress those errors when comparing
> POSIX FILE_NAME attributes.
>
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> Tested-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
