Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C3F46A612
	for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391000; cv=none; b=Z0uDyiO0UKxWyRaVgyAn6PnVcm2kcT9//KEaMnQLJhyKzd6EA3Pb9kw6KJJluaiUfnH5oABTlf5OUA3ttEb1/Eskr+Qtx0oT1D57NTCkFRXnceqwidCv3kEOy25y43sYnh7dQu+9h3eYZsPsXCeNKMtBfeVSeiu/Y0mFaersrTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391000; c=relaxed/simple;
	bh=ikUic+N3QzLsfNnI3YIATm18NVXpKCqxJzugmGA5UwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DG1AGuEh1mTDB7wAuFuTIw5ulFOqqSYfBLR88CtOkCEDlKe9TDE/tU7QH/7mOh9V6igO44AQGjBeTB4LB4VnyHU2s3ay+dEtAgtvjSAkpZW1ahhNUxeIqQV5ektrwMfOavSVDM/qUObpsFKLYi9aE2EbZ3sS2QkeGulUOMbqeNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjPOUAU4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjPOUAU4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e5378b281aso7387725ad.2
        for <ntfs@lists.linux.dev>; Sun, 18 Oct 2026 23:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792390998; x=1792995798; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EoiDhGYBQsA+EuE6OZ11L0CNeac6JOocBhHY+zeRqN0=;
        b=GjPOUAU4zlIYueE3BhoGmd6+OxnVUGi2TnEhOJKkZk8jUHIxhLWSu/jkjeLqHFgVWs
         QMH89dW/M13NCwN5dxHBgZRsRzm+QCr/sq86Ed96zCERPHMvJeZ/k17+7CUuqY0fgYs0
         zcZRFy0OAK30nFcsIKIlXqsgZDcRmY/fkITNlWILGEQGO4V039nkYl57JwtrbKMTirSB
         fGlT9CFrHsNgTmBWH656cjR0vnDg9FbsMaRnKAEepbO/WLtYwwKOKx9dPoxJZMv+lbCm
         EcoLYD42VzD6CIo8TrlLKfnz46VeaQpNbCiION7JVP51dvp/EzaDSoSWmr7T9exC9muz
         gJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390998; x=1792995798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoiDhGYBQsA+EuE6OZ11L0CNeac6JOocBhHY+zeRqN0=;
        b=g76KhG3YdmHaaqSrCFziPg7Pe6CRyn2TEJFZRPWAsyReUXCaIIgnOj/s8x6ymdOMSc
         LoPUqn0DtCl4Ecn0HMyjrpnjtvoHJ2XLz9d27ChNcZxmdq0fltOLL859o3K5JQ4rAEGc
         CrOYAF7MQxf0992+3oYeJuP7qpDe/5oGp3sIncAQfP4613XF0MFq8nVdcwv6GpBKgL0s
         12x8M8ykct2QWuhjBj4HQ+bjB9aSqQb6gO6lAe+sQTWRTMx/kSx8bXuHN90tJmN4d0AE
         nO9J/d4S2vPqDUmmcgOjlmBaZVEnd9FAsb2IlqDA+jf2azpcWIzIGhaV5lyZxEuxtJQ6
         gajg==
X-Forwarded-Encrypted: i=1; AKwUvByWcGPE5TU49jsZsZ9jVgXf25xGcY3f9mSjHCz0hITjwcoryHGBwqVwFHDydqpPEZtaNImD@lists.linux.dev
X-Gm-Message-State: AFq9FYK3STtfjuSTp4jF1lfSdbz6Csz2HaCSo2Z0QAi+DYoPPzp1Zq/t
	6PuZuNo8v0OdFUf8ONB/6TD5N5ydTy9eNJoMJVn/TaXRIYnue9wdFGwA
X-Gm-Gg: AYBFou1xTrudqRyasPN0wyQwi+rh2BpAcPg40bL7ap1jiCupQl2eHAYkM/aRfBntAFz
	/YYHG/d1e/ZsbeHCtHmW93z/uiGMjWfjn0UgeMHn9tES8EiNix68L0kpNaeosZiilHb0Hf+/huu
	XDve9d1hyIfrBFy43OiajcuWHy5iHO2YsYWmRT5ORxlg1psgdyaL9EIDApudqzuBC4TQ7w54OgP
	sDqUwM5mLIxNl4uZrtdT/M/Mhm4N9SwfRnLgRCMJhx8yTlrebHEINsbVqMIUIb44bYnTNMAmI1X
	FEm+h9v8G0lG+P46jsyI01phc5+Pq8jsN8VofnM94OV2BxWv13qtTq5B5VCWlBnWw5iC+IdrIuR
	JLZxd776YLBZcMY0+LgoOgBRYjDFjfUmthgZ+C7trYpfzc70PNHDG81eTRKehjYkBCICSHlZAe+
	+X/4rv/laD0l4+/D/F8YUl/kdEfDPRU/7+7ecftCi165Bdew8pxCwwaQqEmnNR
X-Received: by 2002:a17:902:ea10:b0:2e9:4175:3070 with SMTP id d9443c01a7336-2e9a683449dmr62525305ad.2.1792390998231;
        Sun, 18 Oct 2026 23:23:18 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea0cda9d8fsm570065ad.14.2026.10.18.23.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:23:17 -0700 (PDT)
Date: Mon, 19 Oct 2026 15:23:12 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 0/4] ntfs: serialize attribute-list access
Message-ID: <atW3UFR2lPfqLSvP@hyunchul-PC02>
References: <20260812-topic-attr-list-lock-v6-v7-0-2f35e0a38bfb@gmail.com>
 <CAFRLqsX+4mzD5t1-1OgWg5K3nQPAY_T24uJHpH853mChUpOkYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFRLqsX+4mzD5t1-1OgWg5K3nQPAY_T24uJHpH853mChUpOkYw@mail.gmail.com>

Hi Cen,

> 
> Just checking if there is any update on the v7 series, or if the issue has
> been resolved otherwise.

I am prepairing a v8 version of this series. I will share the patch
as it is ready.

> 
> Thanks again.
> 
> Best regards,
> Cen Zhang

-- 
Thanks,
Hyunchul
