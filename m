Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918EF1C2324
	for <ntfs@lists.linux.dev>; Tue, 25 Aug 2026 04:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632317; cv=pass; b=kYaeHziY9wkQwUqHyOMaPQ4tGeZ9CoouXVQI49NIl+J5mP0mYQMH0zp8CpngmZ61Y5nNWuKtO5F0yjbEdbFvaDHrAGWeItpiAr4X9bLP0QCU8K4zoa8Ndss8dE/oG5sEr6JsqPZu1oECyS2vr8FcDbYljBUvdTXNKIreMl7s29s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632317; c=relaxed/simple;
	bh=ZqiaxaysdKkMMfO+M9own/uhBOTcxXSxclyvpSj3MOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeQIWeg9UpyzPmZ0PSPtw+dpA80N8GwsYXCT8R4UU69DEvHrLsdfjEsMumr/zuwrzLlIY/jzs9wp8S/f1ge1VRbfE/61Ld96g6u7EdsyQ8iLcSFhwz+XxkQUk9AU+91loCj4hg83ep/3v2FAfY7NUyy1eb1oPqopOdlUnCr+FsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0f5oWKQ; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0f5oWKQ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so962866e87.1
        for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 21:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787632312; cv=none;
        d=google.com; s=arc-20260327;
        b=K5XdmihgShTBZevdxNeUQOTUKWnHwsS7tP5HCLAw4CrKNqqtxv1zOr+L8iQQCbvsJG
         U7GSIL2BM03+O9V+LUaDqha4Ol966BHqWPbvw73Ja9nEkmBP69ScGArGZS6Z1804RG0T
         b8yhzcgpQVCmyji/Epqs7mHpU/tFQsvO9poR4A+HFhEjh5ewvxrjMEnY5Q4xyoDwL6BU
         VIC7fNL1kfVhPBsnoawm95MOcBhM3fnDBDBlP/Cc74GyE6L43yKP1Dceh/Jx4wkFNTpc
         iZbSblm/mYxt3wiBr4GgmFWP3bTze/bMmppv9Tlqz8bCSO2EvBICpHyTALddq9lho40Q
         Ag0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W5huFb56PKOMi/JZwAfziKIDCOpdZyY4LzJVTrWLc+4=;
        fh=aC5/6mmb0yzlTNz2kBKSyHPAhmv3i6N2CaLgY4Dd1CU=;
        b=GBDV0q+QCAl+xVcCEKW1FnNd8SCELSYqRJNsv1EHLuLbIglrEoFMezKIDF8g+9iamd
         1+UNlsIHPLxgDxJMYsFMLRKxK+Dmm91PdpIJEEsmaP2ehn3hSavkphoQHG3EcMp+FwUt
         sJIIZ8iBNqrcEBNy3xSUBJas3WkiFbSFkOZfv5p5Q9d++SBys4h/BF4Xg7cYSi/ZYp0C
         LbN2lev7HpuactPt5poXlUSo5S6i52KPfBQz/SgUt81PbZVIcRKJAk8TCBh1ykHQPYNr
         j9bLil24DCJlzjrxGhI1hHzpzXWvX7jIYJN1BTVMvL6O7pHIBZS+sRocf9CCM2+ZDGAG
         gpCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787632312; x=1788237112; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5huFb56PKOMi/JZwAfziKIDCOpdZyY4LzJVTrWLc+4=;
        b=E0f5oWKQcieS2LfjlnZB4/zUP2AtdDH59MJjW369K78b/qrxiCiBRfbp5tepn1efmj
         Srjt+bNrOZfLYih/gq6RVMFo+uKmuvyDXdAg4syfqfpSlw1AtE+ekVz2KnJGLRVTvdvL
         9BCACyXRtKd5MjCCdWRiIhVvfvKvvEtAVdrzvhlfWcQfi9MqtUeVddld/BY2DsJ6tlNo
         yEn1cUoJ1XVe8lpI9k//TtmR15hX5u/Iq43h7ibjG/Q+lWZNmkSZbcitV0P1dT05z0cs
         vxyWVWmDriWWuB0vBFunmzLAbl61U0TSf6I0DYmhrma5UDwvUAS5IfO4qm0kBAnmVvKi
         Hrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632312; x=1788237112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5huFb56PKOMi/JZwAfziKIDCOpdZyY4LzJVTrWLc+4=;
        b=Jn6iQBIZXgnNLZ+8wUxs3C5nmq7PKV9Q2AObqEM3sx6dLSqrMlxjtNfi023AZmllQm
         p50FrZDmnfcInuM9xWDDeQ3JtDdS9xY1EOgnTwcfM7Hg6er84mtpYz1pp09fBEtL9jKq
         o8cX7c3bAdSZS3WTjHaHCGGZQGez4MNPSSVVqr4CGcVXrnrMpiE3R5iQENvyw6Qa9xmy
         XYYCwelZaUpzXUAEOcKNCK/HtAxZ2O5Ed9omAMay4kPL7KiZ5ndflJxIKMTa6vGxqBfE
         mz0ofhVwMMKQxGRyRkAC5bLyj7c9KZuymMUV4WcZApTL6X2mJDlLdA+82HcccvS1Qk8s
         TvHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpx2leznyBDi/UnH6SYlCEHPkAtA0ewEkp+R/cxsEdxlD1Eux+NbJvodHyutoHJ1lhVfrcz@lists.linux.dev
