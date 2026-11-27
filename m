Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745669;
	b=S3B9EIuvocIKVM0RV6t3FW82xyaoYWjmhiq/N37Y5KlhJF34RbZJrrfmHVjQOZRuKrsU
	 GkfT43FtBGk4ZcC4y8+WHBU23QnEkycd7/FxLaXAV91389MlNi+g1A8d04BLlZpumqu5L
	 va6V2M0Ew7EwjTChf8/BxkUMTdOaM5C2OCmT4bNYbFizu+mtjQyL1PX9Yl8cWPqJx2LiP
	 Zg4ESeHt/B5ZZ6HY8WlMIpfI80mURdlxNkrkX8l/nLjlmwJGxYTgdnoPTCqNkoYssO6rg
	 qLUYae8m3c4GfKcuj8Lx4vWA0ot93IYS+YzAH80Nf0lCcCHk4cQTM4K8/gsxEEwhuMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4UeH+SqQT+FD9wlg8cp1/QgsPN9k+lyc/4UIeCKdJoE=;
	b=Th2Ch+uj53VDH/hBPlPl6vpxNVXYLNL5AUbTrxrLBxRICgDCNfWepDzIIvvNiA6CtCS4
	 v51IWcP7w+pc0kA5sab4Q8B1WqyZAqUXckzIKTMg7rZfeSJtkXYkee5K8wBzFtWqDDFU2
	 MpooV4sHzx5Z3QhuV5FuqoGjNAvm+RaCtb+mLsXoN0tAmGWBvTF2a1m/VaM3bqpCKRZbQ
	 JQEuCewQ+Y16gyOJX+TCiFn3E3uR/trJO+lmvdsKEE4a9H0Dozk8HNrp8KQSMRwlIHko6
	 oolVAQAbZTEJpOc/BeUG0JI0Pwbj5mktabasZ5c96Wls90NVrWtG989gS/rJ6R0ch6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhO9HCuR;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF89606A31C
	for <ntfs@lists.linux.dev>; Fri, 27 Nov 2026 02:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhO9HCuR
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso2964840b3a.3
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 18:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745668; x=1796350468; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4UeH+SqQT+FD9wlg8cp1/QgsPN9k+lyc/4UIeCKdJoE=;
        b=lhO9HCuR55IHz41/ukAr+Y5zQlmgq7bkpkRSaMcJdWMJ6Ujc3H2oxYIDPb1kWGqbun
         n0pvRwtDBc+NEv11rkXG3NT7ek/CW5O3s9GvcnOrqIiwARet54RF9YGpZdw7scChCk9S
         6QCnhLIwyXiIzHZRFDDSQLGP6QtCWHaFCtFr/H8HUxAh2wWsy+dq4vCzY27EdDvV5MVa
         BBt9/+MpXxEwFfNJyq645Y5ihpIrR6MaAY68+cMAFdkpaPdJyq1tY+WvQW2enJjFP2pm
         hNUNQJNMroFLertY5l50XbpMOCyHNSlwMwNofm/hmJ4clyvIodwmSkTqzegf6l1rdMoG
         nSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745668; x=1796350468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UeH+SqQT+FD9wlg8cp1/QgsPN9k+lyc/4UIeCKdJoE=;
        b=pNy2RWsG/dhsqGHt/qDUN6TvfqmeONAdZrZ9E53qaulPaigPevTEafRdu89sWFqvrE
         8jcdXU75ZudFIb67ncdd5qjymIAfcj+RiIsGS1yUp5qcj2E/NmS9qjhdEF5Q+HM7ACBQ
         tVs3cTsGAkzzs7ap6HkpABOEK0ZMiXp+r1TFhpeEcQ6r2DvjC8HOxL9Io5n+dYIRWkbS
         WSD7EjflEeVZPkMVH6BK6cfsYVlRISBg0elU5imk4RFTMCRPdx3vvk2vcjr1rbpQZKih
         hXlUhImVL7uXqWXuKvE1QX0JvMcl4VPn0zNNgsW9WD7a7HCtRHLSd8hUcstg9mpceqH6
         xejg==
X-Forwarded-Encrypted: i=1; AL+hErHRDuP/aJYmePkFwP19RwnAoJzgwD6H4avCHd3S+FaWoxcSVJ7HCRgDvOqpub92hRk05HJ0@lists.linux.dev
X-Gm-Message-State: APuU4Z8vESgy0q1v6yxtXZbPlSweMp4Qp/RToQrAu978x2ZJXWWq3xTv
	RX1xq0JAL3Vq9Zn1dN43zXXTVeZv97Rb9dPEJwJJTKwaVmHqD2NA9Qx7
X-Gm-Gg: AZFdTZfZCfAdTzgk1QlPOLAm+LqDVniCK3+7SxmB09TM3YB3IUw0sVp3DMLObPaWlaX
	AML0GFlIdh9sw25UoW8e1JQa3E3TOQPv/5U/QIkoOugBMLtA4E6RWrpbkdivxzCPF7vLjgPLA4B
	HAEz6uQE10kPwVt1KFEtTF4iMgrUGPrTBsxXhN27fncCukb3TRY1spMaKHsprPRM5vMQWxYI6Rq
	Wvp00US82XI1dNJISFxJaAEBMSa/j8X1rn1tTrs9ulNkS86AJFl9ZFEfQzNGl5IY55cpuFsglFm
	1BYr10ea1oFIZwXLmoOF6QQM7EhwNcHUhEENly0NL1pWfeq+3js7U4RBSyL5EST3TWToIcq4hOh
	fcILqIWg1spjwhuyNdrq8rELwQOgQuCphjKIcMXd5CDsZ3TjlWRnWoxMBa0LouDYbd909KTHbeg
	b3xVrJtqLYgzMbmLqX/fN8UnH1Pjqv9qs//51Xq0DWIi8yRnsn5/Gz0vujJY5+jbk/z1cBzYFuJ
	cC6zA12sHiQEIOv7JLHJWWr9BKh9MJzRPH1cC6elJymQdJNAZT8E7eo4jbIPbqphaPnPAdC3M3m
	mNaNC+h47p4EWk7yk30=
X-Received: by 2002:a05:6a21:4cc7:b0:3eb:3952:d703 with SMTP id adf61e73a8af0-4014d5625d8mr22775673637.39.1795745668234;
        Thu, 26 Nov 2026 18:14:28 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285ccf4sm11158830b3a.12.2026.11.26.18.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:14:27 -0800 (PST)
Date: Fri, 27 Nov 2026 11:14:25 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: linkinjeon@kernel.org, ernest.borowski.git@proton.me,
	liubaolin12138@163.com, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v11] ntfs: trim the sizes after a short write
Message-ID: <awjnga4nQqW-5TOM@hyunchul-PC02>
References: <20261126015731.3254689-1-zhanxusheng1024@gmail.com>
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
In-Reply-To: <20261126015731.3254689-1-zhanxusheng1024@gmail.com>

> -	if (ret < 0 && ret != -EIOCBQUEUED) {
> +	/*
> +	 * Both sizes were moved to end before the copy, so a short write,
> +	 * like a failed one, must take back what it did not write.
> +	 */
> +	if (ret < count && ret != -EIOCBQUEUED) {

The rollback code is quite long. Could you extract it into a seperate
fucntion?

-- 
Thanks,
Hyunchul
