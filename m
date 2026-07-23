Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D115A1D130E
	for <ntfs@lists.linux.dev>; Thu, 23 Jul 2026 02:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772959; cv=pass; b=nENV+QM9sCm9lFBuCiFObjQGN4PusZHEPT9GM70k+7RN2wLlq/Gni0DjX5Yo4luTRMSC5uzVhncX7o1VWUna8LOlbuS8Z3OaVGD4aUU3hx3AvZW8sp+KFcMel/UbCb4n5Gc8CyH8ijvOG0HsR4LmLqW7OEjbxxX7pfR3gH47RFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772959; c=relaxed/simple;
	bh=ScdQm/PWIbC0N8R3wuD1ToC4XhR9xfZrAm6qReD52h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kASm1yCrPbAwy4z2b2XORnuW1smOl3AvQ93NsDcQHhpHhkrxgWUE2QQrEsuP6JC/JBpTBrfXBfLk7bJHthNslGmqepm10dV71SxBmCPsbu/FuaWHnRKLzGQY75KDexw63HDjYwZkkbsiAQWW/X+P+8KURCJcrYyLSj5Vh3US+ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZKTHL7f; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZKTHL7f"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b29599b81cso114158e87.1
        for <ntfs@lists.linux.dev>; Wed, 22 Jul 2026 19:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784772956; cv=none;
        d=google.com; s=arc-20260327;
        b=QYxrRmhl/w2gCtK34oDGw8d/x7FBlkNs32Di3WLop2vqKXehrwtioVXWCgWBlmxkGh
         B1DKbIcAvzRjBt4vkK7VM2Zwd6okKSSmBvqumHtQodhym5h8CmLu5VTdpPo+SDJ140wS
         u6HioYsvblkdodL9tTx0TY2h/TJhuHvLFucLKXaKxQ/kKFLMVaY3UTouvlXCd3bXHaLV
         lF1Ht2HafURLFDBmQAIc4xNQEfsVGzyAltMY5w3YW/iEj5Xx21fn2BcKx2NEnrjl0g7h
         KEWhikPdctOe5LjA0ZWcjIfgCsE4fnmthlfWZEZFBLzFcdkIBxSCrGTffF3G+dalYCTv
         ujHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zSPfjMW3y3ZdkR3/IiqimRw/gWNWoKaTyoQyXRSf2AY=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=ceuCpOZvqzp0a3W2GlDKujM59kkaRDsOJCfBfT2D3ZVQH8kDkwrcs7fI7gskZCuxkp
         n+EebwR/bD6txpoeJfDK2el5uDMetQWbG5Ww9Cn1fgTSyjHiUEq4wOPRkY4PwQULlot5
         Gvn9H8R2X8Ta7P5CFEK2Q1MebQmFheA4mcOMjS5SJKYKA0Wej2NuQn/cXddLe49ZydcB
         RfqkNqrujSOoSxWGDIl7oSK3n8ZqaZOV8wUFHDdnXJTHLUUNdN6Dnaysc+d8Ey3pbPXr
         H/BmES/+Zip7YTpR8IBA+CZa9t9qbijxQSLkNjyZODLvHOyKDDUVgKu/HSPcKfKgBMAG
         conA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784772956; x=1785377756; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zSPfjMW3y3ZdkR3/IiqimRw/gWNWoKaTyoQyXRSf2AY=;
        b=PZKTHL7fveBBJNNkO4mM1F9tyuhjh/iVF6Mh6ijUDUFARjZTEdtOaHib7I0AGVlZdG
         QudCkKbxWxSo8Ktn8XPJWCL1BriAxtt8UaWk0cRdrPHt+syEhGzoC2qG+ZpTmN4ud8m2
         vYPb2f8jtZGJp8N/XYctsN5MTxr2nelInYvDq5w4D8+T3zzA92H6UttOh9MrqCR1Q1BO
         IUoLdMfGAuSm3hA2EDot/W/TX/T8/MrRuCP36Bz+2KcxLx7RHW6gjibt3l4EsCw+4+s2
         GBkmRcp1ppK3vS4bUc6k2/6Zvd5SCyHBpeSeGP0r7Yf8roHJ0xq2o3uAPbYGILW8v4Y7
         ys7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784772956; x=1785377756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSPfjMW3y3ZdkR3/IiqimRw/gWNWoKaTyoQyXRSf2AY=;
        b=D8ZOS/hmc6xvgCv/w7L9aNLijeZ2+NeQPeryQ5jEhtldqpNVBGuvjNHVBx4NHW8u0O
         4A2IGE8j3dIKoQ37e+TdhjzGQxwZ/LNBzszizFUZ7kVlS0qlF5LLgD5f/77r0Lf45I7L
         /F0RMPEfY7nmEMyCZRpKVqTt5Af15W2lpP0G8axz9/W9Yx939D2t7jCaMWVFSFytEgjs
         6RIEau6uucSK0sumleyOKDWsGqaAc2UYYOxm1ZQL+17ye95v1NR8xqPapCUSuWv6bcuQ
         5rq4N7eSbZ+3Khb21xWyxYn/WeDXLiDIKk8VWSCgqwNw4hdr9AWhy1tD7iVfdjLlMTZ/
         eiRQ==
