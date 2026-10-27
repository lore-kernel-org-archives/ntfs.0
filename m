Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092919;
	b=W7BFaarhEoPeAFN4BEPdmRQS0QsZS4xmjCPQ4l5pJAuyOnYN7cyDI31uw7WquNVmkvRg
	 5kYFXlWBQUE1dc8AFi7s1Km9MreLnZImMq5GlrxSe4/lPAeyNUk9rzm4U+c20n4y+n0qq
	 E3/1sS1ceZCyeWUtWa6SvQqyZmiJQzDDAScmYHk2G6prScJ7yb+Qm5XpeMdk3TffpQ6ch
	 MlElvcd13cfVCw/xPOp8r5LqlUEUpNYUYbXS6b0dMKDILw2GRnDmx6B24l3DgEnMiANNA
	 AFyExzZ7ye2pg57BkovNJ+9y0Z8ieFQjvxFpGvwP8KvuhpHznrqP83QI0zBlllUfcIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=u0gsZp+mayowBBrYxEOuvrGKUST6dpUBJOf85BPfTKc=;
	b=PF+q5UGosN+SIa8fAxYe8RCpA1mxEdbjmQTVMKeOEXLjXjXyo/63G4eS6ZJjzm2GC6um
	 TALQu9C+YXPDuxC/qmq9bJEdk+0qVT2RPeEPMN6H1AlOobKIZcMXFwU57L083mFvaQJPw
	 nud/35cmeBk3fGhrdlJb3gFu0UC8Genprcq8CaxEE2IrELwk/8b2m40YDvlWxoLUObdGM
	 gGfxfppwLml1oV6f2Y/kroU7lSM82f11vUH386hd5LthFMJkh2Oqcgtms9FjHgFA5Sfos
	 xg3WC9snwT/JJaajDkdWtzmbkz5+70yxwHJSqM41RvWeCyWGqzO0J4Wpp+iWAQSAy8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VPaWhyAf;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB68606A31A
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 09:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB68606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VPaWhyAf
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so2103364a91.1
        for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 02:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793092918; x=1793697718; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0gsZp+mayowBBrYxEOuvrGKUST6dpUBJOf85BPfTKc=;
        b=VPaWhyAfm038WUCNAAT4uAqYyDOZsCVvvN9LPOjaRCFEEmzNgaqncalAwAkow7U6/H
         jcEytEWc0Tea0jTKJDdwxJQ56hQRE+ogDbswKwMenBDJQAaP1tkMXxMWquDOVyjhZCOF
         DVWe3ZoPbIDmRO1B2Ym8bNJ1d+iLM9mJqv41MN95j64YqgGYArR5NDh0jZahhRb/EorR
         lqONjMMk1qoZcT19053iEwY+nulkHfNaJFjGv86705v4IZrnUCSxuXSJI9NkT1wEJ/fl
         BQ1Lx54Zoiw81ySIUWbVqB7oJok4qIsqNXAM8FZBf8/yzopUbz0PNVFV0Hgc9O030+26
         Y5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092918; x=1793697718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u0gsZp+mayowBBrYxEOuvrGKUST6dpUBJOf85BPfTKc=;
        b=FkPRN8Yx1kEVWQcfjjuFQ76AuQUlfxUw1dLMoXFJubZb11AKPsQIokBRJRSaMMlmNd
         JuAZXNORSjxfNzqDDO5hlhV7jdtmSzudnZxLRFJiKj53nu708w4GAs9MOcok/zZC57qO
         mBVbis/zD/Sz2S9wRodMLPGSFPugY41cECxPcyYPvx7qEy6Ucm5FqfdVLf3dn0Uia5M4
         urgaY7KaCKfvHUboKjXTmt/JGJVp9uBXzJLpJ7oNmyhP6HOadb24hiME4bp7wS4cxmlW
         L8gelFQJIMCyL8zjfDrWBhPSnMJAULkCCagze+W9cKyr86W5WOvPeA8OSDnstz1zoY6K
         YKeg==
X-Gm-Message-State: AFq9FYJgKZE4PVR835ZFoxc4sIVSw+B4mva4C0SxCkYYj/uLs2Oe8FEE
	pELKKtak6eFj1lGskdRgrJ9NL34n02yqVV/d9Zxt7Vk3XpkOJyiv1N1r
