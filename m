Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997014;
	b=HC0ZZjfjcdhqgLc4IYi66pJ4OVOyHqlNOeVtOfy76LqVO1OM6E5v+yjzhrS4IM1jXDKb
	 rzzWQDST995CVb0wGC2PWSYw527w+y2cD8OCjtJhWlmTE/0V2nb2jKxZembwYX01Vae9s
	 XMtenA/RLPxsE0wgKhagOySyyQHCe1YbM65MepYNKnk90L7tvVTpJGNZlMfrmHSwebS4O
	 gKa8G3sL3gj5IG/P+maF4NGKNfLEObCnb99ox2VYcqGb1sGJqhKzhsLSU3A9xScAMA4fK
	 sHdCYaFzYumfL1ttPti8WV4nR5VK7Fu4zeogSbBi80rJwV3Gx+hzwxYoMJ80sqzXCoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=xo0KEBYb5YdsP4eUeGdF8z45pvPxvhbxS4t170D8WZg=;
	b=kTv7vOh6T7vfDW34isWP7Nu+xEcD+BCfA0PbhggUO8R2l9iNSeBj7BY5eUJm3e+c6zdf
	 dgjukIbTOC9x7ueaDjHJb5K69NPoTTUvbYBwSAvqdW8aKzHpaw+wUlkvD4d559afAOfNs
	 zVsmBKewDErEV/bEmEA3qmBAOCwcJNOEQzkYvBBP0+xFGxAP2YWwiAn1l+ijSlvytAUq6
	 LMdMQxeOmc2wuhi4dqq4vBgTlx967umxKBCza1dOllFXX3Yka5zB4woHL33IKOXYnGNgW
	 PebgUyFviKxnlnSel7sWczMsEUutcPl0i7hyMqXjV40dRrZOFBoDIEMm63Z5ypjsxpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ew0FmS7N;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5FD606A31A
	for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 06:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F5FD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ew0FmS7N
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so4536868c88.0
        for <ntfs@lists.linux.dev>; Sun, 25 Oct 2026 23:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792997012; x=1793601812; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xo0KEBYb5YdsP4eUeGdF8z45pvPxvhbxS4t170D8WZg=;
        b=Ew0FmS7N9KAvLTNS3TG7JcC4iA2eXLjiLxdM+zv/OOFIpPAKntnhzyh1CMTLY50s/O
         RHgzJBMmShIMUSYJQ9Kjow0Bsp3RrltQ4W+H6b7sBqoXxEHX954L/qRxMvIqmITQApv5
         mFuF4BdbPua8mR851FeMVx5ORy0dznAojQG/go24d0P/R79z5SyZgCGJq3KWEcgCB2lT
         oeAn9QcG2PdXd28Qr17+mCgcywjFpK9cu/ZtUTnGEBOoRUu0NMnswm1Wqm80agK5tDl2
         btcLskn/mhPdTV/Ya5o0YbQHI5dH1riVaiMg+qszL5dLABWiYR3C7Njbw72jVlv2eAIn
         Q3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997012; x=1793601812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xo0KEBYb5YdsP4eUeGdF8z45pvPxvhbxS4t170D8WZg=;
        b=gabNhEPGGsv+W9epvbJsEK8Hv4M8Y2QZxHA1QpijnJb4NTGHTSRKmx6QN42tkFRnrb
         lSPtJMfyGpjDb+GmI0qS6gVB0T73102RTtcpnqaUhtNMaIC3A8lqUXcQwWJvDciJfiMh
         H7az9Po6CpJAbmhSyPEXbTLVYWouQJsMPRc5D+fvqVjFo7fjQvuXXJDQL82rmO4UEmC0
         R+IntHHznVFxqxB94Fg6rPsCcfC+PHCSTPHat6jXnZlYh15RXSvKms9ylFwzsnhwZR+D
         TGlDDsVZ6QT4790ZmEvgrH/dXSnRD98Urd8Om5HGd2Jns8HJmiXLRWTgvWYQ1EwJyY8s
         Wxig==
X-Gm-Message-State: AFq9FYK5cW/wsddXLnESrDlCZr5EgeoQQemEaF9/V5N6BzWwArDDsxQ3
	Skr9fuZrH1Lj4Kgitug3BzZXFT+STb2xDBQPhZivMcLcx/1sGXLwlXWu
X-Gm-Gg: AYBFou2sVnR9wNcJn6+MgtJ7E/ZdokFRIPKFytC8GS/egvq+jDMUOjvtarRrjIGlvKn
	lH/UEvUV2qlGAoCKQrL/8GfFRUALba21AFBCfozeJYz6PwVo8QjcfDRaYQbd+LHAHooHaF1EQuF
	PWQzP4wAEmhaG2KVDgk4p9ZwRiu5gOM+L1Ep6B8HIIODrzdIzm1w3cPiiy9nR99ljixRKLGDjek
	luEKOQB+w2UGYtSF+pt26xzoihomV0HWZRYceZgjJ2qxoVA38runpgefHvi3TZ44AtC2G3Tg4qi
	Rw2Syf4DAGVOZvKTUrfTi5KadNUl1mbfz7GwWdg853x4zs/lI3G26dZj+HP3uob7IDBQ8JFBkYa
	v97X39lffcFCC9/BBLAurb8aQiBehuKBFC9KhahETTiwo2mSf3DGRm8jRTJ1xbZUTjalmCFBRNu
	5IqM1cv8VeXudYc8gJSc+f5PWsyJLBk7L33YaXO09pqSIAQny1s/BxsNp/jn8koRnf6aSbdFu7v
	0/I3MmZKUFCScDzmUekQ4PHEgWxBWfnj9W+K1ld1TtGvQ==
