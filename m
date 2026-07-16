Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5452A311C15
	for <ntfs@lists.linux.dev>; Thu, 16 Jul 2026 22:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240903; cv=pass; b=XW9U8T0774kYCxRGi0wlBN7SUFyWrYBp0FT3y5LLnZasW69hIUci67vxD5AGYl0jZUaoez+wM7SPofNar+uyYAquPsie0KjMxNG3QAMBO66cr5rD8/nek+QhgvlInJz2my9LJue+L7ypwK94TXtOwOAzjvNSQNkUryqNrvnigys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240903; c=relaxed/simple;
	bh=Je6aQ3hubYZvF4CBtKnhLX/7a5xpLCw3wIWDc5Zc2pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Esn69SlbVSgZv8lGdnATUB6SMKScJfNoPXy00vwJuQCvzedo5ZoVRQSbIhTM1H+QYdYxfFPWhCu6iSj4Jhmzd1LW33x8Sqf1unVs0cJIZYUq5mGnIiREq/Td2lccoc4P5VEtUJ4lxibH+Pho3WksDmR9y049a9pHrUWn668mEXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8oM7w18; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8oM7w18"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeae771c49so8283569e87.3
        for <ntfs@lists.linux.dev>; Thu, 16 Jul 2026 15:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784240900; cv=none;
        d=google.com; s=arc-20260327;
        b=Xw2hTXznXAm4J60P7eQjJKOmNGZMbBa1AeVHCQbLTlKdlW8qYWpautw3Q5jgWEsQto
         VrceWWHrOhk36ypfQtmWsDZC9k8wQkFSen6QrwaMKZP9TS1Jvt354KDQgP05Ntg0/nxG
         gKVRQNPqmpLuz3x13C5n6nr1nTGvmisd7N15SHneb2mFdx1OjdHD3y/vaYKsOFnPgcXr
         8bkubv7Ohv5hXuXckVDmAsmD+vhA9D5z9gK9nOmysYWnU3+MZcrCHFqu3FQ/4FYv8uPD
         olcBCjpbJ7E9hw+Nopq+csegPk9wRh6mX8a3Avz2qs82dLmgtYL/tM8TZn1UhaLJzTXu
         wnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2uCXsit0r17pAw3e5BISZpUm0yZauVn7n3lIhTdijsM=;
        fh=mgLCjrAE0uxzwsGYKz6SaNYZVNHieaxuEHuKwftvBIM=;
        b=OFnasxjCmOkEqmZPU3QiBq9uNZLrrCYOirRYBHorddf06t6r95arvalRMhhoTzzwSZ
         /TYUFec4NtN5dgMi/1MK2zn3kBLA1QCT9V97oliQvTvMtZuQ7eGvEdL7Fft6UBNesNzM
         9qdxDEvP7Ur7gPHGRccW/WvzTZTndepaopwgiLB6J4ykl3P0tVWcOFppIQATweB9hde5
         Buz4GT7oDHkmwGz9Lk8cfgRdQ8jHd83rRT8f4mzRsEUwibLkwZoh2TVFo/rByfBeOywK
         KVd8rZnepYnKj7J20w/n/VwAH9uzTEAMh4YdztjDDAjbaQUxVunkZoLgWycjLM7zj2nv
         yh4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240900; x=1784845700; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2uCXsit0r17pAw3e5BISZpUm0yZauVn7n3lIhTdijsM=;
        b=c8oM7w18xRmZ/TMbnGbZkw+8XfYeIuRSE7Anzm0SJ5k8x0jGsBg8xuEss+yWW66fh9
         MaoAGHE0NATcDMgixDtlj5Jrx7A4V7qAyRIpTKWM1xst/GKGKeNeQDVBfdlksJHE1wOv
         bZi9xOGPNFj/rcLz80p9S3JJXeHOUKj6Jx3pSs6m1HdwH/m7SgtMn19IODDImQPe1IGx
         QMtAlAetR9hm5Edx6Qg6aQ071EqCAcNOCfoWPHgBwiPdmg+0h7X44YviNYP3u4tad4YU
         27NAqntFUeXmf8b8eCuvt0JhiUFtmHeMKqso6YGyDHz1jwrxq8xt8s5x2f15NPJQvRBX
         V0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240900; x=1784845700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uCXsit0r17pAw3e5BISZpUm0yZauVn7n3lIhTdijsM=;
        b=eHglU4BnJmdEf7GM/v5yiQX18hXgsLBwNBYYvLSyj79kZyo/BUYR4zaPBOcpIz8LYV
         8jL7yJMEQB26iXMpf/BRBU8ADQKmhBh7KqHq0wIrq4595T73QoUsDCevHJHWDaXqcbGI
         4dYhnmO7yPbRip2Bz3PBvFsJRsWXIeyqvYZEM113oKO7ikXYjXdXfDFeS17Er1KazcMq
         oPBmrgA068pcrhnUZyzCsUwT2HsEyiHcv6yfVMZe+6+njb7W0IKKVxsm5yjLMfpRjtdn
         MKF8fujgQdF3HvMMWuUFuri/X8/ZBVdg/9ahS+RwdQpvF4MbRbzuWS5SdodoY5XHftkX
         Lipg==
