Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FA3B8405
	for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 01:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791854296; cv=none; b=EeN30H+YEiAWn4IaOFMOTR+HHWMC6/fwSWfPy0rzJaysOnvzoVpsc+fvZaz/COTKmy8rRCARErA3mh4OgidEb1+gE/lPEYl+iY3SDRdo69XH2KQF/pugQ3haSLZ8ymewytFZv+USdwfoto0JUndp/uCdCgQ1PTvN9nFKh0Np9Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791854296; c=relaxed/simple;
	bh=AwhZep/3bvPnx8i6gfj06bGfNhmhWzYShvPVu8x+qtM=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=UMbEX/OTE+YRwGoZ6Pv5tobVRiJyRokmMPU7JNfnEHaxYi8HWYTMuIy6PtTAhts4W3dioLkp9tUWzZyRBuvswTJ2C/XJMjpHACTq6iBEpwpClAdvA64Hh7c44JVohD2OKFCfwK71xG+bXY2xi9Ca+zFW7wg3b5RDjZqJQo24W6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=XLssvf4e; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="XLssvf4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=ZXwoL5FVMH7bxKRo2wFtg3gWgI/N31ff7zoUzvI4T7k=;
	b=XLssvf4eSXAtn9I84sYSrE7OuMXsCRBp5OIw9o7AZgm2t96uta1tlldWVvaUJw
	13ecXf1B25bZ23cC/9a/JWWPWTHVzCfSlc3fP9/c8Hq2pAYF6VZrIGbQkzKnIwRi
	uF3hJoFVPFwLgze54K6Lyfa0X+lXoLQplcZNU/jUyiTx0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnD925hs1qwhA3BA--.62774S2;
	Tue, 13 Oct 2026 09:17:45 +0800 (CST)
Message-ID: <6ACD8692.8090204@126.com>
Date: Tue, 13 Oct 2026 09:17:06 +0800
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
Subject: Re: [PATCH v4] ntfs: roll back the ACL xattr commit when the WSL
 mode update fails
References: <20261012073452.90099-1-zenghongling@kylinos.cn> <asytNg4xTuvkSxa-@hyunchul-PC02>
In-Reply-To: <asytNg4xTuvkSxa-@hyunchul-PC02>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnD925hs1qwhA3BA--.62774S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKw4fWr47Zw13Ww4DGr1DGFg_yoWxXr43pr
	ZxKF45KF4DJ3sFvrn3tFWDXa4F9ryxKFy8K34xKF17CwnI9r1ftrWak3y7uFykArWFya1F
	vF4jqrs3Cw15uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jI0PfUUUUU=
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBrhndrmrNhrk2EgAA34

Hi  Hyunchul,

     Thanks for the review.
   I will trim the comments and drop old_exists in favour of
   old_len >= 0.  Will post v5.

