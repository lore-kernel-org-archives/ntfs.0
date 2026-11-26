Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685704;
	b=Gmni8GzPc5emmEX4ETEt8ngKtRKNJNgmh41uc6X47jyn5oU9dQ3UD3qjHeQ33LNJmuN0
	 k+yOmgkznwRhWKyfljPKO4pg8W901IgHTEAwD7ED77Zu1cbZzm1/zvQRIIRRXYrMZH8iy
	 6zQM3W5TJgQDOM68X8VkHl3jZBZAA41irLa82Zf/GNhmq+pHjtnZmspp4Z4qXK67BzdQZ
	 hztfW/REMjCXOBPcgrIyeHSDEPYPiysFG8CzukqC8R83B/t4uLvIkG+CAzJHh7Sha921k
	 SJWB8No7yAgvXKwHH5luE9IqJrpcsLMzH8UZfx2q5HG+SvwRtceA5VzmYZhbWOXalEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685704;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=4rXhKT8TtFGgK7PSIy2cEeLBQd2+yyLrWU2UR0XS9OY=;
	b=0Y446qh1ZRbvRTmBMbrF6D88EkqJmEk0j/E2b1l9b1vXZ4koIQ0gK/ciXS9y+Jke1G0R
	 3ZPeR38GAjFAr6LFhmTHZj5AbRyYWIQjZEtmWNZWsPJsN2HMyzSMfA/MRmwYriQnk+59o
	 T+4Vav23UA+KZXnfwGp1VoWjr7tp8AHFE8wdeiXRK9Uz0BD3PbwuqP3NUhLfvBYJ+hV76
	 mxgZkrS/3uaDQqRt9HvDhC7EBDwxO5THjM2kXFb2GF/IOmlhqcFiNSQvFWcT2PDTPW5qG
	 y4/Wt5Nu/0SM80BcBgT/lHbPgfVJVvC08LwNkNiCjUEDQvBj4g0UAspxwef89LQfeyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ZgNMhUAU;
	arc=none smtp.remote-ip=220.197.31.6
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A5606A31C
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 09:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ZgNMhUAU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=4rXhKT8TtFGgK7PSIy2cEeLBQd2+yyLrWU2UR0XS9OY=; b=Z
	gNMhUAUcklFYXKfTMNIUBm/CKZkSZH5q9wsyebphEl2D9jelp51BXM0o6o4gSL4x
	Yoo/uCmuGpOD/1Sea0YOa6elkMtsD71c0Ipifs+upIGloo+qkXjTgRgXgVfCTr/y
	WbxEVDtWKaUGrDaLmsBzN8zI17eqpIkcDn6k9LWGZM=
Date: Thu, 26 Nov 2026 17:34:45 +0800 (CST)
From: dd  <zhongling0719@126.com>
To: "Hyunchul Lee" <hyc.lee@gmail.com>
Cc: "Hongling Zeng" <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
	liubaolin12138@163.com, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re:Re: [PATCH 3/6] ntfs: read initialized_size under size_lock in
 the iomap paths
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <awfxvg7w_i49JxBv@hyunchul-PC02>
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
 <20261125073547.154150-4-zenghongling@kylinos.cn>
 <awfxvg7w_i49JxBv@hyunchul-PC02>
X-NTES-SC: AL_Qu2SB/qTuk4j4ymdZOkfmUoQhu82WMW3uvog3I9UP514jAvj+BsGdFRZMlTSwMGzKieyiCCWSRNg7vxLXq1cXaYxtvSDZLZ5RZjEh28sWQpEjg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Message-ID: <63810a45.6fa0.1a217351ac6.Coremail.zhongling0719@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cikvCgD31wY1_Qdrf5VoAA--.45874W
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoBUp+WsH-TV-bwAA3R
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKCkF0IDIwMjYtMTEtMjYgMTY6NDU6NTAsICJIeXVuY2h1bCBMZWUiIDxoeWMubGVlQGdtYWls
LmNvbT4gd3JvdGU6Cj4+ICAJaWYgKCEoZmxhZ3MgJiBJT01BUF9aRVJPKSAmJgo+PiAtCQkJaW9t
YXAtPnR5cGUgPT0gSU9NQVBfTUFQUEVEICYmCj4+IC0JCQlpb21hcC0+b2Zmc2V0IDwgbmktPmlu
aXRpYWxpemVkX3NpemUgJiYKPj4gLQkJCWlvbWFwLT5vZmZzZXQgKyBpb21hcC0+bGVuZ3RoID4g
bmktPmluaXRpYWxpemVkX3NpemUpIHsKPj4gLQkJaW9tYXAtPmxlbmd0aCA9IHJvdW5kX3VwKG5p
LT5pbml0aWFsaXplZF9zaXplLCAxIDw8IGlub2RlLT5pX2Jsa2JpdHMpIC0KPj4gLQkJCWlvbWFw
LT5vZmZzZXQ7Cj4+ICsJCQlpb21hcC0+dHlwZSA9PSBJT01BUF9NQVBQRUQpIHsKPj4gKwkJbG9m
Zl90IGluaXRpYWxpemVkX3NpemU7Cj4+ICsKPj4gKwkJcmVhZF9sb2NrX2lycXNhdmUoJm5pLT5z
aXplX2xvY2ssIGlycWZsYWdzKTsKPj4gKwkJaW5pdGlhbGl6ZWRfc2l6ZSA9IG5pLT5pbml0aWFs
aXplZF9zaXplOwo+PiArCQlyZWFkX3VubG9ja19pcnFyZXN0b3JlKCZuaS0+c2l6ZV9sb2NrLCBp
cnFmbGFncyk7Cj4KPklzIGl0IHNhZmUgdG8gcmVhZCB0aGUgc2l6ZSBhZ2FpbiBpbnN0ZWFkIG9m
IHJldXNpbmcgdGhlIGZpcnN0IG9uZT8KCk5vLiAgVGhlIHR5cGUgb2YgdGhlIG1hcHBpbmcgd2Fz
IGRlY2lkZWQgYWdhaW5zdCB0aGUgZmlyc3Qgc25hcHNob3QsCmFuZCBhIGNvbmN1cnJlbnQgZXh0
ZW5zaW9uIGluIGJldHdlZW4gY291bGQgY2xhbXAgYSBNQVBQRUQgZXh0ZW50IHRvIGEKYm91bmRh
cnkgdGhlIHR5cGUgZGVjaXNpb24gbmV2ZXIgc2F3LiAgdjIgcmV1c2VzIHRoZSBmaXJzdCBzbmFw
c2hvdApmb3IgdGhlIGxlbmd0aCBhZGp1c3RtZW50LgoKPkFuZCB0aGUgc2l6ZV9sb2NrIGlzIG1p
c3NpbmcgaW4gbnRmc19pb21hcF9yZWFkX2VuZF9pby4KWW91IGFyZSByaWdodCwgdGhhdCBpcyBh
IG1pc3M6IGl0IHJ1bnMgaW4gdGhlIGJpbyBjb21wbGV0aW9uIHBhdGggYW5kIGhvbGRzIG5vCm90
aGVyIGxvY2ssIGFuZCBvbiAzMi1iaXQgdGhlIHVubG9ja2VkIHJlYWQgY2FuIHRlYXIuICB2MiB0
YWtlcyB0aGUKc2l6ZV9sb2NrIHRoZXJlIGFzIHdlbGwsIGluIHRoZSBzYW1lIHBhdGNoLgpUaGFu
a3MgZm9yIHRoZSByZXZpZXcuCgo+Cj4tLSAKPlRoYW5rcywKPkh5dW5jaHVsCg==
