Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66076372B50
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 00:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519357; cv=pass; b=TjvvPRqIRFrC2Aguj1SsN5rNWvpPxzZdmgGW0k/XYF3r4a60Cjxw8GkGDN+gaVtaw9r06rGSueHBgcpeaKf3eFGng/z9e5ATPf2XoVCyoj9sBir9EtlPZ53ZO5Xo/Gc0x3Fh6z36OhciMxV5IPVhukY04T+dJagGJPUp8JFeaMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519357; c=relaxed/simple;
	bh=PbG364MPVENhjhJYeI43ydcf+vQglhNA+/tpam14g5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLhJfw+704PI0VeKpAjZn8xUNmu82ytXfYq2K4LlnXMCIdOmEjU9EHKVnErOTHt6BsoBR/3wPROp7x1atYYhT2ROSdOYmd3oVokomyjBdmeSeUUMnTzP96mMMF6oquqIb0Kh28AF+0BwJ6ueIOe3CR5akWIQz1yUzD3iQ5m0OdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAcb80fn; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAcb80fn"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a49a40209dso9322691fa.0
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 17:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789519344; cv=none;
        d=google.com; s=arc-20260327;
        b=IE2e5qQYWRREQapLu2mL90uC87oHQNXhmMTB0kw1NsngayBLaHdNaZHaFaZIoolP1H
         naSquuzVNMuOp9YBTyDmJU14QH8nxtfaMtqoehhyr3xgwz+qkwBmR3mWj1QbrwplZJAr
         fPtvrMAAXEwceA5DERY0pFfr2gaks6NwBFS9Eic0uv7azuCygmwqKVyYIdXZW2I7Q/nF
         9xavwQUX4DLrVRTzwhudRsG7gqCRpYsAkH8tMyosCMPVVoDpaDT+C97rkws60A2E6lis
         ePV3RPvGbV/IE5hv0XD1y6y1fyU0qD6d52767mxuMP7emOACwpWWo6Yd4uyeQ+KhA9XQ
         zd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cqDbGCTIpau7yhm3u68hmiwG3pOJLS1rBW2yPgr/yNE=;
        fh=PM2Ak4Vz4H50WPziM7hyIHmvfcKxUyOih0rtoKrG8yc=;
        b=lW04hsdPhG4TzkY5gztim6cPZsN/Cc9RUTBO90UMFkvtX98OZhvJRVQ/9Afz5SRIiZ
         kiRYHH1EuiIVuQ8x4wakf7v05CGbGCTdvQMSiERgKSHkfurIz45EzHbBZ0qUomAVxyky
         hAzF/BIZnch8/+Spl8JvxSL5TruTeAtErA+dZPrY+0yl8TCo0fQyKBmkcCEIXtyu/HNA
         QlcRfIBays/MYP8dbLLANMtMcYm1MTNqH5+Dhh/vq4FDEoJwb0YAnwwPd42WSEwEGg1M
         6ZlB7mYH9aVykUXKYsWiTvaild9Nz6faBd1zhnC3l9v1zzsa98hX/9IR/u5eBA3qKSxs
         PiGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789519344; x=1790124144; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cqDbGCTIpau7yhm3u68hmiwG3pOJLS1rBW2yPgr/yNE=;
        b=nAcb80fnA9fod2xhv7B9F2nkE3e76kSmxOn5geHmlBmVQWmlU55TsdPgOXts5BP+sP
         5Rw9E1oyR3C8rWGkSBs4re6wAtGHD6lSRQV0PRnkI4UxMwwQWJE1vtzxcCJ10gghxN+N
         fambCXpy5/eMWJC6fhinrymgi4wESNqDk73X4xqavXXqYQx6eflHVRl/xQoqPEcxtyRB
         cR/pTVJmVpXFTISuVXyjmJuxJu0Q6ucbpz8asYdC5gMc+/j32dXZQzBV91yYtzjnOVVT
         Gr5VARw0CoOPg0NHQbQszCIyqjrEij5L36mh3hswbKhdWvbHw9GKnxD6HeI59SJNzsJh
         hiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519344; x=1790124144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqDbGCTIpau7yhm3u68hmiwG3pOJLS1rBW2yPgr/yNE=;
        b=qExcAyfCsYc1HMGjONkl4o2n8M7eUhG8taNV4ZPmjNUhWUBJUt7suurdRuZdficLDu
         Ffo2PjaRKp9wqwC9Al/DOz21RALFp+cCHdS2CIgXmfpf7bJBMwfIQODZEs7PMjr8C1Wq
         sWfRdosAGtqndC28qwBTZYxUEhBXSxXq+v5yHcWEZXDB2fqm+lFNKQdorn2h8GGFqilX
         7KJoiMMkIdFq8JVQ5AF4KleG2jNgdhS8ywGBFHnFegK3ejXQpVydFglMDnpXIvSGGafl
         tPnYslgdjK4yArafIfx+N5k4/u16qqFMKaiLA7RepVv+3/PY8w247gcZSJrBEMORd6QN
         cbvA==
