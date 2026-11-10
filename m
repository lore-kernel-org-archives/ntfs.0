Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280438;
	b=p7kSR/w3bRUw7YcAdVQmcMEu8MyjaR+sWfPWlgkU5KjrRE3RBqExWw/sapoQYd2ZYuxS
	 YopPd3+TXIIGlUV+APblCRilS5guWTtWylsz8rj2Qm4NYy88rvthLQUPbH0D1EPEz1LRH
	 gFZoR5UHIcQRZlfLmy6feaMPZ1LGTUUuflyZb2Jlxgob72LFEx0JfP+c7poSnvsVGoAVh
	 REt2D6VNLA3I6LjtbWA9q06Om4gWQm4DAC06lx9I/4AJttIuOuDvuPnKjcq+rpNbrfNOV
	 Wwh78NIIm+yxyAemE2gfjXYrSolOLKU9rO/COalKjdz2NWrIKcvXdzvIrzqDm7XRiMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280438;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=CbN16mwkgK9F6G/Di5zJrLdhBzzUcEl4Z6zcZAy4sKI=;
	b=BIqli4tyLQIt+ESCSbN/kkgFCBkc2Q99/C0Apq0soixpqRb+9salLdaeQJSfDT/YaXl5
	 WmsjyiYgXOdYLq8App64V4k/GpkhrfmccQAHWEmzY4/F2RJPm0XHLR3Wd2IncmI74czOD
	 FWr+t750et0BJUHBF/lvUfMg/9dBcr9syStIruKjq/PXG/ESkkO6wUbdtQq/hzDqP6wMg
	 HCqrRaKBZVsnB+Dx7Wc4KdugggsG2Qw7Af/Zl4FEfjXHdXNtCfxooArnxY/3cP1VGtfSu
	 eKeFU+ZfNpDpy2/xrF/7ouqJ7ALY2fnxSxqNHIuoROutd5OKaVnqzbOhX/kvjg+98Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IvulfXzy;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F053606E62E
	for <ntfs@lists.linux.dev>; Tue, 10 Nov 2026 03:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F053606E62E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IvulfXzy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=CbN16mwkgK9F6G/Di5zJrLdhBzzUcEl4Z6zcZAy4sKI=;
	b=IvulfXzyUJOtsPQr72CGOLAVCdEFXGLmw/m+SP2GbF+wZWVKB17YRrfTsGepTs
	syBYUEnS9HJ0f/tt7hxF9hfuhSDBoqlnzF3/1pUYT8TKh8PBR2g9gNoGZGcWxvGk
	Aczv6Qnj4XYeSFkz5J+eDmCjIYrZc8xqqrps6xhl/JJv0=
Message-ID: <5f5302d9-729b-4008-b19e-f7012232e755@163.com>
Date: Tue, 10 Nov 2026 11:13:41 +0800
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
Subject: Re: [PATCH v5 11/31] ntfs: handle source record removal failure
 during attribute moves
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
 <20261102073532.98873-12-wangxuewen_ky@163.com>
 <avEwnT6CAgeCj2oo@hyunchul-PC02>
From: Xuewen Wang <wangxuewen_ky@163.com>
In-Reply-To: <avEwnT6CAgeCj2oo@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X1Xli_JqaAO2GA--.18829S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4rZw4rGry7Cw47tF1kXwb_yoW5GF1kpF
	9xJF9xKa98Jr12y3ZI9F45ta40v34xG3WUXry5Kr12kFs0q3WIqrW8tF10gFyIkF95Kw4U
	Zw4UW39xCayUZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsJ5OUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQdzXGryi+c5oAAA3I



在 2026/11/9 10:31, Hyunchul Lee 写道:
> On Mon, Nov 02, 2026 at 03:35:12PM +0800, Xuewen Wang wrote:
>> From: Xuewen Wang <wangxuewen@kylinos.cn>
>>
>> ntfs_attr_record_move_to() ignores failure to remove the source attribute
>> after copying it. It can update the attribute-list reference and report
>> success with both copies present.
>>
>> Check removal before changing the list entry. On failure, attempt to
>> remove the destination copy, mark its record dirty and unmap it, leaving
>> the list pointing to the source. Report destination cleanup failure
>> separately.
>>
>> Shrinking a record to zero needs no extra space, so failure indicates
>> inconsistent record accounting. Return and report EFSCORRUPTED even if
>> cleanup also fails.
>>
>> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
> 
> This patch has the Fixes tag, but it calls
> ntfs_report_file_metadata_error(), which is introduced in patch 3.
> If this patch is backported to a stable tree with patch 3, it could fail
> to build.
> 
Hi Hyunchul,

Thank you for your review. You are right about the dependency.

Would it make sense to reorganize the series so that the bug-fix patches 
come first and use the existing error-handling mechanisms, without 
depending on the new reporting helpers?

I would then add calls to the new helpers at those sites in a separate 
patch at the end of the series.

Would this approach work for you?

Thanks,
Xuewen
>> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
>> ---
>>   fs/ntfs/attrib.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
>> index 5af8ac41af17..f1c99e0d8dca 100644
>> --- a/fs/ntfs/attrib.c
>> +++ b/fs/ntfs/attrib.c
>> @@ -3578,7 +3578,17 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
>>   	nctx->attr->instance = nctx->mrec->next_attr_instance;
>>   	nctx->mrec->next_attr_instance =
>>   		cpu_to_le16((le16_to_cpu(nctx->mrec->next_attr_instance) + 1) & 0xffff);
>> -	ntfs_attr_record_resize(ctx->mrec, a, 0);
>> +	err = ntfs_attr_record_resize(ctx->mrec, a, 0);
>> +	if (err) {
>> +		err = -EFSCORRUPTED;
>> +		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
>> +		if (ntfs_attr_record_resize(ni_mrec, nctx->attr, 0))
>> +			ntfs_report_file_metadata_error(VFS_I(ni),
>> +							-EFSCORRUPTED);
>> +		mark_mft_record_dirty(ni);
>> +		unmap_mft_record(ni);
>> +		goto put_err_out;
>> +	}
>>   	mark_mft_record_dirty(ctx->ntfs_ino);
>>   	mark_mft_record_dirty(ni);
>>   
>>
>>
> 

