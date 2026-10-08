Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50332355F5F
	for <ntfs@lists.linux.dev>; Thu,  8 Oct 2026 04:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791433922; cv=pass; b=S+xJorXC9WxE+pZ6IeRfautthfZDgrs46CWEYVq+XLa8hUIIZNZj0uAkHxLuU3iMEUWn2VYhjCgvL8evLvLq6mern5gbSUG3Iaqg687UZ3OlA5eU4FEAhQ8OzBuXu7ylpnvBHeZF7tc6NUzBFaXiFYkwytoi1ELKs/vvy0i/vZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791433922; c=relaxed/simple;
	bh=utMF2qmMjG+8jgy2EHOE18JIdDeiAC5jbBX04/E7FeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOW7f88W9tjifUo97d8aj0/TEHS0fmbbOi+bXT76ugJx3/sabNMBjyE8r0nftkMMX5K3tPDoCi3AEIyp/BM04cJQ1XOn0cfSngBmAcXmXsZyF8BxKhgXjzPSo56NWijQJxwmCChKBrtJC/iTgY2wd9aw2iiEfSZl17vbdIY1gGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyKLCqc5; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyKLCqc5"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso2080289e87.0
        for <ntfs@lists.linux.dev>; Wed, 07 Oct 2026 21:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791433919; cv=none;
        d=google.com; s=arc-20260327;
        b=W8XaXmrKj8CB1zq8btyFgw/BiXHU/SBrIxvPIAO0wZJnm80nU4cN3VFn/7fXZi1Sn1
         kwvEFYuDUtxO2z80tZy4s5AW0ziBL34EsF4ptV/EnCmfViwiaYX1Pyaw/2KtT3qOWDN5
         MMe2b0J0OE2qeKRFUzrDa7870cOqwquAA3VAdwka8Dt/W9ZUFo36TZILhAFSSwIBdPlX
         BOW/9z0p1KqUqChK8T3OCg6FC8BZ+Z/lnp0Y31oBPVGzRqQTgMMPOoKkQciXq/kY1JYK
         yVc9Rb76i5D3l6e8ZvaF8WkaLLajrq3lDtdQYIj5CMOKDGDy4Xy8TGafrSAj0QeQ7bAH
         e+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=utMF2qmMjG+8jgy2EHOE18JIdDeiAC5jbBX04/E7FeQ=;
        fh=x9ZoGpJXLWmno5K7GTfKOBTflCvHItF40uzc9RX1dYg=;
        b=RT97yfSPXEGVGihBiL5CgubJWzjx2aLxt8APoiQshoQy0h6h5KoNNPhIUs+mq+Yl4k
         wHXYWISdOro/2ZHHXALghhm2LSxoZYHUJKedRnr0ULBTuvVGd4B9y0VTFSqP7Twexsl6
         SOLv0oWN7kEmMlb5IfRvRHbijJJjhDwoPbPx/5vghQ1rw2OViLRhCiiR7VdqIi0yYBdm
         9VKe7GIXIM7kRty7lssMoLd3mo/MvNyo2i4smgrxBvIYCNPVD0Ur2Qjq9BcE7uSJY/bg
         TYFbADe+QA533eQrG1XGhDCQE2xgfzphiXwKCi5RAIOp/uc8cA4OS4EVMONlv0edC5DS
         ROmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791433919; x=1792038719; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=utMF2qmMjG+8jgy2EHOE18JIdDeiAC5jbBX04/E7FeQ=;
        b=jyKLCqc5rk/iDp4Pb/fFbwy8ma/On5jGbvGzJl46FmvQJbO3CBHbqQGfdC+u5FBSMX
         dNc4L8wv0BjxpCKHKavwcsV5VOGLcrxZLzihs73TsOaEmHcaJ/m4irSLI/db59xqURjp
         SvBxO+Zqg5Tf8cRpX0Kurf/8LLqo/uw2i170nxwRGBtdwK+K4R9Iidyp/PSxP4bo0A7v
         7njMmI++karer1YL5NoPe36/0lndPOLYfaVHt7SsaDlpLFAUr6GSxgNxCO+kxJhfenJ+
         Qwb3ijfEW3mfOKp9B3FtzCuoOmJJ2VNU8/GrUr4/sNl35Wz2hO0o7qEXwwyG3ZnvJ7ia
         HFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791433919; x=1792038719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utMF2qmMjG+8jgy2EHOE18JIdDeiAC5jbBX04/E7FeQ=;
        b=Ml6sqYMO1/ChWAsHQR799CTYhl7652Ga57SpXGbXHNR/+K97YMKShhDxhhCj21Z3Yr
         ODOwEB31iu8bSVBTIpkJFfa+wuklLRZgWPz9uffzp/xR1dixW04t4cuYSxV9uVHQ0NBT
         /jTEwWqKdZCCt5Bj9RZLyiaeyPirLLm1tBZQU6AUogW1uR9fvkaG20tcYuXXtggUHj4M
         schayrjoGMD7Hnx07iQeQvgCveVb76SBkySUa1aUjcMN4zKTm196x/M9d3DjMC9r4HUx
         j2vSUbgCwl7YhJzeGMs96kjTzFgsuxxPDuFapgr5MH85DQp6FUfv/2t/WUzghV4kU9zi
         TYdQ==
