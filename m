Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E690928CF5D
	for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 00:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383223; cv=pass; b=UZgbJYlsutybCvsjIxKzSuk5eE4EtU2xMTEjbzzQ9Qh/fMdXGqWwBowD4QKg6aIdocG1o3eFUEOUGaAtQpKlBPz4AJ1AoiRHG5IV8tfI1YqnOPSWMhB57EBeUffI+adntZ/osXf4WrdEwnuYhCxIFNQwvW23WpbuCUVAYGYFxJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383223; c=relaxed/simple;
	bh=7DhMjH5N5XF9fS/BZ2LJ2RF6dpiI+T0v4GppIEEpcxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h68hycJk1WxlV3s7mrRM1iuHJzdJobc6BSEcyNogRcI9I2iybOrtgdf+9+FTdyQ6Pd8haf81e9rvL4LD19Gc8O4Ha/j1Zmyl3lcnfUlYRjXuWysmFUGNDn3Xcqky9mIppwQYY5ltp4/lSXW3zbGHk5/z6MpQ8jordABwuU3Xmdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUrx+HfA; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUrx+HfA"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so1841917e87.1
        for <ntfs@lists.linux.dev>; Fri, 25 Sep 2026 17:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790383220; cv=none;
        d=google.com; s=arc-20260327;
        b=L5vaTh+2wz0ssSKTfyc3toPBo0DNNI7WXF0lPxCLWqNjI8OAvlq39VXiQwg8B1Xfbq
         j2b4mxNyOcb1Ffoj1uR73RW/JSuyjz1sKOIfoBnGKrrS8UUAZ6+aViFGN9v0hmu+Ld7S
         t34DWCXUi8Ne6nsm/Ai7xu816N//VEJ4mNMUsJ1cfA7IEU1kRsYtmTHaEniiypudOmwg
         ZNXPv542wXnzP48B2vKatWCsIRSVbsnC4GTpSdYE3DTxUn+ctC1uSShuwCeqDdRsjbRI
         Ld6+1/Zu/Kh3LbaQKjBWPbXklbLge6+TXAXZ0sVqDLSucIVynM/+QpW7AheXUGMxccrV
         Hd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+h0qP+4rWemeUOjKm/YX7VfqWwYMcqoZN/dAFFF/g10=;
        fh=28x5D01XW7IPsek3yuz78ipc7yntY3QtrC7sOGjFj9I=;
        b=QcLPFNEXcNu27gbV23pHBVJnfWBESdt3c2XhDQ0KwKVysLsnqT5q1wYvMsj0TrrNqy
         ef6eke5phZwpBiHOl+aENVxdI0N7K5tH2ftqR5eQvbmf2D5foB81FV5gIomIkrnu2B0b
         W6mbXpDOtG8+8CV6agaw+pWJydkRnhcvQfOGzdfRp+y3+Sv30O9HtmfD5vaiRHagnScu
         JdhC5lC1MzDFanK8BjvuLLVKuwcgJkaSITGLQewWQFkLKcyjsGZNLTK2LpPpG8+QTU+6
         aZ0PkYbEOd9ZkKI4mwZl79JNPy0/xUrc66t4eDHxtxY3ylyhfUDtjczaojptpdZTSfwe
         CsEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790383220; x=1790988020; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+h0qP+4rWemeUOjKm/YX7VfqWwYMcqoZN/dAFFF/g10=;
        b=qUrx+HfA+vQSTvmYMschRYGK87PHhPu0m3mSjLxoK1kbs38w7iFn/pTTah9bbbop/+
         P7giw+PF2HuaT2azUhiunRNcvb4UMk6C9i0ohmHzSJc055U3m3bgRKprGpgaK9yZff8Z
         znfbh7YsFpPGGD656I2mZpf1FG2WYrZHlRCwZzWWAexbK6yGfEsswnNn1fNm+Qfhp9vl
         8oJctoKmcjriTlLvSiqWIJbu0OR3Vr97tht7HTuYdYT31kqB32XCMoEYL2J0IhSy6tmL
         3t2PfWA+FVh97VBpM98i/EGWkHXVxUNOw6OshPy15mAt0HX42RgRV8F+ipNfXc2CIjwO
         Epqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790383220; x=1790988020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+h0qP+4rWemeUOjKm/YX7VfqWwYMcqoZN/dAFFF/g10=;
        b=LrwT2WFdWvIBiTxywDuzWzb7mJ8wd8M5xLYdQayL3b6fCDFpd5QL2SP6LeZOeaBBRE
         Tj539x60UXXdF17lIQhKg8ttoWUb9M6Hm+Dhuf1HWAxwNjbSK8aa8g8VQvhqs+VJYmwS
         WOBqV9rZ55C1JSwJd/hDfTwl+WslbanSqHVOcGChgvr2kk08xynrNjcE3BDP5wxr5l1Q
         14ezkWzWnQ8G9ig1nNqQN4ARgmcVbOJboJQCVZ8SPY4gtQ3i+lpIpXV4n/PeHXv9tdfI
         OkqJS5O+XJI/HhMjy4NlyLkLCgfE/TQfqMEEtyTkERKZ9h+g7ifWIRWF87yXTqOqlWjZ
         Qv8w==
