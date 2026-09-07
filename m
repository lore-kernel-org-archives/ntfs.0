Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14F744238C
	for <ntfs@lists.linux.dev>; Mon,  7 Sep 2026 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771282; cv=pass; b=TgOGFGJe+R5hLmi/0rh4JAV+PNGH3j15SiIU6kdpXiR5EPPfCau9V83w4fe/1WbYEOcYOGSl9IhQTnndFsX4WsWncA+8xnFeymIZ6x8xME4PEaD0yIc6w9QE5wfTeXIOWwGtk56rnunRRzdAudezkqHg2Xo2QytTTJhGnLDDpc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771282; c=relaxed/simple;
	bh=QXjMseea1+MUk12KuF/7jXKNO6pgSq+LEwZGSetRuqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSRcr94dTKbM2V+kW9L4C9X2xW52FgQNuGEq4UXhdp2uk9jsaDb9yvnAUTaRikHMyh5937+ecnOIUAzfZlJlYDZmXNIutvXt4pxDxrUD4xblXalFIHxc6axg1X9SSl5xIKqEo8Ai/OTeGXnGubeQFbg4TeUq5EtLsgxm1ddDXdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHYCJ4IA; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHYCJ4IA"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5e18f0439so2954263e87.2
        for <ntfs@lists.linux.dev>; Mon, 07 Sep 2026 01:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788771279; cv=none;
        d=google.com; s=arc-20260327;
        b=lcibtc4OSq25UoNHYY/lCunzOtPfP5dbvoXbZF5CcwIq6wFO1kTiux+iwYQIdY7xIZ
         BhemDez1eeL/pGimPi+g+uPAGBMs1QvXeN8ppO20HHb6dm299Fm019v0nJGA7/lnNSYh
         r56fCW9umj/N+MVRF/eR8EZp8u8Tz883v35KVYmNueOCZCNcRvK0uPnBrqlAwC6E9IV6
         UkaoPkDOVnZOjuY7ajocgNs3dTo62hTwMpAbU1wOHd9WszLpNfEeaJF2oC5YlDFOuZjR
         HJDp6Dkc71MBTM4Y+zPFDzNunfbOXy5Q5A/ARrBU3wkJg0zBvJybzJUiuAEz5EpROWg2
         Qd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mb38/XyezgCTk/KQzy3RRuSB7soXICP+oM6KFosVqh8=;
        fh=w44sfZC871xfQhiNeTOAkocu6t9uBjH9ZDBj+fZ1Jjc=;
        b=QzI0jnAFA/9TZu+xryk39NAgGZlB9s1GVkAs2x8mqctG27v5LAA2+Qlend/53fY289
         nQ87pms+O6QfFBff8ofeAeZ14pWRygiOq++R+kJWjrd4JPPAdl7B7s7pblP2GHs2XRSg
         ZM8sRfXJTn/zhL3ElAi8135fnSo4JUAhRuGcV20Jg14ozDVVt1ROIeNRiw0iygkpF1Ei
         3ZT5OrFniQV0DUNwQgkCXUc+SPEMEkif2fGEGFPBYPrEfO6YIDSLyr+FdED5zIoo6IYq
         kMwq/zQGpjWj1vodNvoFtUlnrIGzutYLTXPRwAQFlIRxeRnFs3z2DWjtS+6wIRy1vU/B
         qNOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788771279; x=1789376079; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mb38/XyezgCTk/KQzy3RRuSB7soXICP+oM6KFosVqh8=;
        b=XHYCJ4IANknOQWc/7AF9MPStTxEN0mvOipK++jukZjmVTszf930VFovaPvGst+0W7f
         +eQIuh7n8txvcLr64UuqXsaHQGI1lBiwpe75VU9hHU4/cPqvsj751Yjs8oBqMRLqpwPW
         ingG+J3iYv1UQ7VFta8x1SFTjsLtbB5Cbs05nYeDfOEjwHqfd4HZ9TZewT0k/KpBw6gg
         fpXewVVRUgJy36Pfj0I55mao6nqNHn4MZa1dBvp3yiQrbFAOzgCLAj8KD1S293bCbStP
         Y3dG9c/9YUXu/e581WdaGogc0D/y51UT5Wdi3mo2vfDXv7hVKGW0+FOAy4uVh7O/aMWl
         D5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771279; x=1789376079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mb38/XyezgCTk/KQzy3RRuSB7soXICP+oM6KFosVqh8=;
        b=AVkzRtXTpWEZKaHE41XiBblYODX5rn0yNzvu4RYU6lgRrlCHZAVA8dhCiWBh9cw0HJ
         G9SXWxOv2HjAXY2EYuJMLdQG1CzWBiztMpbq5PusIo4NhynX1EbP5mwnzUYZT9+HpnV3
         7Hh08eiIUSbBBmRdGp4hyg/qe9rwFj0oluZ3VbidBFJpm97oGDiUvsvAd53kpI0NSfjJ
         s/ClzqNYt59UlTtgYBA1VqAz878wR3VQxI/LmT9exEql3vRYMstxYBLvMuCRhpnY0UNT
         dBQ8AVKPI+8UWBkp9Hj4Y/lSDjgRoQ/L+en+7SpuOGjxdRY7OuTmtGkNwNlyMqikTn7D
         DwPw==