X-Gm-Gg: AYBFou1OM32OLjFRahXxG8kXF7lH8b6ap9DDG5dDggbJeFZOhl+v6wry3CP2G2zD9SD
	ElbSxHhNBtxH4abfXw7al/9oQnCMYZvxbGf3LHhFmwSHJ5p+e2lQrseSd1VyGm/DBu4meFnp9K9
	5ea+EZjFP+xRw28imdUl1cRzYuXLnj4NKhtLQQyowXrlq/HQ6hMtljKKQ9rudRYfTL5SDqG92o9
	TgGmf+qkakxkrA8tkGkukyKxi0DgAiZ6M3d6h84aXJkkZmKjyhiVzRRmNRkTH9fvk6tKMK4xoFR
	sWqH9ZuMF/7DxknFfjroEOfluDJRIpQw76YPrv2CWpndQdcG/CkdTGSsW7VexodgPYF77o5+FYl
	MOvujKMQsU0KOpk1clKfysCt2RWlGaB1VuW/XpfmzoXzl0V7uPYK3/HSvNW2hNrkdTq/BCKAuKB
	TtgWZle6UfIG7KCngh1YvixnrzmnbS/x5bvkXsX/LFu1vPrJa/G7dqhENU35mM0nCHddubjo6n+
	YzOEK0oL6+xyb7RY0OFcpOFelOIa2HKhj33emiDPVwfd6v2N+te+JbO5LK0qgqzFpbsrg/CIq+j
	rq8e0ui2DJti/ja/ua8=
X-Received: by 2002:a17:90b:35c5:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3adeae6d8bemr7107163a91.51.1793092917356;
        Tue, 27 Oct 2026 02:21:57 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404426c2sm2996461a91.7.2026.10.27.02.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 18:21:54 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Jaidan Brashier <jobrashier@gmail.com>
Cc: ntfs@lists.linux.dev, linkinjeon@kernel.org
Subject: Re: ntfs: EIO/stale-reference errors on several volumes and on-disk
 corruption after switching from ntfs3 (Fedora 44 7.2.x)
Message-ID: <auBtMq76Vj47NGPu@hyunchul-PC02>
References: <CAPLZLeaXKkev=_EwAb679RaZ-Lcb_XQO1FsAw6RyT=M56rP7zw@mail.gmail.com>
 <at72kIgNxnK9p1tq@hyunchul-PC02>
 <CAPLZLeYo6AhBLcCBeZgDAs5Duv08B4i1rdFNFH5ikTXhcueMAg@mail.gmail.com>
 <auA-MOGIj-J4dLGF@hyunchul-PC02>
 <CAPLZLeaVAoFefe06b+7MaoLHVMJbAZ+PaDuVkiPMAry6TKpE0w@mail.gmail.com>
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
In-Reply-To: <CAPLZLeaVAoFefe06b+7MaoLHVMJbAZ+PaDuVkiPMAry6TKpE0w@mail.gmail.com>

On Mon, Oct 26, 2026 at 11:21:26PM -0700, Jaidan Brashier wrote:
> I accidentally addressed only Hyunchul in my last message. I have
> copied to reply properly including the mailing list, sorry for
> duplicate mail:
> 
> Absolutely!
> Find attached all the logs i looked at plus the one you requested
> 

I believe FITRIM caused the corruptions on sda2 and sdb2.

The logs show that FITRIM was applied to both /dev/sda2 and /dev/sdb2,
and the NTFS corruption messages appear after that:

Oct 05 01:05:41 GRIDBUG systemd[1]: Starting fstrim.service - Discard unused blocks on filesystems from /etc/fstab...
Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Chronos: 98.2 GiB (105433657344 bytes) trimmed on /dev/sdb2
Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Xtra: 227.7 GiB (244457193472 bytes) trimmed on /dev/sda2

2026-10-05T01:05:46-07:00 GRIDBUG kernel: ntfs: (device sdb2): ntfs_lookup(): Found stale reference to inode 0x2ef8 (reference sequence number = 0x635, inode sequence number = 0x0), returning -EIO. Run chkdsk.
2026-10-06T21:35:01-07:00 GRIDBUG kernel: ntfs: (device sda2): ntfs_mapping_pairs_decompress(): Corrupt mapping pairs array in non-resident attribute.
2026-10-06T21:35:01-07:00 GRIDBUG kernel: ntfs: (device sda2): ntfs_non_resident_attr_expand(): ntfs_attr_map_whole_runlist failed

