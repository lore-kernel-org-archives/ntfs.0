Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F7372EDD
	for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 23:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790726369; cv=none; b=i2Q84rIdWHP4YW45P7cih/h7gdyQGhtzbmJ6v7D6QRVPbCLZWOzrv13BT5EfIH9I3CA3svV4NE19oeG/5ysK62EDShXTmckgdgbTumX4bbqnEOaVHy7doNnlfbn028oIFdSuR4xs7rJYWo5l8g0U2uc6/bHc64oKRmImFCiuvEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790726369; c=relaxed/simple;
	bh=sGcHGeyzH29fLthRIAddpUBzy6ti1CphBMNn6ujLDsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FuQrluP/uYYOiWSm+wSBMC1gM/R3V0sA++kcaJTGHTGqfeEwrB/YUKKG6pVBHpiPb3tVENmwehd0z46X/u5Ci/oQ5E0k9iis2V83ia+t+MtxDZ+sk6nZnccYl94KyFFn8oe/ASeqIuUZLkT9mBX7dW+9GqdPkuBZrN1C7ZjymXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNlQoCTW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNlQoCTW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD111F00893
	for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 23:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790726368;
	bh=sGcHGeyzH29fLthRIAddpUBzy6ti1CphBMNn6ujLDsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jNlQoCTWN3nDqx6Ekx16ZHbj4ijw74+4F8NXmDuIo1IgOV9wzgBiSLFNDV7rAwos2
	 jZHCmkuug7gFKjq1Ps/QFelJF6KBX9n6aRcTM6u9Zwi/+1G9WYbcrdEXDB9/hXIBfz
	 M9Ur1LQc2BJShmz+H7qmGAuozE6dAHGldWZ4nsd7jGiiO11vB6JoBbCkTbAFfPOAmD
	 PH+VYwy6YT87Lu8jhicFv2/Ne0nZ+fomHV/228QvRdJ6EjItYXVfbh5BRssQBrUfk4
	 3gSaQr2hEFDr49O1QhpJLDMQPzqW42hQlab14d0h2/xkHxkP3PfZR/q042ZgxVXKAk
	 TiFbUgzGq0vXw==
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaeeacce15so7433883a12.1
        for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 16:59:27 -0700 (PDT)
X-Gm-Message-State: AFq9FYK5pIDxP1Z/m2dyjYg+KSM3CDSyww0JfiCAuRRRslOKPOx6hQFY
	zNRp3S1sDPnwHVFPoYeL7Pjcs9zs1kuf9yElsyLKBMytCIyVlGNG4BgTt/Nf92uQPJqIe0KZib1
	M4l9LT7hsQIrd9Kxcre2NLYMaTasmQhY=
X-Received: by 2002:a05:6402:13d1:b0:6ac:c204:b4cd with SMTP id
 4fb4d7f45d1cf-6ad45de80c3mr366129a12.2.1790726366604; Tue, 29 Sep 2026
 16:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260928072513.1776685-1-hyc.lee@gmail.com>
In-Reply-To: <20260928072513.1776685-1-hyc.lee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 30 Sep 2026 08:59:13 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_ynGKAmZMCvnsDY5v-QwUHPGSbN86Di91MS5xbP=rgYw@mail.gmail.com>
X-Gm-Features: AclHuK-LEdoruJvFebzHYZWIoI17sPTQ9aUqPPv73d7c6kc0NoDtcRe4P-xWGBU
Message-ID: <CAKYAXd_ynGKAmZMCvnsDY5v-QwUHPGSbN86Di91MS5xbP=rgYw@mail.gmail.com>
Subject: Re: [PATCH] ntfs: accept standard sparse compression unit
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 4:25=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> Windows native sparse-file inspection shows that a non-resident $DATA
> attribute can be marked sparse and record the standard compression unit
> (4) even when the file is not compressed.
>
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks!
