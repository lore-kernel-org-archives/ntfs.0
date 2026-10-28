Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174767;
	b=ZF0PVq5CnvLe/7BQrVmtWUPoCDTJGTETepyGOWH1J/ZV9lBCvoPNTsPQd3KBXZEFXOZY
	 IxUcXTpyrgov7+FFcC9T4ymKpzqrw006QvtbtXljkgqTPSD/7z+RQow4Q0LzTciSzMJ/x
	 dLhvfVlXl7e/w/QfRWV3xJjYRphV3RivEz4gomcCw0oXBjDN9U0dBlaael80KRy/tjUQP
	 x0c5fVOpKG43rhw61lG3jt5mNQFcvXuzi6/j4KVenTcIxYxska2iyRMDHetq1Tj34gXtP
	 UGwazTPqA1vKq2ZBMTz5ZXmH0mECu2NYjEaNIZaRJ4McJSrngkOuedCkGZP4VEg2nNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=7GXB1xr1jAmuWjPzMKbNea9peth8B4l67mgjM85gBCI=;
	b=g3/8HLa1hEFZmrSNBHmjr9ER/Kk1lD3I/dLh8CmUtz3srC8QfriVTIVfOSmFvFi696nz
	 uA8XjWLI2Ix37WiPfryTt4KWUcjGQaBPM2IsMo9HLQypvgpJAJl9g5Q0tpllI+eBe5B4L
	 RLZ/fbj4iTWQO4wqVv7B6+mTI+THzvhuJPTeyvpWOOazbeDioQd0fROCVKwhR3TUHGbS2
	 ZhslREaLK/47ZDHpAsVivnQemRbAk65FlnszkYjflGM8XRiwRE0CGpQ7edvHEH6QJdfPr
	 YED9E3ahyhGs4xzvpC+mqdiZoC44KEGHhN2AAuyHxujj/gSPFJhUS8wpqKzT0vYLGZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJSCFUBx;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3751B606A31A
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 08:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3751B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJSCFUBx
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9ae391a05so4457695ad.1
        for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 01:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793174766; x=1793779566; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GXB1xr1jAmuWjPzMKbNea9peth8B4l67mgjM85gBCI=;
        b=VJSCFUBxSoQ+M8dGxWrjYhCxzq4IQnfm+Zcz/3Mku8JyTn7oJoskAGiSbF1q3vHT2u
         D4OU01O/SfUnFZs1/SLVtZpU8hmaubNMLEiJXg1Bxm0u+V/Z5WzHHEM3FB61bTMvcFo4
         lRD8HAk7axcrxGL21L1OUQIelMIQhAwEd/YkW7ERzCd6AT+ZlyJ3ib8uqEGmoyXNx9vi
         VujWk+nx4PJ61ShjUKYabyBt0dR5X1Nrz1HCUUqr9s1rEoukWTqpxVONcF2Y+yZqBKI8
         0TdMG0spRLGwEL/DRxXO156j/U5n9tvfd1nQeKjliN4WgOB/Xvj4s5b1Vgh4LjSFIkcc
         gwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793174766; x=1793779566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7GXB1xr1jAmuWjPzMKbNea9peth8B4l67mgjM85gBCI=;
        b=JphW/6yZRU1QPInh26wmdNxdYJY5ZcUlqw8EwmkoB3HJVNjs7VTRyM/UwW5IBs+hRz
         CVhAIDJyhHrRdDkMh13zQ6G9xaEnmAMB6IDsS5dRi5ngG9f6eqUnhAYu6WmoGerSiq0U
         c1pNK/wu8910C5R6wueoyYJyHazI5YdslW9AthKc89SdA8N5bBoKqvJHRTfnzFuIXBmq
         GxLkxBFbffGodrj+HpRm+5cL87JXinGR/60luzoU4w0T2lnI0ru10RtZr1WaHenZ9t9R
         ej/2CAgInaIeMl29I8uB1gYw69K+qNO3HQhcA3MV8/M4EwTULVuFt5++s+LVJ7jq5phG
         JLrA==
X-Gm-Message-State: AFq9FYI34oTXc7PcsQblPzintA6eViXyY+K/Nj9kQbq7ukm8ciu7N7qH
	w1TtAWWcIh/1lmddu3P33EbZUavmpS94ZoRVLTVUqbiSSpja7guz3A8b