However, it is difficult to determine the casue of the sdc2 failure from
the provided logs.

Would it possible to provide the complete, unedited journal logs
from 2026-10-01?  If so, we would really appreciate it.
* journalctl --list-boots
* journalctl -k -b <boot-id>
* journalctl -b <boot-id>
* the output of lsblk -o NAME,PHY-SEC,LOG-SEC

> On Mon, Oct 26, 2026 at 11:01 PM Hyunchul Lee <hyc.lee@gmail.com> wrote:
> >
> > On Mon, Oct 26, 2026 at 09:55:17PM -0700, Jaidan Brashier wrote:
> > > Hello Hyunchul,
> > > Thank you for your timely response!
> > >
> > > I do have fstrim.timer enabled. According to my logs, since Oct 2, it
> > > has issued fstrim requests 4 times:
> > > Oct 05 01:05:41,
> > > Oct 12 06:59:03,
> > > Oct 19 09:35:47,
> > > Oct 26 01:20:31 (today).
> > >
> > > Cross-referencing these times with when the issues occurred, I do not
> > > believe there is significant correlation.
> > >
> > > Additionally, fstrim.timer only operates on drives that have
> > > discarding enabled, which my two HDDs do not, including sdc2, the site
> > > of the major corruption.
> > > The fstrim activity logs confirm that while it has been operating, it
> > > has only operated on my SSDs; therefore, it cannot be the sole culprit
> > > behind the issue that has spanned both drive types.
> > > I can post these logs as well if you'd like.
> >
> > Thanks, this is very useful information.
> > However, just to double-check, could you please share those logs and
> > the output of the following command?
> >
> > lsblk -o NAME,TYPE,FSTYPE,DISC-GRAN,DISC-MAX,MOUNTPOINTS
> >
> > >
> > > On Sun, Oct 25, 2026 at 11:43 PM Hyunchul Lee <hyc.lee@gmail.com> wrote:
> > > >
> > > > Hi Jaidan,
> > > >
> > > > On Sat, Oct 24, 2026 at 03:18:21PM -0700, Jaidan Brashier wrote:
> > > > > Hello.
> > > > > Recently on Oct 2, i swapped from ntfs3 to ntfs, and since then I’ve
> > > > > seen recurring EIO/stale-reference errors on four NTFS volumes, a
> > > > > hardlink creation error, and one case of on-disk corruption (repaired
> > > > > by Windows chkdsk) on Oct 23. Logs attached.
> > > > >
> > > > > Environment
> > > > >   OS: Fedora 44 KDE Plasma 6.7. Incidents spanned several boots
> > > > > ranging versions 7.2.8-200.fc44.x86_64 to 7.2.11-200.fc44.x86_64
> > > > >   Mount (all 4 drives):    rw,noatime,uid=1000,gid=1000,umask=00,iocharset=utf8,
> > > > >             case_sensitive,errors=continue,mft_zone_multiplier=1,
> > > > >             windows_names,native_symlink=raw,symlink=wsl
> > > > >   Devices:   corruption occurred on a SATA HDD, sdc2, NTFS 3.1, 4k clusters.
> > > > >   3 other NTFS drives are present (2 SATA SSDs and another SATA HDD).
> > > > >   smartctl and Windows chkdsk /r report no bad sectors on any drive.
> > > > >
> > > > > Fast Startup has been disabled for months. No volume was ever flagged
> > > > > dirty. Unclean shutdowns occurred on these volumes before the switch;
> > > > > none that I know of since.
> > > > >
> > > > > Workload
> > > > >   Previous issues: General desktop use; I don't know precisely what
> > > > > activities preceded previous errors
> > > > >   Most recent issue: Steam Linux Runtime 4.0 update (heavy I/O
> > > > > traffic, lots of temp files, symlinks and hardlinks)
> > > > >
> > > > > Twice prior, i noted a seemingly random file on my system was refusing
> > > > > to be read, returning an I/O error.
> > > > > Both of those times, I fixed the issue by running `sync && echo 3 |
> > > > > sudo tee /proc/sys/vm/drop_caches`, unmounting the drive, and
> > > > > remounting, in some order (unsure). The underlying files were pristine
> > > > > both times, i therefore suspect the issue was only a stale reference
> > > > > in the cache.
> > > > >
> > > > > Yesterday (Oct 23) i encountered a much more pronounced error i
> > > > > believe to be of the same kind as, or otherwise some how related to,
> > > > > the previous ones.
> > > > > The Steam client errored while updating its Linux Runtime 4.0 package.
> > > > > After some digging, i found similar EIO messages, and expecting an
> > > > > error of the same kind, i tried unmounting/remounting and clearing
> > > > > drop_caches a few times.
> > > > > Realizing that did not fix the problem this time, I shutdown my
> > > > > machine in preparation to boot up my secondary Windows install to run
> > > > > chkdsk. Shutdown hung for ~10 minutes (normally ~10 seconds), likely
> > > > > on the NTFS volume.
> > > > >
> > > > > Booting into windows, I ran `chkdsk /f /r /x` on the relevant drive.
> > > > > chkdsk cleaned up the following errors, and more:
> > > > >   - ~350 index entries deleted from $R of file 0x1A ($Extend\$Reparse)
> > > > >   - Many $I30 entries deleted that pointed at nonexistent records,
> > > > >     including runtime library names and Steam appmanifest/appworkshop files
> > > > >   - "Recovering orphaned file appworkshop_32470.acf.async217386.tmp
> > > > >     (and two more .tmp names) into directory 2B582".
> > > > >   - Several libraries (libcurl, libcrypto, libSDL3) recovered into two
> > > > >     directories each. Expected hardlinks
> > > > >   - Free space marked as allocated in the volume and MFT bitmaps
> > > > >   - No bad sectors, cross-links, or security descriptor errors
> > > > >
> > > > > After this process completed, i ran `chkdsk /f` on all my other
> > > > > drives, which cleaned up some small errors but nothing major.
> > > > >
> > > > > Attached are 3 logs, of every ntfs error my system has logged since
> > > > > Oct 2, the shutdown hang, and all the times i cleared drop_caches,
> > > > > respectively. You may note that errors ocurred several more times than
> > > > > i noticed and attempted to fix them.
> > > > >
> > > > > I made a few amateur attempts to recreate the issue, hypothesizing
> > > > > that it might relate to moving and renaming, temp files, symlinks,
> > > > > hardlinks, and possibly full MFT tables, but i was never able to.
> > > > >
> > > > > If necessary, i can supply the full chkdsk output too, and i'd be
> > > > > happy to test a theoretical patch or supply further debug info.
> > > > >
> > > > > I wasn't sure who to address, so I addressed all three.
> > > >
> > > > Are you running a service that periodically issues FITRIM, such as
> > > > fstrim.timer? A patch fixing an incorrect FITRIM dicard range was
> > > > released[1], but it is not included in your kernel version. Some of
> > > > the corruption patterns appear consistent with this bug.
> > > >
> > > > Could you check whether FITRIM ran before the corruption occurred?
> > > >
> > > > [1]: https://lore.kernel.org/stable/20261023163719.159193934@linuxfoundation.org/
> > > > --
> > > > Thanks,
> > > > Hyunchul
> >
> > --
> > Thanks,
> > Hyunchul