Thanks!
在 2026年10月12日 17:49, Hyunchul Lee 写道:
> Hi Hongling,
>
> On Mon, Oct 12, 2026 at 03:34:52PM +0800, Hongling Zeng wrote:
>> ntfs_set_acl_ex() commits the ACL xattr before it rewrites the WSL
>> mode EA, and removes it again when the rewrite fails.  That only
>> undoes a set that created the xattr: when the update replaced or
>> removed an existing one, the old ACL is discarded along with the
>> failed update.  The undo result is discarded and the EA paths record
>> no error state, so when it fails too, the new, typically more
>> permissive, ACL is left on disk while i_mode, the mode EA and the
>> cached ACL keep the old values.  Once the stale xattr is loaded again
>> after a remount, a chmod 0640 -> 0777 that reported failure leaves
>> the file accessible to the relaxed ACL while stat() still reports
>> 0640.
>>
>> Save the previous xattr before committing the update, and restore it
>> when the mode EA rewrite fails.  A removed xattr is restored by
>> creating it again: the removal dropped the entry, and XATTR_REPLACE
>> fails with -ENODATA on a missing entry.  Remove the new xattr only
>> when there was no previous one, and skip the undo when the commit
>> changed nothing, e.g. removing an xattr that never existed.  Fail
>> the update when the previous xattr cannot be read back.  A failed
>> rollback is still recorded: NVolSetErrors(), which the next
>> persistence point persists as VOLUME_IS_DIRTY, and a log message the
>> errors= policy acts on.  The flag cannot be written to disk here
>> directly: the target inode's mrec_lock is held and the $Volume
>> mrec_lock cannot be nested under it.
>>
>> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
>> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
>> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>> ---
>> Changes in v3:
>> - Save the previous ACL xattr before committing the new one and roll
>>    back to it when the update replaced an existing one, instead of
>>    removing the new one (suggested by Hyunchul Lee)
>> - Fail the update when the previous xattr cannot be read back, and
>>    restore a zero-length previous xattr without XATTR_REPLACE
>> Changes in v4:
>> - Undo a removal too: restore the previous xattr by creating it
>>    again, since the removal dropped the entry
>> - Skip the undo when the commit changed nothing, e.g. removing an
>>    xattr that never existed
>> ---
>>   fs/ntfs/ea.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 86 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
>> index 1104fd72cd2a..0577a2adc365 100644
>> --- a/fs/ntfs/ea.c
>> +++ b/fs/ntfs/ea.c
>> @@ -1038,8 +1038,10 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>>   {
>>   	const char *name;
>>   	size_t size, name_len;
>> -	void *value;
>> -	int err;
>> +	void *value, *old_value = NULL;
>> +	int err, old_len = -ENODATA;
>> +	bool old_exists = false;
>> +	bool acl_committed = false;
>>   	int flags;
>>   	umode_t mode;
>>   
>> @@ -1083,7 +1085,40 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>>   	}
>>   
>>   	mutex_lock(&NTFS_I(inode)->mrec_lock);
>> +	if (!init_acl) {
>> +		/*
>> +		 * Save the previous xattr so the update can be
>> +		 * rolled back to it when the mode EA rewrite fails.
>> +		 * A new inode cannot have one yet, and one that
>> +		 * cannot be read back fails the update.
>> +		 */
> Could you shorten this comment? I think that the explanations are already
> clear from the code.
>
>> +		old_len = ntfs_get_ea(inode, name, name_len, NULL, 0);
>> +		if (old_len >= 0) {
>> +			old_exists = true;
> Could you remove the old_exists? we can use old_len >= 0.
>
>> +			/* kmalloc(0) returns the non-NULL ZERO_SIZE_PTR. */
>> +			old_value = kmalloc(old_len, GFP_NOFS);
>> +			if (!old_value) {
>> +				err = -ENOMEM;
>> +				goto out_unlock;
>> +			}
>> +			err = ntfs_get_ea(inode, name, name_len,
>> +					  old_value, old_len);
>> +			if (err != old_len) {
>> +				kfree(old_value);
>> +				old_value = NULL;
>> +				if (err >= 0)
>> +					err = -EIO;
>> +				goto out_unlock;
>> +			}
>> +		} else if (old_len != -ENODATA) {
>> +			err = old_len;
>> +			goto out_unlock;
>> +		}
>> +	}
>>   	err = ntfs_set_ea(inode, name, name_len, value, size, flags, NULL);
>> +	if (!err)
>> +		acl_committed = true;
>> +out_unlock:
>>   	mutex_unlock(&NTFS_I(inode)->mrec_lock);
>>   	if (err == -ENODATA && !size)
>>   		err = 0; /* Removing non existed xattr. */
>> @@ -1095,8 +1130,54 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>>   		mutex_lock(&NTFS_I(inode)->mrec_lock);
>>   		err = ntfs_ea_set_wsl_inode(inode, 0, &ea_size, NTFS_EA_MODE);
>>   		if (err) {
>> -			ntfs_set_ea(inode, name, name_len, NULL, 0,
>> -				    XATTR_REPLACE, NULL);
>> +			if (acl_committed) {
>> +				int undo_err;
>> +
>> +				if (old_exists) {
>> +					/*
>> +					 * Restore the previous xattr.
>> +					 * A removal dropped the entry, and
>> +					 * XATTR_REPLACE fails with
>> +					 * -ENODATA on a missing entry, so
>> +					 * create it.  A zero-length xattr
>> +					 * cannot be restored with
>> +					 * XATTR_REPLACE, which would
>> +					 * remove it again.
>> +					 */
> And I think this comment can be reduced.
>
>> +					int undo_flags = acl && old_len ?
>> +						XATTR_REPLACE : 0;
>> +
>> +					undo_err = ntfs_set_ea(inode, name,
>> +							name_len, old_value,
>> +							old_len, undo_flags,
>> +							NULL);
>> +				} else {
>> +					/*
>> +					 * No xattr existed before the
>> +					 * update, so remove the newly
>> +					 * committed one.
>> +					 */
> This branch is self-explanatory from `!old_exists`.
>
>> +					undo_err = ntfs_set_ea(inode, name,
>> +							name_len, NULL, 0,
>> +							XATTR_REPLACE, NULL);
>> +				}
>> +				if (undo_err) {
>> +					/*
>> +					 * The xattr change is committed
>> +					 * already, so a failed rollback
>> +					 * leaves it on disk while i_mode,
>> +					 * the mode EA and the cached ACL
>> +					 * keep the old values.  Record the
>> +					 * error: the next persistence point
>> +					 * persists it as VOLUME_IS_DIRTY.
>> +					 * Run chkdsk.
>> +					 */
> Same here.
>
>> +					NVolSetErrors(NTFS_I(inode)->vol);
>> +					ntfs_error(inode->i_sb,
>> +						   "Failed to undo the ACL xattr: %d",
>> +						   undo_err);
>> +				}
>> +			}
>>   			mutex_unlock(&NTFS_I(inode)->mrec_lock);
>>   			inode->i_mode = old_mode;
>>   			goto out;
>> @@ -1109,6 +1190,7 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>>   	}
>>   
>>   out:
>> +	kfree(old_value);
>>   	kfree(value);
>>   
>>   	return err;
>> -- 
>> 2.25.1
>>