X-Gm-Gg: AYBFou1eIcvE/aD8jAeQZkj0KVjJrbMaH3SVwbfIEDSYziUO2YrS28oHzZousi19xXb
	CwclRq3X5BIWrP/CzWzB3Cdfe1bJUTK0w8e9XqD440bLZr9PT0ZgYVSXBqRMGemLP6Dy8ygcBJ3
	iL1KssDpmUfIS3x8aUyd7isvNF3NS0vE/8FGlgOp+9Pa6IBdhm56ZJ5GAVJx58/5PZ5n7HyAMtG
	/Rwx27CJJ6E2lBLbpGzGao5KbzqkWhqSzWbDRBsJ5hcRAFBLBVNrTr6yjnXohgNtz6+rBfkWHNX
	v1U3NozX1EWgW5qoT+OfQxSHZzfIP+ZJM+fyKOPZgLyNuuUrvnBI2FUMUZ701wwUV0yufPszz+Y
	SVYHhuQs9DWB6kboz0o2m7081+q9yxE2DHKPDqiKNtNZflpSRhzQxeG3jRLhT4foxKuMpLfJ7oX
	Z0Wb1PAYGtnOtWY9dID4JPymGIrqdcYpYFffEuRDj/7AZmfANhAHjnMuK/2wul/IQfJhGOpJNiP
	9Wr3EvIP9uVifAMEKnzlfS0XQTs5qb1OBBCdDSJofOHvamYsscVD0Sx7FHL5/0xoaEcbwAgEA0/
	IN5hKt//0HauyIEUUSvqmqPH8WvY139DYTFhQKUj
X-Received: by 2002:a17:903:2382:b0:2e7:67ad:8e9d with SMTP id d9443c01a7336-2eb074e2ed8mr2790815ad.30.1793174766107;
        Wed, 28 Oct 2026 01:06:06 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ce3b4fsm18666925ad.73.2026.10.28.01.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:06:03 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:05:59 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Jaidan Brashier <jobrashier@gmail.com>
Cc: ntfs@lists.linux.dev, linkinjeon@kernel.org
Subject: Re: ntfs: EIO/stale-reference errors on several volumes and on-disk
 corruption after switching from ntfs3 (Fedora 44 7.2.x)
Message-ID: <auGs5wycYstmw13c@hyunchul-PC02>
References: <CAPLZLeaXKkev=_EwAb679RaZ-Lcb_XQO1FsAw6RyT=M56rP7zw@mail.gmail.com>
 <at72kIgNxnK9p1tq@hyunchul-PC02>
 <CAPLZLeYo6AhBLcCBeZgDAs5Duv08B4i1rdFNFH5ikTXhcueMAg@mail.gmail.com>
 <auA-MOGIj-J4dLGF@hyunchul-PC02>
 <CAPLZLeaVAoFefe06b+7MaoLHVMJbAZ+PaDuVkiPMAry6TKpE0w@mail.gmail.com>
 <auBtMq76Vj47NGPu@hyunchul-PC02>
 <CAPLZLeZtObeMVNY=Q_-hRkyL-ycruuaRsPRwtUUxWPuTWC+McA@mail.gmail.com>
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
In-Reply-To: <CAPLZLeZtObeMVNY=Q_-hRkyL-ycruuaRsPRwtUUxWPuTWC+McA@mail.gmail.com>

On Tue, Oct 27, 2026 at 04:12:03AM -0700, Jaidan Brashier wrote:
> I agree that FITRIM is related to the SSD issues, I'm not sure how i
> missed that initial time line-up. Maybe i read the log wrong the first
> time.
> 
> Regarding the full logs for 2026-10-01, I am hesitant to post entire
> logs possibly containing sensitive information, especially details
> like my MAC and IP addresses, to a public forum. If you'd like, I can
> send those just to you. Also, I'm unsure if you meant the logs from
> that specific day only, or the logs from the entire boot session that
> included that day. I'm also not sure how useful the full -b log from
> that whole boot would be, as it is a 67.5MiB, 530,000-line plaintext
> file full of mostly repetitive logged input requests from apps and
> similar entries, but I can supply it if you want it.
> 
> Attached are the boot list and lsblk output.

I understand your concern, and I appreciate your help.
As you mentioned, I only need targeted logs from October 1 through
October 24, not the entire boot session.

Please send the resulting files to me privately.

journalctl -k \
      --since "2026-10-01 07:00:00 UTC" \
      --until "2026-10-24 07:00:00 UTC" \
      -o short-iso-precise --no-pager \
      > kernel.log

journalctl \
      --since "2026-10-01 07:00:00 UTC" \
      --until "2026-10-24 07:00:00 UTC" \
      _PID=1 -o short-iso-precise --no-pager \
      > systemd-lifecycle.log

