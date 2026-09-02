Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1C334E74B
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 07:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333933; cv=none; b=JiJVf/s7jZRhMfNBRjFWXdzSJk4H/ix3C7w4T48TBUg5Zl1NKHCU33u0IUK06nk4dxNI9Kr5rz9lB+M94OZGU+FRhT+XIX/XE1MnHb1CZ0he0+KfhLjrTsbqfNWX/9gkKmd+ciYiiZ29s1i3FWdj5tcVEsewHh2rZRAVSvFgVAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333933; c=relaxed/simple;
	bh=1kyjJzJsqCNQLjbE3g7LS91/5bkXy5o0ON/3ocZUiCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJOQlnHdcYz6DB80AsLpH/5gxunf6MABeA3fiWxqUgqlAOsj0xKsjAlP8pEpGbDY7ux5OSOsbrEyta00YQzbbCX2QGJaiAm8hkOmn0II0SMdhUiJ71tRVO7pCvkpHmZm7ES7fF1mr/rkNzK9lqBK0ddnD2PrI0w5TL0VuelXe84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DPcbOCsp; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DPcbOCsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=0UfuVQ2WNzTY+vKZ2LkipVxTd6VYZ1BWKXSjviu1fl4=;
	b=DPcbOCspxTArS7UGbEr2I9SY90qOyyQxh/O6tungu9faWKzVVriS5Ad51qlS8P
	pYg+cy3m1L0JEAoAWX0ZjNNjTKB33eWQSI+vwquzgdXssh+Ffl5aFe2fzbaFcFOr
	mDUdp54U+tqMPHUbP773/j99XkMMlz72WXGNQVWeTJt8E=
Received: from [IPV6:2409:8900:1ef4:8f82:6ff7:7c40:6535:9660] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3t+dWz5dqzCI3AA--.209S2;
	Wed, 02 Sep 2026 15:25:17 +0800 (CST)
Message-ID: <2736dac8-8939-46db-99fb-08723fe1cf1a@163.com>
Date: Wed, 2 Sep 2026 15:25:10 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ntfs: implement fileattr_get and fileattr_set
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
References: <20260901091519.2885376-1-liubaolin12138@163.com>
 <20260901091519.2885376-2-liubaolin12138@163.com>
 <CANFS6bbVu2mrQXtKJfokDA=6ajReH9Xmm9OA1zVDzQhafHy0mA@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CANFS6bbVu2mrQXtKJfokDA=6ajReH9Xmm9OA1zVDzQhafHy0mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3t+dWz5dqzCI3AA--.209S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyrZrWrKr18ur1rur1UAwb_yoW8Ww1kpF
	Z5t3WxKayxJFyUCFyxZr4UWa1Ivr17JrWUArW7Ga4YyF9Ikr18K34SgF45CFyrCr4kCr12
	9FyUtrsxKFnayrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR-18dUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwh2LVmqXz11XWQAA3j



在 2026/9/2 10:00, Hyunchul Lee 写道:
> Hi Baolin,
> 
>> +/*
>> + * ntfs_fileattr_get - inode_operations::fileattr_get
>> + * @dentry:    dentry to report the flags of
>> + * @fa:                filled in with the flags of @dentry
>> + */
>> +int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
>> +{
>> +       struct inode *vi = d_inode(dentry);
>> +       struct ntfs_inode *ni = NTFS_I(vi);
>> +       u32 flags = 0;
>> +
>> +       if (NInoCompressed(ni) || NInoWofCompressed(ni))
>> +               flags |= FS_COMPR_FL;
>> +       if (NInoEncrypted(ni))
>> +               flags |= FS_ENCRYPT_FL;
>> +       if (vi->i_flags & S_IMMUTABLE)
>> +               flags |= FS_IMMUTABLE_FL;
>> +       if (vi->i_flags & S_APPEND)
>> +               flags |= FS_APPEND_FL;
> 
> It would be better to set FS_CASEFOLD_FL as well.
> 
>> +int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
>> +                     struct file_kattr *fa)
>> +{
>> +       struct inode *vi = d_inode(dentry);
>> +       unsigned int new_fl = 0;
>> +
>> +       if (fileattr_has_fsx(fa))
>> +               return -EOPNOTSUPP;
>> +       if (fa->flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL))
>> +               return -EOPNOTSUPP;
> 
>> +
>> +       if (fa->flags & FS_IMMUTABLE_FL)
>> +               new_fl |= S_IMMUTABLE;
>> +       if (fa->flags & FS_APPEND_FL)
>> +               new_fl |= S_APPEND;
>> +
>> +       inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND);
>> +
>> +       inode_set_ctime_current(vi);
>> +       mark_inode_dirty(vi);
>> +       return 0;
>> +}
> 
> Currently, these flags are not written to disk.
> I think that we should store them to disk or
> reject them.
> 

Hi Hyunchul,

   I will add FS_CASEFOLD_FL.

   You are right about persistence. Namjae also pointed out that inode
   reclaim can drop these flags before an unmount. I will look into storing
   them on disk.

   Thanks for the review.

Thanks,
Baolin

