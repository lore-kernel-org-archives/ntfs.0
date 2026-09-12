Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B3390615
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230326; cv=pass; b=lLrTry9b5cuMDMQ25WtmhQ7aBrjVbZliRUZaLsYDlgUd1IR3NtNX9RkNlnWzveQ5AwdSObgrH+9x3XnARicbh39aairj2eMHvG+qlHsEGY3fRj6QtXd0z5T1PaWB8SeYewgudV1ws0JoPwVBeaC+eumIitWlmL+UzQDkBPemCyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230326; c=relaxed/simple;
	bh=rzpKX+aGcpEB4zR4AXcoNNmqecr2XG6w33o1a6VC0bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpLRv0XcQOYgAqA9A6J3sqR5e4xLL/KDHN97he9cMXeLVTNVq/EPvy19BE5r3oVlWKfDFv4VyrWsz2FK7O22bDS+XAZrRI0VWTOqwZ01ttQOSXs23mzNO6TVQxqwsN+Vj6vJAeL64gDw0TF3O7bCz86TTxGr9SEayeMTA+bf1KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/LHeJeq; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/LHeJeq"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so502188e87.0
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789230321; cv=none;
        d=google.com; s=arc-20260327;
        b=iZK0DVNSf8Wpq2yNlYykil2h1iohJ5rgg2YC+NpKynyJ8/PUCLqN4uf17xjhNUO9Cn
         q0/A6b1gmEw5rubnDc0sEmgHxgevcb1OHCedyWn86SsGv6VJpOGFp2BoLQp/c+zV1n6m
         wnoZBeLZibU2QDCZpSHqPz1V7saodTtm5DgCGsfS2rVhOTjwAe4mIU1BOStCUUSWL6hy
         EklTqwWup+hbfAoICPZeaDzQzUSqXgK72iCmsDBz6UgHFz8O5EAgZIu0byVBvZ5r5D1i
         PoffKc71X0VCr6U746R4lIpwE382JWkUlTq8QYAbV5qXzKjpng7h1uHLo0vpac1cVN+T
         AtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N6hi6ye9o2mGEGx+c38Bvllpu5gQv6CfhhOqtwgyZtU=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=YsPwGh7idkJbUoC4pa/jJMPCqXKrw+IT+emtpO4fQt2ENC/5gnAdcrORrGfaAnpGVo
         nDZ6TJVhVFXZGAsXN7H0uTAqCZhBXGJNexygzy0UfBEi2ZaZe49DjJixmTQiHRkktYIg
         s4nFoN3J5EHjnH6dKMM5b39asu+2WDONPjsegZn+M6hAezPs3rdBqT4bWk7I/PPYe7lU
         lheB0YC6eWYBlTjKfAAKqfCKwrrXvOdFv0/9mkzmYE6tguZplNdxtkaA+GVTO0DEP9Zi
         38bl1NLupAnWvESxSsMljzdjQE6B4SVrMvWof5wxktW+qY2gZacZTwD3NDchehh43oZn
         yRwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230321; x=1789835121; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N6hi6ye9o2mGEGx+c38Bvllpu5gQv6CfhhOqtwgyZtU=;
        b=Q/LHeJeqFzL0Z/zm3B0zYY8zMgC0STsiQMbiFgivUVJerrP/VoAsj+A/e7tnCDbueE
         QmkbmtfO59dcyJwmUQoiaIMnwquK9GQ2BYT+lFzU7LDG3NZCcjf7mspVSg4Z5FrG77su
         fhYVdLl8f7SiD4ELLZwPpRd7lGkg/o4c2ITwRvG5HKNK8j9tDJxeOuSI9lqhMtE4Li6D
         uUqi7HThA7UJNdM0vPeDI95kIHbZvE98Jea+rAX8nO7Rep2ewfqwy5FTo7+mtFi3BJMj
         cLvhcTwoLosfkFrgTKx8s2o3KmfXW5cN1hnGMaeHLwsRXFYF1pqTPq+8Eg1/lp+ursSx
         UYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230321; x=1789835121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6hi6ye9o2mGEGx+c38Bvllpu5gQv6CfhhOqtwgyZtU=;
        b=mqt6kwy6G9Q8ZtjuAAEpOGZYPDQFxNAPvr9Am3H+4GN0xGkLEHk6I648Cnj1Xurced
         075RnL4J5urqWIO4eSo4m9/13BqCsrBgZ9mXpqanv7/Y2zvC98+qnMCT+mPYbR4Oarvg
         lYR0ipoa7LMghoOhhNNI4CuilIwUGxbTU27lH5NBf29C88SaF7iRZ0sXBm/hUY4eQG5f
         09q/k6j8hG7IQcGHeWg2QaDcMw/Grrl4Q95LivC0280kxBJYBuK2+M9dhBT4uRhNf8/G
         qugTxn23Fb7TVXLl0Am230ahSp3poPHubx+ovTySXloWeATnWP3UrPys3N3K7mh5ERUN
         9dAw==
X-Gm-Message-State: AFuF++kpjPa5JV/4CGz5ie8caFWXhYYjMkRWCvDc1tDyVxxBqVL2RVWf
	pvzIqbfhyANhwQRYn3fQfin1yLn1J55dRCLcBCM/kQnNOlaj7RsUJXWv40ydoaOKvUJ8pCUFLL2
	LpaXXy6nze9Z9CTrfMUXVI+rR+3gVQRxg3O/9
X-Gm-Gg: AYBFou170dUTRaNXdjSLKT6LT/FQnx90CIH/5aJJ0aKCCZwE+j3ze+5xBUgQwk3zaMR
	gyqwDe7aeOlabv5y73RyIGDcyNI5lefaRzURiVnA63BDEWWESpHN3RSoQCrPREc6BGXJxiG6aqK
	w0XbAlX6UMYglXIwsPKMgC93aRFuvvNKsP4g3qW8tR45v9gXbXNmRsJb5/NbIw3Uxrzm+QM39i/
	LyUbMQRlE6M3CQhdjcgGxEzPzcsk9D6uis2WeSGsre5NcnfyLFPkFWCXgrZxm3Vxf+2I/pNJm+k
	AJc1Tt87RtGAMVVAZAPKsOIqUvyaINMiukPxA3MANngzFNWnX8HucQaR
