Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94573CF21D
	for <ntfs@lists.linux.dev>; Thu, 24 Sep 2026 02:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790215874; cv=none; b=O7sQ4XkTGa1D7pO9jcdu8f05sAWRtaA5PbX1poCRHelMJuNjHVCD0SBvd5GQlUOm0fxV4ofxvJwie+n3FBE+yaU4rffthj+uHfyM1NrhLTCds26XHt5ZenjPqXGcLdf6G9aLy1W/K4JVOcThSIp7zfZ/UWk7qObKRFJeSlBomds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790215874; c=relaxed/simple;
	bh=Lcya/Ph7NNNPdpppcypcCsE8VfW6DS4oIWcucMkFKeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLN6GiGEGC8uZL0WtnDqO69YijMH7qfAdK0y+m3LFylE/qUuA+B0EE0HgJfooKfY6aBksLvko5o1JG35xz8Pb99zVI6Kg+4BaMGlMzz72/xxQAeDKOPw5Fg9bOC5vQir56nrDWhngGnvsb2Lz0yKhtg9geUtoSOuc4DBaue0+jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AMGfkgfG; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AMGfkgfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=S4QSewLEnLIPGbNR6i/Iij/uoo8De3uC7phM0IJwuos=;
	b=AMGfkgfGzTcev4msj15i0RV2kb7rpFzqlpFed002+IMTX7UUOCGOy8P+kltHM4
	6y4RVBw4TcMkl0NZxoE1AJzxcTckDchwqa5UNIBKJrao/nRE5LRxf7gbssBeropw
	cARMgua6qHU8KyMRaIQhTJwx3SVZzGH5CInTpCS0FVS9s=
Received: from [IPV6:2409:8900:1eb0:45e:3c13:fdf5:6f81:b37a] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDHfr2lhrRqHsXJAQ--.908S2;
	Thu, 24 Sep 2026 10:10:47 +0800 (CST)
Message-ID: <8a52d6f6-0c16-4ae8-af98-c6eec9167e45@163.com>
Date: Thu, 24 Sep 2026 10:10:45 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] ntfs: fix MFT bitmap extension allocation
To: Xuewen Wang <wangxuewen@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHfr2lhrRqHsXJAQ--.908S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW5Xw13AFWDKw17uryfJFb_yoWkAFbEgF
	93t348A3srtFnYqa90yrs2yryrK3yDKF12kF1qvrs3Xa4DA3yktwsFyr15KF17CF4UCry5
	Arn0y3WfC34xXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREPl1tUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QeSXWq0hqel7AAA3X



在 2026/9/24 09:45, Xuewen Wang 写道:
> This series fixes four bugs in the MFT bitmap extension path:
> 
>    - The adjacent-cluster candidate can be outside the volume. Check it
>      before accessing $Bitmap and fall back to the regular allocator.
>    - The allocator can return an adjacent cluster that merges with the
>      existing run. Preserve that run when rolling back a failed extension.
>    - Rollback can wait for the initial $Bitmap scan while holding a folio
>      the scanner needs. Wait for the scan before starting the allocation.
>    - Direct allocation changes $Bitmap without updating the cached free
>      counts. Update both counts and honor per-page accounting and space
>      reserved for delayed allocation.
> 
> Xuewen Wang (4):
>    ntfs: bound the adjacent cluster in MFT bitmap extension
>    ntfs: fix rollback after MFT bitmap run coalescing
>    ntfs: wait for the bitmap scan before MFT bitmap extension
>    ntfs: account for direct MFT bitmap cluster allocation
> 
>   fs/ntfs/mft.c | 26 +++++++++++++++++++++++---
>   1 file changed, 23 insertions(+), 3 deletions(-)
> 

The series looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

