Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468BF45DF5B
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759021; cv=none; b=O9Hj7+sDVvSgvHLhO2cprZbcOSK2mAHqzBxa46jeKhtmuA8HSejle3UQJhdQl42Nfkav76ariJ3rpFYtGr2SmBZQYSG6TeD5RxZDpscxwoq763NdWOh1OBnahcYzJ1FONI4SWELwvrin1Q+ywPaiVRWRHvy1ve5HqMwAMjdD6C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759021; c=relaxed/simple;
	bh=mV1nNnynm4md9lfuABy40w9KFyX35KTgSZO/0RIffFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGYHYh/nG3vVpKOA9kgWuXPrXU0WkqsdqA03HgnW86UagyPo09kXc/IPXXs2yM7Gax33u9QUECw6YBdcye8oktEqe/rs5t5QbHwnGAIxKebUGEExmhDYbhkIBjkiL47mTc+dd2Z3lDs9rQLFFg5HbakLVkpW8jeAxESBl7rDHQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGmeraDm; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGmeraDm"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a48e359e0fso1365048a91.3
        for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759018; x=1791363818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQ3EyRImtKEZ5L5nNxlrjsnwSL+RNEJ4KU3mDLLBvow=;
        b=ZGmeraDmfXqgD9E9oFKNQtqs6N+v0fixIeKqEwgnxUEPRArPwvL3lyyzyKAXLpVWPA
         dof/7ITeX9QZOwQeRaUnbm8vUSSrvQQ1ep6sA+GuOmmS0y24JliUPWBtIXACdpsPmEtd
         nS16JYvaSkdftqj1+lR57d0N1Fq61nSOvIfvEAGi4AD2UZWdOAK/uJpHiJ86scAdCyfM
         ZwXTOvvddMDhElOCGsjodQYESTldGETF/pwmAYJ0Yldpyr1AVswElp8c3G+H9eOoU0lP
         V+OCO/fF3AFrEDbSr7B4uN3D7SXwYCbs0fBdizdHjRGyLLX8uew5RPfmCWjN8jadI4mV
         t8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759018; x=1791363818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ3EyRImtKEZ5L5nNxlrjsnwSL+RNEJ4KU3mDLLBvow=;
        b=Sh8K3X2N37SaDtGQceJT0iGZFUEN1xGo5Ss8q5RAeWmEL6FQP+o/ZDFAW1Q6JLhZ+z
         22KaUZ5mqy6XHmgMlhVPWUYGU2ftxtbVNQQToSTGY6rjkPqlfk1Jl843ylcUbzFkh0q8
         XXBbz4X+pZHMyryelxZDZNn5OWLk2gU92nKjOoBydM89pI/wSH9JVHhZnXg32QHLlqRQ
         pRXTiKZ/WDG4l588X5Xy18ayEQczB9N5lSvw2TJxDYXUWjdicbgVjR8+4NXzF9vvN82k
         pbHX6YooL6q/qOwNifvESA0RQTJeVQ/h5H0twteMDwb7lw6fo8I0hVyPexMwV4dPyraf
         MAng==
X-Forwarded-Encrypted: i=1; AKwUvBzN9jU+HfRJK0byzteAxl0qf3BLICXoVal1jXnuTMqjk7cRCZWMMxiI+RqBB+E86iZjwR+r@lists.linux.dev
X-Gm-Message-State: AFq9FYJ5zD4xBuo/B0npayA2vpGFHjaJba5GzsYBNaqLlaFyU1ejb/ZF
	Ox+Tb9JQ/OoyG+2/HWG9OmcrvoqX8YtrCUqJw1lUPra0z+UaZdoy+TVb
X-Gm-Gg: AYBFou366bHBI+l5kDM7/w1xffOHKBQEzrpzmrK5ajRFhrJS38hLvN2ST2xRQUo/+G1
	Gyb7QHWcjjUsIrTH68Zra7Eyf1j6PVLBAUPLGfFfCWfCsdLvzNnI+CSjpiXZS4lL1/I6xDnBF6k
	UHOpbu4U+7HVWGaBKVepp5MLI+AaMQwZHQFPwKEr+/7+YVDz7WpxiUVhBPbqaSIckIMw4+rc7VG
	eZemOMr4kV21+Ug/LyfjObMRm0KTT0uuJY/caxsCszbS6/XxtA47jr+RQ55pZ8FKtJpDCyUe+Uz
	zjdn7VUVNKXr6E/NEcdrVyV8GTRcfllCsdjc6scI3fJzCFwZX4GEpwWExFr5eSAgo2Da5uCUXdy
	wsmsiPo/ZXVEa2bzizW1/vsYAvArt11mMGNTfQtSSTFWenPQyOGLBsCZTVBAJ35rH1hmg2LFHTO
	qwAgGX9WahO/d0V7Uszw9EeHQdLpNEXu5SeG9PRTChVSll//hr0CzT4GJxk1tB
X-Received: by 2002:a17:90b:2791:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3a4d0f022a1mr654285a91.5.1790759018103;
        Wed, 30 Sep 2026 02:03:38 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cac328c6sm2555182a91.12.2026.09.30.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:03:37 -0700 (PDT)
Date: Wed, 30 Sep 2026 18:03:33 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] ntfs: fix the $MFT bootstrap hang and reads of
 unmapped runlist ranges
Message-ID: <arzQZXZamgPEBhX6@hyunchul-PC02>
References: <cover.1790684177.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1790684177.git.matthias.goergens@gmail.com>


The whole series looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
