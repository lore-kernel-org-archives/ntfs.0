Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DF53BD22F
	for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743677; cv=none; b=njsXqqacpCqLyfcyP0CukDBk0QqzpHqZO7h1n0eogpjjGwhrTA81hP0+z9aXn0pHfhiKjxyf/TaWa/aOQcyapNrpT3a2d1RPHdN/WK261P0uwetIlGq63itXOQmO1BEHWcbrXhY9sLIcN0ZU3wPr4kOaNnu4Sgad0z0jm5spWxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743677; c=relaxed/simple;
	bh=iAdd4cfkEE+Pbzcl0qLAmPiqsP+3aqjIEvCUSQ9G8WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZEbj8YpBoftNcmBQg2Aprk6GgD1e4Dj6gxbzBKK50UNppJjNEiA6LG89II0YYnu258CPyxI1uAcN2LJiCetQwO1LWlBQZvzFU718GB7ozCHmtMzXlhfMcxxHu/cVdCSzmNSCknQy3Nhg09KeV9QebIzdFPXGehKx7R9MWOGl0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCjnBmoz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCjnBmoz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394141F00A3A
	for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787743676;
	bh=iAdd4cfkEE+Pbzcl0qLAmPiqsP+3aqjIEvCUSQ9G8WM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SCjnBmozJQLkE8CKGZSJkvl2dPOqRt6UbWzJnUok80Cio3LCQ/CqAUu1A9QeQXLr3
	 lpyuUM/ImLjm6nNHuekbff43SlYT8ghFQZjuhxCMvGjsWWQWCYAccprE8tyr2MAmgC
	 je1NJMGV5FThb9Kfd7DFErQJ+6T6idGFpNM8BYzWo89UwUX/4G7ABk6xjmrNj1NxKo
	 hItEaMKjsfkTxKKom7ECbhcq6Xfno6HvEH8kxkMPgzp4MQOf9jb2Pg2hyeSHn3lZnB
	 QVI2DljsYVg2o4GHibHc3HPfXUK8WU4JSGthoQAOIEmh9JEKFMiZ3u/YbA5VGGpsA2
	 DODOQO0SLTPpA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2531f453eeso3002366b.3
        for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 04:27:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr0rPFYL8B4q1Q/c97kInfPwi17qNHH9/hQEIqE0gq2kIAzUrpolg92AHworbWGJhKsR1vC@lists.linux.dev
X-Gm-Message-State: AFuF++mY+1QJy2fZFjY4tExaubaRfcC3bVL7Un+VvUN8qICwVTnUfjNe
	u8zbBpBfD8DJbsLmMFTPo6vekMx1FY11/dfnY9qXKE5CEFPnudLbRPn37Fvk3ooZgPnXuiQKdmy
	Izq21ZrSx3wtam09Nqb1O3J8a0CF6o4M=
X-Received: by 2002:a17:907:1907:b0:c20:23f8:99a5 with SMTP id
 a640c23a62f3a-c250c2e9dd9mr763153166b.15.1787743674855; Wed, 26 Aug 2026
 04:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a8bd1dc.009b1f07.b9616.7896@mx.google.com>
In-Reply-To: <6a8bd1dc.009b1f07.b9616.7896@mx.google.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 26 Aug 2026 20:27:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9ZPE-5OjXKwtxu71h83+s2dEM-s0twZwun_arPxhMXWg@mail.gmail.com>
X-Gm-Features: AcwNN1U0P1WndpSpYkp_vaN2DZSXBkDeCm2M9tQYJoT3tkhULQWjrFDNynLxhGo
Message-ID: <CAKYAXd9ZPE-5OjXKwtxu71h83+s2dEM-s0twZwun_arPxhMXWg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: do not mark the volume clean in sync_fs when errors
 were recorded
To: Dennis Tighe <dennis.tighe@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 2:08=E2=80=AFPM Dennis Tighe <dennis.tighe@gmail.co=
m> wrote:
>
> ntfs_put_super() and the remount-read-only path both clear the dirty bit
> only when NVolErrors(vol) is false. ntfs_sync_fs() clears it
> unconditionally, so any sync() on a volume that recorded an error marks
> that volume clean. A volume without this set is then seen as not needing
> recovery and it does not run one, so whatever went wrong is never repaire=
d.
>
> This change skips resetting the dirty bit when there are volume errors.
>
> Reproduced on a volume whose $MFTMirr does not match $MFT, which sets the
> error flag while leaving the mount read-write: after a write and a sync,
> the on-disk volume flags read 0x0000 with this driver and 0x0001 with the
> guard in place.
>
> Fixes: 6251f0b0de7d ("ntfs: update super block operations")
> Assisted-by: claude:claude-opus-5
> Signed-off-by: Dennis Tighe <dennis.tighe@gmail.com>
Applied it to #ntfs-next.
Thanks!
