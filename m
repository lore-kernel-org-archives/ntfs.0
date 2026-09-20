Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A437313D51E
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 02:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789870972; cv=none; b=tCh+LFPuzu6cohX1Ic/kjjl7Gz4ClibTWfTtOk5wqNxp9Gz6OnqNTc5wsjQyJxWZONWfB0D2BdvVqM9kItaooAkOpKkhSrqrdZNVSESM5dUcNYxOT4JH0hVGrkU3m3zUJK3BaLTLy0NAA4kpK37LLalnIRi6e+9ZX75+8bph/e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789870972; c=relaxed/simple;
	bh=JOK7FjkiYXohPxKuNBSDz+mzxNkPFvd9J60oJOyDBJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USyC9KnvVkaoTotKLpFMZI0yRU5mpZ8++9c2n7au1glsI4RLa6oAXqXNOt0ixPCk7xLk7x6/dCUcifh21FZCv7qsU+J74fh72y44YrFrV2f1OAJZZsVj4WbUROt1QSA3WyQU/f92F7/Ryj8twz+Wvzb0o/vdUNgDgygwvl2sKJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jEmaIZLF; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jEmaIZLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=sjJCJy6SZQd+O1oCl6cHN5Rw/06qP84qJhedDUIegcA=;
	b=jEmaIZLF4b8e+PLGTGSELerMKpbohYWECs96zwaR3FkBz6CQFcScTazELzoiSv
	udv62VBaCI7Pcmrtdq20fzK4svj1t5RV5GoZ0wsXj7eZEX1KgXiGVsBCreLz91DP
	q88EXCHhTRmkECquqA2vokTC8YXvB+UJBUKDyjHhpcz+4=
Received: from [IPV6:2409:8900:21a7:a33a:42f2:d8a4:b22b:be57] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDX_7VNQ69qurPKBg--.41784S2;
	Sun, 20 Sep 2026 10:22:07 +0800 (CST)
Message-ID: <403a1327-c784-42c6-88e6-24ff692f386e@163.com>
Date: Sun, 20 Sep 2026 10:22:04 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: integer wrap in ntfs load_attribute_list_mount() can cause buffer
 overflow
To: rtm@csail.mit.edu, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
References: <37528.1789849355@localhost>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <37528.1789849355@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX_7VNQ69qurPKBg--.41784S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZF45uryfGr43CrWDAry3twb_yoW8JF1fpF
	Z8Ka45tr43XF4jy3429F4rXa4Sqryv93W5t3WUG3yxXw45KwnxXrsrtanFq34v93Z7Xr1a
	qF15Wry3u3WDZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjFAXUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6g9qNWqvQ09dKgAA3E



在 2026/9/20 04:22, rtm@csail.mit.edu 写道:
> In this code in fs/ntfs/inode.c load_attribute_list_mount():
> 
>                  rl_byte_off = ntfs_cluster_to_bytes(vol, lcn);
>                  rl_byte_len = ntfs_cluster_to_bytes(vol, rl->length);
> 
>                  if (al + rl_byte_len > al_end)
>                          rl_byte_len = al_end - al;
> 
>                  err = ntfs_bdev_read(sb->s_bdev, al, rl_byte_off,
>                                     round_up(rl_byte_len, SECTOR_SIZE));
> 
> rl->length is read from the NTFS disk image. If it is large enough,
> then "al + ll_byte_len" will wrap around to a small value, and the
> "if" statement won't prevent ntfs_bdev_read() from reading more data
> than there is space in al.
> 
> Robert Morris
> rtm@mit.edu

Hi Robert,
   Thanks for reporting this. You're right: the pointer addition can 
wrap around and bypass the bounds check.

   I think we could fix this by comparing the run length against the 
remaining buffer space, like this:

   -		if (al + rl_byte_len > al_end)
   +		if (rl_byte_len > al_end - al)
    			rl_byte_len = al_end - al;

   Does this approach look reasonable to you?
   If so, would you be interested in submitting a patch? If you don't 
have time, I can arrange for an engineer on our team to submit it and 
credit you with a Reported-by tag.

   I look forward to hearing your thoughts and discussing this further.

Thanks,
Baolin.

