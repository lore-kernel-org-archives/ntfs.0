Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732035;
	b=WZcqDrryyLPalhZCh2P4qlupC3JD2CU1uQNIGNQ9FBX7RDNHpW34frUt3HV/hLFNZnkA
	 38ck78O62fCustkNHBXYgzPNUQXnDcXGdZOm5pTHAHJxfAqXphe9Tf8DMFpLaPyoP/TmU
	 6VJH1JFi2o7vigcAP/8duLjrlNhDBy0MPZSNJh3HEruw4pnldJ3L04fVVz19REQHLLrcg
	 LBgmmJSbYFQ6PCLQOT0S5Nfw1rs1HA5etj3h0Umh112+CdgwU6vTCPkmSP5BSGm5T4rFk
	 RXRETg3op0WUXLcdBguIRKMQXVYm8875cIXBVGdriKjE4XKg0NH+Y2Nml1jwImqKFlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732035;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dzcO1ljQep1WtWKLzhtsWsA4ACOyuIv3JO6N5+BEqKo=;
	b=MgRIinMu7IE5BYvDFvEpIHrv3YPtmY5FtQbSYWGqlFxZMKnjqpFRA94Nr0yXPwfStMm6
	 NriIxJjp2zGXlGy6kdlm7zmxw/BNTj8c1BKPIksy3VYzSVc5sEfoSjF+L6lfqQ/5AWsg7
	 BSqPh7/6qzNjqfzT9RXx/jgEBWUk0b33vyZ1mzsMI0fVRbKQVx6asML7dvSoEd6JuQVBF
	 WANm/P0XIf4ZHtqCTTsnlxkqNw6Sycp5ut5FXeb5H3szB0KTRYYfEOSXlfQ5GHpDqIWou
	 HdkoC5o2gYfpar1QrIhETFCs/cuCX7yL1OYfcaYy6XBxsDF7kPChwCdTKqNIP5Q6xTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJHtieXn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8516606A321
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 22:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJHtieXn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431491F00899
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 22:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795732035;
	bh=dzcO1ljQep1WtWKLzhtsWsA4ACOyuIv3JO6N5+BEqKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FJHtieXnn/5kyPdGQrLtSp2ezUsBafiLPmUDPuPP8Z6rZpFdYIjChszQD2vwbLCPy
	 ToDJEKDB/sY0sUfv8/JIpjQfQzpErb3J2k7OmDRpZurJjpQ5RAxdcbbKj13mK0ePa/
	 5VnMAiFt9daf9cs+2Sqt1aVOwG8HRtbigJE1U420PiIRnKWZwxSylC6rYssr+MNe5y
	 SlZGiQRfnINdQ/14fiJljINOee3aXfudDXs7i89eCTKuOJ09eRTPAEZqFd79t8FGXJ
	 iYlc8/aaHp0KJN83cMY9Sj4it15gvnc4haJ15Th6Hy6QRaZOxZx69/zjnojzoEzx5N
	 CCaLJXnAwuflA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c51bf011392so224354066b.3
        for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 14:27:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFIrrkro9lKGcDHrEibwG2Wq+5dL1Vnh2bInHaL5FVadzkDnw6mQSmgMxzD9D8wlQTzrsnC@lists.linux.dev
X-Gm-Message-State: APuU4Z/0IAyocgNYF7Tf1Afn+V2pEl/12rL9HyxmD1x2EODWEpRdyLcg
	oTwar5G3q/sIw6txTk/5k0NnHOOXb8WYyGZplmkf9qvPFD3ZXJ4OxR27UVMA63hC2ONxxgpMhh6
	2VVtmLHV3U4GXC1Tnhs2aO3OwRfq7lKU=
X-Received: by 2002:a17:907:934c:b0:c51:282b:5489 with SMTP id
 a640c23a62f3a-c513a4aea3bmr1775970966b.3.1795732033895; Thu, 26 Nov 2026
 14:27:13 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125-ntfs-01-v1@snowrabbit.org> <awePnaRhBQLahPpz@hyunchul-PC02>
 <20261127-ntfs-01-v2@snowrabbit.org>
In-Reply-To: <20261127-ntfs-01-v2@snowrabbit.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 27 Nov 2026 07:27:01 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Sacb2aDzfJYKiqay8QWmH9dkoeFfhonDkeg7c7MX9jw@mail.gmail.com>
X-Gm-Features: Aa3M54po-v6bUbiFArbvKTTwwy66ZUEHuur8Xwr3gZIwPtSHYaBnwTAfUdiyNuM
Message-ID: <CAKYAXd-Sacb2aDzfJYKiqay8QWmH9dkoeFfhonDkeg7c7MX9jw@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: keep i_size of a directory equal to its index root
To: Showta Ishizaki <zakinko@snowrabbit.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 12:50=E2=80=AFAM Showta Ishizaki <zakinko@snowrabbi=
t.org> wrote:
>
> After mkdir, stat() gives a size of 0 for the directory until it is read
> back from disk, where it gives the length of $INDEX_ROOT.
> __ntfs_create() opens the index root but does not set i_size from it.
>
> When the index root is moved out to an index block,
> ntfs_ir_reparent() updates data_size but not i_size, which keeps the
> length the root had before.
>
> Set i_size in both, as ntfs_ir_truncate() does.
>
> Without the patch a new directory was 0 bytes and became 48 after a
> remount, and one with 300 files was 248 and became 56.  With it the sizes
> are the same before and after.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Showta Ishizaki <zakinko@snowrabbit.org>
Applied it to #ntfs-next.
Thanks.
