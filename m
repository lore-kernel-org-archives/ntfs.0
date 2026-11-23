Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407607;
	b=1jxmqY/4OWylyxcOlSf75cwbYjzKhIS0X1jvudsTZlH1eaIMCk/njNjq9aY3MGoP/2NR
	 lQHxiA4fGKrkqLRTYUNtehGl75sFLdQTGs03zZclJdCYzngMn9hPAJOv9fqqHm1AbPl7d
	 vkDyH0rrw9dP3/g/yRsca7cko70MRRduN8Dbsfjhb/aROAzg2dBX5Kp/Yi93YDYdvrSy5
	 0JsNd2xy6pIsvjYPwTVMctOm6kZhfmh44J7VEn3MelUzFhH32hHA5mPnbENg8biuWllhD
	 V0iSA03LZY7Ntq4MwiQah7P4k4qUWXLGm770bRkanqlWh9NTJlqaXrQg19xo5bKL2Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407607;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=QmjJJluG72923u6dkKF4E6LX7QpWiZzvPettKxtw9Io=;
	b=hGuyRFruL2of1IxtUWjD0YdkXp9fxNZzNkiG9rG7xlL5p8aDOpv/+js/FL8eMmQkLh3F
	 E29Houfn2auDd5gOerqgx/zZkg9oC3DJ95hpC0lbJBQK6FaoQVphhU0eZkfcP/i6aT3bZ
	 UFtZYJ2T7sYVta3kbBZ6zSjbR4V++9P59JVqfuwZy227EXA5kr4zeEqDvDedtZ7h/fexp
	 CueDUU/HQbDoCDs0MCaFdLJSlf022vY56V0D7UGfSZuemu6mMx/ZPO/hBbaICrU09SuD0
	 VnUdXKd9jpVtMZQJK+0iqn6DmR6E1ZIfKLCsRpeSsgDexe5eGVyx5CIFrTLqcsXcD/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=m3QkiGXf;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T8qyTQu8;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C35C606A31A
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 04:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C35C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=m3QkiGXf;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T8qyTQu8
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 264211D005E9
	for <ntfs@lists.linux.dev>; Sun, 22 Nov 2026 23:20:06 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 22 Nov 2026 23:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
	1795407604; x=1795494004; bh=QmjJJluG72923u6dkKF4E6LX7QpWiZzvPet
	tKxtw9Io=; b=m3QkiGXf2sFup9A3ieASCnPMM7mmCZOy7O2V3R5BjVG++548QJ2
	d8c5OisIzbhCpkz6u68VbhZVXqo9Al71+FFkUr0iiWtR/x5tBvUfd/zkgjZCakJv
	AArZ2RETqgm+TiIl8guRPQpOsjE3zp5SkeXaUmnLItyfIwSdFdtp2eWF+AinccIZ
	gvxM0Ujb5Pn9Tcvy+S/WAGZZcE0kQwHX5/yYvynre9O6lRFmdHSkk79vJ1vDIgHB
	wZO9tnG8YQYOfxTUAqNvf5uwPIPsHNKr5RPovDb03uTTnaU9eJa0f9U03w9TYaAv
	9m6QkcsZtAphxQY2rBca26QtAMXWydg9ZAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795407604; x=
	1795494004; bh=QmjJJluG72923u6dkKF4E6LX7QpWiZzvPettKxtw9Io=; b=T
	8qyTQu82PPSMZDLrmkq6mglH95GwpcGVsKCcpd+v8o5/QOxNuccpTsneTgE07FbV
	5scBTlQL0ZEimWLcPC7pjXEzxgWh2/cLRqMD6JQwPjmnFl1VLMAinYW6OUAJ+WOM
	Weda4AlgHM1KghJ/q8IizM7DVowfqIX1PtO5DzUJiHuDaddTHSly86unvCW4+SVF
	8Lqe91fmdyR46Z9XcXdtinhcE6Jj2qPyFaLvq688Trczd1Y8jqCxyO1R8yX9kwia
	q5/POtvVq0+CXlhFI2D4s7Dm3yPANs9UhGm1QKAsZjN0ZcD5dGf4LPe0j/+0zTcP
	+Brf6dz9G9RBrF+I1/qRQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795407604; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PG50ZnNAbGlzdHMubGludXguZGV2Pg==;
	s=fm3:rsa-sha256:NEbHcUPwXyrG220hHo0WolMmY+z+o+5eNcAc/1kcIWEYUyp
	i6rOGytes1fcrQcJjImIc5PBUeJnyGzWinobAamt1WjKA1ZD35d9RHyoY+hoYnhc
	dax+B5D/xm8Fi9y8/QYfQsHVL3dtu8j+7zAy9jOte98p49M38fsSKl9n5CtrfRSN
	aD6IR3MeqjUn5gJiLwOESd+ZH2EdrxGchxscwUC7ej6DuoB9fOPXJlU4JGw8Dev4
	q6cQjWGjKrhKnSqCktF5S7FtVsj6r8nnEH53PSg2nhv/BlKOFXTHmzOi2zXpbe+H
	nYjXvv7EnuvwbDcFyK0pMg6XBNVDoh2L2J69ELg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:5DqTmm5+Aw5sDP+8zfo/9Yuk7Wsf8Q83qoFB+ud5qq8=:AbnOsTm4/ckYElt94OXxA6epjoXkd2Xej8CH/vMd7vk=;