journalctl -u fstrim.service -u fstrim.timer \
      --since "2026-10-01 07:00:00 UTC" \
      --until "2026-10-24 07:00:00 UTC" \
      -o short-iso-precise --no-pager \
      > fstrim.log

journalctl -u udisks2.service \
      --since "2026-10-01 07:00:00 UTC" \
      --until "2026-10-24 07:00:00 UTC" \
      -o short-iso-precise --no-pager \
      > udisks2.log

journalctl -u systemd-udevd.service \
      --since "2026-10-01 07:00:00 UTC" \
      --until "2026-10-24 07:00:00 UTC" \
      -o short-iso-precise --no-pager \
      > systemd-udevd.log

> 
> 
> On Tue, Oct 27, 2026 at 2:21 AM Hyunchul Lee <hyc.lee@gmail.com> wrote:
> >
> > On Mon, Oct 26, 2026 at 11:21:26PM -0700, Jaidan Brashier wrote:
> > > I accidentally addressed only Hyunchul in my last message. I have
> > > copied to reply properly including the mailing list, sorry for
> > > duplicate mail:
> > >
> > > Absolutely!
> > > Find attached all the logs i looked at plus the one you requested
> > >
> >
> > I believe FITRIM caused the corruptions on sda2 and sdb2.
> >
> > The logs show that FITRIM was applied to both /dev/sda2 and /dev/sdb2,
> > and the NTFS corruption messages appear after that:
> >
> > Oct 05 01:05:41 GRIDBUG systemd[1]: Starting fstrim.service - Discard unused blocks on filesystems from /etc/fstab...
> > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Chronos: 98.2 GiB (105433657344 bytes) trimmed on /dev/sdb2
> > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Xtra: 227.7 GiB (244457193472 bytes) trimmed on /dev/sda2
> >
> > 2026-10-05T01:05:46-07:00 GRIDBUG kernel: ntfs: (device sdb2): ntfs_lookup(): Found stale reference to inode 0x2ef8 (reference sequence number = 0x635, inode sequence number = 0x0), returning -EIO. Run chkdsk.
> > 2026-10-06T21:35:01-07:00 GRIDBUG kernel: ntfs: (device sda2): ntfs_mapping_pairs_decompress(): Corrupt mapping pairs array in non-resident attribute.
> > 2026-10-06T21:35:01-07:00 GRIDBUG kernel: ntfs: (device sda2): ntfs_non_resident_attr_expand(): ntfs_attr_map_whole_runlist failed
> >
> > However, it is difficult to determine the casue of the sdc2 failure from
> > the provided logs.
> >
> > Would it possible to provide the complete, unedited journal logs
> > from 2026-10-01?  If so, we would really appreciate it.
> > * journalctl --list-boots
> > * journalctl -k -b <boot-id>
> > * journalctl -b <boot-id>
> > * the output of lsblk -o NAME,PHY-SEC,LOG-SEC
> >
> > > On Mon, Oct 26, 2026 at 11:01 PM Hyunchul Lee <hyc.lee@gmail.com> wrote:
> > > >
> > > > On Mon, Oct 26, 2026 at 09:55:17PM -0700, Jaidan Brashier wrote:
> > > > > Hello Hyunchul,
> > > > > Thank you for your timely response!
> > > > >
> > > > > I do have fstrim.timer enabled. According to my logs, since Oct 2, it
> > > > > has issued fstrim requests 4 times:
> > > > > Oct 05 01:05:41,
> > > > > Oct 12 06:59:03,
> > > > > Oct 19 09:35:47,
> > > > > Oct 26 01:20:31 (today).
> > > > >
> > > > > Cross-referencing these times with when the issues occurred, I do not
> > > > > believe there is significant correlation.
> > > > >
> > > > > Additionally, fstrim.timer only operates on drives that have
> > > > > discarding enabled, which my two HDDs do not, including sdc2, the site
> > > > > of the major corruption.
> > > > > The fstrim activity logs confirm that while it has been operating, it
> > > > > has only operated on my SSDs; therefore, it cannot be the sole culprit
> > > > > behind the issue that has spanned both drive types.
> > > > > I can post these logs as well if you'd like.
> > > >
> > > > Thanks, this is very useful information.
> > > > However, just to double-check, could you please share those logs and
> > > > the output of the following command?
> > > >
> > > > lsblk -o NAME,TYPE,FSTYPE,DISC-GRAN,DISC-MAX,MOUNTPOINTS
> > > >
> > > > >
> > > > > On Sun, Oct 25, 2026 at 11:43 PM Hyunchul Lee <hyc.lee@gmail.com> wrote:
> > > > > >
> > > > > > Hi Jaidan,
> > > > > >
> > > > > > On Sat, Oct 24, 2026 at 03:18:21PM -0700, Jaidan Brashier wrote:
> > > > > > > Hello.
> > > > > > > Recently on Oct 2, i swapped from ntfs3 to ntfs, and since then I’ve
> > > > > > > seen recurring EIO/stale-reference errors on four NTFS volumes, a
> > > > > > > hardlink creation error, and one case of on-disk corruption (repaired
> > > > > > > by Windows chkdsk) on Oct 23. Logs attached.
> > > > > > >
> > > > > > > Environment
> > > > > > >   OS: Fedora 44 KDE Plasma 6.7. Incidents spanned several boots
> > > > > > > ranging versions 7.2.8-200.fc44.x86_64 to 7.2.11-200.fc44.x86_64
> > > > > > >   Mount (all 4 drives):    rw,noatime,uid=1000,gid=1000,umask=00,iocharset=utf8,
> > > > > > >             case_sensitive,errors=continue,mft_zone_multiplier=1,
> > > > > > >             windows_names,native_symlink=raw,symlink=wsl
> > > > > > >   Devices:   corruption occurred on a SATA HDD, sdc2, NTFS 3.1, 4k clusters.
> > > > > > >   3 other NTFS drives are present (2 SATA SSDs and another SATA HDD).
> > > > > > >   smartctl and Windows chkdsk /r report no bad sectors on any drive.
> > > > > > >
> > > > > > > Fast Startup has been disabled for months. No volume was ever flagged
> > > > > > > dirty. Unclean shutdowns occurred on these volumes before the switch;
> > > > > > > none that I know of since.
> > > > > > >
> > > > > > > Workload
> > > > > > >   Previous issues: General desktop use; I don't know precisely what
> > > > > > > activities preceded previous errors
> > > > > > >   Most recent issue: Steam Linux Runtime 4.0 update (heavy I/O
> > > > > > > traffic, lots of temp files, symlinks and hardlinks)
> > > > > > >
> > > > > > > Twice prior, i noted a seemingly random file on my system was refusing
> > > > > > > to be read, returning an I/O error.
> > > > > > > Both of those times, I fixed the issue by running `sync && echo 3 |
> > > > > > > sudo tee /proc/sys/vm/drop_caches`, unmounting the drive, and
> > > > > > > remounting, in some order (unsure). The underlying files were pristine
> > > > > > > both times, i therefore suspect the issue was only a stale reference
> > > > > > > in the cache.
> > > > > > >
> > > > > > > Yesterday (Oct 23) i encountered a much more pronounced error i
> > > > > > > believe to be of the same kind as, or otherwise some how related to,
> > > > > > > the previous ones.
> > > > > > > The Steam client errored while updating its Linux Runtime 4.0 package.
> > > > > > > After some digging, i found similar EIO messages, and expecting an
> > > > > > > error of the same kind, i tried unmounting/remounting and clearing
> > > > > > > drop_caches a few times.
> > > > > > > Realizing that did not fix the problem this time, I shutdown my
> > > > > > > machine in preparation to boot up my secondary Windows install to run
> > > > > > > chkdsk. Shutdown hung for ~10 minutes (normally ~10 seconds), likely
> > > > > > > on the NTFS volume.
> > > > > > >
> > > > > > > Booting into windows, I ran `chkdsk /f /r /x` on the relevant drive.
> > > > > > > chkdsk cleaned up the following errors, and more:
> > > > > > >   - ~350 index entries deleted from $R of file 0x1A ($Extend\$Reparse)
> > > > > > >   - Many $I30 entries deleted that pointed at nonexistent records,
> > > > > > >     including runtime library names and Steam appmanifest/appworkshop files
> > > > > > >   - "Recovering orphaned file appworkshop_32470.acf.async217386.tmp
> > > > > > >     (and two more .tmp names) into directory 2B582".
> > > > > > >   - Several libraries (libcurl, libcrypto, libSDL3) recovered into two
> > > > > > >     directories each. Expected hardlinks
> > > > > > >   - Free space marked as allocated in the volume and MFT bitmaps
> > > > > > >   - No bad sectors, cross-links, or security descriptor errors
> > > > > > >
> > > > > > > After this process completed, i ran `chkdsk /f` on all my other
> > > > > > > drives, which cleaned up some small errors but nothing major.
> > > > > > >
> > > > > > > Attached are 3 logs, of every ntfs error my system has logged since
> > > > > > > Oct 2, the shutdown hang, and all the times i cleared drop_caches,
> > > > > > > respectively. You may note that errors ocurred several more times than
> > > > > > > i noticed and attempted to fix them.
> > > > > > >
> > > > > > > I made a few amateur attempts to recreate the issue, hypothesizing
> > > > > > > that it might relate to moving and renaming, temp files, symlinks,
> > > > > > > hardlinks, and possibly full MFT tables, but i was never able to.
> > > > > > >
> > > > > > > If necessary, i can supply the full chkdsk output too, and i'd be
> > > > > > > happy to test a theoretical patch or supply further debug info.
> > > > > > >
> > > > > > > I wasn't sure who to address, so I addressed all three.
> > > > > >
> > > > > > Are you running a service that periodically issues FITRIM, such as
> > > > > > fstrim.timer? A patch fixing an incorrect FITRIM dicard range was
> > > > > > released[1], but it is not included in your kernel version. Some of
> > > > > > the corruption patterns appear consistent with this bug.
> > > > > >
> > > > > > Could you check whether FITRIM ran before the corruption occurred?
> > > > > >
> > > > > > [1]: https://lore.kernel.org/stable/20261023163719.159193934@linuxfoundation.org/
> > > > > > --
> > > > > > Thanks,
> > > > > > Hyunchul
> > > >
> > > > --
> > > > Thanks,
> > > > Hyunchul
> >
> > > Destructacon@GRIDBUG:~$ systemctl status fstrim.timer
> > > ● fstrim.timer - Discard unused filesystem blocks once a week
> > >      Loaded: loaded (/usr/lib/systemd/system/fstrim.timer; enabled; preset: enabled)
> > >      Active: active (waiting) since Sun 2026-10-25 18:29:37 PDT; 1 day 4h ago
> > >  Invocation: 2c41b84c97d3454dbe41de1934c43f4a
> > >     Trigger: Mon 2026-11-02 00:22:00 PST; 6 days left
> > >    Triggers: ● fstrim.service
> > >        Docs: man:fstrim
> > >
> > > Oct 25 18:29:37 GRIDBUG systemd[1]: Started fstrim.timer - Discard unused filesystem blocks once a week.
> > > Destructacon@GRIDBUG:~$ systemctl list-timers | grep fstrim
> > > Mon 2026-11-02 00:22:00 PST   6 days Mon 2026-10-26 01:20:31 PDT      12h ago fstrim.timer                 fstrim.service
> > > Destructacon@GRIDBUG:~$ journalctl -u fstrim.service --since "2026-10-02"
> > > Oct 05 01:05:41 GRIDBUG systemd[1]: Starting fstrim.service - Discard unused blocks on filesystems from /etc/fstab...
> > > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Chronos: 98.2 GiB (105433657344 bytes) trimmed on /dev/sdb2
> > > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Xtra: 227.7 GiB (244457193472 bytes) trimmed on /dev/sda2
> > > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /boot/efi: 578.7 MiB (606842880 bytes) trimmed on /dev/nvme0n1p1
> > > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /boot: 1.3 GiB (1381433344 bytes) trimmed on /dev/nvme0n1p2
> > > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /: 688.8 GiB (739545485312 bytes) trimmed on /dev/nvme0n1p3
> > > Oct 05 01:13:29 GRIDBUG systemd[1]: fstrim.service: Deactivated successfully.
> > > Oct 05 01:13:29 GRIDBUG systemd[1]: Finished fstrim.service - Discard unused blocks on filesystems from /etc/fstab.
> > > Oct 05 01:13:29 GRIDBUG systemd[1]: fstrim.service: Consumed 2.245s CPU time over 7min 47.949s wall clock time, 46.1M memory peak.
> > > -- Boot adb54a13efe149098d12251c0fdaad43 --
> > > Oct 12 06:59:03 GRIDBUG systemd[1]: Starting fstrim.service - Discard unused blocks on filesystems from /etc/fstab...
> > > Oct 12 07:06:37 GRIDBUG fstrim[66865]: /mnt/Chronos: 98.2 GiB (105430089728 bytes) trimmed on /dev/sdb2
> > > Oct 12 07:06:37 GRIDBUG fstrim[66865]: /mnt/Xtra: 226.5 GiB (243247431680 bytes) trimmed on /dev/sda2
> > > Oct 12 07:06:37 GRIDBUG fstrim[66865]: /boot/efi: 578.7 MiB (606842880 bytes) trimmed on /dev/nvme0n1p1
> > > Oct 12 07:06:37 GRIDBUG fstrim[66865]: /boot: 1.3 GiB (1386246144 bytes) trimmed on /dev/nvme0n1p2
> > > Oct 12 07:06:37 GRIDBUG fstrim[66865]: /: 665.8 GiB (714850619392 bytes) trimmed on /dev/nvme0n1p3
> > > Oct 12 07:06:37 GRIDBUG systemd[1]: fstrim.service: Deactivated successfully.
> > > Oct 12 07:06:37 GRIDBUG systemd[1]: Finished fstrim.service - Discard unused blocks on filesystems from /etc/fstab.
> > > Oct 12 07:06:37 GRIDBUG systemd[1]: fstrim.service: Consumed 2.188s CPU time over 7min 33.638s wall clock time, 43.6M memory peak.
> > > -- Boot 96460ff0097c418784dd3cf8e398bbbf --
> > > Oct 19 09:35:47 GRIDBUG systemd[1]: Starting fstrim.service - Discard unused blocks on filesystems from /etc/fstab...
> > > Oct 19 09:43:16 GRIDBUG fstrim[65662]: /mnt/Chronos: 98.2 GiB (105427058688 bytes) trimmed on /dev/sdb2
> > > Oct 19 09:43:16 GRIDBUG fstrim[65662]: /mnt/Xtra: 226.3 GiB (242984091648 bytes) trimmed on /dev/sda2
> > > Oct 19 09:43:16 GRIDBUG fstrim[65662]: /boot/efi: 578.7 MiB (606842880 bytes) trimmed on /dev/nvme0n1p1
> > > Oct 19 09:43:16 GRIDBUG fstrim[65662]: /boot: 1.3 GiB (1385877504 bytes) trimmed on /dev/nvme0n1p2
> > > Oct 19 09:43:16 GRIDBUG fstrim[65662]: /: 655.2 GiB (703479914496 bytes) trimmed on /dev/nvme0n1p3
> > > Oct 19 09:43:16 GRIDBUG systemd[1]: fstrim.service: Deactivated successfully.
> > > Oct 19 09:43:16 GRIDBUG systemd[1]: Finished fstrim.service - Discard unused blocks on filesystems from /etc/fstab.
> > > Oct 19 09:43:16 GRIDBUG systemd[1]: fstrim.service: Consumed 2.812s CPU time over 7min 28.705s wall clock time, 46.3M memory peak.
> > > -- Boot 29d2f12d90914b1c80ca78c8427aed64 --
> > > Oct 26 01:20:31 GRIDBUG systemd[1]: Starting fstrim.service - Discard unused blocks on filesystems from /etc/fstab...
> > > Oct 26 01:27:33 GRIDBUG fstrim[44163]: /mnt/Chronos: 95.9 GiB (102955753472 bytes) trimmed on /dev/sdb2
> > > Oct 26 01:27:33 GRIDBUG fstrim[44163]: /mnt/Xtra: 225.6 GiB (242284789760 bytes) trimmed on /dev/sda2
> > > Oct 26 01:27:33 GRIDBUG fstrim[44163]: /boot/efi: 578.7 MiB (606842880 bytes) trimmed on /dev/nvme0n1p1
> > > Oct 26 01:27:33 GRIDBUG fstrim[44163]: /boot: 1.3 GiB (1385877504 bytes) trimmed on /dev/nvme0n1p2
> > > Oct 26 01:27:33 GRIDBUG fstrim[44163]: /: 634.3 GiB (681097322496 bytes) trimmed on /dev/nvme0n1p3
> > > Oct 26 01:27:33 GRIDBUG systemd[1]: fstrim.service: Deactivated successfully.
> > > Oct 26 01:27:33 GRIDBUG systemd[1]: Finished fstrim.service - Discard unused blocks on filesystems from /etc/fstab.
> > > Oct 26 01:27:33 GRIDBUG systemd[1]: fstrim.service: Consumed 2.426s CPU time over 7min 1.609s wall clock time, 46.8M memory peak.
> > > Destructacon@GRIDBUG:~$ lsblk -D
> > > NAME        DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
> > > sda                0      512B       2G         0
> > > ├─sda1             0      512B       2G         0
> > > └─sda2             0      512B       2G         0
> > > sdb                0      512B       2G         0
> > > ├─sdb1             0      512B       2G         0
> > > ├─sdb2             0      512B       2G         0
> > > ├─sdb3             0      512B       2G         0
> > > └─sdb4             0      512B       2G         0
> > > sdc                0        0B       0B         0
> > > ├─sdc1             0        0B       0B         0
> > > ├─sdc2             0        0B       0B         0
> > > └─sdc3             0        0B       0B         0
> > > sdd                0        0B       0B         0
> > > └─sdd1             0        0B       0B         0
> > > zram0              0        4K       2T         0
> > > nvme0n1            0      512B       2T         0
> > > ├─nvme0n1p1        0      512B       2T         0
> > > ├─nvme0n1p2        0      512B       2T         0
> > > └─nvme0n1p3        0      512B       2T         0
> > > Destructacon@GRIDBUG:~$ lsblk -o NAME,TYPE,FSTYPE,DISC-GRAN,DISC-MAX,MOUNTPOINTS
> > > NAME        TYPE FSTYPE DISC-GRAN DISC-MAX MOUNTPOINTS
> > > sda         disk             512B       2G
> > > ├─sda1      part             512B       2G
> > > └─sda2      part ntfs        512B       2G /mnt/Xtra
> > > sdb         disk             512B       2G
> > > ├─sdb1      part ntfs        512B       2G
> > > ├─sdb2      part ntfs        512B       2G /mnt/Chronos
> > > ├─sdb3      part vfat        512B       2G
> > > └─sdb4      part ntfs        512B       2G
> > > sdc         disk               0B       0B
> > > ├─sdc1      part ntfs          0B       0B
> > > ├─sdc2      part ntfs          0B       0B /mnt/Lore
> > > └─sdc3      part ntfs          0B       0B
> > > sdd         disk               0B       0B
> > > └─sdd1      part ntfs          0B       0B /mnt/SpinningSlowly
> > > zram0       disk swap          4K       2T [SWAP]
> > > nvme0n1     disk             512B       2T
> > > ├─nvme0n1p1 part vfat        512B       2T /boot/efi
> > > ├─nvme0n1p2 part ext4        512B       2T /boot
> > > └─nvme0n1p3 part btrfs       512B       2T /home
> > >                                            /
> >
> >
> > --
> > Thanks,
> > Hyunchul

