Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753392;
	b=zjjPKGjGOxZQqCAwX4GOnWx9XcZGiq6e/puangrvnQM5V669Aez6Jj2i406Rz1CuvAzu
	 VgnqzZVQdoLLksoZxnL8rneYhrFktGXQS/alJ4zMMKOabnqjEZwRt1nUUDn3QTBHZ/Yku
	 EvyHl6qHeAS/bZ3gUZmya2cER2f509u5fx+WGnd+U81Cc96os4mTkhBApdJu8kc6G+maQ
	 s9Yzg1tkUOhB5vEYx8IymlS2uICMs0binD4wWvNcmzZVTlhEPP/KkfO9lkptVEUl7goZO
	 op7MHA1ISUFiX23REJKHBa5KPQTBCddCuXv9AEggt1X6Rw1uzvgT88qYEhcmIHqg9+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/bumM81nPiENiLh9PH/Fm40C+VENRMD3A/OuAfI8Z4s=;
	b=cTM5n3XLpj3fLWN0pUszbdyiXYy6HrUgikAcWn09VelY5XcYIxs+/+4RleIgICdqigjL
	 c+nAdZBI7/cF6PJ+rKGOozd4GwmxdSIpsJI9C3uqvOhxYQa9Q/jFiqBkbi3+1bcPCFDe1
	 hzyrW958g4++AJCJ+I+5U5HiHEeA2JczJ469oJDw4aj+O46Ulg0ve0mWgZfXqlTdqqGbW
	 /32H5AClgA5lPV994y15sH0XjqQF8HUFgUObDbNNubwcXGN63npVdkGzh7kX3d+lS8ObH
	 Nwcc3KqrUdsGdzTcoUT2AZnARRY+RViaA9DrzfzA1ekTwKmg25tJdqsSwtoSZ+YEvPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oIYlTqWT;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F44606A32D
	for <ntfs@lists.linux.dev>; Wed,  4 Nov 2026 00:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F44606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oIYlTqWT
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89ff475a152so81620b3a.3
        for <ntfs@lists.linux.dev>; Tue, 03 Nov 2026 16:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753391; x=1794358191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bumM81nPiENiLh9PH/Fm40C+VENRMD3A/OuAfI8Z4s=;
        b=oIYlTqWT09/SUly5k7UaCud1EeaQUvC7RMvXrFBnHL1wmqCrj3MF89C/VXUkjUE4MW
         MziXsexG5bZFD8/5ww69ukE2+IAW6248QEOegXPgkb4laWmAWO0mwI0jz3EE+tEVQ1jb
         Cfr9y2L8ivx3OiRBLYdUWMaYuAzn99jgCpRFzDU+cms5tT+mfREViht1fwtzFR7BmEUY
         Dk03HD8TwkWYMwWGJyQBLSx0XZUUmjmvUNI1ma0gO7kyaeuiYFznEyfPu3/P2SGS2yTn
         k3zcFNcDDLBq0JsK+rJh9aCed1fQkIO/CZh4Uf65Jxl0PqAvIJq2QDcMVS3yE1w4mgt7
         yQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753391; x=1794358191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bumM81nPiENiLh9PH/Fm40C+VENRMD3A/OuAfI8Z4s=;
        b=Pvs/KYUS729e6ZNWtD/24y4g8NHGUXo7Fay3C/1P355BsvVdwRyWhSwXeplWceZBhS
         CrNg8pTM0nMa+b6hx984NwiYwTJstsMfU1u5f1mRD9FboM1VZcVVQ5x9G47SYlxWdbGp
         J+5PPyYBd+FydoomoeyhO18+H8/EwRhBW3qvqt51vK4FEvZrypuBMBiCxA/bGST9DCgr
         DNMEnI9GMBVtScbaibM7kwr1qDZKbeMd3e2CZWyxg5LNzjEET2RY6E+sl8goWC+UZl9/
         LC7BACwJIJTqlQkcd/9FPHLDL5DUARRPaE+xDqSkDoTZOb7ik9lDBwz4lu/42lypqOPf
         6lYw==
