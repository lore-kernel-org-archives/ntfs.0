Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753734;
	b=aJxe0yWyOVdRlMX/+10U4nUrS5Xg+1HEK/k9vSJ9KSQHZ61sOh9touwJ5p36qzlWTuRS
	 LJOeBTByj3TMg9WfM20X19zNOutIAqr1gBU20el8IQvZ4VIHsBVODDrQOu+qxCbfCZNDe
	 5GL8gNO5aUpP2xJ//67I9FbJxIc+GY2+i8tBodgqFUW1IW5W8Qiz1fC6W+tI0aaj0ceFz
	 O+dy732jBYRwZP4pQL0ChTbfM6Hk2MjRezYqOcjqaoZyacfyMsuymN7VoXDEYTHL2R1iW
	 6V0QMFnqizDFHym/hY+yhBRkhD5nn7mvRDKl/C0oQdZpxjSIUza9Xrm09mKIASd2osg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xG5t3xikeZrgWEXDIQ9E66WF0APj2TRUKkrk3j8LkpE=;
	b=1u2TccwtgWNCcn3OiUxYlWHwEktRt0jQWolonrWm65qeHPgJgYqYs8Wfs6DIdgELkpNM
	 iGeOrRxWAjrTFEudNVTJuo04Tp3f+A2u//UFkucadpPGyv4Llc2hTGVRz15QzF178VUuF
	 +OX3Mnh+voUVd+nreJesdZcztdRjxpNphOufMw+nVcwySJRKk+IBLJyN8YjjUEUhuiPc5
	 vdUwNTB0m0Kfaby9WzTyc/mNfQNypUW1opLoJbWzSHxjh8qaU3Q6MtiHMYlORzEL5FrWx
	 QncSOzVpg2hD477dd8IVC3RXQ+N1DYFYLyL9i1/Ab/YfA6JqC7F2JJnd3eTmc415iFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuUpFt9J;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8885E606A338
	for <ntfs@lists.linux.dev>; Wed,  4 Nov 2026 00:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8885E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuUpFt9J
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b07db03f41so137704a91.2
        for <ntfs@lists.linux.dev>; Tue, 03 Nov 2026 16:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753734; x=1794358534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xG5t3xikeZrgWEXDIQ9E66WF0APj2TRUKkrk3j8LkpE=;
        b=zuUpFt9J/cFubDGclKYU2ivE6da2df9R+LlsyBBxaOu0Pc9ckPYqOCKPk+od+eEdQS
         Vj2awdXKKArotuvNTgsp+OeUygUGbBjD5gI7w0wqelC8FVy61cDF8vIBT7NlJIbO6f/P
         fgO97Xns0J3oGOHTyzGdLIGWTZFn5JIKt56sDJZWC/Sve8OFGJDdFDaw1czs5n01rKOm
         chE1AxMCMbCl8jYcyeYll+b1NKrYFQQU00U11kFU0+Ko172o/EkR08ii/5ctiCTKHf+E
         XUF0+Jb+L3tr6/Ju/KRPYe1q+VvkAVEdwsbMEI4pirY/eypE9cJHCYXG2+MAawscXTIe
         GuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753734; x=1794358534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xG5t3xikeZrgWEXDIQ9E66WF0APj2TRUKkrk3j8LkpE=;
        b=gaHcmHyPgsid4wCxzNEvcqc0crKZ5HQpghkmfWYVhY0zDxh3GUQVqdc6RbFlamUTfp
         +U1RjME311MplVVo19PmYH3ptQkTEtHi166JRK6SHSLEtl6dLZwpVeJA3xKI+YBc7kf/
         toIHU7rLpd5o4y0swv8OmxaQilv0kg7DgLDDW/HAIPSjn39YiI7zGzAbCI+NMhyiTFe/
         Ot0lDXuJ4XOrT3axtBEjKP8u/fqkfa3WhmXh2VA5/tgE1M0dJaOXrWIm4pqf5WS9ON0M
         Gw45JMsDECvH41klvGYyrSe/OfqlRBAkdyixUl02lTX6yTyl43lrHwT1J5WGq6+R9f8Q
         lNPA==
X-Forwarded-Encrypted: i=1; AKwUvBzWjbwbwF40S600MqS5l3ld3WH4NhnZu0TuWs3SkmHfn+u03WRXX09NwxC2aSYwtubN/hZC@lists.linux.dev
X-Gm-Message-State: APuU4Z/sLFFDaLju29vLZgv3XX3u/HC3/P7TX1kg2JdzBviPUGJTVLDE
	tn6o/oEzMD2KgTSSX+PLM9ZbRcoR1yIbQL3+zZwlEU+M7rK8pAIgSQ8O
X-Gm-Gg: AYBFou2CFDHs8V6kkascLVehyf25nE1GDSWrPTRzOkejnx6lwl7UtV2r69KgF/IkYVX
	+61msutp3zQbrqocUdxJRhhFBY1m3ZuxSa3MY2VBbMVu8RNmFogW7jFYek5yjq728HG9zSuHAHF
	Yh4JP5v3DRGuKzhXZquH3yuisjbUHIu5SqlmPXCbcrN9BAoO0/LPpCVGgU9+AR1I+stIWgnHmuh
	1uG5Bp/6hWDq2dMvfOJM1i3jpQk5pHroTZPAnaFkELKXDGpOQIbfA6CsYVaQHnswZ1fYXc4SmqQ
	uv33u5kd7ogjNXYp9zia9hUagD3iCx4KV+yK+YZItSYBCvlloBUEvtB7IbRurnkAhnyxSzwyr/4
	0/Cbf/foKSEnkXPdrkADru6VT3GVHT3kKtZyu3Bw7BE9Vw/uGa7VSSA81CTErNEPYsggxvV/Y4q
	D5qy4yT0U29V90cYX2NCTWomO6p687Tt4eMCNMqZbgj0MAKzgzNmJbY6I6KJaCbUSPo0gFaID5/
	86bl3g+5IjmdlVXlkH76OjKe7ZxDMgNhTZ66PNU1hgPOBfDtCsyDAg/TJedOEUGDzEdWFn1RrPj
	K5LNVLR1Dx6lIkRhOQ==
X-Received: by 2002:a17:90b:184f:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3ae897e06efmr11479861a91.64.1793753733906;
        Tue, 03 Nov 2026 16:55:33 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09445f7b3sm1222403a91.5.2026.11.03.16.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:55:33 -0800 (PST)
Date: Wed, 4 Nov 2026 09:55:30 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev,
	linux-mm@kvack.org, ntfs@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 18/34] ntfs: use the generic emergency read-only state
Message-ID: <auqCgguXEsKCq9p2@hyunchul-PC02>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-18-2f44f64f0b66@kernel.org>
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
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-18-2f44f64f0b66@kernel.org>

On Thu, Oct 29, 2026 at 05:07:09PM +0100, Christian Brauner wrote:
> Set SB_STATE_EMERGENCY_RO instead of the NV_EmergencyRO volume flag when
> an error makes the volume read-only. ntfs_emergency_state() keeps
> telling a shutdown (EIO) and the emergency state (EROFS) apart so all of
> its callers stay as they are. /proc/mounts shows the volume read-only
> again.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
