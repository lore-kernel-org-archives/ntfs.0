Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67949302155
	for <ntfs@lists.linux.dev>; Thu, 17 Sep 2026 04:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789618939; cv=none; b=Lr293Dh1v1zs9IaKFMBrGvfRaEwjPA+T6wumyYxeksKBF0G1Vsb8dVlCVkbgLlOO6v3p1DIqCwGNuaGmMhvQ5E5asV1QpZJjeqD++Nc6AXviRfkIKolY37NHURGoLtaAUzE4W1mefVFttcESyAjRzf/kYAUxSnQQp2zjqRDzYS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789618939; c=relaxed/simple;
	bh=1fK5MtmOWDFH/FcgfwNq+jQUvUAwSVHapAqSkHBHWZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0zr7Xc1T1JtAUKCuW+dXjSY2ySYFuhCmeJLhr37pAcy8d7oKNA5/M4yXcpSSSc4Dn+IE1qF2tbLtHoSo2cCATVsEv8ogIKFJZCRk+lK8De2XhvHtCJpc3xZsWzus+py091nRmdfHMI/o7zAKNzbtJYlHBCTk7TAHeceC5xeOBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nfy06BVu; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nfy06BVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=g3XJZr0bBAmjOsLLoXDbQLrl5Q9yQ0n598oUSVXwZq0=;
	b=nfy06BVujwOHDCcbgVosR0L/IuIHUVnlLUpnjtPjCuaCaetUrhkvsxpkMtzLVk
	Py9hFCR7m7+ejDSBVJtwm1OJgpNn6d44Pr8m0zyuuCaKHRD6zxArWSs9PGQBz4x6
	MT5+UGMUjCyHiZ1K20miRIdex5P7ySL/s8Xeo8xb9KyLY=
Received: from [IPV6:2409:8900:1e93:14fb:69bd:c53b:3beb:e380] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgC3RCHlaqtqrpxfSA--.64386S2;
	Thu, 17 Sep 2026 12:21:59 +0800 (CST)
Message-ID: <545e6e4c-d897-4248-a2c0-bbbe6f4fef45@163.com>
Date: Thu, 17 Sep 2026 12:21:57 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] ntfs: report attribute errors to fsnotify
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
References: <20260916022345.1151836-1-liubaolin12138@163.com>
 <20260916022345.1151836-3-liubaolin12138@163.com>
 <aqpHhxKx_xiSoZZQ@hyunchul-PC02>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <aqpHhxKx_xiSoZZQ@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgC3RCHlaqtqrpxfSA--.64386S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw45ZFWUJF4fKFy3JFykuFg_yoW8Ww1kpF
	WxGa97K397t347Wr1qk3yjva42vryIgrWjqry5Gw13Can8Krn7tF4xKwn5uF4FkryrKrZF
	qr4jka9rZrWUZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2kskUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQdZJGqraudB8QAA3H



在 2026/9/16 15:38, Hyunchul Lee 写道:
> Hi Baolin,
> 
>>   folio_err_out:
>> @@ -3720,7 +3737,8 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
>>   static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
>>   					    s64 from_vcn,
>>   					    struct ntfs_inode *locked_ni,
>> -					    bool defer_attrlist)
>> +					    bool defer_attrlist,
>> +					    bool *error_reported)
>>   {
>>   	struct ntfs_attr_search_ctx *ctx;
>>   	struct ntfs_inode *base_ni;
>> @@ -4086,8 +4104,11 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
>>   	return 0;
>>   
>>   put_err_out:
>> -	if (ctx)
>> +	if (ctx) {
>> +		if (error_reported && ctx->error_reported)
>> +			*error_reported = true;
>>   		ntfs_attr_put_search_ctx(ctx);
>> +	}
>>   	return err;
>>   }
> 
> __ntfs_attr_update_mapping_pairs() does:
> 
>    ntfs_attr_put_search_ctx(ctx);
>    ctx = NULL
> 
> Therefore any later mapping or other errors can therefore lose report
> state and duplicate reports. And The error_reported boolean only tell
> us that some lower-level path has already emitted an error. Consequently
> a report can incorrectly suppress a separate report for a later rollback
> or resotre failure, even though that failure represents an independant
> filesystem integrity problem.
> 
> Instead of carrying error_reported, would it be simpler to report each
> error at its detection point and let fanofify merge repeated error
> events? or would there be any alternatives?
> 
Hi Hyunchul,
   Thanks for the feedback. I agree that reporting errors at their 
detection points and relying on fanotify's event merging is simpler. 
I'll update the series accordingly and send v3.

Thanks,
Baolin.

