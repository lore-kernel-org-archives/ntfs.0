Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613458;
	b=HQs1QECCBXAJe+KmUH7dXuhDkNT49ZPGpFKWnZNjsPAgx/SbEaH/Uxnv3T9uPVN1WeQu
	 li2KJtO/mEXieNyVulmnZwadFV/k04lQkVi2P7678Q16ibbqnPgMnocFGHckuNZq9R6JK
	 +YvYXeJikXcYYuAFNQGrc0edxBofbp5duCkON2KDsgeZdRXhYBlY7kHALnyDq04HLvyA2
	 NfnHhFy9X94RNme+ldmtidy6xLZhAIcaIN9vV36/QgdUxuHdJdA9610RH2pB1xSSzUXIO
	 dBRMygvMW8lyWw0O3PICWi4B/mQVhRE97s7ys63hgvnUIM+jhQtEbPqcW88eXpg8HuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613458;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=tWAUTfGM5uc92GzPAIo9+TuR4wTdpB2C2J67CUUdXEU=;
	b=mewdXcrfaVUHeMltCJILY2Kgi5DR7eZdcadREaFzVft2VN8AMPSKNxBW/Hmo+nN1nL9e
	 N/+xhCfMTmvDi6h3UPesid7H+ate0SqSLlbCrZy5vk9193gUJ763QFebUescO5xNMwg06
	 M4GjvuffilJlF38bJNheWoLJ7rTnCCmn1xZbzJMlsvoTJ+Mpg1djXeLadgnQ1lAa8GgHZ
	 /fmfvvqQC/UdcFsNNocU4s+XIj2ylvxGueSdgmjgrt8rksfclAB07LcdUM2Qp8u0LqUk4
	 8UdFBVFQZENCCu6c9ECKWC0QZJWUvjvsF5TUNtbcdSAvuMVqs/dk8f+eWd0UODAQFVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Lze5UooJ;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34821606A33D
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 09:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34821606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Lze5UooJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=tWAUTfGM5uc92GzPAIo9+TuR4wTdpB2C2J67CUUdXEU=;
	b=Lze5UooJU4JmroVSaTQy4lQsXQK7f3/5s1f9YWBOmTvMpWVScNhkBPp6DWAYkQ
	ziuBr4/abUx0t1eULpZmjjtwk6H6MqD7lFp9Wo7O4f9YOTmI6aEINoiCzf5pro31
	tDkg23dJbq1RW6ETSPAyrj8NMyJ1bxJe4AnVtD9fMKSwE=
Received: from [IPV6:2409:8900:1ec1:a6a9:1d2f:794d:8e6a:2df0] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDHpiODXuhqjMlhEg--.59476S2;
	Mon, 02 Nov 2026 17:57:25 +0800 (CST)
Message-ID: <c712e2aa-c459-4808-b4f1-a9765ba6f01c@163.com>
Date: Mon, 2 Nov 2026 17:57:23 +0800
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: don't allow compression on volumes with clusters
 larger than 4K
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhanxusheng@xiaomi.com, stable@vger.kernel.org
References: <20261102093543.1199671-1-zhanxusheng1024@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261102093543.1199671-1-zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHpiODXuhqjMlhEg--.59476S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ury3Gw1kKFyrur4rCw1fXrb_yoW8XF13pF
	sakFy7Gw40qryUCFsFvanIgF4rWw4xGF4UCFWrtwn2qa98JrnagF95tws5Wr40qFWDAFs5
	XF4UKrZIvws093DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTCJQUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QWNWGroXoVS2wAA3p



在 2026/11/2 17:35, Zhan Xusheng 写道:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> On a volume made with "mkntfs -c 8192", a user can set
> FILE_ATTR_COMPRESSED on an empty file through system.ntfs_attrib.
> Writing to the file and reading it back after dropping the page cache
> then crashes:
> 
>    BUG: KASAN: slab-out-of-bounds in ntfs_read_compressed_block+0xa2c/0x2040
>    Read of size 8192 at addr ffff88804355a000 by task dd/106
> 
> The read path only handles clusters up to 4K. It copies each cluster
> out of a single page, and a compression block of 16 8K clusters does
> not fit in the 64K ntfs_compression_buffer. Loading an inode already
> rejects compressed data on such volumes.
> 
> Reject the flag change the same way.
> 
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>   fs/ntfs/ea.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index fa5c5c625751..68397b2a4e43 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -721,6 +721,11 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
>   		goto err_out;
>   	}
>   
> +	if ((new_aflags & ATTR_IS_COMPRESSED) && ni->vol->cluster_size > 4096) {
> +		err = -EOPNOTSUPP;
> +		goto err_out;
> +	}
> +
>   	if (!a->non_resident) {
>   		if (!(new_aflags & (ATTR_IS_SPARSE | ATTR_IS_COMPRESSED))) {
>   			err = 0;


Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

