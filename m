Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9F22D9796
	for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 00:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790554883; cv=none; b=VxUD3koinxxMdPiyfLsxRvKiVhUysFuLUjqyPm3k299VvPL14IZvN6zKyWogrC37U+fEGLxNZ8umpRITDrxBHSaY8xrXiRpbAEgHm1HLFGnLyWxtlTj5YEV74NXCSNNe/Sg3SaT2AuuZUcCWXHnXwszCnuVgcQWURQa9UKImmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790554883; c=relaxed/simple;
	bh=DCVDVXXZXuxxfJ6tept2g5zw0HnzYLfdbEScB+IIWaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bM3rWCP98DRcUavGy2DqpshAMiDjQithV2end5+VZ7Cd3Qb+DexxewhPhhaNmiE4/rjUOmFE7r3Q/DuFmcCDuOPi4SfAGMz0wYhYJI+3mDigiiKSI5iZQWHQRHTvF5S3d8L5ktfpWLhZd3ekau24r7deYWDJbR7zDR+h02oakLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UisEn6Y0; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UisEn6Y0"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79f8a6170so327320a12.1
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 17:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790554881; x=1791159681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/kL9tgvOIzXvb00GAWN4NcAyQYvhesiF7SHAPhCduuA=;
        b=UisEn6Y0gZTscI7NTm9nSA6H4SOiOt0f6DcODx2IYWZYAqWyAXdD+Ev2QzDZv5w/DN
         u79nAcOspKCzyB6J8J5owA3tsMGJMukSnbcU0pLEwJyPBTLkyGww8GQsSmIzvHE9Aokx
         82hXLxyFHXoKaBR71pd2h1vYNGtJpdmRiXnST5asVmALz+t15fTi0cniOpYXsvbZAZK+
         UPchnro1ZFAKjtYvTI2Ant46+UKfVH8RQjF6opAtXwgYsd+zZk7YcjcPqnG+4dfHc3gF
         z2Z1UEm0jIV7SjECReZaGBJE+grYTKHU6d+wREPt0O/fuBkzUlHSkcC9wS1FBCy8gRfI
         jkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790554881; x=1791159681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kL9tgvOIzXvb00GAWN4NcAyQYvhesiF7SHAPhCduuA=;
        b=KPYl2PdajnGOzZYkx1sS37IgsFx69P7pMy7jo+NFVJ/hY4cywUBq051TbYNjmg0yhp
         xGFoOKVzWY4k+M0jwVfdL9Vg+UDtH+9DEX4MhreG/O/SdJAZFtBfnIWpEkGhlSlOH39w
         TwL6qyePyQ6pEZx040fByg24kC79t5hX/aP49O8GZxoPpnps+Xz/sC8cdoxHU5xRP2a4
         J0l5YR8iPxx/IBBZSnf0Qtp73Tv3Y1yeq4OBczWOcU9luPzpVAmnPl3hcrQsYAKoy1DQ
         HpdJT966SyYJTdmID/OKHSDgSk1lccVCgZSh4RRHWV+BlFVMnDXJZEVdAr8UL0XjnRWF
         8FLA==
X-Forwarded-Encrypted: i=1; AKwUvByOGUgICQOYv3DQBxwToTUVC6MBVjuQyO8SpvAJxnN5rU0LJ8fzgPpmAJD78wp/iCx+jIXE@lists.linux.dev
X-Gm-Message-State: AFq9FYJIgG2q/7mjBfJ2XdbkSzgVu4mUQaRf4oj4qI/J03hmPJ97DgJQ
	OSrnQkSmMCvIR7FZsX/p74mw9OmhtUUSpKQF7WnNvlLTK1Y+tkscUUfU
X-Gm-Gg: AYBFou0JxYDjHBSOHLDjt/Bkd3zHzy13XFw2qsv4dlalrB6qE6GcESHHMyUxEDljEVW
	eHqPZbcLMiYY92T+3wWkKPXSPE68Pn3vm1qCJo9z8MldARwkfXOku2tMBE3cjciq/+TXULx46fA
	7zV0Ww6UJd+Oc9L4Ax9Z8MPyNkFl5Ydc3OepDuqOpknYMnm8bzQFnq9cAwnnV3ATod0A9f/+yR0
	Zgko7Ds6kEE63SJD0nrJtV41f7WI6IJgIUccnNyjeD1PBhlGdpiH1ijzjf51PYxlB9jON+PcuIt
	nUuny40wbd4hRbHgUqSLJfKIvFNVVltNqPxFpljzXGaQW4FKckTALl1xcfeK5PF9BNBCikMp/NX
	hEhBVsqWvT8nFBRIx2OkW3CVK4wkeXXX++CL36sXVtyABXE8FIvs0CQYjBVx7zZPhzDU0NmSorY
	dY2+PqUhthO2KmgokRHmaazf7eFBNirTmb11r93LYbFP1ts29R/0otXeLV5vzfMWCVkoU30eM=
X-Received: by 2002:a17:90b:1cc8:b0:3a2:b036:ed62 with SMTP id 98e67ed59e1d1-3a2b036f440mr1030732a91.37.1790554880854;
        Sun, 27 Sep 2026 17:21:20 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm24010310a91.12.2026.09.27.17.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:21:18 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:21:16 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ntfs: do not turn an unmappable runlist fragment
 into delalloc on write
Message-ID: <army_CjLBEcEiJ_o@hyunchul-PC02>
References: <arMoap0ZgeORuktT@hyunchul-PC02>
 <cover.1790417653.git.matthias.goergens@gmail.com>
 <20260927050831.2739166-2-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927050831.2739166-2-matthias.goergens@gmail.com>

Hi Matthias,

> +	/*
> +	 * As in ntfs_attr_vcn_to_rl(): a runlist fragment that could not be
> +	 * mapped is not a hole.  Treating it as one would put a delalloc
> +	 * extent over clusters that are allocated on disk but unknown to us.
> +	 */
> +	if (lcn == LCN_RL_NOT_MAPPED) {

We should handle LCN_ENOENT also.

> +		up_write(&ni->runlist.lock);
> +		mutex_unlock(&ni->mrec_lock);
> +		return map_err == -ENOMEM ? -ENOMEM : -EIO;
> +	}
> +
>  	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
>  	if (max_clu_count == 0) {
>  		ntfs_error(inode->i_sb,
> -- 
> 2.55.0
> 

-- 
Thanks,
Hyunchul
