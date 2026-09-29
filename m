Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D38D33689F
	for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 00:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790641638; cv=none; b=ui8OI0CQr/5pUKcENrzeom8F4vFh2lhuZ4imzARH7NrCafAwwQE6PyiDjb/4nU7g9i5Zp5p3GIOHg6W789CSQS402vqrmUXlDiAIR9NKyyOc89meKgrqt+/hol0nXb05pc5bkW89ImuepDAc9FdIBaEHvPJJbXqOa2xU2VmNZsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790641638; c=relaxed/simple;
	bh=3uul90OrN24mufCznKvqvmn4VlshvnvWa//1jnbGPMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GsfcA/LdjzYCd33LIylgF5NkCzwbYlyiKtYtQbZXNRZxCXz2KadqNzytSvjoShAqnknU+2mc0fxx+oOuaTUYXess+5c0arDoJd991xd/pgYFSy1ONHqSfqnem6OREWedNppyqH0bfLk4f1ana05ybI3ktHvN6pPR6+E++2ZwxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Wh2IAFsp; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Wh2IAFsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=sz9FVmtEXV7DY+vSbP04nZCxGIcDuYTbEzEn+oX93eQ=;
	b=Wh2IAFsppwsj74Yg8G4K8zcm72681fLPIHCQivXSYXzdAK82jJBNpjIdnMjmR7
	OlItRptWNBAWPKWTS7a6bu7Ra5Ndd9mpiYc0KzT3GdbFStVwITXQHhzzaDcuB8/k
	Sp3g281UmSROTBTk2QieMQIW7gPo6EKr3wzwM3+LrzoPc=
Received: from [IPV6:2409:8949:6ca0:7910:58ab:b82f:e3cc:2f41] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3PxPGBbtq5j7bBQ--.31818S2;
	Tue, 29 Sep 2026 08:26:48 +0800 (CST)
Message-ID: <d1d14d76-5829-471a-ae1c-e3df1f885a9c@163.com>
Date: Tue, 29 Sep 2026 08:26:46 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] ntfs: reject non-resident attributes whose sizes
 exceed their allocation
To: Matthias Goergens <matthias.goergens@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <arMoap0ZgeORuktT@hyunchul-PC02>
 <cover.1790417653.git.matthias.goergens@gmail.com>
 <20260927050831.2739166-6-matthias.goergens@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260927050831.2739166-6-matthias.goergens@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3PxPGBbtq5j7bBQ--.31818S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFW8ZrWxAryxtrWkCw45KFg_yoW3Zw47pF
	ZrCr93tw13Z34fCwsrtw45W343Ww1rXryUGrZ8tFyxZrZ3Arn3XFy8trWrurW0krn5J3Wq
	yFyDuw4xuryDZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2hFsUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQj8x2q7BchyMAAA3s



