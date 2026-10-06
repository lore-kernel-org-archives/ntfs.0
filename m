Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5636EAB0
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 04:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261748; cv=none; b=khympl7brJAnsusJCAwsJQHsg4ZGmQzY9UaCVXaxeWXqsGXG9pSkYFYWHhoQzBe+0Tmf1Ll1XQu1ipKof6IEgxeeeatf5AJYxJGAP69PeJDTsc6BjCI/MzCg+pHOwj+WW+PcpkHRKURBGcS/umV43isuc6WnJu9qli0qTKSaa7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261748; c=relaxed/simple;
	bh=ey/VmHOoiegcuBBgsbjOLxRd4S3RnSr5XSYjzesA/NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6QPm+tJJJIE+JQtctXLDPk0uTltMUxCAWXVXtf3SsMjGwCRzYyUaqi8UFAVGlh/e75wpvNDlkLbEYqvyjUX7XzySpiMMse1KL0CEwNveQQRtm7cMFjF7D26v5jtNJOVfH4+mSmkSatBXys2x9e4Q6iu/qMhXIhDcBH/kUvx/Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jut4lGEz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jut4lGEz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2dd9ec41bc4so3385985ad.2
        for <ntfs@lists.linux.dev>; Mon, 05 Oct 2026 21:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261744; x=1791866544; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmyvkwbpQWj8sse21Js4aaAmmgEtva0kuk1RTa4+PCU=;
        b=jut4lGEzbYsy0dUqv1CRvMqe9EMdP3+2oILih1WwPBjpr3jwMxVIvJVvh1vmviaOPz
         5xw+IFADemCPasUqrzPEjDaAKxB8CRAqb1ftV5mkyvPXZO8hmSrNJMX5ruK/XO0KY1hK
         Gme7dSkUUDitA/P2H+6gDNsNfX0THig5YKqS6tmBBsRWnhuvhJ0wvyMBsbOm+orHt17b
         0VrHcmt2Ku20hwY8uKsgcHIu6MbQ7Pipzmlvss06HBSn7HkxFMHay4rbrWlMZJRpBcCa
         7fcaEl8t8I79k2hr3H4W+q2js9mAtJaaaeJ+boC/Nw6/bRr1qheTJU9AjkQPccMBh3ix
         cI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261744; x=1791866544;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmyvkwbpQWj8sse21Js4aaAmmgEtva0kuk1RTa4+PCU=;
        b=gB01tWk5DncNZeGJ26DVgNWIl6AcS1Wqk4XMDKdzkceMQl8zI4OdCd0wfMwEaNnCHU
         pjhZdJNyPR4yhtcUvspxq8WKZu+Syc8Mc5BdPMCtLGiY1a0+v/iekcYTz6mkOcQ6yWst
         h8Bp6qy9WH2sBbjv59b6AflA9tdVezTuYFDHZ/DbRDZkdIbnCJQ0XEAJxaFqaaZqTN/S
         XzXfgQ3ON+KCil7XgoPK4zAsbYuEdGn0rAd7CjdMyxqkUMv7iWwBQUCjWlJzIR4HJA7u
         P7/phTN5fHeN56shBJJ8+jKmVh/qae5e3tSJ5cSQlaAyxMI2cEhIkHhXH/FsakSWJDVV
         Q1Aw==
X-Forwarded-Encrypted: i=1; AKwUvByT89fjVYqMc883IdR+fFUw22s2CfeU/VBQ11LrcgzaYSA4ar7K6up8AMVOhy0bd2VQZCED@lists.linux.dev
X-Gm-Message-State: AFq9FYLOV0CvMN2ELFyhaJ72yXr7giI9eXfwb26iphK71/6kTfuGgaCi
	2hPrzRFfuFUx1HAYAo/vFlGqnH66mhCxle+i8uByjaFwImxyke8JRPde
