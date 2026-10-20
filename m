Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792466646;
	b=feVB49spKz3pvFJdi9eRj4hTPdRo1p2+mMHtYZzQDqoK0p//RZsrBCDHrrJp8jFjvFet
	 T5yBQPrHYOSXX0C7yOsLpT7C9RtjCaiOLQMUR3jowerX8PpazNFIbBh0cFYzJaBfXGIdv
	 JJjw/NpiVu4DGZGA8yyWnVTu4tw4REB2A8dX1X20OJ8+0gn6SbKvYPzrIyfYXuT2etp9E
	 NXLdi24AxuqLEjV5DTSnzvpb1DnaFiqrKNM5nHoPF7saeUSeGKJZmO3+2dDsxg2v1TrSf
	 cnuFI8AIRFst2egDC/+pN2O+6+Mi7iwttX31T6+Adna+R2e+nneznBqR2AzOk8rWHrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466646;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:From:User-Agent:
	 MIME-Version:To:CC:Subject:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=RaseYI6mxt8wJNHN6oWVRaO9jf14C0/T0OwMtO2YNGE=;
	b=dbxJNyafifcIWaupSa1e615igux2bqYtGAxCp4/2qO1jFAkpTqFGHuYdwcztprkK/gh/
	 sVLeKr3F1AJ+1lJ+qiyL3h5feTIGEwf44O9J/nODZgyaZi1flcz9r7CaNGrNipgz4twcI
	 luA/gvnTcEHm6qFvlguFNvRygZYUGxrPQNYjAjGGbYUyJOPCRkUBx217oEkh/QssPM+gS
	 iYC11VtbTYZvELjp72lIERA1HhNY4e/hmqjr7r9UmIJpon/HCoopjvTs8sDkzsuzBMHwN
	 4wHxpH+UoxlsnNkemxDJNFTIKONRSFV2LrZENrU0WCRNK3Lv1AevzgcoExYUfVH1C4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Und3Nvjl;
	arc=none smtp.remote-ip=220.197.31.6
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC442606A31A
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 03:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC442606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Und3Nvjl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=RaseYI6mxt8wJNHN6oWVRaO9jf14C0/T0OwMtO2YNGE=;
	b=Und3NvjlEiy7BtYfjydwrv5kMpcPVA7z3DDDGdFJ0dQV7vapFMacREbVNVZwsK
	nSQkcIZ1+FIeJ9iJEasPZfGYi695zm7+DpCvZEFLtLJFGDKyjKh+/hn4Z2/dEV1t
	9f11sT7UO49pExTTaIOTWhHvcDEyopfzdxe0K2P9YDz0E=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgDXHw653tZqsw1qBw--.14095S2;
	Tue, 20 Oct 2026 11:23:37 +0800 (CST)
Message-ID: <6AD6DE92.9030305@126.com>
Date: Tue, 20 Oct 2026 11:22:58 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
To: Hyunchul Lee <hyc.lee@gmail.com>, 
 Hongling Zeng <zenghongling@kylinos.cn>
CC: linkinjeon@kernel.org, ntfs@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ntfs: handle a failed size rollback in the write error
 path
References: <20261019064918.152859-1-zenghongling@kylinos.cn> <atbX6ZAHk8U4Xsuo@hyunchul-PC02>
In-Reply-To: <atbX6ZAHk8U4Xsuo@hyunchul-PC02>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCkvCgDXHw653tZqsw1qBw--.14095S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur1UCF4xJF1ktw45ZrWrZrb_yoWrAryrpr
	9rGFsxKrs7X34xCwnIqFyYq3WFqryrWr4UuFy3JF13AF909rn7XF1UtrW8uFWktr98t3ZY
	vr4DWrZxur95ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jI0PfUUUUU=
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBrhk2B2rW3rk9UgAA3y


