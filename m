Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640362;
	b=C5jrO+N7cJ6d9MZDd2j6HZrvCNIn0ZJt/Ndf+LOQPVMD7nIBhXl5rh8inK6QhNeRDgvQ
	 OcEDVzB80TwyGstxaKCgCtW6MgZBrxLvwSbjFHquvEIbkRDD1wh1+Yqe53u5g8g1psMvH
	 34GVDzewd+BA9/RFhDJlf7OzvGYbsGa9R3rl3EgtWbxgX6sv5an/HqNwCxJmbDjJKyStt
	 ts0n99vyNfCyvLBBqGVRZfmwj9Sw+ajgP3aZZ3aLOTJOW0PxvxVeTvRgxWteJns4/jcWc
	 hSvPqbdgNYOo5YSS+4qAFCqqp9hhZKxlcKsi8K1vj+06VCz4CMDGPZiT0sxebgEPnPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640362;
	h=DMARC-Filter:DKIM-Signature:Received:Received:To:cc:From:Reply-To:
	 Subject:In-reply-to:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=osbSXKztPZBhEKnrxbKeMlB+PsTxeEC3iHJZ6HpZnP8=;
	b=lPFsbGxsqEylHH6lgXl25woBrfOGyndlqsdvyobkKcsv0+zM1hVp8JB15uxOd7Z1ncwV
	 vbd862guGLzUhjTB8azPCryzBeYGaCSMGwEdHMis94w6vtXxYY8hUEc6DQwXR3h85rA/B
	 s4OfcKrlM6pmaedsOO2gWoN6Ex03JQUjysmRMAOfswtlyrvRcOedCXMxs87drWEdpOo6f
	 1C9FLEB/02XTyra0R+Uqx94LIVL2EFcNpXJUjZtvd4jyvysgunH33hTaQXQszC3rL136o
	 YcLjliKgYfpn4DZ/p+v1XQabYaGHxZvEw5eCUms30oP12Pf4evDhEpIJrRQcfKzbP7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=XsMc+uMy;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBEC606A329
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 17:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBEC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=XsMc+uMy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:
	Content-Transfer-Encoding:Content-Type:MIME-Version:In-reply-to:Subject:
	Reply-To:From:cc:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=osbSXKztPZBhEKnrxbKeMlB+PsTxeEC3iHJZ6HpZnP8=; t=1793640361;
	x=1794504361; b=XsMc+uMy+PAp9G9vKReKtaPVcSjo6ikeJWJUdty5Z2ym04VRpGT1p40N8fkIu
	bBPgtxMgi25J2NiDro8kR8g0R4W9mGzGBQUI2clrJSNpV4dC6bD4rrp6xICq/rQHImDombopbkc0Q
	qtnyB8a/WEVIDxW1YgOgcw23AHzdp1PH9XXnTd19+opHJiSdiwIaesuVkrTOAtNAq+xw5ETTzRIxK
	zkLYIqfpMuzVOXTaYa/ZehUHWhd2SghPgY9FX9oAGDe/WQBx+ncA+H66miqbAMart9G1F/SAtXunh
	+8YUOVaIcLbEC/gUwjAJzQ/EZs2eJN8bV4VKxKulQFWY4dsGxQ==;
Received: from 30-11-166.wireless.csail.mit.edu ([128.30.11.166])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1xNvn8-007ZUg-Ew;
	Mon, 02 Nov 2026 12:25:54 -0500
Received: from 30-11-166.wireless.csail.mit.edu (localhost [127.0.0.1])
	by 30-11-166.wireless.csail.mit.edu (Postfix) with ESMTP id 30FD63ECEE53;
	Mon, 02 Nov 2026 12:25:54 -0500 (EST)
To: Namjae Jeon <linkinjeon@kernel.org>
cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: Re: ntfs_resident_attr_value_resize() uses value_offset w/o check
In-reply-to: Your message of "Mon, 02 Nov 2026 22:51:17 +0900."
             <CAKYAXd_bgSCP0SvZrXJ1c1V1Mt9xQ443sgxaRSu1-iDxZrCYrg@mail.gmail.com>
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
Date: Mon, 02 Nov 2026 12:25:54 -0500
Message-ID: <15350.1793640354@30-11-166.wireless.csail.mit.edu>

Yes -- this patch does indeed make the problem go away for me.

Robert

> From: Namjae Jeon <linkinjeon@kernel.org>
> Date: Mon, 2 Nov 2026 22:51:17 +0900
> Subject: Re: ntfs_resident_attr_value_resize() uses value_offset w/o check
> To: rtm@csail.mit.edu
> Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev
>=20
> On Sun, Nov 1, 2026 at 5:40=E2=80=AFAM <rtm@csail.mit.edu> wrote:
> >
> > In ntfs/attrib.c's ntfs_resident_attr_value_resize():
> >
> >         old_size =3D le32_to_cpu(a->data.resident.value_length);
> >         if (new_size > old_size)
> >                 memset((u8 *)a + le16_to_cpu(a->data.resident.value_off=
set) +
> >                                 old_size, 0, new_size - old_size);
> >
> > A corrupt NTFS image could have value_offset greater than the
> > attribute length, so that memset() zeros outside of the allocated
> > memory.
> Please check the attached patch.
> Thanks for the report!