> Destructacon@GRIDBUG:~$ systemctl status fstrim.timer
> ● fstrim.timer - Discard unused filesystem blocks once a week
>      Loaded: loaded (/usr/lib/systemd/system/fstrim.timer; enabled; preset: enabled)
>      Active: active (waiting) since Sun 2026-10-25 18:29:37 PDT; 1 day 4h ago
>  Invocation: 2c41b84c97d3454dbe41de1934c43f4a
>     Trigger: Mon 2026-11-02 00:22:00 PST; 6 days left
>    Triggers: ● fstrim.service
>        Docs: man:fstrim
> 
> Oct 25 18:29:37 GRIDBUG systemd[1]: Started fstrim.timer - Discard unused filesystem blocks once a week.
> Destructacon@GRIDBUG:~$ systemctl list-timers | grep fstrim
> Mon 2026-11-02 00:22:00 PST   6 days Mon 2026-10-26 01:20:31 PDT      12h ago fstrim.timer                 fstrim.service
> Destructacon@GRIDBUG:~$ journalctl -u fstrim.service --since "2026-10-02"
> Oct 05 01:05:41 GRIDBUG systemd[1]: Starting fstrim.service - Discard unused blocks on filesystems from /etc/fstab...
> Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Chronos: 98.2 GiB (105433657344 bytes) trimmed on /dev/sdb2
> Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Xtra: 227.7 GiB (244457193472 bytes) trimmed on /dev/sda2
> Oct 05 01:13:29 GRIDBUG fstrim[234714]: /boot/efi: 578.7 MiB (606842880 bytes) trimmed on /dev/nvme0n1p1
> Oct 05 01:13:29 GRIDBUG fstrim[234714]: /boot: 1.3 GiB (1381433344 bytes) trimmed on /dev/nvme0n1p2
> Oct 05 01:13:29 GRIDBUG fstrim[234714]: /: 688.8 GiB (739545485312 bytes) trimmed on /dev/nvme0n1p3
> Oct 05 01:13:29 GRIDBUG systemd[1]: fstrim.service: Deactivated successfully.
> Oct 05 01:13:29 GRIDBUG systemd[1]: Finished fstrim.service - Discard unused blocks on filesystems from /etc/fstab.
> Oct 05 01:13:29 GRIDBUG systemd[1]: fstrim.service: Consumed 2.245s CPU time over 7min 47.949s wall clock time, 46.1M memory peak.
> -- Boot adb54a13efe149098d12251c0fdaad43 --
> Oct 12 06:59:03 GRIDBUG systemd[1]: Starting fstrim.service - Discard unused blocks on filesystems from /etc/fstab...
> Oct 12 07:06:37 GRIDBUG fstrim[66865]: /mnt/Chronos: 98.2 GiB (105430089728 bytes) trimmed on /dev/sdb2
> Oct 12 07:06:37 GRIDBUG fstrim[66865]: /mnt/Xtra: 226.5 GiB (243247431680 bytes) trimmed on /dev/sda2
> Oct 12 07:06:37 GRIDBUG fstrim[66865]: /boot/efi: 578.7 MiB (606842880 bytes) trimmed on /dev/nvme0n1p1
> Oct 12 07:06:37 GRIDBUG fstrim[66865]: /boot: 1.3 GiB (1386246144 bytes) trimmed on /dev/nvme0n1p2
> Oct 12 07:06:37 GRIDBUG fstrim[66865]: /: 665.8 GiB (714850619392 bytes) trimmed on /dev/nvme0n1p3
> Oct 12 07:06:37 GRIDBUG systemd[1]: fstrim.service: Deactivated successfully.
> Oct 12 07:06:37 GRIDBUG systemd[1]: Finished fstrim.service - Discard unused blocks on filesystems from /etc/fstab.
> Oct 12 07:06:37 GRIDBUG systemd[1]: fstrim.service: Consumed 2.188s CPU time over 7min 33.638s wall clock time, 43.6M memory peak.
> -- Boot 96460ff0097c418784dd3cf8e398bbbf --
> Oct 19 09:35:47 GRIDBUG systemd[1]: Starting fstrim.service - Discard unused blocks on filesystems from /etc/fstab...
> Oct 19 09:43:16 GRIDBUG fstrim[65662]: /mnt/Chronos: 98.2 GiB (105427058688 bytes) trimmed on /dev/sdb2
> Oct 19 09:43:16 GRIDBUG fstrim[65662]: /mnt/Xtra: 226.3 GiB (242984091648 bytes) trimmed on /dev/sda2
> Oct 19 09:43:16 GRIDBUG fstrim[65662]: /boot/efi: 578.7 MiB (606842880 bytes) trimmed on /dev/nvme0n1p1
> Oct 19 09:43:16 GRIDBUG fstrim[65662]: /boot: 1.3 GiB (1385877504 bytes) trimmed on /dev/nvme0n1p2
> Oct 19 09:43:16 GRIDBUG fstrim[65662]: /: 655.2 GiB (703479914496 bytes) trimmed on /dev/nvme0n1p3
> Oct 19 09:43:16 GRIDBUG systemd[1]: fstrim.service: Deactivated successfully.
> Oct 19 09:43:16 GRIDBUG systemd[1]: Finished fstrim.service - Discard unused blocks on filesystems from /etc/fstab.
> Oct 19 09:43:16 GRIDBUG systemd[1]: fstrim.service: Consumed 2.812s CPU time over 7min 28.705s wall clock time, 46.3M memory peak.
> -- Boot 29d2f12d90914b1c80ca78c8427aed64 --
> Oct 26 01:20:31 GRIDBUG systemd[1]: Starting fstrim.service - Discard unused blocks on filesystems from /etc/fstab...
> Oct 26 01:27:33 GRIDBUG fstrim[44163]: /mnt/Chronos: 95.9 GiB (102955753472 bytes) trimmed on /dev/sdb2
> Oct 26 01:27:33 GRIDBUG fstrim[44163]: /mnt/Xtra: 225.6 GiB (242284789760 bytes) trimmed on /dev/sda2
> Oct 26 01:27:33 GRIDBUG fstrim[44163]: /boot/efi: 578.7 MiB (606842880 bytes) trimmed on /dev/nvme0n1p1
> Oct 26 01:27:33 GRIDBUG fstrim[44163]: /boot: 1.3 GiB (1385877504 bytes) trimmed on /dev/nvme0n1p2
> Oct 26 01:27:33 GRIDBUG fstrim[44163]: /: 634.3 GiB (681097322496 bytes) trimmed on /dev/nvme0n1p3
> Oct 26 01:27:33 GRIDBUG systemd[1]: fstrim.service: Deactivated successfully.
> Oct 26 01:27:33 GRIDBUG systemd[1]: Finished fstrim.service - Discard unused blocks on filesystems from /etc/fstab.
> Oct 26 01:27:33 GRIDBUG systemd[1]: fstrim.service: Consumed 2.426s CPU time over 7min 1.609s wall clock time, 46.8M memory peak.
> Destructacon@GRIDBUG:~$ lsblk -D
> NAME        DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
> sda                0      512B       2G         0
> ├─sda1             0      512B       2G         0
> └─sda2             0      512B       2G         0
> sdb                0      512B       2G         0
> ├─sdb1             0      512B       2G         0
> ├─sdb2             0      512B       2G         0
> ├─sdb3             0      512B       2G         0
> └─sdb4             0      512B       2G         0
> sdc                0        0B       0B         0
> ├─sdc1             0        0B       0B         0
> ├─sdc2             0        0B       0B         0
> └─sdc3             0        0B       0B         0
> sdd                0        0B       0B         0
> └─sdd1             0        0B       0B         0
> zram0              0        4K       2T         0
> nvme0n1            0      512B       2T         0
> ├─nvme0n1p1        0      512B       2T         0
> ├─nvme0n1p2        0      512B       2T         0
> └─nvme0n1p3        0      512B       2T         0
> Destructacon@GRIDBUG:~$ lsblk -o NAME,TYPE,FSTYPE,DISC-GRAN,DISC-MAX,MOUNTPOINTS
> NAME        TYPE FSTYPE DISC-GRAN DISC-MAX MOUNTPOINTS
> sda         disk             512B       2G
> ├─sda1      part             512B       2G
> └─sda2      part ntfs        512B       2G /mnt/Xtra
> sdb         disk             512B       2G
> ├─sdb1      part ntfs        512B       2G
> ├─sdb2      part ntfs        512B       2G /mnt/Chronos
> ├─sdb3      part vfat        512B       2G
> └─sdb4      part ntfs        512B       2G
> sdc         disk               0B       0B
> ├─sdc1      part ntfs          0B       0B
> ├─sdc2      part ntfs          0B       0B /mnt/Lore
> └─sdc3      part ntfs          0B       0B
> sdd         disk               0B       0B
> └─sdd1      part ntfs          0B       0B /mnt/SpinningSlowly
> zram0       disk swap          4K       2T [SWAP]
> nvme0n1     disk             512B       2T
> ├─nvme0n1p1 part vfat        512B       2T /boot/efi
> ├─nvme0n1p2 part ext4        512B       2T /boot
> └─nvme0n1p3 part btrfs       512B       2T /home
>                                            /


-- 
Thanks,
Hyunchul
