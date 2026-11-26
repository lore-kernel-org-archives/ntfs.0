Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685521;
	b=cFP/l4wFGWU+y0UastLBmo3bA6Vwqonrt4uXqD3aV+GCQU1sMriRPtQl2Jzde+svmLmK
	 GyMfRgCRqmqYq8RtfBA3zvwDmMB18d+ItNSHDeRJoGO1G5WL+p/6skJ7T51g37CK/r0rf
	 aKaeN+H9gH++RGyw8MLsWszK7Yf9aEe4auPmolK/yHB/pK7JpGKyrM9uU7wRVbCY9IWgO
	 K6/zGnY29G1Z/aTT3V96lHuk1gVbuyS9iqHWxFqkxEGQZt2eH6gmiItZ6ngMv9Wm/a7LX
	 4RBe1ZloizSpCMqRyn1L+vLjml6/EU4cRQpVHEV1OT8XWmkrLYcr64XnEawI1UUWsOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685521;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=ZZqebzzJa3d3UXnxzvOrxHsgxbbozd+P3jyLIzohfbg=;
	b=DUxlQ5R40tfHbSG0hrt4JhlfiXTm2uHwMDjTXkIL7+ui1QgcdKzUvKumXp3k/v1OxR/2
	 l51fkekkCs2OS6c0J4VShSNBQVy8LrOKBxI0+BZU17fOozvaLUDQtZ8DZGCPppJ2vtXRy
	 m9jU00CNeBVvtmK3FRnCrM9b4F3zaIVH5K2pGF5+aAXmsG4x9ym0A2y/q/I4ivi3hMOyp
	 o4Tqjjb9aAg+NDuerjMtvEH18ZEhu7G3dw3DHubJtzrRjYzj3bxqFRRHz7r1Wiisc9kiJ
	 gRy7kltEF5lVwjlzU5jF4K8q+YZXAaYJPmMXNux13cAxR8RJoNlLH75oWitsgrLC6HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ILFCEYp2;
	arc=none smtp.remote-ip=220.197.31.9
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57467606A33F
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 09:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57467606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ILFCEYp2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ZZqebzzJa3d3UXnxzvOrxHsgxbbozd+P3jyLIzohfbg=; b=I
	LFCEYp2YznvVxMuzl904AdyYEoKwkh+rexwn9+AvLcigpvUEqW0aeisd1jcGQZHP
	AVBxPKCCY5L4Ct79Zk6t/5O8mD3I2LrT+35M1FDuA0AwZyCILw71pDa/C8Aeewmv
	AD89ovx8kNDVnIiNu7j/kq7Iz9OIx6LefcmODnpatI=
Date: Thu, 26 Nov 2026 17:31:35 +0800 (CST)
From: dd  <zhongling0719@126.com>
To: "Hyunchul Lee" <hyc.lee@gmail.com>
Cc: "Hongling Zeng" <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
	liubaolin12138@163.com, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH 1/6] ntfs: mark the record dirtied by a resident
 write at iomap begin
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <awfxklnX3OVrMoom@hyunchul-PC02>
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
 <20261125073547.154150-2-zenghongling@kylinos.cn>
 <awfxklnX3OVrMoom@hyunchul-PC02>
