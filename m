Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344715;
	b=AZY8rEv6n9fr2i3u5vVzm25nxdY6EBGLsjWHx3rcHlb27rKWAvVsSajp1b++dtgO/in8
	 rme+qXHZmJ42lIuxZrre4B9ZXJWHDXkZa2Azp5ra1UWzXnae7rhWYO+pSHqTe17wHA7uX
	 qI+25Gx8JdkFi66YSquGSWpSKB72iGE+nXpM7JrATHifjhufsKgR1EPMurkq4XVPBejUM
	 qi2APm1WheuDJ/RcfOoIxfAM51G9dkraDNBmHAcZ9mbhRiJeAbyqck4SSMOLMvu4es6+7
	 nMh1NxNtYb4hIG9GeuLtzVwwPpl/dgYDRxuzR+IW3aDE+I6SLpW2HL/4jndPek4Yryg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344715;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+jU8K94xAjYiywEJ8VshTm6rd9DxC8pS0Hn50pv8F14=;
	b=bKqnEM/w6Eb9TaYXuPjwIEtm9+XXl4fIE7imTh70I7KYzzc2CSQxzqDbrb8ybPN4FqUZ
	 8sFSlSS2gcYWZp5ZGBitHv8J9IA2LprINOEXGrTjHxDT6Av6yPqdVs6K7bsb63d7MpRjo
	 O5CJbcQMmF6BfutYeV4iAoxggkwaPON4LNXVDFh3hszD/e0+Wmxrh/xN83G8v2lan32zb
	 kMxqhE6y1t3jY6iZoelOfYThl8AhDSQxecBK6OPEBbvLs3GZ/l1yxjR5jV4wZ4HUV+ZPT
	 3FD7CJxBkyRr8OCi4vAKqsNgqFkl83F/hZdfK461GxdgGlpD1FDtGx9FULaEhC+6xEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jck99Jkf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68876606A330
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 10:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jck99Jkf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030AF1F000C4
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795344715;
	bh=+jU8K94xAjYiywEJ8VshTm6rd9DxC8pS0Hn50pv8F14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jck99Jkf7qoMf0NC8HWi54nesMdMXBVUUuPpE7DWPRu9htDqNilP40sHKQndGf03L
	 cYuW3314YaUi7EWP+TKcs9YopYB8meL2/KZvNOze8GCxSyuPFGD7bdGcHyCjJCmcrv
	 DYW3aE0FGPc/nqfVaoowrRe7XnQ1CDHBqUTMRGqANgfHvPR+pgHX/yWGF22uQBXFgJ
	 Y03Z9SYYpLhYiaS5LmZ9yhZdqDOd3WghSP0vBdBMlgmY0oEOZFKOqA7DVF8lIhKbx6
	 EuqvmZ3rXmftfByClfLJVeI8l8UhGyQElUoOEnW66rlwt18x+STutsvLXDJMHk/yUM
	 gIzzE9HxSSE1w==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c516a160d24so49889666b.2
        for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 02:51:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFEQGvLka8mJu9AMfgnix2eskEaIDGJXVPHIZGnwRvY2Ldq7UAcrHZdUu6n0kn0iNJV9yZP@lists.linux.dev
X-Gm-Message-State: APuU4Z+B+O3Q3mbVzm5+fprdHT+iv5oHpnErBETJkA6rlsINYruRwJD1
	jARKTnhmZx7exeG1rSndAQ4S70vn7nAjCevjMttoqbZxNTG7Kz4v2HfgbDypxKe90bqInaOcQiT
	2joH6xLTjG2iPHlLT+VRTNMQLGKurPH0=
X-Received: by 2002:a17:907:c641:10b0:c42:e6c8:e494 with SMTP id
 a640c23a62f3a-c513ab47855mr475814666b.37.1795344713676; Sun, 22 Nov 2026
 02:51:53 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-5-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-5-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 22 Nov 2026 19:51:41 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_LEPWSSHrHXJn-X7SoCxrrdGarcyo3PFBmWN=pM4mMaQ@mail.gmail.com>
X-Gm-Features: Aa3M54ovR4WvPkRinwSfIvYlrrzdQdjNbVsoP8jqjOaQP__dGiofWVR-b-7Em5Q
Message-ID: <CAKYAXd_LEPWSSHrHXJn-X7SoCxrrdGarcyo3PFBmWN=pM4mMaQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/37] ntfs: preserve attribute search context
 initialization errors
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:07=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com>=
 wrote:
>
> From: Xuewen Wang <wangxuewen@kylinos.cn>
>
> ntfs_attr_get_search_ctx() returns NULL for both allocation and MFT
> mapping failures, causing callers to misreport mapping errors as ENOMEM.
>
> Return error pointers carrying the original errno and convert all callers
> and the documented usage. Clear error pointers before shared cleanup.
> Make ntfs_attr_exist() return 1 for present, 0 only for a lookup miss and
> a negative errno on failure. Update the index and reparse callers so a
> failed lookup cannot be mistaken for an absent attribute.
>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks.
