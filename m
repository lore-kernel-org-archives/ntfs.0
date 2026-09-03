Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E04A40099A
	for <ntfs@lists.linux.dev>; Thu,  3 Sep 2026 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420059; cv=none; b=VIK9m6FamPX6uVVZh9LCVpmwHEtBI87NQSBuHTrbaVb7CxuJZs0z9xiLdNBXWTkmyn2YY5mOeqv3cFEnvtk6PgdbeoKwihzkOSHVj5xAhjPEBG4RTBRpyaMEWjR9b9nZuBlHB8Wz+tc59zNjqsUmVx4SIDlOOB7earDVkBRUvrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420059; c=relaxed/simple;
	bh=qFjH69aIOXVUvqEcGK9+jou3rZnCCwOEc0IbWE4Dqq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VF8qkIxx/DMwnsQFyTI8HIRmbE8CBnHOPxqiQ7zeSGP7Nx6VITe5UPBJa+BqN/WEfWGWvqQQ1MiYIcjW+wqHjwB1eqpjK5DcU+HcfXQbQir3t0uIkVL0VFAsg6psmyhFWK0vfAjLSgWXELXyN6S+GIfPIP1khazaDnJWEY/7T9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9r2NNMm; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9r2NNMm"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso23352405ad.3
        for <ntfs@lists.linux.dev>; Thu, 03 Sep 2026 00:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420055; x=1789024855; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXuvqUj271LNrSs8P9g/osNAjtXzcTBNi1YQmbZCrTw=;
        b=U9r2NNMmBUF3jwevtAPj8f2mS9OfspTxAeUm3XLVTlZEQBZc0At5wJYIeIH3gOS5tg
         kA7VXPBNNtIyzZKrZnRLisqbk56oAMkPs/YdfLTK6GgYEQcBCb4PNtmEFcKBfir5Hw3W
         ct2aAotvNU8rw6nhP5sXQeMMaD+K+Q38tPlfVQ7ftAwiRQl3Ueb+d2FW9driMZsfN3jW
         NhrXLdN4jXAKs+6cf1C8L4RYNM0dxt+/XrehxA2WCDXqF/vPFD1mAN4zv5zAs1chqbmT
         GThGLc3zVXMxxFkw+ElUH6XNjgcJ3NlEHXkuZELQ2So5E/06OYzaEfscxzCTf5tOdQr0
         WH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420055; x=1789024855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXuvqUj271LNrSs8P9g/osNAjtXzcTBNi1YQmbZCrTw=;
        b=rkLqoIISfIN6CQ/EX5XpS3HZXa/zpOYrfRCdB1Hq6zg2FWFy7T/Qv8NxVz+DawGTwJ
         8gMicfVELGjlyQMGejLtcN2tDwcNRkMnZutR6rfcER/wXxKNSEXovykp0hYPYzW9iPA+
         AtU20wFBxhrEGrxfrirK4k7r5P70nqhXHcjL0mDIPwO8gOEX2K2oLzIW9C6qZarmdxJ3
         60Rp/vQoFbaVUGoTw2BOMvCviu//q8mFzEy9vkuGOa4QSTqNsf6gJxuKsqsSPPssf+FM
         sjgbh7amUmP/vGslhHJCwUYIvm+DEz+xySiP8bYYpR5lKVln5ZeBpCJPAsATZ/aLlCsR
         IBdw==
X-Forwarded-Encrypted: i=1; AKwUvBwiVpCCbmsJi/4qkLRqJ1DrannSMdGG1jFoKipVFtDd3uz/mHv+uGW4+t17LirwWdOLKeGE@lists.linux.dev
X-Gm-Message-State: AFuF++nyOO93Ypz5EauUpFSQBqUjnXW73Sth5Gh8nlgIcOSiMuqZsgzA
	W12dKvE6K7dtHK5apWADEO4fHJyFEd/afb5oBcFDFviT1FNvApm+wTte
X-Gm-Gg: AYBFou23lMEZFpspt7R9tr6FMgXiN/f+UxYQ4ZTUyGi0XgblGbNh+LLyETO4FDxf5x3
	db4Mxm6Q274u+1m2VEzaZQFd19hPlogW/MQkss61VFmPr6yaQGTcty6C31NmzCNnK9e3+krwbyg
	BPCwflxdHT65VlyhUc1aH1iTf9srJchbgSbETntO8a+Nr2akfOSGLNySFyFJs9X60GnRhm1XpAV
	0uJAarvUij29i41h13VPvMWerEKoY0jzCcmWVKcNtQCfsGpRzMx+S0IjmUekz3iLUycdpg6uDH4
	RiqQOgY1Zs0reS6cwEtbhG9dP4dpB/T/47u+UWV1z9onbueX1T0kpn/q6GnrThXLN+5SLVKuFdN
	Y5StUodLCw/ybEoKbP9nfFzkj6mXcg8978xM8xEClLXS1IVkopCJtdPMo9G0TPoIgqtzCtP5l1c
	jflxR+evLk9oTK1rriLg77vZK1mTZ4znkzv2WatY0qzo+OpGofqceez7oVIE/pUg==
X-Received: by 2002:a17:90b:2d4f:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39aedf1aec2mr16333499a91.6.1788420054696;
        Thu, 03 Sep 2026 00:20:54 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1cf6dsm2534325a91.3.2026.09.03.00.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:20:54 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:20:51 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: liubaolin <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH 2/5] ntfs: return -ENOMEM from
 ntfs_inode_attach_all_extents()
Message-ID: <apkf0-ab_1tkAiha@hyunchul-PC02>
References: <20260902073249.3035977-1-liubaolin12138@163.com>
 <20260902073249.3035977-3-liubaolin12138@163.com>
 <apkE3nzoVd0raTde@hyunchul-PC02>
 <4c2bdc40-2d2d-49a4-8821-410b4a7382c8@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c2bdc40-2d2d-49a4-8821-410b4a7382c8@163.com>

> Hi Hyunchul,
> 
>    Thanks for the review.
> 
>    I'll fix both issues you mentioned in v2 and send it soon.

And the other patches look good to me, so feel free to add my
Reviewed-by tag to them.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> 
> Thanks,
> Baolin
> 
> 

-- 
Thanks,
Hyunchul
