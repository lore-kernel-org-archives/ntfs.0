Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178455;
	b=LIk1EE2Xa8SzHz+wcZ7W1ALt9r0LDP/HLVeJQhKwQ37+g8AN+8mpt2MRxMAz2HI85are
	 1Gj/dWnWWeVPo4X6v/xkgt4IG+LMEmwIf3rjXPLIqi6OaHOeVWRfznWM08hxP1SHJZblA
	 3RI/pDFfmKfyXGqAYeefz3obfuhqgOFUbclsTFTXHXr2frklcsDX1X8h2O6I2Tap0g3bw
	 fEJQnMOIB/P5Rf5ObgFsIRZ/BnsTrfmffYgTKfmVfBNoplzgV+HPVgCk0GWn6nP5bMJwo
	 Usfj8FD6sRTwZsuaAypJWv6cTVhKF/0OLJcM8lvZ+Quq2tocUK51Y9OQHWA6t/18Xwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178455;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=2qQ46IorhYgFqb2XCz+AJXdurlFzZ0nlRwFAHZa1l90=;
	b=NnBVLh5AyeXuUruNaFVlfdca8JNhhVLj4bJdY2RGB7Us6rJ5PPCjwANfbRwh/riojP80
	 Jeb6z8GSRGSH0W8qibsEKlcJKub2QGeJY3dlaPcfImBB/5D8Usi0jfBWWIQhDcFu2cQ2i
	 xqfxEfeMqub/uIvEj9B43yyvJogLKyKb79k/Wd6qSgU403O7FgbDhU2zGYKQb5IxzKlXe
	 7UDPi9HTvJYK0y8ujs2SLa/ybj50WZktQQ1rTDp131gYnaDJ0AYoNEkpASkp56BHVLXUg
	 6NIbNOXpfDRP7QWUvKBYtTu7oDEmX7mKyECoZvQ0hKMn3srHsDPFyGDDbH31L0WIH1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=a+AUJ1Sh;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640B5606A31A
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 09:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 640B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=a+AUJ1Sh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=2qQ46IorhYgFqb2XCz+AJXdurlFzZ0nlRwFAHZa1l90=;
	b=a+AUJ1ShssgU/WLU0kX8uQPiCNM4j/0msSs5dmHct3XREz62oRBMvj0oNmZ/XF
	4dsMQLr/YrWJb3WMh+84Km+/A915ER3hzfekSZlWw01A1hw8raAXEuTBSYhS3MTq
	jqEcyREdyRFukYPuR4IC8X5a4/nFJt5T84ZKLKNsjJ74A=
Received: from [IPV6:2409:8900:1a83:1c7d:c982:2c1e:474c:2013] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDX_wNIu+FqE25kDg--.13907S2;
	Wed, 28 Oct 2026 17:07:22 +0800 (CST)
Message-ID: <632c6eee-5905-476e-adab-8dd508b52690@163.com>
Date: Wed, 28 Oct 2026 17:07:20 +0800
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
Subject: Re: [PATCH 1/3] ntfs: reject negative attribute read positions
To: Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, Robert Morris <rtm@mit.edu>
References: <20261028084248.2149976-1-hyc.lee@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261028084248.2149976-1-hyc.lee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX_wNIu+FqE25kDg--.13907S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWrWkKF43Jr1DAr48XFykGrg_yoW7Gr15pF
	nFyFyfKa17Jryavrs3KFyqvF1S9w40gr4DKrWUKw1Syas3tr10kF18tryS9r1IvrZ5C34U
	XF1jgFWUWw4UZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U8PEDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6goU3mrhu0o+8QAA3f



