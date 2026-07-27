Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8205F2BEC45
	for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 01:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785116705; cv=pass; b=ORCDru39yKsN37plp5EvZhI9KAv1du/zBRflzY3ZKoh8K/Nwb1DGN/i438g54trtZ21pBx+mBKVhBCZfZKsarbHfbxXbjhm+NsQOGWuf3UoGGnQ9apF69+Txoh0l9vfnRkLMYaFvwxHIP3nREt2kFj5x13bxbIaHEMctLZoyTF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785116705; c=relaxed/simple;
	bh=GpPVqK0yedI7MogcuOKKw0y9EmEKpyxWE9J7owI0ioU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLA0/Dn2xd6OWuU4tESykILP2aJDNgCiBdM+CLnXPJqSkfzjx74qfaSSckx/7TwxXdbrk2gdsjEN/uiU4Rm0EoRn+yeJUhcNIzvfkwcLhMaFm4ddeKhLSfFrYGHmNpXWInGx5TvjEWuGfwuXp+CS6cV15GvSW5ac5Yo98BKdfCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlBkPdue; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlBkPdue"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b013084dc2so1567134e87.0
        for <ntfs@lists.linux.dev>; Sun, 26 Jul 2026 18:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785116701; cv=none;
        d=google.com; s=arc-20260327;
        b=OeqN3qbHPWymP6vbrbWnVEM+t2CzP84s3I07EMGKoBEFNDNVijnTWOSGsALJlcUtG4
         x0eCPu/y0lDMQOE/Yej8vxmh/ZPUWHm/bt3+p3uGLAbYOTzxqU2b97Z+PXmv/OpkxmXm
         Xn6QNcirVJT3GApsZfxnlhDXS2fHY6acLmQADpKVfV91NoauPHgCRQyOwP3F+LhW1Z8H
         wS/akmZP7oqnx5NCNHOGYU0+NP833MNvXZyqTnVuTJF3A53BIx28J3NCEEnkwU+kl3KM
         /jpDQhT4jlbRux6ESyMFw24Go3kNYKQbWnwTXiE75UGmu31VbqJkgqGahqHuUT1pi4+C
         SiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kP+3DJgbSuTQTP0Qr8L5IJefZbj+1ZijbjemjjV/pQs=;
        fh=b394puWBZZgW/bBhKhe6GpdOOXciOX3IEfmRW618GdA=;
        b=PAWQONXv995pYfSisVvRMz6kVDmbAQeGKEbUNxjeQUUaYXK6wnHoaKCKlyRyHtgbtX
         YUZUR0fObmelPisbweO8LLlKBTjMTqQrBEf/3U+JBRY1Wmm9G7b9JSiBnh0sMAUdwJJL
         /kUDnfHUQkcDJe0UcugaH3NSFGletlXNZ9urQd91WtT080JRddV6z7sx6U1u3yxyS9mM
         TNs9i1IE8oR2bcTQ5L5MR/0HGUAi5sY0d06VfYucE/G2U2TTu6RqGDu6BSx6FZ4/Jt05
         r1Xs9Q8sXukPsHXS+9PTKiNJNH/DvX79lUPsKJOD/pzUqaQFFWMqZDYPisx/5BDyLG/4
         yhvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785116701; x=1785721501; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kP+3DJgbSuTQTP0Qr8L5IJefZbj+1ZijbjemjjV/pQs=;
        b=MlBkPduezw62YqaZtxnslomeNXIa0zMz5rkJdfk+fTltCQpOMUta901mlknFrzlKoO
         NQx79UbQWrZGNKvQ/91IaeeVP0+MSYTjZDelw3R1hquT2BIbxUvuMyHZr6EY8PeJb9TK
         Myyelp4TTF3Uajt9qaiGnfInGNF5No3eKAEojbrol2hzw666IAL6WTmkMwPCVY4Xh2Xd
         pVKceMHFXHLf6kEYNIx7H1QWp1A4vKMTgdgD3LopptMtb060jT0jdJL2IAk3qFNDtZTv
         Qu24Pq3hcSTmAGDXAlWTckSPulC2X69G7/t7qi5s1jt3OwVOmFMfGSt7Iya/iWgGN9e6
         bk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785116701; x=1785721501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kP+3DJgbSuTQTP0Qr8L5IJefZbj+1ZijbjemjjV/pQs=;
        b=bfmRyLaXwTlBkuwHbEi8a+puN80qW0Nxdr14FMjHmXtyUnmKO0PzQYG6NJDAMi2+7U
         hM2BUCHgrCaOeCyDTutfX5RrYcc0Mg2vlw7CTLebf/V/LLYWkaMCwxFY/CMdn8FEVYlZ
         KHRpekJG8L0Bcp4qbJG+hqfgkzbe+Z637drQvOhIQt+nnU6yZWP5xLH9AQaDamM3rXC0
         dRs/LxP5dDbFaMP3+RG7ZkNefJP8Iq1rPKjteCUJNkSfC11eZECLyPwq0DX8kA/I1tMR
         asVBF5guHZL5+ok/w4DDpJQfUyCySWILWzELis8InqzRNUZ6qqCbu22O6SXRj24ZNOvY
         PpOA==
