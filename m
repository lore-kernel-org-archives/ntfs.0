Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901453B14B3
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532424; cv=none; b=U2VEXLBn/5oqrUFztFOBuvAEu0zSovkds64GJcSRusYfogzxFeru/SxEVwCDV/Zmkxp6WiMn2oZJe80U0lv523S18oCf+MvWgARVmQEsv2Y8jtwPAGvlqG98+lzRPRQAdLR9SH7Hp9ps/fdLhgBm8jxfitYZaVOgUrHchVhdhxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532424; c=relaxed/simple;
	bh=zj0eOVQcMFdCO2F/tmzy6sFvreF12/Rc+8pnjOdEJeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njx5jV4PFPM8JOYMNOh9QvO15ZV7W2434hCt+quEbByQ+cQ5WlZIZMga71bBo5QU9ObJuxGgNaFDQWOyUOlwiuUO6MFfqulV+quAJrAHiJ7cZP3DuZSk1fJPLG5cVUbbQNAQQrIR+91iDjC2iuGVTGAGARctm82ncwnSMvq6O4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZloloQp4; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZloloQp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=AmSS20uqjhIkD3uyKwXh/DjkeYw+SDtfXioNX2jb3yg=;
	b=ZloloQp4Giu/XlqkGSbBYTnacX6UzwoYtTPrs9iB8FYXhw7Zur9xm4rhrpNfzM
	gBkJfCXt1o7/oJQhHjykCa0ZIpgDWKY7h8NiEUeOQQHpKdi1oRCaacMI85v+AuJh
	GNi8tNEA047dHWa8yr+vnftLFsw2JNLzssQ7t2sBFF6V0=
Received: from [IPV6:2409:8949:6ca0:7910:556a:2884:1c35:3923] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3d5QyW7lqm0URBQ--.45497S2;
	Mon, 28 Sep 2026 02:06:44 +0800 (CST)
Message-ID: <80e893c7-5373-4690-ac66-7b5952d7e99d@163.com>
Date: Mon, 28 Sep 2026 02:06:42 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ntfs: restart the zone search when the allocation
 hint fails
To: Matthias Goergens <matthias.goergens@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1790503811.git.matthias.goergens@gmail.com>
 <79878c7323e37a500c540b3b140102b73d46bafe.1790503811.git.matthias.goergens@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <79878c7323e37a500c540b3b140102b73d46bafe.1790503811.git.matthias.goergens@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3d5QyW7lqm0URBQ--.45497S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCry5Wr1kJFWftrW5ury8Krg_yoW5tr4Dp3
	92kw4rtrn3Xwn7tF9xJanYq34Y9a18Jr1xCF18Xw1fArn8Arna9Fnxtrs5ZryxCaykWw1Y
	vr4j9Fy7uF1ava7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRTst2q5WzTGsQAA3F



在 2026/9/27 18:57, Matthias Goergens 写道:
> When ntfs_cluster_alloc() is given a start_lcn, it first tries the
> clusters from there on.  If that does not satisfy the request, it moves
> on to the zone's current position, but keeps the pass, the zone_end and
> the has_guess state it had.  That loses free clusters in two ways.  If
> the search had already moved on to pass 2, whose range ends at the hint,
> it scans only from the zone position to the hint and misses every free
> cluster between the start of the zone and the zone position.  If no
> cluster had been tested yet, has_guess is still set, so the cluster at
> the zone position is tried as if it had been the hint, and when that
> cluster is in use the rest of the bitmap buffer is skipped.
> 
> Both happen when the hint lies at or past the end of the volume, which
> ntfs_attr_map_cluster() produces when it extrapolates from the last
> allocated run across a hole.  The allocator then finds nothing, shrinks
> the MFT zone to nothing trying to satisfy the request, and fails with
> -ENOSPC.
> 
> To reproduce on a 128 MiB volume with 4 KiB clusters, extend two files
> in turn by one cluster at a time, alternating between fallocate(),
> write() past EOF and truncate() up, so that the runs of each file are
> separated by holes.  When the volume is full, truncate both files back
> to 1 MiB and start again.  During the second round a one-cluster
> fallocate() fails with ENOSPC while 40 MiB is free.
> 
> Start the zone over as if no hint had been given.
> 
> Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
>   fs/ntfs/lcnalloc.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
> index 0d6cd08ee2e76..30faf422a5424 100644
> --- a/fs/ntfs/lcnalloc.c
> +++ b/fs/ntfs/lcnalloc.c
> @@ -506,13 +506,25 @@ struct runlist_element *ntfs_cluster_alloc(struct ntfs_volume *vol, const s64 st
>   		}
>   
>   		if (!used_zone_pos) {
> +			/*
> +			 * Leaving @start_lcn for the zone position starts the
> +			 * zone over as if no hint had been given, even if the
> +			 * search had already reached pass 2, whose range ends
> +			 * at @start_lcn.
> +			 */
>   			used_zone_pos = 1;
> -			if (search_zone == 1)
> +			has_guess = 0;
> +			pass = 1;

Hi Matthias,
   Resetting pass, zone_end and has_guess here fixes the missed free 
clusters when falling back from the hint to the zone position.

   However, !used_zone_pos only means that the zone position has not 
been used yet; it does not mean that no clusters have been allocated.
   A partial hint allocation can also reach this block at the end of the 
bitmap buffer. Clearing has_guess then allows a nonadjacent run to be 
appended even when is_contig is true.

   Could we return the existing partial run before resetting the search 
state, like this?

   	if (!used_zone_pos) {
   		if (is_contig && rlpos)
   			goto out;

   		used_zone_pos = 1;
   		has_guess = 0;
   		pass = 1;
   		...
   	}

Thanks,
Baolin.

> +			if (search_zone == 1) {
>   				zone_start = vol->mft_zone_pos;
> -			else if (search_zone == 2)
> +				zone_end = vol->mft_zone_end;
> +			} else if (search_zone == 2) {
>   				zone_start = vol->data1_zone_pos;
> -			else
> +				zone_end = vol->nr_clusters;
> +			} else {
>   				zone_start = vol->data2_zone_pos;
> +				zone_end = vol->mft_zone_start;
> +			}
>   
>   			if (!zone_start || zone_start == vol->mft_zone_start ||
>   			    zone_start == vol->mft_zone_end)