X-Gm-Message-State: AFq9FYJ4LRaPM1ckCeEuO76GivIC3c/J9YsYA+eNVRpYjiseLKPJF096
	ZGo2R0bTCYfY5ugcqWaF+jhrARD8Hbi5nXz+Qbd3msOLf7bRHk4z9lo3cWNMyOOUCrmM00SF1du
	6+3vICSNJPWfi6knBR3yFAIyfNwIVn4E=
X-Gm-Gg: AYBFou1jXo7axmJS9ZAqZlnGjQFjbtU5f0kY3/M9/JtvqbZOfTWd3oDZnBx8AE5ejLQ
	RuaSYebRTJfSosfwtgoQnOKXEv45nnHHOCEKfI4TXEvLuytL7rmer21JzAFvPlRtEd3EhXzcqdF
	o1SEk4SNn3a5CPMmpAjsVZivq4t9h7DGcb40CoC52SFXD9lOhC6NrWT4DAiVZOEHqrg29CO8bbB
	R1Mx1uhmDA201D7KZQv+3arwxMd2A6nUDnOUKyuq4xPlYR2cdl/CUAge8vJhqF1sGRefC+JDvOb
	bT6XGQU3kQ3KitKKvspVqSnRko/4mJJbK/OT30bBrt/K7PD7A1hMW58=
X-Received: by 2002:a05:6512:23a5:b0:5bc:b774:8a73 with SMTP id
 2adb3069b0e04-5bcd43ac128mr330225e87.15.1791433919013; Wed, 07 Oct 2026
 21:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007131844.8013-1-linkinjeon@kernel.org> <20261007131844.8013-4-linkinjeon@kernel.org>
In-Reply-To: <20261007131844.8013-4-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 8 Oct 2026 13:31:46 +0900
X-Gm-Features: AclHuK_-cskSHyJUGl3E5QfPg809-h7rqFpujTdjF4RiQ542s-g3tkH-EpvHygE
Message-ID: <CANFS6bZ1Nieeu8k_Y0=L_mejOCDKABa0k96js7pftACS2dqxWA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ntfs: propagate EA truncate errors
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

