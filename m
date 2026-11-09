Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191522;
	b=m0zTi68Fiy5iMumm2PRZMJDoSQBg/7cynARKL0ddlMYnDYlSJSCB3AKAvEJYS942cQht
	 y2pxkpdQDdc1vGJHAYpgGCMWobcnh2Axjd3bRlDM1/rvdF6S6VhD63cHDRVbtSDzdJBxY
	 R1ZYy/F+m0B2qAFvXOvX5hQxkM+jABK+AwDJzrEYGzaKNO+zs9WoBElwHUxzvSJWxi9sP
	 /Ry6WocqIk6K0t1yX1x5Epq+cbBZp9BbjiWQwwrgc0r/ZrQg124rxiEbnCIewHzJHHud5
	 lY2+xksyf/hCkdt1ew8ZLQ86g72iy8DkYVKJ32lB3D95Xa40aZHko/5RJDwZCb24IFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LbDv0XxXL4jun3vJs/THg0exYJ8fRU8LTDwe8xfPh6M=;
	b=OcBMSrW9HcmNW54N8Q9qb59YHjjWh8vqTBRaaBC7UzLOaA9lKLMxVLQEShXtPOgqHOou
	 Q20UJ3GjlLx75dRXDugBTzPgu7p6cRzVXn0RZouRyBgzzzbRW8ngOlSyLv5Iva2uXQfV5
	 Tm3T98OMIx5mWDJdUujcjY3da4alqlcgstsaBhfwrbqvC48Mp5v6mSQfqUjtyt9wAXLJD
	 oeOcmDnQZaxPYyzeR4mzHFM7vE5UQreKJsISEuypw27mK7HF8/AMwhJHqtEl0gfDsY2k+
	 d+VEWi318uSKH1Z1zgmV87G3FFcTk2sKaLvjkLJgM34yNl60ndNbmNSpf9Mnhd8Cl2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNzPwjNl;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00E7606A325
	for <ntfs@lists.linux.dev>; Mon,  9 Nov 2026 02:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F00E7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNzPwjNl
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2af4c8d00so885262c88.0
        for <ntfs@lists.linux.dev>; Sun, 08 Nov 2026 18:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794191521; x=1794796321; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LbDv0XxXL4jun3vJs/THg0exYJ8fRU8LTDwe8xfPh6M=;
        b=cNzPwjNl30X12GN6QRUPbZzYgdpDB3UdGjdmxOS/mOGQK7nCweOfnBTc0q8fk2S/Le
         D06tRIxZlGGGXsRX7WTlg1E04GTs767XKjxc3nptPDgsD/J3Xex7Mw1FGtakj3ZA3l7I
         9WYtebAm+KvsY6SV1Uxm8UKDSzteKuPzA1oMYeiJce+GM8feeQExN7BLj9uoIuKIldXo
         2NpKfJNzj/qe9FFaJ9B4cJ+wcY4fC5V33h31zYJ86ald3VVZaASfnfm1kJ4uP0gm5DYZ
         pDX3Jb+qtD6zJO+zCMiFSxjZrPQSbUaCQpYE71XtaSLn+lxpbxmmFr6XXEJYp0++wIzA
         BUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191521; x=1794796321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbDv0XxXL4jun3vJs/THg0exYJ8fRU8LTDwe8xfPh6M=;
        b=m04NeHSGcb6n9uI4n29BM5m8JdMJ2zwQdFPhhYlXpEroOuJV8bHeBluEdzRXC930lQ
         77y9/4X+mOPx2ulbQvP2Ikzsizkg+uji/rhrpoKoclpY4TUhi0+6cBlfzINoZreyOn2Q
         R7DxS4/x5ubP39YhFU5JP5zyNbuEhWw+wS1uy/lupYAOAMBU4bpzRcO26p2uWwuXKTnr
         W7xZ1TuMY59Eha0f1bHzwuuNtTV7UPQp+0iA6O+0OoCDnb/wzVgx9KiBzLxsOPgCwa+L
         tlin4Nhj/4wg4Jldkobr2u0n0Wnfd74B9qMwK6GZkINKeRLn4sTFfOkhj360xK22NnCD
         PLMQ==
X-Forwarded-Encrypted: i=1; AL+hErGTiQOXzIJfnihcUM6zjlJK0YehlKoUWkgAjvtV3raW6P2GptNTXD5yXcTqZLBiHO+CqW+h@lists.linux.dev
X-Gm-Message-State: APuU4Z/YUJm4iesRUNRLO8Zf6F0IO9wLzVHm+9h279FM4JkMKA/9GEsa
	RMpYZ073lWRCfuz0gbgXrWS7qQmffN2QBShFKLi9Nu5ojbArG0s76YzJ629XSA==
