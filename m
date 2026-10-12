Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A814413A258
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 02:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791772145; cv=none; b=HImQUtIG9Sekb8/z14vYp/JWrPgnrXehCUKUdF2J+CXItQOa4NoHHTPf7E4+hx+jtPTyAgLx2XbSio6NVfxptlSg+dXiBaakX2krNHgGCqSAYpghbwy1xPjcguzWgtUromK8cQ4BKK8Yz0QjnDkGxELXbkIm695FVCxopzROSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791772145; c=relaxed/simple;
	bh=zpS3Xh9soiHmpvQs4oVazp8AuGt6Nt+Yz/sxg+zMKD8=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=UAa8YRcGRekzrfPJ1+gvY0shexmT94M4LUZ42f6kbApQUvSugSYfrb/Ei0VHjdV947yc4NSFE8aVM5qLDQSxaPIyjfGbN/T0jG3TgTI3Ud2CdF3rODy03efDTl1KpXxHpNKvg+sb1nivQBAd6dTzgzBh/7xjk9e2B4SwM+a5pgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=VPFuaUKN; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="VPFuaUKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=9NJwlbvFs2Xih6NO4DxbF7QZlsJTzh8UHyan52roRtA=;
	b=VPFuaUKNMgSvdL1OUFwEz+hJU7rYTjTReazy7gLUF+jXYYCh+sHCu5RgL9v70g
	BYdlVIwEYrwrBO2qpK+9QZK06alOquVvbyJj5M85Yfm9vb6Yf18Z5oLuftqEiBjB
	vIW/WbgT5GDgH8XDcJ8VGsPmxUhsIWF+J06a62KPaRpRo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgC3B_vaRcxqz7qHBQ--.16377S2;
	Mon, 12 Oct 2026 10:28:43 +0800 (CST)
Message-ID: <6ACC45B6.1080909@126.com>
Date: Mon, 12 Oct 2026 10:28:06 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: Hyunchul Lee <hyc.lee@gmail.com>, 
 Hongling Zeng <zenghongling@kylinos.cn>
CC: linkinjeon@kernel.org, ntfs@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ntfs: record an error when the ACL xattr undo fails
References: <20261004022622.631203-1-zenghongling@kylinos.cn> <asR8LDWW5S3Ex0Gi@hyunchul-PC02>
In-Reply-To: <asR8LDWW5S3Ex0Gi@hyunchul-PC02>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PikvCgC3B_vaRcxqz7qHBQ--.16377S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWxCrWfuF17XrWfur1rZwb_yoW5ur1fpr
	sxJFy5KrWDt342yFna9r48Xa4F934fKF48Jw1fKwnFkwnaqr1SqrWSgr1UWFy8ArWrtw4F
	vF4UXws8uay5WFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jI0PfUUUUU=
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBrhtVJmrMRdsVIgAA3J


在 2026年10月06日 12:42, Hyunchul Lee 写道:
> Hi Hongling,
>
> On Sun, Oct 04, 2026 at 10:26:22AM +0800, Hongling Zeng wrote:
>> ntfs_set_acl_ex() commits the new ACL xattr before it rewrites the WSL
>> mode EA, and removes it again when that rewrite fails.  The removal is
>> best-effort: its result is discarded and the EA paths record no error
>> state, so when the removal fails too, the new, typically more
>> permissive, ACL is left on disk while i_mode, the mode EA and the
>> cached ACL keep the old values.  Once the stale xattr is loaded again -
>> after a remount, or when the cached ACL is discarded - a chmod 0640 ->
>> 0777 that reported failure leaves the file accessible to the relaxed
>> ACL while stat() still reports 0640.
>>
>> Check the removal and record the failure: NVolSetErrors(), which the
>> next persistence point persists as VOLUME_IS_DIRTY, and a log message
>> the errors= policy acts on.  The flag cannot be written to disk here
>> directly: the target inode's mrec_lock is held and the $Volume
>> mrec_lock cannot be nested under it.
>>
>> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
>> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>> ---
>>   Change in v2:
>>   -undo only a committed set: undoing a removal returned -ENODATA for an
>>    already-removed xattr and was recorded as a volume error, or re-added
>>    an empty xattr once the removal had dropped the last EA
>> ---
>>   fs/ntfs/ea.c | 30 ++++++++++++++++++++++++++++--
>>   1 file changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
>> index b4fcfbe2da4c..b3e079e2dc03 100644
>> --- a/fs/ntfs/ea.c
>> +++ b/fs/ntfs/ea.c
>> @@ -1084,8 +1084,34 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>>   		mutex_lock(&NTFS_I(inode)->mrec_lock);
>>   		err = ntfs_ea_set_wsl_inode(inode, 0, &ea_size, NTFS_EA_MODE);
>>   		if (err) {
>> -			ntfs_set_ea(inode, name, name_len, NULL, 0,
>> -				    XATTR_REPLACE, NULL);
>> +			/*
>> +			 * Only a set needs undoing: a removal leaves no
>> +			 * new ACL behind, and repeating it would either
>> +			 * return -ENODATA again or, once it dropped the
>> +			 * last EA, re-create an empty xattr.
>> +			 */
>> +			if (acl) {
>> +				int undo_err = ntfs_set_ea(inode, name, name_len,
>> +						NULL, 0, XATTR_REPLACE, NULL);
> Could we restore the previous ACL xattr instead of unconditionally
> remove it?
Hi   Hyunchul
   Good point. Removing the new xattr also loses the old one when it
   replaced an existing ACL.

   v3 saves the previous xattr before the commit and restores it on a
   mode EA failure, removing the new one only when there was no previous
   one. A failed rollback is still recorded with NVolSetErrors().

Thanks!


>> +
>> +				if (undo_err) {
>> +					/*
>> +					 * The ACL xattr is committed
>> +					 * already, so a failed removal
>> +					 * leaves the new, typically more
>> +					 * permissive, ACL on disk while
>> +					 * i_mode, the mode EA and the
>> +					 * cached ACL keep the old values.
>> +					 * Record the error: the next
>> +					 * persistence point persists it as
>> +					 * VOLUME_IS_DIRTY.  Run chkdsk.
>> +					 */
>> +					NVolSetErrors(NTFS_I(inode)->vol);
>> +					ntfs_error(inode->i_sb,
>> +						   "Failed to undo the ACL xattr: %d",
>> +						   undo_err);
>> +				}
>> +			}
>>   			mutex_unlock(&NTFS_I(inode)->mrec_lock);
>>   			inode->i_mode = old_mode;
>>   			goto out;
>> -- 
>> 2.25.1
>>