在 2026年10月20日 10:54, Hyunchul Lee 写道:
> Hi Hongling,
>
> On Mon, Oct 19, 2026 at 02:49:18PM +0800, Hongling Zeng wrote:
>> >ntfs_file_write_iter() extends the data and initialized sizes before
>> >it copies the user data and restores them when the write then fails.
>> >The restoration is best-effort: both results are discarded, even
>> >though the extension is already recorded in the dirty MFT record.
>> >When the restoration fails too, the extended sizes reach the disk
>> >while the VFS inode keeps reporting the old ones: after a remount the
>> >file appears grown again, with an uninitialized tail where the failed
>> >write never put any data, and nothing records the failure.
>> >
>> >Keep both undo results: on failure, set NVolSetErrors(), which the next
>> >persistence point persists as VOLUME_IS_DIRTY, and log a message for
>> >the errors= policy.
>> >
>> >Fixes: 9c87959601e8 ("ntfs: update file operations")
>> >Suggested-by: Hyunchul Lee<hyc.lee@gmail.com>
>> >Signed-off-by: Hongling Zeng<zenghongling@kylinos.cn>
>> >---
>> >Changes in v2:
>> >- do not roll the initialized size back on a resident data attribute,
>> >   where ntfs_attr_set_initialized_size() always fails with -EINVAL and
>> >   the data size rollback restores both coupled sizes.
>> >---
>> >  fs/ntfs/file.c | 46 +++++++++++++++++++++++++++++++++++++---------
>> >  1 file changed, 37 insertions(+), 9 deletions(-)
>> >
>> >diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
>> >index d810ca5904bd..597fd70ed30b 100644
>> >--- a/fs/ntfs/file.c
>> >+++ b/fs/ntfs/file.c
>> >@@ -934,22 +934,50 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>> >  				&ntfs_iomap_folio_ops, NULL);
>> >  out:
>> >  	if (ret < 0 && ret != -EIOCBQUEUED) {
>> >-		if (ni->initialized_size != old_init_size) {
>> >-			struct ntfs_inode *mrec_ni =
>> >-				ntfs_base_inode(ni);
>> >+		int undo_err = 0;
>> >+		int init_err = 0;
>> >+
>> >+		/* ntfs_attr_set_initialized_size() rejects a resident one. */
>> >+		if (ni->initialized_size != old_init_size &&
>> >+		    NInoNonResident(ni)) {
>> >+			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>> >  
>> >  			mutex_lock(&mrec_ni->mrec_lock);
>> >-			ntfs_attr_set_initialized_size(ni, old_init_size);
>> >+			init_err = ntfs_attr_set_initialized_size(ni,
>> >+					old_init_size);
>> >  			mutex_unlock(&mrec_ni->mrec_lock);
>> >+			if (init_err && !undo_err)
>> >+				undo_err = init_err;
>> >  		}
>> >  		if (ni->data_size != old_data_size) {
>> >-			struct ntfs_inode *mrec_ni =
>> >-				ntfs_base_inode(ni);
>> >+			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>> >+			int data_err = 0;
>> >  
>> >  			truncate_setsize(vi, old_data_size);
>> >-			mutex_lock(&mrec_ni->mrec_lock);
>> >-			ntfs_attr_truncate(ni, old_data_size);
>> >-			mutex_unlock(&mrec_ni->mrec_lock);
>> >+			/*
>> >+			 * ntfs_attr_truncate() rejects a compressed one.
>> >+			 * Skip it also after a failed initialized size
>> >+			 * rollback: the shrunk data size would stay below
>> >+			 * the initialized size, which the loader rejects.
>> >+			 */
>> >+			if (!NInoCompressed(ni) && !init_err) {
>> >+				mutex_lock(&mrec_ni->mrec_lock);
>> >+				data_err = ntfs_attr_truncate(ni,
>> >+						old_data_size);
>> >+				mutex_unlock(&mrec_ni->mrec_lock);
>> >+			}
>> >+			if (data_err && !undo_err)
>> >+				undo_err = data_err;
>> >+		}
>> >+		if (ni->data_size != old_data_size && NInoCompressed(ni))
>> >+			ntfs_warning(vi->i_sb,
> For compressed-file, the code only emits a warning, which causes the
> VOLUME_IS_DIRTY persistence to be bypassed even though the MFT data size
> remains expanded.
>
> I think that we should report the compressed rollback as an error.
>
> -- Thanks, Hyunchul
   Hi Hyunchul,

   You are right, the warning-only path left the expanded data size with
   no error state.  v3 drops the skip: the data size rollback now goes
   through __ntfs_attr_truncate_vfs(), the same entry ntfs_setattr_size()
   uses, which also supports compressed attributes.  The compressed
   rollback is performed rather than skipped, and a failure of either
   undo sets NVolSetErrors() and calls ntfs_error().

   Thanks,
   Hongling