X-Gm-Message-State: AFuF++mVQA4EYAah3UWK3lLTJJ79+/Hzd0mfcJo0Ux3uh+4jnpTwJZYX
	PzszNV5VpgmUOzgaPyfY6NJu4ZU2VAfRR719AtON0LnMOv83MmZrIGIIsTYDpT1ZAddHBCD+kUH
	O9YPwLdX69W1EAoBVBtowDNL+Xj9ySMg=
X-Gm-Gg: AR+sD10nu2E+pgB6jOJWXEXmDRpu26pkDN/pGsglgJYMHVtXxfUZqP+Xs1Bq7NSF28V
	Ra0S0pdyumXqLsYpVBsVxf0+hprKuRDvBYn/hoKiEi0FASSQDZ75i8UeJTRLbNbkWpjj4Fzfxcf
	HNqalL45cbrTQTI33P1RHQPOW6WDieEvxO6Cv947tlQaZcyAxkh/Q6h9WfRVdkJSFbXq4twTH31
	MQA2dL3jP1wiNymXkMlo5UUzcae3cTOMO0850/AvmHWTUXRJLNgKeDVVNbdimanhULivqyHhdFE
	F21qq4z8GLvLcg1g9PaZHsm4TOQERUpssNX//UGKNrqo
X-Received: by 2002:a05:6512:114e:b0:5ae:b887:bb33 with SMTP id
 2adb3069b0e04-5b48b67cb14mr6556997e87.1.1787632312375; Mon, 24 Aug 2026
 21:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a8bd1dc.009b1f07.b9616.7896@mx.google.com>
In-Reply-To: <6a8bd1dc.009b1f07.b9616.7896@mx.google.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 25 Aug 2026 13:31:40 +0900
X-Gm-Features: AcwNN1WoR-38rf-zsxLXj76eg64JWT1c5omnCBLSksFnFfHgCXsLek6BddT-U7s
Message-ID: <CANFS6bZ_TYx+CdP7CdQ3U+v1KtbNkVzMGqxuE4KfbbO=KCQ_cQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs: do not mark the volume clean in sync_fs when errors
 were recorded
To: Dennis Tighe <dennis.tighe@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 24=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 2:08, D=
ennis Tighe <dennis.tighe@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
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

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/super.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 30481e5d5dd4..a4dc64fb89ed 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -1862,7 +1862,8 @@ static int ntfs_sync_fs(struct super_block *sb, int=
 wait)
>                 return 0;
>
>         /* If there are some dirty buffers in the bdev inode */
> -       if (ntfs_clear_volume_flags(vol, VOLUME_IS_DIRTY)) {
> +       if (!NVolErrors(vol) &&
> +           ntfs_clear_volume_flags(vol, VOLUME_IS_DIRTY)) {
>                 ntfs_warning(sb, "Failed to clear dirty bit in volume inf=
ormation flags.  Run chkdsk.");
>                 err =3D -EIO;
>         }
> --
> 2.43.0
>


--=20
Thanks,
Hyunchul