X-Forwarded-Encrypted: i=1; AHgh+RoygNJyGIbkiY24ccQRHJncbgA5sO9f5+kiYKkCWxjySaoJGAXWExeFyob4WYiYOVuqpPaI@lists.linux.dev
X-Gm-Message-State: AOJu0YxOtjdpPPiu4zG95OK7gEICSjZOxFuq1T6P1bgnhEnjE0v3c62G
	r4oy3nhbPtcB1fG2M8C9B5TJZQA/D19wbD6PC8HdmZkDPykCMIBfABFOZC7CwYsZYFxsgKdeh66
	NZHtJJ6TlP4KTZb4G7131UGwVRlEf5sI=
X-Gm-Gg: AR+sD12NDR+YNNgXcye24gPLQAwyJp08pwCZdXCloMFg5Pd62W9ft5gmco6StN9IBVJ
	6tnLXPUBEzxo3aPsjpCo+0ZvEREaYPLvPqHkPgOBWfkCRUEFbaToUl1i1VKM4+mZkwYFZLm8L4k
	7gfusTc0JFUX64YKMnN0KsxpNctdIcpOPb0Q+d3RKXOUAidw6ANev5kp1wc/N2Q196l0rShLa8c
	wf9VlSEnrg5wibraIoXtGViJMkWjcD+J7EPaMCmr7vCTSffoAiPkGRfp0P4Pg==
X-Received: by 2002:a05:6512:2351:b0:5ae:b969:417d with SMTP id
 2adb3069b0e04-5b2c1abf0ccmr1207806e87.0.1785116700314; Sun, 26 Jul 2026
 18:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726-b4-disp-9cd2a8a2-v1-1-8d66c6dceac4@proton.me>
In-Reply-To: <20260726-b4-disp-9cd2a8a2-v1-1-8d66c6dceac4@proton.me>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 27 Jul 2026 10:44:48 +0900
X-Gm-Features: AUfX_mzBW712rPgRVkvS8eIPzeTBF7pkrZhvHO3OPVMOgiixtgb_q9TmtN_9pAg
Message-ID: <CANFS6bYise8cD8AttfFMnLkmGRzwGxQriOWTavRZo7nCQwiRJA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: bound the free-cluster bitmap scan to the volume
To: hexlabsecurity@proton.me
Cc: Namjae Jeon <linkinjeon@kernel.org>, linux-kernel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 27=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 8:29, B=
ryam Vargas via B4 Relay
<devnull+hexlabsecurity.proton.me@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>
> From: Bryam Vargas <hexlabsecurity@proton.me>
>
> vol->lcn_empty_bits_per_page is sized from vol->nr_clusters at mount, but
> ntfs_cluster_alloc() bounds its scan of that array by the size of $Bitmap=
.
> Those are independent on-disk quantities and the mount-time check only
> rejects a $Bitmap that is too small, so an image whose $Bitmap covers mor=
e
> clusters than the volume has lets the scan index past the array.  A run
> whose LCN lies in that gap takes the allocator straight there, since the
> caller passes the file's own last LCN as its locality hint.  KASAN report=
s
> a slab out-of-bounds read when a file on such a volume is extended.
>
> Clamp the scan to what that array covers, mirroring the max_index
> calculation the mount-time scan already uses, and reject a decoded LCN
> at or beyond nr_clusters in the mapping pairs decoder.  Conforming
> volumes are unaffected.
>
> Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
> Either hunk alone stops the access; they close it at different levels.  T=
he
> clamp bounds the index whatever the caller passes as a hint.  The decoder
> check stops a run pointing outside the volume from being accepted at all,
> which also covers ntfs_cluster_free_from_rl(), where the only test today =
is
> lcn < 0.  Happy to drop either one if you'd rather keep it minimal.
>
> Reproducer.  A volume whose $Bitmap covers more pages than nr_clusters
> requires, with one file's data run placed in the resulting gap:
>
>   truncate -s 13G img && mkntfs -F -f img
>   mount -i -t ntfs -o rw img /mnt && dd if=3D/dev/urandom of=3D/mnt/v.bin=
 \
