Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962C412C1A
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601799; cv=none; b=iAfwlN2P0Hya8YODLKnEU84idmFHz0eQqDuDMd+eMqR5TrZvKcCKTmWHVFVDW4Vb0N0VeRX1rKlxDAjxjKDj4rE9pjj0DYpQZISZtv3GNqMZ2fdpfT9aWY85oTxdOt4Ve0g8R7I7svIyVqr1xvN1VtxSdHfNLikwN+KuYrVDOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601799; c=relaxed/simple;
	bh=eVj8ORwmxtekHIAh2ALM+g9yz7Rm8/MSXdXu1SFVIp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J91hkFhRYVp0ZZkNrxf2BO+3grSpzVBFpzrfXoyspfjojddbTorYL+PhyuONYFLwY3ulbwe6fiPi1YqCsGJZAod6dVCYkfVv7nDNyEfufm3lkmkqJOJod4CFZDeuuN6NCV31r/icRm8bZvms4+1yQfn1vqsZaB/myfY3HeaR0no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6AXpQ8P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6AXpQ8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3FF1F00898
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 23:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789601797;
	bh=pDMXW8NyXxtXIW1Y8PXVMMAciTDM5NZC4vTRP6frH2Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P6AXpQ8P2hgwsDtpbtBnfQj5rvnhuiVSAZceKQGpxcdMfgOYWoN2q5HgM5vN/4hO0
	 CO6ItjVF/edERs4WaIpGkgV/n5foZbKZFn+hnMX2Oqu2UxvUrlNVLCn2jNlnYZev+2
	 Fo+TJ4SzQ63A4578nx2PDhOzsZDM7WZrkLQk+hl2CXPe2JqYhSFrQdudJtOBXKBknB
	 ugRksKuQDG4qFSoYFqO+Fx3vx0sMLF1QVpYILggg9mHTkWc9d6BV5xlh53dkyFWFaW
	 G7GSMzl8lro1PmRw6AI2lFehz6qdZ48wrlAAlan35Dg2F15KYn8MwvITuwkbLS1ZSM
	 5393Y/35w/uiQ==
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso435204a12.3
        for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 16:36:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxA3aR2/PSBZo5fxD5ypqOU0Dq0MUtHEeEBc/zh9slLLr3Tsmw8I1v6hcyg3CYvs8qi0+tG@lists.linux.dev
X-Gm-Message-State: AFuF++nx3aCy7H9WmBl77sVYntPZ+uEKFGri+qVbosEBValXzcFFcPnt
	/LfKxZ80jr28FI+C1nePIHIYm/8a4Ck0Oh5BWEKjZEsIeL4uD6yYIg/XKdwMogqZHFTpfJbRkQT
	Po7sPiRYGkVbw3UJANP6Tehvhr35QFw0=
X-Received: by 2002:a05:6402:5005:b0:6a9:9522:f87f with SMTP id
 4fb4d7f45d1cf-6aa22453cdemr3386473a12.41.1789601796458; Wed, 16 Sep 2026
 16:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915083252.812126-1-zenghongling@kylinos.cn>
In-Reply-To: <20260915083252.812126-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 17 Sep 2026 08:36:23 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Lg2LK_p0qm6LMuYnv=21ZkxQjqho74JtCGx70+8cB1w@mail.gmail.com>
X-Gm-Features: AcwNN1X60fAR3sgYSMQnKdZlC-8mxDIY9BcYWQgUxFowyCCgF28oRxSWjGY5sOU
Message-ID: <CAKYAXd9Lg2LK_p0qm6LMuYnv=21ZkxQjqho74JtCGx70+8cB1w@mail.gmail.com>
Subject: Re: [PATCH v13 0/7] ntfs: fix volume flag races and persist the
 recorded error state
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 5:33=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> Hi all,
>
> The fs/ntfs runtime metadata-corruption paths only record the in-memory
> NVolErrors() flag, and the dirty-bit persistence used to race with
> ntfs_sync_fs(): a volume could end up with a clean on-disk dirty flag
> despite modification or recorded corruption, so chkdsk would not run on
> the next mount.  This series fixes that.
>
>    1/6 makes the volume flag read-modify-write atomic under the
>       $Volume mrec_lock;
>    2/6 marks the volume dirty unconditionally on metadata changes,
>       dropping the racy caller-side checks in file.c and namei.c;
>    3/6 derives the on-disk dirty bit from the recorded error state at
>       the persistence points (sync_fs, remount-ro, put_super) and never
>       writes a hibernated volume;
>    4/6 persists the dirty state after the final put_super() commits so
>       late errors cannot unmount clean;
>    5/6 stops ntfs_sync_fs() from clearing VOLUME_IS_DIRTY: the clearing
>       moves to the quiescent transitions, a recorded error state is
>       still persisted at sync time, and sync now reports writeback and
>       flush errors instead of discarding them;
>    6/6 checks the dirty-state commit on remount and unmount.
>    7/7 ntfs: fail remount on sync errors and keep the dirty bit on
>       SB_FORCE
>
> Changes in this revision, from the review:
>
>   - 5/6: with the clearing gone from the sync path, a recorded error
>     state is persisted without ever clearing the bit, and
>     sync_blockdev() and blkdev_issue_flush() are both called with the
>     first error returned.
>
>   - The IOCB_NOWAIT behavior and the per-operation $Volume mrec_lock
>     acquisition are outside the scope of this series.  The series keeps
>     the unconditional ntfs_set_volume_flags() call to preserve the
>     ordering that marks the volume dirty before the metadata
>     modification; a RWF_NOWAIT write still blocks in the marking when
>     the volume looks clean, as it already did on the base.  The
>     non-blocking and contended-lock handling (mutex_trylock, GFP_NOWAIT)
>     will be addressed in a separate follow-up patch.
>
> Hongling Zeng (4):
>   ntfs: fix volume flag update races
>   ntfs: set the volume dirty bit unconditionally on metadata changes
>   ntfs: sync the volume dirty bit with the recorded error state
>   ntfs: persist the dirty state after the final put_super() commits
Applied them to #ntfs-next.
Thanks!