X-Gm-Message-State: AOJu0YzdfHOStkN86X5BE1dfTJYO49xjdLv8jmiMV72x5slFk7W1rRmB
	WvZygphg5Wv3Y0ZuQTOg2HCpJJhuBekA3av3gOR51kt7jrMk/rIlqp/UmzeyRonJHcQ3ggFItvn
	kBvA/5XC6lzvyKn0QurSxS35LyCo3YSA=
X-Gm-Gg: AfdE7clZuq0a4ao7aioU9BqSvj89XYIBi8C0Cm6ejjKc3/A0fS2wHGUE3/0sORj3/Gv
	AvKbOiR7EDH7SiXJcBZHFkitrJ7wMMYkaSomICj97gzY+zS4HSb2yk9kdosyCO9Zp8cWS4lX///
	LDxtxOk9OeQsXyv4/5036Pp78zWhMIncO2xgUqQDemj2OW7gYmwgLJ1cW4VNTXps77KuhQiCaX+
	yg+yi4xxDo/ox2hlCkAG3GUkuK1T5V6TnrZGRQm9S72bJ3zByVIKkzEB0QVPpJ5Zdkem1Os5g==
X-Received: by 2002:a05:6512:12c6:b0:5ae:b019:af66 with SMTP id
 2adb3069b0e04-5b28f9a5715mr10166e87.39.1784240900224; Thu, 16 Jul 2026
 15:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716024640.13396-1-linkinjeon@kernel.org> <20260716024640.13396-5-linkinjeon@kernel.org>
