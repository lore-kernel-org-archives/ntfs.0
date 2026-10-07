Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F2E34041C
	for <ntfs@lists.linux.dev>; Wed,  7 Oct 2026 01:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337985; cv=none; b=LY8wUpreirksX+ThHfYsAhFXHrcG5BqgZGyZ0PrP7mant4PcO4i4/rq5rQXpXzM+H5aAGYQ7/0o9NjPlfo+N/KMCmAKHh5yLFtS3F9gS0P9/UzrnIO6T8WmtGHPOgzEPNPaB3N9wp4qoWl5pBrtftaZgqMLuHRkSgOC1ADLs6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337985; c=relaxed/simple;
	bh=LHU+s47Aq1L7tU70jTT9DtjoQ87dRQ8zUzumv4exh5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peoo4E+6XoqFafRpDM0TDg+DUx8PJXDjXHY+jGqQXKvZTEysYdvztfgsmbRRR/pI2rd7/jsTUGRt8BvKn7okCg92eQYvbPBbA7sQBJ4+TPdd5iNGc4lgLR44mFz4F4k2gkr/uNvoFoqjq1KTZXy+LAv0g2hzYsKT+r8+PZN2rMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLyjz2hh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLyjz2hh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so586809a12.3
        for <ntfs@lists.linux.dev>; Tue, 06 Oct 2026 18:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791337982; x=1791942782; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iCXxU3WrnKHPetpNqAWHGJcCoh4uRDbsOTtGqolvALc=;
        b=tLyjz2hh2jdrGL/sB0AT2HiYjWEQNMnC93r9X1zVbO73gYbWGpYg6Y0TudcAu5g5td
         lzO1htt0P1K8JHYM8ITSmPKOG27lVljCwUSPlWk+XIFMo8K3GNmvTyLR5OxblO7zfyR/
         3b+lP4moDAnVHrUHbLKHLcYoninXDKqX6pLJpJdD/ctT4M79DR/AcVNP/C884ox3ZJJz
         BUnLOIJu5gEUMF41KK/ZmiHJBGaMisFnN2VvUQMvlrZimrwCho4jM9dbEUIXixtOO3nE
         i1c10xuykWR2Yyx+LpedTomXstcPBFLtB+LqyStJXT9f8LYfrPbrsmnbcCPHea18pz3u
         u6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337982; x=1791942782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCXxU3WrnKHPetpNqAWHGJcCoh4uRDbsOTtGqolvALc=;
        b=eEsioWohBhB1EfgxWaWK3Clq8ivIglEd0Jnr1o9znmO4H6ZLGIS4N/WCSPO1wa1w1C
         zhlPqKhCSsouz2ZoriCw3GgbOaXroHqFcwE+yPlOW7Y5Ql3s8tdQv0g4JCiJYGyEx+Nf
         p26FcDm7ch1AQ3GMxuEEYDB5xl3Xk3jLsqg9LGDUmdiNRY6gFYNu/jC4z0ALm2JyDJmh
         /X+ImXJFVuLg8aTn3nGvhHYYx8nfhzVZUva7C+F6ewyX/+P3aaAT9f8YvnXj4kevIuhL
         70U3G0v2yFSrmtoUGRjqiTGVZLfAn9IyfLMxZJDt3vBv61nFoyVJT1lC5PVvB44Ycysz
         sGqA==
X-Gm-Message-State: AFq9FYKvY8fDxnptsvQQZCsznnrDw9ikE7J7T7fZCCQDVpkk5+GUEq9g
	uIzOuSVXlYyYVxzQDHvcqu2MADep3oy70foAOw8ZGfv6suCJKcMqzFpFRs1WfXdPBbI=
X-Gm-Gg: AYBFou1DlzzBSZvFk4AGKfr9NwFHrFqfiuViPbOh6lD61w4j+ZK6SwA2opyylbJFbIj
	9HPX8pJOSkFuXYCBLTpa7PPvkZzOt4UoQMbgE2BFcctobDbAsPIalEV98zMKq3tJgcfPc8Rk+fO
	R3B70bqAZmlxJ6L3rBgDlOtWdkVhOpSk1TybiVbM6CI3V3tTOMhlAutHHX80ZkDBeRgcdTe11vf
	hMsg+uCDBGIebBSHk/z0jgsUIi/izR621XUAUXwk368mUDc0DFt2DZkhu9CoXxUsB5BgQ6WrLMg
	0w1c0t7qIqaa7ng0nn0dDOFSHbio9Yt794PW8wm/wvYEOxkS83/thlSdL4dXk7Fb6bIai42ADER
	NXAycR1XYGb26kTuWrHJw/faI2ij0HrMowlGhtN9gqxn5qxXJ4CQXcVpOwc+/8XFffoeYmsiTxS
	aTl6r6OyGo50hmPUM72QqqbiMCzefYipEl498IUi2EvsPps/9sKVAEG6HIc6xO
X-Received: by 2002:a17:90b:2550:b0:3a0:a4fb:e738 with SMTP id 98e67ed59e1d1-3a8a1c83064mr679470a91.54.1791337981020;
        Tue, 06 Oct 2026 18:53:01 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5e825b9sm484809a91.3.2026.10.06.18.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:52:58 -0700 (PDT)
Date: Wed, 7 Oct 2026 10:52:56 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Subject: Re: [PATCH] ntfs: validate and reserve bad clusters at mount
Message-ID: <asWl-Da18NglyrwU@hyunchul-PC02>
References: <20261006141612.28654-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261006141612.28654-1-linkinjeon@kernel.org>

On Tue, Oct 06, 2026 at 11:16:12PM +0900, Namjae Jeon wrote:
> The cluster allocator only consults $Bitmap and never loads
> $BadClus:$Bad. A free bitmap bit for a known bad cluster can therefore
> place that cluster in the free-space cache and make it available for
> new file allocations.
> 
> Load the named nonresident $Bad stream and map every attribute extent
> before validating full-volume coverage and identity mappings for bad
> runs. Reserve only free bits in $Bitmap on writable mounts and flush
> the corrections before the initial free-space scan. Keep bad-cluster
> counts diagnostic so reservations are accounted for exactly once.
> 
> Force read-only mounts with repair advice when $Bad cannot be loaded
> or validated, and prevent read-write remounts after such errors. Leave
> the bitmap unchanged on read-only mounts and fail mounts on memory
> allocation failure. Suppress errors=panic while loading $BadClus so
> damaged metadata can fall back to read-only.
> 
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
