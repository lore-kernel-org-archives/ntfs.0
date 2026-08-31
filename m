Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5FB3B4E8B
	for <ntfs@lists.linux.dev>; Mon, 31 Aug 2026 05:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155833; cv=pass; b=MqUlm+V6REriyl1yGf0BkoajrnjYIV6AbGBusz3PWRzu0fZYNj2EPro2qgIwxOFTaK33Fmavaqf/cJX3eXRXEGvykzLuBxhb3lSYmd6rM1hmcvPWPmuCzGBnPmttiLzxwbCHjHw28iVOCmnLsIGDZ35yaU4o1imXqFueQh4qDqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155833; c=relaxed/simple;
	bh=yJOOToxkAkkDWuxX+DQ8CmAe8YR1dGRhzSMXe+5DDPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCyLKFDRgdoXj7S9wtiUHJ4Bt9+6bF4/dy7Zq25z3vYsqL04C3i1ESzA9pdM/4VRPLJpsSx+8Ej6bbgSV1vBCuab6IbaQx/5ikR3vQlaX/A6AUledk2Eba+y8MCP0l3LqTppscxF30YLKH+rkLGBZ8202dOdSxIp+zqycsMPpv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxOkrujU; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxOkrujU"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b01910b499so2818708e87.0
        for <ntfs@lists.linux.dev>; Sun, 30 Aug 2026 22:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788155828; cv=none;
        d=google.com; s=arc-20260327;
        b=I89cQmwVyoIZkf2DFmGc62fqaDd9AdQRAMeLY0Ppt2EAVCHJ4KDFfDduj+TVlupI1A
         zpVW1UU07le8FqaR3QKOmGegFZErQ6yOUGgUi54W3KlnsSyfijkJ1a+oIwUGZQwA2KUF
         VF9jCS6m+ShcZgehh2RZY+bvS2cThPWi3AgcV3KpWGoYgnWXLEhpgE3DiCc+1qsAmE73
         HEQqfISQ+8hMmgC6VsuJIqAPY85Q5qh9RPkTCiij12ACVgHfsqot7yL5PYM98qIlLWTa
         aEFm3PDt8UV/OLidYJVMCKnIb8MMDk4M02wCqLlxKJevY6NXNvo2afFDshMCTaz159pT
         ncrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uh5CA8yZ22ZcY5tvWBU8xuO3ZeT05hPXjolSHDs/8lM=;
        fh=2Yu5rvCgnJjw9QJpkOMo56iU+XJGCs6F9f9i19mwnhg=;
        b=BaOZCl+vtFElAVWGh5iwwACMt5ia5Cz1Gny8WdLHWzNCl2g+ky1ly1f61iELQHLyfu
         702ILv2/f4NCRDRRyMRagNv7VsF6frVW5baDEj2Bp7EKmR+b7PihgWsrQz9esfsLodzA
         KSCVpQuHacKIg9DBiZU/rUsMmMVQTbhg9FJNvA0V61oUr1/FmuaAfyyO0A2KZ/LrFzUq
         DIQQIdRDP+0Jd2HpeILq7nbNVqcAFV7MaE20dYL2kDlDOE8iT4isGQerS/nlmz7/5XnR
         LFDmk4noqHGk0ZNLzo0bDzltTBPQUigsFQik0FwOi4igWFIk3s9NXpN/TDMhTYn3mp39
         TTMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788155828; x=1788760628; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uh5CA8yZ22ZcY5tvWBU8xuO3ZeT05hPXjolSHDs/8lM=;
        b=pxOkrujUp668KHn5p538t7zDQByynKc5xxxpm/ieQ5axc/r0UyuphpFzUvxbbDh37L
         MsJLNzujVMiMYY5zWoQlIxGnxxmKFrT+22TBMBOXjGL56ug3RTQI3vqAlNHgSrIHy0PZ
         /ciBcS2nlgVcRq+aEwA7bvWCRPVu647e7HuLT2TnZ9DQh2xLt38LXblmwdZIbfaPp7dz
         fCc3TE5pNCxCE6ns8qByUSC2qpKqPk63AiMP8W/IGayo0oCQ9MDscHyoYNuXtsaGOfp6
         jmhvIXGS2VZ+1WUphTQHQJDm7bHS4vBJgX1td7bQR3dfmgYFAgvdL6GgyNxrwPNvTB1X
         AHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155828; x=1788760628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uh5CA8yZ22ZcY5tvWBU8xuO3ZeT05hPXjolSHDs/8lM=;
        b=lFERRXTJqOGfbho+/dWd/3bwZAAeIB9Ep3vItYGqbwbZvHBIVI7jHJQzeyL+HcJUjZ
         TPiv1as9dCvO/n9NPGGV0bC7cjpdb51APzol/cc6l3etNu//hWR680fn68e6SyKBVDuS
         +ysxxuFQT6Q3vI/HsvanU3Q7KeLQyBDLZqjpO2xCXePA0AFhWuIe5cv98iIA2pO2I9p4
         89E+qOLgFjCF5zwSJifwPB8bX2sQkuDNUs//9L7VWIZlyXKFo3gnSL6EuVPW48NfQ0eK
         ym3Z28qzT1MtZXZWu+ap2t7dzmCG8CMsBBkm78uKiZ6CUDt3LGxSudkFzWs6qY1ji7vB
         OX5A==
