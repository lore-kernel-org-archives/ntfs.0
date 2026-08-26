Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98687331200
	for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743288; cv=none; b=Q190liIygYeX6VwdAEdiUMVnHnAjh5A43a6g6gWM6QdYUa/JvB3MtALiBS4qdWFlAjF/wejGTSxceXUJjTGQZFdB+Is7T48kgcQZ8c4xKxJsFPxxGcf6kFgFsKhJBUtR2ha4BNOVs4hHR3OKMTpzY5FeiwWutj/3ouE8NJl+YHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743288; c=relaxed/simple;
	bh=3TWQtl67amFd6rwDX6OKuST2K4ku3M1/2+nxyHoM7gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLHIH+HI0KnPrhQ/MQuXdxsvc4Yg4/4IFlPPQgbkBwmGn/5akcvRI+Ns+GPB9AtwAnI6djAJJzxYcRxIhqAmjiYldCAE7I/jyxhOH895ukAYiiCB0OYwgCbG34Kuvn0vjPHPJVn0iVLgcKR5CPXyAf7LGASqn9IrRn845wuX+nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWMU7PN1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWMU7PN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C8F1F00A3F
	for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 11:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787743287;
	bh=7C4wsVDXaSUv3AN3rf75M1YoJedhjqTP/brju4gXUkI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JWMU7PN1zYy39EtNyNL/FMee7DpKY/6v9IccA60YjRbJGRkszYpDeqdu35NNXG5Dp
	 SE7uHzCwC8gJOS5fq6oFbcJEahcwHxNH4gSNvLmoG2sCoTLMkIw/QeyB5eaUzIVv1E
	 pE8ixtjjtso8uYiS0KQxQ5Y3uiheiP3sFzn4aj4WlGcTLOjcGBCiYymcLrkAP2S10Q
	 dgiFXUSE3mwSzMF2ndNkrwIVvw9/e3WscuBPmBzVMXR5xMxGYstXQEhu+T/HCQLqPn
	 BZYc08krbgYpVOp+3ZfwkEjFiq18/v1cMu3pIXet8lT9v/bK3vai1B2Eq6SETSRnYb
	 zUopzKs5kJUCw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1670dad7a8so127974566b.3
        for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 04:21:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoiBJezSgLanAAm/tuO+sfyI5Z5diGjVvJ5/SWWmXRMC/0BKV1HYFhCuqC3FzQAkWwBL0Cp@lists.linux.dev
X-Gm-Message-State: AFuF++nnbReFsZXymvMnbtNf6/kkJbGa/IVADqPAeBaavTtWAkQuZyP3
	3ccadoUp33Byco66rmzLu6xD3VxueIbWuK8pdWobzQXGQMeRWR2U05XP4AFmhKw/9hXBQ/iFQnS
	aDVwdPnW3JMNt1/vXSKP6USQai+WR5TU=
X-Received: by 2002:a17:907:728b:b0:c1f:c061:569a with SMTP id
 a640c23a62f3a-c250bbe0e01mr718095366b.7.1787743286033; Wed, 26 Aug 2026
 04:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821053238.1281310-1-liubaolin12138@163.com>
In-Reply-To: <20260821053238.1281310-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 26 Aug 2026 20:21:13 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8gPPzMuKxrwXAUyLC88=uUNbUK-EoRWKWrKwNxXcKH6Q@mail.gmail.com>
X-Gm-Features: AcwNN1UM_AvS6ko4LRB3-tA4wHyLUpLmFBa43smy_F5JBEGofyR3qytF3sWqApk
Message-ID: <CAKYAXd8gPPzMuKxrwXAUyLC88=uUNbUK-EoRWKWrKwNxXcKH6Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] ntfs: assorted error path fixes
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 2:32=E2=80=AFPM Baolin Liu <liubaolin12138@163.com>=
 wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> This series fixes a number of problems on error paths in the ntfs
> driver: errors that are swallowed or collapsed so operations report
> success or a wrong errno (patches 1-6), a kmap_local leak (patch 7),
> and free cluster miscounting on failed frees (patches 8-9).
>
> Baolin Liu (9):
>   ntfs: return DT_UNKNOWN on inode lookup failure in readdir
>   ntfs: fail EA update when reading $EA_INFORMATION fails
>   ntfs: propagate reparse index insertion failure
>   ntfs: return -ERANGE for undersized xattr buffer
>   ntfs: preserve error code in ntfs_resident_attr_record_add()
>   ntfs: return real error from ntfs_non_resident_attr_record_add()
>   ntfs: fix kmap_local leak in write_mft_record_nolock() error paths
>   ntfs: only count successfully cleared runs when freeing clusters
>   ntfs: skip free cluster decrement when rollback fails

Applied them except 0002 patch to #ntfs-next.
Could you please recreate 0002 patch based on the #ntfs-next branch?

Thanks.