X-Forwarded-Encrypted: i=1; AKwUvBzOC77mmohBYFbd1VnlDcPyK0by5YuY8c/tr/0Q79NgKqAi5wbqWSXNrVRHL0IM2utHzlx4@lists.linux.dev
X-Gm-Message-State: AFuF++l/KKFvgnVK5sGlLoszf1ukNtaa2zQjbxyluMiSEzSCZUFbNHH+
	BsmsaH20d/ZIgzX2nD1oCPBGug9eipADacokiTdcT/nIetWXsfxkueRWufuwNn6043epq9ViwKR
	CuiWkWwIXd3mKF2rwOPMRqu/0BuPcNqY=
X-Gm-Gg: AYBFou0AZoaBVYkul7OPjq+jIK21KFodv9brh3d30FyNGBQcSOP/Be8yHiNFswLTaw4
	bu+7sNUjK8SnBkXOuJNiSkcAOuanwCzZBdIHBVVTCcot6sDoRY10VmAni08V6zFNVoLdi2DZevj
	nzlXkdNC55h+JgFFiABwi5HsxenaRcseFI8D3RHiUzeAaI2iG3kHnLxX2ss0VYQP2DoWHIq4omc
	jS253RGBsbyQ2DoCw21DgBChgAKY4K8B4NYcZX7oteQJK5PjQ8qymsmLYt6mdEz2HHp1CFp24MR
	e7pHYZQ1sQXGQsSzbcMwEPtpub5l79swbknJW9wAkImL230U6ZV/fEkWjQ==
X-Received: by 2002:a05:6512:31c7:b0:5b8:9f19:7364 with SMTP id
 2adb3069b0e04-5b8df07a9bcmr2573880e87.32.1790383219836; Fri, 25 Sep 2026
 17:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924090102.2865942-1-liubaolin12138@163.com> <20260924090102.2865942-7-liubaolin12138@163.com>
In-Reply-To: <20260924090102.2865942-7-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sat, 26 Sep 2026 09:40:07 +0900
X-Gm-Features: AclHuK9mc2T88jTjIKmT1vyN9AocDUvztl6mV91kKlxXPPXrMVwNzXNOdi70g4U
Message-ID: <CANFS6baY+nbdzux-pF-MZ+8ryP8Q34RyO0Rh4qVR7rqvjsPHbg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] ntfs: report shutdown errors to fsnotify
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 24=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:02, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Notify FAN_FS_ERROR listeners when NTFS enters forced shutdown after
> FS_IOC_SHUTDOWN or backing-device removal. Keep the shutdown state
> transition and notification together in a dedicated helper.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>  fs/ntfs/super.c  | 12 +++++++++---
>  fs/ntfs/volume.h |  1 +
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index a7a7ecf9d074..a0d3934ef6c8 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -414,6 +414,12 @@ void ntfs_report_file_metadata_error(struct inode *i=
node, int error)
>                 fserror_report_file_metadata(inode, error, GFP_ATOMIC);
>  }
>
> +void ntfs_report_shutdown(struct ntfs_volume *vol)
> +{
> +       NVolSetShutdown(vol);

Could we call test_and_set(NV_Shutdown, &vol->flags)
to avoid races?


> +       fserror_report_shutdown(vol->sb, GFP_ATOMIC);
> +}

we can avoid test_and_set() to prevent race


> +
>  void ntfs_handle_error(struct super_block *sb)
>  {
>         struct ntfs_volume *vol =3D NTFS_SB(sb);
> @@ -430,7 +436,7 @@ void ntfs_handle_error(struct super_block *sb)
>                       sb->s_id);
>         } else if (vol->on_errors =3D=3D ON_ERRORS_CONTINUE) {
>                 if (errseq_check(&sb->s_wb_err, vol->wb_err) =3D=3D -ENOD=
EV) {
> -                       NVolSetShutdown(vol);
> +                       ntfs_report_shutdown(vol);
>                         vol->wb_err =3D sb->s_wb_err;
>                 }
>         }
> @@ -2086,10 +2092,10 @@ int ntfs_force_shutdown(struct super_block *sb, u=
32 flags)
>                 if (ret)
>                         return ret;
>                 bdev_thaw(sb->s_bdev);
> -               NVolSetShutdown(vol);
> +               ntfs_report_shutdown(vol);
>                 break;
>         case FS_SHUTDOWN_FLAGS_NOLOGFLUSH:
> -               NVolSetShutdown(vol);
> +               ntfs_report_shutdown(vol);
>                 break;
>         default:
>                 return -EINVAL;
> diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
> index 366e9f5d0443..648fe8991304 100644
> --- a/fs/ntfs/volume.h
> +++ b/fs/ntfs/volume.h
> @@ -256,6 +256,7 @@ DEFINE_NVOL_BIT_OPS(SymlinkNative)
>
>  void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
>  void ntfs_report_file_metadata_error(struct inode *inode, int error);
> +void ntfs_report_shutdown(struct ntfs_volume *vol);
>
>  static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 n=
r)
>  {
> --
> 2.51.0
>


--
Thanks,
Hyunchul
