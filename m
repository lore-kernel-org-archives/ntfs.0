Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCA83E9C32
	for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396009; cv=none; b=Em0e3cj6F4EMCXEDnc4IR563/8k7aI1PTHJmX6iJuk+uAhJ66K/JzucNYJPkAp/gY8CWF7J82gwzPoOZvffyvYYygy9L73mAyqbByAGCae5gbm1BNk6VpLlj/UWT9Dk4O72pvmCFj7wZsUI5KeVUjGrCUpghpOf3yotR6QJYq7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396009; c=relaxed/simple;
	bh=s7h7ql8k488YBsWXOsDzwVBuItCWxNsZ9bD9lppgqfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7fpTyH3fx4FGkVVorbTBE7dt5MJWyuI598Of7KXQxaFAddWHXXcOnckdRu/cO+/UbE2ywKqPJgtjaxaxB/jrxNiZfMmXEiEE8z2RJcUQeMKZDhZL/SpveCBvRZq0R/yV+6NMsh0LnEmKQF5FNRjt47gO4E7fNiRQmepWkMABo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVMITYAw; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVMITYAw"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso613906a12.3
        for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396008; x=1793000808; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TPoBE4ejkC3Hwx9wcelQRbZtYwPB+7/7pwMTPD9wueo=;
        b=kVMITYAw4hdKlpCtQVAl0erDghIbPwW2HfKb9JjcZqfP4POb8+Ez7E6pFD8s28eBH8
         o1aXAh7Cb8MMTe79Mx+DXkSUxkpuVmEQWvzWC5/PsmOvaCzuq/bpF4uqNg3H0K3dpTqT
         aHU3YHgCykvm5OAEsj0MtAQ9wEVF7/8W7BWkIm0IdIOvet5lhT0s5EEFIEOgS16re16/
         fiW+vClThgOsw1sOSqvDdqhJ+Ypb6LGL6LgrYWHZIwyzC3nXOp4iUNED6gsAdX9Ul8PN
         iufUlvhr8zjOCAH8xVgrICPN8vf3dN5jwBS42qEFhLwlGvIl7kEhVeFTYrF14LHuhBE3
         bbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396008; x=1793000808;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPoBE4ejkC3Hwx9wcelQRbZtYwPB+7/7pwMTPD9wueo=;
        b=Mxp80VYwgLl1TvUpai2RDu79xaxssOpN0CKh42nouuyEGGTciY/3Rz/Y56fbf/E+pD
         4RJJxk2iZqxBY583LGdMYP81LFOP2mkYRBD/POVDc5Vw/x/Y7y5cwVCbsslXC7TRWQPz
         XbziT8Mjn4WobReaiCPjVITjBlM9vu4enE6K8mOl3eqFcmQ2HmrCBXqtUTEWNhN+ygsx
         +5T64rd6M5Q1Z6N+4HRLWsz5swZTIEYCuhDhR2yyZslR4k/YnFzTuLIV3b/j7844LSUY
         nRL9TNNcgYAW8TYTojRbz4G0Ag4fYAWCldiZlm7jANZYCD40JNUDx0MeEhO3m91StZAV
         zIWA==
X-Forwarded-Encrypted: i=1; AKwUvBySG4/GuDEb5GzbV5nuuv/+AL3sT/KBqTj3iqdmLWe3xcwVGO3+Qi796/K+G6JQLRu0nOni@lists.linux.dev
X-Gm-Message-State: AFq9FYJHzor21S20KpVfZ0LhJk8IuYBg+MiIgTAel1Voa8qDq6jWhoOI
	fO5iJbTeBerDhc13JP9Xp0VrjzZtf7/aduWpKOey9RJM3YX8ob/o9ZM8
X-Gm-Gg: AYBFou2TPR8CspV91jIJw3tANjNBciFaTAqi1338jy14CaOwHmP7sAKUYx1ZDYXOeSc
	B4eTghJmGE1YRUJVx9ro9EOgRvzH7/zQq1DxXReAeZv1TjqN1a4H/VAcWpyOaGJHsZYsl4+HJfr
	fMZapHIiVux9k/zHmAUs7/cZHZSfgRLq/OXCbtf6HrkMSz0rZbe9c8N15Bffgh2EOb2472tvr0F
	MTI2aSWwFQICzcJOgyTO2mBzvUjmbObD81J78w3Vqj0TJIISGlOfFIpDQ6ayhsQaJA8IdzsbBP5
	6OeTd+QcGnOyUL1b2toazk60MUGtBfxSx4wOtJswbTYB9iysW7fxILvLJHuaVEfvZf+M++r3v82
	bco2UNYx6fO00HJ4K6WK3KIzPbPUMCtKTchwMuxh7yHtn2rt35a0KULRvuJWOzmGoIHsZKIliCO
	GbpCOm2AIQTk+uT9sZfVGrHLjX28KoCWTBI7xzyw9v1boRdodyx9Ws3YtA+IWbx5oSNSSFAQQ=
X-Received: by 2002:a17:90b:164c:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3acef556c5fmr5590907a91.50.1792396007608;
        Mon, 19 Oct 2026 00:46:47 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0939725sm8132166a91.3.2026.10.19.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:46:46 -0700 (PDT)
Date: Mon, 19 Oct 2026 16:46:39 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hang Nan <2122295973@qq.com>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev,
	security@kernel.org
Subject: Re: [PATCH v3] ntfs: check index block capacity in
 ntfs_ib_copy_tail()
Message-ID: <atXK311zHsahIvpn@hyunchul-PC02>
References: <tencent_AC559EC491E8BEF6D2D9CBD02E00EC518809@qq.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_AC559EC491E8BEF6D2D9CBD02E00EC518809@qq.com>

Hi Hang,

> diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
> index 580998990..2c345e32d 100644
> --- a/fs/ntfs/index.c
> +++ b/fs/ntfs/index.c
> @@ -1200,6 +1200,7 @@ static int ntfs_ib_copy_tail(struct ntfs_index_context *icx, struct index_block
>  		struct index_entry *median, s64 new_vcn)
>  {
>  	u8 *ies_end;
> +	u32 ib_cap;
>  	struct index_entry *ie_head;		/* first entry after the median */
>  	int tail_size, ret;
>  	struct index_block *dst;
> @@ -1215,6 +1216,17 @@ static int ntfs_ib_copy_tail(struct ntfs_index_context *icx, struct index_block
>  
>  	ies_end = (u8 *)ntfs_ie_get_end(&src->index);
>  	tail_size = ies_end - (u8 *)ie_head;
> +
> +	/* Entries must fit in the allocated index block */
> +	ib_cap = le32_to_cpu(dst->index.allocated_size) -
> +			le32_to_cpu(dst->index.entries_offset);
> +	if ((u32)tail_size > ib_cap) {
> +		ntfs_error(icx->idx_ni->vol->sb,
> +			   "Entries (%d B) exceed IB capacity", tail_size);
> +		kvfree(dst);
> +		return -EIO;
> +	}

I think this check should be added to ntfs_index_block_inconsistent().
The source block can be rejected when it is read, by checking that
its entries_offset is not smaller than the canonical offset calculated
from the index block size and USA count.

-- 
Thanks,
Hyunchul