X-Gm-Gg: AYBFou3hsPrjD2YGS7D/9iA/C78CEPHOVHopmYNXgRQSts08SxWjrN7E0sq8P7DaAbR
	8iPGDsmhhxW1+xL4ZQNmyg4CTjkgNNCM3skYJyep7nlMad8IfphouKaJg/4B0UxgefsWHnYXQ+D
	x0tBNpX4y+VJELaKVJ9/73nz3fNJLllcot4RrzB33ZhluQjazmnwhKX9EbSVXA9iAMG/AhCC0/H
	NO7EdaNqymJL4Vsuc5OeCkeWN1Qp1SX+rhEGQoLGsFws4xSHeRUP6KI+lxTSH1FzusJUXO0eFXs
	nKIaZhjFWoxgPpW7Of9xajtUnQDKH1/mDaKfDuFUgcc4WBsJeZJtQkom1eaJWhgNZ9Mmkbr9MBq
	eJSJj/zg9ziYqfcyqeiAgHmHnDbiHQt04qk5PhsCPuUsjrKDlxVHYo/d8pYVUW3WnAbhUW51bQ+
	0pxlQklaUXCsroHNDUJVmrq1tVKzzxHjf0K0GRrN/HocHippYUYqLhhLQW+vUYAZO4oc4TIhtNh
	AXmRTFhA34Nl3PjJqMHj9JGUSnUDA1T04vXeGcJvMnNjkv++7sPMydo7gJX14ilmapIJGEEfDoU
	WltxhTj/cesLn4u4vQ==
X-Received: by 2002:a05:701a:c907:b0:190:8f72:445e with SMTP id a92af1059eb24-1b39fecbe1fmr4519636c88.11.1794191520825;
        Sun, 08 Nov 2026 18:32:00 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372632d7d62sm13689947eec.3.2026.11.08.18.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:32:00 -0800 (PST)
Date: Mon, 9 Nov 2026 11:31:57 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>
Subject: Re: [PATCH v5 11/31] ntfs: handle source record removal failure
 during attribute moves
Message-ID: <avEwnT6CAgeCj2oo@hyunchul-PC02>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
 <20261102073532.98873-12-wangxuewen_ky@163.com>
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
In-Reply-To: <20261102073532.98873-12-wangxuewen_ky@163.com>

On Mon, Nov 02, 2026 at 03:35:12PM +0800, Xuewen Wang wrote:
> From: Xuewen Wang <wangxuewen@kylinos.cn>
> 
> ntfs_attr_record_move_to() ignores failure to remove the source attribute
> after copying it. It can update the attribute-list reference and report
> success with both copies present.
> 
> Check removal before changing the list entry. On failure, attempt to
> remove the destination copy, mark its record dirty and unmap it, leaving
> the list pointing to the source. Report destination cleanup failure
> separately.
> 
> Shrinking a record to zero needs no extra space, so failure indicates
> inconsistent record accounting. Return and report EFSCORRUPTED even if
> cleanup also fails.
> 
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")

This patch has the Fixes tag, but it calls
ntfs_report_file_metadata_error(), which is introduced in patch 3.
If this patch is backported to a stable tree with patch 3, it could fail
to build.

> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
>  fs/ntfs/attrib.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index 5af8ac41af17..f1c99e0d8dca 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -3578,7 +3578,17 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
>  	nctx->attr->instance = nctx->mrec->next_attr_instance;
>  	nctx->mrec->next_attr_instance =
>  		cpu_to_le16((le16_to_cpu(nctx->mrec->next_attr_instance) + 1) & 0xffff);
> -	ntfs_attr_record_resize(ctx->mrec, a, 0);
> +	err = ntfs_attr_record_resize(ctx->mrec, a, 0);
> +	if (err) {
> +		err = -EFSCORRUPTED;
> +		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
> +		if (ntfs_attr_record_resize(ni_mrec, nctx->attr, 0))
> +			ntfs_report_file_metadata_error(VFS_I(ni),
> +							-EFSCORRUPTED);
> +		mark_mft_record_dirty(ni);
> +		unmap_mft_record(ni);
> +		goto put_err_out;
> +	}
>  	mark_mft_record_dirty(ctx->ntfs_ino);
>  	mark_mft_record_dirty(ni);
>  
> 
> 

-- 
Thanks,
Hyunchul
