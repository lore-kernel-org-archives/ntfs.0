Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081938;
	b=TFAxwYr+J5HzDtpOgs3JFO2c605MXESCB0lTh+EsnTrVyNKa3KsgQFbGJ29L3AsYSGHU
	 2J2XCUs3VPI6h+pN7z3PnuR0O/MkJBUh9gJNfGsyKolDZpvv/AIR7Cql8sfQhH+lFJZaW
	 Ar6r9C/KgbV10hL/5n+s7ttBjS65e/jIFEgKB84A4wsc685jwqNNGCvPXE26WM1yOXHKD
	 I9W3rwGhWa0cGdV9y+EhZEfmKDFQ9DS2CM7Lr4Enbl91p33aSTn0NBFu0qpepouXvd6iy
	 xkOXVsKQSUZC/gsVYvEzagmvKKJ/xcuM3kEic/D2FeWfTQro+EEvfQZEhq7xNYKFpeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081938;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=9rTAfW4u1PPdVWJfzLLbp4BNSXUE/vuEFidaNLbl3bU=;
	b=ouuv7ssq/7dbMmdzs3vkcxoLNCAjG9QSXbA8vJWjmFjIwdqZopf8LJXBFK4q6nBBw7fl
	 vnvDv8Sx7POTL2xv7VdPxQKJ55blR7hjB4SS3N/1pzfVH5cDQAJDIpuTh/XyrXFpGnu03
	 gbbKmciiVQr9OvK+CsPVs87r+K2IbxkcjiP0hhAIaM0IgLt+VEhVVcYMhcRkEvLMv07dl
	 aA4i3/Ak2vzW2ZmXGVPTswpyIiSFekMNG8L4brMu228AM1EaDmUWMZr7TOeiS/r7JRNjZ
	 5rLqgiiL9XaZD63NQAgVKliznXAfAJXwUamaiCaBQf7RAprf5mOgAyzX9cYZEHjT5hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gA5OhUmn;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91D9606A31B
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 06:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C91D9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gA5OhUmn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=9rTAfW4u1PPdVWJfzLLbp4BNSXUE/vuEFidaNLbl3bU=;
	b=gA5OhUmneVnglJ5+Sf40aGFnhdKkxFfxJRMTAFJVXfE3/qSDqYcFAcZhz4FLWU
	OX0/0VA7XQ6sBUbjTGkSOVXmX6LmvJiUV4Zmthy84MeLx50uHrJQfAXZnXG9gba7
	ldC1i1Ud86me6jwTi0D0z0RBZM9LSPg0UaL2pYxDhEokA=
Message-ID: <371c8495-8eaf-4894-be40-007bf857866e@163.com>
Date: Tue, 27 Oct 2026 14:18:14 +0800
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/31] ntfs: report boot geometry and MFT bootstrap
 errors
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn, wudandan@kylinos.cn
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-6-liubaolin12138@163.com>
 <auA7LJX2rUZUH8v9@hyunchul-PC02>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <auA7LJX2rUZUH8v9@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB3N24oQuBq8P5eCQ--.30598S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnpnQDUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gptOGrgQirEzgAA3d



在 2026/10/27 13:48, Hyunchul Lee 写道:
>> @@ -2802,7 +2822,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>>   
>>   	tmp_ino->i_ino = FILE_MFT;
>>   	insert_inode_hash(tmp_ino);
>> -	if (ntfs_read_inode_mount(tmp_ino) < 0) {
>> +	err = ntfs_read_inode_mount(tmp_ino);
> 
> There is still one error handling case where ntfs_read_inode_mount()
> returns -1.
> 
Hi Hyunchul,

    You're right, I missed that return path. I'll return the actual 
errno there in v5.

Thanks,
Baolin.

