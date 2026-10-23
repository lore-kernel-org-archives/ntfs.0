Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716333;
	b=RtJ168KoH7j3ysGZ45KIlF49jSHY7HXqA9PzEP1K9tvSkUObmV6tqVIRb7Cy3BAOc4ZR
	 LkKSB9HOGXOQcI4vIWHGAbPsAL7rBqMpq8jAek2Md87IPtebMJk+iCqurAJcY4xXM0f73
	 8WJYd7Ult0+6Jai8HJRJPEWPkqTm5zG94c6x7pQYgk+O+RArgfhe/uY5J4T1gNToWmM92
	 ey33rkKDwoxAO3H/JRQz0bQWpD9T35MwdCNtm7saDOyGecGUihY+1gXsdylj+XBEBt4fc
	 exlj3lQPNpnV3uyX3uVlWxvamMPrjJ6nAFAdf27N4zkJDBt2thXUv6gOkMLxa9g0XCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716333;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AAQh0i7jbvkpP3E62fivludhw4nryYEpLcoje4KNF1U=;
	b=Yram0+3X9ahRpC8o6IdfPgeJ+GiQjpYOPZPgFdxHZkuUEG/mBY4wAQ7AEkLWeDiSiQoY
	 BGK0bDCDbf+zdbDpdBcPNKDoGDBGqOLLnWPXkj1tqlNG2Y5jxWtd63wRK4g+LgEL2jb9/
	 +lSAQd8k7Cy2bxhXa7BPHGOnau3D/q6f10kzhFf9oOU4hCIvL0GrJQI8X0/h2k8K8KL44
	 6HGOG06TSCNi3HgyFG5YXn5/o9T+VCbmeGWT2BRN9vmu3W/ZTG1UUJvqueKy3pk5LyosH
	 pxEJAWzQJZI3rY4a+ASC7Fc6+WNth2seAwKsauvEgzndGwB71gCie3QxROOnMcfbJ9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=al+1fSso;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C42606A31D
	for <ntfs@lists.linux.dev>; Fri, 23 Oct 2026 00:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=al+1fSso
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028391F031E1
	for <ntfs@lists.linux.dev>; Fri, 23 Oct 2026 00:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792716332;
	bh=AAQh0i7jbvkpP3E62fivludhw4nryYEpLcoje4KNF1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=al+1fSsovOUECz/B49QVGFN4AO4QVwKaVkBqnQ/L0SN6BhPNXo3XXUYN9jSAMC9s0
	 3Slua+6Q+M1WsNMbhL4m+IAWUvhgG7WgcXjxtM9uj0sjePX95DDSr9w5K7tvox5fbF
	 Huzgk+4EKhVKsGtxCvbJnJ04T/cKTvpFXjQK6svs8EN10eqv+mi8myLjFbhhCy33Ho
	 RGSGr8BuVtwYIvfbWPy9YQqQQnwRFWmsTB2B6o89XiKu2nTET+pDb3GfmNjkbd/Ev3
	 C8/+NEyF2Kc+JW8BpomKrHm6s8vHsLBGbQpk2ltptbB8saxCEm5eCR4+4pmCvB8McY
	 VXtIOKx3u51XA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so381404a12.2
        for <ntfs@lists.linux.dev>; Thu, 22 Oct 2026 17:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByTPAVZRClxkjITkTIoWUu8zUP9sXbanI+TNmClJ8pwunKnTS2iXNch0MPCkuwGt0cSDVnB@lists.linux.dev
X-Gm-Message-State: AFq9FYLmolW10NH4uNUGmL7j4dzxXauc74DiwCKVWdOoQvxTLe7ia4kZ
	g3mIGbhwGwV71D1aWLpZnitJLDljFc+71bi8GPo9ws4aTsRE+pYgCbHbfIfmEdZlUEI1sU0q7/t
	EPfaSE0V2dPDe+FMf5jYbKk0tiELj9TI=
X-Received: by 2002:aa7:d98b:0:b0:6b3:f875:acd3 with SMTP id
 4fb4d7f45d1cf-6b432bdb4camr1142448a12.33.1792716330643; Thu, 22 Oct 2026
 17:45:30 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021063221.1410183-1-zenghongling@kylinos.cn>
In-Reply-To: <20261021063221.1410183-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 23 Oct 2026 09:45:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_y3hDsUB+qUm2t2CcvockVZkh4sHCieW9k8QCsMz0PtQ@mail.gmail.com>
X-Gm-Features: AclHuK9TBXmsgFBxyj4_0RYrmPjzYmIzn1LVzfdrY7oW112FOL8bQGUcDmPSPyg
Message-ID: <CAKYAXd_y3hDsUB+qUm2t2CcvockVZkh4sHCieW9k8QCsMz0PtQ@mail.gmail.com>
Subject: Re: [PATCH v5] ntfs: handle a failed size rollback in the write error path
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 3:32=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> ntfs_file_write_iter() extends the data and initialized sizes before
> it copies the user data and restores them when the write then fails.
> The restoration is best-effort: both results are discarded, even
> though the extension is already recorded in the dirty MFT record.
> When the restoration fails too, the extended sizes reach the disk
> while the VFS inode keeps reporting the old ones: after a remount the
> file appears grown again, with an uninitialized tail where the failed
> write never put any data, and nothing records the failure.
>
> Keep both undo results: roll the initialized size back first, and
> roll the data size back only when that rollback succeeded.  The data
> rollback goes through the same VFS-facing truncate
> ntfs_setattr_size() uses, which also supports compressed attributes,
> and keeps the VFS size on the durable data size when it fails.  Its
> shrink clamps the initialized size to the rolled-back data size,
> which can sit above the old initialized size, so a failed initialized
> size rollback would leave the clamp in place and expose the
> uninitialized tail.  The undo runs under the mapping invalidate lock,
> like ntfs_setattr_size(), which the truncate expects.  On an undo
> failure, set NVolSetErrors(), which the next persistence point
> persists as VOLUME_IS_DIRTY, and log a message for the errors=3D
> policy.
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
