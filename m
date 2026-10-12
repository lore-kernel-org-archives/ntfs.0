Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03723218E91
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793548; cv=none; b=hz15pF2oo7Z/oECA9WfmbcwPVpg7Kt9x11htPw95WvgYfF2fIF//Vh0fNhc/9SDG50cwfchTkxQN4GH/FIiztHhPcgyzyYVhsg1vmZBxnEV2222S5W1+Iwtj1VCeyuazsGdvq3Y1l7v8E7cVkz/dbT4RGCr7K8eAfxJNP7A3wzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793548; c=relaxed/simple;
	bh=UXINLwBdF37ldXs2CknCbjFXnhSb2AUtJJs45Y0nHdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8rA+hq99odrSuSurMj3pOySrflslYqB49x+APl3SeMccaCpp7VMT8+t7+2zUxlc901tgJziHlI8uDj+BmtBEyCI/2LrE4rISiWZwiWyE8X3WHDQiRs/nTij/Miuvw/tZPqX4nWHN47Enf6bnAeKOxGiwlDmaZOV/OmzuD6Qq64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AHAeznou; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AHAeznou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=54lnOO5dQxgGDmmxxPwOcNs7cd6m1JGgl52IeJJFbMo=;
	b=AHAeznou8X9xnuzzbODSlI/j6vcDwZfD58rh+j3aV/YMSlUmZqlGReN9lxjC4E
	30yBdw92AJ2tw/DdJHogjTVAGdUTn3UykBomVGikJldfB1hPMZY8OQccQRlE6ktm
	rQFWOTbVHMlCfA7d1NdLk7Ng4OP05qRZZztxfE4beVk1M=
Received: from [IPV6:2409:8900:1a87:d0a0:cf38:5aca:d24d:b7a4] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBn6kx9mcxqX+SbEA--.52013S2;
	Mon, 12 Oct 2026 16:25:34 +0800 (CST)
Message-ID: <d19c802b-623b-4900-ba09-76302fc7b602@163.com>
Date: Mon, 12 Oct 2026 16:25:33 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: compare streams_interface with mounted volume on
 remount
To: DaeMyung Kang <charsyam@gmail.com>, linkinjeon@kernel.org
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261012031656.3858771-1-charsyam@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261012031656.3858771-1-charsyam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgBn6kx9mcxqX+SbEA--.52013S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWkZr45XFy8Gry5tF17GFg_yoW8ZFWkpr
	Z7GwnYyr97Ja4jk3WvyF4YqrySvF97Ca12kF12qw17Aw48tFyIq3WUK3W093y0k34SqrWj
	qF4jqrZ8Way5XFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UyVb9UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h5THmrMmX4dAQAA3k



在 2026/10/12 11:16, DaeMyung Kang 写道:
> During reconfiguration, fc->s_fs_info points to a newly allocated
> ntfs_volume. It does not contain the mounted volume's stream setting.
> Consequently, a windows mount rejects a remount with the same
> streams_interface=windows setting, but accepts streams_interface=none
> without changing the active pathname interface. This also breaks an
> ordinary read-only remount when the existing windows setting is passed
> again, for example from fstab.
> 
> Compare the requested setting with the mounted volume instead. Use its
> superblock when reporting an unsupported setting change.
> 
> Fixes: 2de2cdd9cc08 ("ntfs: add pathname access for named streams")
> Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
> ---
>   fs/ntfs/super.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 242fb19ced2b..711e90be9382 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -275,8 +275,8 @@ static int ntfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
>   			result.uint_32 == STREAMS_INTERFACE_WINDOWS;
>   
>   		if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
> -		    NVolStreamsWindows(vol) != streams_windows) {
> -			ntfs_error(vol->sb,
> +		    NVolStreamsWindows(NTFS_SB(fc->root->d_sb)) != streams_windows) {
> +			ntfs_error(fc->root->d_sb,
>   				   "Cannot change streams_interface on remount.");
>   			return -EINVAL;
>   		}

Hi DaeMyung,

    The fix looks correct.
    However, vol->sb is NULL in the newly allocated volume, so 
ntfs_error() only logs the message. Changing the argument to 
fc->root->d_sb also invokes the mounted volume’s error-handling policy, 
which would trigger a panic on a read-write mount with errors=panic.

    This branch only rejects an unsupported option change during 
remount; it does not indicate filesystem corruption or an I/O error.

    Could we use ntfs_warning(fc->root->d_sb, ...) without triggering 
that policy?

Thanks,
Baolin.

