Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792471317;
	b=YugvMFdcrgqtohw0lVl3C5UOrRQVfnXvcpbUvLzu/TeAww2Nd0UjeRz5WFoqiIWVouY9
	 XTEK3AVphKhBjDwDqpeOf9Zyp6W3goX5VoFyDNoTzW4/I/JGQJmxiTlPdOKlLs2a5x/0o
	 0FhR0V1N6SOplUN6ma1h/lZ51MJ/tQ92of7IUA04qY0yY2RhyKCsFs5/uPjgADz4ms+8f
	 LFIuuYfSU3CwMyQQDSQksC+vKuLftcxhL0AESIz3gpnoYp0W7ks91vBa1kqtW39BTRiMB
	 IP6kxSPwPpHU62C/+g/6CF8rV8OgAf9o3C2rQU6seaabz9Wj1waW6yyh4f3WXSh9bYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792471317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h8RyDxKsxxA1njuKWfRpTK+njnh+WrZ9QFC9upkynnw=;
	b=EzFpEH53TaYdmPNZfz2iGZE44sqvtOK0eG2ExPD79kizBaqa3ypH6ZTRfIGHBQk7T8pj
	 fJt/wXoFbCa2dSvzYuu38o3jbqKQ2BxvusZgS1cCvpWi4+awaR9tXyN6CFAQV3NUaiqY7
	 ERikn7ef81ehjRv0h8QcjwfaEEJRibqfXdcpAyRsuzMTvo+IKvi4tP/VHY2s1butrxUeT
	 bI0DrgWHY2QDQfNUG8twjPubcb+1iKyVnRv79fw+WPV5IUIuCpOaojxLSZsRSZZKP7y88
	 ReStPIyvV2PgCJxkIVorUPINJb0ZAgILgOcdp8vFNuWyXvqnNw9tYdT+saBYYUe6/2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZG4byBW+;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C0C606A319
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 04:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C0C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZG4byBW+
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so1417915a12.1
        for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 21:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792471316; x=1793076116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8RyDxKsxxA1njuKWfRpTK+njnh+WrZ9QFC9upkynnw=;
        b=ZG4byBW+oMSN0k3GjNQ9t+VQT7WRp0GI2cRP72OupNPRAaoOcWCFyywXAsEqwuKE7o
         /KAcaEf4XaPDdEShe7IfH1vGEvEmg3Ly2CS7dBXVGdzNCE/xIuYoL+jY6oOZFE+F23JT
         fUbqC9tAq3si+jn1JiRBDKPvzQeJn6CGtzThUMI0DAvYc63wITqvVujSOYy+AHatlxd9
         xnIwYa0jEJKnsVScLJNbbNsHLC7d5mC42m+TPB0QWApLZnQlzGVTk2sX+jhe/xA64acD
         arFCeHrwX59BM4prtFVlIuLoM4K1kIx1tJvyRIVTZdbKFjRrFk68dw8P7Exrifg+jwua
         ysZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792471316; x=1793076116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8RyDxKsxxA1njuKWfRpTK+njnh+WrZ9QFC9upkynnw=;
        b=ZTAarUutqt+V8NhZWYPPnJ2JJO3UIK5EXpOdMmKX9optlTeB6wnTXMmPM4wwgxkwA2
         QqpB2M7eLp26NFMAfjME3q8nNXPzL4ElkJ1fhTB7UXlPU3xp3L7hUSJdqBboo+02TpIM
         j4Z+dRiYm4mvendFebPoVVtQ0vbry2sxADLBjS7AQMm3RqyjDckTLPDwNP35k+hh5tq/
         Rl0cQP7MT+5aX03Yu3KBzPepacnNjg+Q154plyXZgOhUlGGSljBcueXLkWUSUYuWAi1j
         3CSsarDhBNGQ+RqnAmNKJhWlryYvtvaIP0xVku8JKucPPof6F8EN4wxJvK75clLY8jOO
         ukuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyeYhHAMADap4QUrrWNXfy666mq+9VPiVLSeIf8KzfNc5tC6XiUlUJoIidrEiGxyp0dC+B@lists.linux.dev
X-Gm-Message-State: AFq9FYIeJycP1KB/4dSioLTy91n49HnDI+wdwwZjh9XD+ob7MSa1VxAs
	6WfLk8w4CNvf0BpEh21rP8ECw7j/coVoN4x2iPFkmqJNS3jr2i4PVa3X
X-Gm-Gg: AYBFou23EG9EBxZg3Fie6KNbLQscO+ZPva7/ezqEAXIrBPV7dQyefZ7Q+a8mDeOcmOW
	bLqqJaSiyfU1FcIo3gJQPI8ayAJ5LFn18KSyo40eu6xoMjBqVyuiO9mieJwnxAgO9aZXpCb52UW
	MMK7x/y31kGA3WkZFFbJ05V8VkVRu9YWdK/eGa6HcrXGBJBwf/ikTy7rgq/u5vmZATv5zyiuaL1
	EDbrrQOHPrT9EcHBaKR9y/gKPnQKnPf42wj4ohxaGn/ur7NGB/rOBGK+AUn3LgQrgrNArq59XTH
	Z+jMklg4F7shwN6amZwlcMZzS6K5MN9rXuGdEfwsruHpB9hdGKWplG8ZLkukvqJUegvnGvwu0SO
	30sw/1SWNwqTvQGqbGkBNSALWNZYKZj4U3or/QvbwYNk9l7E7eWGe++8VpvTaSxI/YCHVXTlUB9
	nYmORh/NIhqf2xKva020cSXvLqkL0dbJwxs5wGZUkMC+DsN2T8HV5vCQa5KlZB
X-Received: by 2002:a17:90b:1343:b0:3ac:8897:7ba4 with SMTP id 98e67ed59e1d1-3acee2939a4mr7349151a91.5.1792471316125;
        Mon, 19 Oct 2026 21:41:56 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5da2d6aasm2237459a91.13.2026.10.19.21.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 21:41:55 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:41:53 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hang Nan <2122295973@qq.com>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev,
	security@kernel.org
Subject: Re: [PATCH v4] ntfs: reject index blocks with a too small entries
 offset
Message-ID: <atbxEefNNrsTJAWH@hyunchul-PC02>
References: <tencent_17B0FD18F1E99339D2CC57497A4419F98506@qq.com>
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
In-Reply-To: <tencent_17B0FD18F1E99339D2CC57497A4419F98506@qq.com>

The changes itself looks reasonable, but the patch does not apply
cleanly because whitespace problems.

Could you regenerate the patch to fix it?

-- 
Thanks,
Hyunchul
