Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000D9367280
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 01:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040114; cv=pass; b=PeaxE8g6tsO2b7jfqIE/06DEgn95tfXj2kPVIm9eK6H6nymjV1ru8vHXUWG97XUT5Rcm+GdNZ4omhDxfof+mGJXxYk4hXnLUVrNqL0L0PBL2h3RUaRizSd3NIepRYTMa/9OXzhPQNxTS950KHEvbrkBj3zLZblAaDx+B2LAB/bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040114; c=relaxed/simple;
	bh=N1A983/LxqhohjEiRubjtynAdQa6afHlF4xCdSbHwwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzV8qFVbIKmqPM3mimX9s8y5AWEia2p/lvmWZE/Ur+Xi+DDqpgHZE7snnLo0lkwUjVRYdq5f5C8fDvFRrFXl2YQJ0EWh+c1L8VB4E+WZPqofdQCyYXlKu7hH84jCUd4yPKmkL9sjcdxyCQikRPE0uf4oD0kxKStpoJS9jtz43Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeACvt9O; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeACvt9O"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c7a1aeecso2487828e87.3
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 18:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790040111; cv=none;
        d=google.com; s=arc-20260327;
        b=Ut88e3AMVKGBXznq0urT+4rrM3sQsoT2bM2rEmN0LS5SR3/8dz86X5IdheDzsmw3Ie
         s6giFaxSG9QsMjfYlNn5Kwn6qWH6C+BDq4DxG3ohv6F/c2mFfQYmnMQDr/a9L7mpODFZ
         ssEXv0eykyEPmg86WFvpc16KFWwTI+bF91WhSf/18AMXlmsJC/PHH82se8FOl6SbtlZJ
         sxKvSi0lb0Aqvj83281TSgwq9Y4ie5+//KPukMpSle5U/wug/nCYVLjOR6wBCAsO8eKh
         JhCI6tG4kLgv9Y5qJwnT58fWs0V34Fou4FxOwSWaoW1ia9KDUjFCigSKOQXk8xHPJvFU
         zjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N1A983/LxqhohjEiRubjtynAdQa6afHlF4xCdSbHwwI=;
        fh=mE2AMWkfLPg33MAjDoSiRH9ta+IzBQAToPT7PBEzfH0=;
        b=RZ61ksXCsibhjQyq/GhBEbvsiWzkd5IpsitLJtZTTiEQgtKwiOIqq6L5wxugybG15o
         vrfqVg6v6UXjINMq8qPHGI5gv9Nlj7AaxVX39tLDJ06NaZes959TrmmIsgG/xnQmm4eV
         jXGJfyZuMkF/kIp9NTrREcYEbFpDDiem4WRV53YItFoN5MsMFyCfhhoPywrRCOQMQd/X
         CF5rBkbjQtnXRkIz3gqyaq6NP0V2o+TOqhba1lm2eKThvqosLbvSbb+lBowNHe9H12yv
         ycekOati5cdsZBpAs0dphGE2iZnuXjRnyFpHkeBivBbggRsw5vru/TMZAoXon1smzhT1
         W5sA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790040111; x=1790644911; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N1A983/LxqhohjEiRubjtynAdQa6afHlF4xCdSbHwwI=;
        b=aeACvt9O3D1WXJb/KdGusuWO7TSDFVfK/XnVDtQrM/kMjsAo6fETF+PytAPUQ8oWQt
         vBfaE1whLW85A8KkcqYU238qVkWVJyR/UkHYs0e2mpKpDClX/M3tDSjcgZISF/5qatge
         h0buy/sH/TKH65sPpOBBRnhWM5eoBWMNJV6WB5EMCpZPZ/RHbQeEdoKIrZQzGKgadFyP
         Udfc4q1c1MxmZN/ZkCYtPJDSW1jk7Lwo/116g2m/a+ydkgn/wGnssWXoleqvyEB+xOh5
         cuX3+CJr9sz3SQucPcZldFi17QAKTL4LqHyVnXANOofjZyb9f32QBVj02v5U7QH6yR78
         BEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040111; x=1790644911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1A983/LxqhohjEiRubjtynAdQa6afHlF4xCdSbHwwI=;
        b=MiRo1eFKhcFo16Hs35x9LUkHMc//zWLnOHl5HddeUvedNgma1LquOFBowVc7HW9XWf
         sm0XcrHWC7270mZLdiSsDmpb+BG/TT2QNtGW/9SdXD4H9x0Yrw5a7rcTdsM4vM1McDQ5
         QCmTZ/GvJIBt/J9wssK88kLno5s8Nb5hoseciIYGOKNmHxuqm9qRxrCezulIODEUSlpB
         AZECPwTUSI6eHo/QU7BTWFyEGVL1eO4hmWGbZLwG8Zlamjw+xc2Q8tc9MB8wV4sQ/6fi
         1cMcTkDvvHhMqDJIw9/D5r5E/Jhkq5LqtiNFIQu0y9GOzfWvufloKuIW5BloQdr1iK/X
         3R9w==