X-NTES-SC: AL_Qu2SB/qTukwi4yGfbekfmUoQhu82WMW3uvog3I9UP514jAvj+BsGdFRZMlTSwMGzKieyiCCWSRNg7vxLXq1cXaYxGekCw8m7qSjmQnzjrJtsnQ==
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
Message-ID: <3badf580.6efb.1a217323192.Coremail.zhongling0719@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cikvCgDn_9h3_AdriZRoAA--.40889W
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoBf4yWsH-Hd4ZQAA38
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKCkF0IDIwMjYtMTEtMjYgMTY6NDU6MDYsICJIeXVuY2h1bCBMZWUiIDxoeWMubGVlQGdtYWls
LmNvbT4gd3JvdGU6Cj5IaSBIb25nbGluZywKPgo+PiAgCj4+ICsJLyoKPj4gKwkgKiBUaGUgcmVj
b3JkIGhvbGRpbmcgYSByZXNpZGVudCBhdHRyaWJ1dGUgY2FuIGJlIGFuIGV4dGVudCByZWNvcmQu
Cj4+ICsJICogTWFyayB0aGUgcmVjb3JkIHRoZSBsb29rdXAgZm91bmQgZGlydHkgaGVyZSwgd2hp
bGUgdGhlIHNlYXJjaAo+PiArCSAqIGNvbnRleHQgc3RpbGwgcG9pbnRzIGF0IGl0LiAgVGhlIHdy
aXRlb3V0IG9mIHRoZSByZWNvcmQgY2Fubm90Cj4+ICsJICogb3ZlcnRha2UgdGhlIGlubGluZSBj
b3B5OiBpdCBpcyBzZXJpYWxpemVkIGJ5IHRoZSBtcmVjX2xvY2sgaGVsZAo+PiArCSAqIHVudGls
IGlvbWFwX2VuZC4KPj4gKwkgKi8KPj4gKwltYXJrX21mdF9yZWNvcmRfZGlydHkoY3R4LT5udGZz
X2lubyk7Cj4+ICsKPgo+SWYgdGhlIHdyaXRlIGZhaWxzIGJlZm9yZSB0aGUgZGF0YSBpcyBjb3Bp
ZWQgaW50byB0aGUgcmVzaWRlbnQKPmF0dHJpYnV0ZSwgdGhlIE1GVCByZWNvcmQgaXMgc3RpbGwg
bWFya2VkIGRpcnR5IGFuZCBtYXkgYmUgd3JpdHRlbiBiYWNrCj5ldmVuIGlmIGl0cyBjb250ZW50
cyBoYXZlIG5vdCBjaGFuZ2VkLgo+CgpUaGF0IGNhbiBoYXBwZW4sIGJ1dCBpdCBpcyBoYXJtbGVz
cy4gIFRoZSBtYXJrIG9ubHkgc2V0cyBJX0RJUlRZX0RBVEFTWU5DCm9uIHRoZSBiYXNlIHZmcyBp
bm9kZSAoX19tYXJrX21mdF9yZWNvcmRfZGlydHkoKSksIGFuZCB0aGUgcmVjb3JkIGlzCndyaXR0
ZW4gb3V0IGJ5IF9fbnRmc193cml0ZV9pbm9kZSgpLCB3aGljaCB0YWtlcyB0aGUgYmFzZSBtcmVj
X2xvY2sKYmVmb3JlIHRvdWNoaW5nIGFueSByZWNvcmQuICBUaGUgd3JpdGUgcGF0aCBob2xkcyB0
aGF0IGxvY2sgdW50aWwKaW9tYXBfZW5kLCBzbyB0aGUgd3JpdGViYWNrIGNhbm5vdCBzZWUgdGhl
IHJlY29yZCBtaWQtY29weTogaW4gdGhlCmZhaWxlZC13cml0ZSBjYXNlIGl0IHdyaXRlcyBvbmUg
cmVjb3JkIHdpdGggdW5jaGFuZ2VkIGNvbnRlbnRzLCBpbiBhCndyaXRlIHRoYXQgaXMgYWxyZWFk
eSBmYWlsaW5nLiAgVGhlIGJhc2UgcmVjb3JkIGFscmVhZHkgZ2V0cyB0aGUgc2FtZQp0cmVhdG1l
bnQ6IG50ZnNfd3JpdGVfaW9tYXBfZW5kX3Jlc2lkZW50KCkgbWFya3MgaXQgZGlydHkgcmVnYXJk
bGVzcyBvZgpob3cgbXVjaCB3YXMgY29waWVkLgoKRGVmZXJyaW5nIHRoZSBtYXJrIHRvIGlvbWFw
X2VuZCB3b3VsZCBoYXZlIHRvIGNhcnJ5IHRoZSBpbm9kZSBvZiB0aGUKcmVjb3JkIHRoZXJlOiBi
ZWdpbiByZWxlYXNlcyB0aGUgc2VhcmNoIGNvbnRleHQgYmVmb3JlIHJldHVybmluZywgYW5kCmlv
bWFwX2VuZCBvbmx5IHNlZXMgdGhlIGJhc2UgaW5vZGUuCgpUaGFua3MgZm9yIHRoZSByZXZpZXcu
CgotLQpIb25nbGluZwo+PiAgCWEgPSBjdHgtPmF0dHI7Cj4+ICAJLyogVGhlIHRvdGFsIGxlbmd0
aCBvZiB0aGUgYXR0cmlidXRlIHZhbHVlLiAqLwo+PiAgCWF0dHJfbGVuID0gbGUzMl90b19jcHUo
YS0+ZGF0YS5yZXNpZGVudC52YWx1ZV9sZW5ndGgpOwo+PiAtLSAKPj4gMi4yNS4xCj4+IAo+Cj4t
LSAKPlRoYW5rcywKPkh5dW5jaHVsCg==
