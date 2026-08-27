Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4E62BE7DD
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 02:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787798643; cv=pass; b=ZHQ4KlVXsmfh61ile+datX89p8i+nhYQEWud5uq3DFSvhWEADecBwNM3vKDDHMGUYJWcyu7PoWCMXGty4ZicO9Dfze3PyhX2Gl2DVPrvExtahF4lFw8Wd8T4z5sNAKZqtEe1r44hnIwncQQU/bvvOLrp1lH0XCohau9A/tpjKNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787798643; c=relaxed/simple;
	bh=TTZYNnPP9NazSWxhID0pmfTudmtLXlSKGgVSNsokZpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYaHtFP4UNr/K/o5CnPFN9y+5iiB2+BnqvOT6xrMFId2d61aylxQUGaF6ntVRcECsa95rBGGnBb3w221qvSsHT9xxO4HUSYKj0E4ii+9hVCRmV/gUfKBiZxoUGa3f1vKYXPyk737T5DFV7lOFD/0Xa68s9M4vgOe8TRsC2Akkn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpoQPUAo; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpoQPUAo"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b4740ec30cso1382652e87.3
        for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 19:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787798639; cv=none;
        d=google.com; s=arc-20260327;
        b=DBy6E4T64Ole/YrvfbiOb9VmMNZDvx79E3vzvkiUgn4OOMwkkt/3rsM6QEmed4PKVj
         YXZ9doy51IcT9SdVUX70dMOyy9D6FoRsI4n84SoAQWP3Nklzw1HrrM2P7XHqxTjGrblj
         vLoo1HhaTD2mxbaUK9wvCcDATnSutgayynL9AN3XpECI/degs3SIJQwTJAvo0rgHPaRJ
         nVtICS1zuw4917k5GukG4QTbRxL0+VT1zG7OrvSNetcaHgbf+rsoqc+oqVDGSO1p3TJY
         QmLd8a8oeZuJ4FjWx1TjgwhOj3nRLtGBzBIqMLHL2c7cwy+7EVt/MpasWcvJwljm36gy
         YY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zqvJoTlziQDX70znP8ECNAInbQoTi/mvAJEVOqS/Uf0=;
        fh=om75fd11iq48OhXHfVrucieLunKmOfU9nz5AE6CxKHk=;
        b=npNpLkQ9oSxEOAWlSqsuCQI+L3suB28IicgXHk15xWPuY08xLn61ngjNo2q55Ne0WP
         G2AlB3rwwFGGQ9LMkjYW8933Uvwa90VSTSinMyPKm7oltaJVTl6gyco1RjrYPY4OTmSq
         AZEpC9QYt7a+j1oCDxRh32JvKmpJBaoaTSVen9CEsZO2JAfTCK0reUqYBs1Azw3BrVFq
         ebi39JP3Yn28fRR/2KiXCXCY+iXwTeCIZjkdTr2ja7muE40vEjW/vOlDFcvhzO5kfJdB
         C+m0t+nnOtBqSJgjCHXPgw0zUWwJbZSSjfNpzbaRw6defUll8CMSsIIST2dAakpqy+R+
         dJ3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787798639; x=1788403439; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zqvJoTlziQDX70znP8ECNAInbQoTi/mvAJEVOqS/Uf0=;
        b=jpoQPUAoSIX/xxY4pBB4SWAUmZYP77dY04cHFtZHl2XQSjb2aUplQeWN28jNCZjWl4
         jQkqCKvGJxh+JiYuAZfJFk7Z+05FnNB6bGnRmldkQgbGMTcOuJjkJkkMks6mwHwtAp5o
         +Wt1jv8mm6RniXDFCskhexAAUvaX/WtrXju8b3iGGJew0j/m4QwqZzKxJvNCuhFSQSzv
         3U9bkZFsiT5cEhYdgbG2wb75wMtpdW2wxBOQmcqBQMu2AmZqEF/BaC7az+7NQgSR3B0g
         mhyeupOn1Pm8SMCTrbKWMSfx85ya76TAHz1zJx7vbZZcyA2MaoqCiHdLoDCKWAqTbtA9
         LYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787798639; x=1788403439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqvJoTlziQDX70znP8ECNAInbQoTi/mvAJEVOqS/Uf0=;
        b=VIBcxDFXNw0cDn+NKVsUD+DdH3ynBMvKxevzn4wuptt/ry4D/tN+QqUVTMKb9jwDmy
         i8tY77OJ4C4QvunA7BJn7JcNO0gR/sAxQeHwj7QC61aWsIc5Q4rqx9YlXlOSIdy5QpeI
         bjVMD+8sz/2DgiyTVBgyIIlXSO3sH8FQv3PHNnp+6Bv32cH2iPgTJp1ptQ2md/9Dvv8E
         rDmWUiS9JAias3gTqAcirMMhlAIB7muNjO7RqQXOfsyeT7LPpxUBVO7dZS86lsE3dnJB
         kNtIxUa6ME9hprtbTbB++sFLgE7AF9D/5hPNz4ksJkyrPH8mPmJ/vlRDeQ2Et5zNG3pv
         qibg==
