Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8685137750
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 03:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789959833; cv=none; b=WwQcq6VZDltobg1MsVM0NIto9ooluhJ6Ojce9o8sbURV8APnKeZNoYnhm7MwoV7DKMhqCQlAsd0xQDKkCe078aHXeXHP1CNJi+XKpcKs5RX55iR1xm13d9wpFCn5Y8OGg3+ipw50mRLY0iiV9usA4ldjFGdYaTTzk+jHp+3QFsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789959833; c=relaxed/simple;
	bh=pneiKety0LwyJ7c3ONmlyN/z05w/L6YgUeSsQ24Nm00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7uUosxEtcy/a1Xhe7o5oTeGjlmecg4zaF00ZLMwyTU59Uyf/2J0Vf9a3vBM037XsTqAe/MeLtM73MXKq16e8n+Ja7+W4M0ALnS3dbv4X4FWf3kxHhXsQbaw7MdrWN831G2md7nX3OgDyIUFIcN5Bty9xQxtzLTbeS7a0R486mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nt9rr9Qy; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nt9rr9Qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=mc5+dfI+gU0hM7WIkcYL6xkpKQJei//9fxgevw0GpXo=;
	b=nt9rr9Qys4RppucvwPDBoWGd3DaXpXg5Eq0sLsOGWtMEyPWi+D6x401lHNzfbj
	1NARr0++0Fteq309wkdPFkEz5ThjauTnCv66pJiIV2PDZn4JMj/+yEitOPnKs46L
	D8EPuKk6PNPLBX96r0nkkXTCikC5ZgOEk46sipBfSeHdY=
Received: from [IPV6:2409:8900:1ee3:222c:3c21:ce3b:b986:2f34] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHgUp5nrBqwZMoAg--.6659S2;
	Mon, 21 Sep 2026 11:03:22 +0800 (CST)
Message-ID: <3c5fb985-6b5a-4514-92af-445e46c5ee77@163.com>
Date: Mon, 21 Sep 2026 11:03:21 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: integer wrap in ntfs load_attribute_list_mount() can cause buffer
 overflow
To: rtm@csail.mit.edu
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 ntfs@lists.linux.dev
References: <27763.1789905448@localhost>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <27763.1789905448@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgBHgUp5nrBqwZMoAg--.6659S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFy5Ww1DKr4UXFWfAFyDGFg_yoWrtw4rpF
	WDKa43tr4ftr1qy3yayFs5XFyagrWxGw15t34UJry7uanxKFn3WFsrKa90va4kuwn7Jr1q
	qa1jg343uF98ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjFAXUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6huMV2qwnnvLTwAA3R



在 2026/9/20 19:57, rtm@csail.mit.edu 写道:
> Baolin,
> 
> rl_byte_len is signed, so I worry that if it's possible for a
> corrupt image to cause the high bit to be set, it would not
> be > al_end - al. ntfs_bdev_read()'s size argument is
> unsigned, so it might then try to read a huge size.
> 
> Robert

Hi Robert,
   Regarding your concern that rl_byte_len could become negative and 
