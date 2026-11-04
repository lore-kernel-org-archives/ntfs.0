Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775822;
	b=DjPl4VoO0SvnLp6uiCJHrM6ghi9Me+bTUFfrsIki1h8WO01iwI0X4I2KFxU/uyLQENjc
	 uK3px8jHV9A9lT8Bv13Aqh///jF9cU9qMgyoKORDCbafdq32bEjhTmY8QOX8VRvj0i9UH
	 H5kqsU7EDB+x82RVGUlqnaBjLT+aNaozkxFxg74JNSlPvDz1e0d8ck1/ytdFSdvEzAL5G
	 0Nk5I0+IyQEpNV9GwV30SiyfFerVUotn6EeqZAqSv+KYm4naGVzeAixp+XKPFLrXs77T9
	 LY/kzjDWiRNSC3isJo+kgyGmge3PqGktgypJZHJvSYKlRwYz8pH1n8QzBmn2m0Mg49A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4imAbvQXvAeBLakV5a+RUTt3Rkpj4AuuW2uTNPIVScE=;
	b=X2zQ2q4LCgbCFZFfs1yv/0796OWcBJZo97/JvwvHXyvYTqsqI83zowYx8ZO125RJvwIh
	 Nz+cZt1dID9wlxUyPcK+8Aj2GWOSG8n+X8lESUnQXBVHd7WQkWhargBrF9bGrn92uuijp
	 +tIQ3YHSmta/5Ld8Yloe5CkDtrBb5QyC15tkCa/2rH/sasM5m9GN2evyDNtx1FeVPeLui
	 8wgBSLU+BoD0w8lQwUAZs6AHgaCaiAwn45OLOv04s7HmrYCmpm6Ad06vTaiQR/rUIFOI1
	 OPi6MhfktfpQGi6BmkYT0UXOI9kbV5FbI8fEFGkXQlYfYpn1ZOT326UsBpra8L+H8Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzCdsP9H;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC700606A326
	for <ntfs@lists.linux.dev>; Wed,  4 Nov 2026 07:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC700606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzCdsP9H
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed0b03ce3eso1072435ad.3
        for <ntfs@lists.linux.dev>; Tue, 03 Nov 2026 23:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793775821; x=1794380621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4imAbvQXvAeBLakV5a+RUTt3Rkpj4AuuW2uTNPIVScE=;
        b=HzCdsP9HcdLFtCyakE/N8cgngIEgr3VYF/66u40vIt8bctH+FJ/hyzGBCFZfYyFtAF
         tFboRrEAgTdA0T2WYi90eprE+cnKy+C+D1C6HwzxZWDtiDCh893FZR1KIbtdgyElbIwL
         kCoBgchkl4EHss5H5LuMqnXTeBXAFInb77cAKzh/es6EDZAonueeIZFoYdcwgNbkmYqe
         e3UxN3JLOaS5YmMyzxrnA7WIcGbKiccWsOTSdKrxJGpNELO/PULSVhcbt54h5rSxUaDU
         plZKaBgG/1y0hxwArADeeH27daSYnTlfQxXOfJhh+1rG6RxPFedeCGBlmJ3bRe9jqgG7
         oCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793775821; x=1794380621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4imAbvQXvAeBLakV5a+RUTt3Rkpj4AuuW2uTNPIVScE=;
        b=OdYH2nDJc13+YVqzSxbGh1wXKTsYFc/NwlklFW5Vz0xhCZGZmhqlf+oioZ7TxfwFhJ
         K0uMmrl0jOL8Fr+pcC9VeHB0tSQ34jurJCw5lZTeE1v3cpQ13AXiCstVjY2r+nZYdSmK
         vCuHs4WHcDejHSl8xCv4NrbS8db+8C1dN0vN1ooxF9HWYsSQIsAs96mSbLH8M6xgTPp0
         PASal2nDJxc6Uqn4K81O7vvMkWM1+bsKy6lWFVeMy2XJttG7hjL70d+K1QWzIYl4Bmg5
         eSFFNwqssZeRL1AYO0EvVCtQ3RYgz10IzD9ph1T4mcxzsR9WqYj6mkyxMD5Xjbvpvj50
         KlMA==
X-Forwarded-Encrypted: i=1; AKwUvBx1wXGlSHQt6UszxvW7a6CZ1TKc2Zul0M0Yskbp22ciZ4VNJBW1J6dpOl1C0zZgo9+ZEjZa@lists.linux.dev
X-Gm-Message-State: APuU4Z/KTRxOcV+S0QubRDi9gf36BPLSwqi1IeTr6sieTzuhLY0/2U8j
	5felCspx3vhhzmbZK16VD4KFu71NauOCo+XEbfAMREOP4ymh8IDEMnYR
X-Gm-Gg: AYBFou2L9hQ15GRLtQknH2d4dZ91C3fVaWbiiOa8f1Mj8lijUl9TBvjxCD5foDGUjay
	MlFttHLqhDJI84AP21lPF7eN1p6X5i1SIxM+m8skTp2rPajfHvVgRxCkzqp6Y63fst0Anm2P9wZ
	7gaL/rZuX0tRuzNLS9seTXBA7JVPoOzy6MCVmh5SFXD50UO6XzfamOWeSI8k//Ii0h531W1G4DG
	NfOECjx9YkWMP/nfmOQosPfesxwNZLq0vD4YDnH7bd4nLSy99/4x8xoYFxNTdF1TGe4KNC5u1i1
	7Ljrl260ZBqr429hq2zOCL3Sr6/rtJ2PdN+TyyNuFeUdzfbplV3RF2EcwXJQqKr14/YO0ZfA+gX
	+XQ4zV1zh4XpXW2xrxagKXDgbgrfrEKKC9uI7uGre+yftsznOPTKMHd9jrVriiKhfacYLTUsQI1
	qPZMPpCn62zkccG1M/wFG3kGPkeBwOct4CTYYP6idL8dDbWbkj2tZGSXuBxhzeq8BGDDIuYVWn+
	G+JZum+asGzf79T5f3twDMMUGS8L9untwdctozWAJQskYM1oa94eqVdm2soGAbA0AiZ7D0FUiwe
	/1/axjdkHGGnGGLZhMo=
