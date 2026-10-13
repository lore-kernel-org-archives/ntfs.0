Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B604915B4
	for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 06:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871985; cv=none; b=QB7HA1NhMijde0yxeS+kW7B0LQf7YDs2VTQLOGCnmyMmKJzioJbetM1v/kCsRIJTy8+wDemn355EcKHT+SwL5VKmUkyJCMOcsb3Uz+Q2bxLgukzDJgzuJs56obMGcFguMGqWorGzcKIxciw4bqM7A48slANwVndFQZO57VnK0UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871985; c=relaxed/simple;
	bh=x84xYtFaP4CYHPGLDI4UDT6NGunp6Xq7AkgqLR9qYT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPFL2lQkSXYJibVjB0I2AmUSmlyIsmKcSMZsmXIfmC0JGPuzNM/bXtMjbU86MWZ7H/XQDp/Bxzt0xwUEGc8960YJUUJGfRYFT/kwvMUwMLQ9Xtu+v9AymzJsrnbnlwtpHdaqoAxaZRtW17Z2DkD4AvN9MBvE6PagZHHUYEQjyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Y0sCjAUT; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Y0sCjAUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=eBNJaSUbyqhnLMvgAwJrFQ3d1DAxbAugMZIKTbxeLsI=;
	b=Y0sCjAUTitrq8Zus4F2SUqJeASrclhI6a0Ktt9Oxj61rWZ/3WrRGuGN1e4+8ly
	tjG/BEi8pfR+KN9Pb+vmwEeUmrW/1Oku0iibej6jTB6LgYBOJlrNO0ZYp5BZp2KS
	eNB8HUxCZRYM7gyvNiEr1VexD6WmGkVxuSz+F/WblmiNo=
Received: from [IPV6:2409:8900:1a87:d0a0:d2a7:6bc1:56f0:1aa7] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnd4nfy81qDIE2EQ--.6911S2;
	Tue, 13 Oct 2026 14:12:49 +0800 (CST)
Message-ID: <1839a493-51bb-4b65-a394-37a9f1a3e894@163.com>
Date: Tue, 13 Oct 2026 14:12:47 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ntfs: compare streams_interface with mounted volume on
 remount
To: DaeMyung Kang <charsyam@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261012031656.3858771-1-charsyam@gmail.com>
 <20261012112755.1353990-1-charsyam@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261012112755.1353990-1-charsyam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnd4nfy81qDIE2EQ--.6911S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy8Xw1Dury3GryUtrW7CFg_yoW8Zw1kpF
	WxGr1qkan7t3Wjk34kKF4aqFyFvFn7K3y29FWjqw17Aw4xtFy7W3WUK3W093y0kryFq348
	XFs0q393uFWUZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gE5BGrNy+Hn4wAA3f



在 2026/10/12 19:27, DaeMyung Kang 写道:
> During reconfiguration, fc->s_fs_info points to a newly allocated
> ntfs_volume. It does not contain the mounted volume's stream setting.
> Consequently, a windows mount rejects a remount with the same
> streams_interface=windows setting, but accepts streams_interface=none
> without changing the active pathname interface. This also breaks an
> ordinary read-only remount when the existing windows setting is passed
> again, for example from fstab.
> 
> Compare the requested setting with the mounted volume instead. Report
> an unsupported change with ntfs_warning() so it does not invoke the
> mounted filesystem's error-handling policy.
> 
> Fixes: 2de2cdd9cc08 ("ntfs: add pathname access for named streams")
> Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
> ---
> Changes in v2:
> - Use ntfs_warning() so a rejected option change does not invoke the
>    mounted volume's error policy, as Baolin suggested.
> - Explain in the commit message why logging must not invoke the mounted
>    filesystem's error policy.
> 
> Link to v1: https://lore.kernel.org/r/20261012031656.3858771-1-charsyam@gmail.com
> 
>   fs/ntfs/super.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 242fb19ced2b..ed9f29b16c7c 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -275,9 +275,9 @@ static int ntfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
>   			result.uint_32 == STREAMS_INTERFACE_WINDOWS;
>   
>   		if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
> -		    NVolStreamsWindows(vol) != streams_windows) {
> -			ntfs_error(vol->sb,
> -				   "Cannot change streams_interface on remount.");
> +		    NVolStreamsWindows(NTFS_SB(fc->root->d_sb)) != streams_windows) {
> +			ntfs_warning(fc->root->d_sb,
> +				     "Cannot change streams_interface on remount.");
>   			return -EINVAL;
>   		}
>   		if (streams_windows)


Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

