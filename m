Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795004525;
	b=eiVB2D/DVxjxOYbnpTqBgFOXQxmCIPyJ0zLmp0rxfeGl//7xKTl/r4527zyEA2Ao1cUW
	 WmlLiHxsLZ7HwglcmUqCmcWG9oBd532fk1PoWV5clrjRFu31JBf8UxgWciIadrurOWFoL
	 Sm201zcTKRiFnNhdFqorLB1Ck+RJdHJRFFOaLy0znhWzylHe64SysfnFOx1MH4q1VLSUx
	 v7rk6LvHGoUMShA9uklpBxyz5vh/SIik74c4bmfkBgF3z8N7NKEJVKb7taIA6BLYFfz00
	 zYRLaX1ThXdUctWH0S2LDBtvpOwgpe7aRRqSJ2THM6pRc3SP0qHkeXy0rCtq6KMyAUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Bq+SntMyUFfTTS2BLccgwhx2VZINUsF2aTGYssia0cs=;
	b=Hxh0FDoDU0Cnm7uX0YmDtaYRcISl51K86mpG6Y4mgtkpzGdA2f9TwZJhzsJ7TmxhFYzz
	 Xx6BZxLaA2C2C+iw5xwCP/mTSOQLnO1WSFAgkhyQN56IemfRkCXzRzQuJsCwdQNoJI+6b
	 b8MFfxq886PVtnIt3p4sRm8J1pj34HVeZiyycIwDbRmRDxriQVpS5zrVcXjMC/zEGhhG3
	 vwt0yqgVGJXvVOwJW3CVdtFw1qOVbbbCZhGe+5UqNcQcuM4d6oEEntUzV85mCfpbW8brN
	 Egy/KbI7idnYOpYtDvS4f/8quEG9cnd+6lmEB8yEeTgicfZilT7QcQFYlPNCyH73apQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgVlbST7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98269606A330
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 12:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98269606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgVlbST7
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67a30864bcdso114043d50.3
        for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 04:22:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795004523; cv=none;
        d=google.com; s=arc-20260327;
        b=VEowLZzVHj/UlRhLDLe8WtOVqQCjxo7QN8weqzaCClSUKjugHZ6sJFedwEjVSsEAEn
         cetK1zkcSzlttAvhKtE8a27rJRBJ0+wBZePfFBE5OZ6rvQmPp1KyjQGYJov6jxPbXwzE
         82QQAPFL3niQbYK4HNxyhIBuN/CwrcLJMszSwJOoJYLGuFOikXqmJuSyqMwARctX3Wq0
         33p4v2nKCwpLK7WOPTi1WkYvC3Vgx0W7btMNWoRXkqCN4mKi5eMUJLIqP5QtQmLba/zr
         4Hw4z+yHYEmUXCtFOTM6+zAwVrUfuNT+lUX1r0yLx2ZMGFFgQrzVk8RzhReJbirsBJ4+
         cLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Bq+SntMyUFfTTS2BLccgwhx2VZINUsF2aTGYssia0cs=;
        fh=7NayHyaDGU8X7aEB9vXu0m5+y57Z/MubKEGRr+OBevA=;
        b=WZmXhbzjuYiJSWNUh299r4ujDU5L8V/B2oJe/0e9GsGvAwkb+ZyjSB1uD6EsLFBLVl
         JUXQOLSeYxQ7Cj4vd/Hh0yUhXUs38RMSGR8e9KpgqjnPUYpwWI+9f/b3VpKYDVg5RU6o
         uXBxhumUX91/aLGyM/aKMJNZ+ijYUI0goq3k8YMHey2xVnBfKEylgKKlQEdXBM/6aLwd
         u19fB/9MYq9r7MpY+usdOZPEbXCQxebYLwcTlJjrtofWx/1cNciKGuff/33zqG3e+Qmi
         hHE33y1ThNIeaw9AKdpSefD39q2GR6wulvn25qr4w7wzmlnkeoC2dcIgwaAymXL3jrsb
         TwHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795004523; x=1795609323; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bq+SntMyUFfTTS2BLccgwhx2VZINUsF2aTGYssia0cs=;
        b=rgVlbST7e+tV0CCIpKKJ89wmGGqUoWU0wSY3h1lPk9NRJ/a/sXchQztPn57Xhi7BCp
         X1dKBntbR7EE+NNudvamjN8yj67rLyJw344+hrMZ36h+GC6LurbsLJYGDiiaDf5bobkv
         DIQ3p3iEbup2+d/4tbKxpkShBCD90wR29hLK5+Ul97YI/PFw2UIdj7/cTRDX78kvVXfC
         jzT0z39WDkEAh2XVPhSGPyyVx7GJ2FbCQjIyveIxrjKpvAMHZtYxSgWceS8cTtJRTvx3
         q+AtikdQ7X4ACOfVtYf0Tn7pIy3+lAWRDHV3Bzf2tkRxY/uVIW1aTEi7d4Gv3qTGnTHU
         U6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004523; x=1795609323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bq+SntMyUFfTTS2BLccgwhx2VZINUsF2aTGYssia0cs=;
        b=CMdqZYsD+lkQW1yjlsSjpK2fsxJZClxP24qytW/xtqthZkC08rloCXen0OzNEV5/W9
         ETrYcBmO3U9OC0ayh+HnHUqJRNoYYOgW0DieULc/RqTqYZYLrYPNoR//ohB4Eav6Lq4T
         xWKiG5hQn3+WLYcF5qNd1eVvUQ7nPELNfMF1FwmLgTOT5qANRJaFNI5Lt2/SlAeXOad6
         KO0R0ZeO6xQTyYHBVln72mki4GoVhK5cwqRFJTjGnikATs6OFtCGyre/f72JC+7wC96L
         SPaPakgMa3UgrvujumL15l7pn3gazBjQYEC/4ULOzZuYoz8wP66zAsbXRisyRU710chC
         z9Rg==
