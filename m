Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283907;
	b=bNoEPpkxX5tWuoXbEpcGlGg87IgAx8B5KebJE/lO10LgU11HamIQmGMWarh3LT4ZyoNP
	 rDKU0ICKLOI6/umuUOGip8sJkjkb1EyIaceWOfKAGfHaqvYY2NbVPT9JJ8ZHCOmBc9Swn
	 P1PED8epBtuRut98uSgF8fzOkFIWuwKrNQaEIYpHRe3/OSoqS5kWxbzTVS1xC7jj8WqtS
	 z8eOrVHRoJBRVygZxhKqXAm8hcK+TGyuf/PGt8tily0SNirsKmUiJ1zpKDdh9EkTP0Eqi
	 ifTWUL3klN0kzkgteAaSnl2EtcdS7k92Dwjl9NpISzcozLh8mN5+hg4E/9xFZlZnlfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283907;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fnCpADeK1lk1lBxoGBlYSY9jVj2WJp26T/E2RN7jnTc=;
	b=mQcFXHEZZaEvFPr4UuC1qZaMrpxRGR0FjPuHJ69/0To8bvDNEJ63AlctCvJvQzAEdYWy
	 ct1uQQ0t2ACqGbD0VFimnkMd+so/DegK0wez5qP0M4qzdF95MzkcUVBArRORaNr1E2qgu
	 89FnDIhsFbTkh17xvRTb+HwMpyG4YRKvd8+GDhAc9A9VhjZR+nZI2AHAND4beuoHN3/2y
	 J7ZeZCU0GjpypBZ7lw9oEP5LXIYpREgEEh0YTPEorVmUeYz56E71+LkmkViGbBLox0sSg
	 9DsvfyuGYnDMiqRMk7MsUByyoG1eZDJqQqqx7n71xpoBNXW+7aJpI/yrP50I4U1jrEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aweuyr1/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C2A606AA1A
	for <ntfs@lists.linux.dev>; Tue, 10 Nov 2026 04:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aweuyr1/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043211F008A2
	for <ntfs@lists.linux.dev>; Tue, 10 Nov 2026 04:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794283907;
	bh=fnCpADeK1lk1lBxoGBlYSY9jVj2WJp26T/E2RN7jnTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aweuyr1/Ey7I1+R/3iu0ztxDYfNP7L4YOwTxN/m219Cb1oxF2ckvoWNPtQtkRDcY/
	 mrZxj+32x8UxRQN3lqKiPrA8TeU7pmH/VQlB8EDk53cXiD+bHoER6P/pZllgq3g5mI
	 268WCvN0+k4C7ujI/2Ugo4xvBVybzQrHO/Hgt4IAXOBdJjdC3CaSzn/7spncaUtTYy
	 1Nvn/zprxJf0t4paRXTqglrWL/Opb4bWZ/F0CZzzxXtjfVvM2FIWEUJg55e7OtO4XY
	 mKbORghCgSMIQ+gIF1DcdoIx3ps6HzP8GPhook5SfhWPMXCU5DCWjvkhBRy8WRZvM5
	 daqqs+eQPHnTw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c434376dbebso298876866b.1
        for <ntfs@lists.linux.dev>; Mon, 09 Nov 2026 20:11:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHSP5TC9PVrAwK0mnOSOaisQK7LwyHFcw+clOywILW/pjQvyT0QqXHfzw5k80UMlKz1GqGh@lists.linux.dev
X-Gm-Message-State: APuU4Z/5FVzvEf+Ecy2YDJpTNCDEUUNorMiy+gTJhwc7Z2brYIZ0+fSz
	tIte/XFKly1vhczFHHcNh3SVFYBtvOXa8RvAKYUF1wAFG4aK98a2x1fgDbKPKxvL2oL9dLhxLiP
	WWwucDLeZ3QSh/JwxyKnfF8hCFwWuOhA=
X-Received: by 2002:a17:906:ecb1:b0:c36:777f:824c with SMTP id
 a640c23a62f3a-c5047a43a58mr82746966b.4.1794283905613; Mon, 09 Nov 2026
 20:11:45 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102073532.98873-1-wangxuewen_ky@163.com> <20261102073532.98873-12-wangxuewen_ky@163.com>
 <avEwnT6CAgeCj2oo@hyunchul-PC02> <5f5302d9-729b-4008-b19e-f7012232e755@163.com>
In-Reply-To: <5f5302d9-729b-4008-b19e-f7012232e755@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 10 Nov 2026 13:11:33 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_qho6vncFoY=x4XVriXn8b-F7hgg=xbTTfJXH8nns5yQ@mail.gmail.com>
X-Gm-Features: AclHuK9JXmlrUEUNTyVtnytSEkXCL2PZWvSIdS3ugTb2tMwfmxgyUdzEYDT8kzk
Message-ID: <CAKYAXd_qho6vncFoY=x4XVriXn8b-F7hgg=xbTTfJXH8nns5yQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/31] ntfs: handle source record removal failure
 during attribute moves
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xuewen Wang <wangxuewen@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 12:13=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com=
> wrote:
>
>
>
> =E5=9C=A8 2026/11/9 10:31, Hyunchul Lee =E5=86=99=E9=81=93:
> > On Mon, Nov 02, 2026 at 03:35:12PM +0800, Xuewen Wang wrote:
> >> From: Xuewen Wang <wangxuewen@kylinos.cn>
> >>
> >> ntfs_attr_record_move_to() ignores failure to remove the source attrib=
ute
> >> after copying it. It can update the attribute-list reference and repor=
t
> >> success with both copies present.
> >>
> >> Check removal before changing the list entry. On failure, attempt to
> >> remove the destination copy, mark its record dirty and unmap it, leavi=
ng
> >> the list pointing to the source. Report destination cleanup failure
> >> separately.
> >>
> >> Shrinking a record to zero needs no extra space, so failure indicates
> >> inconsistent record accounting. Return and report EFSCORRUPTED even if
> >> cleanup also fails.
> >>
> >> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> >
> > This patch has the Fixes tag, but it calls
> > ntfs_report_file_metadata_error(), which is introduced in patch 3.
> > If this patch is backported to a stable tree with patch 3, it could fai=
l
> > to build.
> >
> Hi Hyunchul,
>
> Thank you for your review. You are right about the dependency.
>
> Would it make sense to reorganize the series so that the bug-fix patches
> come first and use the existing error-handling mechanisms, without
> depending on the new reporting helpers?
Yes. So I would like to apply error handling patches first and check
new report helpers later.
>
> I would then add calls to the new helpers at those sites in a separate
> patch at the end of the series.
Okay.
>
> Would this approach work for you?
Yes, Please do that.
Thanks.