In-Reply-To: <20260716024640.13396-5-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Fri, 17 Jul 2026 07:28:07 +0900
X-Gm-Features: AUfX_mwFG6o7mIxUT1QKzGcpr4iO6bp1kr3P85DOBuLU2Ufxk1iLhtCWB3HSzyw
Message-ID: <CANFS6bZtvqDd+mGA9B1zJkCUXgHm_CvjkAfU8GP0gBKLS0r05Q@mail.gmail.com>
Subject: Re: [PATCH] ntfs: file extension before write submission
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 7=EC=9B=94 16=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 11:47, =
Namjae Jeon <linkinjeon@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Prepare non-resident file allocation and initialized-size extension in
> ->write_iter() before entering the buffered or direct iomap write paths.
>
> Previously, the iomap write callback extended initialized_size. When a
> direct write started beyond initialized_size,
> ntfs_extend_initialized_size() used iomap_zero_range() to zero the gap
> through the page cache. This created dirty folios after iomap DIO had
> invalidated its target cache range. The bsync path then had to
> synchronously write back the entire zeroed gap to prevent the post-DIO
> invalidation from encountering a dirty boundary folio.
>
> Move allocation and initialized-size preparation ahead of iomap submissio=
n.
> For DIO, kiocb_invalidate_pages() now sees any dirty boundary folio creat=
ed
> by iomap_zero_range(), writes it back when necessary, and invalidates it
> before the direct I/O is issued. This removes the explicit synchronous
> writeback of the zeroed gap while preserving the required boundary-folio
> ordering.
>
> Keep compressed writes out of the early initialized-size extension so the=
ir
> existing write path can zero uninitialized data before compression. Move
> compressed-file allocation expansion to write_iter as well, eliminating t=
he
> now-redundant expansion from ntfs_compress_write().
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/compress.c | 10 ----------
>  fs/ntfs/file.c     | 43 +++++++++++++++++++++++++++++++++++++++++--
>  fs/ntfs/inode.c    |  6 +-----
>  fs/ntfs/inode.h    |  2 +-
>  fs/ntfs/iomap.c    | 34 +---------------------------------
>  5 files changed, 44 insertions(+), 51 deletions(-)
>
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index e866f43ca30b..fe1877b86f49 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1459,16 +1459,6 @@ int ntfs_compress_write(struct ntfs_inode *ni, lof=
f_t pos, size_t count,
>         size_t written =3D 0;
>         struct address_space *mapping =3D VFS_I(ni)->i_mapping;
>
> -       if (NInoCompressed(ni) && pos + count > ni->allocated_size) {
> -               int err;
> -               loff_t end =3D pos + count;
> -
> -               err =3D ntfs_attr_expand(ni, end,
> -                               round_up(end, ni->itype.compressed.block_=
size));
> -               if (err)
> -                       return err;
> -       }
> -
>         pages =3D kmalloc_array(pages_per_cb, sizeof(struct page *), GFP_=
NOFS);
>         if (!pages)
>                 return -ENOMEM;
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 6a7b638e523d..9061f8f77f7e 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -535,6 +535,31 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *ioc=
b, struct iov_iter *from)
>         return ret;
>  }
>
> +static int ntfs_expand_for_write(struct ntfs_inode *ni, loff_t end)
> +{
> +       struct ntfs_volume *vol =3D ni->vol;
> +       loff_t prealloc_size =3D 0;
> +       int err;
> +
> +       if (end <=3D ni->data_size)
> +               return 0;
> +
> +       if (NInoCompressed(ni)) {
> +               if (end > ni->allocated_size)
> +                       prealloc_size =3D round_up(end,
> +                                                ni->itype.compressed.blo=
ck_size);
> +       } else if (end > ni->allocated_size &&
> +                  end < ni->allocated_size + vol->preallocated_size) {
> +               prealloc_size =3D ni->allocated_size + vol->preallocated_=
size;
> +       }
> +
> +       mutex_lock(&ni->mrec_lock);
> +       err =3D ntfs_attr_expand(ni, end, prealloc_size);
> +       mutex_unlock(&ni->mrec_lock);
> +
> +       return err;
> +}
> +
>  static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter =
*from)
>  {
>         struct file *file =3D iocb->ki_filp;
> @@ -543,7 +568,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb *ioc=
b, struct iov_iter *from)
>         struct ntfs_volume *vol =3D ni->vol;
>         ssize_t ret;
>         ssize_t count;
> -       loff_t pos;
> +       loff_t pos, end;
>         int err;
>         loff_t old_data_size, old_init_size;
>
> @@ -580,10 +605,24 @@ static ssize_t ntfs_file_write_iter(struct kiocb *i=
ocb, struct iov_iter *from)
>
>         pos =3D iocb->ki_pos;
>         count =3D ret;
> +       end =3D pos + count;
>
>         old_data_size =3D ni->data_size;
>         old_init_size =3D ni->initialized_size;
>
> +       if (end > old_data_size) {
> +               ret =3D ntfs_expand_for_write(ni, end);
> +               if (ret < 0)
> +                       goto out;
> +       }
> +
> +       if (NInoNonResident(ni) && !NInoCompressed(ni) &&
> +           end > old_init_size) {
> +               ret =3D ntfs_extend_initialized_size(vi, pos, end);
> +               if (ret < 0)
> +                       goto out;
> +       }
> +
>         if (NInoNonResident(ni) && NInoCompressed(ni)) {
>                 ret =3D ntfs_compress_write(ni, pos, count, from);
>                 if (ret > 0)
> @@ -655,7 +694,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc=
 *desc)
