Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081831;
	b=dHjzBKfis2BM1eWRE6zv5JyFhStR8Fzm9UU65Bgd5Eod3jb8/29KjWcnZ6iXooBBl7dp
	 3Xq2BKQvTT5ULteXc0KbuxHsmJT3Ipu9fBGRmY3puiOpeepU20fj61pmtIeQ4VIA9748P
	 K0F91SGUBqqAJupgVwJaZBAgC7SH9C9ojvpsjEB05V4imjCP++/aR2z1IadY5l/AAbOvQ
	 hxj6rrwWaMisAf7vM9l7luhCxPAqebDFRRLVs80OEKlo+m4ZVCYZEkKgGpNTTJl2jV2U/
	 c1M7trD/zrkq3cf3tOejSlkgwyINXVBtxn4+O+VGEWI1n3C5iF+vhQe5Yxri8oE9Gbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081831;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ef3JyI0YdgpGvcMfoyAxHAYTbrS9lUx0QjdeKBeznBc=;
	b=LYZeAM68JjGc3Wr9wdq0/RwaiAJaJzu5Q7JnZy2c87l2/kpO1zPSLVM5U6FS67YGCkHc
	 EpZ6GDl06vFPC6O+qDazI9OE87O8cg7OmzdG18icEKv2OvpZzpEJurH073AuU2J5ovV11
	 SSB+6qCnpyQMlBw4lDoiSxBHjiacQUx9+0zglxv331n3JxumL0ni0wd7kKehZ3/v2/g9B
	 anti5iOYSfN1DmiuoGcSkR9dc+0P+XEzFdPZrwT03gewUjKyBMcIRhYiNewtnUgk6hSYe
	 ifpecYE9lqMAGWMiA09cYfr2x0qnswna7DJV4BqMV1u6fRVpwa+IQ98F43XWFPEITKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JUc7K8Xq;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F6F606A31B
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 06:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F6F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JUc7K8Xq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ef3JyI0YdgpGvcMfoyAxHAYTbrS9lUx0QjdeKBeznBc=;
	b=JUc7K8XquiFb5y4NH5vXLs5kXnJxtTJVzVEFXxiLAuFpZ7BgP0BdqvQr6yf7cz
	hLPn81GVP+kJnKsTLLZUc33nOffe+suf8N2Ew/wK+Z1GTHplZOl3ubMAHkgkMVSx
	82kEwuh/Nl045xwsrhJGIAI8RopE5iojbV+HLvVTjZo3A=
Message-ID: <a3d00829-1085-4560-9c20-6a9dae4894f6@163.com>
Date: Tue, 27 Oct 2026 14:16:05 +0800
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
Subject: Re: [PATCH v4 04/31] ntfs: preserve attribute search context
 initialization errors
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn, wudandan@kylinos.cn
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-5-liubaolin12138@163.com>
 <auA600gtGbVWw_SU@hyunchul-PC02>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <auA600gtGbVWw_SU@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBnTZm7QeBqgKJNCQ--.39021S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1rAFy3uw15Gr15uFy3Jwb_yoWxAFX_Zw
	4v93WDKrW2qF1DZwsFvrsavFs8WrZ3Jrn8XryrtFs2yw1kta97uas5urZ3JFZ7Ww1Fvan8
	Gr4UuFyj9r15AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjFAp7UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h1SHWrgQb2s0gAA3w



在 2026/10/27 13:46, Hyunchul Lee 写道:
> Hi,
> 
>> @@ -5476,7 +5480,7 @@ int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *name,
>>   	ntfs_debug("Entering\n");
>>   
>>   	ctx = ntfs_attr_get_search_ctx(ni, NULL);
>> -	if (!ctx) {
>> +	if (IS_ERR(ctx)) {
>>   		ntfs_error(ni->vol->sb, "%s: Failed to get search context",
>>   				__func__);
>>   		return 0;
> 
> ntfs_attr_exist() still turns ntfs_attr_get_search_ctx() errors into
> 'attribute absent'.

Hi HyunchulLee,
    You're right. In v5, I'll make ntfs_attr_exist() preserve errors and 
update its callers to distinguish errors from an absent attribute.

Thanks,
Baolin.

> 
>> -- 
>> 2.51.0
>>
> 