64Ko7J6sIOyxheyehOuLmCwgQUkg64+M66awIOumrOu3sCDqsrDqs7zsnoXri4jri6QuDQrqt7jr
pqzqs6AgbnRmcy1uZXh07J2YIGQ5MTkwMDI1NGRhZCBudGZzOiByZXN0YXJ0IHRoZSB6b25lIHNl
YXJjaCB3aGVuIHRoZQ0KYWxsb2NhdGlvbiBoaW50IGZhaWxzIO2MqOy5mOulvCDsoIHsmqntlZjr
qbQNCmdlbmVyaWMvMTI37J2YIOusuOygnOqwgCDsiJjsoJXrkKnri4jri6QuIOq4sOyhtCDtgbTr
n6zsiqTthLAg7ZWg64u57JeQ64qUIGlzX2NvbnRpZyA9IHRydWXsl6zrj4Qg65GQIHJ1bnPsnLzr
oZwg67aE66as65CY7Ja0DQrtlaDri7nrkJjripQg6rK97Jqw6rCAIOyeiOyXiOuKlOuNsCwNCuyd
tCDqsr3smrDsl5Ag7LKrIHJ1bnPrp4wgZmFsbG9jYXRl7JeQ7IScIOygnOuhnCDslYTsm4PsnYQg
7ZW07IScIOusuOygnOqwgCDrsJzsg53tlojsl4jsirXri4jri6QuDQoNCiAg7YyQ7KCVOiBDaGFu
Z2VzIHJlcXVlc3RlZC4g7Ius6rCB64+EIEhpZ2guIOygle2Zle2VnCDtirjrpqzqsbDripQNCiAg
IGZzL250ZnMvZWEuYzozMy00MCAg65Kk7J2YICBmcy9udGZzL2VhLmM6MzkyLTQwMCDsnbTrqbAs
IOyYge2WpeydgCDsmIHsho3soIHsnbgNCiAgRUEgZGF0YS9tZXRhZGF0YSDrtojsnbzsuZjsmYAg
6rCA64ql7ZWcIO2MjOydvOyLnOyKpO2FnCDshpDsg4HsnbTri6QuIOyLoOuisOuPhOuKlCA5LzEw
7J2064ukLg0KICDqtIDroKjrkJwg7J207KCEIExvcmUg66as67ewIOy9lOupmO2KuOuKlCDsl4br
i6QuIOy1nOyGjCDsiJjsoJUg67Cp7Zal7J2AIOuqqOuToCDstpXshowg6rCA64ql7ZWcDQogIHJl
cGxhY2VtZW50L3VwZGF0ZeyXkOyEnCDquLDsobQgICRFQSAg67CU7J207Yq47JmAIOq4sOyhtCAg
c3RydWN0IGVhX2luZm9ybWF0aW9uIOydhA0KICDrs7TsobTtlZjqs6AsIHByZWZpeCB3cml0ZSwg
dHJ1bmNhdGUg65iQ64qUIGluZm9ybWF0aW9uIHdyaXRl6rCAIOyLpO2MqO2VmOuptCDrkZgg64uk
DQogIOuzteq1rO2VmOuKlCDqsoPsnbTri6QuIHJvbGxiYWNrIOyYpOulmOulvCDsobDsmqntnogg
67KE66Ck7ISc64qUIOyViCDrkJzri6QuIOqwmeydgCBvbi1kaXNrDQogIGludmFyaWFudOulvCDs
oJzqs7XtlZzri6TrqbQgYXRvbWljIHN0YWdpbmfrj4Qg64yA7JWI7J2064ukLg0KDQoyMDI264WE
IDEw7JuUIDfsnbwgKOyImCkg7Jik7ZuEIDEwOjE5LCBOYW1qYWUgSmVvbiA8bGlua2luamVvbkBr
ZXJuZWwub3JnPuuLmOydtCDsnpHshLE6DQo+DQo+IFByb3BhZ2F0ZSBlcnJvcnMgZnJvbSB0cnVu
Y2F0aW5nIGFuIEVBIHN0cmVhbSBzbyBjYWxsZXJzIGRvIG5vdA0KPiByZXBvcnQgYSBzdWNjZXNz
ZnVsIHhhdHRyIHVwZGF0ZSBhZnRlciBhIGZhaWxlZCByZXNpemUuDQo+DQo+IEZpeGVzOiBmYzA1
M2YwNWNhMjggKCJudGZzOiBhZGQgcmVwYXJzZSBhbmQgZWEgb3BlcmF0aW9ucyIpDQo+IFNpZ25l
ZC1vZmYtYnk6IE5hbWphZSBKZW9uIDxsaW5raW5qZW9uQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAg
ZnMvbnRmcy9lYS5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9mcy9udGZzL2VhLmMgYi9mcy9udGZzL2Vh
LmMNCj4gaW5kZXggYjRmY2ZiZTJkYTRjLi5mZjY5ZmIwN2Y4NGEgMTAwNjQ0DQo+IC0tLSBhL2Zz
L250ZnMvZWEuYw0KPiArKysgYi9mcy9udGZzL2VhLmMNCj4gQEAgLTM3LDcgKzM3LDcgQEAgc3Rh
dGljIGludCBudGZzX3dyaXRlX2VhKHN0cnVjdCBudGZzX2lub2RlICpuaSwgX19sZTMyIHR5cGUs
IGNoYXIgKnZhbHVlLCBzNjQgZWENCj4gICAgICAgICAgICAgICAgIHN0cnVjdCBudGZzX2lub2Rl
ICplYV9uaSA9IE5URlNfSShlYV92aSk7DQo+DQo+ICAgICAgICAgICAgICAgICBpZiAobmVlZF90
cnVuY2F0ZSAmJiBlYV9uaS0+ZGF0YV9zaXplID4gZWFfb2ZmICsgZWFfc2l6ZSkNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgbnRmc19hdHRyX3RydW5jYXRlKGVhX25pLCBlYV9vZmYgKyBlYV9z
aXplKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gbnRmc19hdHRyX3RydW5jYXRl
KGVhX25pLCBlYV9vZmYgKyBlYV9zaXplKTsNCj4gICAgICAgICAgICAgICAgIG1hcmtfbWZ0X3Jl
Y29yZF9kaXJ0eShuaSk7DQo+ICAgICAgICAgfQ0KPg0KPiAtLQ0KPiAyLjI1LjENCj4NCg0KDQot
LSANClRoYW5rcywNCkh5dW5jaHVsDQo=