在 2026/9/27 13:08, Matthias Goergens 写道:
> ntfs_read_locked_inode(), ntfs_read_locked_attr_inode() and
> ntfs_read_locked_index_inode() take a non-resident attribute's data_size
> and initialized_size from disk without checking them against its
> allocated_size.  The runlist ends at allocated_size and the read path
> maps what lies beyond it as a hole, so a data_size larger than the
> allocation makes reads return zeros that are not on disk, with no error.
> 
> On a crafted volume with 4 KiB clusters where a 6144000-byte file claims
> a data_size and initialized_size 64 KiB beyond its allocation, reading
> the file returns 16 clusters of such zeros.  A sparse file behaves the
> same.  A compressed file instead fails with -EIO after a burst of "Still
> have pages left!" errors from ntfs_read_compressed_block().
> 
> Require 0 <= initialized_size <= data_size <= allocated_size, with
> allocated_size a multiple of the cluster size, when the inode is read,
> as fs/ntfs3 does in mi_enum_attr(), and fail with -EIO otherwise, which
> marks the inode bad and the volume as having errors.  initialized_size
> above data_size is rejected too because an extending write zeroes the
> gap it opens only from initialized_size onwards.  An unaligned
> allocated_size ends inside a cluster that the read path treats as past
> the end: a crafted 66440-byte file with 4 KiB clusters reads its last
> 904 bytes as zeros.
> 
> Sparse and compressed attributes need no exception.  Every non-resident
> attribute has a cluster-aligned allocated_size >= data_size, holes
> included, on eight public test volumes (seven written by Windows, with
> LZNT1-compressed files, a sparse $UsnJrnl:$J and a OneDrive placeholder
> whose unnamed $DATA is one hole, and one by mkntfs), on a volume written
> by ntfs-3g and on one written by this driver, and the patched driver
> reads every file on them as before.  fs/ntfs3 has enforced the same
> checks since v6.6, also without exceptions.  The layout.h comment saying
> that data_size can exceed allocated_size for compressed and sparse
> attributes is corrected.
> 
> This also covers a non-resident attribute list, which
> load_attribute_list() reads through ntfs_attr_iget(), and $MFT, whose
> inode goes through ntfs_read_locked_inode() after the previous patch's
> check.  The check was already missing in the classic driver; the Fixes
> tag names the commit that brought that code back.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
>   fs/ntfs/inode.c  | 38 ++++++++++++++++++++++++++++++++++++++
>   fs/ntfs/layout.h | 13 ++++++++-----
>   2 files changed, 46 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 9c97fc3f9e5ff..126c50b5a349e 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -651,6 +651,38 @@ void ntfs_set_vfs_operations(struct inode *inode, mode_t mode, dev_t dev)
>   	}
>   }
>   
> +/*
> + * The clusters of a non-resident attribute end at its allocated size.  Past
> + * that there is nothing on disk to read, and past the initialized size reads
> + * return zeros and writes zero the gap they open, so the sizes must satisfy
> + * 0 <= initialized_size <= data_size <= allocated_size, with allocated_size
> + * a multiple of the cluster size.
> + *
> + * Sparse and compressed attributes get no exception.  Windows, ntfs-3g and
> + * this driver all count holes in allocated_size (the clusters actually in use
> + * are in compressed_size), including for streams that are entirely a hole,
> + * and fs/ntfs3 has applied the same check to every non-resident attribute in
> + * mi_enum_attr() since v6.6.
> + */
> +static bool ntfs_non_resident_sizes_inconsistent(struct inode *vi,
> +						 const struct attr_record *a)
> +{
> +	s64 allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
> +	s64 data_size = le64_to_cpu(a->data.non_resident.data_size);
> +	s64 initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
> +
> +	if (initialized_size >= 0 && initialized_size <= data_size &&
> +	    data_size <= allocated_size &&
> +	    !ntfs_bytes_to_cluster_off(NTFS_I(vi)->vol, allocated_size))
> +		return false;
> +
> +	ntfs_error(vi->i_sb,
> +		   "Attribute 0x%x of inode 0x%llx is corrupt (initialized size %lld, data size %lld, allocated size %lld).",
> +		   le32_to_cpu(a->type), NTFS_I(vi)->mft_no, initialized_size,
> +		   data_size, allocated_size);
> +	return true;
> +}
> +
>   /*
>    * ntfs_read_locked_inode - read an inode from its device
>    * @vi:		inode to read
> @@ -1184,6 +1216,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
>   					"First extent of $DATA attribute has non zero lowest_vcn.");
>   				goto unm_err_out;
>   			}
> +			if (ntfs_non_resident_sizes_inconsistent(vi, a))
> +				goto unm_err_out;
>   			vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
>   			ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
>   			ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
> @@ -1446,6 +1480,8 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
>   			ntfs_error(vi->i_sb, "First extent of attribute has non-zero lowest_vcn.");
>   			goto unm_err_out;
>   		}
> +		if (ntfs_non_resident_sizes_inconsistent(vi, a))
> +			goto unm_err_out;

Hi Matthias,
    This covers attribute lists loaded through ntfs_attr_iget(), but 
$MFT's own non-resident $ATTRIBUTE_LIST uses load_attribute_list_mount() 
directly during ntfs_read_inode_mount(). The subsequent 
ntfs_read_locked_inode() call skips reloading that list for FILE_MFT, so 
it does not pick up this check either.
    load_attribute_list_mount() validates initialized_size against the 
list size, but does not check data_size against allocated_size or 
require allocated_size to be cluster-aligned.

   Could you also call ntfs_non_resident_sizes_inconsistent() in the 
non-resident attribute-list branch of ntfs_read_inode_mount(), before 
ntfs_mapping_pairs_decompress(), to cover this bootstrap path?

Thanks,
Baolin.


>   		vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
>   		ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
>   		ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
> @@ -1675,6 +1711,8 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
>   			"First extent of $INDEX_ALLOCATION attribute has non zero lowest_vcn.");
>   		goto unm_err_out;
>   	}
> +	if (ntfs_non_resident_sizes_inconsistent(vi, a))
> +		goto unm_err_out;
>   	vi->i_size = ni->data_size = le64_to_cpu(a->data.non_resident.data_size);
>   	ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
>   	ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
> diff --git a/fs/ntfs/layout.h b/fs/ntfs/layout.h
> index 8f5792139d719..2de83d4ca40b9 100644
> --- a/fs/ntfs/layout.h
> +++ b/fs/ntfs/layout.h
> @@ -811,14 +811,17 @@ enum {
>    *                                  on XP SP2+.
>    * @data.non_resident.reserved:     5 bytes for 8-byte alignment.
>    * @data.non_resident.allocated_size:
> - *                                  Allocated disk space in bytes.
> - *                                  For compressed: logical allocated size.
> + *                                  Allocated size in bytes, a multiple of
> + *                                  the cluster size.  For compressed and
> + *                                  sparse attributes holes count as
> + *                                  allocated; the clusters actually in use
> + *                                  are in compressed_size.
>    * @data.non_resident.data_size:    Logical attribute value size in bytes.
> - *                                  Can be larger than allocated_size if
> - *                                  compressed/sparse.
> + *                                  Never larger than allocated_size, also
> + *                                  when compressed/sparse.
>    * @data.non_resident.initialized_size:
>    *                                  Initialized portion size in bytes.
> - *                                  Usually equals data_size.
> + *                                  Usually equals data_size, never larger.
>    * @data.non_resident.compressed_size:
>    *                                  Compressed on-disk size in bytes.
>    *                                  Only present when compressed or sparse.

