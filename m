Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583D34027B
	for <ntfs@lists.linux.dev>; Thu, 23 Jul 2026 02:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772819; cv=pass; b=lerLW6XPT2r1RDX9tJOGR6ToGoZxI1G8HfLWE4KuqcjZy48Iic4cp+4qPSQyZ4x6p+flZrxcV0+MvJVyGvhXMfX43aoip/WvlavJAxIugu5KCFZpE6Jsk5DHSKJQiw5UlAtVx7kRoeWCPc5gzqE0Zny7g9pgrzSfseqgNMQ387A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772819; c=relaxed/simple;
	bh=PIUJ/zDvhLm8Q5/Pk/Ytd0NBq/sahSG0eRMcZzn+9tU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8RKzza2yY/Q3r/K8ySZcRTScBE3J2vn+w9n/peCydN8FkbdE/piRpv/tp0TBckQG5w5rsU0o8JQh1bAHLE7ehxnrDRBrJ5sxcvlkAZrGe+atyOaWkSrN+yKeBoFRPRy2nRz8VA4aHPiLt3RsJ/WGvD2ZMVwQRCA4PgQfQ8rvcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5oWNfpJ; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5oWNfpJ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b2aab18795so94732e87.2
        for <ntfs@lists.linux.dev>; Wed, 22 Jul 2026 19:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784772816; cv=none;
        d=google.com; s=arc-20260327;
        b=JUHFDl3mbw+sQgckolfFkRwQYcV9R6wyF2CBpYp9E3yd7aN4f+p8WoPqWKIGNaLRe7
         ljg3IQMSpur7DFPt+gmpeZbmFz2Hgldt+j9BmqCAYKmu0YcSegc6s9VpevxqXzMjlRas
         tBcLu7OyeK6u4eJmjp2ZL/WFDHbFGU83UEbYMsHfrSlRKH7PSSDwZ3l4HtJLVOEeb0MM
         QZ0EfnxfouI12YzR1Gs3CT8T31ZszdTgCLfNwLaCgj+1vhtE/mnBrKlUOVKUb6ZkoANU
         qtusksiTqzn8+LTFOWQ+uetT2keSGiWNu2Tj84bKQjBiI86MfNHv0YHisulv+i5NtNz2
         6eRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q+nTVbPrs6qwcSOJu/pKSENRmXbnNJ3PxkWookJ2oDE=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=CZPRzxc9QRjx3V3G6QmE4EKZtLDMU4UeiU30jk3mNSQZRI/uNJ12Tze18bbS2m6Jaa
         bNrSOZjfuuRbRls6LqD7Uy1QDZRVDgAVpaOwBGVAGnUZYWjRarlVywPsFb9VNeZHZNAX
         R/WAD1R6XAH9evtq4vMa1qUuiF2jkQMSFRyN7RX+h2BYO3ACICikbjTD77EV3IbT5Ep0
         TkshAdvnlkun6HV7obmXrF7AkA/lFnoR0xKEC4tndV6Bee32VS4eCDO3KPISG0RfWBsz
         kJ68GH6VpsqK4amZgiyDsYy1srYeRm3J7uAVd+J33KWvMR2Zv4cEmcE7AHuuqm1T1Wib
         6g8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784772816; x=1785377616; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q+nTVbPrs6qwcSOJu/pKSENRmXbnNJ3PxkWookJ2oDE=;
        b=A5oWNfpJtElbhC0LDNHY9myCgHKxHslWCSvS34DPuRCUo3cbFQIKYWI0Qr0sAN3NpU
         TfT1GqCnCl3BPv8nJkMLcDIIuuHzttoTfPF3OvZNITPRtCpPhOPREPmyNYUMGZSCN9mR
         kqiExDkEhSuGy5fqLJ5fquSNyVMzylCQmMmiyOTNyiufdADb1VGxGdJYsHR+n5EMK3aa
         blNthcm7dSi7RvcC9FLh/YM70lXAGoOda5KLWbP1KGbIFFbTW/k/4Z4rFxCXN5/ywAnQ
         CNHz/+hewjUgVIA1khOyXToRZOuCHILW9IdTTSLNdxTE2dyhlt+JpIlaQtAKvIIjn67Z
         hgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784772816; x=1785377616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+nTVbPrs6qwcSOJu/pKSENRmXbnNJ3PxkWookJ2oDE=;
        b=LP52ffPUvHzJBFdkw2uo0CfGFRB9VZzyry5Lk2QlP64gMP0m+KLGPlEyjSTRlJenfX
         pa4HetVB/7CSFQEIadIxv1JGGuJkgj+Ov6gYr/vHXq41Fu9RqwYHnh5E5NR9hlNy4HKz
         O5tIGlUcjxo/hatvLHD9psKS9RPqm4JsPN0NscGwz64Xz58+5+7esaYEnbHXX9b6ectX
         BkVe2s/i+ELkOOCP6NESCDGAMPaJhm4ZEFY7PXUYiOIzlaKZkVjeB5sByJDRHNfAC1J8
         1dzy2qOK2Qqxe6R3K5OAyQBUqPRV2d0vMTegCZl4eMfGq1qJt8J7Burtv9ik9B2CH4ZI
         dUaA==