X-Received: by 2002:a05:6512:3ba7:b0:5b6:183c:5c8e with SMTP id
 2adb3069b0e04-5b8a8ef5db2mr682173e87.44.1789230320683; Sat, 12 Sep 2026
 09:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908094416.10534-1-linkinjeon@kernel.org> <20260908094416.10534-4-linkinjeon@kernel.org>
In-Reply-To: <20260908094416.10534-4-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sun, 13 Sep 2026 01:25:08 +0900
X-Gm-Features: AcwNN1Wg6cCASArOi1s6chpkK3N9SOF47tDJTUIbx4sBv2Wii10M0d98U9HMyyA
Message-ID: <CANFS6bYQ3MKEEG9Oo9vb_h9v3jkX2SnSK3MDqgJTpf7QW05GJw@mail.gmail.com>
Subject: Re: [PATCH] ntfs: protect runlist updates with the runlist lock
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 8=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:44, Na=
mjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> ntfs_non_resident_attr_shrink() calls runlist helpers that require the
> runlist write lock, but did not hold it while freeing clusters and
> truncating the runlist. Serialize those operations and the resident
> conversion with the runlist lock.
>
> ntfs_attr_map_cluster() can merge a newly allocated run before updating
> mapping pairs. If the update fails, free the clusters and restore both
> the in-memory runlist and on-disk mapping pairs from a saved runlist.
> Mark the volume in error if either rollback step fails.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/attrib.c   | 205 +++++++++++++++++++++++++++++++++++----------
>  fs/ntfs/attrib.h   |   9 ++
>  fs/ntfs/attrlist.c |  46 ++++++----
>  fs/ntfs/attrlist.h |   2 +
>  fs/ntfs/compress.c |   2 +-
>  fs/ntfs/file.c     |   3 +-
>  fs/ntfs/inode.c    |   2 +-
>  fs/ntfs/mft.c      |  13 +--
>  8 files changed, 216 insertions(+), 66 deletions(-)
>
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index d1696ce6acd5..c949ff765075 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -3574,7 +3574,8 @@ int ntfs_attr_record_move_away(struct ntfs_attr_sea=
rch_ctx *ctx, int extra)
>   * update allocated and compressed size.
>   */
>  static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inod=
e *ni,
> -               struct mft_record *m, struct ntfs_attr_search_ctx *ctx)
> +               struct mft_record *m, struct ntfs_attr_search_ctx *ctx,
> +               struct ntfs_inode *locked_ni, bool defer_attrlist)
>  {
>         int sparse, err =3D 0;
>         struct ntfs_inode *base_ni;
> @@ -3610,6 +3611,8 @@ static int ntfs_attr_update_meta(struct attr_record=
 *a, struct ntfs_inode *ni,
>                      le16_to_cpu(a->data.non_resident.mapping_pairs_offse=
t) =3D=3D 8) &&
>                     !(le32_to_cpu(m->bytes_allocated) - le32_to_cpu(m->by=
tes_in_use))) {
>
> +                       if (defer_attrlist)
> +                               return -ENOSPC;
>                         if (!NInoAttrList(base_ni)) {
>                                 err =3D ntfs_inode_add_attrlist(base_ni);
>                                 if (err)
> @@ -3623,7 +3626,7 @@ static int ntfs_attr_update_meta(struct attr_record=
 *a, struct ntfs_inode *ni,
>                                 goto out;
>                         }
>
> -                       err =3D ntfs_attrlist_update(base_ni);
> +                       err =3D ntfs_attrlist_update_locked(base_ni, lock=
ed_ni);
>                         if (err)
>                                 goto out;
>                         err =3D -EAGAIN;
> @@ -3703,6 +3706,8 @@ static int ntfs_attr_update_meta(struct attr_record=
 *a, struct ntfs_inode *ni,
>   * ntfs_attr_update_mapping_pairs - update mapping pairs for ntfs attrib=
ute
>   * @ni:                non-resident ntfs inode for which we need update
>   * @from_vcn:  update runlist starting this VCN
> + * @locked_ni: inode whose runlist write lock is already held
> + * @defer_attrlist: return -ENOSPC instead of updating an attribute list
>   *
>   * Build mapping pairs from @na->rl and write them to the disk. Also, th=
is
>   * function updates sparse bit, allocated and compressed size (allocates=
/frees
> @@ -3712,7 +3717,10 @@ static int ntfs_attr_update_meta(struct attr_recor=
d *a, struct ntfs_inode *ni,
>   * call to this function. Vice-versa @na->compressed_size will be calcul=
ated and
>   * set to correct value during this function.
>   */
> -int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
> +static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
> +                                           s64 from_vcn,
> +                                           struct ntfs_inode *locked_ni,
> +                                           bool defer_attrlist)
>  {
>         struct ntfs_attr_search_ctx *ctx;
>         struct ntfs_inode *base_ni;
> @@ -3804,7 +3812,8 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_inod=
e *ni, s64 from_vcn)
>                         continue;
>                 }
>
> -               err =3D ntfs_attr_update_meta(a, ni, m, ctx);
> +               err =3D ntfs_attr_update_meta(a, ni, m, ctx, locked_ni,
> +                                           defer_attrlist);
>                 if (err < 0) {
>                         if (err =3D=3D -EAGAIN) {
>                                 ntfs_attr_put_search_ctx(ctx);
> @@ -3844,11 +3853,17 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_in=
ode *ni, s64 from_vcn)
>                          */
>                         if (ni->type =3D=3D AT_ATTRIBUTE_LIST) {
>                                 ntfs_attr_put_search_ctx(ctx);
> +                               ctx =3D NULL;
> +                               if (locked_ni =3D=3D ni || defer_attrlist=
) {
> +                                       err =3D -ENOSPC;
> +                                       goto put_err_out;
> +                               }
>                                 err =3D ntfs_inode_free_space(base_ni, mp=
_size -
>                                                         cur_max_mp_size);
>                                 if (err)
>                                         return err;
> -                               err =3D ntfs_attrlist_update(base_ni);
> +                               err =3D ntfs_attrlist_update_locked(
> +                                       base_ni, locked_ni);
>                                 if (err)
>                                         return err;
>                                 goto retry;
> @@ -3856,6 +3871,10 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_ino=
de *ni, s64 from_vcn)
>
>                         /* Add attribute list if it isn't present, and re=
try. */
>                         if (!NInoAttrList(base_ni)) {
> +                               if (defer_attrlist) {
> +                                       err =3D -ENOSPC;
> +                                       goto put_err_out;
> +                               }
>                                 ntfs_attr_put_search_ctx(ctx);
>                                 if (ntfs_inode_add_attrlist(base_ni)) {
>                                         ntfs_error(sb, "Can not add attrl=
ist");
> @@ -3883,13 +3902,21 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_in=
ode *ni, s64 from_vcn)
>                         }
>                 }
>
> +               if (defer_attrlist &&
> +                   (ctx->ntfs_ino->nr_extents =3D=3D -1 ||
> +                    NInoAttrList(ctx->ntfs_ino)) &&
> +                   ctx->attr->type !=3D AT_ATTRIBUTE_LIST) {
> +                       err =3D -ENOSPC;
> +                       goto put_err_out;
> +               }
> +
>                 /* Update lowest vcn. */
>                 a->data.non_resident.lowest_vcn =3D cpu_to_le64(stop_vcn)=
;
>                 mark_mft_record_dirty(ctx->ntfs_ino);
>                 if ((ctx->ntfs_ino->nr_extents =3D=3D -1 || NInoAttrList(=
ctx->ntfs_ino)) &&
>                     ctx->attr->type !=3D AT_ATTRIBUTE_LIST) {
>                         ctx->al_entry->lowest_vcn =3D cpu_to_le64(stop_vc=
n);
> -                       err =3D ntfs_attrlist_update(base_ni);
> +                       err =3D ntfs_attrlist_update_locked(base_ni, lock=
ed_ni);
>                         if (err)
>                                 goto put_err_out;
>                 }
> @@ -4064,6 +4091,19 @@ int ntfs_attr_update_mapping_pairs(struct ntfs_ino=
de *ni, s64 from_vcn)
>         return err;
>  }
>
> +int ntfs_attr_update_mapping_pairs_locked(struct ntfs_inode *ni,
> +                                         s64 from_vcn,
> +                                        struct ntfs_inode *locked_ni)
> +{
> +       return __ntfs_attr_update_mapping_pairs(ni, from_vcn, locked_ni,
> +                                               false);
> +}
> +
> +int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn)
> +{
> +       return ntfs_attr_update_mapping_pairs_locked(ni, from_vcn, NULL);
> +}
> +
>  /*
>   * ntfs_attr_make_resident - convert a non-resident to a resident attrib=
ute
>   * @ni:                open ntfs attribute to make resident
> @@ -4197,7 +4237,9 @@ static int ntfs_attr_make_resident(struct ntfs_inod=
e *ni, struct ntfs_attr_searc
>   *
>   * Reduce the size of a non-resident, open ntfs attribute @na to @newsiz=
e bytes.
>   */
> -static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni, const s6=
4 newsize)
> +static int ntfs_non_resident_attr_shrink(struct ntfs_inode *ni,
> +                                        const s64 newsize,
> +                                       struct ntfs_inode *locked_ni)
>  {
>         struct ntfs_volume *vol;
>         struct ntfs_attr_search_ctx *ctx;
> @@ -4205,6 +4247,7 @@ static int ntfs_non_resident_attr_shrink(struct ntf=
s_inode *ni, const s64 newsiz
>         s64 nr_freed_clusters;
>         int err;
>         struct ntfs_inode *base_ni;
> +       bool runlist_locked =3D locked_ni =3D=3D ni;
>
>         ntfs_debug("Inode 0x%llx attr 0x%x new size %lld\n",
>                 (unsigned long long)ni->mft_no, ni->type, (long long)news=
ize);
> @@ -4250,18 +4293,24 @@ static int ntfs_non_resident_attr_shrink(struct n=
tfs_inode *ni, const s64 newsiz
>          * clusters if there is a change.
>          */
>         if (ntfs_bytes_to_cluster(vol, ni->allocated_size) !=3D first_fre=
e_vcn) {
> -               struct ntfs_attr_search_ctx *ctx;
> +               /*
> +                * ntfs_cluster_free() and ntfs_rl_truncate_nolock()
> +                * both require this lock.
> +                */
> +               if (!runlist_locked)
> +                       down_write(&ni->runlist.lock);
>
>                 err =3D ntfs_attr_map_whole_runlist(ni);
>                 if (err) {
>                         ntfs_debug("Eeek! ntfs_attr_map_whole_runlist fai=
led.\n");
> -                       return err;
> +                       goto unlock_runlist;
>                 }
>
>                 ctx =3D ntfs_attr_get_search_ctx(ni, NULL);
>                 if (!ctx) {
>                         ntfs_error(vol->sb, "%s: Failed to get search con=
text", __func__);
> -                       return -ENOMEM;
> +                       err =3D -ENOMEM;
> +                       goto unlock_runlist;
>                 }
>
>                 /* Deallocate all clusters starting with the first free o=
ne. */
> @@ -4269,7 +4318,8 @@ static int ntfs_non_resident_attr_shrink(struct ntf=
s_inode *ni, const s64 newsiz
>                 if (nr_freed_clusters < 0) {
>                         ntfs_debug("Eeek! Freeing of clusters failed. Abo=
rting...\n");
>                         ntfs_attr_put_search_ctx(ctx);
> -                       return (int)nr_freed_clusters;
> +                       err =3D (int)nr_freed_clusters;
> +                       goto unlock_runlist;
>                 }
>                 ntfs_attr_put_search_ctx(ctx);
>
> @@ -4282,7 +4332,8 @@ static int ntfs_non_resident_attr_shrink(struct ntf=
s_inode *ni, const s64 newsiz
>                         kvfree(ni->runlist.rl);
>                         ni->runlist.rl =3D NULL;
>                         ntfs_error(vol->sb, "Eeek! Run list truncation fa=
iled.\n");
> -                       return -EIO;
> +                       err =3D -EIO;
> +                       goto unlock_runlist;
>                 }
>
>                 /* Prepare to mapping pairs update. */
> @@ -4298,11 +4349,13 @@ static int ntfs_non_resident_attr_shrink(struct n=
tfs_inode *ni, const s64 newsiz
>                         VFS_I(base_ni)->i_blocks =3D ni->allocated_size >=
> 9;
>
>                 /* Write mapping pairs for new runlist. */
> -               err =3D ntfs_attr_update_mapping_pairs(ni, 0 /*first_free=
_vcn*/);
> +               err =3D ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
>                 if (err) {
>                         ntfs_debug("Eeek! Mapping pairs update failed. Le=
aving inconstant metadata. Run chkdsk.\n");
> -                       return err;
> +                       goto unlock_runlist;
>                 }
> +               if (!runlist_locked)
> +                       up_write(&ni->runlist.lock);
>         }
>
>         /* Get the first attribute record. */
> @@ -4344,7 +4397,11 @@ static int ntfs_non_resident_attr_shrink(struct nt=
fs_inode *ni, const s64 newsiz
>
>         /* If the attribute now has zero size, make it resident. */
>         if (!newsize && !NInoEncrypted(ni) && !NInoCompressed(ni)) {
> +               if (!runlist_locked)
> +                       down_write(&ni->runlist.lock);
>                 err =3D ntfs_attr_make_resident(ni, ctx);
> +               if (!runlist_locked)
> +                       up_write(&ni->runlist.lock);
>                 if (err) {
>                         /* If couldn't make resident, just continue. */
>                         if (err !=3D -EPERM)
> @@ -4361,6 +4418,11 @@ static int ntfs_non_resident_attr_shrink(struct nt=
fs_inode *ni, const s64 newsiz
>  put_err_out:
>         ntfs_attr_put_search_ctx(ctx);
>         return err;
> +
> +unlock_runlist:
> +       if (!runlist_locked)
> +               up_write(&ni->runlist.lock);
> +       return err;
>  }
>
>  /*
> @@ -4369,13 +4431,14 @@ static int ntfs_non_resident_attr_shrink(struct n=
tfs_inode *ni, const s64 newsiz
>   * @prealloc_size:     preallocation size (in bytes) to which to expand =
the attribute
>   * @newsize:           new size (in bytes) to which to expand the attrib=
ute
>   * @holes:             how to create a hole if expanding
> - * @need_lock:         whether mrec lock is needed or not
> + * @locked_ni:         inode whose runlist lock is already held
>   *
>   * Expand the size of a non-resident, open ntfs attribute @na to @newsiz=
e bytes,
>   * by allocating new clusters.
>   */
>  static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s6=
4 newsize,
> -               const s64 prealloc_size, unsigned int holes, bool need_lo=
ck)
> +               const s64 prealloc_size, unsigned int holes,
> +               struct ntfs_inode *locked_ni)
>  {
>         s64 lcn_seek_from;
>         s64 first_free_vcn;
> @@ -4573,7 +4636,8 @@ static int ntfs_non_resident_attr_expand(struct ntf=
s_inode *ni, const s64 newsiz
>
>                 /* Prepare to mapping pairs update. */
>                 ni->allocated_size =3D ntfs_cluster_to_bytes(vol, first_f=
ree_vcn);
> -               err =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +               err =3D ntfs_attr_update_mapping_pairs_locked(
> +                               ni, 0, locked_ni);
>                 if (err) {
>                         ntfs_debug("Mapping pairs update failed");
>                         goto rollback;
> @@ -4617,11 +4681,11 @@ static int ntfs_non_resident_attr_expand(struct n=
tfs_inode *ni, const s64 newsiz
>                 ntfs_debug("Leaking clusters");
>
>         /* Now, truncate the runlist itself. */
> -       if (need_lock)
> +       if (ni !=3D locked_ni)
>                 down_write(&ni->runlist.lock);
>         err2 =3D ntfs_rl_truncate_nolock(vol, &ni->runlist,
>                         ntfs_bytes_to_cluster(vol, org_alloc_size));
> -       if (need_lock)
> +       if (ni !=3D locked_ni)
>                 up_write(&ni->runlist.lock);
>         if (err2) {
>                 /*
> @@ -4635,11 +4699,11 @@ static int ntfs_non_resident_attr_expand(struct n=
tfs_inode *ni, const s64 newsiz
>                 /* Prepare to mapping pairs update. */
>                 ni->allocated_size =3D org_alloc_size;
>                 /* Restore mapping pairs. */
> -               if (need_lock)
> +               if (ni !=3D locked_ni)
>                         down_read(&ni->runlist.lock);
> -               if (ntfs_attr_update_mapping_pairs(ni, 0))
> +               if (__ntfs_attr_update_mapping_pairs(ni, 0, locked_ni, tr=
ue))
>                         ntfs_error(sb, "Failed to restore old mapping pai=
rs");
> -               if (need_lock)
> +               if (ni !=3D locked_ni)
>                         up_read(&ni->runlist.lock);
>
>                 if (NInoSparse(ni) || NInoCompressed(ni)) {
> @@ -4744,7 +4808,8 @@ static int ntfs_resident_attr_resize(struct ntfs_in=
ode *attr_ni, const s64 newsi
>                 mark_mft_record_dirty(ctx->ntfs_ino);
>                 ntfs_attr_put_search_ctx(ctx);
>                 /* Resize non-resident attribute */
> -               return ntfs_non_resident_attr_expand(attr_ni, newsize, pr=
ealloc_size, holes, true);
> +               return ntfs_non_resident_attr_expand(
> +                               attr_ni, newsize, prealloc_size, holes, N=
ULL);
>         } else if (err !=3D -ENOSPC && err !=3D -EPERM) {
>                 ntfs_error(sb, "Failed to make attribute non-resident");
>                 goto put_err_out;
> @@ -4919,13 +4984,14 @@ int __ntfs_attr_truncate_vfs(struct ntfs_inode *n=
i, const s64 newsize,
>         if (NInoNonResident(ni)) {
>                 if (newsize > i_size) {
>                         down_write(&ni->runlist.lock);
> -                       err =3D ntfs_non_resident_attr_expand(ni, newsize=
, 0,
> -                                                           NVolDisableSp=
arse(ni->vol) ?
> -                                                           HOLES_NO : HO=
LES_OK,
> -                                                           false);
> +                       err =3D ntfs_non_resident_attr_expand(
> +                                       ni, newsize, 0,
> +                                       NVolDisableSparse(ni->vol) ?
> +                                       HOLES_NO : HOLES_OK, ni);
>                         up_write(&ni->runlist.lock);
>                 } else
> -                       err =3D ntfs_non_resident_attr_shrink(ni, newsize=
);
> +                       err =3D ntfs_non_resident_attr_shrink(
> +                                       ni, newsize, NULL);
>         } else
>                 err =3D ntfs_resident_attr_resize(ni, newsize, 0,
>                                                 NVolDisableSparse(ni->vol=
) ?
> @@ -4934,7 +5000,9 @@ int __ntfs_attr_truncate_vfs(struct ntfs_inode *ni,=
 const s64 newsize,
>         return err;
>  }
>
> -int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize, const s64=
 prealloc_size)
> +int ntfs_attr_expand_locked(struct ntfs_inode *ni, const s64 newsize,
> +                           const s64 prealloc_size,
> +                          struct ntfs_inode *locked_ni)
>  {
>         int err =3D 0;
>
> @@ -4964,9 +5032,10 @@ int ntfs_attr_expand(struct ntfs_inode *ni, const =
s64 newsize, const s64 preallo
>
>         if (NInoNonResident(ni)) {
>                 if (newsize > ni->data_size || prealloc_size > ni->alloca=
ted_size)
> -                       err =3D ntfs_non_resident_attr_expand(ni, newsize=
, prealloc_size,
> -                                                           NVolDisableSp=
arse(ni->vol) ?
> -                                                           HOLES_NO : HO=
LES_OK, true);
> +                       err =3D ntfs_non_resident_attr_expand(
> +                                       ni, newsize, prealloc_size,
> +                                       NVolDisableSparse(ni->vol) ?
> +                                       HOLES_NO : HOLES_OK, locked_ni);
>         } else
>                 err =3D ntfs_resident_attr_resize(ni, newsize, prealloc_s=
ize,
>                                                 NVolDisableSparse(ni->vol=
) ?
> @@ -4977,6 +5046,12 @@ int ntfs_attr_expand(struct ntfs_inode *ni, const =
s64 newsize, const s64 preallo
>         return err;
>  }
>
> +int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize,
> +                    const s64 prealloc_size)
> +{
> +       return ntfs_attr_expand_locked(ni, newsize, prealloc_size, NULL);
> +}
> +
>  /*
>   * ntfs_attr_truncate_i - resize an ntfs attribute
>   * @ni:                open ntfs inode to resize
> @@ -4989,7 +5064,9 @@ int ntfs_attr_expand(struct ntfs_inode *ni, const s=
64 newsize, const s64 preallo
>   * newly allocated space is marked as not initialised and no real alloca=
tion
>   * on disk is performed.
>   */
> -int ntfs_attr_truncate_i(struct ntfs_inode *ni, const s64 newsize, unsig=
ned int holes)
> +int ntfs_attr_truncate_i_locked(struct ntfs_inode *ni, const s64 newsize=
,
> +                               unsigned int holes,
> +                              struct ntfs_inode *locked_ni)
>  {
>         int err;
>
> @@ -5023,15 +5100,23 @@ int ntfs_attr_truncate_i(struct ntfs_inode *ni, c=
onst s64 newsize, unsigned int
>
>         if (NInoNonResident(ni)) {
>                 if (newsize > ni->data_size)
> -                       err =3D ntfs_non_resident_attr_expand(ni, newsize=
, 0, holes, true);
> +                       err =3D ntfs_non_resident_attr_expand(
> +                                       ni, newsize, 0, holes, locked_ni)=
;
>                 else
> -                       err =3D ntfs_non_resident_attr_shrink(ni, newsize=
);
> +                       err =3D ntfs_non_resident_attr_shrink(
> +                                       ni, newsize, locked_ni);
>         } else
>                 err =3D ntfs_resident_attr_resize(ni, newsize, 0, holes);
>         ntfs_debug("Return status %d\n", err);
>         return err;
>  }
>
> +int ntfs_attr_truncate_i(struct ntfs_inode *ni, const s64 newsize,
> +                        unsigned int holes)
> +{
> +       return ntfs_attr_truncate_i_locked(ni, newsize, holes, NULL);
> +}
> +
>  /*
>   * Resize an attribute, creating a hole if relevant
>   */
> @@ -5049,10 +5134,11 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, =
s64 vcn_start, s64 *lcn_start,
>         struct ntfs_volume *vol =3D ni->vol;
>         struct ntfs_attr_search_ctx *ctx;
>         struct runlist_element *rl, *rlc;
> +       struct runlist_element *old_rl =3D NULL;
>         s64 vcn =3D vcn_start, lcn, clu_count;
>         s64 lcn_seek_from =3D -1;
>         int err =3D 0;
> -       size_t new_rl_count;
> +       size_t new_rl_count, old_rl_count;
>
>         err =3D ntfs_attr_map_whole_runlist(ni);
>         if (err)
> @@ -5145,6 +5231,19 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s=
64 vcn_start, s64 *lcn_start,
>         WARN_ON(rlc->vcn !=3D vcn);
>         lcn =3D rlc->lcn;
>         clu_count =3D rlc->length;
> +       old_rl_count =3D ni->runlist.count;
> +       old_rl =3D kmemdup(ni->runlist.rl,
> +                        old_rl_count * sizeof(*old_rl), GFP_NOFS);
> +       if (!old_rl) {
> +               err =3D -ENOMEM;
> +               if (ntfs_cluster_free_from_rl(vol, rlc)) {
> +                       ntfs_error(vol->sb,
> +                                  "Failed to free cluster allocation aft=
er runlist backup failure.");
> +                       NVolSetErrors(vol);
> +               }
> +               kvfree(rlc);
> +               goto out;
> +       }
>
>         rl =3D ntfs_runlists_merge(&ni->runlist, rlc, 0, &new_rl_count);
>         if (IS_ERR(rl)) {
> @@ -5168,15 +5267,32 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, =
s64 vcn_start, s64 *lcn_start,
>
>         if (update_mp) {
>                 ntfs_attr_reinit_search_ctx(ctx);
> -               err =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +               err =3D ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
>                 if (err) {
>                         int err2;
>
>                         err2 =3D ntfs_cluster_free(ni, vcn, clu_count, ct=
x);
> -                       if (err2 < 0)
> +                       if (err2 < 0 || err2 !=3D clu_count) {
>                                 ntfs_error(vol->sb,
> -                                          "Failed to free cluster alloca=
tion. Leaving inconstant metadata.\n");
> -                       goto out;
> +                                          "Failed to free cluster alloca=
tion. Leaving inconsistent metadata.\n");
> +                               NVolSetErrors(vol);
> +                               goto out;
> +                       }
> +
> +                       /*
> +                        * Restore the runlist before repairing the on-di=
sk
> +                        * mapping pairs.
> +                        */
> +                       kvfree(ni->runlist.rl);
> +                       ni->runlist.rl =3D old_rl;
> +                       ni->runlist.count =3D old_rl_count;
> +                       old_rl =3D NULL;
> +                       if (ntfs_attr_update_mapping_pairs_locked(
> +                                       ni, 0, ni)) {
> +                               ntfs_error(vol->sb,
> +                                          "Failed to restore mapping pai=
rs after allocation rollback.\n");
> +                               NVolSetErrors(vol);
> +                       }
>                 }
>         } else {
>                 VFS_I(ni)->i_blocks +=3D clu_count << (vol->cluster_size_=
bits - 9);
> @@ -5188,6 +5304,7 @@ int ntfs_attr_map_cluster(struct ntfs_inode *ni, s6=
4 vcn_start, s64 *lcn_start,
>         *lcn_count =3D clu_count;
>         *balloc =3D true;
>  out:
> +       kvfree(old_rl);
>         ntfs_attr_put_search_ctx(ctx);
>         return err;
>  }
> @@ -5431,7 +5548,7 @@ int ntfs_non_resident_attr_insert_range(struct ntfs=
_inode *ni, s64 start_vcn, s6
>         ni->data_size +=3D ntfs_cluster_to_bytes(vol, len);
>         if (ntfs_cluster_to_bytes(vol, start_vcn) < ni->initialized_size)
>                 ni->initialized_size +=3D ntfs_cluster_to_bytes(vol, len)=
;
> -       ret =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +       ret =3D ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
>         up_write(&ni->runlist.lock);
>         if (ret)
>                 return ret;
> @@ -5516,7 +5633,7 @@ int ntfs_non_resident_attr_collapse_range(struct nt=
fs_inode *ni, s64 start_vcn,
>         }
>
>         if (ni->allocated_size > 0) {
> -               ret =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +               ret =3D ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
>                 if (ret) {
>                         up_write(&ni->runlist.lock);
>                         goto out_rl;
> @@ -5594,7 +5711,7 @@ int ntfs_non_resident_attr_punch_hole(struct ntfs_i=
node *ni, s64 start_vcn, s64
>         ni->runlist.rl =3D rl;
>         ni->runlist.count =3D new_rl_count;
>
> -       ret =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +       ret =3D ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
>         up_write(&ni->runlist.lock);
>         if (ret) {
>                 kvfree(punch_rl);
> @@ -5770,7 +5887,7 @@ int ntfs_attr_fallocate(struct ntfs_inode *ni, loff=
_t start, loff_t byte_len, bo
>         if (NInoRunlistDirty(ni)) {
>                 mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL=
);
>                 down_write(&ni->runlist.lock);
> -               err =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +               err =3D ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
>                 if (err)
>                         ntfs_error(ni->vol->sb, "Updating mapping pairs f=
ailed");
>                 else
> diff --git a/fs/ntfs/attrib.h b/fs/ntfs/attrib.h
> index e2224fbfaabe..6b4fa9f57640 100644
> --- a/fs/ntfs/attrib.h
> +++ b/fs/ntfs/attrib.h
> @@ -112,7 +112,13 @@ int ntfs_non_resident_attr_punch_hole(struct ntfs_in=
ode *ni, s64 start_vcn, s64
>  int __ntfs_attr_truncate_vfs(struct ntfs_inode *ni, const s64 newsize,
>                 const s64 i_size);
>  int ntfs_attr_expand(struct ntfs_inode *ni, const s64 newsize, const s64=
 prealloc_size);
> +int ntfs_attr_expand_locked(struct ntfs_inode *ni, const s64 newsize,
> +                           const s64 prealloc_size,
> +                          struct ntfs_inode *locked_ni);
>  int ntfs_attr_truncate_i(struct ntfs_inode *ni, const s64 newsize, unsig=
ned int holes);
> +int ntfs_attr_truncate_i_locked(struct ntfs_inode *ni, const s64 newsize=
,
> +                               unsigned int holes,
> +                              struct ntfs_inode *locked_ni);
>  int ntfs_attr_truncate(struct ntfs_inode *ni, const s64 newsize);
>  int ntfs_attr_rm(struct ntfs_inode *ni);
>  int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *na=
me,
> @@ -133,6 +139,9 @@ int ntfs_resident_attr_record_add(struct ntfs_inode *=
ni, __le32 type,
>                 __le16 *name, u8 name_len, u8 *val, u32 size,
>                 __le16 flags);
>  int ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni, s64 from_vcn);
> +int ntfs_attr_update_mapping_pairs_locked(struct ntfs_inode *ni,
> +                                         s64 from_vcn,
> +                                        struct ntfs_inode *locked_ni);
>  struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 v=
cn, s64 *lcn);
>
>  /*
> diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
> index b280af3c4b77..7c09d02fd941 100644
> --- a/fs/ntfs/attrlist.c
> +++ b/fs/ntfs/attrlist.c
> @@ -68,7 +68,8 @@ int ntfs_attrlist_need(struct ntfs_inode *ni)
>   * legal list size as a reserve.
>   */
>  static int ntfs_attrlist_repack(struct inode *attr_vi,
> -               struct ntfs_inode *attr_ni, s64 min_alloc_size)
> +               struct ntfs_inode *attr_ni, s64 min_alloc_size,
> +               struct ntfs_inode *locked_ni)
>  {
>         struct ntfs_volume *vol =3D attr_ni->vol;
>         struct runlist_element *old_rl, *new_rl;
> @@ -78,10 +79,12 @@ static int ntfs_attrlist_repack(struct inode *attr_vi=
,
>         size_t old_rl_count, new_rl_count;
>         unsigned long flags;
>         int err, restore_err;
> -
>         if (attr_ni->mft_no !=3D FILE_MFT || !NInoNonResident(attr_ni) ||
>                 min_alloc_size < 0)
>                 return -EINVAL;
> +       /* The buffered I/O below can reacquire the attribute runlist loc=
k. */
> +       if (attr_ni =3D=3D locked_ni)
> +               return -ENOSPC;
>
>         err =3D ntfs_attr_map_whole_runlist(attr_ni);
>         if (err)
> @@ -131,7 +134,6 @@ static int ntfs_attrlist_repack(struct inode *attr_vi=
,
>                 err =3D -ENOSPC;
>                 goto out_free_data;
>         }
> -
>         old_rl =3D attr_ni->runlist.rl;
>         old_rl_count =3D attr_ni->runlist.count;
>         down_write(&attr_ni->runlist.lock);
> @@ -152,7 +154,7 @@ static int ntfs_attrlist_repack(struct inode *attr_vi=
,
>                 }
>         }
>
> -       err =3D ntfs_attr_update_mapping_pairs(attr_ni, 0);
> +       err =3D ntfs_attr_update_mapping_pairs_locked(attr_ni, 0, locked_=
ni);
>         if (err)
>                 goto restore_old_runlist;
>
> @@ -177,7 +179,8 @@ static int ntfs_attrlist_repack(struct inode *attr_vi=
,
>         attr_ni->allocated_size =3D old_alloc_size;
>         write_unlock_irqrestore(&attr_ni->size_lock, flags);
>
> -       restore_err =3D ntfs_attr_update_mapping_pairs(attr_ni, 0);
> +       restore_err =3D ntfs_attr_update_mapping_pairs_locked(
> +                       attr_ni, 0, locked_ni);
>         if (restore_err) {
>                 ntfs_error(vol->sb, "Failed to restore ATTRIBUTE_LIST map=
ping pairs (%d)",
>                            restore_err);
> @@ -193,7 +196,8 @@ static int ntfs_attrlist_repack(struct inode *attr_vi=
,
>         return err;
>  }
>
> -int ntfs_attrlist_update(struct ntfs_inode *base_ni)
> +int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
> +                               struct ntfs_inode *locked_ni)
>  {
>         struct inode *attr_vi;
>         struct ntfs_inode *attr_ni;
> @@ -215,20 +219,27 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni=
)
>                 return err;
>         }
>         attr_ni =3D NTFS_I(attr_vi);
> +       /* Truncation and page-cache writes can reacquire this runlist lo=
ck. */
> +       if (attr_ni =3D=3D locked_ni) {
> +               iput(attr_vi);
> +               return -ENOSPC;
> +       }
>
> -       err =3D ntfs_attr_truncate_i(attr_ni, base_ni->attr_list_size, HO=
LES_NO);
> +       err =3D ntfs_attr_truncate_i_locked(
> +                       attr_ni, base_ni->attr_list_size, HOLES_NO, locke=
d_ni);
>         if (err =3D=3D -ENOSPC && attr_ni->mft_no =3D=3D FILE_MFT &&
>                 NInoNonResident(attr_ni)) {
>                 retry_err =3D ntfs_attrlist_repack(attr_vi, attr_ni,
> -                                       base_ni->attr_list_size);
> +                                       base_ni->attr_list_size, locked_n=
i);
>                 if (retry_err) {
>                         ntfs_error(base_ni->vol->sb, "Failed to repack at=
tribute list");
>                         iput(attr_vi);
>                         return retry_err;
>                 }
>
> -               retry_err =3D ntfs_attr_truncate_i(attr_ni, base_ni->attr=
_list_size,
> -                                                HOLES_NO);
> +               retry_err =3D ntfs_attr_truncate_i_locked(
> +                               attr_ni, base_ni->attr_list_size,
> +                               HOLES_NO, locked_ni);
>                 if (retry_err) {
>                         ntfs_error(base_ni->vol->sb,
>                                    "Failed to resize attribute list after=
 repack");
> @@ -252,11 +263,13 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni=
)
>          */
>         if (base_ni->mft_no =3D=3D FILE_MFT && NInoNonResident(attr_ni) &=
&
>                 attr_ni->allocated_size < NTFS_MAX_ATTR_LIST_SIZE) {
> -               retry_err =3D ntfs_attr_expand(attr_ni, base_ni->attr_lis=
t_size,
> -                                            NTFS_MAX_ATTR_LIST_SIZE);
> +               retry_err =3D ntfs_attr_expand_locked(
> +                               attr_ni, base_ni->attr_list_size,
> +                               NTFS_MAX_ATTR_LIST_SIZE, locked_ni);
>                 if (retry_err =3D=3D -ENOSPC) {
> -                       retry_err =3D ntfs_attrlist_repack(attr_vi, attr_=
ni,
> -                                       NTFS_MAX_ATTR_LIST_SIZE);
> +                       retry_err =3D ntfs_attrlist_repack(
> +                                       attr_vi, attr_ni,
> +                                       NTFS_MAX_ATTR_LIST_SIZE, locked_n=
i);
>                         if (retry_err =3D=3D -ENOSPC)
>                                 retry_err =3D 0;
>                 }
> @@ -289,6 +302,11 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni)
>         return 0;
>  }
>
> +int ntfs_attrlist_update(struct ntfs_inode *base_ni)
> +{
> +       return ntfs_attrlist_update_locked(base_ni, NULL);
> +}
> +
>  /*
>   * ntfs_attrlist_entry_add - add an attribute list attribute entry
>   * @ni:        opened ntfs inode, which contains that attribute
> diff --git a/fs/ntfs/attrlist.h b/fs/ntfs/attrlist.h
> index 1892a3934d3a..10cc2cc8e208 100644
> --- a/fs/ntfs/attrlist.h
> +++ b/fs/ntfs/attrlist.h
> @@ -16,5 +16,7 @@ int ntfs_attrlist_need(struct ntfs_inode *ni);
>  int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *a=
ttr);
>  int ntfs_attrlist_entry_rm(struct ntfs_attr_search_ctx *ctx);
>  int ntfs_attrlist_update(struct ntfs_inode *base_ni);
> +int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
> +                               struct ntfs_inode *locked_ni);
>
>  #endif /* defined _NTFS_ATTRLIST_H */
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index 197d8607fc63..6927d115d6af 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1450,7 +1450,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, lof=
f_t pos, struct page **pages,
>         ni->runlist.rl =3D rl;
>         rlc =3D NULL;
>
> -       err =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +       err =3D ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
>         up_write(&ni->runlist.lock);
>         if (err)
>                 err =3D -EIO;
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 8164326b7812..007d1614b9ac 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -111,7 +111,8 @@ static int ntfs_trim_prealloc(struct inode *vi)
>                         ntfs_error(vol->sb, "Preallocated block rollback =
failed");
>                 } else {
>                         ni->allocated_size =3D ntfs_cluster_to_bytes(vol,=
 vcn_tr);
> -                       err =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +                       err =3D ntfs_attr_update_mapping_pairs_locked(
> +                                       ni, 0, ni);
>                         if (err)
>                                 ntfs_error(vol->sb,
>                                            "Failed to rollback mapping pa=
irs for prealloc");
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index f35d6370e2fb..d1accde6d7c8 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2772,7 +2772,7 @@ int __ntfs_write_inode(struct inode *vi, int sync)
>
>         if (NInoNonResident(ni) && NInoRunlistDirty(ni)) {
>                 down_write(&ni->runlist.lock);
> -               err =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +               err =3D ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
>                 if (!err)
>                         NInoClearRunlistDirty(ni);
>                 up_write(&ni->runlist.lock);
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index f0656d0bbeeb..5b9723abb10f 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1131,7 +1131,8 @@ static s64 mft_bitmap_alloc_free_rec(struct ntfs_vo=
lume *vol,
>         return ll;
>  }
>
> -static int ntfs_mft_attr_extend(struct ntfs_inode *ni)
> +static int ntfs_mft_attr_extend(struct ntfs_inode *ni,
> +                               struct ntfs_inode *locked_ni)
>  {
>         int ret =3D 0;
>         struct ntfs_inode *base_ni;
> @@ -1152,7 +1153,7 @@ static int ntfs_mft_attr_extend(struct ntfs_inode *=
ni)
>                 }
>         }
>
> -       ret =3D ntfs_attr_update_mapping_pairs(ni, 0);
> +       ret =3D ntfs_attr_update_mapping_pairs_locked(ni, 0, locked_ni);
>         if (ret)
>                 pr_err("MP update failed\n");
>
> @@ -1340,7 +1341,7 @@ static int ntfs_mft_bitmap_extend_allocation_nolock=
(struct ntfs_volume *vol)
>         ret =3D ntfs_attr_record_resize(ctx->mrec, a, mp_size +
>                         le16_to_cpu(a->data.non_resident.mapping_pairs_of=
fset));
>         if (unlikely(ret)) {
> -               ret =3D ntfs_mft_attr_extend(mftbmp_ni);
> +               ret =3D ntfs_mft_attr_extend(mftbmp_ni, mftbmp_ni);
>                 if (!ret)
>                         goto extended_ok;
>                 if (ret !=3D -EAGAIN)
> @@ -1451,7 +1452,9 @@ static int ntfs_mft_bitmap_extend_allocation_nolock=
(struct ntfs_volume *vol)
>                         NVolSetErrors(vol);
>                 }
>                 mark_mft_record_dirty(ctx->ntfs_ino);
> -       } else if (status.mp_extended && ntfs_attr_update_mapping_pairs(m=
ftbmp_ni, 0)) {
> +       } else if (status.mp_extended &&
> +                  ntfs_attr_update_mapping_pairs_locked(mftbmp_ni, 0,
> +                                                         mftbmp_ni)) {
>                 ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",=
 es);
>                 NVolSetErrors(vol);
>         }
> @@ -1776,7 +1779,7 @@ static int ntfs_mft_data_extend_allocation_nolock(s=
truct ntfs_volume *vol)
>         ret =3D ntfs_attr_record_resize(ctx->mrec, a, mp_size +
>                         le16_to_cpu(a->data.non_resident.mapping_pairs_of=
fset));
>         if (unlikely(ret)) {
> -               ret =3D ntfs_mft_attr_extend(mft_ni);
> +               ret =3D ntfs_mft_attr_extend(mft_ni, NULL);
>                 if (!ret)
>                         goto extended_ok;
>                 if (ret !=3D -EAGAIN)
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
