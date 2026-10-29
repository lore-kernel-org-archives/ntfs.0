Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232909;
	b=s7jgeiXOuQ+GNXPvNyovwWL8HfMADZVafYHh4ddJvvUwMDK9cK4B2etwOQh34W8DECjj
	 jYi5rBAkQ+bHHGX4giwK8pGUL2NgqH49xBDa+LXsQ62pHybPakoUcDAZ9D5ycaL5dXd1F
	 HxzA/+Vfd2jFfdB1IMh0PvBvH4O1T1DMxuxEgk4qbWZXit1pW1Pey2x5OY+gcdJiE7jlZ
	 6uZuKc6ibWAui2f3jEFpFSNOqLjiAxRs4U2TDNEf5BRBcLFgkv3Brj4LRpkESptBt5EU6
	 c0zMOZqs9t31Epsmyd5TmSKbuva++2ZFwk5nBSgairar8eF3x0H1eqsYEwitvmzDVxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AKYZnuuJaKbDAUFeC/huFk/Nq3e89+l9qvUa+yaAXe4=;
	b=peXIzhQC35U9yREVRFbOWarm7+JPpdIvhRTRHPdUD+5OGgLzaIDsdzM3rYcAmowVYLG7
	 SwDAHUvbPpdTuLDGrZeE8+nb6RF2nnCXGxnYeEZ7k2/7Wr4ZCXlihPpaFrezLEIdzX7ju
	 5zgxMWygGkyfhCmUdOOmx9DYhntFttIlcxL/KZ6Uva2Is0Fn+J+IfAk9K+3iJESek4YB/
	 uJuNKAsWwJUfWHygH8iSJRdXTdnzwuPflOElABYfrc3vvLlHM0vbaEkguPI2dfTD9lEgL
	 JW8WSDPFwj4l12khYpaWWlnVHhtlncIkdqj5PnyPn6ESNAY1AZJU3jWC9pcQHSpqeQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMCY9YjH;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A963606A31E
	for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 00:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A963606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMCY9YjH
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a18fc7a38so3190228eec.1
        for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 17:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793232908; x=1793837708; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKYZnuuJaKbDAUFeC/huFk/Nq3e89+l9qvUa+yaAXe4=;
        b=jMCY9YjHcQN35/kPKaKPHISReba46kk9VqxN0sOM0Hcjf2gklbmMUx6qw0/H0qdAMP
         WEnWaPgYwf5bGiRkfa2OwRJ2xU1iG4cMFWTb270VxvWVareHcpI2sRjNy2ifos99A/+5
         LzQYVF+m4psyFfFx2RFy2M5n/7Jxj0BSOmJe1E85AqQzf6Q2kFZ8EadbRocf9tSUjOzn
         QdYQ2ZGaWjBmcPQDCyWUN6tQiVHeqaatC9jOCBMlTPCFszNwfpAR7bbNl9w+P0W3brXv
         xCK+wyHMaymcBFcF0ahSZrcYBnXhqnxXlVBmK7X7YmMq5GKZO5O4/u1ErZ9p8rzY99o4
         /h4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793232908; x=1793837708;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKYZnuuJaKbDAUFeC/huFk/Nq3e89+l9qvUa+yaAXe4=;
        b=Lg0p3lpuNSp8X3BFaC2NqV7ubkV390oaGwD5sOLm6Ec8g2rnXGo0mlzcLTyCJpVpxz
         M+j8BJ538IZgzs02GOCgFr0L4nqiMvbNakzdox65c1mz9FzjUQKWNYTal8tcEpexi5Ia
         1H9PO8Sp/S/3rtb0HkdgXRKMGpZ0JXDPAl26cEiPq8JbHLyDlO70T3aEZo7TJwDBpeY5
         6vf43bTGljB7YJ3GznhhdLCPn6YYuk78r0KBVM4MQt8mlANIcYDL1gZxKObvLpFXVmoz
         fTwjrtcFt5BCQq8XQFgIIvr0BZrpi3/SS/YOxaBNTMzKAXqLf7iYRdoKhyJFgIz8S1Em
         biaQ==