X-Gm-Message-State: AOJu0Yw8OonnRHLyEBsFTBR9RvY3AsKaHkB/wyZwy9TDo6bgiIQKIE7L
	cZa+KIagopIHAuNnKj7M5nRP+QaDj9Z7upNfKclfuljyYFehwq5a4Qykj6o3hm0P/zOlxRL6iOr
	VYy4aYRDaUZYrpTrUsLOb1GQo/uT7BOY=
X-Gm-Gg: AR+sD12+ewbEM7ioKg4DUzzh+lhOZMODDi5/uZmhSpgKYyzTGSQ2rAfbRHNxiJr1FzS
	bDJ8SJFxNq5oeqfLlOCqIBf8zV3pyi2ljSjr75EQa7t+p/ULmEb3yL9vITvgA1Do4P9tHGxC6Ju
	9sa6ipk/CHry2ygUQFIQzej1Mt9DR9sO4GN5PsJBWnLd/pUOmNnNb5/dWP9+2MiovahXpipmcMC
	jbd3v/ka6kTIGV0uXAaHVWhGadnmW9yPxmfPk+Me5jtG7Fwe1uFEzrPWveqoG9w19gmiuj8
X-Received: by 2002:a05:6512:800b:10b0:5ae:a702:6528 with SMTP id
 2adb3069b0e04-5b2b2f501camr94561e87.26.1784772816194; Wed, 22 Jul 2026
 19:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721095431.6619-1-linkinjeon@kernel.org> <20260721095431.6619-3-linkinjeon@kernel.org>
In-Reply-To: <20260721095431.6619-3-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 23 Jul 2026 11:13:22 +0900
X-Gm-Features: AUfX_mxaBP6ynZuOxunIDg90FQRrkwfxRBY5Emv_wkgtK-mvkLk8kgeFNr26-Qk
Message-ID: <CANFS6bbyyxMM4H4F07PiJvW5Gc4Onw6-YaLND28KePm02umBCQ@mail.gmail.com>
Subject: Re: [PATCH 03/11] ntfs: punch all-zero compressed blocks
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:54, N=
amjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> When a rewritten compression block consists entirely of zeroes,
> ntfs_write_cb() returns without replacing its existing runlist mapping.
> The old on-disk contents therefore remain visible after cache eviction.
>
> Punch the compression unit so that reads resolve it as a sparse block and
> release any clusters that held the previous contents.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>


> ---
>  fs/ntfs/compress.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index 006b8831836c..33ed0456bf7e 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1279,9 +1279,10 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lo=
ff_t pos, struct page **pages,
>         int i, err;
>         int pages_count =3D (round_up(ni->itype.compressed.block_size + 2=
 *
>                 (ni->itype.compressed.block_size / NTFS_SB_SIZE) + 2, PAG=
E_SIZE)) / PAGE_SIZE;
> +       u32 cb_clusters =3D ni->itype.compressed.block_clusters;
>         size_t new_rl_count;
>         struct bio *bio =3D NULL;
> -       loff_t new_length;
> +       loff_t cb_pos, new_length;
>         s64 new_vcn;
>
>         in_mapping =3D vmap(pages, pages_per_cb, VM_MAP, PAGE_KERNEL_RO);
> @@ -1351,6 +1352,9 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>                 }
>         }
>
> +       cb_pos =3D pos & ~((loff_t)ni->itype.compressed.block_size - 1);
> +       new_vcn =3D ntfs_bytes_to_cluster(vol, cb_pos);
> +
>         if (!fail && !allzeroes) {
>                 outbuf[compsz++] =3D 0;
>                 outbuf[compsz++] =3D 0;
> @@ -1359,7 +1363,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>                 bio_size =3D rounded;
>                 pages =3D pages_disk;
>         } else if (allzeroes) {
> -               err =3D 0;
> +               err =3D ntfs_non_resident_attr_punch_hole(ni, new_vcn, cb=
_clusters);
>                 goto out;
>         } else {
>                 memcpy(outbuf, inbuf, insz);
> @@ -1367,8 +1371,6 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>                 pages =3D pages_disk;
>         }
>
> -       new_vcn =3D ntfs_bytes_to_cluster(vol,
> -                       pos & ~((loff_t)ni->itype.compressed.block_size -=
 1));
>         new_length =3D ntfs_bytes_to_cluster(vol, round_up(bio_size, vol-=
>cluster_size));
>
>         err =3D ntfs_non_resident_attr_punch_hole(ni, new_vcn, ni->itype.=
compressed.block_clusters);
> --
> 2.34.1
>


--=20
Thanks,
Hyunchul
