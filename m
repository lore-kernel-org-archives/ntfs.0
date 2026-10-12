Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BC2D5923
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 04:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780199; cv=none; b=RjIpcv1swmkHRESuU6lfpbVXd6xRlayR/oFuKw4tgdJEfBCEIaAZ0OqkzkNiUSKh+KVGnLlN1xHEoiHawEWlgqFMhe25fgoTbV06XivNjQ3KxnHBN+XTy4XcpL810tkoOupZhC50vxcgO8P7l7DVeRV+lpi9L7axLLQaIqQEWvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780199; c=relaxed/simple;
	bh=0OpGGmyzR6hYInQ/o6poan46Ski4KQqLsvP8EMmDX+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb/p4yHMjmPPsqZnaWUYxjU1fO15tKIi082l5u8p4GUc/Nfpu/2iu88y3PVEK7pa93OZeZ0u7GMK2RWg5GNtgN2jp6isldaBtT40H/zLfeTnQkWj2D7dB8YRLbqyInyiEa2H2ARsA1KYXw131M//3QRmK0DXdBiUX/YTU1Jf3Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdnu8Cya; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdnu8Cya"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8b20a899fso3029065ad.1
        for <ntfs@lists.linux.dev>; Sun, 11 Oct 2026 21:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780198; x=1792384998; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zF0v8+RQpnbFgXQuQsdyCo7Vj/kY7YNKYw3p2wRBVZw=;
        b=mdnu8CyaFaWqpBc1HROACtXL8hgOdndaFoUeVoMUfK38BOFaYgAaPuTlm4Rq0YFc0h
         ZpA/ORBZxbVIRQVEdbQ8XfrvgLblJtjgA9QwnoC55H5aOxJeRIHzFoLfec3gAoA2MLjq
         dNA1TBZLywYJlnHbfECGX20BVUF8bT9PsyiV9iOKc87e9MUMaf1dTW9iF5s3NCmCTNBo
         4NpozZLvP+s6rxn6g4M0KGeTxza2tPW4AstTHRe6zV4hGDiYn4ql16y4CC0ubYrZox1c
         dh48ZPBaYjK522q6kM1aMbENLzQQ5No3jeNzNq5viBaYWKI+iPtQ2m11qpgXdSAyUi8r
         8Oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780198; x=1792384998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zF0v8+RQpnbFgXQuQsdyCo7Vj/kY7YNKYw3p2wRBVZw=;
        b=age9mjIBDeULPao0W/p4Gl2+iKRAOrmUPvGFGtL7onIwrusuLlnEKet3zt7oPsGHSe
         5cmmG5m5/7eFosa3kj3b6SPdvQdcE85D+X3XrhFtMHIkGMSBhvJovTuLJ7erhhulpcBs
         sIhPfKGFiZjL8PF3NU2F6oDuk+quFhrBYDlqwyDxhp7yWeTxCP2mD3PRTEwvSd5FE2aa
         UknLP9mYII7RP6IJ0ThdHprsbOg5crFVQkhPJQ0JfE8Zz2NDwG8+lF8uJh/1r6wZbqNU
         7Wxn6+zGCgc6ou0HGk10qWctfcFNUMc85dG0f0Q2KrbmOYjAV4qOok/VOKy4wssNWee/
         8rhA==
X-Forwarded-Encrypted: i=1; AKwUvBzWyTjg87Sw8IMMhqiLJjD8BM7qSRmnonu08Q6cgrQg8Ah2Pqq+jWI/oX+n80QJzJRoKrQ7@lists.linux.dev
X-Gm-Message-State: AFq9FYIHijeq9Qt0gkSvXOULcRVAAIVgdT72QVZ9AleZk6NxeqKB4aG7
	ILr+BX5hTKOfF8kBl+kV1k1vux9tOwhwENYrWrbxyGaGUqbeTu7PSIyU
X-Gm-Gg: AYBFou25Dt3v4FutP9OFUUlTzH1VuUagwdHAV5rRZHm5SpITgXbSnTefmvHTAxl4Um3
	eKKqz0zlu5/pTllwJ+jVA2tFA8/pavAG1mcYTCu+P0hZYOl+vwiMN2c62N9tDpk6wRzuA1R30k6
	IHjXJWHs0vavrZ4wVcHB/kKbrqggK21fr25K5WN1G/xKlZ7KEW9JS0gB4GfvIPBQVoE87zgKVvu
	gfxfjv0iYbM6s41cQfzFyBTB1oNY/Nv+TxvweTwwWSSu/SwhvYI89X5+YtTrpOjfDJ6w8QNCjGq
	aow9YMQiSOGbc1HPE4/kM7q3JEOoVVswG6W5/QeeCf4u3qIHtl1ruUouMc5TzAVhxMx+J4GAHUJ
	QamJgGgwhoGv8Nwb1xM/KTYiD6a05GqMn3rrtzz3Nn9bQGeu42C0gTV4E/75knGg1jPrSNjajWk
	BjyUrvNR7Z4ZBRAP+/0TUaXXk1Ohihw8uOzTBiN59QJXmSP9Ok0BrQmox2fsKb
X-Received: by 2002:a17:902:e884:b0:2dd:ad74:6d19 with SMTP id d9443c01a7336-2e842aba7a7mr73619335ad.31.1791780197695;
        Sun, 11 Oct 2026 21:43:17 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e525sm38919835ad.16.2026.10.11.21.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:43:15 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:43:11 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: liubaolin <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v4 00/10] ntfs: persist Linux file attributes in an EA
Message-ID: <asxlX7ysgW7--bE5@hyunchul-PC02>
References: <20260923060246.2499192-1-liubaolin12138@163.com>
 <1385152d-9e3d-46da-9a3a-299ad60d521c@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1385152d-9e3d-46da-9a3a-299ad60d521c@163.com>

Hi Baolin,

> 
> Hi Namjae and Hyunchul,
>     Are there any remaining concerns or changes needed for this patch 
> series?
>     I'd be happy to address any feedback.

No, I think he maybe have missed these series.

> 
> Thanks,
> Baolin.
> 

-- 
Thanks,
Hyunchul