X-Gm-Gg: AYBFou2zBfXNcFTWhJEAPkQZpPfmfEvi5ldzIu9Q2+6RFudT3sRs6nPGraPdiqcfmkg
	cmtyAO+pLGMD9i5q2ZYcGDZWTVj3dq5gFkYrBJVqPJATUgdzjC2jnkYlSb1rltkStoIgAG7/Cd1
	KJJGohboGqaxquE1z9r5Kp9MfAGETsA1kt+UZj0lU1TnVmu4GCWAQk1+UHOw6gPIZLP4ylfsWCv
	+TBUuwAxmiyaJ1tEWAZ2Bul/BRx3CL0InszMNTngPkA1sl4JNJg2n+2Zt1vpAYhwn3/gsMKoV7o
	vxLjWrHHNjmG8W//QmuuYfSZuDl16jffNNHG1G9s5qr/oRdwITaaQOpb2oEWG7VddtPbvX5H2kL
	KN8GVPLLZeqxEMxZv1Dr4pBs7n7MvDHR/j5pNXdznHLAJrUbxG54vDjjSC5h5bLq+Jg/pZuNXYJ
	Fwkw+UTUc23Razx70kjoHupSSFcC4cLZcmmrJ85oJ3Zyk7rigf5aMaSmF1mfJy
X-Received: by 2002:a17:90b:5825:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3a8726c1865mr151075a91.2.1791261743929;
        Mon, 05 Oct 2026 21:42:23 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cea0f1sm2734791a91.15.2026.10.05.21.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:42:22 -0700 (PDT)
Date: Tue, 6 Oct 2026 13:42:20 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v2] ntfs: record an error when the ACL xattr undo fails
Message-ID: <asR8LDWW5S3Ex0Gi@hyunchul-PC02>
References: <20261004022622.631203-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004022622.631203-1-zenghongling@kylinos.cn>

Hi Hongling,

On Sun, Oct 04, 2026 at 10:26:22AM +0800, Hongling Zeng wrote:
> ntfs_set_acl_ex() commits the new ACL xattr before it rewrites the WSL
> mode EA, and removes it again when that rewrite fails.  The removal is
> best-effort: its result is discarded and the EA paths record no error
> state, so when the removal fails too, the new, typically more
> permissive, ACL is left on disk while i_mode, the mode EA and the
> cached ACL keep the old values.  Once the stale xattr is loaded again -
> after a remount, or when the cached ACL is discarded - a chmod 0640 ->
> 0777 that reported failure leaves the file accessible to the relaxed
> ACL while stat() still reports 0640.
> 
> Check the removal and record the failure: NVolSetErrors(), which the
> next persistence point persists as VOLUME_IS_DIRTY, and a log message
> the errors= policy acts on.  The flag cannot be written to disk here
> directly: the target inode's mrec_lock is held and the $Volume
> mrec_lock cannot be nested under it.
> 
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  Change in v2:
>  -undo only a committed set: undoing a removal returned -ENODATA for an
>   already-removed xattr and was recorded as a volume error, or re-added
>   an empty xattr once the removal had dropped the last EA
> ---
>  fs/ntfs/ea.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index b4fcfbe2da4c..b3e079e2dc03 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -1084,8 +1084,34 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>  		mutex_lock(&NTFS_I(inode)->mrec_lock);
>  		err = ntfs_ea_set_wsl_inode(inode, 0, &ea_size, NTFS_EA_MODE);
>  		if (err) {
> -			ntfs_set_ea(inode, name, name_len, NULL, 0,
> -				    XATTR_REPLACE, NULL);
> +			/*
> +			 * Only a set needs undoing: a removal leaves no
> +			 * new ACL behind, and repeating it would either
> +			 * return -ENODATA again or, once it dropped the
> +			 * last EA, re-create an empty xattr.
> +			 */
> +			if (acl) {
> +				int undo_err = ntfs_set_ea(inode, name, name_len,
> +						NULL, 0, XATTR_REPLACE, NULL);

Could we restore the previous ACL xattr instead of unconditionally
remove it?

> +
> +				if (undo_err) {
> +					/*
> +					 * The ACL xattr is committed
> +					 * already, so a failed removal
> +					 * leaves the new, typically more
> +					 * permissive, ACL on disk while
> +					 * i_mode, the mode EA and the
> +					 * cached ACL keep the old values.
> +					 * Record the error: the next
> +					 * persistence point persists it as
> +					 * VOLUME_IS_DIRTY.  Run chkdsk.
> +					 */
> +					NVolSetErrors(NTFS_I(inode)->vol);
> +					ntfs_error(inode->i_sb,
> +						   "Failed to undo the ACL xattr: %d",
> +						   undo_err);
> +				}
> +			}
>  			mutex_unlock(&NTFS_I(inode)->mrec_lock);
>  			inode->i_mode = old_mode;
>  			goto out;
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