X-Gm-Message-State: AOJu0YxZzb39OxNOE1fon4bVHPC0/07LJAAzA/LBorYwz4UYnziCj64A
	QVAvbAma3DvyZjw3QhHBTsc3R59zCE4yIpLCmTyqhm6riHUynpWz/7WoPd9nA7NW4EdeqPQVK/C
	dDkPHefInIQjUFdxlMJ0IoAkc+3qsz9s=
X-Gm-Gg: AR+sD11Vy+KniKw/v5NgOZv50IAO4WuCjkQM6Oi1bMy2SaFAUNvVcaRhH0q7HsOYApk
	Z0+SlrK/rHBnoVMCSZcfnz1aRqAPRAvPVmkHaFwEOYi1VMfimboIkM1XSPWV60Zzki4iAgRBbvA
	CuzD50WIN4oHhbQbrA2BuT5tfIX4+BcYL7WspWEaClhGz0H7wlQ3WAWCYqjFQ9nF44KenqXwi88
	vN299r5y/L79oyW+uoLGb8MWF7e+lI70WCHFa13WT0McJU9oc2yAdbx/rnVSw==
X-Received: by 2002:ac2:52b5:0:b0:5ae:b584:561c with SMTP id
 2adb3069b0e04-5b2b2f785admr87718e87.62.1784772955623; Wed, 22 Jul 2026
 19:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721095431.6619-1-linkinjeon@kernel.org> <20260721095431.6619-7-linkinjeon@kernel.org>
In-Reply-To: <20260721095431.6619-7-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 23 Jul 2026 11:15:41 +0900
X-Gm-Features: AUfX_mxPJZgCzLykvvPH0YVWGSQR3zohjInCFOWlTq1luAwQKJxSnNh7yVL2U9A
Message-ID: <CANFS6bbspS6v_bqbUFEq8efyoWKGdAnTG+=iKFPyKx2LRvSJ=w@mail.gmail.com>
Subject: Re: [PATCH 07/11] ntfs: reuse compression output workspace across
 write units
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:55, N=
amjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> ntfs_write_cb() allocates output pages and creates input and output
> vmaps for every compression unit. Sequential writes repeatedly pay
> those allocation and page-table costs even though each unit has the
> same maximum output size.
> Allocate and map the output workspace once per write request. Access
>
> input sub-blocks with kmap_local_page(), and reuse the output pages and
> mapping for every compression unit in the request.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/compress.c | 135 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 85 insertions(+), 50 deletions(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index f073a53f6136..f3c14518f78e 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -894,6 +894,12 @@ struct compress_context {
>         s16 prev[NTFS_SB_SIZE];
>  };
>
> +struct ntfs_compress_workspace {
> +       struct page **pages;
> +       char *outbuf;
> +       unsigned int nr_pages;
> +};
> +
>  /*
>   * Hash the next 3-byte sequence in the input buffer
>   */
> @@ -1247,12 +1253,69 @@ static int ntfs_compress_block(struct compress_co=
ntext *pctx,
>         return xout;
>  }
>
> +static int ntfs_compress_workspace_init(struct ntfs_inode *ni,
> +                                       struct ntfs_compress_workspace *w=
s)
> +{
> +       unsigned int size, i;
> +
> +       size =3D ni->itype.compressed.block_size + 2 *
> +               (ni->itype.compressed.block_size / NTFS_SB_SIZE) + 2;
> +       ws->nr_pages =3D DIV_ROUND_UP(size, PAGE_SIZE);
> +       ws->pages =3D kcalloc(ws->nr_pages, sizeof(*ws->pages), GFP_NOFS)=
;
> +       if (!ws->pages)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < ws->nr_pages; i++) {
> +               ws->pages[i] =3D alloc_page(GFP_NOFS);
> +               if (!ws->pages[i])
> +                       goto free_pages;
> +       }
> +
> +       ws->outbuf =3D vmap(ws->pages, ws->nr_pages, VM_MAP, PAGE_KERNEL)=
;
> +       if (!ws->outbuf)
> +               goto free_pages;
> +       return 0;
> +
> +free_pages:
> +       while (i)
> +               put_page(ws->pages[--i]);
> +       kfree(ws->pages);
> +       return -ENOMEM;
> +}
> +
> +static void ntfs_compress_workspace_free(struct ntfs_compress_workspace =
*ws)
> +{
> +       unsigned int i;
> +
> +       vunmap(ws->outbuf);
> +       for (i =3D 0; i < ws->nr_pages; i++)
> +               put_page(ws->pages[i]);
> +       kfree(ws->pages);
> +}
> +
> +static void ntfs_copy_cb(struct page **pages, int pages_per_cb,
> +                        unsigned int page_offset,
> +                        struct ntfs_compress_workspace *ws, unsigned int=
 bytes)
