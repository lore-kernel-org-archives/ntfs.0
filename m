Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648349;
	b=HLsF7Bm1fZNbzvkD95qsUH/VHFbm36Ttbzh8kcMay0Q5a7jUyzz2Rh2cSGs1tuSZ7vXr
	 YbNn1iB4+BpPnOCtJJ97FbprLiDXmYq3p+RdREFM1m2mbQri1ZkQKqfYXe1Nv2Q4g+39L
	 hibL6wlSZj9vfus8R08Wj2ma32ZMZujcRFkgxhlyZi+u97ccMUnpjcnwu0qICbfRQXYYV
	 JE0dobWBTNZpYg6p19utULv/iizhLyYZMXsGCy8G4TRn27GOOOcHH2mcOg2nXh4DHzj7o
	 fDUW8YkzlNHqI4UoIzt0J2c+DHAdM0EGeA71Fe2rVBRlRMIdohwlCf0gIZ3tSi00iUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BH5IrgVHfDgT25PKqEWiKin87YTRG/5R0beXb7uOD5s=;
	b=P8BUAUXqYlCkNC3qhnMYxoCNZnibTETK0mMgilqL6UZ1e+B5YsrB3bWDyHm92hqHwd9Q
	 5GWR8nxpmtGTUyUaniR2t7GLF4srqvGjN0V/DYW/1qU/RTQLnGh30LadftDosQvoSyfvK
	 B4wDhXOOBIvgmL7IJU3DYFyNUdQAuRZufuyltYw+vxpoq2YSydp+8MdigCAZBwhUgomvD
	 YE5H2SPetEBth9fSyRVsWQEYRCQmruLt8sfKdbBxAw2Yv4TldeVsAgaOOUEhav1tFaCMX
	 SuhDqwXF0CWjRUAz8fFry7LszqbVYcBkLOr+yHL7bt0xbZUE1+F4nZNAm/8nKXZ1jTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iBJlWW1m;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE7D606A322
	for <ntfs@lists.linux.dev>; Thu, 22 Oct 2026 05:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE7D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iBJlWW1m
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso776247a12.2
        for <ntfs@lists.linux.dev>; Wed, 21 Oct 2026 22:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648349; x=1793253149; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BH5IrgVHfDgT25PKqEWiKin87YTRG/5R0beXb7uOD5s=;
        b=iBJlWW1mWblj6KvrprClPG7pAU4R42M7R+zIlazDtq4Ur/SLCxQYp+el26LGs2QV0H
         gV/D3IXpxseWRn6ixprhiUroS5+69rXpQlfCuxej6fmQQSdSPzgGixnRBoQzGHDo2Nrk
         48+j4e4oGMOZMPP7jTRfDRqhTgqzvZcrg8A0oaznxgDzy0HaAgGQVnrGGGRBe9vrIuB5
         0Micwi39fJWTXvw2GqielpeehgqO8obH4Vggf5/2MI3JC619L8fwREDuZYOdHGGU3Zq3
         fvCeoVT1S+Da7Bc89aNYwEXhpdqi6H5dmfPWLBf0OaP3fBMzWNnH2gm4BbZWmuVi1ig1
         x1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648349; x=1793253149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH5IrgVHfDgT25PKqEWiKin87YTRG/5R0beXb7uOD5s=;
        b=gOiSvr/FbimuX4pm2mjduE6+lZ3nYRqRpM3pWaOOUESkxjBxxv6AIUjl0y5Ayk/BAa
         s9hjuY+IztyH9moWdRgp+3goJ6DWOhBExiuYggZoWwWFJ7Ft/zQxiPI6kgRkTjMuLMaN
         nbsLRinsomWNir4XZvYSJ8p8DMuxIw6peGLMrwt/LtlysQm+vPKs1FrVUUMxvvtvlTq7
         3JbN7jly0fHNQMyr8yZ8a47g/dSrKDa8PZ9xrfyg+kpnEXNDGKwenPXQDVVUL/m/yYZB
         5oBtYfRV4uOVul/I2Fjz/J3lXYniraSQKHR9wT2G9b6AuZDjxgCcr3bY+UTC+XCD1U2u
         2kkw==