X-Forwarded-Encrypted: i=1; AKwUvByT7trmPAFtn05/RFmjifIxuHaNL6VAe7NZxPYmnR/dOizk2NiBjoiJWo5UiERjJHsZkqFb@lists.linux.dev
X-Gm-Message-State: AFq9FYI/vzCBGnf2lLgcBMIXdlFysZRBhtdmHfF47+LBeMR5tHg+JOfP
	pgnSP2bT+TMu2+tR14hP9KmFPnSiiPvzsS7UKC2heEfVx2q1K9Yzw7Z/
X-Gm-Gg: AYBFou3Wwnha+4Wtoif7xowdwD5pMxPUVCXDJ4QQlg64hpgTvcEoiVU8pL9PeMSCjUi
	0r8onH+wjnIFWo9rtL3Ps6xidL2ajiJAFqcFqVzdnk21Ec8NRtNg78Hixkm0msqikj5yBqVhKIw
	6I0W50mauC7DT4SlYTkb5A67Up7sgcmxsmiuVfcvYRX1s9ljjMQpI3AGrsisy+lpDYukG0JvuQ7
	i93R49iyB8s4UIR8Wr7HL79RR+UzaxSTgTsK7f9u7dVCiQtYYWuBeFs9LCSTiKM0a4h0og7lBGR
	w2KSyeHe49FLwi8indfM0gZGGkzOl9T/L7k+B/eVMnrZPIYNjzAF5NVEj2dR4ccsBOrvYLp7CU+
	vkKxysHSWyTm3fC4HJM6bfDkoZCaX/hCBPVNCc0csL0rcICuOLgt5JUHL7k7hVnVRdgZGO6+TKu
	K/qPQFVVvc+Rlv0AfZRNWQU25pCg47uisOy/kGaANGBSKeQq75Datn+RZzReP8jrDIMlEGxELim
	zIygK0Lz44e0ntm35KF+5qlqVmvl/DsaE5idCX56OdAzbBO8/ifbO1NGanHQOZZRxKoQw5YcHRi
	GH/kerIfYa4GPSMhwMwT+oJf26HbvCb7NopIP+zW
X-Received: by 2002:a05:693c:23c4:b0:369:efeb:3c6 with SMTP id 5a478bee46e88-36a202e9a2dmr7718659eec.3.1793232907818;
        Wed, 28 Oct 2026 17:15:07 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm11221892eec.11.2026.10.28.17.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:15:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:15:04 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>
Subject: Re: [PATCH v1 2/5] ntfs: preserve timestamps when creating hard links
Message-ID: <auKQCM-vwM5RPYDc@hyunchul-PC02>
References: <20261027093515.344799-1-liubaolin12138@163.com>
 <20261027093515.344799-3-liubaolin12138@163.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027093515.344799-3-liubaolin12138@163.com>

Hi Baolin,

On Tue, Oct 27, 2026 at 05:35:12PM +0800, Baolin Liu wrote:
> From: Xuewen Wang <wangxuewen@kylinos.cn>
> 
> ntfs_link() resets atime, mtime and ctime on both the source file and
> the destination directory after creating a hard link. This overwrites
> the source file's atime and mtime and the directory's atime.
> 
> Update only the source ctime and the destination directory mtime/ctime.
> Mark both inodes dirty so these changes are queued for writeback instead
> of relying on the earlier FILE_NAME write.
> 
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
> Tested with the complete five-patch series in QEMU. Explicitly assigned
> atime and mtime are preserved across ordinary hard-link creation and
> O_TMPFILE publication. A separate persistence check set and synced
> atime/mtime on the published file, then verified those values after
> cache eviction, remount and a fresh boot.
> 
>  fs/ntfs/namei.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
> index 0c84a5c..4442e1d 100644
> --- a/fs/ntfs/namei.c
> +++ b/fs/ntfs/namei.c
> @@ -1663,12 +1663,13 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
>  	}
>  
>  	inode_inc_iversion(dir);
> -	simple_inode_init_ts(dir);
> +	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
> +	mark_inode_dirty(dir);
>  
>  	inode_inc_iversion(vi);
> -	simple_inode_init_ts(vi);
> +	inode_set_ctime_current(vi);
> +	mark_inode_dirty(vi);

Could you also update the last_mft_change_time of $FILE_NAME? it still
appears to retains the old ctime.

Additionaly, could you run run xfstests generic/004 and generic/389?

>  
> -	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
>  	d_instantiate(dentry, vi);
>  	mutex_unlock(&dir_ni->mrec_lock);
>  	mutex_unlock(&ni->mrec_lock);
> 

-- 
Thanks,
Hyunchul