X-Forwarded-Encrypted: i=1; AKwUvBzM4RmeSe53+OlWuyG6S61fHnEynMwV9ogzZhNKqps/Ef2jpkpX/e9R7LswOPlG6ud8Vg/Q@lists.linux.dev
X-Gm-Message-State: AFuF++kiTlk6p9IK2qPpYDgPbxfUrIUDyvaJyWUbxm3sCKnQI1b34h+f
	mHuJtvucagO/nu0apEzx5Om+BCjiwxl+TJX8fp7XMqLZAZdRz88D/WK6jezWsFsu6ihYyxfioyb
	nvosYuMcQxy3eGJmye/2dxVWBQLiF2hk=
X-Gm-Gg: AYBFou0K1wN0ntQQiB26b5m55P29A2D31Cg0PqrgCeO3vvHiBdvnvgFSrAvQ26sTyBb
	nw8zktmwziamNKAgaiacNxMSyiUbzUGo6GTt1njqvqc2nyLIIXB4pHP6mvwej4NXQZsFft3by57
	y03nvxFpEwwZwWtD4lLhu5Klore0Tvn4fdubVFwT+vpk/ktetocK3172K9ADcEGcDhEiBHXoBlx
	2coC6gLziW9Exwcd7yxUnVIQP4OMpmXmFeCxKK/3J17bjMzngmIfSILBo28nLWMRqA8zY/a6kcx
	iKT+vSVdFm4hof3BMoLNu0uWo0CKVHHOyNM3NdWfTmtEQ2XpJ7WAlDE=
X-Received: by 2002:a05:6512:110d:b0:5b6:183b:d208 with SMTP id
 2adb3069b0e04-5b6183bd373mr2958460e87.47.1788771278685; Mon, 07 Sep 2026
 01:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <SY0P300MB031263862D7FD47834F1E87FDEB42@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
In-Reply-To: <SY0P300MB031263862D7FD47834F1E87FDEB42@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 7 Sep 2026 17:54:27 +0900
X-Gm-Features: AcwNN1UQCOdsyH-zzjbRhn94C4SAU2WskgBGWC7pBgQzD2sd-mp-ikPeShGlfhM
Message-ID: <CANFS6baT-+_u+c99qThd7jekqXZ3BW5utLPERLa_X3FE7XiBNw@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix $MFTMirr write offset for MFT record sizes
 larger than PAGE_SIZE
To: =?UTF-8?B?5pyxIOWkqea1qQ==?= <zhutianhao75@hotmail.com>
Cc: "linkinjeon@kernel.org" <linkinjeon@kernel.org>, "ntfs@lists.linux.dev" <ntfs@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tianhao,

