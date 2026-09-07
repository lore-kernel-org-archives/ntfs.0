Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8685540BCB6
	for <ntfs@lists.linux.dev>; Mon,  7 Sep 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775646; cv=pass; b=c6M4N/y02UGtw9epIpZ3sdUA3IzIGrbnQAsQWf5PfOZXHlgOi7xd/X/4d2v/TaDTBCVKAp8vkz+LIOwQZYP9VfXSBOk/j6DG8QKXT0Bchq2LpkeY9Wi9LaDrF6TwuCx/obTpKfNUzuOk6uZnsi+02Fea39E7p507Zep6342z7GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775646; c=relaxed/simple;
	bh=li9OHi/1KZ+MO1jLAtKSiKtJhswUzJtMKgd5bNPdvz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnW4Y89gbnTXZSTiOKbJfwT6HPy/kdpmfJGGuY3HAouM9Nqe/0v3/H21knVx1SzsS/9LsQaQonfAyzsRAM4qhKzUbHIWzDfG9KQbxlVxqCuOieSj/k3IxfgUb+sON1f0CK9rid7fmp6xrAemLnzzYIBcbQMD2KX4Ez1jNux3eFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTe04d/a; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTe04d/a"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b60bcf9051so2925243e87.1
        for <ntfs@lists.linux.dev>; Mon, 07 Sep 2026 03:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788775641; cv=none;
        d=google.com; s=arc-20260327;
        b=r/aYRcgenhFCwKFuj80PKxGLh1rlCYALCeWAjm0tFp7ryaxv9nx+tBwzU7GFY19u67
         62ZUPz/TfvbRuCNigY6QS8QguLFytzF7uyVcv7+DO4sRWoz/9JuKJyHecO9uSSiDotDw
         BkpATQosHcPJJ2x386ixEHexFMFnpMlRH0TsOviuX43pLPSMTZSaz2L/wtlqVVioY25V
         gcLCvFy2ghsWl0BC7tLAYY8qPKF5pkYVDx56tG3i5eXTZeWzR37gxLwm6JO2+BUgzo/v
         zJWNQPfgGt1vjUBkFUJJbCRKLxENro5Gyl0aH/m4JX9eLJCvkllZvJ9pWxd2WGB9QmzB
         tRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CToFehcXgP2N1u+eQHsGtY0ToS/tNrPHiiF///4RSho=;
        fh=Kl6FjC8hSGw/BFIgCEwV491BP/L74MhXYp9V60MUjeE=;
        b=R64GFqtClQK6dYQUJs52wHA4q5D1n+gda3ye7680ojkXizNTNTzAKos2yH5i/lnXun
         +Ls4P4X2Ns/xsNgRbHexB7vNjmcxQ3Te9SxAk5n5Y4CzOnAy8OgYUF++ghFowUt2TG+m
         3+CjYwzi9m3l2U0JahAPzVFSUmp4v8PAdk7YLdMVR4I7aEkxo29aDzPIa+dO8gRsPdxy
         c+WsjQuONm9QSmyJxVqiTMkM7XX671Twjsa3csKe/0SIlKQ2Ucn5zySw3hE13ModJ6U7
         k4YiAvz03vTzEs2mIfpdmx3FqJWA504GEa2jnb6ZuO/AiGcvLL+Kv6Fw2Bs1xz5OJsf6
         D+aQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788775641; x=1789380441; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CToFehcXgP2N1u+eQHsGtY0ToS/tNrPHiiF///4RSho=;
        b=JTe04d/aeIXE9FP1kDuVxvYy4s26leZQK8CWxj5Hws87jAlLsmkx7cioRVCHrk27uV
         thxrxfpI/QPSRlEdM+TGmIrPxu1cv80Kko8DGMAXUcwhmOfmbllNm/u73yJS0eN0/b55
         IMoNGP/rQc4NXQcAd50ul/AEB5e1vminPlG7jfpsgx8wIF500pASGYYUdJZfEadxZXaY
         3cusEevyHV/H2lfv+DEHQsZd967oQ3Ks+7LDO6VAxFiYlzyXCRjx5Els6Fj48S3hnZ8r
         t4xdCNIzhNe3zT9DOJVgK/dkyaZrNEkMAkxUSTzWXsF8ImAaEkEiZ7Q2aTvLybJC9ljF
         gHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775641; x=1789380441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CToFehcXgP2N1u+eQHsGtY0ToS/tNrPHiiF///4RSho=;
        b=othFRKiNBY3ZiHH8DpnIKWzwncHJnbqeAmHC5O0qe6+C2y+9lGf4jqzmBwi5JDHw+G
         PP1sQQzAzuC/TPRVW/9l65AxQyM4PPzbIiYM2afIIerpLjSe+YD5CXzfFtVuq6VWkJFd
         2dir1/oYxyBeyha/QI89tBz3fDj79gnLPMAGTA74xtGuF+iIGdv+gGU5DV86eqfiqyIk
         rR+0KMpN4d1XcFtN/cBGiQkv7OW7Z39XULllANKiENlSoIqFLJ1qJVCsjmthcu0wQNM3
         jzuj6jl074FL23gARWwQgjLn1hCXYRHNV9Yl/xypzS5HS8Eqtmb64UvM4NupkusXbRG0
         BGqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmFNjQZG6fzs/SXRCESlqPTMg+TsLPqjirwzKFonXVBALcSnT20bq+WMkfO4nbIxCVQPUz@lists.linux.dev
