Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929CA37E2F9
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 04:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805838; cv=pass; b=uU4CmKptDAXYFtAWcK541c4zJQ9w8TUsT2DbQuo5vnj60cnqbZyGnhKmS5mJGwpA6/4HiOwgvWGjIdETVsbMxJvMg9K/SnfNmN6+iuNSzvcYJOlzFPSO6cFFuJ7m1gtZf2j5cgymtYIsoD8GVi+46Cs/eKasTIg1NtzO3vK1cHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805838; c=relaxed/simple;
	bh=z6VPGWCw7rEpPhw2SbJhvUKlG9shXTh5n37bEXti6gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXdg5Hx2UhPr0Fs1F2YgrcrvFaaBLA+jTVKmYfCdidquBG5ScE08ktxlBi2rAns+HAt4nf3q/5Pw9b4rjANynK7syEwb81Jgsm765bwaMlSiHvYmcd/DigXLM3LhleN04McnyxPO2U3aPXixGpm8yuJ2FePvyb7rgujnqdPNLKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAsEyBJ2; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAsEyBJ2"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c86945164so13926331fa.1
        for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 21:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787805834; cv=none;
        d=google.com; s=arc-20260327;
        b=AexHJGyFdX4CEMv7RLpdCaeBX9gzJSwIarlQZWYUc37rm+9JmB1Q6GMuKuS4V/ETlC
         0frY6O/KPa1qp7zJtgE01x9wHwMj6bjD8ypvcNlb2e2KNqJjCtne86QshUnWaSjNfe/0
         qH4iZmFeMCh1jX1VlsUoJHLcgQiP5jHxmbtYKjJMq9xSRp7aX3j2ezheyFt6rAsynfKA
         zzAIScZ7QNXSxNUWIhEttBkhnheAFyGcOIt5rEABenIwmQbacmB52XJjVxNihZl/Jo2j
         7NwVqyns2JHJN6sI+9rS0ZqFBcug5j+BO77vjePkzjfVZmFKVStIgZHjY0OlGVquJOru
         IJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhdZH4AQDOVKeQXrpMPQL9ICLmV8N8waJC5TxsBA0M8=;
        fh=f97W3qK55wtwUAVaZtKaWYo64DucHzvCXlyv/H8WZHg=;
        b=Eh7BN4c8oGTexETNr1HfVT1WxlDC/swRCubmCdMGeMJ0HufSJonVObR4MBQ2hpRAWB
         HJQnkoesPiFMGFPEgV+DRj1CYNx04p+p87dq1mCCFx1fd/vDddGaoBLoFxhs1EkqGd7t
         pGW+q3Ake4R90nlNW/Nowlnjn+yqz3T4Ns2VePOPHZsSAXEzJlojtI8lBbM3n5jXSzom
         5GFy4ATS+YIxCX2IZMMU+oZVICYYFfu4d08iK/36f3+FX1XNBvYvLWyHS1PABGTn+x7b
         gbHKEa5aRXcpttjpRw42nLvewTaYncJNW0aix0nyCWoXdcucfr1pMDuv2c5P4lPkdruV
         V1pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805834; x=1788410634; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nhdZH4AQDOVKeQXrpMPQL9ICLmV8N8waJC5TxsBA0M8=;
        b=XAsEyBJ2mTxyC2cf6fcDOIUvjbFUbYTxC/0FH7Vt6VYA7Rit/PSCUEdSRU/2x8pKnx
         YTYxXE7xHOUeT9+edhPWh9kFhRSmHJWBywkQiqCuQ7t3xVMiYWIxMPRExYNjRkF0UUYE
         jJ5BOMxmpw4/X8+poFC/y8HQACAq0jwJ0Eoz3RfFd+rQqsToRzKc395TeQyq+CCN+k4q
         onrgyD3gqWKZu4JfeLYauS50gKDi9gCoAuKLgqiYr9pkITXO2RxuV3/FSP+OTz1UzEAy
         ziKiva9tLW4of/bsXYzSxfEgaQOQe7Wwla9in4BEA9GYwInDeatF1malFoTPQetvb+Bz
         d+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805834; x=1788410634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhdZH4AQDOVKeQXrpMPQL9ICLmV8N8waJC5TxsBA0M8=;
        b=ITcjHOZehO3eODoX/pG/Vm3ZNyoNV1TmiwofBpXvYswAdpnMRN1jKwOOJnbIkym65H
         XHQDKMriZP/OQUHnJpsXD+BBM7ISBFNP5V8Z09IL6CWx+JmGVBElreB8jIhC1miU+k38
         CwNFykBuTfddcSDQlgab5zGBTEM9/uckTzyo9s5UwBGASstujHKjat/qTI+aSRmLh6jx
         Y+UzzoRvFhvVWLb3TruP+HCKorbucjp7uus1BIjhbx4PRHMZM+Vg9RYqO9aDacyg6Y4q
         Fh9uxR6O0cB70wyFe6WEPnGatqJb1KITTvWgf4Sl8bLuFFhpBsHabQIZF/inr0CIKCbE
         ju9A==
