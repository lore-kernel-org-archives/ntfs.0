Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1864582E3
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544340; cv=none; b=M6PG9vIocUQ44xJ4k/u9AycVzkyMQ7eOf8qk3yiuNcOfIHTAlNk2iJmVReQprlSJotBL/PnYkBnD1ZAZNzbE2Ci2eqwiAFYYro2R1/3/eQJhkrtlfTEbIKg6zx5OeINrfsuh8jsxpWvj41dDV6jcFcq4sHO2KVFi+BW6I8jpRQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544340; c=relaxed/simple;
	bh=hNqVrXfEvLOK+x6ECohdEsHvAi8OpRMWT4YfU9U8wHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEeUYB6FY4hU2LhycdMeVz8yX3wp9M7uQH4xMOGD5rm11TY4pQGTYS85JabWwwOEc812AC1lcuxgjfz8pCBA5IaFbLwXU84UEL7JMBjUsqzj6YkqUx2aOpzel3dNSS99PQYcwJbP6N7LXx9CqCl/b6um2caDln83oGA00Zwgn8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InNSd/9T; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InNSd/9T"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85a4329731cso425511b3a.3
        for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544331; x=1790149131; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtsFDmMToqDmeLwW8Klcnn0Np/6m/Y9EyWUe22xbd1g=;
        b=InNSd/9Tu94UB0xucOGiHadOvt2uVlIJHaC1+NilfPm1h/Fq5ycxWmtpmssLwMxEwu
         iL3yxzrjxtlUubU6RFNr5t2C6MiDq2MZjOPOYLLdvCwmebiKL/La3n3g96h+AryWLuzH
         yF2JksMPvQv7l+UCMh1p0SB9kYyrImaYmr9V/S+u5vmPfcDdepO53jW8AnIFPU9UvD8M
         gi2wR8gire+F9Zkdmyz3CBA4FQyt6zTqAz16nicHYNFOMG3KqGA4j7VMDp3FAwvXhITS
         JMVgBBWUmolVle0QNJGX1+BsRdvHpfhwMRjfA6u34wMg471QMm0fvceuWs3Vc6K/9ou1
         hPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544331; x=1790149131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtsFDmMToqDmeLwW8Klcnn0Np/6m/Y9EyWUe22xbd1g=;
        b=U4CymJ/fQ6TYILyFsp51074ANCZQ+zGUdpPSEeaqls+H/+BWGzqwg9TY7EYI5VDmdK
         S/FBIRH5jNNHwL4lnI75nZ46dSaLyEvhlo9Y6qcSr1uQ3SY2AwXPnzNxzLQI/5eYuaJb
         dS6gFHZ1nQbqshLtU6CDsgm+OVx3w0i7WN+JPJUS5S3jLmNHiyO5/cLPPBlW8uak4caW
         fYkuW8veKju0tbA8RDR/peN2/K6G2gz37WrIMP1tMO4u9205VNYmjt85B8XMrEbzmUDk
         CneG5ccEN6E8rdDgZhoxU87K1aXqDKXIhxLUwqItdRg8pJkQQYaz5sJNR9L1YIOOlKEi
         LspA==
X-Forwarded-Encrypted: i=1; AKwUvBz7lf5NO/dlZM/kVwB4H5m4l0se3GIl0JSMOM3/rnIsrnJMsyamU8opPKaTK7OLLnppfSyD@lists.linux.dev
X-Gm-Message-State: AFuF++kpzIT5+H58qNQICgWEU1O2wFIq6UpIRojm38Che5MzsoC49jAL
	3QZUDpdjc2rHSm1tjiVS+KqXL4Y2Sa/cGbZnH5sWOoNe3aAdopnwo8M6
X-Gm-Gg: AYBFou3/7bQnjNVKv7yyljL4V5r1LM+8E6+HLHklijiCBU1UOQfuCypDypQ9ev3W1eE
	scbMG038LAdgVhOQjt02y55XG0CLuANw3nDYdTWaEivIXdzA0yI1BMGHLs3XZM7LoVVHht9H5Yf
	SRA6FoWUmD7KNXE/3eOnJT2nkGOrno6XcpK0VzimMgAcaVjiOOL243xOcpPPUOe8z2UZ8A6XTw9
	S6QLMpTcwwl1Mts2+JWYO73LP4mJnHtKM1ILIpHubJcZHCN0BZs596HAGWFfzWQdjKWSQev+lvx
	II+pnLSP04ao1xXumPhLtuLHnjTCiN9jyZz3h3XNR1NK2PiO7bmPu8bEE01y4/kzzus7+YwIW7+
	b5VPJslo4XkAVzA8xrwrtTpwFLr4R5grWDIk+l9MdwKVZHuJP3VWUrPvd44ZbS+3eeSHq28cBHh
	ReQtmXXdhM+XDAGbr7XonTQ3Wjt2TUM88fVoF/Lkuyi1YF4x5YamJiD41lUum4cA==
X-Received: by 2002:a05:6a00:bd93:b0:86a:9be:6bf9 with SMTP id d2e1a72fcca58-87238f95d83mr2981891b3a.12.1789544330818;
        Wed, 16 Sep 2026 00:38:50 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201f07a19sm764818b3a.53.2026.09.16.00.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:38:50 -0700 (PDT)
Date: Wed, 16 Sep 2026 16:38:47 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v2 2/5] ntfs: report attribute errors to fsnotify
Message-ID: <aqpHhxKx_xiSoZZQ@hyunchul-PC02>
References: <20260916022345.1151836-1-liubaolin12138@163.com>
 <20260916022345.1151836-3-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916022345.1151836-3-liubaolin12138@163.com>

Hi Baolin, 

>  folio_err_out:
> @@ -3720,7 +3737,8 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
>  static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
>  					    s64 from_vcn,
>  					    struct ntfs_inode *locked_ni,
> -					    bool defer_attrlist)
> +					    bool defer_attrlist,
> +					    bool *error_reported)
>  {
>  	struct ntfs_attr_search_ctx *ctx;
>  	struct ntfs_inode *base_ni;
> @@ -4086,8 +4104,11 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
>  	return 0;
>  
>  put_err_out:
> -	if (ctx)
> +	if (ctx) {
> +		if (error_reported && ctx->error_reported)
> +			*error_reported = true;
>  		ntfs_attr_put_search_ctx(ctx);
> +	}
>  	return err;
>  }

__ntfs_attr_update_mapping_pairs() does:

  ntfs_attr_put_search_ctx(ctx);
  ctx = NULL

Therefore any later mapping or other errors can therefore lose report
state and duplicate reports. And The error_reported boolean only tell
us that some lower-level path has already emitted an error. Consequently
a report can incorrectly suppress a separate report for a later rollback
or resotre failure, even though that failure represents an independant
filesystem integrity problem.

Instead of carrying error_reported, would it be simpler to report each
error at its detection point and let fanofify merge repeated error
events? or would there be any alternatives?

-- 
Thanks,
Hyunchul
