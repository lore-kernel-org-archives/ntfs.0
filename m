Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED55A35C6AA
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984726; cv=none; b=OcfLGuQJkyE2qvqKDjaa6T2eiLJIAZ2zVr0xRmiJwGN0wQwZUEs0oK9HVIS1u6b1o7DGCfbbW/b0m5VtXFjeBZJ71o15UghCMl7OlfPkQikCRKXzVmbvuDK7zLj7JI9S9SoX4X5hGgPHT6mMLhGatSWNS4oVq5oFystFDhvSl74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984726; c=relaxed/simple;
	bh=OpVJ2DuJsIijZYBlR3ejcclEdCcTk3AowF20YGtimy4=;
	h=To:cc:From:Subject:In-reply-to:MIME-Version:Content-Type:Date:
	 Message-ID; b=WYkt1eetHDfwLnmituRMZ6gnvoHDdpEbWGkhieleChXPuOeNrT/7QQsdyU/LX8AIq3IHgPOG6AcW0MKI5cvlTv1MhN2T4qhN0wlJB2yspaOUT6SA24fcpRa4zEe0qIWW95WugYKTHK6gg+yp1dAg57SkNKSvC5dbYKonWciQGYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=nbq9DndK; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="nbq9DndK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:
	Content-Transfer-Encoding:Content-Type:MIME-Version:In-reply-to:Subject:
	Reply-To:From:cc:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=zy4b6r4LGKOb05zqnWLNoDTVODdtGMAS5t1EiOon5Ag=; t=1789984724;
	x=1790848724; b=nbq9DndK65VBJ8RLKM2z53caLOUC3GvOPpdwa/iSt18jgrMJjxrrX+2BSiWsk
	+MSodqvfLZ2UdUbKN1PXB9/sqHn5P0YKN/Me9Dte3jLrmoAc/3gabx+BAhQfcE4DcduDqRdW5b4RV
	yZcnC4Q32KqZFtZx6YScocRVXNnviEIDVH56QQu7wzsgTepw9EzH7DJhdaA2oJx/UZmeCoVF/crX4
	8AM/5vpSmp9T3nrZusDQPYgYQp4aBgFRsP6QGwwEYguhuqqn2k8dTxbFPDSSLyp4JPrcY+yyiCfC2
	4Mvq0gVSZG4HIJD+6uVlOrl3KGuddYRTnSxwWg/Ju7GmLUySZA==;
Received: from [24.147.175.133] (helo=crash.local)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1x8an6-007fpw-G8;
	Mon, 21 Sep 2026 05:58:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by crash.local (Postfix) with ESMTP id C92EB3D524A6;
	Mon, 21 Sep 2026 05:58:27 -0400 (EDT)
To: liubaolin <liubaolin12138@163.com>
cc: Namjae Jeon <linkinjeon@kernel.org>,
    Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: Re: integer wrap in ntfs load_attribute_list_mount() can cause buffer overflow
In-reply-to: Your message of "Mon, 21 Sep 2026 11:03:21 +0800."
             <3c5fb985-6b5a-4514-92af-445e46c5ee77@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 05:58:27 -0400
Message-ID: <54729.1789984707@localhost>

Baolin,

I am convinced! I withdraw my objection.

Robert