> Destructacon@GRIDBUG:~$ journalctl --list-boots
> IDX BOOT ID                          FIRST ENTRY                 LAST ENTRY
> -33 e190c0caaf0a48aba57899c864c204ea Sat 2026-08-15 22:48:26 PDT Thu 2026-08-20 12:37:46 PDT
> -32 ca70297c5df6485aa5e99e1b2c06f7f9 Thu 2026-08-20 05:39:49 PDT Thu 2026-08-20 12:40:11 PDT
> -31 e04f4c4a79b74a13be350cf9db025e50 Thu 2026-08-20 05:40:34 PDT Thu 2026-08-20 12:47:16 PDT
> -30 2805483bbafc4103a3bbac0bad4ba936 Thu 2026-08-20 05:47:39 PDT Fri 2026-08-28 03:47:06 PDT
> -29 cdab25b455fe4b328bfc501e5cbaaa57 Thu 2026-08-27 20:48:03 PDT Sat 2026-08-29 03:04:58 PDT
> -28 9e4a700b327c4997acef168a8708d288 Fri 2026-08-28 20:22:14 PDT Sat 2026-08-29 03:28:09 PDT
> -27 33efe6888f36479ab039bea1416cd254 Fri 2026-08-28 21:12:41 PDT Sun 2026-09-06 17:15:22 PDT
> -26 a1b2789105a54b699992d58fb7c90298 Sun 2026-09-06 10:16:21 PDT Thu 2026-09-10 23:38:38 PDT
> -25 cc4f8863b15448d98acbebe69c3a8c07 Thu 2026-09-10 16:39:01 PDT Thu 2026-09-10 23:39:29 PDT
> -24 cc230cb574c84ecf95f7315dc8d7c0f7 Fri 2026-09-11 02:45:45 PDT Fri 2026-09-11 10:07:02 PDT
> -23 c2013bada2be4833b6f954c79794bd06 Fri 2026-09-11 03:08:06 PDT Fri 2026-09-11 10:16:36 PDT
> -22 62caec6933264bb9977fdd8a8f2ca34e Fri 2026-09-11 03:16:59 PDT Fri 2026-09-11 10:36:39 PDT
> -21 7d1b28bb3336413db1c573f19320fe54 Fri 2026-09-11 03:37:03 PDT Fri 2026-09-18 18:13:39 PDT
> -20 1a4d411be623477b89d84dfe198dbae1 Fri 2026-09-18 11:14:03 PDT Tue 2026-09-22 19:14:01 PDT
> -19 bdc4cd4d498d442281638586f8d97bb4 Tue 2026-09-22 12:14:25 PDT Tue 2026-09-22 19:18:27 PDT
> -18 f2c35fc2e07c4f73926921e943ce51ee Tue 2026-09-22 12:19:07 PDT Wed 2026-09-23 00:47:31 PDT
> -17 208fc44e5eb445a9959927f65738a59f Tue 2026-09-22 17:52:14 PDT Fri 2026-09-25 03:50:33 PDT
> -16 93d5b637460a4abf92044d21eb827b89 Thu 2026-09-24 20:59:01 PDT Fri 2026-09-25 04:27:12 PDT
> -15 a5bb7c56324a42d0a8d961b7af4d4685 Fri 2026-09-25 08:15:36 PDT Tue 2026-09-29 14:49:10 PDT
> -14 66c30ed2ec6d4eb88700bee01f97f7bf Tue 2026-09-29 07:50:12 PDT Wed 2026-09-30 00:58:14 PDT
> -13 1bdf3cd7ea5546a9ba9e785444ccb067 Tue 2026-09-29 17:58:52 PDT Wed 2026-09-30 01:02:10 PDT
> -12 a7103cc057b14cb8afca1373a11a940b Tue 2026-09-29 18:02:43 PDT Wed 2026-09-30 01:41:42 PDT
> -11 c5cb5064bce54d03b3ce16bca4867b17 Tue 2026-09-29 18:42:13 PDT Fri 2026-10-02 01:42:10 PDT
> -10 a70cb7a4cdcb43d0a1d0452bb092eb07 Thu 2026-10-01 18:43:00 PDT Mon 2026-10-05 13:20:13 PDT
>  -9 02b9018835054ca7b1d880f4229de31b Mon 2026-10-05 06:20:37 PDT Wed 2026-10-07 18:18:02 PDT
>  -8 b4b92258b0e247e49b6b2b6480c6d1c7 Wed 2026-10-07 11:18:26 PDT Sat 2026-10-10 23:00:49 PDT
>  -7 adb54a13efe149098d12251c0fdaad43 Sun 2026-10-11 00:58:38 PDT Wed 2026-10-14 20:49:12 PDT
>  -6 cbf1829d5ada455a81381c766a7b3194 Fri 2026-10-16 11:02:16 PDT Fri 2026-10-16 19:04:14 PDT
>  -5 86eb511b02644ea2990b4f2652dfeb78 Fri 2026-10-16 12:04:58 PDT Sun 2026-10-18 05:18:56 PDT
>  -4 96460ff0097c418784dd3cf8e398bbbf Sun 2026-10-18 05:16:31 PDT Tue 2026-10-20 03:38:13 PDT
>  -3 538b082ae475413aa713d73cac5c784d Tue 2026-10-20 02:19:02 PDT Fri 2026-10-23 16:33:23 PDT
>  -2 b1be8d5451fc4477b1bfc7ae39ae9b06 Fri 2026-10-23 12:22:34 PDT Fri 2026-10-23 19:28:54 PDT
>  -1 6873d05f1c2d4246a2d58a7f97d75bda Fri 2026-10-23 12:30:33 PDT Sun 2026-10-25 18:10:59 PDT
>   0 29d2f12d90914b1c80ca78c8427aed64 Sun 2026-10-25 11:29:30 PDT Tue 2026-10-27 03:25:07 PDT
> 
> 
> Destructacon@GRIDBUG:~$  lsblk -o NAME,PHY-SEC,LOG-SEC
> NAME        PHY-SEC LOG-SEC
> sda             512     512
> ├─sda1          512     512
> └─sda2          512     512
> sdb             512     512
> ├─sdb1          512     512
> ├─sdb2          512     512
> ├─sdb3          512     512
> └─sdb4          512     512
> sdc             512     512
> ├─sdc1          512     512
> ├─sdc2          512     512
> └─sdc3          512     512
> sdd            4096     512
> └─sdd1         4096     512
> zram0          4096    4096
> nvme0n1         512     512
> ├─nvme0n1p1     512     512
> ├─nvme0n1p2     512     512
> └─nvme0n1p3     512     512


-- 
Thanks,
Hyunchul
