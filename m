Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080885;
	b=i1noipUSHUQrw5tsZJWO4F4NF4M42MKAiLe0EU5w8s9xFLXwBewi4EiPtfExd0bRi7IJ
	 1Q/ozNrilaTrF/IFBcBxDdkLdPfC3azj9Rwgav79AJCTthm5m0C7pUshdmlWJW47FVf95
	 S+NtpOcFft6VV63V6b6f2cq/e9zISyY6GaXEZslNYcoOEDHe6lHXoylOGDxQc7oUzifc5
	 T2EvkK00+/+8MZJugaz88oigk7QIxHOJyA9Gt6RXJP6/1tznw1628N2ofLYAoKrhJ985u
	 w4dO0KH7kB5UYVMpxaoHefYiQ+L2p2/NyvsocZLcLFthjWzahditYBse4cn6vDcubpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=gptwUBFFFZ6ZpvVlKNTSbQFzkCpzA0Y82mAGyFsTfq4=;
	b=0yjLkoL6Zj8/1ro1eHrMZ5vYTH9mrjMseAukGFgEgycEzT2DDx+aj6pnNgQqpoyiJC7p
	 1tokuGLCbW88AHxEgBW1WV0lu7G/f7CFHRigyZnDOnltYys7cPnKoiBcp29/eGuDkK5On
	 3LHyH5GRy8jC+p4zCdJHGOBrgv3zvGHDhLJw8eMpOrMmatdenhXZcPHFHAa2sgvPCd8LX
	 EDbRPhWp/shBebnl6MmiqhFcgN1fIxTysX3MDrTx/Nwf2widrxdW/EsK8dVFlqlGd4V00
	 n0zhi4M2/B1Bm69rMECJphg809/c3heAc02Q6SuyIlxTEkOV0kHsYxB/kBS+qu7MfSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UdeoLH6Z;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A473E606A31A
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 06:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A473E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UdeoLH6Z
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36661f953e4so6959563eec.1
        for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 23:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080884; x=1793685684; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gptwUBFFFZ6ZpvVlKNTSbQFzkCpzA0Y82mAGyFsTfq4=;
        b=UdeoLH6ZVDPEk2KI/hiTpnXjLADSPi1OeAsc13u7LeDt52/vhDSCuuHs0utrLKU8Rb
         Yk1j7TITqOU5pXwytIGKsITU/5WNedCrFC7Dv2DS5jQrL3Pln7GhuTYtR4xi5FRf5/hU
         oM6lw6xDn2CyWwkr6NgcucNWMHb/AMobwO5FVbYpbdhS40b9DGCY8aFg/9aYBCiw9mm0
         CIFrwbK+ogzSwrw74p4v7+tv8EMbRdFwtbg/jXLzpOTYaVb1q0kfTr2sq3drtekA6M+2
         WEelKPBZAL/f7OlP8YT3iv8Vb8JrmXPxhqYrz15FIGUdDxIVLBp6Tim6n+74fNngb4Mb
         nlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080884; x=1793685684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gptwUBFFFZ6ZpvVlKNTSbQFzkCpzA0Y82mAGyFsTfq4=;
        b=EovxJvY+SXp1FvJsUuJsqCU103c8cO9W/9oHEmIYUKvb0VTeommdTjFXhWFgE02LaL
         Ei/fAIC5Q4vLxoeuGyMQPbBVwi9/6AGhGssCuQk92hB63TUn/Bq1TA+tEoCskRKewwah
         8DcecljOcvxtdPtTdi31cnQizOpweKKuOe0KwQ2lxBYKXH6fOB2X+TKGhbmkO8JNG9bi
         Fo9qx8b5QWlunrPbA5ixXErFF0ZYiJ7YuEVZL0iC3tIQiQOpaav7oDWig2zSsd1prp0c
         Cha1ManzIVfkZ++7J5nW3b+l7KWjG/lQItV2OzS4FkmbRg6ClutoLgy6tHzeS/NklgrD
         6z/A==
X-Gm-Message-State: AFq9FYLV6nKNHP/zMCrMCwZA2ljPYUZzc0aU+tMnLlvvYEr/+R1uA/DU
	6MfciM/2mAZB93J6IWpjvmGnNMAGImffS765KLsmKDoyQKqGvwAOJUduIJRmQ/y9