> Date: Mon, 21 Sep 2026 11:03:21 +0800
> Subject: Re: integer wrap in ntfs load_attribute_list_mount() can cause b=
uffer
>  overflow
> To: rtm@csail.mit.edu
> Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
>         ntfs@lists.linux.dev
> From: liubaolin <liubaolin12138@163.com>
> X-CM-TRANSID: PygvCgBHgUp5nrBqwZMoAg--.6659S2
> X-Coremail-Antispam: 1Uf129KBjvJXoWxCFy5Ww1DKr4UXFWfAFyDGFg_yoWrtw4rpF
> 	WDKa43tr4ftr1qy3yayFs5XFyagrWxGw15t34UJry7uanxKFn3WFsrKa90va4kuwn7Jr1q
> 	qa1jg343uF98ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
> 	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjFAXUUUUU=3D
> X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6huMV2qwnnvLTwAA3R
>=20
>=20
>=20
>=20
> =E5=9C=A8 2026/9/20 19:57, rtm@csail.mit.edu =E5=86=99=E9=81=93:
> > Baolin,
> > rl_byte_len is signed, so I worry that if it's possible for a
> > corrupt image to cause the high bit to be set, it would not
> > be > al_end - al. ntfs_bdev_read()'s size argument is
> > unsigned, so it might then try to read a huge size.
> > Robert
>=20
> Hi Robert,
>   Regarding your concern that rl_byte_len could become negative and
>   then be converted to a huge unsigned read size, I reviewed the
>   latest ntfs-next tree I pulled, at commit 018344e6f555 ("ntfs: fix
>   directory lookup on large-page systems"). My understanding is that
>   the existing checks prevent rl_byte_len from becoming negative on
>   this path,for the following reasons.
>=20
>   1. The run length in clusters cannot be negative.
>   Before calling load_attribute_list_mount(), ntfs_read_inode_mount()
>   calls ntfs_mapping_pairs_decompress() and aborts if it fails.
>   The decompressor rejects a negative decoded run length:
>=20
>           if (unlikely(deltaxcn < 0)) {
>                   ...
>                   goto err_out;
>           }
>           rl[rlpos].length =3D deltaxcn;
>=20
>=20
>   2. The run length in clusters also has an upper bound.
>   For a data run with a non-negative LCN, the decompressor checks
>   both addition overflow and whether the run extends beyond the
>   volume boundary (logging omitted):
>=20
>           if (lcn >=3D 0) {
>                   s64 run_end;
>=20
>                   if (check_add_overflow(lcn, rl[rlpos].length,
>                                          &run_end))
>                           goto err_out;
>=20
>                   if (run_end > (s64)vol->nr_clusters)
>                           goto err_out;
>           }
>=20
>   This ensures that:
>=20
>           rl->length <=3D vol->nr_clusters - lcn
>=20
>   Boot-sector parsing also rejects a volume with 2^32 or more
>   clusters:
>=20
>           ll =3D le64_to_cpu(b->number_of_sectors) >>
>                   sectors_per_cluster_bits;
>           if (ll >=3D 1ULL << 32) {
>                   ...
>                   return false;
>           }
>           vol->nr_clusters =3D ll;
>=20
>   Therefore, the data run length must be less than 2^32 clusters.
>   Sparse or unmapped runs cannot bypass this constraint to reach
>   the byte-length calculation, because load_attribute_list_mount()
>   rejects a negative LCN before that calculation.
>=20
>=20
>   3. Converting this bounded cluster count to bytes cannot make
>      rl_byte_len negative.
>   The conversion helper takes and returns u64:
>=20
>           static inline u64 ntfs_cluster_to_bytes(
>                           const struct ntfs_volume *vol, u64 clusters)
>           {
>                   return clusters << vol->cluster_size_bits;
>           }
>=20
>   Its result is assigned to a signed 64-bit variable:
>=20
>           loff_t rl_byte_len;
>=20
>           rl_byte_len =3D ntfs_cluster_to_bytes(vol, rl->length);
>=20
>   The shift converts the cluster count to bytes. For example, with
>   4096-byte clusters, cluster_size_bits is 12, so shifting left by 12
>   multiplies the cluster count by 4096.
>=20
>   The relevant question is whether this multiplication can produce a
>   value too large for the signed rl_byte_len.
>=20
>   The boot-sector checks and decoding allow at most 4096 bytes per
>   sector and 4096 sectors per cluster. Thus, cluster_size_bits cannot
>   exceed 24. Combined with the cluster-count bound above:
>=20
>           clusters < 2^32
>           cluster_size_bits <=3D 24
>=20
>   the byte length satisfies:
>=20
>           clusters << cluster_size_bits < 2^32 * 2^24 =3D 2^56
>=20
>   This is below 2^63, so it fits in the non-negative range of a signed
>   64-bit integer. In terms of bit positions, the cluster count can use
>   at most bit 31; shifting it left by at most 24 positions can use at
>   most bit 55. It cannot reach the sign bit, bit 63.
>=20
>=20
>   Consequently, rl_byte_len cannot be negative on this path in the
>   ntfs-next revision discussed above.
>   Please let me know if I have missed a path around this validation.
>=20
> Thanks,
> Baolin.
>=20
>=20
>=20
>=20
> >=20
> >> =E5=9C=A8 2026/9/20 04:22, rtm@csail.mit.edu =E5=86=99=E9=81=93:
> >>> In this code in fs/ntfs/inode.c load_attribute_list_mount():
> >>>                   rl_byte_off =3D ntfs_cluster_to_bytes(vol, lcn);
> >>>                   rl_byte_len =3D ntfs_cluster_to_bytes(vol, rl->leng=
th);
> >>>                   if (al + rl_byte_len > al_end)
> >>>                           rl_byte_len =3D al_end - al;
> >>>                   err =3D ntfs_bdev_read(sb->s_bdev, al, rl_byte_off,
> >>>                                      round_up(rl_byte_len, SECTOR_SIZ=
E));
> >>> rl->length is read from the NTFS disk image. If it is large enough,
> >>> then "al + ll_byte_len" will wrap around to a small value, and the
> >>> "if" statement won't prevent ntfs_bdev_read() from reading more data
> >>> than there is space in al.
> >>> Robert Morris
> >>> rtm@mit.edu
> >>
> >> Hi Robert,
> >>    Thanks for reporting this. You're right: the pointer addition can
> >>    wrap around and bypass the bounds check.
> >>
> >>    I think we could fix this by comparing the run length against the
> >>    remaining buffer space, like this:
> >>
> >>    -		if (al + rl_byte_len > al_end)
> >>    +		if (rl_byte_len > al_end - al)
> >>     			rl_byte_len =3D al_end - al;
> >>
> >>    Does this approach look reasonable to you?
> >>    If so, would you be interested in submitting a patch? If you don't
> >>    have time, I can arrange for an engineer on our team to submit it
> >>    and credit you with a Reported-by tag.
> >>
> >>    I look forward to hearing your thoughts and discussing this further.
> >>
> >> Thanks,
> >> Baolin.
> >>