then be converted to a huge unsigned read size, I reviewed the latest 
ntfs-next tree I pulled, at commit 018344e6f555 ("ntfs: fix directory 
lookup on large-page systems"). My understanding is that the existing 
checks prevent rl_byte_len from becoming negative on this path,for the 
following reasons.

   1. The run length in clusters cannot be negative.
   Before calling load_attribute_list_mount(), ntfs_read_inode_mount()
   calls ntfs_mapping_pairs_decompress() and aborts if it fails.
   The decompressor rejects a negative decoded run length:

           if (unlikely(deltaxcn < 0)) {
                   ...
                   goto err_out;
           }
           rl[rlpos].length = deltaxcn;


   2. The run length in clusters also has an upper bound.
   For a data run with a non-negative LCN, the decompressor checks
   both addition overflow and whether the run extends beyond the
   volume boundary (logging omitted):

           if (lcn >= 0) {
                   s64 run_end;

                   if (check_add_overflow(lcn, rl[rlpos].length,
                                          &run_end))
                           goto err_out;

                   if (run_end > (s64)vol->nr_clusters)
                           goto err_out;
           }

   This ensures that:

           rl->length <= vol->nr_clusters - lcn

   Boot-sector parsing also rejects a volume with 2^32 or more
   clusters:

           ll = le64_to_cpu(b->number_of_sectors) >>
                   sectors_per_cluster_bits;
           if (ll >= 1ULL << 32) {
                   ...
                   return false;
           }
           vol->nr_clusters = ll;

   Therefore, the data run length must be less than 2^32 clusters.
   Sparse or unmapped runs cannot bypass this constraint to reach
   the byte-length calculation, because load_attribute_list_mount()
   rejects a negative LCN before that calculation.


   3. Converting this bounded cluster count to bytes cannot make
      rl_byte_len negative.
   The conversion helper takes and returns u64:

           static inline u64 ntfs_cluster_to_bytes(
                           const struct ntfs_volume *vol, u64 clusters)
           {
                   return clusters << vol->cluster_size_bits;
           }

   Its result is assigned to a signed 64-bit variable:

           loff_t rl_byte_len;

           rl_byte_len = ntfs_cluster_to_bytes(vol, rl->length);

   The shift converts the cluster count to bytes. For example, with 
4096-byte clusters, cluster_size_bits is 12, so shifting left by 12 
multiplies the cluster count by 4096.

   The relevant question is whether this multiplication can produce a 
value too large for the signed rl_byte_len.

   The boot-sector checks and decoding allow at most 4096 bytes per 
sector and 4096 sectors per cluster. Thus, cluster_size_bits cannot 
exceed 24. Combined with the cluster-count bound above:

           clusters < 2^32
           cluster_size_bits <= 24

   the byte length satisfies:

           clusters << cluster_size_bits < 2^32 * 2^24 = 2^56

   This is below 2^63, so it fits in the non-negative range of a signed 
64-bit integer. In terms of bit positions, the cluster count can use at 
most bit 31; shifting it left by at most 24 positions can use at most 
bit 55. It cannot reach the sign bit, bit 63.


   Consequently, rl_byte_len cannot be negative on this path in the 
ntfs-next revision discussed above.
   Please let me know if I have missed a path around this validation.

Thanks,
Baolin.




> 
>> 在 2026/9/20 04:22, rtm@csail.mit.edu 写道:
>>> In this code in fs/ntfs/inode.c load_attribute_list_mount():
>>>                   rl_byte_off = ntfs_cluster_to_bytes(vol, lcn);
>>>                   rl_byte_len = ntfs_cluster_to_bytes(vol, rl->length);
>>>                   if (al + rl_byte_len > al_end)
>>>                           rl_byte_len = al_end - al;
>>>                   err = ntfs_bdev_read(sb->s_bdev, al, rl_byte_off,
>>>                                      round_up(rl_byte_len, SECTOR_SIZE));
>>> rl->length is read from the NTFS disk image. If it is large enough,
>>> then "al + ll_byte_len" will wrap around to a small value, and the
>>> "if" statement won't prevent ntfs_bdev_read() from reading more data
>>> than there is space in al.
>>> Robert Morris
>>> rtm@mit.edu
>>
>> Hi Robert,
>>    Thanks for reporting this. You're right: the pointer addition can
>>    wrap around and bypass the bounds check.
>>
>>    I think we could fix this by comparing the run length against the
>>    remaining buffer space, like this:
>>
>>    -		if (al + rl_byte_len > al_end)
>>    +		if (rl_byte_len > al_end - al)
>>     			rl_byte_len = al_end - al;
>>
>>    Does this approach look reasonable to you?
>>    If so, would you be interested in submitting a patch? If you don't
>>    have time, I can arrange for an engineer on our team to submit it
>>    and credit you with a Reported-by tag.
>>
>>    I look forward to hearing your thoughts and discussing this further.
>>
>> Thanks,
>> Baolin.
>>