X-Gm-Message-State: APuU4Z8eR/2qlYCje1H2TuqO35bnpc0QOFi4qAlAJt4Zlzk8XSq3IVDe
	z0qU7CYSBd0tz2S7uGzSc2Pxxj5pfdYj6CBUW4mXVg4kRPbR4Dq1iVXJiiUi9JejspI/d4g4sAK
	fDKMmEs0fIQqFW3IQza2i5V1tmWGMtdE=
X-Gm-Gg: AZFdTZeDPJCNNC1lFw1Eb+pNaED3vCwS1A5Etp0j+wRMdAXniARWr8Gctn3xragebaP
	UrFgeHkeeNnFAK038Ow5m0pgRPjV2a6ajyVAQuvoZrskYRQRi9B6EDvpnOfR7lEI2Lt+55WONwi
	Zaye/yfx9FzUAjvhZgzL6BbU3watTUl1xtyV//Uhad7pzdzGiG9JccNnJNB4q7CPg0Ln1K+9vmW
	AiXSKkU3WQoxVhRnum+sO+lVnG4ZvplF4Zt+PKdCok9/yQp/1GiQRIiFL9MPFEx5guIJMHQvJ8l
	maoQ1svJz+XhXuH3kZWMTOZ+4Zp1oBuxvLiWStfn39nYG9lpViLXgbMczufpnRiqKhb22LowAcu
	YFPVV/xaUDDQ0YMPXnuRKFwBmHAW4AX1dJ7T5wk/IE4HDJLdgSGedcHnMYn4=
X-Received: by 2002:a05:690e:400e:b0:67c:c24:620c with SMTP id
 956f58d0204a3-67dd3f11ca0mr2304898d50.4.1795004523561; Wed, 18 Nov 2026
 04:22:03 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAPLZLeaXKkev=_EwAb679RaZ-Lcb_XQO1FsAw6RyT=M56rP7zw@mail.gmail.com>
 <at72kIgNxnK9p1tq@hyunchul-PC02> <CAPLZLeYo6AhBLcCBeZgDAs5Duv08B4i1rdFNFH5ikTXhcueMAg@mail.gmail.com>
 <auA-MOGIj-J4dLGF@hyunchul-PC02> <CAPLZLeaVAoFefe06b+7MaoLHVMJbAZ+PaDuVkiPMAry6TKpE0w@mail.gmail.com>
 <auBtMq76Vj47NGPu@hyunchul-PC02> <CAPLZLeZtObeMVNY=Q_-hRkyL-ycruuaRsPRwtUUxWPuTWC+McA@mail.gmail.com>
 <auGs5wycYstmw13c@hyunchul-PC02> <av0zY6gKtHFW-mdv@hyunchul-PC02>
In-Reply-To: <av0zY6gKtHFW-mdv@hyunchul-PC02>
From: Jaidan Brashier <jobrashier@gmail.com>
Date: Wed, 18 Nov 2026 04:21:52 -0800
X-Gm-Features: AclHuK834dk3VFwC4SD345OK5NQkAdLJEEdSL_1ZYZXVW_wcmU5moe5gFbRKPvA
Message-ID: <CAPLZLeY0=R3_6tsgm6tken58JekXNr1+NYRFwvFhfmtfCP9KzQ@mail.gmail.com>
Subject: Re: ntfs: EIO/stale-reference errors on several volumes and on-disk
 corruption after switching from ntfs3 (Fedora 44 7.2.x)
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linkinjeon@kernel.org, xkeyc@qq.com
Content-Type: text/plain; charset="UTF-8"

Thanks for getting back to me!
I appreciate the update on the situation, and your work in keeping
NTFS working smoothly on linux.

I will await the update eventually coming to Fedora. Have a nice day.
