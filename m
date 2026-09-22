Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396CB346E75
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 01:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790038846; cv=none; b=s4rHUob+Fzf550rYhFHWZtHpv7NXtaGUGYZv6KXK7UiTdw/3l2b9Y42m716eXNEi18xp7SVioECA5B2t9u9huZlD7qXHID+W5KvOIua4WxmhImPuuTu5HCGtA3kOanA94nzJfIF091iFsMdx8fTYN2eeV7fcXoQKJ/MDkUQpDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790038846; c=relaxed/simple;
	bh=fCVNBx4nJiAARBReAkNwWFBzalb6+NYNoSIYWskr7C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T20ref9DbfTYhxTQW7bgnzmAix2XS5CD2Ub1TY41mQGrDko9QAk/HsKlVHccxCNQbAbeZwr26cE/XyvGAnXm125cx4oEz8lSONNq4nz+375Ro+wA28uy4/40ho5TbyEeIgNTnO3Qs0pdRzJYPov40TytrEpiBSosO9xz0H7cW5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=B5hIJoWa; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="B5hIJoWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=5n6tyeplNQXGSUCEierPaOMM1lcAxaLdV3eI60wZkb0=;
	b=B5hIJoWaFiqniKYgLFYNzMd1ZDp6+Wfo6W9QZlTL8ArdajlrkpqTk++tTjRVtA
	GmzqP93uDK40WeqkL8fBFbaB6OE7tvdqWPV66TkRcQrggvwwTGemotDXHO8XA2/p
	ivthpEexNefwmS1d54Fk06qQ0hANz235RoSG15qkG7L+s=
Received: from [IPV6:2409:8900:1ee3:222c:420f:a5a2:eb51:8645] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3_6Is07FqzTECAA--.2665S2;
	Tue, 22 Sep 2026 09:00:30 +0800 (CST)
Message-ID: <f2cdaf0f-82e5-445c-9479-1e3113f8f3d7@163.com>
Date: Tue, 22 Sep 2026 09:00:28 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: stop MFT writeback at allocated boundary
To: Namjae Jeon <linkinjeon@kernel.org>,
 =?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>
Cc: ntfs@lists.linux.dev, hyc.lee@gmail.com
References: <20260916131837.28568-1-marek@wesolowski.eu.org>
 <CAKYAXd9SQ_6fLm1v8nxj3WrnBT60S4Fy8_oZrN+Oi+0rOw2aEA@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd9SQ_6fLm1v8nxj3WrnBT60S4Fy8_oZrN+Oi+0rOw2aEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_6Is07FqzTECAA--.2665S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1kJF18WF47WrWDKw17KFg_yoW8tF4rpr
	Z7tw4rtFsrJryxtrnFga17WFy5A3yrCF9rGr17Wr1I9rn3W3WIgayFgFZ8XrZ8Gr1Fqw4I
	vayUArWxJa45Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjYLPUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Q8H0Wqx0y99aAAA3C



在 2026/9/21 22:22, Namjae Jeon 写道:
> On Wed, Sep 16, 2026 at 10:18 PM Marek Wesołowski
> <marek@wesolowski.eu.org> wrote:
>>
>> ntfs_write_mft_block() tests vcn in the loop condition before
>> recalculating it for the current MFT record.
>>
>> When a folio straddles the end of the allocated MFT, the stale vcn from the
>> previous record admits one more iteration. The recalculated vcn can then
>> equal end_vcn. Runlist lookup fails and the volume is marked erroneous.
>>
>> This was reproduced on arm64 with 16 KiB pages, 4 KiB clusters and 1 KiB
>> MFT records. With allocated_size 0x13000, writeback of folio index 0x4
>> attempted to map VCN 0x13. Creating an empty file left the volume dirty and
>> the next mount was read-only. A mount and unmount without the file creation
>> remained clean.
>>
>> Calculate vcn for the current record first and stop at the allocated
>> boundary. The patched driver passed file creation and deletion, a 64 MiB
>> fio write/read verification with crc32c, sync, unmount and read-write
>> remount.
>>
>> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
>> Signed-off-by: Marek Wesołowski <marek@wesolowski.eu.org>
> I can not apply this patch to the latest #ntfs-next branch. Could you
> please check if this patch is no longer necessary in #ntfs-next
> branch?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
> 
> Thanks.

Hi Namjae, Marek,

   Sorry, when reviewing this patch earlier, I did not check whether the 
issue had already been addressed in the latest ntfs-next.

   I have now checked, and e543dc6c5f1e ("ntfs: write MFT folios through 
mapped I/O units") eliminates the problematic loop.

   That commit checks the current record's byte offset against 
min(i_size, allocated_size) before selecting it for writeback. The I/O 
preparation loop also stops at that limit before mapping the next unit. 
For the reported allocation boundary of 0x13000, this prevents the 
lookup of VCN 0x13 that caused the error.

   I therefore think this patch should no longer be needed on the 
current ntfs-next.
   Marek, could you please double-check this?

   I'll make sure to check the latest ntfs-next when reviewing patches 
in the future.

Thanks,
Baolin.

