Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093001;
	b=QD2MNRZHL/5u/nWjviJUHFVhAZjbzTFa23R8C3hCPbjNAwvo76gDMIniQCL07l1IPpxU
	 EO8abBK+jw//gLDuBuLu8Dx8kN0BM+AbeKUC01iwQxHw2U6fjGxyQjML7KGRrWyLT5uvN
	 /aPNPYYcOqaDKLbOVBf0hpCXFgL/EYsmFYKtkhu/nYxug+5VoXbFKQ9hKmM61e4RvNZtd
	 lXBZAN423lNHL8Zo8j/ZuySJ5nOYxnASa+3etMFZGjBHtrQW6LaA0JhwyUL6V9rRrgWhk
	 fLBEPoU7UHFZODzNkC5ojo8FaQZgLT42Gaobfb86MXBn9HcEQNYLhixP9Exc5XKc21Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093001;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZpmrUqEHskHm7Yfzl2QMlE2cj/pVeGl7eiRLC9pfoCo=;
	b=QTk3FdUy09MS87FA6KrPAR1hg47OsDbDMLS+FYb+j/yrHq/Tz6a4+1c3HCCCU+9JexTD
	 9dDXkiTvjXpfTXG7vUF9VhgwT4gt+74JO0+M1gv9o7WnzZBi/Ht124xuaRnEMv9j24ASA
	 kkgQBOOJGtcAZgxvuX16e8BVSqX7HCqYPMBL7+QipGSstIr0IiSY4wrWIS0NongV7QlFG
	 iG8qv11JaUMjwTdA7699oErJtm8vtfgpDB6PyE9lhHIZYCkgF5y7/Z9ItmkBmqawJhVk+
	 Go7YDI5PLVec8WFzhgv7KH3CdOCh2NgEFnLa1ftz4ysNNeRBLz3ts004tucyRivSclA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpfbwKG0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACCB606A31B
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpfbwKG0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2501D1F031E1
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793093001;
	bh=ZpmrUqEHskHm7Yfzl2QMlE2cj/pVeGl7eiRLC9pfoCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EpfbwKG0eOtmWr3qkD0KLNU4slcgf8jGwVDQBLW70jgfx4I4/AgaXkSpdWaLbKSZ+
	 xp7Z0oZnETGKAnQkwbXb0MV3QCyA/vpbC8m9aC1KzZg0Ctd9qit0ZjqQ4VBiZ7yelp
	 2g+PpZHmQ+2nN2W9QqTEj7mpz7fYt4b9plZ4I9HRmgB7PnsfaeNY3kbDOV0ey/1liO
	 ojb2CwIHuw4vuUkqNmStVCzYrksamGf1HSCW7dlJwMGR/aBVO1R6QVM/xc/BWc2PQb
	 mng5wuslyXcIiSq3SVPAKtN+XaA7QbPkrL4HYIKCiC1vCggXPvEoXWLZ9um9SUISgv
	 ONGmlIWwKquXw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c247f6687dcso590591066b.2
        for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 02:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwihEBinuKQGCj9peqaoHSE2AvObatmgnPExXgSn9XcRG4kkI/m9xBpkcsLlsi4t4OUerTG@lists.linux.dev
X-Gm-Message-State: AFq9FYLi4uFnA9XHL2Skm271IxlGVeOxd1eseVhferwkZN7SJXB1pyey
	uaOXjVjVR1XDTDAlmQg/7DgQfw/ImYxys9hSitdrw/blSaAO8AEgN+/cY3LI+Q5PQ7TxcE6Fosh
	CGrytm3AzA3mEwV2wehrN9gI6gqBbgUk=
X-Received: by 2002:a17:907:3949:b0:c49:9231:5518 with SMTP id
 a640c23a62f3a-c4992316908mr380586866b.21.1793092999740; Tue, 27 Oct 2026
 02:23:19 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <7c0b17f73a031ae5564825ab94909f77eb2387d9.1793043780.git.bvanassche@acm.org>
In-Reply-To: <7c0b17f73a031ae5564825ab94909f77eb2387d9.1793043780.git.bvanassche@acm.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 18:23:07 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Pbf7r3YF2rOZpo6sOX-3UbbNr1h7KGQJ0fh9M03UMeA@mail.gmail.com>
X-Gm-Features: AclHuK_w6Ld8kHOPNQuIC5yXLVGjtNE2R34EhtGj44KaJOMahykBSf3-rMwBjrU
Message-ID: <CAKYAXd9Pbf7r3YF2rOZpo6sOX-3UbbNr1h7KGQJ0fh9M03UMeA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: Fix error handling in __ntfs_create()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:43=E2=80=AFAM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> In __ntfs_create(), if ntfs_init_acl() fails before
> ntfs_mft_record_alloc() is called, jumping to err_out frees MFT record
> 0 ($MFT), unmaps an unmapped record and unlocks the unheld
> &dir_ni->mrec_lock and &ni->mrec_lock mutexes. Call iput(vi) and
> return ERR_PTR(err) directly instead, matching the
> ntfs_mft_record_alloc() failure path right below it.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Applied it to #ntfs-next.
Thanks!
