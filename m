Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4E53603D7
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835302; cv=none; b=MQK76xguRgijl+NkaPaKN6+hvoCKGqxysHq0gdGaoHarEB9MpodKQvCy6AUfW5u00Ec508xxjcMjiB2hHbZQp5FK9Dag+LG/0I6hKOd6n4d+joJR1AqPrJBjQl9QdtONHBe/ZuZJd56clJM6NAxP71oNvTcoulQrRsLTFaeO2WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835302; c=relaxed/simple;
	bh=lPkNSaL6vHbAaLOKMcW2T95QO4h+7ccotF/bxOu2Uhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zuw2Lsz9RoszSu5qoqXE3JQL1bTEoRIBLkSZaB6zaW39x8FABPEnFyh4Sbdt/yNCJtAhnE88+VeorFIquEnacAnAAAHoVTz41SE/y5wmxNpxR+rH73wqp4+dRJDFdq19l46Cmh5v6kPCv5GSOXqM08cjEC89LR9xYFnsZNrzUeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzolZ6j0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzolZ6j0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693511F00A3D
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835282;
	bh=lPkNSaL6vHbAaLOKMcW2T95QO4h+7ccotF/bxOu2Uhs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JzolZ6j0ysfQxIyINoKPbWXiNW5RZVk4DP6bV47IDIe4zZ+WxtYxOB+HtDsFhzZ0L
	 Rc8aGORwsh9dJ7anGj8meWjZWgS2reHaxH6nuHlyFtJbvAZKEXryY528EfXJXwdlPb
	 3Ys4tHiHRqaB/GeXXkyGKIQf9L/peErPkq5SKXbJnnbWWAeLnKlLRsR+5xsHwIXiAv
	 eUwuHAldI4iR9fw0NSDQ4DLQbSGk6FAWfd01b1bqYvaWX/rzJxuIPXK2j9QPHZM0OJ
	 IhN6SCOKj25S0+ZmUBWbzH3MjLdPJThaRS5SMpgyECq99wmAB+ktSom4wDmYQ1H4kh
	 Q7upI4Zt+zwVg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so3352397a12.3
        for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 05:54:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqgpqcrlxzbtrGnjgR4HfkH33FL2maeR1KgPDGQBUzzsZj0EirsOFXsm8zQf/PiEaGxnkLH@lists.linux.dev
X-Gm-Message-State: AFuF++ntG0RSAA+3X/xvMuQlZomL3If/eQgyulsJT8Td23nQiWpVFgkb
	Cp8vbta7dCp+ywveX0pZWdBOs5P8uZt5oOAXxDsODXraLPQz4W/pcx90cDQVGJqjbRqjoaKdHOP
	4ylcTArnd5Z/2Q+2R+yfoaWLbExBUjF0=
X-Received: by 2002:a17:907:3e9b:b0:c16:8799:fcb4 with SMTP id
 a640c23a62f3a-c250bc0fe60mr1642226366b.19.1787835280939; Thu, 27 Aug 2026
 05:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827055844.1673890-1-zenghongling@kylinos.cn>
In-Reply-To: <20260827055844.1673890-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 27 Aug 2026 21:54:28 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-UyKniai+7N5g2sWaTF24Vg-NwKzvFkS5KjtZm_XAzHw@mail.gmail.com>
X-Gm-Features: AcwNN1WPrdbI2t8xL8xGPXpoNor0PorgEOvdw00dGp_Dzxf8mvEwI34q7JKtPAw
Message-ID: <CAKYAXd-UyKniai+7N5g2sWaTF24Vg-NwKzvFkS5KjtZm_XAzHw@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: fix race between fallocate and mmap reads
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 2:59=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> The fallocate implementation only takes invalidate_lock for punch hole,
> collapse range, and insert range operations. For standard allocation mode=
s
> (mode =3D=3D 0, FALLOC_FL_KEEP_SIZE), the lock is not held.
>
> During ntfs_attr_fallocate(), new clusters are mapped to the runlist via
> ntfs_attr_map_cluster() before being zeroed by ntfs_dio_zero_range(). Thi=
s
> creates a window where concurrent mmap page faults can read uninitialized
> disk data.
>
> Since mmap uses filemap_fault() which takes invalidate_lock in shared mod=
e,
> it can fault in pages during this window and expose old disk contents to
> userspace. This is an information leak and data integrity issue.
>
> Fix by taking invalidate_lock for all fallocate operations, not just for
> punch/collapse/insert modes. This prevents concurrent page faults from
> accessing unzeroed clusters during the allocation window.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> Cc: stable@vger.kernel.org
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
