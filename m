Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFED46A612
	for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391398; cv=none; b=Yv5B8S74Q9Mx5unI4Rtdj+I1zag4dUq02yY9pw1leSJgjyl1s98fERGw+NHxmuNF1C9I6unHTTd6vNNXgrtAT9gy79WwWY2VFl7X/DzTyPXWKxS6J9p7LZi3DcL2cu5KK4dfPskdlSQSP9JKz7gTrRvbXG/IjViWsBIZR47Wnus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391398; c=relaxed/simple;
	bh=yjbk2QNzQvDDIqXE6slPatORoTUhYK/UtFATSLLWFtA=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=uyd3Vjpn2fpoZqEN+P6SBlWZaxqizalkwgQRmvbHctBNv6LZLRFy//1SAdKQpAUXVyQQXHhJixr6i4y+Zx2+FLELOKZLv88X9pk41m8lOnfrSY8Ms0egIrUdegifwwSsyFY7rhgTU3LFF8bklMOOt5p5DlZQ0QVwMXeFqYUlTnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=OzsRpPjM; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="OzsRpPjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=HKdkjO7NgXxWAbZCe6AWOGG9OZKcqPGFDM+xuXVWrUA=;
	b=OzsRpPjM5lzrsmDVjn51zKpWiz5aLLIfJceVSEo2YQii9m0gMnYq+FmJKKk92s
	scNISmfQEFdCpkeGrqzMT+JagYVP3YL9GF4HVS0vGg27hD6JDQdTE5wkj79HIv4a
	172YfJBlIPPLZkLQRRV3vYEAuvYXj7jq2t0e2IlFXeVlI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXryXJuNVqZY6SBg--.35701S2;
	Mon, 19 Oct 2026 14:29:30 +0800 (CST)
Message-ID: <6AD5B8A4.5090307@126.com>
Date: Mon, 19 Oct 2026 14:28:52 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: Hyunchul Lee <hyc.lee@gmail.com>, 
 Hongling Zeng <zenghongling@kylinos.cn>
CC: linkinjeon@kernel.org, ntfs@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: handle a failed size rollback in the write error
 path
References: <20261004024822.640574-1-zenghongling@kylinos.cn> <asSM3LZyQymjjuj8@hyunchul-PC02>
In-Reply-To: <asSM3LZyQymjjuj8@hyunchul-PC02>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXryXJuNVqZY6SBg--.35701S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr4ktF1kJw18Zr17KFW7Jwb_yoW5CrWxpr
	9rWrZ0yF4Dt34xCrnIqrWUXa4FvryrWr4UurW3tF17CFn5Cwn3WFyUKrW09rZ7tr98twsY
	vF4DXry3uF1DXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jI0PfUUUUU=
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoApwQWrVuMoWnQAA3d


在 2026年10月06日 13:53, Hyunchul Lee 写道:
> On Sun, Oct 04, 2026 at 10:48:22AM +0800, Hongling Zeng wrote:
>> ntfs_file_write_iter() extends the data and initialized sizes before
>> it copies the user data and restores them when the write then fails.
>> The restoration is best-effort: both results are discarded, even
>> though the extension is already recorded in the dirty MFT record.
>> When the restoration fails too, the extended sizes reach the disk
>> while the VFS inode keeps reporting the old ones: after a remount the
>> file appears grown again, with an uninitialized tail where the failed
>> write never put any data, and nothing records the failure.
>>
>> Keep both undo results: on failure, set NVolSetErrors(), which the next
>> persistence point persists as VOLUME_IS_DIRTY, and log a message for
>> the errors= policy.
>>
>> Fixes: 9c87959601e8 ("ntfs: update file operations")
>> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>> ---
>>   fs/ntfs/file.c | 29 +++++++++++++++++++++++++++--
>>   1 file changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
>> index 3ec82715a588..b5b30e44ac51 100644
>> --- a/fs/ntfs/file.c
>> +++ b/fs/ntfs/file.c
>> @@ -678,14 +678,39 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>>   				&ntfs_iomap_folio_ops, NULL);
>>   out:
>>   	if (ret < 0 && ret != -EIOCBQUEUED) {
>> +		int undo_err = 0;
>> +
>>   		if (ni->initialized_size != old_init_size) {
>> +			int init_err;
>> +
>>   			mutex_lock(&ni->mrec_lock);
>> -			ntfs_attr_set_initialized_size(ni, old_init_size);
>> +			init_err = ntfs_attr_set_initialized_size(ni,
>> +					old_init_size);
> I think the rollback needs to distinguish resident and compressed
> attributes.
> If the data attribute is still resident,
> ntfs_attr_set_initialized_size() always return -EINVAL.
>
Hi  Hyunchul：
you are right, thanks.  The initialized size rollback now skips a
   resident attribute, where the data size rollback restores both coupled
   sizes, and ntfs_attr_truncate() is skipped on a compressed attribute
   with a warning.
>>   			mutex_unlock(&ni->mrec_lock);
>> +			if (init_err && !undo_err)
>> +				undo_err = init_err;
>>   		}
>>   		if (ni->data_size != old_data_size) {
>> +			int data_err;
>> +
>>   			truncate_setsize(vi, old_data_size);
>> -			ntfs_attr_truncate(ni, old_data_size);
>> +			data_err = ntfs_attr_truncate(ni, old_data_size);
> And ntfs_attr_truncate() always return -EOPNOTSUPP for a compressed
> attribute.
>
>> +			if (data_err && !undo_err)
>> +				undo_err = data_err;
>> +		}
>> +		if (undo_err) {
>> +			/*
>> +			 * The extension is recorded in the dirty MFT
>> +			 * record already, so a failed rollback leaves the
>> +			 * new sizes on disk while the VFS inode keeps
>> +			 * reporting the old ones.  Record the error: the
>> +			 * next persistence point persists it as
>> +			 * VOLUME_IS_DIRTY.  Run chkdsk.
>> +			 */
>> +			NVolSetErrors(vol);
>> +			ntfs_error(vi->i_sb,
>> +				   "Failed to roll back the size update: %d",
>> +				   undo_err);
>>   		}
>>   	}
>>   out_lock:
>> -- 
>> 2.25.1
>>