X-Forwarded-Encrypted: i=1; AKwUvBx2NqC9M6VQ73LHFndTPhq0pYDW0qdzsGLPGdJFYR02gyvor1HegLFXS2T15DJCi3O2qYaW@lists.linux.dev
X-Gm-Message-State: APuU4Z9UpzObC7e47dhnrevKt0Du9vv2Sc4BlwgwJCBdQQWMrNc3Y9dM
	BuuBB3AMj/AcUqSFzdUH54shPfuLf17ycjEYe4uN70UMmX7dkwj4EL0V
X-Gm-Gg: AYBFou1L0LzYjR3r40A7fB4VYJRGoNrBCQifd7ng+Dc425YjTSjABf+LRuiTAGMPmWX
	sVNCB2i32qMCG/349HiNPeFlg6jFMNlif7LltKrKnvpZrDg8l9jfdbmsoKJwfenChaHbaI1y968
	oOyo5hUwVtuw1NXRLsf+n5NFVoWciQkLtjUlta1QIEh2G9RWZASB1l9N8Shc7DImrnIrOTwTopj
	6G6/G3xzrm3pxGAXqEgx1B+kOt0E26BFoiO6EHt/9Fhjm8jw/dCCiRYPEzrq6jUilwWsbPpyyrR
	a74OcXsNQGFKPykJRP6tma54JBkZr+oE4rs7gHugnLJkxUnTwAHI3QYe04xlJ/64Jqtvd7826so
	9zHZbBkFS2URbe/S0zfy/8B5RKPRMV1PgNhs1gzoeGMRE/I2kpmieVq1vgRx4Yad8oytVYdLgCm
	F/jpzBE6GVZzNLUrtBvt8QvbDNmLS6uQ4G+wOvH4rSc+wtLmSFLDA5Ked9becALMjb8juBpxtxY
	3gTZFEWYSGVtG2N7uAXyZp7Qf8LzIStsRYa+RWnIfoxfm9Ohhd4cLXIgZhCpkyzaOgAvH+AQoOQ
	hRq6izGdJcgmcCUuWSGmPsd5zorZFf6uNe88cZ8=
X-Received: by 2002:a05:6a20:914b:b0:3e2:9470:5303 with SMTP id adf61e73a8af0-3e928953948mr11828504637.15.1793753391239;
        Tue, 03 Nov 2026 16:49:51 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46440cc7sm329325a12.3.2026.11.03.16.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:49:50 -0800 (PST)
Date: Wed, 4 Nov 2026 09:49:48 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev,
	linux-mm@kvack.org, ntfs@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 17/34] ntfs: don't set SB_RDONLY after filesystem
 errors
Message-ID: <auqBLEvcurRZfGj6@hyunchul-PC02>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-17-2f44f64f0b66@kernel.org>
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
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-17-2f44f64f0b66@kernel.org>

On Thu, Oct 29, 2026 at 05:07:08PM +0100, Christian Brauner wrote:
> With errors=remount-ro every ntfs_error() ends up in ntfs_handle_error()
> which sets SB_RDONLY without holding s_umount. If that happens while the
> volume is frozen through bdev_freeze() thaw_super() sees a read-only
> superblock and leaves the s_writers rwsems locked so every writer hangs.
> 
> So set NV_Errors and a new NV_EmergencyRO flag instead like ext4 does.
> ntfs_emergency_state() returns EIO after a shutdown and EROFS after an
> error and the write side shutdown checks use it now. fallocate,
> ->set_acl(), FS_IOC_SETFSLABEL, FITRIM and ntfs_mft_record_free() get a
> check as well. Errors while mounting still set SB_RDONLY, nothing can
> freeze the superblock before SB_BORN.
> 
> NV_Errors already refuses a remount to read-write and since
> commit 521978c4f444 ("ntfs: sync the volume dirty bit with the recorded
> error state") the volume stays marked dirty once errors were recorded.
> But the dirty bit may not be on disk yet when the error hits and
> writeback is refused from then on. So a work item writes it right away
> because ntfs_error() can be called with mft records locked, and umount
> lets a pending one run first.
> 
> Unlinked inodes are left to chkdsk in that state. Their mft records are
> freed with direct bios while the index and bitmap updates of the
> deletion can't be written back anymore. And writing to an encrypted file
> only warns now. It called ntfs_error() which let anyone put the volume
> into the emergency state.
> 
> /proc/mounts keeps showing the volume read-write. Writes through file
> descriptors opened before the error fail with EROFS.
> 
> Fixes: 6251f0b0de7d ("ntfs: update super block operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
