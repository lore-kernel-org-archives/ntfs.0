Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087693BB131
	for <ntfs@lists.linux.dev>; Mon, 31 Aug 2026 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158343; cv=pass; b=l6lVB0W0s/ODnAm7PnLJ+k2rYSvZQ0f65SOW9C2I9AAyqkp+TG/Cy8VSpTNXaFWPb4rNdaVAwGdtfONDNWLmFeozD6u6zVzX9yjy/3WeBxwHov++FQl9hRB1oRGUn53wI0K3fmb1ER9d8h4YD66B1NyyLkFVusmmRHwqQpzN0+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158343; c=relaxed/simple;
	bh=WyFxXTxnrLGLJIPSIqsrO/ZcpicbyLFQnZGYq3EeUtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4/pAXHxhouM5Ok1bd7qxS4ybIFxdBLDD6zamhteCiR5mdfJE94OyF0LEJfLaTYwpsV6+lYLZb9jj1//LIWWxhS0aoPOnKk2FaOMFSDUZF58k+a/l5tzFkXPwMOfN44Y8KZzOkmHrgLOR2WxXhH5Cj9GlhREfpiI4TWihOeEEBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDCeAK4w; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDCeAK4w"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b4a95ab94fso4036566e87.0
        for <ntfs@lists.linux.dev>; Sun, 30 Aug 2026 23:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788158340; cv=none;
        d=google.com; s=arc-20260327;
        b=HHdU+A76Yd0TrjYC2pbWbrlmT0eAvg5c0NXDgAzV9UVDcEd8t/Tyee5xSQxbgOUwGj
         AoVDev5ZXHOiDTFamdsieG6owq/mHztJ5T7zQEiLzGTn8EiWD8yusa0rbLaByLXq/B9t
         Y4M3NoTnJj0ROaGdD/5lI8khXRvgj6jUj5b81rOjuvvk4P7Z/51BC7QJT8dZ9SzIa0Or
         ZiI8GeSGecqICiTC0h4/RtRCcTi5HdohiGXu1nwlQp/Or1a/bkTOEkz/kur+KC8Li3cv
         Hd3EDUHjnQpMxPgzK9V0GzqNJA7Ya21sAefD+50TxmblAuQdNnqy9Cg2TT3C/U6xFzhR
         D93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LcRf9fmLOAPhyUnEka3JXX5kuV18LOZCrKI4V5sQVg0=;
        fh=eCuByXraHnxsTUeZOEo1xCpR7lhDVJ6kC4oTOklx0IU=;
        b=kJyovHnr0cVGw3u7WLqqC3shicw9MRisst6vq6tzUg/F/ebDJWqbfnC38ZCM2I/K4A
         FXn+IFp8WlVOJf2GBw5VG1mdBx0mItdHvEHCNEOrumpMuAOetcxuxqW5TXZRI4tWzIr/
         SWVQg8ZzRDwbnuCwANczGi4KTpkXh4rfCcFOrW8bNLVaZDX+xRnj1AHwUMRAfBF/do87
         wkjRoT/IpbMdQOJa8/xpzUXYxbkUi5taSALFwXIHzEP57PO3mCOPnRGs3cmCCiJFmF33
         nxaZDjvnp7rjqkwB+JrLDo0MN/g/IZkWUQEsViQuRAXH2Lp4CvPp9/9Mr9tCN6ZUCqjV
         wvaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788158340; x=1788763140; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LcRf9fmLOAPhyUnEka3JXX5kuV18LOZCrKI4V5sQVg0=;
        b=TDCeAK4wBbY92hHE7f0056wECmuD2Qkk9WxLKr5FoHywKs9Z53ZpP4pCXXqdHVehOR
         8PBAYmo8pbjkJWP2GzN/5KjD760mJlrgj8lSwhfJr5S/4Yi2to7oyVWnLrDH2kG/+vNa
         lRmuxzzHLVbz9AyalksHxZ0j1im13mBglgSyp4oo7SujU72f0h+siule7JomjRfF2mdC
         4By7EBQwROATadWwLivtIxwrl6sCk7QSHwDhT0/ZHsEzdeM91qzwwUZks1XlSTxN1KyN
         scbEoYRSCynYuThSZXBQJsK9MIocwsqUrDZyHbcIOoBIAbPeTTnkwOX23sGYksIqmWcQ
         7Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788158340; x=1788763140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcRf9fmLOAPhyUnEka3JXX5kuV18LOZCrKI4V5sQVg0=;
        b=sotT7VOJ8oc7Mim5Is5Jso45sPqRIeC498cH+K301bIfIdUx8BR2WO+s0wSB4dXYF7
         YsKkRfAcdSJodGaQSsI3TbQ5sgHlYdccwA2eo52PQQtjwdErHGOmgcC/gyHAIakbQdzH
         Ucc9WKMhMSP2QgCIeQJv3uXzSK2JUMDVSj79VZ+3fUI3NBCY/ex95BHT/x/AoBUewdva
         TiuAu0XXe3uYglUUM8dwbtROFn+LjkUeZwV1SfTbD0v/nAjVEsyJVVcxCUx8eaUsnQc8
         X5LRyc5taoZmXz1+aYfZvP1y+sgN0EY0gRffT5VrPcf7ATXIBQebrWRc3q2pyG03SsGl
         boHQ==
