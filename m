Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F80736655C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 04:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532797; cv=pass; b=MXyrFrhE6rR0HxSwp6bvIvndQPfNzN/Blgg4RHR0tHl9yqJ3eXNe7kxYTPsIw33NG1/sJ8VT03vgcVovuAnQaZTLDC05rEH//1GnO7x7JXLMgkeRv4xZbUG18kLZjm7FxaosQ/O4HmzmmWBwQ1BauBmqvQuYalXjqJA8rVbK8Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532797; c=relaxed/simple;
	bh=UVI8SQw8H8lpwzwvHSn2aSHHtifudhRHQuGM9tHVuAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfDh+6z7ZHMs5db9TljKiLspbfGkvm1j/MeR6/yLosSef3LwaE1kD+7h8jtv3cXqvKR4yyURrPtgAoY6toMZkaS/M1aQEuVJNKjeIf274rYkU9vdxFIKQAx+JnZl9A/hbyKvNZOLRLESWF3z1Xa0AKLxMUbGnEsuKdLBTrOHWjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=reNCSJJF; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="reNCSJJF"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so564912e87.0
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 21:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789532793; cv=none;
        d=google.com; s=arc-20260327;
        b=mT7jNDUhhiKqPTn9qtAAQnTRPm199xRlSLCUpwshnR0tzrQOlB1IBmuA20OAC4EsXC
         DzdsyCTPhF4rNAHN/Ax55Uze8xVa2oCcR2UKrVwPK+xhUGxmiUMtrBi7X7zkS3f5B2ca
         CkBVyC4mHME4BrfllUgfKhu4gg0nbVblaO9x77jVip62jssHsOyPYMZvztfRz2pZCTHn
         pJ9tISlpDFOteMp9FeIm+N9OM/HTAsL9n466m/6rCBXxHF1POU7No+wjVJ1OzDkfLYKU
         IE7hgHtagxHL/bTRZjB3bWmQRkO1c+j72XE7BDwM6JAhF99vwq4MsPkubV+No3xS3xCI
         l48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UVI8SQw8H8lpwzwvHSn2aSHHtifudhRHQuGM9tHVuAY=;
        fh=6r1sShtj23S5sqbNmJWOrq7X+ouwGUtqNfeqAHLWrvw=;
        b=Oens2IqCnYlnoXvdH95GRLJQ2YBwnKdK/3eVQELmyJFbxJe8jIn3JgpfUZRwosoFuq
         mzBj6R7ArJb1EHUwf/m8HiY9/Vvh7aORn4oQIvFnmAKO1FZaufxCdQbwRY/t13+n63WT
         d/FSYUtZdWV3bfXNUO6AUDN007SvRIvHCUx1h8Z5P34uIX/Zw7jnyqdAqqUlU1pkMx92
         KCI4C9yfkmJSLt2mdhMTB/B27f5K3vjWfSANSU5+JS+Hv7+cODUgqSrxWlg8PZsCFcnX
         hqb1FQg4n/cL4pWbwE8aFDA8U+VPpLKg62lY6dxv2LXsw8nP4NeojCrFHBk66RkVBFDt
         n2QQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532793; x=1790137593; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UVI8SQw8H8lpwzwvHSn2aSHHtifudhRHQuGM9tHVuAY=;
        b=reNCSJJF35e1GrrjpsJnP+ChJMLRz5Vig1NeZDLjfJOfgwM1DfdYPvjhUkqvPgizFM
         zVcw8DfPpnOEeBXjr0jjtnvlnLtmfLlw7iIiusDPjGOPI08Iy7Nw1Hr2I9Me+XPATy+0
         mcBY5ZVo080DPdz4+XaAXVusIiFZh9V9A3gNYDiLig/t0/Cez/3onBFa3ZSeCzq3CXGY
         nMal8/ol/OHflg+b89pPQLO0Dt3POIrsn1NC7nB6WVYyrOw6Jwu7TOXbhDD+Nce42M5a
         gxZVRWJFvZrAihtenETd0EUIf8K04XsPprPxSH9T2jAI5CZ7GsBQPeXcbSlbKa155982
         x4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532793; x=1790137593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVI8SQw8H8lpwzwvHSn2aSHHtifudhRHQuGM9tHVuAY=;
        b=enekSbMEfnlzAZTF49jz/50njOYOd7IQa7cerMfEh1vnCRWJgPs+XcO26uRPtNDrzx
         kNyc612NfqKdtETkmHTFSqv/1fNNGrS28dERU/Li56uVP04LO+fY80kwB8LXNYRqO5BA
         Vjs76rtoUD3huC2j2qb7ASC1kBTxRvrbqQAbDeQM/ylwrg0C92VzsfNnwN5TBTxrdabU
         2t567mtuawOt5j1AjG+z0jrVHvzpEukPMy11XLEOiZiaYfO8ULgKYRXZX1K2SjdEAZAs
         nUvCzjLZ8+m8fyCUBOYhfYWAkOQjMYmQpmNwOx2wOUWrtisADx6Kh7Ksopu7P2yXefwD
         1u0A==