X-Forwarded-Encrypted: i=1; AKwUvBwbtXiEkLKAGR3TK3cUpdq+cnQHJ/3QnK2i29fX8YnjmxCQ47Uc2Gx4xEFRMoihrgsnKCM8@lists.linux.dev
X-Gm-Message-State: AFuF++k+rplS/NUmcOuI6fy5qDZ1s0u8s2W4emSwbttVDXImzsbEXfam
	fOsDo4THuGqyOfMoRCeh5BB+yFe3NRJQhVNyYSlvzLOyP26LS0oeOuLHPZ1VRKl9TTORGY/n0La
	l49ro3jH9lJzXATTyW6/9Sv9zXYRCQuVTEVwm
X-Gm-Gg: AYBFou2UByxUbvBiPf/piao1n8TBKE2gVy8L/C4JQ7DdTtXX5LRNGqwsNOjqNZPSURr
	o68+ue50LGqSCxsgRX9T8/fU958GKW1enJzhTcBbe9gGCx1MHr5BovpBtR4DcFJ5NB5wfXxKJXs
	SASu5b2C3SsbZa9m0fwHIkeUw7XETmUnljz71hvd8Z5H7zC1SesLTqer86c1GvpErXY4S9SqELW
	SmR0U7mVjR3XuWIv7VWFQpxoMjwYTWba+TDmkzn5GlO3yBYAVYKzKtE2pQyz+gAPTKu02H2AldW
	oI/bPtNfm0LJi46eWbzf1lDcGxz6pnusTY0OzVY55Qwb56NkmLh6Qgc=
X-Received: by 2002:a05:6512:39d1:b0:5b7:c68e:a501 with SMTP id
 2adb3069b0e04-5b8c18457d2mr4617397e87.33.1790040110670; Mon, 21 Sep 2026
 18:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920083131.1880061-1-liubaolin12138@163.com> <20260920083131.1880061-9-liubaolin12138@163.com>
In-Reply-To: <20260920083131.1880061-9-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 22 Sep 2026 10:21:38 +0900
X-Gm-Features: AcwNN1Xs4mOKDO0SKEzKVNS96SX0lpAJbUENXwJul-pXhha7NjBeTDVZIWI-WOM
Message-ID: <CANFS6bajYthoK3asS3PmfU+9aocdsHS9ZFaUhmiKV5BfbaygeQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] ntfs: persist immutable in the $LXFLAGS EA
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chenxiaosong@chenxiaosong.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baolin,

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 5:32, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Add a fileattr setter for immutable and store its state in bit 0 of a
> little-endian u32 in the private $LXFLAGS EA. Reuse the standard NTFS EA
> attributes and restore the flag when loading an inode, so eviction and
> unmount do not discard the setting.


I think that the name $LXFLAGS is not appropriate. the prefix $LX
seems to be a WSL-owned namespace. The name could cause
confusion or a future semantics collision with Windows WSL.

Thanks,
Hyunchul
