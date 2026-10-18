Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E8E3D1712
	for <ntfs@lists.linux.dev>; Sun, 18 Oct 2026 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322919; cv=none; b=eMGsiZqluhxsT6coeHSNp9SlRAPz6hCY6GCvM33yH3Ov8cKJ1QEpQoCGufwyt7ltm36o37tyP2E/hY939hDbYjfCX3NcXN807gnwNMHZfGnhiNhyUJkdQsRGbUeN0b9wSvotis9/J7+U0G4j/Ot9VwsKMs8PpMJwP/vN4Vg//KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322919; c=relaxed/simple;
	bh=ZD6V32L6EOpgGYS4IOiLVQ3kvrLGwanfNjYY8nueDtE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z76g/ZJxI0gYCWG+lZ9xKbGWV4G5TuMBWX4eLSI+HtxbK9vOVec04dVu/r5uE6EJg9rS/WVTbUVPlsQ8cji1mKhJn+Pht+9Vqsiju7qT+Udk03Jz/mofbtKu7SDOpar+tZEWOHzskd2647vl3ShRiYUNGhjk1pkC4KgVI1LplIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Z36LTEaJ; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Z36LTEaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:To:
	Content-Type; bh=IuHGnvbvNOKbsMgFHu0BlVgMFHjFxbVadNJpqPjK3sQ=;
	b=Z36LTEaJeLMRN7JAnKiGGyyGfhQcXzucJQvxMI4cGnpEPCMcqqkxhuJrW3Bif6
	FaWCT23onWgKRQeGz9QaVyXbR9wfCLbO2wtSl8NFvINCe0nMcrqbD3sF3VCIT89t
	YmyfqKjicuulqEMEip2RUQah1S9zUPAZUvtbb9SaV6Vw4=
Message-ID: <b472d3cd-e074-45f0-8479-99f623ee6f40@163.com>
Date: Sun, 18 Oct 2026 19:28:21 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: check index block capacity in ntfs_ib_copy_tail()
From: liubaolin <liubaolin12138@163.com>
To: Hang Nan <2122295973@qq.com>
Cc: linkinjeon@kernel.org, hyc.lee@gmail.com, ntfs@lists.linux.dev,
 security@kernel.org
References: <tencent_01175C3A5019C145877D1C31E2532BD2D806@qq.com>
 <39b6c8df-4d5f-4a62-b366-58d1cef3ee58@163.com>
Content-Language: en-US
In-Reply-To: <39b6c8df-4d5f-4a62-b366-58d1cef3ee58@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3MAhVrdRqWmgpAg--.2698S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gw18Ar1DGr1UAw43uF45ZFb_yoW3Zry7pF
	43Gay5taykJry29rn2v3WUAFyF9wn5trWUGry5Wry293sxGr1xKFyrKryY9as2krZ3G342
	qF1jq3s7AryjvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHVb9UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hhRHGrUrVhJ0gAA3v


Hi Hang,
    From the way v1 and v2 were sent, it looks like you may be unfamiliar
with the usual kernel patch submission format and workflow. In this 
email, your replies to review comments, detailed analysis, and the
patch itself are all mixed together.

    Let me outline the basic workflow for the next revision.

    After addressing the review comments and updating your commit,
generate the patch with git format-patch. If you want a cover letter
for the additional explanation, use:

     git format-patch --cover-letter -v3 -1 -o outgoing-v3 HEAD

Edit the generated cover letter's subject and body. You can refer
to this example for how to write a cover letter:
https://lore.kernel.org/all/20260924014514.1678828-1-wangxuewen@kylinos.cn/

    For a single patch, a cover letter is optional. If the additional
notes are short, you can omit --cover-letter and put those notes
below the standalone "---" separator, after the commit trailers
and before the diffstat/diff. See this example:
https://lore.kernel.org/all/20261016030957.1053110-1-wangxuewen@kylinos.cn/

    The commit message should briefly describe the triggering condition,
root cause, and fix. Supplementary analysis, revision history,
reproducer instructions, and test details can go in the cover letter
or below "---", as described above.

    Check the actual patch before sending:
     ./scripts/checkpatch.pl --strict outgoing-v3/v3-0001-*.patch

    Review and address any applicable findings, then use git send-email
to send the generated files to the relevant maintainers, mailing
lists, and reviewers:
     git send-email --to='<maintainer-address>' \
         --cc='<mailing-list-address>' outgoing-v3/v3-*.patch

    Please send v3 as a separate patch email and keep replies to review
comments in the review discussion.

    Please address the three points in my previous review and resend v3
using this format. Keep the patch submission, supplementary notes,
and review replies clearly separated, using the appropriate places
described above.
    Mixing them together makes the patch harder to review and apply with 
the usual tools, even when the code itself is correct, and may require 
maintainers to extract the patch and clean up the commit message manually.

    Before submitting v3, I suggest taking some time to familiarize 
yourself with the patch submission workflow by reviewing the steps, 
format, and examples provided above.

Thanks,
Baolin.

