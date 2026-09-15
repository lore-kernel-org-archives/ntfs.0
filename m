Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85BC43F4D4
	for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 05:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451303; cv=pass; b=McCukh0ZNk7ZcATthWAqImHJpU1OO8wOtVaSliCLWMPoWuU99ZQyMse2u/Pe0wPknYLaHEJ5YiQxRIWuAfJuCbiLGXAOp6o7FdJDYTZoQ968cTfTI2GXr4zORyJQj5/NcI6eCBm09Ye9VSqOwTmgYa16vy8VUanQKXOQbb9r3nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451303; c=relaxed/simple;
	bh=+P5PG32j/Of8TX5DMyOrie2c8vQ4azM+ufsi5mmU/uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7srDq9G0XhHpUijFvUxu4JSGLx6HNEG+gJpofiBjnyMbhKxGwYA2AcPk1rZYuiV7tzE1fGTLehJm9VSjw3aVNVQx1uUUk4SGItHUd/7pVjNcn7mFq6Z2RvVha66o5WpgeARkbAvmIGvzw0izy5JOo7XDSuF40hsWyJ0ng1D4C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV0Wce2X; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV0Wce2X"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso568660e87.1
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 22:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789451298; cv=none;
        d=google.com; s=arc-20260327;
        b=Z1InBGFMmrxQ7BNZRNTWQ0lIX1V55TdJLdBIrwVcU+Hx4yo8M0aiaN8vuvpTFqOF6M
         7W3QE7CGPzYEQwVbnDYqa0VVvywBmUhJSZJQQ4t/pBJr9XuWwzxrBqY++T6fjRG++VGC
         m5+4gXIZx2l3B9UZ0NAUqR07zYoW6C4ZR0FzDmcWYmuSqk1lGe2RNdLhyWwi+3dJmbHo
         a7tBPbaFVS6oiuahm8TOdEmCrVBoKpdrpPuP9xW3GHIhh+eFoqh0HX/D5S2FCHTW2dVL
         +kZMuCtiE+6hKVrpvCPZLubq2AXn6+gOpLGVMVhfwVhwJ6CvKh07w8uLWaVocAxoZL69
         z4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AR6GwgJ16RrWX9JH4eaeCDVCKlN9ZYf1vr6arYzModk=;
        fh=DpsZD+q5jfpT4R0nYC2LKRudOhvGIP6YGtTNexe06kc=;
        b=PShyNNk9/AOkUf6zr1SRohLpZV46/w4JwY5zmDbdz+RqE4nBocAQxBUhIVtoCMKuQB
         tqAWpoJmtZy5ruFIFdFdimGdbg8Yt6/tbZQjx2zKfJpxDK9C0yo5+bsAeLMPzoMKsMU3
         15MPE9IFVq/QIXHX46au5ssAqQ/2IA6B6wDQmUpTm7NsfugLBNSLA3LH02ngIwaNv2z5
         a28cdYuHXt/Ln2Gv98xEuzoCuzDvbI8vXTSHFXasrTl+n6JqFsQ78a/hVWhlLWMF7QM3
         l2qPs18J0jLYfLP4W8TdJdlDHe0O+b7RmYRVQlk1AqGlpu7bn9+NDKmQQDFFvy2yMxNc
         Uvzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789451298; x=1790056098; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AR6GwgJ16RrWX9JH4eaeCDVCKlN9ZYf1vr6arYzModk=;
        b=MV0Wce2XnNI30cBZ0qkj1lQ0FYqtYfJYM7tD0cTpCqAv3yshg7KoDQFzXSUHsuU2PD
         7C6LKnRudX61J5VEVeRJaAI7Ob+34A0Yxm1GeCUIrGros54RCGp+4TeHEE53+W2NspLP
         Yod1lvD4mt8rdAmKRj6wRdwnqI+UIShrDIuW5cANsm9Sro9FrK/rq6d1xMMJlG+FIQxv
         goa9miE04oOkh+aut2LRbqeByNYoohW4wjWXQN1Si/knbI5zwRZjOLyWYSpHoJsGs6oO
         itCKb20178d0dNWJqSGObmYorMqG8n/YN+sGZYDFYBXgs0emxW6Eu0M8GHX9hE8puID4
         kmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789451298; x=1790056098;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR6GwgJ16RrWX9JH4eaeCDVCKlN9ZYf1vr6arYzModk=;
        b=fbl00ze8JlDG4Qbzz6bxxzdba7bcRQbIxXxTVaK628pa2TwjHA+THfN1QduzDzMTQL
         zGQGcZ9tx3zrc22jo/vcrqT5QH2szq3KyLE4HKC9lkRl4uujYd+OSTEOBZuiqgXrNsyH
         z2MDnLwBz6UTDFBbPlQAz6sqxPoQOH3N8PvsyT3Tjdr1eHIzQHukaYVbOSquasWOxIrO
         VdJd0nbbxgCL5GgkpquxbXgvqjwKMjvkyWg9+sxYpdF5RlL44nEonYu4aoh+C0RB5uuf
         WvryawRP5JYSxEcC2RZCzaEiUIlmPGkMK6C4r7B+gHAFrYw673iAsCWroY8Gg1gUMiD1
         vHRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfkHg/MuodVFIMlv3Fj2RbxPQQMK/8HNyB7zf/DwrQkGaIT2iZY2sujU9Mp0dKdmraCuua@lists.linux.dev
