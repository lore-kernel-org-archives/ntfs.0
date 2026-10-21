Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792545046;
	b=g/HavgCHUGKOcM/9swwhJiNLykS+3KgRHdQ952BbInhoZSLL8OzR1x880C7U+SiSraDT
	 wPWF652Mm2/fl6E+z2jKVuT/Sw83jnQlYmzH+bcKhcP6BjQ8/i9FoKN7sEMAilQO1swxG
	 1QdAzQWGPIT42WT4kM5IJVWrPIq9MkiBd1tigOLmkPmpUp1/KpSKsm4oONcZiVcQ4oQGY
	 jawdSQlMg7lFBkbBsH/Hy0HqfJ0rVGo8EjmBxENk5ca5Ikwrv2TXq3VCqpdkFB1i4essG
	 KUU+nu/SbYefPl8s2lA896cJnbYjPVUP+DJVxP6PMbLSPzYYYXaujGE/tobNjmGPhBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792545046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rNmeytlN5ww3q4yPCrJ/8vT9YKmJcPOSTDk90pnPH6M=;
	b=FvpwOZHeIFwZSUYOBLAexlv3Z4+Vy77LMvmYHOUt+8aajgZbWR9D+x3vjjxA5Ibg4l/Y
	 Z3G4VsZ8+koAmTwt5VTDVpmlVotWQp+kk48dFLhtJUFFyrnTdgbuceSxuG/eMZVOPpm4E
	 PaqumRLQiH46bTDnSC03y69X835w+rJ3iCuvWKHBz8fRjXIScGDun2aPNwBfB4mI3srYl
	 scPEpd489COKDT+tOirtSU3gt9c0Fp03B24YqHLyQD/NtICdIIv4WLa1QLExfxDdiILE+
	 VxdZ3dE7RiqWKkLcRakHikBSsbQ+pdip7ZMAPMcRf+tSOwZQSju31viWK0/pF/FJc3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JbLwU9P2;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA92606A319
	for <ntfs@lists.linux.dev>; Wed, 21 Oct 2026 01:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA92606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JbLwU9P2
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so125275a91.1
        for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 18:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792545046; x=1793149846; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rNmeytlN5ww3q4yPCrJ/8vT9YKmJcPOSTDk90pnPH6M=;
        b=JbLwU9P2utXlnd43cYZY1kh/UGtIg9w4rCREpixQ8+/sJIhgWCzwelShBsBCnmI7vw
         eduRsanNW/H2SSB69ZGHpHmA07mBu1DhS+MRwKFiFLKMAGvx8AdmVBweWy53ZaN5/Nc3
         sHlu8I6J00B5ZND17I2l75V8n2YIWQfOqsMcrII79+Yog/YdgiF12GmEjWIb4mYtkGGs
         OOgiuQKEP5u3wiaDuQjSiU/TuObq0Bgnug5m7PKCpR23tTT+6qv5k+ttRoxm6JgrEcp2
         edBMUnVaVZL5ldDuyhSrW10qe9NVXdNrr0NozfDI+OcLw95HXdluaSxHS2z5lAGWNbS9
         IoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792545046; x=1793149846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNmeytlN5ww3q4yPCrJ/8vT9YKmJcPOSTDk90pnPH6M=;
        b=oxT/X8N661bvjF2t8U8Juuz+wMfIn5TG52J4CI9E79JPtc4g4Pp3ZZ3G8yhWkG7cKj
         2YdLeNs+mgs+mgW0i2vQahD1uNbzSv7oYOcZ+4zQHaKv9nmLpGwfoSqTReAMsYnzasPB
         yGX+HXt9tOtjgrXX6UlOqOLUFluNXic99DdDKTJ76fifIml0Y76vZ+E2eGg2ctH5+JDg
         QRJPr3x+FZB1TdUxuqYzSgIDkKKelEQnHxoMC1rfI/vA4dzPeiTg2vTCsOc3CcfPGwOm
         jfRdiaDPLcAZbh6oO+9TdWZxDEOekfkR3gcwU7WlPz4ciyZ+tIIcRxeu10B2FIE9Wh9M
         tqLQ==
