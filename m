Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98500391501
	for <ntfs@lists.linux.dev>; Fri,  7 Aug 2026 01:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786067950; cv=none; b=TFl0Si39DpdQZyStPZWVa+QbPSlIxOtir+70wVL/8fXJG56P7m0KlsUXcj7O6LUQuj6HjDV+9PoFyUHPOs7RC0DiHTZA0ZEG6YUwiCRVBgOy8CZ/SffwpXEbVBIXVJcDf7a2jUFoS/NSX23y5GqoK5XYNvvboAC5vjY3u+UzlWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786067950; c=relaxed/simple;
	bh=on2D0luqT6mzoqhF+mDYoAnSPwR8IXyf430Vv0Aw674=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=YSM+xvI8tpgkOpD/PSYwFNikqG27VinWcX4Qx8dtqRDKMJnQ2mBFkwzCsMaTrpHQueGYbEYYjicnK9GIoeuTUFNXo+ZrNVr6MSEayGUKWtIlxiHRsvopuoJaE/LNZ/qtcYaze9ZIkUtlINdAIv7z++f/dFzdqNvSkaUrQnmsTYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=dGGo+H1p; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="dGGo+H1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=5DUrrGdlyZvyvoUP0goFItoyUXVm51ZRkbFuiWOVPCQ=;
	b=dGGo+H1pBBL8Z09tJjOMsqy4Bv0+zz08RGo/Ta/UE+57b/ny8sPOUqcmMQMbLM
	SOwyqPWA1pCMCPWwAqb3MeVlQUF+WaqIuemQGJjakwzc7qetTLI38fOykEAZ2xHv
	RoH9CWR3u4VOeZI1qzNWXnNMOk3ebZE/RiYicO2EiupXU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnf4Y6O3Vq21rUEw--.16321S2;
	Fri, 07 Aug 2026 09:56:10 +0800 (CST)
Message-ID: <6A753B23.3070908@126.com>
Date: Fri, 07 Aug 2026 09:55:47 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: Namjae Jeon <linkinjeon@kernel.org>, 
 Hongling Zeng <zenghongling@kylinos.cn>
CC: hyc.lee@gmail.com, alexandro.calo@nozominetworks.com, 
 ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Subject: Re: [PATCH v3] ntfs: validate non-resident attribute offsets
References: <20260806055713.42067-1-zenghongling@kylinos.cn> <CAKYAXd91TzMghrpOG4pBYr-9UBY9qJ6by=mrkS0m4BxMZEbrHg@mail.gmail.com>
In-Reply-To: <CAKYAXd91TzMghrpOG4pBYr-9UBY9qJ6by=mrkS0m4BxMZEbrHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnf4Y6O3Vq21rUEw--.16321S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw48AFWrWrWDKr1rCw1UGFg_yoWftrX_Wa
	93Xr1xu395Aw45Ca1DKrWxKFy7t39rX3W3Xrs8CF4fZry8JFZxXan5Xa4jvryDJrZYq3ZI
	y34kWFyUGwsF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8q0P3UUUUU==
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoBrUpWp1OzqfdAAA3+


在 2026年08月06日 21:17, Namjae Jeon 写道:
>> +       /* Ensure there's room for the compressed_size field if needed. */
>> +       if (!(a->flags & ATTR_IS_SPARSE) &&
>> +           !(a->flags & ATTR_IS_COMPRESSED) &&
>> +           attr_len - mp_offset < sizeof(a->data.non_resident.compressed_size))
>> +               return false;
> Sorry for the confusion. I rechecked the code and realized that
> ATTR_COMPRESSION_MASK is correct here. It covers the entire
> compression field, while ATTR_IS_COMPRESSED checks only the 0x0001
> bit. Since this validation checks whether the attribute layout
> includes compressed_size, it should use the mask, consistent with the
> existing min_len check.  So I have applied the previously attached
> patch.
>
> Thanks!
You're absolutely correct， Thanks for the guidance and applied the 
patch . I now understand that ATTR_COMPRESSION_MASK
   (0x00ff) is the correct choice—it covers all compression cases, not 
just  the 0x0001 flag.

