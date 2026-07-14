Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C88643B487
	for <ntfs@lists.linux.dev>; Tue, 14 Jul 2026 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784019506; cv=pass; b=g7ibDJSkF6XZ+Cykvo0aVaS2hFbr/FmKnLHMCMfy6/cLhMXLk5OlJdytRPeayaPMNVvlQu+Yt7z0OsCUCxOPcgxkMa7Whz5pPeVa4qhFRETmxi4k7UMFNE4Xl7C+UtAWFBL8nqBX+2fU0wgJ7XqCtNJ9pjyREBmAoWqPe/1UZqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784019506; c=relaxed/simple;
	bh=O7fWqPomPONuY+4bMT6dVAWEosaeH9pUd2VtVYFKKf0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ny1v/SnW+ztSFgJ0X/I/mFHcqMlNqVBRcIYIzskSXoaDr5xkfIOELu72/S67GgMadulI+ZZ0SiW6YJjpJx1V+EMglEcWHPZTaxVHuA4p3EYsbCPbpyqYa6KHVePSeiOyJfTc2EKXJr121GjJnQTBtmvsUq9Fkgb0IWYCHEQgTcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H8hUwwvY; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H8hUwwvY"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a475409044so169258b6e.1
        for <ntfs@lists.linux.dev>; Tue, 14 Jul 2026 01:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784019503; cv=none;
        d=google.com; s=arc-20260327;
        b=pvv1oC52mgFvXvNVrb+meGusp4hjNsCOyeWNBCAH3QtgmxME5X7xxsquDjSipoXiow
         QuqqN/D+l6LJ3TFPqO+dDcZQelUWe3dGOQULHTMiY91iHhXFBSo+C/D71S+P6UigCocV
         IJvrdTzJESjPJZ9So1BP7yXp4Zo6O4qen4bGy1X1dQcA/h3e5WzHO1gUBboVsQLKCC5y
         xKzQjZ9St2Se+E7We664880g2E8WUbYZ+Bq4MMw0YrADsX7xIexTvgjTELtd/3OrZ4rH
         UrXsqP2s1xolF+op2zqn0UAVm3TqoUPUHuk4dOvfes9ws0Jzm+dZKT+xvI7Tiqj9tndg
         kXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=O7fWqPomPONuY+4bMT6dVAWEosaeH9pUd2VtVYFKKf0=;
        fh=fcLEVCuA+F+vKek4isFcXZ162jWgih3uSjJja5hjO3M=;
        b=Z57ngL5zKM4ld6Lz+E8y0HJgpDUnIitk+cnbP48WJaxq4Gr+rrAWoSJB3BYcyIZOkZ
         NqILjsPdvAogOhh69i2TwNZBhzfK8NXZ/YTcCnqKx0RRUfzmB4DMwUKhq19oSTzZ7yZC
         wQVCqDX/p+6TGR5wJqpChUwQbClfsc8qJtg/9vwbd5D8VBiP/wGqVIu8/NH8tnwjgQHt
         Gmik4CB7JMal8K6Zn5Xx54HsOuZXFzlQR8H1RWzcg0cJXf81IGJfqO/tszXclo8y5CYg
         pHc4wFvF1wZYZrjrVS8q6TOJJF7l20cLHwDG913c6Gqs4yDD4gOKhlm8yH3EtCVKyOuO
         +AmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784019503; x=1784624303; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O7fWqPomPONuY+4bMT6dVAWEosaeH9pUd2VtVYFKKf0=;
        b=H8hUwwvYWDKZYEzTc7Hj6fMew3E82Y26tKTKOq3vRif26LPAsl6JOmvIkaaxuJPXDX
         sdC9mema6A+Cy8Tw5o9fVe+HxE0AQIRPiplPhiY7IGmJEU8bnM2bffjNk7C9MhWmxFS/
         gxm84UgLk/qBN8JiLNztL9NG4VUSzQgG4lGOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784019503; x=1784624303;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7fWqPomPONuY+4bMT6dVAWEosaeH9pUd2VtVYFKKf0=;
        b=fYxBWPH2UCfzqplNOu9TJYA8kAjNCFWhhxF7XfiTijGbMFOfId74r84UAPbOphCevw
         WMG14p98AgRCxxACffxyzyG43I36WlKlUk0iW4dGozZZttiur0tzVIGiPxVJy/UwLOjZ
         iq/J1EOWaimfKs7c2r7uIkxjtIq20FJ94LnFDdieYYdV3j3LBZr54F6zg6tNpp+ECBvr
         0576oElUAIgJqwoBDet1CkYVRY2pvgPpW3YfshEBB7vlpjyW+OK61Mu6IfNTsXawhXGy
         bEtYUXM7+6ZBKwW5pBO5lf8F38eeSCjJgrvd7ae2GMJhEWVe+l1Ox1c8FFWwrpPTqz97
         n+ng==
X-Gm-Message-State: AOJu0YxAB7V6F25tGosbL6S5yTXZpHKNX5AfN/lwx496BlI1aL0oCfCL
	pKUmsNTizTKnBtZcVWll5b3BNTR3uG4oPAH7cyB4prb2RryelQIysmKuCb4Qtvh71pHBBaAwoXI
	1KKo9tj/lOZY4z2GBLNNl2Y4xjlx09I/08G6ebehNMgpSHGB2SjTxSu0=
X-Gm-Gg: AfdE7clKGasOoXD6jQCOFRvx7zY27dVc7kLway9ucbUlkpsI0bJ8vK8Vtc84WNyWxSq
	w9cRY/cRuoTMZ5xTdBC4v3Grk5Qkom494dGi39ehcbvCADu5zIqKT4RCaJgKwRqL77HUBfA/BCf
	g4LXc5kw2irnSDhGf5XlCzgvBQpYxIOKH3boub7EIo9mZLY93pANaZ36VG3mYQz7+cy72QEXzht
	WgiT/iy9MAcc7J/jQ85nwJNx+F327Ga9/JgWr1FkWl/JvjaD0Q9SfpvcfxXBGgubA9e4z+NWTW5
	TebHRLho
X-Received: by 2002:a05:6809:292:20b0:4a4:575f:c274 with SMTP id
 5614622812f47-4a4575fc8d7mr2490079b6e.27.1784019502775; Tue, 14 Jul 2026
 01:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chris Hoy Poy <choypoy@linuxfoundation.org>
Date: Tue, 14 Jul 2026 16:58:11 +0800
X-Gm-Features: AUfX_myYIrXhV7RtkVxxtqTzhMLloHL8VnmMZsOvlLPZlDCQxGqbaBPXvmdRrpk
Message-ID: <CAKkv+gyzCpc4dpXEVoqUJDtLdKmacpfEQ1qXT_vbKovPFQ+wPw@mail.gmail.com>
Subject: test
To: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

knock knock

Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
