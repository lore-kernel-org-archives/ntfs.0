Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080292;
	b=yHkcFe/8SjI+QZIKBnHMUwsSbEMReK8rNMTELcB2Wl0/S9ntIlDkaTMZWtxL4rCPrsvo
	 wInF+Ro4HIkgkj6cjb+21Oktw79ed25thWyBKHOQ9X9jR+pJP1cVuAOkF4GuZEfo+Bb5y
	 v2CCR5h/lSONZ2g2Mc21KguHT3aCgI3wL+XLm+9STlJ0Ory6AEd0GbYXeZCxt8tDUxZ+0
	 W5KR52iXdW734FxzZJVNGW7ZLZcYL4XsreyOfK40o7WQ75dzKPwpkbEFLvU06z44JOMR/
	 0kGAziD2Iy16uh/L/LoHtc+6ub4eH4/Cr9DncT3dUaIDSgsW3q6Feesqxd2gJUi9FNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sS6nMMIuDnR4tNo375vONtLVL0oaIgYfWQsXPhrKCLg=;
	b=k/CadpXoi1GWU70P24+mzfva2SxfAZd9WwnO18eA/PojgN6BG0rUsnTJEeSVHeD/Ox99
	 MV/WCkMYW7jOnsg2x7SGg+e2V2rYhFlzJGnZ6iKVC32QXxFTtIC6LhnLiByYwfwM4VFgV
	 GQKXwH3jd8HxF2UxHNPAAE7Z4vmopPsxAN3Y2PsI3deLys1YGDIiHcQ/+3BChM3pW2HgX
	 s/Zi+fjz3rNgSHz8nWMza3VW/aRhtfP9Gu9yF7LjqRRQk9EUA2aF3SaxGbNGpVnuKogfj
	 fn8nzpTznXrhOxlLA6Laq46j6CnAaB54mfBASxmC3oaXZZE2MlfppBNE7lQxgNpQ7Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bzLBvN4n;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07FD606A31B
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 05:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D07FD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bzLBvN4n
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so2158844b3a.3
        for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 22:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080291; x=1793685091; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sS6nMMIuDnR4tNo375vONtLVL0oaIgYfWQsXPhrKCLg=;
        b=bzLBvN4n6D2OXkJfXDrDGNOYSAqRn3tETzo2QOvO5/h7Kp9FmrdbHHDOn8sNiX/ZoU
         yk2pOSid79Pmd4A9y2+Xh0gUKyGHkOFApBm4B35eZbGdM19vzZ+vT/TGiNQ6qLadIEI7
         mGT8PKp612ZD99Om/VZldbotdoxj1irp2Sz9g+cIu7YP5WHBHMC2aVWKeu5+3YaVKO1K
         QD5gBnhYZCuQ58u9rp7/biyDd8sFj5a7hoL6OtQ9HsCADqAg1QC2I5UTnRZsnePKJsf8
         0EDU8PNPAg3Azv0UQ12NgYg/RxNS1+hx0HmI9U/3YertSV/THbNSkvJ7BIGqo20Hh9i/
         4uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080291; x=1793685091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sS6nMMIuDnR4tNo375vONtLVL0oaIgYfWQsXPhrKCLg=;
        b=ka8hklfiuCejfXSTZxxc33Iqq8QdCFmixR9VhaRNRhu+31jcpGNJ5Su6ZFQDzkgx0z
         yWN5mTIlrl4Rl4txqG1Is3aWx7T22TXozqFan3FF1g2Vi48d3TCraX4XK7SdNig7mxVF
         PyZbyPinowjqiigUK9/G80v6JxVjgM4lq0nPDzF8eiXaF3Zle8sBziM6lX8zA8VIE/E1
         DzsqWplvr/gtWLfM+s87f3pYir9iEyT934lQ6qMRf4o5OW8c5IEPVrE3Gyfu1YoDvxzw
         gsdEjnzKe2WoKm6mZc8lymanHNgghCcWGx25iFy/VEwP0QqogTcjkjG5kRpxczu12365
         2GOA==
X-Forwarded-Encrypted: i=1; AKwUvBwa/Cxozi8jNHkkvg3FK2Ef/kvQ3JQE6BbsqnhgsxejaKYtrs+BE1cpzmFLveihXOJt1Jdj@lists.linux.dev
X-Gm-Message-State: AFq9FYI0xwNJEdbHhhWPsgkt4wmnG6PJLlnXsiohJw9QbQdU0HB+UJIc
	rzeG6ceD+mKMflWMLbbtd+2u5ovYDtj78M/6swJDWyz2oGFajlRB8OeS
X-Gm-Gg: AYBFou0rmM5k9K1kL/EutNu6EnkijUq2DwACyahsxcyX1DfbCY9mGEGc/JgG/Q7bh/+
	ZIh6kJv7eWR1t/HovqyoJdvER0FyCXgVg/HqJ9sFlR80DtpuRRMrcF7FQK5qi+RSvoYMEX2aiKs
	lCOScNEThEWYTMK1zpRAJCaNp/AELUIZh8AV7YA2Wr2KcEqD+lCP4zIS5Fo4PBGqqTKU7UlDfcu
	Sn8oWtjjeRa0JQCnjqGAmT/P1oDFCPStmIgzYWP54NnwmPAcLPqNBE4gVVSUeGuR1srPYG4gTKP
	cj4+hrWOe90gUHkAAYRiBzRZ/svIhWyKBQG+G2FEfETktiqBAgMv/BlxH3zNUdJrhwo5mxw+rHh
	ecHgx5IgUe6YIDB78+ZyB5gTjlkY3qaYq7rwQ03eI9YGX/PpvvzgQc6eYSnq384iT8GLlXeK8vC
	W2fDhxdjEnMCg/gwsQjHOXy/8kGkbvPprctneoZu0eyXVGKtuwsQtQKg3Ov/FqAsXjuJdIYMns7
	d6MbV2lh3M5z7UFyetlseHjxC5iLw25vnOIZcTKkTq10Q==
X-Received: by 2002:a05:6300:398:b0:3e2:86b6:9c05 with SMTP id adf61e73a8af0-3e7bfac3587mr6067370637.37.1793080291076;
        Mon, 26 Oct 2026 22:51:31 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm2280332a12.18.2026.10.26.22.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:51:30 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:51:27 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: Re: [PATCH v4 28/31] ntfs: report EA metadata and restoration errors
Message-ID: <auA734yJUBRQPQD_@hyunchul-PC02>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-29-liubaolin12138@163.com>
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
In-Reply-To: <20261020084421.2196486-29-liubaolin12138@163.com>

> @@ -605,6 +621,8 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>  	} while (next > 0 && offset < ea_info_qsize);
>  
>  out:
> +	if (err == -EUCLEAN)
> +		ntfs_report_file_metadata_error(inode, err);

this function appears to reache here with -EIO or -ENOENT.

-- 
Thanks,
Hyunchul