X-Gm-Message-State: AFuF++mX1D1QQYxI2e5+rgMwjxGNoh01CJVdV1iCgKwZFIaeY6Jz/HHN
	DoOlMmxmhJ/EDJR5OjGxRpwVyuSG08EzcTXj7YiDblPE9AfU7VKrvlhPJLpKal90vZLN5ZkBR+/
	uW0SwSDuXXeFsrocFOT7l8z7TsBfnMa0=
X-Gm-Gg: AYBFou2v9k197GMS2Xql4L82Ud+6dtUISEhSHFosz27o0pHW6dcMGoWKjKNBuYHwzZw
	A0b0h60Q9/W+eYU2HFkWSZzOOSock/eG2xbntjNKZVXUESkEfq1wW9ygQZXWZX9AuVq1BsAA0eW
	O5v6T/9r86h1v0UMtA2ZQZT8lv9A0KN8YsGoTQSAyQFLTUYj70mQBMk+l9cO4CEitIXDXEw7PDV
	19vOQzTUWm2UqJbc6LcK7Qw4/nonEZXidODBeoizNkoLoASs5I+pPC3KHrwVv5i9yhLoiTCgX4R
	q5iWJzarvjZ9pyRSc8sXagw4kbDkYMULSjUou4BolDx+
X-Received: by 2002:a05:6512:3a8d:b0:5b6:7fa:e96b with SMTP id
 2adb3069b0e04-5b616f075bdmr7180946e87.14.1788775641072; Mon, 07 Sep 2026
 03:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907030044.3649349-1-liubaolin12138@163.com>
In-Reply-To: <20260907030044.3649349-1-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 7 Sep 2026 19:07:08 +0900
X-Gm-Features: AcwNN1XT1dhp1-gThFirTpL8jAO-9ay29AKWExO5r7pkZClAHMltwKA7PIJI3Ns
Message-ID: <CANFS6bZLth9iSJWt7B5QaBH-th8HxMXEWevO4vPjMnFw09YD1w@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: fix error handling in ntfs_extent_inode_open and
 propagate errors
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 12:01, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> ntfs_extent_inode_open() has two issues:
>
> 1. When map_mft_record() fails or a stale extent reference is found,
>    it returns the non-NULL 'ni' pointer instead of an error, causing
>    the caller to treat the failure as success.
>
> 2. For allocation failures, it returns NULL, losing information about
>    what actually went wrong (-ENOMEM).
>
> Fix both by converting the function to return ERR_PTR() on error, and
> update the single caller (ntfs_inode_attach_all_extents) to check with
> IS_ERR() and propagate the actual error code with PTR_ERR().
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

--
Thanks,
Hyunchul
