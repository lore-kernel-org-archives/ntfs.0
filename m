Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A20939B4A1
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 22:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596685; cv=none; b=b5bMEA0zzZDArA4Ye0bN+ZE5nMjYc4fS9bO7Y9aLhWxWZo/87eKzt1RhpqWdjCa8h30octFOLHH0qnPtUoPEcEpriZ75SHWH5c+GDIdHoyyIDJIo9LIY4u8vFdQDHgMcN2+sY4BBYhrOJMjzE2BL8DnoF30/Syl9LhHpSXfhZtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596685; c=relaxed/simple;
	bh=Gun6681m69InaWdSjzCthBtp/4upxySBq8lJZmyqcbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4PJerZ/DgHEdgKT0Q5inelVmZZQFWNY1jzpWL61mUYIjFTetT8G7MaKKpta2WOa/RKoJqqQ7EJ+//teS1dY5UREgAmFBK1Rd5CNk6SfOlku9LQ8YmiiZ9jA90zHhX9I/Lj1cBjgVhzwotmrzFKwMy+GlPCqa2Sg9nEOu2jMdlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZUnE4pBM; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZUnE4pBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=5BNHzuTQE+nWswhIW+NtynzO9JmBpbkQWmnLAm+fNKQ=;
	b=ZUnE4pBM0Q6MqcEZRUtxCIHRIbd+EhJOZXk94G6SvZTbcdXwSlBf6RQFXl24u1
	ZpHI1vVNyO33KfTWF4fDEZhD0rElxj6ZlraKCTp5kNaZkeK/EKzlpl4vqItROsIk
	9hsKagyY2MeaLx6nUe7kp47KbUGwcGCtR46p+w96uwUJc=
Received: from [IPV6:2409:8900:21a7:a33a:b45d:31d1:c098:7d46] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDHjy71E6tq4ZZYBA--.34981S2;
	Thu, 17 Sep 2026 06:11:03 +0800 (CST)
Message-ID: <1e42c245-03f9-440d-ae0c-4d0796f7bff0@163.com>
Date: Thu, 17 Sep 2026 06:11:01 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: stop MFT writeback at allocated boundary
To: =?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>,
 ntfs@lists.linux.dev
Cc: linkinjeon@kernel.org, hyc.lee@gmail.com
References: <20260916131837.28568-1-marek@wesolowski.eu.org>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260916131837.28568-1-marek@wesolowski.eu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHjy71E6tq4ZZYBA--.34981S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFy3Ar4xGFyUGw47AFWDJwb_yoW8ZFy5pr
	ZxCwn7ta1DAr12gFnrK3W5Xa4ru3yfJFW5Ww12gw1I9rs0qwnrKas8Ka4rXF4fKFyrJ3Wx
	Xr1DW3y7XFWYva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR_MarUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwheHUmqrE-d0JAAA31



在 2026/9/16 21:18, Marek Wesołowski 写道:
> ntfs_write_mft_block() tests vcn in the loop condition before
> recalculating it for the current MFT record.
> 
> When a folio straddles the end of the allocated MFT, the stale vcn from the
> previous record admits one more iteration. The recalculated vcn can then
> equal end_vcn. Runlist lookup fails and the volume is marked erroneous.
> 
> This was reproduced on arm64 with 16 KiB pages, 4 KiB clusters and 1 KiB
> MFT records. With allocated_size 0x13000, writeback of folio index 0x4
> attempted to map VCN 0x13. Creating an empty file left the volume dirty and
> the next mount was read-only. A mount and unmount without the file creation
> remained clean.
> 
> Calculate vcn for the current record first and stop at the allocated
> boundary. The patched driver passed file creation and deletion, a 64 MiB
> fio write/read verification with crc32c, sync, unmount and read-write
> remount.
> 
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Signed-off-by: Marek Wesołowski <marek@wesolowski.eu.org>
> ---
>   fs/ntfs/mft.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 98ab686..5af0b6e 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -2681,12 +2681,14 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
>   	/* Clear the page uptodate flag whilst the mst fixups are applied. */
>   	folio_clear_uptodate(folio);
>   
> -	for (mft_ofs = 0; mft_ofs < PAGE_SIZE && vcn < end_vcn;
> +	for (mft_ofs = 0; mft_ofs < PAGE_SIZE;
>   	     mft_ofs += vol->mft_record_size) {
>   		/* Get the mft record number. */
>   		mft_no = (((s64)folio->index << PAGE_SHIFT) + mft_ofs) >>
>   			vol->mft_record_size_bits;
>   		vcn = ntfs_mft_no_to_cluster(vol, mft_no);
> +		if (vcn >= end_vcn)
> +			break;
>   		/* Check whether to write this mft record. */
>   		tni = NULL;
>   		if (ntfs_may_write_mft_record(vol, mft_no,

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

