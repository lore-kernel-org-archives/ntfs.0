Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C7A190462
	for <ntfs@lists.linux.dev>; Fri, 16 Oct 2026 04:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124603; cv=none; b=PC8K2VUdXm2rOXv9yGuH5c61lguIvOrZ+fKvpL6XT7zOpQ0VKJNKx9PQ0Db7igJR/1Siyb+j0reZYoXHv+1OYenn58YMenjih5U4gAVHyyMwoC1ENlaOzLOyMMYOXzZWXcvKXnwBD2bh5Jy7qcVzi47ITBmMBCSjDFtE63951pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124603; c=relaxed/simple;
	bh=ag/Pnoodh+wXUn89zlxc5YHV2k1IOI1YA6yNirvUmiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbhQV5Qvd87pPzS45FrWaDz6aG4KWWLF1RHZfwzIm2KDsPoyctsulbBy9r48vjrf5YG8uSbDPmWnSsPsRDWs97K8Wlb9IVFiBsYrSZtbzXKNVCqHG85jxUpfBTJB4xB5MfnBtDRjuP7fSF+p7lFhh8Bl/u7BVScwWSSDC2Mctiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UGOdUFNE; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UGOdUFNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=jfJhnyhGv7xLHyhQ8lmOcf8LFvAOPIP/V+VGHwAn2yw=;
	b=UGOdUFNEq8HH2c4iEmzmgVyfujUAJGFWkhVb56p9w1+eGq6Gzx4lQMYYiT0Ssb
	h7NI4QItNSU5o8avONie8l13lwSZROqfNkhE1IjcTqgHK5InoGR233t5X9YsC9Wo
	eD9yEBDI2PcfdYT4DphhdeUxT7BZTQWc6+6DICs/4SJfk=
Received: from [IPV6:2409:8900:1a87:d0a0:8212:3d05:576c:220f] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3V9KnptFqBHWoAQ--.40078S2;
	Fri, 16 Oct 2026 12:23:05 +0800 (CST)
Message-ID: <3f23f6d5-0699-4c16-a1c0-a3d97139e5dc@163.com>
Date: Fri, 16 Oct 2026 12:23:03 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ntfs: support persistent noatime attribute
To: Xuewen Wang <wangxuewen@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20261016030957.1053110-1-wangxuewen@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261016030957.1053110-1-wangxuewen@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3V9KnptFqBHWoAQ--.40078S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuw1fJw4DCFy5Cw1xGr1rWFg_yoWxZr4fpa
	95GFy3K3yrJa42k392kF4UW3WSvrn3JayUJryDXw18Aas8G3WSgF1fKF4rXa18Kr1fCw12
	qa1UtrWDZry5Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gnirWrRpqmgfgAA3G