X-Forwarded-Encrypted: i=1; AKwUvBwsEGcqiKGJR0nQS7a0K+cGLutc7D0A9IXySSuZdvWl/Xby8pI7piTzuSdCqEII+psMXCVO@lists.linux.dev
X-Gm-Message-State: AFq9FYISV4kBN5dncr0s09uRLs6bi3J72dfeRmVPtXrDlkxkal2ZGqk0
	RIY1Uby4uKEexzHUO8vPKjRyLxSyWmIt0M2A+LWn1fKoEZ9kh8EofyF+
X-Gm-Gg: AYBFou1RWfJkCg2npTfoD/2Hgo7Bf2sqn53ohIatmTrm5YjNsUspBPilo7MioDpXq9J
	FV0vC2YILuFXz/yz9iFDHaSPjA0iHumIlm9n1eCJA8+khaDGkJ/MkuSrtTz0U6GFLW/zW09Vdjo
	PDcFrHRXmQzixMu3XW831nt/dE+K7nVG60wJ0u3MC17agk/7BiPxcmLxlNkczhvPfm0Ux6mcmDi
	bI7S3EQTB6n60w4cc6YIeUof8XXijITNrF35G0XRdx+1R5QjloYp6MYniG0uFG2KMQM2m32jhao
	OuNTFXUXsI7jXkP0iR4j6F+x63MaMlgRnZ20FdvisCoAf0Z8Ti7lOAjws5Oo4W/tB+aZ5avUBhW
	D5XW36Eewgz8eBvL/PQ0SJLAK+lewiy9KPkAmkC+ALRzOhvQfmF2C/tONBN2gg8BQJw6C4ZHUu4
	PxbqxiFtJtrbDC2NzNy8BAiYAk7owePR8F2/Tr0pKH8C6t0T+UzNgHJmb+9UqIMZfaAPGReMBiv
	klg9SUpY6nfu+AUxlPeeD8FqAPZDU03cJGF164HC7yhHQ==
X-Received: by 2002:a17:90b:4c49:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3ad86f1bbfdmr3687365a91.12.1792648348367;
        Wed, 21 Oct 2026 22:52:28 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49544f1sm2526622a91.16.2026.10.21.22.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 22:52:27 -0700 (PDT)
Date: Thu, 22 Oct 2026 14:52:25 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v5] ntfs: handle a failed size rollback in the write
 error path
Message-ID: <atmkmR-ubMR5WU_e@hyunchul-PC02>
References: <20261021063221.1410183-1-zenghongling@kylinos.cn>
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
In-Reply-To: <20261021063221.1410183-1-zenghongling@kylinos.cn>

On Wed, Oct 21, 2026 at 02:32:21PM +0800, Hongling Zeng wrote:
> ntfs_file_write_iter() extends the data and initialized sizes before
> it copies the user data and restores them when the write then fails.
> The restoration is best-effort: both results are discarded, even
> though the extension is already recorded in the dirty MFT record.
> When the restoration fails too, the extended sizes reach the disk
> while the VFS inode keeps reporting the old ones: after a remount the
> file appears grown again, with an uninitialized tail where the failed
> write never put any data, and nothing records the failure.
> 
> Keep both undo results: roll the initialized size back first, and
> roll the data size back only when that rollback succeeded.  The data
> rollback goes through the same VFS-facing truncate
> ntfs_setattr_size() uses, which also supports compressed attributes,
> and keeps the VFS size on the durable data size when it fails.  Its
> shrink clamps the initialized size to the rolled-back data size,
> which can sit above the old initialized size, so a failed initialized
> size rollback would leave the clamp in place and expose the
> uninitialized tail.  The undo runs under the mapping invalidate lock,
> like ntfs_setattr_size(), which the truncate expects.  On an undo
> failure, set NVolSetErrors(), which the next persistence point
> persists as VOLUME_IS_DIRTY, and log a message for the errors=
> policy.
> 
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