X-Forwarded-Encrypted: i=1; AKwUvBwpnV0rt1sz7eIs5AjFNS1w4A0+mdY5tbf1XUtRyGb2dRgAp1tdlbCO0q5HdmzGE4SIi+PV@lists.linux.dev
X-Gm-Message-State: AFuF++m+6sNedMGuUqzHLdLYQuQwyyvWpAhzjCPx+9Ob/pG7S2e/qeqs
	DnhfM9ANNW1fsOKXGDFmREum1wihvlrVqmbcEgypeR30L1VcH0BVicj7mq72gz8e/DL2Jy7aBc2
	YLMRvULTy0i5AGN/yt80vLJZpsp0Qv+Q=
X-Gm-Gg: AYBFou1eLlmbQS4kpMIHAXMz+Te1ZTuBgfQDiQ59w6YVWxWVzv8merMxDQFUahL5Q1u
	Qo1Op+cvYFk7aH1+0o1zmy99nzMLSLr0i7Tg1Aj9yYGOJoLj+vlEuTPWq8+TepCelbaxQ4jAKrU
	V+n6XJkTTaeVR4cdxtilhfqPhdCNDBJc4amxqSjjHDBux0eFfl0wnG5ekgWybAbvYOb17NNZGls
	Y/jmZBIUm/ifTtIhTwnVpA3wYXeYg//eRv2eXjxzgxwwfO3TXwn3cJm2Vsm4UnFMNYrQpnibh/t
	rAMAiWn5TwZwoLybDKH/LEN15P2rWzgiKJbTed76jWeWNmE50Pd09tU=
X-Received: by 2002:a05:6512:3a95:b0:5b5:e8d6:8870 with SMTP id
 2adb3069b0e04-5b8b2a4e2c0mr1448356e87.1.1789519343344; Tue, 15 Sep 2026
 17:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915083252.812126-1-zenghongling@kylinos.cn>
In-Reply-To: <20260915083252.812126-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Wed, 16 Sep 2026 09:42:10 +0900
X-Gm-Features: AcwNN1WK_IUeViOVCbm_pYd3k-reY-hb0BsKmeEqIXZ3EebRYR8Fe7soTkcW8yM
Message-ID: <CANFS6bZAR-=acwiqtM8iWGzCHaTTKquKMdqbDfS6ebFGxa6Uag@mail.gmail.com>
Subject: Re: [PATCH v13 0/7] ntfs: fix volume flag races and persist the
 recorded error state
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch set looks good to me.

For whole series:

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

2026=EB=85=84 9=EC=9B=94 15=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 5:33, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
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
>
>  fs/ntfs/file.c   |  20 ++---
>  fs/ntfs/namei.c  |  24 ++----
>  fs/ntfs/ntfs.h   |   1 -
>  fs/ntfs/super.c  | 191 ++++++++++++++++++++++++++++++++++++-----------
>  fs/ntfs/volume.h |   4 +
>  5 files changed, 171 insertions(+), 69 deletions(-)
>
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