X-Received: by 2002:a05:701b:4243:20b0:143:2967:c0b1 with SMTP id a92af1059eb24-19935437c06mr9363564c88.25.1792997012017;
        Sun, 25 Oct 2026 23:43:32 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm22893602eec.20.2026.10.25.23.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:43:31 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:43:28 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Jaidan Brashier <jobrashier@gmail.com>
Cc: ntfs@lists.linux.dev, linkinjeon@kernel.org
Subject: Re: ntfs: EIO/stale-reference errors on several volumes and on-disk
 corruption after switching from ntfs3 (Fedora 44 7.2.x)
Message-ID: <at72kIgNxnK9p1tq@hyunchul-PC02>
References: <CAPLZLeaXKkev=_EwAb679RaZ-Lcb_XQO1FsAw6RyT=M56rP7zw@mail.gmail.com>
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
In-Reply-To: <CAPLZLeaXKkev=_EwAb679RaZ-Lcb_XQO1FsAw6RyT=M56rP7zw@mail.gmail.com>

Hi Jaidan,

On Sat, Oct 24, 2026 at 03:18:21PM -0700, Jaidan Brashier wrote:
> Hello.
> Recently on Oct 2, i swapped from ntfs3 to ntfs, and since then I’ve
> seen recurring EIO/stale-reference errors on four NTFS volumes, a
> hardlink creation error, and one case of on-disk corruption (repaired
> by Windows chkdsk) on Oct 23. Logs attached.
> 
> Environment
>   OS: Fedora 44 KDE Plasma 6.7. Incidents spanned several boots
> ranging versions 7.2.8-200.fc44.x86_64 to 7.2.11-200.fc44.x86_64
>   Mount (all 4 drives):    rw,noatime,uid=1000,gid=1000,umask=00,iocharset=utf8,
>             case_sensitive,errors=continue,mft_zone_multiplier=1,
>             windows_names,native_symlink=raw,symlink=wsl
>   Devices:   corruption occurred on a SATA HDD, sdc2, NTFS 3.1, 4k clusters.
>   3 other NTFS drives are present (2 SATA SSDs and another SATA HDD).
>   smartctl and Windows chkdsk /r report no bad sectors on any drive.
> 
> Fast Startup has been disabled for months. No volume was ever flagged
> dirty. Unclean shutdowns occurred on these volumes before the switch;
> none that I know of since.
> 
> Workload
>   Previous issues: General desktop use; I don't know precisely what
> activities preceded previous errors
>   Most recent issue: Steam Linux Runtime 4.0 update (heavy I/O
> traffic, lots of temp files, symlinks and hardlinks)
> 
> Twice prior, i noted a seemingly random file on my system was refusing
> to be read, returning an I/O error.
> Both of those times, I fixed the issue by running `sync && echo 3 |
> sudo tee /proc/sys/vm/drop_caches`, unmounting the drive, and
> remounting, in some order (unsure). The underlying files were pristine
> both times, i therefore suspect the issue was only a stale reference
> in the cache.
> 
> Yesterday (Oct 23) i encountered a much more pronounced error i
> believe to be of the same kind as, or otherwise some how related to,
> the previous ones.
> The Steam client errored while updating its Linux Runtime 4.0 package.
> After some digging, i found similar EIO messages, and expecting an
> error of the same kind, i tried unmounting/remounting and clearing
> drop_caches a few times.
> Realizing that did not fix the problem this time, I shutdown my
> machine in preparation to boot up my secondary Windows install to run
> chkdsk. Shutdown hung for ~10 minutes (normally ~10 seconds), likely
> on the NTFS volume.
> 
> Booting into windows, I ran `chkdsk /f /r /x` on the relevant drive.
> chkdsk cleaned up the following errors, and more:
>   - ~350 index entries deleted from $R of file 0x1A ($Extend\$Reparse)
>   - Many $I30 entries deleted that pointed at nonexistent records,
>     including runtime library names and Steam appmanifest/appworkshop files
>   - "Recovering orphaned file appworkshop_32470.acf.async217386.tmp
>     (and two more .tmp names) into directory 2B582".
>   - Several libraries (libcurl, libcrypto, libSDL3) recovered into two
>     directories each. Expected hardlinks
>   - Free space marked as allocated in the volume and MFT bitmaps
>   - No bad sectors, cross-links, or security descriptor errors
> 
> After this process completed, i ran `chkdsk /f` on all my other
> drives, which cleaned up some small errors but nothing major.
> 
> Attached are 3 logs, of every ntfs error my system has logged since
> Oct 2, the shutdown hang, and all the times i cleared drop_caches,
> respectively. You may note that errors ocurred several more times than
> i noticed and attempted to fix them.
> 
> I made a few amateur attempts to recreate the issue, hypothesizing
> that it might relate to moving and renaming, temp files, symlinks,
> hardlinks, and possibly full MFT tables, but i was never able to.
> 
> If necessary, i can supply the full chkdsk output too, and i'd be
> happy to test a theoretical patch or supply further debug info.
> 
> I wasn't sure who to address, so I addressed all three.

Are you running a service that periodically issues FITRIM, such as
fstrim.timer? A patch fixing an incorrect FITRIM dicard range was
released[1], but it is not included in your kernel version. Some of
the corruption patterns appear consistent with this bug. 

Could you check whether FITRIM ran before the corruption occurred?

[1]: https://lore.kernel.org/stable/20261023163719.159193934@linuxfoundation.org/
-- 
Thanks,
Hyunchul