> +{
> +       unsigned int copied =3D 0, i;
> +
> +       for (i =3D 0; i < pages_per_cb && copied < bytes; i++) {
> +               unsigned int offset =3D i ? 0 : page_offset;
> +               unsigned int len =3D min(bytes - copied, PAGE_SIZE - offs=
et);
> +               void *addr =3D kmap_local_page(pages[i]);
> +
> +               memcpy(ws->outbuf + copied, addr + offset, len);
> +               kunmap_local(addr);
> +               copied +=3D len;
> +       }
> +}
> +
>  static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page =
**pages,
>                 int pages_per_cb, unsigned int page_offset,
> -               struct compress_context *ctx)
> +               struct compress_context *ctx, struct ntfs_compress_worksp=
ace *ws)
>  {
>         struct ntfs_volume *vol =3D ni->vol;
> -       char *outbuf =3D NULL, *pbuf, *inbuf, *in_mapping;
> +       char *outbuf =3D ws->outbuf, *pbuf;
>         u32 compsz, p, insz =3D ni->itype.compressed.block_size;
>         s32 rounded, bio_size;
>         int sz;
> @@ -1264,55 +1327,32 @@ static int ntfs_write_cb(struct ntfs_inode *ni, l=
off_t pos, struct page **pages,
>         static char twozeroes[] =3D {0x02, 0xb0, 0x00, 0x00, 0x00};
>         /* more compressed zeroes, to be followed by some count */
>         static char morezeroes[] =3D {0x03, 0xb0, 0x02, 0x00};
> -       struct page **pages_disk =3D NULL, *pg;
>         s64 bio_lcn;
>         struct runlist_element *rlc, *rl;
>         int i, err;
> -       int pages_count =3D (round_up(ni->itype.compressed.block_size + 2=
 *
> -               (ni->itype.compressed.block_size / NTFS_SB_SIZE) + 2, PAG=
E_SIZE)) / PAGE_SIZE;
>         u32 cb_clusters =3D ni->itype.compressed.block_clusters;
>         size_t new_rl_count;
>         struct bio *bio =3D NULL;
>         loff_t cb_pos, new_length;
>         s64 new_vcn;
>
> -       in_mapping =3D vmap(pages, pages_per_cb, VM_MAP, PAGE_KERNEL_RO);
> -       if (!in_mapping)
> -               return -ENOMEM;
> -       inbuf =3D in_mapping + page_offset;
> -
> -       /* may need 2 extra bytes per block and 2 more bytes */
> -       pages_disk =3D kcalloc(pages_count, sizeof(struct page *), GFP_NO=
FS);
> -       if (!pages_disk) {
> -               vunmap(in_mapping);
> -               return -ENOMEM;
> -       }
> -
> -       for (i =3D 0; i < pages_count; i++) {
> -               pg =3D alloc_page(GFP_KERNEL);
> -               if (!pg) {
> -                       err =3D -ENOMEM;
> -                       goto out;
> -               }
> -               pages_disk[i] =3D pg;
> -               lock_page(pg);
> -       }
> -
> -       outbuf =3D vmap(pages_disk, pages_count, VM_MAP, PAGE_KERNEL);
> -       if (!outbuf) {
> -               err =3D -ENOMEM;
> -               goto out;
> -       }
> -
>         compsz =3D 0;
>         allzeroes =3D true;
>         for (p =3D 0; (p < insz) && !fail; p +=3D NTFS_SB_SIZE) {
> +               unsigned int input_offset =3D page_offset + p;
> +               unsigned int page_idx =3D input_offset >> PAGE_SHIFT;
> +               const char *input;
> +               void *addr;
> +
>                 if ((p + NTFS_SB_SIZE) < insz)
>                         bsz =3D NTFS_SB_SIZE;
>                 else
>                         bsz =3D insz - p;
>                 pbuf =3D &outbuf[compsz];
> -               sz =3D ntfs_compress_block(ctx, &inbuf[p], bsz, pbuf);
> +               addr =3D kmap_local_page(pages[page_idx]);
> +               input =3D addr + offset_in_page(input_offset);
> +               sz =3D ntfs_compress_block(ctx, input, bsz, pbuf);
> +               kunmap_local(addr);
>                 if (sz < 0) {
>                         err =3D sz;
>                         goto out;
> @@ -1352,14 +1392,12 @@ static int ntfs_write_cb(struct ntfs_inode *ni, l=
off_t pos, struct page **pages,
>                 rounded =3D ((compsz - 1) | (vol->cluster_size - 1)) + 1;
>                 memset(&outbuf[compsz], 0, rounded - compsz);
>                 bio_size =3D rounded;
> -               pages =3D pages_disk;
>         } else if (allzeroes) {
>                 err =3D ntfs_non_resident_attr_punch_hole(ni, new_vcn, cb=
_clusters);
>                 goto out;
>         } else {
> -               memcpy(outbuf, inbuf, insz);
> +               ntfs_copy_cb(pages, pages_per_cb, page_offset, ws, insz);
>                 bio_size =3D insz;
> -               pages =3D pages_disk;
>         }
>
>         new_length =3D ntfs_bytes_to_cluster(vol, round_up(bio_size, vol-=
>cluster_size));
> @@ -1398,7 +1436,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>                                                 ((s64)i << PAGE_SHIFT));
>                 }
>
> -               if (!bio_add_page(bio, pages[i], page_size, 0)) {
> +               if (!bio_add_page(bio, ws->pages[i], page_size, 0)) {
>                         err =3D submit_bio_wait(bio);
>                         bio_put(bio);
>                         if (err)
> @@ -1443,17 +1481,6 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lo=
ff_t pos, struct page **pages,
>                 ntfs_error(vol->sb, "Failed to free hot clusters.");
>         kvfree(rlc);
>  out:
> -       if (outbuf)
> -               vunmap(outbuf);
> -       for (i =3D 0; i < pages_count; i++) {
> -               pg =3D pages_disk[i];
> -               if (pg) {
> -                       unlock_page(pg);
> -                       put_page(pg);
> -               }
> -       }
> -       kfree(pages_disk);
> -       vunmap(in_mapping);
>         NInoSetFileNameDirty(ni);
>         mark_mft_record_dirty(ni);
>
> @@ -1463,6 +1490,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>  int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
>                 struct iov_iter *from)
>  {
> +       struct ntfs_compress_workspace ws =3D {};
>         struct compress_context *ctx;
>         struct folio *folio;
>         struct page **pages =3D NULL, *page;
> @@ -1483,6 +1511,12 @@ int ntfs_compress_write(struct ntfs_inode *ni, lof=
f_t pos, size_t count,
>                 kfree(pages);
>                 return -ENOMEM;
>         }
> +       err =3D ntfs_compress_workspace_init(ni, &ws);
> +       if (err) {
> +               kvfree(ctx);
> +               kfree(pages);
> +               return err;
> +       }
>
>         while (count) {
>                 pgoff_t index;
> @@ -1551,7 +1585,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff=
_t pos, size_t count,
>                         goto release_pages;
>                 }
>
> -               err =3D ntfs_write_cb(ni, pos, pages, pages_per_cb, page_=
offset, ctx);
> +               err =3D ntfs_write_cb(ni, pos, pages, pages_per_cb, page_=
offset, ctx, &ws);
>                 if (!err && pos + copied > ni->initialized_size) {
>                         mutex_lock(&ni->mrec_lock);
>                         err =3D ntfs_attr_set_initialized_size(ni, pos + =
copied);
> @@ -1581,6 +1615,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff=
_t pos, size_t count,
>         }
>
>  out:
> +       ntfs_compress_workspace_free(&ws);
>         kvfree(ctx);
>         kfree(pages);
>         if (err < 0)
> --
> 2.34.1
>


--=20
Thanks,
Hyunchul
