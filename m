Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474185;
	b=TJuMIZpdhkD5FUG/zyPaSvJN77pw6pt/pkRY8xWJpCtxY0TOwwqt3fViGgXWmkQ0C8VU
	 1Fg2P3yDgmu7o8YKYrLx1WYsO704q0g+1uZzYXbZJonVHPl547dWqn8TIKCw/2mHVWRS8
	 jmfJy6py/AqUC+MgJWBIXoQ0253jEOAejbx7/LUANJyEOLqXs6/Kn5ZyQcfcdIC9TKkQ/
	 h8UhNVAk98K4GbdY9owp3BHwt8MsWmirrumjLLu7wclqfmXxvexp70GdL3vK9vsGK5mrG
	 6KfLJiZvGZGdSAt4sGeYLgUmtnQVHEW7AyrQ004ggXJR6tOqPp77Db5pCh2A1WYSLlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DYjyMUDiTB/93xol5uPg6JRqArSef9ePHY7C/+Zb8tQ=;
	b=19YgEdneVeIfGSjgjEZQ0NJtS5hK+kSe+JI9nqIPHAbYBNJHxT5CrIcvGkidALcuXWn6
	 F5J7o/ByNCmcp2vig78wmwGCTGdcmKYLZDzRfyM9ilIoNat9A/YzVv8edejgeEmYsazZx
	 X6lFZMU6eFPf/SZms6jp4roB31xul8qliWysZQxjkGqVRLviRm+ttY6zqX2riBhUfmkEq
	 yFyHNpFCJf9qAI6lLKCGRPyKq4Te6JTYbWtsUJIwvRs4qDn4VVEaHTHAs638+OtfFhOx1
	 +EFkRSu/0KtZTqyyTRif95Q/QezdheInA5hSwzmkJ83ipMJ1TZLZz+WXlc6rcPUfYHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j1Rl7dIa;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55177606A31D
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 05:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55177606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j1Rl7dIa
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db80fcdf8bso16537545ad.2
        for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 22:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474185; x=1793078985; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYjyMUDiTB/93xol5uPg6JRqArSef9ePHY7C/+Zb8tQ=;
        b=j1Rl7dIaN7YU+KUiAhVkmtwnTGJuNkEWYHeaHqX9ANfXcnlzPdJv6deaDApALop7gy
         GLosWK7l6FyJImUVxVLtGtUcZ+bYSoUpbdLg0P8FK8+VIRozZoX/V8vDhtZNiqTNWbGr
         KL5Z0TqMmXUh0ZraxWsYaweu/Uxt7rTzu0PJetvcfPf2OAp1gktKF4F5/uIpOzmhElt3
         yXPqrn4xgLAUcO/wKBI28ixTi9NQbOadTBvoANCc2GYJQAaUt0wz3Wni+9rXPKicbsrz
         YdFDR+RHCCyd4yEnrZ5XBLeBHar1JMEeW27EEiS6gHJ0+4fEKPoAyZvf+fctYmZdyqOS
         n7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474185; x=1793078985;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYjyMUDiTB/93xol5uPg6JRqArSef9ePHY7C/+Zb8tQ=;
        b=y9nUAvXpXHk3B6+Tx6+QGSpbXWOqoeJqRHmGkBc9p7xZc4oysl6MYUtLF+Q59Oo/Lz
         mpImTfQfnQ05w5rOqvTL8yaXsIjNifo2PB4uQ/Kz0k42sTlZ5YHwvcZf6qTOcpBI1Y4V
         O1RDQGVTXAkVvXj3VMSs4FpIQ1Ojk2r2bBmN7/ItrnhApoZtYGCjooUb7n4sF4sd6Opl
         bqbt9X2wcDQjYsfMC8MmVD5H/keO6bsb4zvNP58F9p6vIK04T+T0fvBzBdozeGhf/FVw
         VyfkkGjV/ygVZQ0aFj1aw8cYlPn0zZQJgndoW4UIfbdR5q9j8ijRuJFwLPCMCfXmgcIs
         1ZPQ==
X-Forwarded-Encrypted: i=1; AKwUvByMBCyyy3mpV4KC0ioFTop5wPxEukiyhezydVHAcAoawH+bSsd9XlZ1sFe1shAVXFaHr0fn@lists.linux.dev
X-Gm-Message-State: AFq9FYLDbWyqlq4QjOU72LBO2bxcQWf8+l3ewb0dkXSH+o95deaRT2h5
	+aOz8ZAHvUpmVGXQK3F0ZazEztaNkOAp1bTJSV0lUQSfEyFBF2wHZJWA
X-Gm-Gg: AYBFou0yELCLSgYbrf4RkcqkDsBgteT6c77OsnqRLub/hHE1SD1dpU/26j6R5mQgDXl
	P6HHfWRkwM258cH+PePNzkwKmGlcsV//b66YBdfOrmVllr2S3EMe62xnYWogi+Q7lmqlwvfzY+2
	poRjSGRVVEkfIPFxDnSLa0F8umYrJQ9tuC1yg5X5/Qy28VyKkxn9aomFTByzP1GMt7aZeqmdc+0
	ZxQz4Z1AQqZX6xPmnVJmpNkTWGR8+Iua0x2sE1ymTCxAga8rBOea/XheUfy/7q9PFwEmGWw4sQH
	FFz9OghZw4ophbTfbgUOZvQOIjGjD/7mE4UaaqYGAuR2x4xnDBR+zUgTIqKSBdPK2sLEhhIQ0gp
	MsxK75ID3hGhVc+b2QK4K9pyDT1CJkYrQKkNOquHmgDF5o6GNjw6FWb/CLVcjuf/2ighQl1rI6U
	B68HyV9nP9dXpFYrxWYNxOxxAQa4r6/pDsFVR+WrNjNU0UtNXWQejv28agTUkFHSRBMC6poNHC+
	rp8Dbij5rYxQ9zc+rAtuKQJkE5CycG5rHnJbEZV+8AY+A==
X-Received: by 2002:a17:903:440c:b0:2e1:24ec:df50 with SMTP id d9443c01a7336-2e9a6c1bc3dmr77777985ad.21.1792474184444;
        Mon, 19 Oct 2026 22:29:44 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm8421155ad.51.2026.10.19.22.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:29:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:29:41 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hang Nan <2122295973@qq.com>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev,
	security@kernel.org
Subject: Re: [PATCH v4] ntfs: reject index blocks with a too small entries
 offset
Message-ID: <atb8RRptq6OWYemK@hyunchul-PC02>
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

> +/*
> + * Canonical offset of the first index entry of an index block: the index
> + * header, the update sequence array (one entry per 512-byte sector plus the
> + * terminator) and the padding up to 8 bytes.  ntfs_ib_alloc() lays out new
> + * blocks exactly like this, so a block read from disk must not put its
> + * entries closer to the header: ntfs_ib_copy_tail() sizes the tail it copies
> + * from the source block, while the destination only has allocated_size minus
> + * this offset bytes of room.
> + */

And this comment seems unnecessary.

-- 
Thanks,
Hyunchul
