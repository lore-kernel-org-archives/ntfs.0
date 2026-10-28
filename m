Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793177146;
	b=VBRNH+U9VAtnFW96susiSEEc5kJl5bMT/2doH652Pvh/8yVE5Rx3L/uhK/AWH9+fApEA
	 GIlC9t71uTiEcR9V6FXsjP4oGIYVS+9NRPCkEdLpgftQF+mD/0UF6k6JmIZzqu4HZc6ap
	 iuaJiH9AcIWP7wYUwIg1Pf8zbzrD3EW0kOQMJvCWjHk+AnWbttZhUZesJcyO2S0f7Pt9C
	 StcHVSsGgPOEwFyyMoMgxCtZWK02a7jlCML+MMEp252laUgrVs79FqceF1Z6PoDCfEX8Y
	 h8UFq3uhIZjNFmz/KUgZzl4TpuIedVotNIXRZZGOQxLrONhp2C0dyoGRUdZlt56p8EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PfFuohai/8xi6y5wHXkId8xIvnBmjmEUdY6RoU1c1kQ=;
	b=Y5kiA88TBzJGGvXO6JkPbFXl3yV16WJ1sEIWG8Jc8TDz155KBIwyQ6Isxt3vYWtmJluq
	 ENBnolzL/qFTG3BV6iQUqBOrKOtx7Wrj45UHL38KZwRIHkWBSiM3r4031euo1MnnDFuYF
	 Rf3pa5+Sv+K/qvkD65A0pbDwHPdxNjKaSO4YtGGHgdEUJGECViSIeVsxXg0wC6uVA71dJ
	 rQREzBMbfygU+gB9nxM24J0f4AG8IVMvi97miC8KOqL0qSiwxjF7X2uNus6riwajkaqDu
	 /VWfQFwciC7I0Z2+EideuUW+8Vl+7eHel54tKnuPpobLTVlOnofFSPQfFNzXmjPPCSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rz1Qhh+8;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95432606A31A
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 08:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95432606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rz1Qhh+8
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e946155442so5309335ad.3
        for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793177145; x=1793781945; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfFuohai/8xi6y5wHXkId8xIvnBmjmEUdY6RoU1c1kQ=;
        b=Rz1Qhh+8aJWCpDK3gmeu6C887GoJwMlxOsWun5Mfl/thMXfB9XAptrETjGRnMNVsz+
         7N9cC0L6WMcxfxCgdmLCW56LYxKH3WnpEyfEXlWd4DyNduftkaDCySvoHY1my+VO+9Vz
         bS6LFVW4AtlVuCwE0FUII9dqi5PIyRAVoB0uklo2nk5wHUqkbD3BcQ57BrrSJq2qtx6D
         sAyQZuKJ4V6tzP4VhrZULjMyrlcedHj+M6xN+TxF5IkPVga9lTJ/vdhNrD5R0Iig+YiS
         aIH1iN7KKlLTH5d/dfkQXejlbcqCjvEXSkvSyInQR1ZQAsz1O3DUUioAnV2D07+v7ZLh
         2TLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177145; x=1793781945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfFuohai/8xi6y5wHXkId8xIvnBmjmEUdY6RoU1c1kQ=;
        b=c3bgAGLvbrOqXW95RA95vKN5wICR66Ee3xdxBfjZtW5/ILMS9P8DKoJ12HIX3AoxkV
         z2CjXB5Zf+rO+hBvZS0xkZNWo+Je4CqAXqVC3jMrt49S5fBHlEtpK9025n6dINm16sIK
         +3xf9zNkVtEwp4feNZBQBk08lHqa8tIlJc1QM0zGp5aydO38XPRfWKq7x2SbNxSTJ97y
         6ggp1CPrWR+I7TdFFTFdpW8CwDhjJaHkGe7H1mWIx5SlIKpdJbDwYgTlHgzr8JJyHHcm
         XJVHTW0AWv4hBIJtOCzNe+6fbDTGzUjjnCWSiVtEQhTfKVxKUYMIi4cXv0cws1JsSEWI
         gkgg==
X-Forwarded-Encrypted: i=1; AKwUvBwIr3r3sPVdWaR58+oAOKLqNCyS0eRf8mGdOFiSj0cRYur8616w8wfmWNT8UhtXyuJtE6ZV@lists.linux.dev
X-Gm-Message-State: AFq9FYL+s7nh7ILoWCf171OP5g2O+5uysHhFsSjaQiX9zNUXa4le+S31
	xeTnnZJfOfuOoKCS8sSxky029jJl2ozEvbPEn+VyR60AUaDw9028Z3Ej
X-Gm-Gg: AYBFou2jkv/GMpEE7rXbOOGwag3k1P5qQzBGGJbA4kCC5WDSWACinZ80cQdmpTJgcwj
	pYxwhKw7RYJGxqqJMmJrNWGMd9bx28AUY5KIjZPnhqx/q3lTIC35CZuveocwrv4i9xieBrPdVB9
	1L8oDa1bviW3R5NKgd0XzE9Bx06GOt6mKfRnWZkzQIFFVFKjLXTpXrrolTIbSPx8dCVOJIFwreZ
	3cxiM5r2u0eHLm5XUJOagHVQ22qBgn7t+qUqM4+6m+zvOxjvHItbm9Rezio+azFzJ0xMhQLzrOu
	x4kUW76VBwenNxteyk89K1hsMIy1X9lpIaAvD8XOknfhBvJAXz4jTfD0jre6UmwCOUCEjR3cHXD
	8Vsvyp/LZwrIuVWTXiFMoOf1kZwo8Hb1mYsVZUKkwjI05RThNHWJdb6FXPnnvby2RnvDXtQd/RF
	bV3/LQ/thDI1zDpJ2mqKWW5hZ3yhOxoIvtTlJe0Oh1blCc5bPFeHyqW326vQ/MYG9qEM95M8ch3
	FTmIak5BPkQ1nVXL5iq8EBVV48l6JObEEOTSU6SN5A4XW9USjruVs+i+CiELdPkENPGigNTAgwI
	oXJGJXvsYB/fAiJ2mNw+
X-Received: by 2002:a17:902:f548:b0:2e9:734c:5026 with SMTP id d9443c01a7336-2eb004fa1acmr16284795ad.22.1793177144783;
        Wed, 28 Oct 2026 01:45:44 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm19285635ad.29.2026.10.28.01.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:45:44 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:45:41 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: rtm@csail.mit.edu
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev
Subject: Re: huge VCN in ntfs can result in a kernel page fault
Message-ID: <auG2NXweYw_qjWL4@hyunchul-PC02>
References: <10091.1793100344@localhost>
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
In-Reply-To: <10091.1793100344@localhost>

Hi Robert, 

Could you test it again with the patch?

https://lore.kernel.org/ntfs/20261028084248.2149976-1-hyc.lee@gmail.com

-- 
Thanks,
Hyunchul