2026=EB=85=84 9=EC=9B=94 5=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 9:35, =
=E6=9C=B1 =E5=A4=A9=E6=B5=A9 <zhutianhao75@hotmail.com>=EB=8B=98=EC=9D=B4 =
=EC=9E=91=EC=84=B1:
>
> When commit 115380f9a2f9 ("ntfs: update mft operations") refactored the
> MFT code to use folios, it assumed $MFTMirr is allocated contiguously,
> which is indeed what mkfs arranges.  However, the folio rewrite kept a
> leftover from the old buffer-head/runlist based implementation:
> vol->cluster_size_mask is still applied to the mirror write offset.
> In fact it is no longer needed -- and in some configurations it is
> actively wrong.
>
> For example, on the built-in 4Kn SSD (Apple SSD AP0256J) of a
> MacBookPro14,1 with 4096-byte MFT records, mirror record 3 is still
> written to the location of record 0.  $MFTMirr therefore gets out of
> sync with $MFT and the following warning is printed on remount:
>
>         ntfs: (device nvme0n1p3): check_mft_mirror(): $MFT and $MFTMirr
>               record 0 do not match.  Run chkdsk.
>
> Fix it by always adding the folio offset (folio->index << PAGE_SHIFT)
> to the base LCN address instead of applying the cluster_size_mask
> truncation.  This is the standard file-offset calculation and is
> correct for every combination of cluster size, page size and MFT
> record size, provided $MFTMirr data is contiguous from mftmirr_lcn
> (which mkfs always arranges).
>
> While here, verify that the folio returned by read_mapping_folio() is
> large enough to hold the whole mirror record (folio_ofs +
> mft_record_size <=3D folio_size(folio)), guarding against records that
> straddle a folio boundary when mft_record_size exceeds PAGE_SIZE,
> although this cannot happen in practice.
>
> Tested on the volume above: before the change mirror records 1-3 are
> all written to record 0's sector; after the change the write-back
> probe reports:
>
>         ntfs: NTFSDBG pre mft_no=3D0x3 folio_idx=3D0x3 ofs=3D0x0 mftmirr_=
lcn=3D0x2540c5 clu_bits=3D12 rec_bits=3D12 PAGE_SHIFT=3D12 sect=3D0x12a0640
>         ntfs: NTFSDBG pre mft_no=3D0x0 folio_idx=3D0x0 ofs=3D0x0 mftmirr_=
lcn=3D0x2540c5 clu_bits=3D12 rec_bits=3D12 PAGE_SHIFT=3D12 sect=3D0x12a0628
>
> which matches the expected sectors computed as:
>
>         (NTFS_CLU_TO_B(mftmirr_lcn) + (folio->index << PAGE_SHIFT)) >> SE=
CTOR_SHIFT
>
>         record 0: (0x2540c5 << 12) + 0x0000 =3D 0x2540c5000 >> 9 =3D 0x12=
a0628
>         record 3: (0x2540c5 << 12) + 0x3000 =3D 0x2540c8000 >> 9 =3D 0x12=
a0640
>
> A 13 MB file write succeeds on this volume and the file is byte-for-byte
> identical after a umount/mount cycle.
>
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Assisted-by: UOS-AI
> Assisted-by: CodeBuddy:Hy4 preview
> Signed-off-by: Zhu Tianhao <zhutianhao75@hotmail.com>
> ---
>  fs/ntfs/mft.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 7e58c99f1728..a62b1d41697c 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -462,7 +462,7 @@ int ntfs_sync_mft_mirror(struct ntfs_volume *vol, con=
st u64 mft_no,
>  {
>         u8 *kmirr;
>         struct folio *folio;
> -       unsigned int folio_ofs, lcn_folio_off =3D 0;
> +       unsigned int folio_ofs;
>         int err =3D 0;
>         struct bio *bio;
>
> @@ -482,25 +482,31 @@ int ntfs_sync_mft_mirror(struct ntfs_volume *vol, c=
onst u64 mft_no,
>                 goto err_out;
>         }
>
> +       /* Offset of the mft mirror record inside the folio. */
> +       folio_ofs =3D NTFS_MFT_NR_TO_POFS(vol, mft_no);
> +
> +       /* The mirror record must fit entirely within this folio. */
> +       if (folio_ofs + vol->mft_record_size > folio_size(folio)) {
> +               ntfs_error(vol->sb, "Mft mirror record 0x%llx does not fi=
t in folio.",
> +                          mft_no);
> +               folio_put(folio);
> +               err =3D -EIO;
> +               goto err_out;
> +       }

vol->mft_record_size < PAGE_SIZE is guaranteed by ntfs_fill_super().
Is this check necessary?

Thanks,
Hyunchul