在 2026/10/18 19:03, liubaolin 写道:
> 
> 
> 在 2026/10/18 01:15, Hang Nan 写道:
>> Hi Baolin,
>>
>> Thanks for the review.  Both points are addressed in v2 below.
>>
>> 1. ntfs_error() now gets icx->idx_ni->vol->sb instead of NULL.  I checked
>>     __ntfs_error(): it only calls ntfs_handle_error() and prints the
>>     "(device %s)" prefix when sb is non-NULL, so passing NULL was indeed
>>     skipping the errors= policy.  At this point icx is the index 
>> context the
>>     caller passed in and idx_ni is the index inode being modified, so 
>> the sb
>>     is always available.
>>
>> 2. The commit message is now 15 lines: the triggering condition, why the
>>     copy goes out of bounds, and how the capacity check stops it.  The 
>> code
>>     excerpts, the comparison with ntfs_ir_to_ib() and the full logs 
>> are gone;
>>     the analysis below carries them instead.
>>
>> Re-tested on v7.3-rc7 with the same crafted image and slub_debug=zf:
>>
>>    - before: [Right Redzone overwritten] ... @offset=20480, 8 bytes,
>>              "BUG kmalloc-4k: Object corrupt" on free_to_partial_list
>>    - after:  no redzone report, and the create fails early with
>>              ntfs: (device vda): ntfs_ib_copy_tail(): Entries (4040 B) 
>> exceed IB capacity
>>              creat -> -1, errno=5 (EIO)
>>
>> Note the "(device vda)" prefix, which is what your point 1 restores.
>>
>> For the record, the analysis that I removed from the commit message:
>>
>>    tail_size is computed from the source block alone:
>>
>>          ie_head  = ntfs_ie_get_next(median);
>>          ies_end  = (u8 *)ntfs_ie_get_end(&src->index);
>>          tail_size = ies_end - (u8 *)ie_head;
>>
>>    The destination is ntfs_ib_alloc(new_vcn, icx->block_size, ...), so 
>> its
>>    usable area is allocated_size - entries_offset.  ntfs_ie_get_end() 
>> returns
>>    index_entry_end, which for a block of ib_size bytes sits 16 bytes 
>> before
>>    the end of the block (that is the size of one INDEX_ENTRY_END).  A 
>> source
>>    block whose index_length == allocated_size therefore yields
>>
>>          tail_size    = (24 + 4072) - (24 + 16) - 16 = 4040
>>          dst capacity = 4096 - 24 - 40               = 4032
>>
>>    i.e. exactly 8 bytes too many, and the 8 bytes come from the 
>> image.  The
>>    sibling conversion path got this check in dc09bf79b76f ("ntfs: Fix
>>    index_root heap OOB write in ntfs_ir_to_ib()") in July; this copy 
>> site was
>>    missed.
>>
>> Full console logs of both runs, the mkntfs-based image-crafting script 
>> and
>> the initramfs that mounts the image and creates the file are available on
>> request.
>>
>> --- 8< ---
>> From: Hang Nan <2122295973@qq.com>
>> Subject: [PATCH v2] ntfs: check index block capacity in 
>> ntfs_ib_copy_tail()
>>
>> ntfs_ib_copy_tail() copies every index entry after the median entry 
>> into a
>> newly allocated index block:
>>
>>     ie_head = ntfs_ie_get_next(median);
>>     ies_end = (u8 *)ntfs_ie_get_end(&src->index);
>>     tail_size = ies_end - (u8 *)ie_head;
>>     memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
>>
>> tail_size comes from the source block's on-disk entries_offset and
>> index_length, while the destination has only allocated_size minus
>> entries_offset bytes of room.  A corrupt source block whose entries
>> extend into the bytes reserved for the last entry can therefore overflow
>> the destination by up to the size of that reserved entry (8 bytes for a
>> 4096-byte block), writing attacker-controlled data past the allocation.
>>
> Hi Hang,
>     Please correct the root-cause description here. The 8-byte overflow 
> in this reproducer comes from the different source and destination entry 
> offsets, not from space reserved for the last entry.
> 
>     The source uses entries_offset == 16, while ntfs_ib_alloc() sets the 
> destination's entries_offset to 40 to accommodate the index header, 
> update sequence array and alignment. After skipping the 16-byte median 
> entry, the source tail is 4040 bytes, but the destination has only 4032 
> bytes available.
> 
>     The commit message can simply state that a corrupt source block can 
> have a smaller entries_offset than the newly allocated destination, so 
> the remaining tail may exceed the destination's usable capacity.
> 
> Thanks,
> Baolin.
> 
>> Reject such a split before the copy and fail it with -EIO, which
>> ntfs_ib_split() already propagates after clearing the newly allocated 
>> VCN.
>>
>> Signed-off-by: Hang Nan <2122295973@qq.com>
>> ---
>>   fs/ntfs/index.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
>> index 580998990..2c345e32d 100644
>> --- a/fs/ntfs/index.c
>> +++ b/fs/ntfs/index.c
>> @@ -1200,6 +1200,7 @@ static int ntfs_ib_copy_tail(struct 
>> ntfs_index_context *icx, struct index_block
>>           struct index_entry *median, s64 new_vcn)
>>   {
>>       u8 *ies_end;
>> +    u32 ib_cap;
>>       struct index_entry *ie_head;        /* first entry after the 
>> median */
>>       int tail_size, ret;
>>       struct index_block *dst;
>> @@ -1215,6 +1216,17 @@ static int ntfs_ib_copy_tail(struct 
>> ntfs_index_context *icx, struct index_block
>>       ies_end = (u8 *)ntfs_ie_get_end(&src->index);
>>       tail_size = ies_end - (u8 *)ie_head;
>> +
>> +    /* Entries must fit in the allocated index block */
>> +    ib_cap = le32_to_cpu(dst->index.allocated_size) -
>> +            le32_to_cpu(dst->index.entries_offset);
>> +    if ((u32)tail_size > ib_cap) {
>> +        ntfs_error(icx->idx_ni->vol->sb,
>> +               "Entries (%d B) exceed IB capacity", tail_size);
>> +        kvfree(dst);
>> +        return -EIO;
>> +    }
>> +
>>       memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
>>       dst->index.index_length = cpu_to_le32(tail_size +
> 

