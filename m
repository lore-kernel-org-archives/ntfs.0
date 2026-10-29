Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263949;
	b=qdZ4mI+TJ9yf5rCN1ZKMDGKM5S+f95mWm+5KzmYydcLok04oCA0G6KfVt3doHdi0q0RB
	 MGohjR9YMSzq4gficTR+xDc8CAykNcSlQl0T8IuOls1FsRiyI8wSpZ7QM/7rJFvN+Xww8
	 6CXaSdjsVNpkfYRmDugI0OyLzSl2jP2gHqHFHjC0LoqBhaflSOIRxabaSNjyFIzfYYRfv
	 B0vC+DJaVtFop9MKOaCjfN+VtSEw5dtOHQktCRKJus7QsFy2Zy+dCyzXfIe6UWV1l8OnL
	 xPKQKMjfm8uMzZRtznCdwscrtnb1zO2fJdJmklNfXt4HwjC4AfdQCOYX8hLJWDfQSOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263949;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YLnVFyFONr6IZ0qWnzE2VmACyWLMzOH0CpLjhaa0LKw=;
	b=uIDQdQGXn1nRyrq+z6slmHV4PmU26o8SEMaicExhpEc0ZKZrnOGaEIs9aZG8SpVX8I3A
	 40NHEITLDtUconzU4qHnbeVGY/uNKE5f5JrJnnmVPkbazSF52bVmov2rY6j7XYJEroutI
	 hrwzDAXlmUrGcxmEEOIwf6FY6lXyGkZBVOc+hFLKBvEmPlXpWZzegh+oEoex1NqGxKcAd
	 PpyqsiUMYeYz3oOOpzW1nREGH0cjZfzpjV+z4alAziiSXG1SxvBHf6cu4mja9bFLmeCj7
	 f8RgGSMh/zAsDO8/rt78yHziICbmtxW7wgTr+Cq+KYf7kyQDz3LzpSGMkXQLbqnLv5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpBudgLJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43726606A31D
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpBudgLJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9351F01829
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263949;
	bh=YLnVFyFONr6IZ0qWnzE2VmACyWLMzOH0CpLjhaa0LKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZpBudgLJKXWv7IjZEBVZnlYK1e81SDSBgKFVE3jfVrlNMMZmTdo9uKOMDnXP2FGRV
	 llg6ZZgC7thyIwFE2agOQOBAxbxwA7uM1lSQWB+ucOcdMUvieFH4fqSstJbddzg322
	 WG0jNgC0T6C843mRcCQzq5fMuWTfs8D5ggfDYbuTop6/VJLmjpxWBrXjIzzwQUcGfP
	 qtNb8ZeF7rHVjZpbI1Igp3c28AsFP4DUr/Byhgg5E94Qm8AfSoybIt0dLJZJNNLoQm
	 Sf/jSBsfF8LlkjAAkZFKAoDMDGPD8fIfNWBmXbV31PnXV/foSdTTbrj4Z3PD5p9DxQ
	 FqO9BGWDWIQqA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c46822eefb6so238653366b.2
        for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 01:52:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqaFaarcegGP0qyWosN0MQcxkavSnCwF54mEiYAFvqyqcmgPfgbwtF/CQAy1YhXxu+cM3C@lists.linux.dev
X-Gm-Message-State: AFq9FYKk3isOzpzLpKunKrsln67sX2BJNgLhXCO5ok5Dw6U2Nt/qkiUT
	epuWJaYQLCBetd5PGAzQQDB/Bn5wWkEGp1YGRQxFtqzwV7/gaejWbmHV2WF5kTIc1Dmwcg1tL/u
	jOEPSOVugQov1aTHI+642L2w+DbhJHZg=
X-Received: by 2002:a17:907:e0c4:20b0:c49:cdc8:10cf with SMTP id
 a640c23a62f3a-c49cdc81499mr178546666b.40.1793263947788; Thu, 29 Oct 2026
 01:52:27 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028080656.1027283-1-zenghongling@kylinos.cn>
In-Reply-To: <20261028080656.1027283-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:52:15 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8F3vbDWJXQPpj_oBU-OhnUCEvtmfXPHAFL5V-J49hJtw@mail.gmail.com>
X-Gm-Features: AclHuK-VCELxn05ltUOsNiLGpudT_YW_HimgIUoBT1WVRj4F9xgQqRgf2Bbe040
Message-ID: <CAKYAXd8F3vbDWJXQPpj_oBU-OhnUCEvtmfXPHAFL5V-J49hJtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ntfs: keep the file size on a failed initialized-size extension
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:07=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> ntfs_extend_initialized_size() only extends the initialized size and
> never changes the data size, but on a failure it calls
> truncate_setsize() with the old initialized size, which shrinks the
> VFS size down to it and drops the page cache beyond that point.
>
> None of the callers rolls the shrunk size back.  A buffered write
> into a hole has nothing to roll back - the data size never changed -
> so the file keeps the shrunk size even though the data size on disk
> is intact.  The mmap and named stream callers return without any
> rollback either.
>
> The sizes did not change, so nothing needs the shrink.  Remove it.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