X-Forwarded-Encrypted: i=1; AKwUvByBQDQBZNh6DHmPgYSrjdeqOB5tpSAE3SDCQJ7woe6SpruKkOEHU1fKhE/hR0z20svAzxJo@lists.linux.dev
X-Gm-Message-State: AFuF++mn2ExSAmLGvk34FUvjk+1uZaQbCHwjnfYfmt1CT/t6WqfAKRdV
	0QIuDHn1172L3RkIzQICWAZP46zS5b8/DqmsrR04Y8LnCo0U+xn3fG+7uTuf+gbwedmLUCxLm8p
	GyNPClr5tZbmhroK3Zd0V292BhlqsYqw=
X-Gm-Gg: AYBFou2K9xHTh6JEtqsts1yOGelvpsRRXiSKjBMtv9IC7MDDEsVxQ47Oq0dHIw6Ni6r
	N9UFQaE4ibO7xWicABGzIKQA0nPOYsD90iVmPh59BZpKHsRrdFN/qfAjjgIWat/GZYQAXMmBdX0
	SAiTcj4Tb/oT1TqyYinwqEs2gRcuE9GEjW+0qnrC5S88ejFNzCHn2oZYCLLRoTJKcADnckufO78
	t4kCKndszPVviahbH9ffGFPx9nRakup7ytdxE7tjmTEqYorzaP+JN6d19MuYr8BqDj1qDJb1j4T
	ybZBrmiiXYFi12SnIIIDGAbSBIwvpaxKu7S/ZIhKL92C
X-Received: by 2002:a05:6512:3d1e:b0:5b2:c068:3530 with SMTP id
 2adb3069b0e04-5b5f616282cmr1297039e87.13.1788158339788; Sun, 30 Aug 2026
 23:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260826122734.2129830-1-liubaolin12138@163.com> <20260826122734.2129830-2-liubaolin12138@163.com>
In-Reply-To: <20260826122734.2129830-2-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 31 Aug 2026 15:38:47 +0900
X-Gm-Features: AcwNN1XIYNyCC_MFAJzGJp5h0Y1cJmsJQmPRtCCMs6JhV8AVEh2oRugaZInCA9o
Message-ID: <CANFS6ba-=yXwSrA+NGnnZ84Yffmm-gNrAWEWpyjdC5fazWSXxw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ntfs: report volume errors to fsnotify
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baolin,

2026=EB=85=84 8=EC=9B=94 26=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 9:28, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> The ntfs driver reports volume corruption only to dmesg. Wire up the
> generic fserror infrastructure at NVolSetErrors(), the point where the
> driver concludes the volume metadata is inconsistent, so that an
> FS_ERROR event is emitted as well. This lets health monitoring daemons
> watching the mount with fanotify(FAN_FS_ERROR) learn about corruption
> without scraping kernel logs.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>  fs/ntfs/super.c  |  8 ++++++++
>  fs/ntfs/volume.h | 14 +++++++++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index cd8fa2c13370..5229eb27bb30 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -14,6 +14,7 @@
>  #include <linux/sched/mm.h>
>  #include <linux/fs_context.h>
>  #include <linux/fs_parser.h>
> +#include <linux/fserror.h>
>
>  #include "sysctl.h"
>  #include "logfile.h"
> @@ -330,6 +331,13 @@ const struct option_t on_errors_arr[] =3D {
>         { 0,                    NULL }
>  };
>
> +/* Mark the volume as corrupt and notify fanotify(FAN_FS_ERROR) listener=
s. */
> +void NVolSetErrors(struct ntfs_volume *vol)
> +{
> +       set_bit(NV_Errors, &vol->flags);
> +       fserror_report_metadata(vol->sb, -EFSCORRUPTED, GFP_ATOMIC);
> +}

NVolSetErrors() is also reached when some functions
return -EIO. Could you preserve the original errno?

And in some situations, fserror_report_file_metadata()
can be useful instead of fserror_report_metadata().

--=20
Thanks,
Hyunchul
