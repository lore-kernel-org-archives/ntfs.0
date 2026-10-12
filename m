Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBB8418353
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806317; cv=none; b=Qjjp4oIazLjJxLtisEP1Up2FpwebKML27ID/AAzhhh2kNSP5uWvZsoXQ1pNtufhOPLxHc+1cIdvLG05fIo7R8Q/fqtZy4h3Dmj9Ciz6h/4t9fBEiVEN+3YQiyQStArUppss/uZyj432B0F2XapkxGkJgheLImPfMWH/dkKeN3+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806317; c=relaxed/simple;
	bh=gUGz6lwQa1a2dYxqinX1f5TJWie/JLfd3LgMNAeJK8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RI1Psb69RGkOnowBuKBSp1GEmjfD6XaMZGUfXWV0tXO4BTky3yvE9K5mrfLmV1ohHCRECNFo9k66Tt0f64NsI/RgGgfVJ3Lpggin1ojUaZytC/ln6mlqg/Hx00DLIUtTm/qwiRT50twYfRktvBc7ddNty5uVSLCkvrQpxQuqVDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuNc7FbB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuNc7FbB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4521F0089D
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791806315;
	bh=HYnvEiSRJD71V8Rd3An/g58Mos1BQ3rgGbWpmrIrJK8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BuNc7FbB7dmIXR8I0IdobeoJnMQc8AR5wbl5tXoKFejArP1OyOfbKdKyS9j1bXx9m
	 4ycefERmRZHCYVKo7wXZ1EENFWRYOdIJemtlI8aPmmR6Ill/wuZBaT+s+bpwT5NsbL
	 b0v40KbIb/r/9skACubhxVz5nkhfOdEXgf7sRp4SPlObSXi1lZiPKcngZ/I4opKpUb
	 nmzH8PTAF+3byc/QoKe/QtLRizuJ43U/9W6qsk0JpVKdEa6ZKGMzY/3zmRkW+pKowl
	 Es2T3R4vT4/WsCuOsAj7B4SPbisepUmRbTk9oUlzSk7qcmERB+kwHXs/vhCGBTl0LA
	 gM9iyZQQND/Mg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2055573c8cso210785566b.3
        for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 04:58:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXktpyvYTNJMu5AN8aKORhuVljqbHmJD9KhnT0QNgC+5IPyDWkfIsI0AhSQlbW5LBR6FSJ@lists.linux.dev
X-Gm-Message-State: AFq9FYJrwu94HiddDncM6PbIf3ZYsURp6l+tNN3bfI525x6ruUtX/tkn
	S/9fdJ0FhzeQAP7oIM9fJ6VnggOrQNNVjc/TXEqSQKHUT3cFpYqRBQt7h3yvqlPUslHKLDQOfyl
	vkhDV8SaGqRcG7RdBMwU8VrQOUOofAGA=
X-Received: by 2002:a17:907:3da1:b0:c2e:61e:f4fd with SMTP id
 a640c23a62f3a-c31a9a07772mr810203666b.5.1791806314541; Mon, 12 Oct 2026
 04:58:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
In-Reply-To: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 12 Oct 2026 20:58:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8UhVysoZ50h8GPFjD701y5frB8MvWA4Y-sP6PCSvexsQ@mail.gmail.com>
X-Gm-Features: AclHuK_zCh0yyDClvS7vBVflOscONkCx7g8dSTMN8zx_K7sJ0z_XwYZPqWsBJ-M
Message-ID: <CAKYAXd8UhVysoZ50h8GPFjD701y5frB8MvWA4Y-sP6PCSvexsQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] ntfs: enforce the encrypted-file policy on the read paths
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:20=E2=80=AFPM Zhan Xusheng <zhanxusheng1024@gmail=
.com> wrote:
>
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>
> EFS-encrypted attributes are refused with -EOPNOTSUPP in exactly one
> place, ntfs_read_folio(), because decryption is not implemented.  Two
> read paths get there without passing that test and return the raw
> on-disk ciphertext instead, so the same read returns either ciphertext
> or -EOPNOTSUPP depending on which path serves it.
>
> Patch 1 is readahead, which marks the folios uptodate so ->read_folio
> is never called.  read(), mmap(), splice() and fadvise() all populate
> the page cache this way, so one test closes all four.
>
> Patch 2 is direct I/O, which bypasses the page cache entirely and has
> no such backstop.
>
> Both commits are in v7.1.  I have not added Cc: stable; returning
> ciphertext rather than an error is a correctness bug but not a
> privilege boundary crossing, so that call is better made by the
> maintainers.
>
> Found by reading the code.  I have no EFS-encrypted NTFS volume, so
> there is no reproducer; the paths were traced in the source.
>
> Zhan Xusheng (2):
>   ntfs: do not read ahead encrypted files
>   ntfs: reject direct I/O reads of encrypted files
Applied them to #ntfs-next.
Thanks!