X-Gm-Message-State: AFuF++lMBOs2ty2SEG6SN3cNnlsjG4RKB+N9Wx8E7R1XiV/M01ginmjV
	1ooXH2z8mIGJ47MzjzAWRbTlcA1ZokIDy3IUb9UTykIMyEVmr3fiGgfJyMh/qf/jwMRAwsGunxU
	UDONHnLdMlRL8MaSyU5bjz6MQ1HEaUbg=
X-Gm-Gg: AYBFou1RrvwvewJKqZXS5Ns4V8PABKLUpcl2hYjw+onpnvYie19Bm7XB94xfX4Q2s/F
	Phbrr+mCR8zr7pRxZnkxunPQv+EOy6EJGKthJ80d3ZcpUlS8nr3Ob2mmvCWSApxKoUhGO35YCa5
	rGQWxGkHuI+Q3eUXpdGBSlRwaiut89Y405w56RghzA0tX5BpkQalkelCp9haA7jerksLwEumHjA
	0wLJyztMjoIXXZhwE2AiTvE/05cSOgiqFduERG2OyNYGBWm7MiK9yD08XjfWvA7SdBeNjtIqn+T
	UEcifXE7DZmGaDqQmwnKVD6a8KdNpu0510x6p/dJRU8EJmor0gR1Z8pBqGxKE6nMaKpUMCBUZZH
	Hc8Q2cuKDynaS
X-Received: by 2002:a05:6512:2343:b0:5b6:199d:c1c6 with SMTP id
 2adb3069b0e04-5b8b2ab7ac5mr522710e87.37.1789451298220; Mon, 14 Sep 2026
 22:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914054926.78808-1-zenghongling@kylinos.cn>
In-Reply-To: <20260914054926.78808-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 15 Sep 2026 14:48:05 +0900
X-Gm-Features: AcwNN1VcPq2i5E7Xg8O4s4W6KObdRjVNIhTfdG84OREbQW1Cb8as5dB4qcgIcec
Message-ID: <CANFS6bZi+Nsrieh1M1sxwc7SPyjy8xx9KJcfUQdctsUrYrQedQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] ntfs: fix volume flag races and persist the
 recorded error state
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hongling,

Thank you, and this patch set looks good to me.

As a follow up, it would be useful to discuss making volume dirty
when an RW mount is established and clearing it only after a clean
unmount.

The current implementation still has a window where metadata
changes may be written while the on-disk volume flag is still
clean, and also does not clear the dirty volume for sync(2).

2026=EB=85=84 9=EC=9B=94 14=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 2:49, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> The fs/ntfs runtime metadata-corruption paths only record the in-memory
> NVolErrors() flag, and the caller-side dirty-bit marking races with
> ntfs_sync_fs(): a volume can end up with a clean on-disk dirty flag
> despite modification or recorded corruption, so chkdsk never runs on
> the next mount.  Based on ntfs/ntfs-next (9a05b5715cfa).
>
>  1/4 makes the volume flag read-modify-write atomic under the
>     $Volume mrec_lock;
>  2/4 marks the volume dirty unconditionally on metadata changes,
>     dropping the racy caller-side checks in file.c and namei.c;
>  3/4 derives the on-disk dirty bit from the recorded error state at
>     the persistence points (sync_fs, remount-ro, put_super) and never
>     writes a hibernated volume;
>  4/4 persists the dirty state after the final put_super() commits so
>     late errors cannot unmount clean.
>
> Changes in v11:
>
> - Add 5/6: Stop clearing VOLUME_IS_DIRTY during sync. The bit is now
>   cleared only on remount to read-only or clean unmount, preventing a
>   crash during metadata updates from bypassing chkdsk. Verified in QEMU.
>
> - Add 6/6: Check commit and flush errors during remount and unmount.
>   Re-check NInoDirty() after __ntfs_write_inode(). A failed remount is
>   rejected so unmount can retry; unmount failures are reported as warning=
s.
>
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