X-Gm-Gg: AYBFou2saRhjlHJKixTY9DQ+qA4YZym7bXiRLzObL8HDtx6L344a1ofg29Ef3xo/WwX
	nG5bj5WN5t1uASEiJGGXwXJiLRDqljAMm6nRJFck5PgWwHWQ9VvEJZaTjbqEWqMzuEy1GOkDfsD
	CRsO/eUk8VL29yJqQWCCwpQYcaE/2TWRbWkjAcm01TrA/W/ha2j5+Ym0pdiQrazEOUbP8ohMGpE
	fLwQIPc2CF+klvZ+KFECkqCXgAZwN2SfL5hyi6M53C5RdOZ8PMBieA1AzrTXgPxWOFlGlriUHBS
	NbnBnZKfxu4+Wchqy3RB1qM3jDT29U2qv9KmCVdFjy2SIEMmhHL9VTcHx1lTYe7IokzkPrRLmYi
	vpen52vWcyKAczg/Wmk4i7Mw5TLk3f0OsI628TeSYGdXqdwbri/HkUH0CYAK+xbL1rEfAiiRaGs
	WsywK8VkDY2AlPf3d0MM1GNZEAff3nIvC1E7xORcidk1RVzZS1UzfaOKh/crmhoDQDiI/J0J0UO
	5y0g+9RyIcOib3FWsLKmJjHJg9lq1TpCWAUXVwArIRlmPylpgpiJImaJZgIKDZ8aUo=
X-Received: by 2002:a05:7301:514a:b0:35e:6eae:c01a with SMTP id 5a478bee46e88-369e84bd11dmr13218919eec.19.1793080883237;
        Mon, 26 Oct 2026 23:01:23 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm34656833eec.21.2026.10.26.23.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:01:22 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:01:20 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Jaidan Brashier <jobrashier@gmail.com>
Cc: ntfs@lists.linux.dev, linkinjeon@kernel.org
Subject: Re: ntfs: EIO/stale-reference errors on several volumes and on-disk
 corruption after switching from ntfs3 (Fedora 44 7.2.x)
Message-ID: <auA-MOGIj-J4dLGF@hyunchul-PC02>
References: <CAPLZLeaXKkev=_EwAb679RaZ-Lcb_XQO1FsAw6RyT=M56rP7zw@mail.gmail.com>
 <at72kIgNxnK9p1tq@hyunchul-PC02>
 <CAPLZLeYo6AhBLcCBeZgDAs5Duv08B4i1rdFNFH5ikTXhcueMAg@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPLZLeYo6AhBLcCBeZgDAs5Duv08B4i1rdFNFH5ikTXhcueMAg@mail.gmail.com>

On Mon, Oct 26, 2026 at 09:55:17PM -0700, Jaidan Brashier wrote:
> Hello Hyunchul,
> Thank you for your timely response!
> 
> I do have fstrim.timer enabled. According to my logs, since Oct 2, it
> has issued fstrim requests 4 times:
> Oct 05 01:05:41,
> Oct 12 06:59:03,
> Oct 19 09:35:47,
> Oct 26 01:20:31 (today).
> 
> Cross-referencing these times with when the issues occurred, I do not
> believe there is significant correlation.
> 
> Additionally, fstrim.timer only operates on drives that have
> discarding enabled, which my two HDDs do not, including sdc2, the site
> of the major corruption.
> The fstrim activity logs confirm that while it has been operating, it
> has only operated on my SSDs; therefore, it cannot be the sole culprit
> behind the issue that has spanned both drive types.
> I can post these logs as well if you'd like.

Thanks, this is very useful information.
However, just to double-check, could you please share those logs and
the output of the following command?

lsblk -o NAME,TYPE,FSTYPE,DISC-GRAN,DISC-MAX,MOUNTPOINTS