在 2026/10/28 16:42, Hyunchul Lee 写道:
> A corrupt index entry can produce a VCN whose byte offset overflows.
> Reject negative positions before they reach pointer arithmetic in
> ntfs_inode_attr_pread().
> 
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Reported-by: Robert Morris <rtm@mit.edu>
> Link: https://lore.kernel.org/ntfs/10091.1793100344@localhost/
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> ---
>   fs/ntfs/index.c | 39 ++++++++++++++++++++++++++++++++++++++-
>   fs/ntfs/index.h |  1 +
>   fs/ntfs/inode.c |  4 +++-
>   3 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
> index 66411a712b14..e6ba1a08741b 100644
> --- a/fs/ntfs/index.c
> +++ b/fs/ntfs/index.c
> @@ -14,6 +14,8 @@
>    * Copyright (c) 2007-2021 Jean-Pierre Andre
>    */
>   
> +#include <linux/overflow.h>
> +
>   #include "collate.h"
>   #include "index.h"
>   #include "ntfs.h"
> @@ -255,6 +257,32 @@ static s64 ntfs_ie_get_vcn(struct index_entry *ie)
>   	return le64_to_cpup(ntfs_ie_get_vcn_addr(ie));
>   }
>   
> +static int ntfs_index_entry_vcn_inconsistent(const struct ntfs_volume *vol,
> +					     struct index_entry *ie,
> +					     u8 vcn_size_bits, u64 inum)
> +{
> +	s64 vcn, pos;
> +
> +	if (le16_to_cpu(ie->length) <
> +	    sizeof(struct index_entry_header) + sizeof(s64)) {
> +		ntfs_error(vol->sb,
> +			   "Index entry with node flag has no VCN in inode %llu.",
> +			   (unsigned long long)inum);
> +		return -EIO;
> +	}
> +
> +	vcn = ntfs_ie_get_vcn(ie);
> +	if (vcn < 0 ||
> +	    check_shl_overflow(vcn, vcn_size_bits, &pos)) {
> +		ntfs_error(vol->sb,
> +			   "Invalid index entry VCN %lld in inode %llu.",
> +			   vcn, (unsigned long long)inum);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>   static struct index_entry *ntfs_ie_get_first(struct index_header *ih)
>   {
>   	return (struct index_entry *)((u8 *)ih + le32_to_cpu(ih->entries_offset));
> @@ -326,10 +354,13 @@ static int ntfs_index_header_inconsistent(struct ntfs_volume *vol,
>   
>   int ntfs_index_entries_inconsistent(const struct ntfs_volume *vol,
>   				    const struct index_header *ih,
> +				    u32 block_size,
>   				    __le32 collation_rule, u64 inum)
>   {
>   	struct index_entry *ie;
>   	u8 *index_end = (u8 *)ih + le32_to_cpu(ih->index_length);
> +	u8 vcn_size_bits = vol->cluster_size <= block_size ?
> +			vol->cluster_size_bits : NTFS_BLOCK_SIZE_BITS;
>   
>   	for (ie = ntfs_ie_get_first((struct index_header *)ih);
>   	      ; ie = ntfs_ie_get_next(ie)) {
> @@ -348,6 +379,11 @@ int ntfs_index_entries_inconsistent(const struct ntfs_volume *vol,
>   			return -EIO;
>   		}
>   
> +		if ((ie->flags & INDEX_ENTRY_NODE) &&
> +		    ntfs_index_entry_vcn_inconsistent(vol, ie,
> +						      vcn_size_bits, inum))
> +			return -EIO;
> +
>   		if (ntfs_ie_end(ie))
>   			break;
>   
> @@ -566,7 +602,8 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
>   		return -EIO;
>   	}
>   
> -	if (ntfs_index_entries_inconsistent(vol, &ib->index, cr, inum))
> +	if (ntfs_index_entries_inconsistent(vol, &ib->index, block_size,
> +					    cr, inum))
>   		return -EIO;
>   	return 0;
>   }
> diff --git a/fs/ntfs/index.h b/fs/ntfs/index.h
> index a898e348f2c9..bc2f1bbdfba4 100644
> --- a/fs/ntfs/index.h
> +++ b/fs/ntfs/index.h
> @@ -98,6 +98,7 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vol,
>   				  __le32 cr, u64 inum);
>   int ntfs_index_entries_inconsistent(const struct ntfs_volume *vol,
>   				    const struct index_header *ih,
> +				    u32 block_size,
>   				    __le32 collation_rule, u64 inum);
>   struct ntfs_index_context *ntfs_index_ctx_get(struct ntfs_inode *ni, __le16 *name,
>   		u32 name_len);
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 206db4e99ef1..b8a1af8c4cea 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -1034,6 +1034,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
>   				le16_to_cpu(a->data.resident.value_offset));
>   		if (ntfs_index_root_inconsistent(ni->vol, a, ir, ni->mft_no) ||
>   		    ntfs_index_entries_inconsistent(ni->vol, &ir->index,
> +						    le32_to_cpu(ir->index_block_size),
>   						    ir->collation_rule, ni->mft_no)) {
>   			ntfs_error(vi->i_sb, "Directory index is corrupt.");
>   			goto unm_err_out;
> @@ -1684,6 +1685,7 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
>   	ir = (struct index_root *)((u8 *)a + le16_to_cpu(a->data.resident.value_offset));
>   	if (ntfs_index_root_inconsistent(vol, a, ir, ni->mft_no) ||
>   	    ntfs_index_entries_inconsistent(vol, &ir->index,
> +					    le32_to_cpu(ir->index_block_size),
>   					    ir->collation_rule, ni->mft_no)) {
>   		ntfs_error(vi->i_sb, "Index is corrupt.");
>   		goto unm_err_out;
> @@ -3715,7 +3717,7 @@ s64 ntfs_inode_attr_pread(struct inode *vi, s64 pos, s64 count, u8 *buf)
>   		}
>   	}
>   	isize = i_size_read(vi);
> -	if (pos > isize) {
> +	if (pos < 0 || pos > isize) {
>   		mutex_unlock(&mrec_ni->mrec_lock);
>   		return -EINVAL;
>   	}

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

