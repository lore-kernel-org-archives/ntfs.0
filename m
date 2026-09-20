Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25534376A0C
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905456; cv=none; b=Qxq7DzAfYdpzPu7SkcR4CMkbLuqC+SkMUyGDyMLyIYDleJTnO8QDWVz2zYtcNIzfY8u9so6uFACQaNzkkgBheZq+kcIj8oVuGHSFYVdu4k2GBICoFNmbwqbqArO3/XfLdblcCwRmsBR0PuMmvtS+wn+VINuuYYaXfmCKBcG6c9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905456; c=relaxed/simple;
	bh=LzW7ZRI3u9wk25Rg2TPXdwd7jcv1qWgXG2GsXUkdIxc=;
	h=To:cc:From:Subject:In-reply-to:MIME-Version:Content-Type:Date:
	 Message-ID; b=BVrcHVvdaVChoQPeSEv6gd2trJIK853wgFHDJ2xnjMkBCrK2D7n666FWW5ytY/jtj7c/Zz2qohnQOak3oc2uADpEjIVPXZ8q/VmhGQSKGrisag/meyZjvxqCR423K/zvIGX0PvNSdJOwC4Ci6bOPqNeth57+CFGDCDAWRF7/7/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=WIRo9rQr; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="WIRo9rQr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:
	Content-Transfer-Encoding:Content-Type:MIME-Version:In-reply-to:Subject:
	Reply-To:From:cc:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=SMgwYAPv5OqruUnI0sKgTbAu4/5yUIuUYOJRSqqtOkA=; t=1789905454;
	x=1790769454; b=WIRo9rQrCpd+Gxn2oOpshTYeqWphZkoGFhTQJz6XJxPbDK2kK5rO1iBN79xfU
	IDuDDtt/okwQnxxRwLfLs9jaNr3Ju6yJmwVAjYe+8Ry3npFKaVtpebvpu3zKcTBwSw2jdsRmoAIdc
	IJFJBoJeX/Ewqbrj/fbBC2iWDJc/jI44EtViwcLfwW2t/PrWMs9KqKdrU4nDVNZBBOqY22O1UC/tG
	dAvx7kUGQBCVeKZimRfARs8Uc87X5nqjiOmH3mpoAx7ifoWIO0zrSaGOFamibWG53pGbG7zDl/zST
	98jjn1/QCo/CzaHPyKIMzVyCRDgBjKueB4YSd69WHEu3MZzYEg==;
Received: from [24.147.175.133] (helo=crash.local)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1x8GAj-003gsL-4c;
	Sun, 20 Sep 2026 07:57:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by crash.local (Postfix) with ESMTP id 322063D466C4;
	Sun, 20 Sep 2026 07:57:28 -0400 (EDT)
To: liubaolin <liubaolin12138@163.com>
cc: Namjae Jeon <linkinjeon@kernel.org>,
    Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: Re: integer wrap in ntfs load_attribute_list_mount() can cause buffer overflow
In-reply-to: Your message of "Sun, 20 Sep 2026 10:22:04 +0800."
             <403a1327-c784-42c6-88e6-24ff692f386e@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 07:57:28 -0400
Message-ID: <27763.1789905448@localhost>

Baolin,

rl_byte_len is signed, so I worry that if it's possible for a
corrupt image to cause the high bit to be set, it would not
be > al_end - al. ntfs_bdev_read()'s size argument is
unsigned, so it might then try to read a huge size.

Robert

> =E5=9C=A8 2026/9/20 04:22, rtm@csail.mit.edu =E5=86=99=E9=81=93:
> > In this code in fs/ntfs/inode.c load_attribute_list_mount():
> >                  rl_byte_off =3D ntfs_cluster_to_bytes(vol, lcn);
> >                  rl_byte_len =3D ntfs_cluster_to_bytes(vol, rl->length);
> >                  if (al + rl_byte_len > al_end)
> >                          rl_byte_len =3D al_end - al;
> >                  err =3D ntfs_bdev_read(sb->s_bdev, al, rl_byte_off,
> >                                     round_up(rl_byte_len, SECTOR_SIZE));
> > rl->length is read from the NTFS disk image. If it is large enough,
> > then "al + ll_byte_len" will wrap around to a small value, and the
> > "if" statement won't prevent ntfs_bdev_read() from reading more data
> > than there is space in al.
> > Robert Morris
> > rtm@mit.edu
>=20
> Hi Robert,
>   Thanks for reporting this. You're right: the pointer addition can
>   wrap around and bypass the bounds check.
>=20
>   I think we could fix this by comparing the run length against the
>   remaining buffer space, like this:
>=20
>   -		if (al + rl_byte_len > al_end)
>   +		if (rl_byte_len > al_end - al)
>    			rl_byte_len =3D al_end - al;
>=20
>   Does this approach look reasonable to you?
>   If so, would you be interested in submitting a patch? If you don't
>   have time, I can arrange for an engineer on our team to submit it
>   and credit you with a Reported-by tag.
>=20
>   I look forward to hearing your thoughts and discussing this further.
>=20
> Thanks,
> Baolin.
>=20