> 
> On Sun, Oct 25, 2026 at 11:43 PM Hyunchul Lee <hyc.lee@gmail.com> wrote:
> >
> > Hi Jaidan,
> >
> > On Sat, Oct 24, 2026 at 03:18:21PM -0700, Jaidan Brashier wrote:
> > > Hello.
> > > Recently on Oct 2, i swapped from ntfs3 to ntfs, and since then I’ve
> > > seen recurring EIO/stale-reference errors on four NTFS volumes, a
> > > hardlink creation error, and one case of on-disk corruption (repaired
> > > by Windows chkdsk) on Oct 23. Logs attached.
> > >
> > > Environment
> > >   OS: Fedora 44 KDE Plasma 6.7. Incidents spanned several boots
> > > ranging versions 7.2.8-200.fc44.x86_64 to 7.2.11-200.fc44.x86_64
> > >   Mount (all 4 drives):    rw,noatime,uid=1000,gid=1000,umask=00,iocharset=utf8,
> > >             case_sensitive,errors=continue,mft_zone_multiplier=1,
> > >             windows_names,native_symlink=raw,symlink=wsl
> > >   Devices:   corruption occurred on a SATA HDD, sdc2, NTFS 3.1, 4k clusters.
> > >   3 other NTFS drives are present (2 SATA SSDs and another SATA HDD).
> > >   smartctl and Windows chkdsk /r report no bad sectors on any drive.
> > >
> > > Fast Startup has been disabled for months. No volume was ever flagged
> > > dirty. Unclean shutdowns occurred on these volumes before the switch;
> > > none that I know of since.
> > >
> > > Workload
> > >   Previous issues: General desktop use; I don't know precisely what
> > > activities preceded previous errors
> > >   Most recent issue: Steam Linux Runtime 4.0 update (heavy I/O
> > > traffic, lots of temp files, symlinks and hardlinks)
> > >
> > > Twice prior, i noted a seemingly random file on my system was refusing
> > > to be read, returning an I/O error.
> > > Both of those times, I fixed the issue by running `sync && echo 3 |
> > > sudo tee /proc/sys/vm/drop_caches`, unmounting the drive, and
> > > remounting, in some order (unsure). The underlying files were pristine
> > > both times, i therefore suspect the issue was only a stale reference
> > > in the cache.
> > >
> > > Yesterday (Oct 23) i encountered a much more pronounced error i
> > > believe to be of the same kind as, or otherwise some how related to,
> > > the previous ones.
> > > The Steam client errored while updating its Linux Runtime 4.0 package.
> > > After some digging, i found similar EIO messages, and expecting an
> > > error of the same kind, i tried unmounting/remounting and clearing
> > > drop_caches a few times.
> > > Realizing that did not fix the problem this time, I shutdown my
> > > machine in preparation to boot up my secondary Windows install to run
> > > chkdsk. Shutdown hung for ~10 minutes (normally ~10 seconds), likely
> > > on the NTFS volume.
> > >
> > > Booting into windows, I ran `chkdsk /f /r /x` on the relevant drive.
> > > chkdsk cleaned up the following errors, and more:
> > >   - ~350 index entries deleted from $R of file 0x1A ($Extend\$Reparse)
> > >   - Many $I30 entries deleted that pointed at nonexistent records,
> > >     including runtime library names and Steam appmanifest/appworkshop files
> > >   - "Recovering orphaned file appworkshop_32470.acf.async217386.tmp
> > >     (and two more .tmp names) into directory 2B582".
> > >   - Several libraries (libcurl, libcrypto, libSDL3) recovered into two
> > >     directories each. Expected hardlinks
> > >   - Free space marked as allocated in the volume and MFT bitmaps
> > >   - No bad sectors, cross-links, or security descriptor errors
> > >
> > > After this process completed, i ran `chkdsk /f` on all my other
> > > drives, which cleaned up some small errors but nothing major.
> > >
> > > Attached are 3 logs, of every ntfs error my system has logged since
> > > Oct 2, the shutdown hang, and all the times i cleared drop_caches,
> > > respectively. You may note that errors ocurred several more times than
> > > i noticed and attempted to fix them.
> > >
> > > I made a few amateur attempts to recreate the issue, hypothesizing
> > > that it might relate to moving and renaming, temp files, symlinks,
> > > hardlinks, and possibly full MFT tables, but i was never able to.
> > >
> > > If necessary, i can supply the full chkdsk output too, and i'd be
> > > happy to test a theoretical patch or supply further debug info.
> > >
> > > I wasn't sure who to address, so I addressed all three.
> >
> > Are you running a service that periodically issues FITRIM, such as
> > fstrim.timer? A patch fixing an incorrect FITRIM dicard range was
> > released[1], but it is not included in your kernel version. Some of
> > the corruption patterns appear consistent with this bug.
> >
> > Could you check whether FITRIM ran before the corruption occurred?
> >
> > [1]: https://lore.kernel.org/stable/20261023163719.159193934@linuxfoundation.org/
> > --
> > Thanks,
> > Hyunchul

-- 
Thanks,
Hyunchul