>                            from + desc->end - desc->start);
>
>                 if (NTFS_I(inode)->initialized_size < to) {
> -                       err =3D ntfs_extend_initialized_size(inode, to, t=
o, false);
> +                       err =3D ntfs_extend_initialized_size(inode, to, t=
o);
>                         if (err)
>                                 return err;
>                 }
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 7381a18cfadd..50e244aa372e 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2401,7 +2401,7 @@ int ntfs_show_options(struct seq_file *sf, struct d=
entry *root)
>  }
>
>  int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
> -                                const loff_t new_size, bool bsync)
> +                                const loff_t new_size)
>  {
>         struct ntfs_inode *ni =3D NTFS_I(vi);
>         loff_t old_init_size;
> @@ -2428,10 +2428,6 @@ int ntfs_extend_initialized_size(struct inode *vi,=
 const loff_t offset,
>                                        &ntfs_iomap_folio_ops, NULL);
>                 if (err)
>                         return err;
> -               if (bsync)
> -                       err =3D filemap_write_and_wait_range(vi->i_mappin=
g,
> -                                                          old_init_size,
> -                                                          offset - 1);
>         }
>
>
> diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
> index 9aacd5787ffe..c6d065aaecd5 100644
> --- a/fs/ntfs/inode.h
> +++ b/fs/ntfs/inode.h
> @@ -352,7 +352,7 @@ static inline void ntfs_commit_inode(struct inode *vi=
)
>
>  int ntfs_inode_sync_filename(struct ntfs_inode *ni);
>  int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
> -               const loff_t new_size, bool bsync);
> +               const loff_t new_size);
>  void ntfs_set_vfs_operations(struct inode *inode, mode_t mode, dev_t dev=
);
>  struct folio *ntfs_get_locked_folio(struct address_space *mapping,
>                 pgoff_t index, pgoff_t end_index, struct file_ra_state *r=
a);
> diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
> index 52eecf5cb256..26a1831a2c18 100644
> --- a/fs/ntfs/iomap.c
> +++ b/fs/ntfs/iomap.c
> @@ -675,21 +675,7 @@ static int ntfs_write_iomap_begin_non_resident(struc=
t inode *inode, loff_t offse
>                                                loff_t length, unsigned in=
t flags,
>                                                struct iomap *iomap, int n=
tfs_iomap_flags)
>  {
> -       struct ntfs_inode *ni =3D NTFS_I(inode);
> -
> -       if (ntfs_iomap_flags & (NTFS_IOMAP_FLAGS_BEGIN | NTFS_IOMAP_FLAGS=
_DIO) &&
> -           offset + length > ni->initialized_size) {
> -               int ret;
> -
> -               ret =3D ntfs_extend_initialized_size(inode, offset,
> -                                                  offset + length,
> -                                                  ntfs_iomap_flags &
> -                                                  NTFS_IOMAP_FLAGS_DIO);
> -               if (ret < 0)
> -                       return ret;
> -       }
> -
> -       mutex_lock(&ni->mrec_lock);
> +       mutex_lock(&NTFS_I(inode)->mrec_lock);
>         if (ntfs_iomap_flags & NTFS_IOMAP_FLAGS_BEGIN)
>                 return  ntfs_write_simple_iomap_begin_non_resident(inode,=
 offset,
>                                                                    length=
, iomap);
> @@ -705,28 +691,10 @@ static int __ntfs_write_iomap_begin(struct inode *i=
node, loff_t offset,
>                                     struct iomap *iomap, int ntfs_iomap_f=
lags)
>  {
>         struct ntfs_inode *ni =3D NTFS_I(inode);
> -       loff_t end =3D offset + length;
>
>         if (NVolShutdown(ni->vol))
>                 return -EIO;
>
> -       if (ntfs_iomap_flags & (NTFS_IOMAP_FLAGS_BEGIN | NTFS_IOMAP_FLAGS=
_DIO) &&
> -           end > ni->data_size) {
> -               struct ntfs_volume *vol =3D ni->vol;
> -               int ret;
> -
> -               mutex_lock(&ni->mrec_lock);
> -               if (end > ni->allocated_size &&
> -                   end < ni->allocated_size + vol->preallocated_size)
> -                       ret =3D ntfs_attr_expand(ni, end,
> -                                       ni->allocated_size + vol->preallo=
cated_size);
> -               else
> -                       ret =3D ntfs_attr_expand(ni, end, 0);
> -               mutex_unlock(&ni->mrec_lock);
> -               if (ret)
> -                       return ret;
> -       }
> -
>         if (!NInoNonResident(ni)) {
>                 mutex_lock(&ni->mrec_lock);
>                 return ntfs_write_iomap_begin_resident(inode, offset, iom=
ap);
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