X-Forwarded-Encrypted: i=1; AHgh+Rr2cKlU8Kh0kfZUjAVe8e62TvMP+tzJlmfaH+IWOP+eJd5lzYwIEAjlJA99BYlf3gFD0/i0@lists.linux.dev
X-Gm-Message-State: AFuF++nRM5KS/YoriBk3PyzgWiPGFYs90/nIFSdU12u16XkfqIm5tlw7
	q6gZ9yQcoYpHV3pZ1JGs082uUb9s0AnHHiFymG4T/r2OZq98yZtCL/a941FoEemvRs9tsdehZBr
	ZbvWeap7VLF8JlRjE3ttiNh9za38930ZTwQ==
X-Gm-Gg: AR+sD12ZvUneYvaroUxZxampV/5WGeHXSoTGTK50i/bi6YVWO2Y3M5XSMoz3Flnj/mO
	d7oXg0J8TdegLk5iksP3F/f01ALUkdc634ImQ5Ck1P9y2b6HYOd99l7PO2Umw6BtYeuV8O9uuHe
	LW98xtDKeDyM/DsOZM3xhDAi8zJVfPBNp3CfQt1Vl9XAb9mGJUI4hiW29cp6InwCmMXZTOnRqCR
	RCdXTUnFzNRaiC4fDSh+lxKnRvO3qdvUqB/kwvNphmXGa4HYCRS8bkrFjeGSoIWWU8+Ni7Equ9V
	9hezeq1lJQiPwEcVfZLJhUSm2mBiQu4IOD7OuNHyk+UCaJ7F5fcjP2o=
X-Received: by 2002:a2e:b8ca:0:b0:39c:9dbf:f7b3 with SMTP id
 38308e7fff4ca-3a1fd111a4fmr26214041fa.0.1787805834275; Wed, 26 Aug 2026
 21:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827031647.1605970-1-zenghongling@kylinos.cn>
 <bd197da8-a8ec-40ad-a50d-dc579840d680@163.com> <6A8FB73D.30104@126.com> <6bf63800-e169-4ff7-baa2-52c4d42bb35e@163.com>
In-Reply-To: <6bf63800-e169-4ff7-baa2-52c4d42bb35e@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 27 Aug 2026 13:43:42 +0900
X-Gm-Features: AcwNN1Xdgma1ZvWQvIA8ZJD3CihsJ2geawtIGSe3EcuUDM2iz2mdfYi8kHS-uLg
Message-ID: <CANFS6bYc88BcJFgQegg84DpDN4MHewowomCRAvL+2SxAO4L9aQ@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: fix race between fallocate and mmap reads
To: liubaolin <liubaolin12138@163.com>
Cc: Hongling Zeng <zhongling0719@126.com>, Hongling Zeng <zenghongling@kylinos.cn>, 
	linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > Hi  Baolin and Hyunchul
> >   You're right =E2=80=94 that's exactly the unbalanced-unlock path we s=
potted while
> >    preparing v3, and option 2 is what v3 implements. The early exit now
> > does
> >    inode_unlock() + direct return, so every path reaching out: holds
> >    invalidate_lock, which let us drop map_locked entirely:
> >
> >     inode_lock(vi);
> >     if (NInoCompressed(...) ) {
> >             inode_unlock(vi);
> >             return -EOPNOTSUPP;
> >     }
> >     inode_dio_wait(vi);
> >     filemap_invalidate_lock(vi->i_mapping);
> >     ...
> >     out:
> >             filemap_invalidate_unlock(vi->i_mapping);
> >     v3 with this cleanup is on its way / attached.
> >
> >   Would this v3 approach be OK with you?
> >
> >     Thanks,
> >     Hongling
>
> Hi Hyunchul,
>     I think this approach is good.Looking forward to your feedback.

The approach looks fine to me as well.

>
> Thanks,
> Baolin.
>
>


--=20
Thanks,
Hyunchul
