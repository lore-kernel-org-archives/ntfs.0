Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64FF46DFEE
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795050; cv=none; b=K3/Jio6b4jyUmxAHHNZa+IiYIDLM864CLrHD0VKF+0gxGt4ysOcw46+wT7ULNyUTU+L7doyvwsFrp8RX0D7NHUGnKDNStzdUn7w9c45IFjBBUrLqARxGzkI6SvoFPGN0DRqKNzKu2QiEFHCIN4C0AGyrepG5Y9jjnElgkcwMGQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795050; c=relaxed/simple;
	bh=IcJKK2Xbe+MifqNSgHnnBJtgk2lSgXJqJa+FoludifE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhraX+1qNp/5EBu3XKWJBh/Qs1bKW4OUOjb1qEis0SiYqTDN6Sk62j+V7LxsCsEznoU0aYCNh5AyPwyD2uu7QbfELZJoPdlq1bQkxJymnnYNZBboJ2JOCwPwAQ1lJ2yNGV2lhkqwm614hJEkHHRIKVgoV8d9Wy3xvOJwruz92js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W8pNyzph; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W8pNyzph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=7p2yZbclHLQHu2eW9vFtLMXS7m5g7KhDBCyX8hpJqg8=;
	b=W8pNyzphSXQU24CAa4ej22qYeCvxgAxiAV/qefTllhNCnEHwUB59zm8yyZCS6T
	hjr/z1WpXWXsap0YqnfjTaGl3LTcTskJ+Vw+ToCTLlvRbnXP4xFy7jub+HqEaKRo
	yi0UZ6ao3v5bwuhJWFxMRmwatjBDmWlEQ1u3tna4HjiJ8=
Received: from [IPV6:2409:8900:1a87:d0a0:cf38:5aca:d24d:b7a4] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wC3_7pdn8xquxyjEA--.31934S2;
	Mon, 12 Oct 2026 16:50:38 +0800 (CST)
Message-ID: <9659cb42-240a-4c46-9cc1-c0e73ef4b24f@163.com>
Date: Mon, 12 Oct 2026 16:50:37 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ntfs: enforce the encrypted-file policy on the read
 paths
To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3_7pdn8xquxyjEA--.31934S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4fWrW5GFy5KrWrKw45KFg_yoW8Gw17pF
	9xKa4Yqw1vyr9F93Z2vF1aqr1rurWrJay5XFZYyw1fCws5JFyrGry0v3W0ga48CF4rKw45
	ur45tasIvr4DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UgyCAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6R7Ml2rMn17OggAA3H



在 2026/10/12 14:20, Zhan Xusheng 写道:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> EFS-encrypted attributes are refused with -EOPNOTSUPP in exactly one
> place, ntfs_read_folio(), because decryption is not implemented.  Two
> read paths get there without passing that test and return the raw
> on-disk ciphertext instead, so the same read returns either ciphertext
> or -EOPNOTSUPP depending on which path serves it.
> 
> Patch 1 is readahead, which marks the folios uptodate so ->read_folio
> is never called.  read(), mmap(), splice() and fadvise() all populate
> the page cache this way, so one test closes all four.
> 
> Patch 2 is direct I/O, which bypasses the page cache entirely and has
> no such backstop.
> 
> Both commits are in v7.1.  I have not added Cc: stable; returning
> ciphertext rather than an error is a correctness bug but not a
> privilege boundary crossing, so that call is better made by the
> maintainers.
> 
> Found by reading the code.  I have no EFS-encrypted NTFS volume, so
> there is no reproducer; the paths were traced in the source.
> 
> Zhan Xusheng (2):
>    ntfs: do not read ahead encrypted files
>    ntfs: reject direct I/O reads of encrypted files
> 
>   fs/ntfs/aops.c | 7 ++++---
>   fs/ntfs/file.c | 4 ++--
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> 
> base-commit: d6d3455d8751854e0d1820f14184682e23ac4475

The series looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