X-ME-Sender: <xms:874Da_ITcrVk-rKo5AsqLnHB6Oa0XR1bRFMrLL8GFEdbtP2XUVYJBg>
    <xme:874DawVBzhTyASy-xrcN6Zt9H_gIGcEvJS1cuEykVVPC38viJSINzC2dbcbZwwCHZ
    crqlyjeyUqrUufdwfjOds4HM-iySDYN2RohmAZ79fxmmlK_Vo8>
X-ME-Received: <xmr:874Da8Olj2io5CvbpS9lpoKQ5F_K-657FrBXcvpAkbmasQ353BoHHQnJj2GPbzyIV9H8MlEr_rEvE1vczqTGfx8hrRbTJj4>
X-ME-Proxy-Cause: dmFkZTGv0kSxTW36hnuZ2AGsWuxeYAhFz6h0/5Jgx2+pY5uE0D7PdE4Q0ccZruKJ7qyqxD
    2T4Hz4bXAp1qumoqkTdvNfhT4icJvf7xmyYLbk4ZyQcRVrx9ngyL5QuHRT33O2vRuDxnqw
    QFYD6LxjSbc1grMJzygpKS7iBQgFblwMxKjKs6fsCyzSFmqk2EyUFyVHagO+R7mstf138H
    ZGFjPe8QO0Ot1g6TxuMlQxvyEfGjt+S7Kpz3mx50nyZ01Kw9eu/Ekv4c47lxL6g5yz5HQu
    2osoAB8JphtEtJr22E2M4mOyPQqK40EpR/yEGEMcnSjse5jDudxC5yil3Fy4vsRZv3+Ntc
    WTQtF9IYMpiHf/N5GvPWSN5uEUjfVT2lbtygQmuEM9lWUhr/OghNcEykG+n8F/HWqDUYMS
    oh4NKR7JMttnnoi7dSCFATtRHl8yXKKFIa8es3Hr94elzTjXbx/scZ8uA8c7EhfAkk1oHZ
    HPMNlFbNb7DzdF+diwT82ByBXs0nzLdajYoQa9MJGgw6QP0avBmCB24psqotbvb0ZdmqVk
    nZjUY0MJaIQHAzgMIdAU2T1Q6RVtuf0eXw6NhrvCaTKDjsEJYKUsaIBUb4vw/nIMMxMrMV
    MGIdq+h+9IXI9DB7+9i/MyVVds9ZoQUixWyKulcSOiug7Zquo+wPgDRc8aGg
X-ME-Proxy: <xmx:874Da0nNo5PMJ12iVr4b5RiCwQhI8ARzSgfw6ylg9_8wrm8C4R6iwA>
    <xmx:874Da3XjO_tLYiXyXJeSRyM9b6naC5Wlf7HIKOTKSeXa2gADvcXNdQ>
    <xmx:874Da7KdyLK4yOA1cVVtd4Fjg1LlOSb9pjb3ZYrydZJQ9FZ0roWWKw>
    <xmx:874DazatK-fEHcPrUH5a1Zuh6DGLnCPw8dttcZBjfBf1GRooTtsAQQ>
    <xmx:9L4Da_JXeh_YFXHJoErlSwqofBbs1Hd05ytwZIJPk0gekSWXgy5GTDO9>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Nov 2026 23:19:57 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Christoph Hellwig" <hch@infradead.org>
Cc: "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Harkes" <jaharkes@cs.cmu.edu>,
 coda@cs.cmu.edu, "Jan Kara" <jack@suse.cz>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee" <hyc.lee@gmail.com>,
 "Carlos Maiolino" <cem@kernel.org>, "Jeff Layton" <jlayton@kernel.org>,
 "Amir Goldstein" <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, linux-fsdevel@vger.kernel.org,
 linux-um@lists.infradead.org, ntfs@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 1/4] VFS/xfs/ntfs: drop parent lock across
 d_alloc_parallel() in d_add_ci()
In-reply-to: <awB5mAWm9h1ksRFI@infradead.org>
References: <20261117000115.1433875-1-neilb@ownmail.net>
  <20261117000115.1433875-2-neilb@ownmail.net>
  <awB5mAWm9h1ksRFI@infradead.org>
Date: Mon, 23 Nov 2026 15:19:52 +1100
Message-id: <179540759290.1728055.6042791276963817025@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Sat, 21 Nov 2026, Christoph Hellwig wrote:
> On Tue, Nov 17, 2026 at 10:54:58AM +1100, NeilBrown wrote:
> >  					  const struct dentry_operations *);
> > -extern struct dentry * d_add_ci(struct dentry *, struct inode *, struct =
qstr *);
> > +extern struct dentry * d_add_ci(struct dentry *, struct inode *, struct =
qstr *,
>=20
> Please drop the extern and fix up the formatting if you touch the code.
> Bonus points for spelling out the arguments to actually make it
> readable.

I think inconsistent formatting is not much better than bad formatting.
Maybe I'll insert a patch which tidies up the whole stanza.

NeilBrown