X-Gm-Message-State: AFuF++kKOuBI8XEptIpkPkFuxq447ex/Ib3sKDOAhwm2LlSx3gQ+UvmO
	QmHySYk/cOqpIjaH9ki0qsBWrvKWalwcdieB7tWkU6G4pyg9jWTvcWbcCB/kI3oj1Wo1UsfdYwX
	Aq8lIrqhz3HvEMEXA7hR/fwVbMwfW3LA=
X-Gm-Gg: AYBFou3gju3U4LPxoOA3V3Tp02ElLApKTSaX0AUgOGlCOSBT+b+Nmg+YQ2G2qtyhEtZ
	MN1etuqxYdzMcStUuxmbPXyw6KbNC+M6CwzDhnxbRsZ4YZw6DaPoo0NvT/Bbcm3IdKgzIh14M68
	zqOpD1YwKGP2gih7TSaakR2XHGbkAzTBWw6VuSXXGME8Bi6zT8QinLLFDLC5+sV50RrDaH/mBX1
	C1CCXZOm5talkwSIhkqKbdcXYRG3bm/GgAJnnQtI/6HNMuiXi+yBKH6mIJV9R8ua7/L6IC7xqTp
	M/D8vNppgfrTBO6nUPqnro352GrgxF1Zhay6C8+C2uYVLAL5bN2KVf3yhO/jYINWuA==
X-Received: by 2002:a05:6512:3e0e:b0:5b6:1a7c:aa0f with SMTP id
 2adb3069b0e04-5b8b663df55mr237589e87.39.1789532793060; Tue, 15 Sep 2026
 21:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <81955f5b-ee97-4856-bb77-bffc739a8f5d@163.com> <20260915074722.27533-1-marek@wesolowski.eu.org>
In-Reply-To: <20260915074722.27533-1-marek@wesolowski.eu.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Wed, 16 Sep 2026 13:26:20 +0900
X-Gm-Features: AcwNN1WVi3CyLsN6FFwZstMGQgc-Bt5VugJsqf9Kn62UKwoCkhV-G90UsNOvbUg
Message-ID: <CANFS6bb3G_ONh0Sw+vQeTf2XEiUwL0fE0p1K+K02Zu0Xp1a9oA@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: fix directory lookup on large-page systems
To: =?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>
Cc: ntfs@lists.linux.dev, Baolin Liu <liubaolin12138@163.com>, 
	Namjae Jeon <linkinjeon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 15=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 4:47, M=
arek Weso=C5=82owski <marek@wesolowski.eu.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>
> ntfs_lookup_inode_by_name() copies PAGE_SIZE bytes from the index
> allocation mapping and applies MST fixups to that entire buffer before
> selecting the requested INDX block.
>
> When PAGE_SIZE is larger than the NTFS index block size, the USA count
> belongs to the smaller INDX block. post_read_mst_fixup() therefore treats
> the PAGE_SIZE call as not applicable and leaves the update sequence words
> in place. A directory entry crossing a sector boundary can then be return=
ed
> by readdir but missed by lookup.
>
> Select the INDX block first, apply the fixup using its actual block size,
> and propagate fixup failures before validating the block. Report fixup
> failures through ntfs_error() so the configured errors=3D policy is appli=
ed.
>
> Return -EIO when post_read_mst_fixup() detects an incomplete multi sector
> transfer, since this indicates an on-disk metadata integrity error.
>
> Reproduced on arm64 with 16 KiB pages and 4 KiB NTFS index blocks. The
> affected entry was visible in readdir but stat returned ENOENT. Both exac=
t
> and case-insensitive lookup succeed after this change.
>
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Marek Weso=C5=82owski <marek@wesolowski.eu.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

--
Thanks,
Hyunchul