X-Forwarded-Encrypted: i=1; AHgh+RqPl2q7AzIja1DJH5nX5LuaeeofOr3kKzS8nyM1RTqTjuogMWQNTeMwhkXuWkFjQuYq+PWX@lists.linux.dev
X-Gm-Message-State: AFuF++kXyaZnZ7QrLkx1bSMjmNJ/RSUatycmBuHylXDi208VDyVhsk6o
	LASHuF2OnAQ9P7RtxdSddHIs43qH8j0UZeWx97HvEYy+RXwEtG77q+1+e/2xNqAzf52CnnYWRS2
	qUoZOtsTRsW6plFhIqC9+02KPmBfRUl0=
X-Gm-Gg: AR+sD11BFfjqUYd5DOjNSH1l1MyIS4WdfirITPDfmcetzhOuS0JfdqcGjR2GNr9ot5n
	DwXI/Zt9LR3pbAta+hsurPbi9HBlaqmeAGI7hCb749sDky5iqX/91eheP1fW0ddO0rXQmuNyUBE
	50Q0qjG1bqSBL0K7FFFM28B/wUScGITBTT15w8+R4CuWZGL7ssIlpwW4q57iS6ySVi+X5lIUwTe
	uJIb92XTmPuZ+qdgrfETxlT++uNZ/EVPYFhCV1AstS7WCJG5TkiS2Esfn8gsS7Vw46XN+iBPnMh
	iDalv0vQMUEXUYY2jFPTV2KkK8XorSexYiU3ItENYlNj
X-Received: by 2002:a05:6512:10cf:b0:5ae:b969:417d with SMTP id
 2adb3069b0e04-5b4a8e672f0mr3686763e87.0.1787798639149; Wed, 26 Aug 2026
 19:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260826054204.1364589-1-zenghongling@kylinos.cn>
In-Reply-To: <20260826054204.1364589-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 27 Aug 2026 11:43:46 +0900
X-Gm-Features: AcwNN1UkaDT5W_Z6HI7OoA4IkQTjvljt2A2kTCf4G4MSGG4h02_YbW9SMmzlD1E
Message-ID: <CANFS6bbVZ3jZa+a8FTjz1w3RuPvFTgjfBh134J4a-9fK549UxQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix race between fallocate and mmap reads
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hongling,

2026=EB=85=84 8=EC=9B=94 26=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 2:42, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> The fallocate implementation only takes invalidate_lock for punch hole,
> collapse range, and insert range operations. For standard allocation mode=
s
> (mode =3D=3D 0, FALLOC_FL_KEEP_SIZE), the lock is not held.
>
> During ntfs_attr_fallocate(), new clusters are mapped to the runlist via
> ntfs_attr_map_cluster() before being zeroed by ntfs_dio_zero_range(). Thi=
s
> creates a window where concurrent mmap page faults can read uninitialized
> disk data.
>
> Since mmap uses filemap_fault() which takes invalidate_lock in shared mod=
e,
> it can fault in pages during this window and expose old disk contents to
> userspace. This is an information leak and data integrity issue.
>
> Fix by taking invalidate_lock for all fallocate operations, not just for
> punch/collapse/insert modes. This prevents concurrent page faults from
> accessing unzeroed clusters during the allocation window.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  fs/ntfs/file.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 88747217ba61..6958a1469fb0 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -1153,11 +1153,9 @@ static long ntfs_fallocate(struct file *file, int =
mode, loff_t offset, loff_t le
>         }
>
>         inode_dio_wait(vi);
> -       if (mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
> -                   FALLOC_FL_INSERT_RANGE)) {
> -               filemap_invalidate_lock(vi->i_mapping);
> -               map_locked =3D true;
> -       }
> +       /* Take invalidate_lock for all fallocate operations to prevent r=
aces */
> +       filemap_invalidate_lock(vi->i_mapping);
> +       map_locked =3D true;

map_locked can be removed.
Otherwise it looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>


>
>         switch (mode & FALLOC_FL_MODE_MASK) {
>         case FALLOC_FL_ALLOCATE_RANGE:
> --
> 2.25.1
>


--
Thanks,
Hyunchul