X-Received: by 2002:a17:903:245:b0:2eb:a1b:e9e5 with SMTP id d9443c01a7336-2eb364e7bfdmr143230035ad.52.1793775820592;
        Tue, 03 Nov 2026 23:03:40 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090f7313sm3461615ad.45.2026.11.03.23.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:03:39 -0800 (PST)
Date: Wed, 4 Nov 2026 16:03:37 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v2 0/5] ntfs: support O_TMPFILE
Message-ID: <aurYye6hdEnXqZAa@hyunchul-PC02>
References: <20261031052857.1542936-1-liubaolin12138@163.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261031052857.1542936-1-liubaolin12138@163.com>

This series look good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

On Sat, Oct 31, 2026 at 01:28:52PM +0800, Baolin Liu wrote:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> This series adds O_TMPFILE support to fs/ntfs. Applications can prepare a
> regular file's contents and metadata before publishing it with linkat().
> Unpublished files are reclaimed when their last reference is released.
> O_EXCL prevents publication.
> 
> The series keeps the same five changes and ordering as v1:
> 
>   1. Initialize inherited ACLs after allocating the new MFT record.
>      Anonymous creation needs its inherited ACL stored before returning.
>   2. Preserve prepared atime and mtime when publishing the inode through
>      the hard-link path.
>   3. Initialize the new FILE_NAME's packed EA size, since a temporary
>      file may already have EAs when it is published.
>   4. Complete unlinked-file attribute writes before dropping the cache,
>      including nonresident EAs prepared before publication.
>   5. Add O_TMPFILE creation and publication support.
> 
> As requested in review, patch 2 gives the new FILE_NAME and directory
> index entry the same ctime as the inode. The inode ctime is updated only
> after the link succeeds. Patch 1 also initializes a newly created
> FILE_NAME's ctime after inherited ACL setup, fixing a timestamp mismatch
> caused by moving ACL initialization later in v1.
> 
> While implementing and testing O_TMPFILE, we also found pre-existing
> NTFS bugs in attribute rollback and ACL lookup. These include stale
> attribute inodes left cached after failed creation, which can cause
> subsequent creation to return EIO even after space is freed, incorrect
> ACL inheritance when the default ACL is not cached, and a fixed-size
> read buffer that cannot handle larger ACL values. The underlying bugs
> predate this series.
> 
> To keep this series focused on O_TMPFILE support and the v1 review
> feedback, we are leaving these existing bugs to a separate bug-fix
> series. We plan to submit those fixes after this series is accepted and
> merged. These issues remain present with this series applied.
> 
> Tested this five-patch series in QEMU with four CPUs, NTFS debug and
> lockdep enabled. The requested unchanged xfstests generic/004 and
> generic/389 passed. Tests covered creation, publication, last-reference
> cleanup, O_EXCL, normal idmapped ownership, named streams, nonresident
> EAs, direct I/O, mmap, allocation and concurrent publication. Published
> data and metadata were checked after cache eviction, remount and reboot.
> Offline inspection compared hard-link ctime in STANDARD_INFORMATION,
> the new FILE_NAME and the directory index.
> 
> Changes in v2:
> - Update FILE_NAME and index ctime as requested in review.
> - Set the source inode ctime only after successful hard-link creation.
> - Initialize creation FILE_NAME ctime after inherited ACL setup.
> - Run generic/004 and generic/389 on the standalone five-patch series.
> - Rebase onto ntfs-next commit
>   564c7753647731d19170914c1c637d3b33d88d3b, including the const mnt_idmap
>   tmpfile callback signature and documentation context.
> - Resolve patch 1 against the updated early ACL error handling in
>   __ntfs_create(); the relocated ACL failure still uses MFT/EA rollback.
> - Keep the original five-patch scope; submit fixes for the pre-existing
>   attribute rollback and ACL lookup bugs separately after this series
>   is merged.
> - No functional changes to patches 3 and 4.
> 
> Thanks,
> Baolin
> 
> Baolin Liu (2):
>   ntfs: initialize inherited ACLs after allocating the MFT record
>   ntfs: support O_TMPFILE
> 
> Xuewen Wang (3):
>   ntfs: preserve timestamps when creating hard links
>   ntfs: initialize packed EA size when creating hard links
>   ntfs: write unlinked file attributes before dropping their cache
> 
>  Documentation/filesystems/ntfs.rst |  15 ++++
>  fs/ntfs/inode.c                    |   8 ++
>  fs/ntfs/namei.c                    | 140 +++++++++++++++++++++++------
>  3 files changed, 136 insertions(+), 27 deletions(-)
> 
> 
> base-commit: 564c7753647731d19170914c1c637d3b33d88d3b
> 
> 

-- 
Thanks,
Hyunchul
