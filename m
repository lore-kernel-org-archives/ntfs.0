Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E8832AADB
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 01:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311217; cv=none; b=V54kcoCYNpnaJSzsfrAYryZ8kCFtuhP0Yf9peOtKasniofDbwgcZMVluvh8OQma+aLnSifrMMbqvA2Pk8PsPoqUCD/OYeRQaY5f9DP/03VZoBeJPncA3QC39aMiRQ2NvXk9BN6OJmDTj6Wo8gj6ndHUHTrnT0JVfZEd137jGEYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311217; c=relaxed/simple;
	bh=vktDnoMVFzqEI8/NuzDTqrkKE4xBRWOvevvNYuiuevA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAsizfjmPQFSHYPmc9KDWSILUwwFC2ET9jlmL94f5CfIJutXrY3dCJcIE8f6/Fy3u0ZY7HT4Zc5koLYnGS93CSBlPiZAtgrhUCkB3YYFVPVnKKCExuILYldN0z0QtCRjw73Cl2utA4oaZP0cWd0fc1bk3nhWkYupvcJ+op8K9Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cfv8s1nQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cfv8s1nQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5211F00A3A
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 01:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788311215;
	bh=jqxk0sZkbZ9KoV7KU3DYdNlHYVVbXm+ovykDBW729c0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cfv8s1nQmSOHyIjCVh2jJHpah3IOvRXpnGyy0XrKcsqgl+scBQ3ZyPRwttmaclP2I
	 60H/vaZx7ciy1EM2vKa2QWyyNWhqgokORlD2WmGA4dAvrA5yElo40+Xztr8PqsIdNu
	 wHsdwxfYRD4mv74kAqVJY8BKWxUNUkO69WrWg3/exvRWXU3zdJTch3Idox8xjCyYD+
	 hDeSoNwFoyqifOkaHVYfjL4uVy/OegzM8reguVMqzgZ6+AtomF/E74Ip34suu1pOJm
	 e6WjrdANVW85YeHtmAZjblRZ1hMhWMyzIKJzaqULcVvwdWEg4DnEpVm+/nmVhw6a9w
	 SN2s4cBcZCGzw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c253425b253so55565766b.1
        for <ntfs@lists.linux.dev>; Tue, 01 Sep 2026 18:06:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpKaClIXWla1l3hdtY18+2fMrBgaq4VUXkynLIy9lU2Vpksn6CP8KM1/7BKXSYqKPvAMd8G@lists.linux.dev
X-Gm-Message-State: AFuF++nJHcfgfxUJZxd0sEte4YAjrsdAatNnLBkG6KFU2FxM1bl85Uvk
	dmZ5aoNqkeIpBb+WA1Ql42nQgEjLwlnT7B9AZRnLRS49P2gdvv9kHfpn5teJ8vMFPFOyaPs5S6q
	Hxq5k/H3z2xRdNNpTvKMssAKB/uqxPME=
X-Received: by 2002:a17:907:94cd:b0:c25:5d2:acf0 with SMTP id
 a640c23a62f3a-c25d5274bdemr64308366b.8.1788311214539; Tue, 01 Sep 2026
 18:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901024551.528056-1-zenghongling@kylinos.cn>
In-Reply-To: <20260901024551.528056-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 2 Sep 2026 10:06:38 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8dotRFBu18HOZGr6AJn4EfTwj=ZtfwheCTy0H7tbLfFA@mail.gmail.com>
X-Gm-Features: AcwNN1VIQF3MFhyiXi3o0liM2BjTlHAmpqB7BC2cSPaiZbZ7-OBH0vpghrk95IQ
Message-ID: <CAKYAXd8dotRFBu18HOZGr6AJn4EfTwj=ZtfwheCTy0H7tbLfFA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix lost volume flag updates in set/clear helpers
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 11:46=E2=80=AFAM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> ntfs_set_volume_flags() and ntfs_clear_volume_flags() both read
> vol->vol_flags outside any lock to compute the new value before handing
> it to ntfs_write_volume_flags(), which only takes ni->mrec_lock around
> the actual write. The read-modify-write is therefore not atomic, and two
> concurrent callers can lose an update: ntfs_sync_fs() may derive a
> "clean" value from vol->vol_flags while a writer concurrently records an
> error and sets VOLUME_IS_DIRTY; the locked write then silently
> overwrites the freshly-set dirty bit. The on-disk volume looks clean
> despite the recorded errors, so chkdsk will not run on the next mount
> and corrupted metadata can persist.
This patch description explicitly identifies ntfs_sync_fs() as the
problematic caller, but there still remains a racy issue after
applying this patch.

static int ntfs_sync_fs(struct super_block *sb, int wait)
{
...
        if (!NVolErrors(vol) &&
            ntfs_clear_volume_flags(vol, VOLUME_IS_DIRTY)) {
                ntfs_warning(sb, "Failed to clear dirty bit in volume
information flags.  Run chkdsk.");
                err =3D -EIO;
        }

Sync thread                         Writer thread
-----------                                -------------
1. NVolErrors() =3D=3D false
                                             2. Set VOLUME_IS_DIRTY
under mrec_lock
                                             3. NVolSetErrors()
4. ntfs_clear_volume_flags()

The volume can be left marked clean on disk despite the recorded
error... Can you update this patch to fix this issue as well?