X-Forwarded-Encrypted: i=1; AKwUvByG+LkuZStkXiEm6vzjeZXIXfPDUAG/JLRav6s4yTu32b1bDB6DFBZrXOKFrHmvgysYHa5A@lists.linux.dev
X-Gm-Message-State: AFq9FYJu3LnG3cgUJRe3GzYRk360Z9bB6DPmkRd6/cxWVHIk0UrDYMYE
	FIWa8w/oQFGSRwOP4/aU56XjC5sNv2xBfU6BqhDw8NkAZkFrFL1gSHG3UQNNsTxVT0s=
X-Gm-Gg: AYBFou0JjZi4ej9ZipVL/rW+I8iMt7LjHUE08r78Si2Bu4gvJ5su1t/MX/tww6LRHsI
	Ca/mYdDRtii5l8gQuB/nW1+MZ/TfmZMO8bUo0jz1L0HNDVDS9neXl+a7Cg3v0nYcQ7s0zJtNxdc
	Fwtj1xh4FuZZppH/I6+8zQM6N0AxHkEJ/3KXj+TUCCvInO0sOaGmpWtLyvw00TSRSMjL981Kocc
	hneZgyhmfAIIuP5XV3R7jG1IZ6ZMaB0tG+7vwt+hDuZJVbQwdxvSUBr4R+YgvqIdPvXZp7yH+Ig
	Bj0sX8OpxOHmh0LYrb7zqZ3cYKieGHVKeFDwQQYSG1p4nPYWqkb91NX1o6lZK9AS3hJo/2yMsdu
	ckFuzVbwSGNVJYm17IL9YcQ3J3UrADOkSYjw24GZzD+WRIBfpRo2AnHUe/c3o3n6RZc1fclGI68
	ZLQm4PDo1YWxKIgdMEQJkOmz8a6eUie/ww2uQcci1OFCL48awagBbZzfbGoCASkDtNiYXxNDVyJ
	mizKsbf21c/KGfmynPbRzNKQOR7E0RonHHe6ftNfvU9MHM=
X-Received: by 2002:a17:90b:5105:b0:3ac:a7ee:676a with SMTP id 98e67ed59e1d1-3ad6592dd32mr2669609a91.54.1792545045632;
        Tue, 20 Oct 2026 18:10:45 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b04f65csm4764345ad.0.2026.10.20.18.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:10:44 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:39 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hang Nan <2122295973@qq.com>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev,
	security@kernel.org
Subject: Re: [PATCH v5] ntfs: reject index blocks with a too small entries
 offset
Message-ID: <atgRD6KhTU6RsGnV@hyunchul-PC02>
References: <tencent_162F22EDEB882D9E2691DEBF38D243CA4A09@qq.com>
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
In-Reply-To: <tencent_162F22EDEB882D9E2691DEBF38D243CA4A09@qq.com>

On Tue, Oct 20, 2026 at 04:53:53PM +0800, Hang Nan wrote:
> 
> Index blocks read from the volume are checked for a plausible header, but
> nothing keeps a block from placing its entries closer to the header than
> ntfs_ib_alloc() does when it creates one.  The allocation adds the update
> sequence array, one entry per 512-byte sector plus the terminator, to the
> index header and aligns the result to 8 bytes, so the first entry of a
> 4096-byte block starts at offset 40, while a corrupt block may declare 16.
> 
> ntfs_ib_copy_tail() then copies the entries that follow the median entry
> from the source block into a freshly allocated destination.  The tail is
> sized as index_length minus entries_offset and the median entry, both from
> the source, while the destination only has allocated_size minus the
> canonical offset of room.  With the values above the tail is 4040 bytes
> and the destination holds 4032, so the last 8 bytes are written past the
> end of the new allocation, with contents taken from the mounted image.
> 
> Reject such a block when it is read: entries_offset must not be smaller
> than the canonical offset for the block size.  Derive it from block_size
> rather than from the block's own usa_count, which post_read_mst_fixup()
> treats as "not protected" when it does not match the block size, and use
> the same helper in ntfs_ib_alloc() so both stay in sync.
> 
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Hang Nan <2122295973@qq.com>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
-- 
Thanks,
Hyunchul