在 2026/10/16 11:09, Xuewen Wang 写道:
> NTFS currently rejects FS_NOATIME_FL in its fileattr setter. This prevents
> users from disabling automatic access-time updates on individual files or
> directories with chattr +A.
> 
> Store noatime in bit 3 of the private $LINUXFLAGS EA and restore S_NOATIME
> when loading an inode. Report and accept FS_NOATIME_FL in the fileattr
> callbacks, updating the in-memory flag only after the EA update succeeds.
> The VFS then suppresses automatic atime updates for the inode, while
> chattr -A restores the mount's atime policy.
> 
> Document the new on-disk bit and that newly created children do not inherit
> the attribute.
> 
> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
> Tested in QEMU (x86-64, UP, NTFS debug and lockdep enabled) on disposable
> NTFS images mounted with strictatime. The unpatched kernel rejects +A on
> files and directories with EOPNOTSUPP. With this patch, chattr +A prevents
> atime updates on reads and directory enumeration, and chattr -A restores
> them. The attribute survives cache dropping, read-only/read-write remounts,
> unmount/mount and a fresh boot; clearing it also survives a fresh boot.
> 
> Also checked the on-disk EA value, non-inheritance by new children,
> combinations with immutable/append-only/nodump, FSGETXATTR/FSSETXATTR,
> owner/nonowner permissions, EROFS on a read-only mount, rejection of direct
> EA writes, and preservation of unrelated EAs and unknown flag bits.
> 
>   Documentation/filesystems/ntfs.rst | 15 ++++++++++-----
>   fs/ntfs/ea.c                       |  2 ++
>   fs/ntfs/ea.h                       |  4 +++-
>   fs/ntfs/file.c                     | 11 +++++++++--
>   4 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
> index 699e91f884d4..d5819da6ab53 100644
> --- a/Documentation/filesystems/ntfs.rst
> +++ b/Documentation/filesystems/ntfs.rst
> @@ -38,15 +38,20 @@ The project is available at:
>   Linux file attributes
>   =====================
>   
> -The driver supports lsattr(1) and chattr(1). Immutable, append-only and
> -nodump are stored in a private ``$LINUXFLAGS`` extended attribute within the
> +The driver supports lsattr(1) and chattr(1). Immutable, append-only, nodump
> +and noatime are stored in a private ``$LINUXFLAGS`` extended attribute within the
>   standard NTFS ``$EA``/``$EA_INFORMATION`` attributes. Its value is a
>   32-bit little-endian bitmask: bit 0 is immutable, bit 1 is append-only,
> -and bit 2 is nodump. Unknown bits are preserved when updating the flags;
> -the entry is removed when the entire value becomes zero. These settings
> +bit 2 is nodump, and bit 3 is noatime. Unknown bits are preserved when updating
> +the flags; the entry is removed when the entire value becomes zero. These settings
>   survive inode eviction, unmount and reboot. Direct writes to this EA
>   through setxattr(2) or removexattr(2) are rejected; use chattr(1) instead.
>   
> +The noatime attribute (``chattr +A``) suppresses automatic access-time
> +updates for the inode, including when mounted with ``strictatime``. It
> +applies to directories as well as files, but is not inherited by newly
> +created children. Use ``chattr -A`` to restore the mount's access-time policy.
> +
>   System metadata files and files protected by the ``sys_immutable`` mount
>   option cannot have their immutable protection cleared with chattr(1).
>   Protection derived solely from the mount option is not stored in the EA.
> @@ -55,7 +60,7 @@ configured per file. Compression and encryption are reported but cannot
>   be changed through chattr(1).
>   
>   These Linux flags are enforced by Linux. Storing them in an NTFS EA does
> -not make Windows enforce immutable, append-only or nodump semantics.
> +not make Windows enforce immutable, append-only, nodump or noatime semantics.
>   
>   
>   Supported mount options
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index a1f948c4d2ec..fd97da73ff5c 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -501,6 +501,8 @@ int ntfs_ea_get_linuxflags(struct inode *inode)
>   		inode->i_flags |= S_IMMUTABLE;
>   	if (ni->linuxflags & NTFS_LINUXFLAGS_APPEND)
>   		inode->i_flags |= S_APPEND;
> +	if (ni->linuxflags & NTFS_LINUXFLAGS_NOATIME)
> +		inode->i_flags |= S_NOATIME;
>   	return 0;
>   }
>   
> diff --git a/fs/ntfs/ea.h b/fs/ntfs/ea.h
> index 8f144fa4f9bb..3ad20431877b 100644
> --- a/fs/ntfs/ea.h
> +++ b/fs/ntfs/ea.h
> @@ -11,8 +11,10 @@
>   #define NTFS_LINUXFLAGS_IMMUTABLE	BIT(0)
>   #define NTFS_LINUXFLAGS_APPEND	BIT(1)
>   #define NTFS_LINUXFLAGS_NODUMP	BIT(2)
> +#define NTFS_LINUXFLAGS_NOATIME	BIT(3)
>   #define NTFS_LINUXFLAGS_MASK	(NTFS_LINUXFLAGS_IMMUTABLE | \
> -				 NTFS_LINUXFLAGS_APPEND | NTFS_LINUXFLAGS_NODUMP)
> +				 NTFS_LINUXFLAGS_APPEND | NTFS_LINUXFLAGS_NODUMP | \
> +				 NTFS_LINUXFLAGS_NOATIME)
>   
>   extern const struct xattr_handler *const ntfs_xattr_handlers[];
>   
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 58aad7f5c6c5..2cbe780758e3 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -167,6 +167,8 @@ int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
>   		flags |= FS_IMMUTABLE_FL;
>   	if (vi->i_flags & S_APPEND)
>   		flags |= FS_APPEND_FL;
> +	if (vi->i_flags & S_NOATIME)
> +		flags |= FS_NOATIME_FL;
>   	if (ni->linuxflags & NTFS_LINUXFLAGS_NODUMP)
>   		flags |= FS_NODUMP_FL;
>   	if (!NVolCaseSensitive(ni->vol))
> @@ -200,7 +202,8 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
>   {
>   	struct inode *vi = d_inode(dentry);
>   	struct ntfs_inode *ni = NTFS_I(vi);
> -	u32 allowed = FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL;
> +	u32 allowed = FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL |
> +		      FS_NOATIME_FL;
>   	u32 readonly = 0;
>   	u32 linuxflags = ni->linuxflags & ~NTFS_LINUXFLAGS_MASK;
>   	unsigned int new_fl = 0;
> @@ -245,6 +248,10 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
>   	}
>   	if (fa->flags & FS_NODUMP_FL)
>   		linuxflags |= NTFS_LINUXFLAGS_NODUMP;
> +	if (fa->flags & FS_NOATIME_FL) {
> +		new_fl |= S_NOATIME;
> +		linuxflags |= NTFS_LINUXFLAGS_NOATIME;
> +	}
>   
>   	mutex_lock(&ni->mrec_lock);
>   	err = ntfs_ea_set_linuxflags(vi, linuxflags);
> @@ -252,7 +259,7 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
>   	if (err)
>   		return err;
>   
> -	inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND);
> +	inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND | S_NOATIME);
>   	inode_set_ctime_current(vi);
>   	mark_inode_dirty(vi);
>   	return 0;


Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