X-Forwarded-Encrypted: i=1; AKwUvByGa4HkypBHkAl5OOmtjdCnMZ1w5JV+DvkKltKgIP9dlbHynwPDag2wughU6MFBX9QpQimO@lists.linux.dev
X-Gm-Message-State: AFuF++mWzNamTEZrbHuwG60yEf5rEnvyXYj6uPHBOPoyIl+mCFv8TzLM
	z/KJw31B0yUJHdf3sQAgUzstuAs8n+14/UaADQ3ZuSFnBDdYuemQmhn7NX92p/sptqFFkZ0WZ7Y
	DmfrrdII1cKKzT6F8mNal3F7keCOyVBM=
X-Gm-Gg: AYBFou1FlzUB0HOSrpzMSO/89wuBap7XqefQjPgpmZXojPap05crJ+8iahdrhLlqIM+
	O22brHREwBplptOq/8a7nRI+fpzLBf9ttMV/Qm+4yMKX6sfjLxtj8sH+/xjNK/W5J3xZ15Y7c+5
	oT2YtitdI9lUXnbMMhC6At24KDXSpOPVpxw8BLsJJTnPIKIYnbic3wQPxc/5dBH9cBt2KEI64lC
	TcwSEkLRzn7MxcAgtNrdDOwscDM5lh7xyS/F8Vmpkl09nKcp2U39TEMEtoPcw3hrnJnO+gjlfs6
	vOBJUuB5IioptciS/idlCVjWwWN6+VV7qOY415iKBVsx
X-Received: by 2002:a05:6512:1055:b0:5b4:5a42:ab3d with SMTP id
 2adb3069b0e04-5b5f61530e4mr1709713e87.8.1788155828153; Sun, 30 Aug 2026
 22:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828061607.240845-1-zenghongling@kylinos.cn> <20260828061607.240845-2-zenghongling@kylinos.cn>
In-Reply-To: <20260828061607.240845-2-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 31 Aug 2026 14:56:54 +0900
X-Gm-Features: AcwNN1UEO22loL_9cAauGdY1uAnAW-E3bmZBOHdEltAmoHBEhjOa9i53okdSeAU
Message-ID: <CANFS6bbNoXUMBzAV2yAdXSgBD-VaP8_bxY7f-E56qQdNkpX5XA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ntfs: take invalidate_lock in ntfs_filemap_page_mkwrite()
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 28=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:16, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> ntfs_filemap_page_mkwrite() calls iomap_page_mkwrite() without holding
> mapping->invalidate_lock, so a concurrent truncate or fallocate can be
> in the middle of invalidating pagecache and rewriting the runlist while
> the write fault maps blocks and dirties the folio.  This races with
> ntfs_attr_fallocate(), which merges clusters into the in-memory
> runlist, drops the runlist lock, and only afterwards zeroes the newly
> allocated clusters on disk; and with the punch-hole/insert/collapse
> paths that free clusters after truncating the cache.
>
> Per Documentation/filesystems/locking.rst, ->page_mkwrite() must ensure
> there are no truncate/invalidate races, "usually mapping->invalidate_lock
> is suitable for proper serialization".  xfs takes its mmaplock (=3D the
> invalidate_lock rwsem) shared in exactly this path.
>
> Take invalidate_lock shared around iomap_page_mkwrite().  The read-only
> fault path is already covered because filemap_fault() itself grabs
> invalidate_lock shared on instantiation/read paths; only page_mkwrite
> was bypassing it in this driver.
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
