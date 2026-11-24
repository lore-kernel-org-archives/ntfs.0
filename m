Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523932;
	b=Of9Ux+5ywPV3LwRvR6VgQf1xgKZu7801ozEnbIPESAnB78w29ZKIFo0KTEVVKE4YuXbA
	 p5YHllccymHtaxhUkjvTITz1lkcd5Y9sILpTRCcYLZLtRZJD1tVypO3c9S5CGq8NW8DU/
	 6q2uqZvMhDjCNRW7xE4rTSAJGNMEkA5cVo1p5ESq1Etjb9nX2bTAiHE+1w6UTT7YNvNwa
	 DVr0QpeQQoZfpXIwmG+yVvl5/Gih0mV3LA6MHhxQRrYi87Ra2pyu8i+8uY26BIXWAamQf
	 X5iKyUmNHruV4UtHnXvfTnN2IeEo1W3xn2A8pw95AYezz9ghzpERXplHn9B4osUvJJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523932;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=eJCmBSYolN8SoZoYUvJwCwebOumcXhSHA0DzyLMAWlg=;
	b=CvE6UY1ZtI9KeZcIkN75k8EDgnn3Jnfs+zTASmfjh36V6pxezXWBqhloxWVHgaBG604a
	 K9+UeQI1psGbQT1c873qnnaX+i8HdSBI4GddNVnWCmCFMKuX5i6DhOVWqRwKndBPPq0y9
	 8PRGqvWam8mfMTprtLHJ2FLX59ToFHnC9OZw5mXdGMUljuyEjIFPJJ2lUlFEmosRlI0KF
	 BZfqJYO6g4ogYq5Fth6N1yd8EBvsozOXcV2QCAL8bq08fjQAzfMgJ8ek4KSsGS59e7F6U
	 eOUXkpnr59Z7u2kVFJvJ9tkMjUgY29QeL/0A8aaxV04o3S2hwCztp1hCbHbQn7awfQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b="k/0qqZma";
	arc=none smtp.remote-ip=185.70.43.25
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EE8606A321
	for <ntfs@lists.linux.dev>; Tue, 24 Nov 2026 12:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0EE8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=k/0qqZma
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795523929; x=1795783129;
	bh=eJCmBSYolN8SoZoYUvJwCwebOumcXhSHA0DzyLMAWlg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k/0qqZmacAwl8oMRPyyWCJrzsZvmztwbgamFRCEwUx2HWJ3RD0p2tC5zxUNy7nbPu
	 C4p1/ZjBIVNzvSC98ZYV17MhuPbAuR4bz09ll3Yv7cFkHj2TeiFSU/F4kNaMfvxoSo
	 0Rf8jI5kCNi3D12ZGXng1LJJCEfJDN8o0k5mQjuzjHRyFCNwaUFm9ZpufRmomHkpqy
	 3EEw3dBp+n/oPN5fvlSrPgrQh9MfbkV24JAxOC0S63N38rAFOhJrQN2e2ve1AbJr6v
	 XVQ2aLhkkYgASz8bS+xLbGMZr9ciwE/VnJlocCmeLDwLgieWsTTtAIKYBZMQ81rEnn
	 nnGYfgpeQctDw==
Date: Tue, 24 Nov 2026 12:38:44 +0000
To: Hyunchul Lee <hyc.lee@gmail.com>
From: Ernest Borowski <ernest.borowski.git@proton.me>
Cc: ernest.borowski.git@proton.me, Namjae Jeon <linkinjeon@kernel.org>, Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng1024@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] ntfs: release delalloc reservations cut off by truncate
Message-ID: <179552391645.2429893.14069187088819363568.b4-reply@b4>
In-Reply-To: <awOh8Zxdmg_-wKPg@hyunchul-PC02>
References: <20261122-b4-ntfs-delalloc-fixes-v1-0-0726f0dce403@proton.me> <20261122-b4-ntfs-delalloc-fixes-v1-1-0726f0dce403@proton.me> <awOh8Zxdmg_-wKPg@hyunchul-PC02>
Feedback-ID: 236360163:user:proton
X-Pm-Message-ID: c84d250e94fba5c9ad7d33e5c64ed591b75f76a7
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
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:16:17AM +0900, Hyunchul Lee wrote:
> If ntfs_cluster_alloc() succeeds for a LCN_DEALLOC run but the
> subsequent kmemdup() in ntfs_attr_map_cluster() fails, the reservation
> has already been substracted from dirty_clusters but LCN_DELLOC run
> remains.
>
> Is this planned to be addressed in part 2?

Yes.  This is pre-existing (ntfs-next has the same path), and the first
patch of part 2, "ntfs: keep delalloc reservations when a cluster
allocation fails", fixes it.  When the runlist copy (kmemdup()), the
runlist merge or the mapping pairs update fails after the allocator has
taken a delalloc reservation, ntfs_attr_map_cluster() restores the
reservation before freeing the clusters.  The same patch stops
ntfs_cluster_alloc() from setting vol->dirty_clusters to 0 when it fails
after the free space check.  A fail-nth reproducer covers these paths.

If you would rather have it here, I can move it into v2 of this series.

Thanks,
Ernest