>       bs=3D4096 count=3D16 && umount /mnt
>
>   # $Boot total_sectors (0x28) -> 1703936*8, i.e. nr_clusters =3D 1703936=
,
>   # just above mftmirr_lcn.  lcn_empty_bits_per_page then covers 52 pages
>   # while $Bitmap still spans 104, leaving indices 52..103 unbacked.
>   # v.bin's single data run (3-byte LCN delta) -> LCN 3000000, index 91.
>
>   mount -i -t ntfs -o rw img /mnt
>   dd if=3D/dev/zero bs=3D4096 count=3D8 >> /mnt/v.bin
>
> mount -i matters: without it the ntfs-3g helper takes the volume and this
> code never runs.
>
> A/B on v7.2-rc1 with KASAN, one arm per boot:
>
>   unpatched, crafted image:
>     BUG: KASAN: slab-out-of-bounds in ntfs_cluster_alloc+0x249e/0x2db0 [n=
tfs]
>     Read of size 4 at addr ffff8881029dad6c by task kworker/u32:6/96
>     Workqueue: writeback wb_workfn (flush-7:0)
>      ntfs_cluster_alloc+0x249e/0x2db0 [ntfs]
>      ntfs_attr_map_cluster+0x444/0xf50 [ntfs]
>      __ntfs_write_iomap_begin+0x8b7/0x22c0 [ntfs]
>      ntfs_writeback_range+0xd3/0x130 [ntfs]
>     Allocated by task 2255:
>      __kvmalloc_node_noprof+0x1cc/0x5d0
>      ntfs_fill_super+0x16c0/0x6fd0 [ntfs]
>     The buggy address is located 156 bytes to the right of
>      allocated 208-byte region [ffff8881029dac00, ffff8881029dacd0)
>
>   52 pages * sizeof(unsigned int) is 208 bytes, and index 91 is offset 36=
4.
>
>   clamp only:    clean; the volume mounts and the append completes
>   decoder only:  clean; the run is refused
>   both:          clean; the append returns EIO and the decoder logs
>                  "LCN >=3D nr_clusters in mapping pairs array"
>   pristine mkntfs volume, unpatched, same operations: clean
>
> The write side takes the same LCN.  A kprobe caught
> __ntfs_bitmap_set_bits_in_run() with start_bit=3D3000000 count=3D16, whic=
h lands
> on the same array through ntfs_set_lcn_empty_bits(); KASAN reports once p=
er
> boot, so only the read above splatted.
> ---
>  fs/ntfs/lcnalloc.c | 7 ++++++-
>  fs/ntfs/runlist.c  | 7 +++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
> index 835a041023a2..aa2e017a4384 100644
> --- a/fs/ntfs/lcnalloc.c
> +++ b/fs/ntfs/lcnalloc.c
> @@ -298,7 +298,12 @@ struct runlist_element *ntfs_cluster_alloc(struct nt=
fs_volume *vol, const s64 st
>         clusters =3D count;
>         rlpos =3D rlsize =3D 0;
>         mapping =3D lcnbmp_vi->i_mapping;
> -       i_size =3D i_size_read(lcnbmp_vi);
> +       /*
> +        * lcn_empty_bits_per_page is sized from nr_clusters, but $Bitmap=
 can
> +        * cover more clusters than that; bound the scan by the array.
> +        */
> +       i_size =3D min_t(s64, i_size_read(lcnbmp_vi),
> +                      ((s64)vol->nr_clusters + 7) >> 3);
>         while (1) {
>                 ntfs_debug("Start of outer while loop: done_zones 0x%x, s=
earch_zone %i, pass %i, zone_start 0x%llx, zone_end 0x%llx, bmp_initial_pos=
 0x%llx, bmp_pos 0x%llx, rlpos %i, rlsize %i.",
>                                 done_zones, search_zone, pass,
> diff --git a/fs/ntfs/runlist.c b/fs/ntfs/runlist.c
> index cbb6576cf725..74f94b4b6c5b 100644
> --- a/fs/ntfs/runlist.c
> +++ b/fs/ntfs/runlist.c
> @@ -880,6 +880,13 @@ struct runlist_element *ntfs_mapping_pairs_decompres=
s(const struct ntfs_volume *
>                                         ntfs_error(vol->sb, "lcn =3D=3D -=
1");
>                         }
>  #endif
> +                       /* Check lcn is within the volume. */
> +                       if (unlikely(lcn >=3D (s64)vol->nr_clusters)) {
> +                               ntfs_error(vol->sb,
> +                                               "LCN >=3D nr_clusters in =
mapping pairs array.");
> +                               goto err_out;
> +                       }
> +
>                         /* Check lcn is not below -1. */
>                         if (unlikely(lcn < -1)) {
>                                 ntfs_error(vol->sb, "Invalid s64 < -1 in =
mapping pairs array.");
>
> ---
> base-commit: 4235cb24ec1e8e96843f3671ba4da2a6ccca2c7b
> change-id: 20260726-b4-disp-9cd2a8a2-007c3a970c87
>
> Best regards,
> --
> Bryam Vargas <hexlabsecurity@proton.me>
>
>


--=20
Thanks,
Hyunchul
