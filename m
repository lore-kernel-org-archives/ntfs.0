Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793099537;
	b=HS2dJHYEBr4nEpA814vmbc29T4dakLpSeIwZ/MKGb50gRWAKG60KlJP4WwkjFi+5cJoO
	 t0/LVCn+4YHydlLtq2/9HMpeN2ffJD5gj0ne+tYSWMkItAVLcqzKZuOEEANry5rt98yOm
	 cGvO+zcI4g1o6ij8+pwNLdsvcgu6gqIgXNuVVAhp9wxByA6rxc2t4irPgx/8YtIoQKss+
	 A87zuvd2N1ThF8fSS2ai3fMboFyvUI1x2GwxAeWql/b31IF0fzmANAWfl7m7ECkh5+uU9
	 DA5JVvuskFMhyEXl8pJ85DLk7RCTAeoS92uaCgqSNyDlnhh8/kaz/5T0Zr7bfByB9UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=L4wwgazR9N/QC8hdtxH2DifhDlFUQoTq1EvucwtWct4=;
	b=s0IL6LG1hTTe8thk5ZAoH+Obw6hL5xGjBIeoBQpnb3o6B6BqwzCTfLZHbOKmD5WdMaE1
	 NJLyb86+iHLVOQ8CjsAgewROpUzfj5Mm9NssY5VVIGdEl85u98jgCJwKtsRVhaWUJxZ10
	 AzHc4kuhWo2SgZZbm7jlHMTTBoN+XZePjoyLuy5uXo5s819dyaMo8H5ZHXSgV+3w/fls9
	 jAPjJowOhKBeCp1ikw9X4y0S6f/9nnwnXMuTFZlw189/IrHTVpWKleKBm2MQ8LIAtUwxb
	 1e7UtO0YruAwVzxWuoRs+dS4GX4di/OHa0iceTidtLjCvIOQhHFjg/PD6yjsPrsd8Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SO4kz5UL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0714A606A325
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 11:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0714A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SO4kz5UL
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0e1b91607so5003947b3.0
        for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 04:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793099536; cv=none;
        d=google.com; s=arc-20260327;
        b=QdKQ8Gn8kO+mtgmoob6EFVMEE+u9vBonF8RmJ4hJ+8HnBBcODl8mJwH4ZOp8JCTFSZ
         erac3yN49nAl2626HqaWhS5t7oiemWxP8MssFn81CKWuO4mLtb6qs88SOLsn/MPJkh/p
         swYMp7xaYex1NxehQ5+IpY8ODha8YGsZrikrzrcnG89h6t9zYkDpgfXt/v7GKasAXI/k
         JSS3ZjriwS+d37+dv7CVheZCncj16I+qM8EfYO+lx0PPHjabPyf8RHQSZQjCps+m8eLX
         lWUvc7S3vtDICrEvu8tBliJyQXfKCQn4D7s55OCDgtyEfGeTOA1NSeSHfI4RMQn75AVq
         ijDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L4wwgazR9N/QC8hdtxH2DifhDlFUQoTq1EvucwtWct4=;
        fh=VunGTfO+5wxe6nEk/OXOMK/4D9tS997+MAJhvdcygQ4=;
        b=ibw+7oUlADXBjTwWeRcbj+IgNgoojIUKzTS/a4JiNqFnYJlj0W+gn4YZbj3JqGDbMx
         J13b4erCKDfleX6arY3/q2XXXcTSHkJF2i4zb7fgZZXsQ6R4BSZybf7DRFozkf4DSKNh
         OUSINRKGX45Up5nkSR5uGM2hqhEB1S6Y1ruwZtPD7A50ln3kDGotKwtzbJRqS/CxEulM
         +pmUQKBqcCQqeiILZhbMGBFUZZKimzcAaPLt0cFZriiFzteKw7sbLOvvudx0DDD8u//l
         wUWxPqcCQQj8XJgJxBviNm2/GEoeteToL2052Beh6+7J8MM65CsENWg6zlzpENDAoF6s
         ubuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793099536; x=1793704336; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4wwgazR9N/QC8hdtxH2DifhDlFUQoTq1EvucwtWct4=;
        b=SO4kz5ULA/H0dEYTl6fQMLqs2sRGORqsu/2VsEj/0rkzbgweU+IkHRk34accBRSrhS
         39ncSAnPkBk9aabUjwedRzqNcT2fOOMM0phrujLI4LG2X9S3aTIeZ6p5YbMgxc0G7ENk
         3OcCz0XQpXmyOWc/gfsdPl5jUrkmyRXYjhslsAhedIFb4VnvSNM02Eb3aOMIkh6eaJcK
         mhm5MPoUX19Irze7fXFprZZ8WArfhxaFpVNKSG5ITGJSXsCQYOD3h6zeQaBMGm0QXBYC
         rD3IiHUTy/CWMEh6be/v3P643FymnxIVP+eLQ6IkSIlCpClJwuPj8vcoaU0mKK/fBcuW
         VWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099536; x=1793704336;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L4wwgazR9N/QC8hdtxH2DifhDlFUQoTq1EvucwtWct4=;
        b=CYAW1X6W0xqwZzqUBQbDhUN5rOJvrSWdOTD/X5uO0h86gpDo2o0LHzwS6ghkSjQmgd
         MN3zFLZVjgu4n30N76tHytcE6iT8FKLdnkGrNmsxQR1aQBSw1IbhslXTTp0LAfVsz00k
         xWZusxQQPeiaLz8C0nHslD9ckwLJeikQjo/qq6Omi1wDpZ8IaKewuOXBuY2fwArdu/Ko
         HsH+bbBj2JmKeKBoTK00VMhI66xXrWD30EoJuhUHHGGkMnmsZJRZJ3VXiM2lDEO/ZKD4
         Rwr+OX/5mmGrP0T8DC8Bbv5m1K4dk/WYtzdvRSBiWcJ8XBSgRVg8DiMlQdXXuYl8vpM7
         RUTQ==
X-Gm-Message-State: AFq9FYJTIwxF6iYvNy0ILgvgDdLvE9PAKl0Iru/gW008DhrwSk72ReUT
	b+35T9yCBIybx184K5Ht0chD2VLUvMRE5x6fXvnSOkLVYnCRUoek3GADDp+u3Sby9Igk9c+muDc
	NBjNKyxOLkGuOJSlspymRDP8KF99qkSC/KIcPLm8=
X-Gm-Gg: AYBFou1X8zJ2pWWCQZmGH7dNxs09EmjXpGg6Exg18p99Mpx8KdDYu2vtvEVf8Id8xK7
	AaqscCUnuSJwUFYelZxm+UBlyBhyHJgj5uYM0c0kewejeQY68BdpscLGGcqBsHsGvWlT91SLF86
	6SW60xhUeVlseF0/FzmGrMW9pb7SUsHgVFRYueaNs2Hc+sspzdQfSVUC2OPCVEuEqlHCzGujyjn
	+iCgtT7cp6e+72BniqK4j20M4OXYFFgPOn9pZFNYN8w9NnxBkxEvyuqoBviWpHd9Xm4vVoahVFW
	OkNz39ZqloOqGSSQJEJg9SESTs6R61TBAFUHQmrYbK6ErQxvDfPMZJCK6YglGPP0RPP+9KZgWgH
	/URlWh0ZeXtWpNVhjhhqsfQPf6jXFXgH68e222Q==
X-Received: by 2002:a05:690c:e24b:20b0:8b0:cb79:345e with SMTP id
 00721157ae682-8b1669a3dbamr83765557b3.1.1793099535551; Tue, 27 Oct 2026
 04:12:15 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAPLZLeaXKkev=_EwAb679RaZ-Lcb_XQO1FsAw6RyT=M56rP7zw@mail.gmail.com>
 <at72kIgNxnK9p1tq@hyunchul-PC02> <CAPLZLeYo6AhBLcCBeZgDAs5Duv08B4i1rdFNFH5ikTXhcueMAg@mail.gmail.com>
 <auA-MOGIj-J4dLGF@hyunchul-PC02> <CAPLZLeaVAoFefe06b+7MaoLHVMJbAZ+PaDuVkiPMAry6TKpE0w@mail.gmail.com>
 <auBtMq76Vj47NGPu@hyunchul-PC02>
In-Reply-To: <auBtMq76Vj47NGPu@hyunchul-PC02>
From: Jaidan Brashier <jobrashier@gmail.com>
Date: Tue, 27 Oct 2026 04:12:03 -0700
X-Gm-Features: AclHuK_QI3ulFybeQXHw2rxo67YJm1oGSyGA5FJ0bTJGkugewnDloTS-sING1TI
Message-ID: <CAPLZLeZtObeMVNY=Q_-hRkyL-ycruuaRsPRwtUUxWPuTWC+McA@mail.gmail.com>
Subject: Re: ntfs: EIO/stale-reference errors on several volumes and on-disk
 corruption after switching from ntfs3 (Fedora 44 7.2.x)
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linkinjeon@kernel.org
Content-Type: multipart/mixed; boundary="000000000000dd535d065ed0848f"

--000000000000dd535d065ed0848f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I agree that FITRIM is related to the SSD issues, I'm not sure how i
missed that initial time line-up. Maybe i read the log wrong the first
time.

Regarding the full logs for 2026-10-01, I am hesitant to post entire
logs possibly containing sensitive information, especially details
like my MAC and IP addresses, to a public forum. If you'd like, I can
send those just to you. Also, I'm unsure if you meant the logs from
that specific day only, or the logs from the entire boot session that
included that day. I'm also not sure how useful the full -b log from
that whole boot would be, as it is a 67.5MiB, 530,000-line plaintext
file full of mostly repetitive logged input requests from apps and
similar entries, but I can supply it if you want it.

Attached are the boot list and lsblk output.


On Tue, Oct 27, 2026 at 2:21=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> On Mon, Oct 26, 2026 at 11:21:26PM -0700, Jaidan Brashier wrote:
> > I accidentally addressed only Hyunchul in my last message. I have
> > copied to reply properly including the mailing list, sorry for
> > duplicate mail:
> >
> > Absolutely!
> > Find attached all the logs i looked at plus the one you requested
> >
>
> I believe FITRIM caused the corruptions on sda2 and sdb2.
>
> The logs show that FITRIM was applied to both /dev/sda2 and /dev/sdb2,
> and the NTFS corruption messages appear after that:
>
> Oct 05 01:05:41 GRIDBUG systemd[1]: Starting fstrim.service - Discard unu=
sed blocks on filesystems from /etc/fstab...
> Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Chronos: 98.2 GiB (105433657=
344 bytes) trimmed on /dev/sdb2
> Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Xtra: 227.7 GiB (24445719347=
2 bytes) trimmed on /dev/sda2
>
> 2026-10-05T01:05:46-07:00 GRIDBUG kernel: ntfs: (device sdb2): ntfs_looku=
p(): Found stale reference to inode 0x2ef8 (reference sequence number =3D 0=
x635, inode sequence number =3D 0x0), returning -EIO. Run chkdsk.
> 2026-10-06T21:35:01-07:00 GRIDBUG kernel: ntfs: (device sda2): ntfs_mappi=
ng_pairs_decompress(): Corrupt mapping pairs array in non-resident attribut=
e.
> 2026-10-06T21:35:01-07:00 GRIDBUG kernel: ntfs: (device sda2): ntfs_non_r=
esident_attr_expand(): ntfs_attr_map_whole_runlist failed
>
> However, it is difficult to determine the casue of the sdc2 failure from
> the provided logs.
>
> Would it possible to provide the complete, unedited journal logs
> from 2026-10-01?  If so, we would really appreciate it.
> * journalctl --list-boots
> * journalctl -k -b <boot-id>
> * journalctl -b <boot-id>
> * the output of lsblk -o NAME,PHY-SEC,LOG-SEC
>
> > On Mon, Oct 26, 2026 at 11:01=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.co=
m> wrote:
> > >
> > > On Mon, Oct 26, 2026 at 09:55:17PM -0700, Jaidan Brashier wrote:
> > > > Hello Hyunchul,
> > > > Thank you for your timely response!
> > > >
> > > > I do have fstrim.timer enabled. According to my logs, since Oct 2, =
it
> > > > has issued fstrim requests 4 times:
> > > > Oct 05 01:05:41,
> > > > Oct 12 06:59:03,
> > > > Oct 19 09:35:47,
> > > > Oct 26 01:20:31 (today).
> > > >
> > > > Cross-referencing these times with when the issues occurred, I do n=
ot
> > > > believe there is significant correlation.
> > > >
> > > > Additionally, fstrim.timer only operates on drives that have
> > > > discarding enabled, which my two HDDs do not, including sdc2, the s=
ite
> > > > of the major corruption.
> > > > The fstrim activity logs confirm that while it has been operating, =
it
> > > > has only operated on my SSDs; therefore, it cannot be the sole culp=
rit
> > > > behind the issue that has spanned both drive types.
> > > > I can post these logs as well if you'd like.
> > >
> > > Thanks, this is very useful information.
> > > However, just to double-check, could you please share those logs and
> > > the output of the following command?
> > >
> > > lsblk -o NAME,TYPE,FSTYPE,DISC-GRAN,DISC-MAX,MOUNTPOINTS
> > >
> > > >
> > > > On Sun, Oct 25, 2026 at 11:43=E2=80=AFPM Hyunchul Lee <hyc.lee@gmai=
l.com> wrote:
> > > > >
> > > > > Hi Jaidan,
> > > > >
> > > > > On Sat, Oct 24, 2026 at 03:18:21PM -0700, Jaidan Brashier wrote:
> > > > > > Hello.
> > > > > > Recently on Oct 2, i swapped from ntfs3 to ntfs, and since then=
 I=E2=80=99ve
> > > > > > seen recurring EIO/stale-reference errors on four NTFS volumes,=
 a
> > > > > > hardlink creation error, and one case of on-disk corruption (re=
paired
> > > > > > by Windows chkdsk) on Oct 23. Logs attached.
> > > > > >
> > > > > > Environment
> > > > > >   OS: Fedora 44 KDE Plasma 6.7. Incidents spanned several boots
> > > > > > ranging versions 7.2.8-200.fc44.x86_64 to 7.2.11-200.fc44.x86_6=
4
> > > > > >   Mount (all 4 drives):    rw,noatime,uid=3D1000,gid=3D1000,uma=
sk=3D00,iocharset=3Dutf8,
> > > > > >             case_sensitive,errors=3Dcontinue,mft_zone_multiplie=
r=3D1,
> > > > > >             windows_names,native_symlink=3Draw,symlink=3Dwsl
> > > > > >   Devices:   corruption occurred on a SATA HDD, sdc2, NTFS 3.1,=
 4k clusters.
> > > > > >   3 other NTFS drives are present (2 SATA SSDs and another SATA=
 HDD).
> > > > > >   smartctl and Windows chkdsk /r report no bad sectors on any d=
rive.
> > > > > >
> > > > > > Fast Startup has been disabled for months. No volume was ever f=
lagged
> > > > > > dirty. Unclean shutdowns occurred on these volumes before the s=
witch;
> > > > > > none that I know of since.
> > > > > >
> > > > > > Workload
> > > > > >   Previous issues: General desktop use; I don't know precisely =
what
> > > > > > activities preceded previous errors
> > > > > >   Most recent issue: Steam Linux Runtime 4.0 update (heavy I/O
> > > > > > traffic, lots of temp files, symlinks and hardlinks)
> > > > > >
> > > > > > Twice prior, i noted a seemingly random file on my system was r=
efusing
> > > > > > to be read, returning an I/O error.
> > > > > > Both of those times, I fixed the issue by running `sync && echo=
 3 |
> > > > > > sudo tee /proc/sys/vm/drop_caches`, unmounting the drive, and
> > > > > > remounting, in some order (unsure). The underlying files were p=
ristine
> > > > > > both times, i therefore suspect the issue was only a stale refe=
rence
> > > > > > in the cache.
> > > > > >
> > > > > > Yesterday (Oct 23) i encountered a much more pronounced error i
> > > > > > believe to be of the same kind as, or otherwise some how relate=
d to,
> > > > > > the previous ones.
> > > > > > The Steam client errored while updating its Linux Runtime 4.0 p=
ackage.
> > > > > > After some digging, i found similar EIO messages, and expecting=
 an
> > > > > > error of the same kind, i tried unmounting/remounting and clear=
ing
> > > > > > drop_caches a few times.
> > > > > > Realizing that did not fix the problem this time, I shutdown my
> > > > > > machine in preparation to boot up my secondary Windows install =
to run
> > > > > > chkdsk. Shutdown hung for ~10 minutes (normally ~10 seconds), l=
ikely
> > > > > > on the NTFS volume.
> > > > > >
> > > > > > Booting into windows, I ran `chkdsk /f /r /x` on the relevant d=
rive.
> > > > > > chkdsk cleaned up the following errors, and more:
> > > > > >   - ~350 index entries deleted from $R of file 0x1A ($Extend\$R=
eparse)
> > > > > >   - Many $I30 entries deleted that pointed at nonexistent recor=
ds,
> > > > > >     including runtime library names and Steam appmanifest/appwo=
rkshop files
> > > > > >   - "Recovering orphaned file appworkshop_32470.acf.async217386=
.tmp
> > > > > >     (and two more .tmp names) into directory 2B582".
> > > > > >   - Several libraries (libcurl, libcrypto, libSDL3) recovered i=
nto two
> > > > > >     directories each. Expected hardlinks
> > > > > >   - Free space marked as allocated in the volume and MFT bitmap=
s
> > > > > >   - No bad sectors, cross-links, or security descriptor errors
> > > > > >
> > > > > > After this process completed, i ran `chkdsk /f` on all my other
> > > > > > drives, which cleaned up some small errors but nothing major.
> > > > > >
> > > > > > Attached are 3 logs, of every ntfs error my system has logged s=
ince
> > > > > > Oct 2, the shutdown hang, and all the times i cleared drop_cach=
es,
> > > > > > respectively. You may note that errors ocurred several more tim=
es than
> > > > > > i noticed and attempted to fix them.
> > > > > >
> > > > > > I made a few amateur attempts to recreate the issue, hypothesiz=
ing
> > > > > > that it might relate to moving and renaming, temp files, symlin=
ks,
> > > > > > hardlinks, and possibly full MFT tables, but i was never able t=
o.
> > > > > >
> > > > > > If necessary, i can supply the full chkdsk output too, and i'd =
be
> > > > > > happy to test a theoretical patch or supply further debug info.
> > > > > >
> > > > > > I wasn't sure who to address, so I addressed all three.
> > > > >
> > > > > Are you running a service that periodically issues FITRIM, such a=
s
> > > > > fstrim.timer? A patch fixing an incorrect FITRIM dicard range was
> > > > > released[1], but it is not included in your kernel version. Some =
of
> > > > > the corruption patterns appear consistent with this bug.
> > > > >
> > > > > Could you check whether FITRIM ran before the corruption occurred=
?
> > > > >
> > > > > [1]: https://lore.kernel.org/stable/20261023163719.159193934@linu=
xfoundation.org/
> > > > > --
> > > > > Thanks,
> > > > > Hyunchul
> > >
> > > --
> > > Thanks,
> > > Hyunchul
>
> > Destructacon@GRIDBUG:~$ systemctl status fstrim.timer
> > =E2=97=8F fstrim.timer - Discard unused filesystem blocks once a week
> >      Loaded: loaded (/usr/lib/systemd/system/fstrim.timer; enabled; pre=
set: enabled)
> >      Active: active (waiting) since Sun 2026-10-25 18:29:37 PDT; 1 day =
4h ago
> >  Invocation: 2c41b84c97d3454dbe41de1934c43f4a
> >     Trigger: Mon 2026-11-02 00:22:00 PST; 6 days left
> >    Triggers: =E2=97=8F fstrim.service
> >        Docs: man:fstrim
> >
> > Oct 25 18:29:37 GRIDBUG systemd[1]: Started fstrim.timer - Discard unus=
ed filesystem blocks once a week.
> > Destructacon@GRIDBUG:~$ systemctl list-timers | grep fstrim
> > Mon 2026-11-02 00:22:00 PST   6 days Mon 2026-10-26 01:20:31 PDT      1=
2h ago fstrim.timer                 fstrim.service
> > Destructacon@GRIDBUG:~$ journalctl -u fstrim.service --since "2026-10-0=
2"
> > Oct 05 01:05:41 GRIDBUG systemd[1]: Starting fstrim.service - Discard u=
nused blocks on filesystems from /etc/fstab...
> > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Chronos: 98.2 GiB (1054336=
57344 bytes) trimmed on /dev/sdb2
> > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /mnt/Xtra: 227.7 GiB (244457193=
472 bytes) trimmed on /dev/sda2
> > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /boot/efi: 578.7 MiB (606842880=
 bytes) trimmed on /dev/nvme0n1p1
> > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /boot: 1.3 GiB (1381433344 byte=
s) trimmed on /dev/nvme0n1p2
> > Oct 05 01:13:29 GRIDBUG fstrim[234714]: /: 688.8 GiB (739545485312 byte=
s) trimmed on /dev/nvme0n1p3
> > Oct 05 01:13:29 GRIDBUG systemd[1]: fstrim.service: Deactivated success=
fully.
> > Oct 05 01:13:29 GRIDBUG systemd[1]: Finished fstrim.service - Discard u=
nused blocks on filesystems from /etc/fstab.
> > Oct 05 01:13:29 GRIDBUG systemd[1]: fstrim.service: Consumed 2.245s CPU=
 time over 7min 47.949s wall clock time, 46.1M memory peak.
> > -- Boot adb54a13efe149098d12251c0fdaad43 --
> > Oct 12 06:59:03 GRIDBUG systemd[1]: Starting fstrim.service - Discard u=
nused blocks on filesystems from /etc/fstab...
> > Oct 12 07:06:37 GRIDBUG fstrim[66865]: /mnt/Chronos: 98.2 GiB (10543008=
9728 bytes) trimmed on /dev/sdb2
> > Oct 12 07:06:37 GRIDBUG fstrim[66865]: /mnt/Xtra: 226.5 GiB (2432474316=
80 bytes) trimmed on /dev/sda2
> > Oct 12 07:06:37 GRIDBUG fstrim[66865]: /boot/efi: 578.7 MiB (606842880 =
bytes) trimmed on /dev/nvme0n1p1
> > Oct 12 07:06:37 GRIDBUG fstrim[66865]: /boot: 1.3 GiB (1386246144 bytes=
) trimmed on /dev/nvme0n1p2
> > Oct 12 07:06:37 GRIDBUG fstrim[66865]: /: 665.8 GiB (714850619392 bytes=
) trimmed on /dev/nvme0n1p3
> > Oct 12 07:06:37 GRIDBUG systemd[1]: fstrim.service: Deactivated success=
fully.
> > Oct 12 07:06:37 GRIDBUG systemd[1]: Finished fstrim.service - Discard u=
nused blocks on filesystems from /etc/fstab.
> > Oct 12 07:06:37 GRIDBUG systemd[1]: fstrim.service: Consumed 2.188s CPU=
 time over 7min 33.638s wall clock time, 43.6M memory peak.
> > -- Boot 96460ff0097c418784dd3cf8e398bbbf --
> > Oct 19 09:35:47 GRIDBUG systemd[1]: Starting fstrim.service - Discard u=
nused blocks on filesystems from /etc/fstab...
> > Oct 19 09:43:16 GRIDBUG fstrim[65662]: /mnt/Chronos: 98.2 GiB (10542705=
8688 bytes) trimmed on /dev/sdb2
> > Oct 19 09:43:16 GRIDBUG fstrim[65662]: /mnt/Xtra: 226.3 GiB (2429840916=
48 bytes) trimmed on /dev/sda2
> > Oct 19 09:43:16 GRIDBUG fstrim[65662]: /boot/efi: 578.7 MiB (606842880 =
bytes) trimmed on /dev/nvme0n1p1
> > Oct 19 09:43:16 GRIDBUG fstrim[65662]: /boot: 1.3 GiB (1385877504 bytes=
) trimmed on /dev/nvme0n1p2
> > Oct 19 09:43:16 GRIDBUG fstrim[65662]: /: 655.2 GiB (703479914496 bytes=
) trimmed on /dev/nvme0n1p3
> > Oct 19 09:43:16 GRIDBUG systemd[1]: fstrim.service: Deactivated success=
fully.
> > Oct 19 09:43:16 GRIDBUG systemd[1]: Finished fstrim.service - Discard u=
nused blocks on filesystems from /etc/fstab.
> > Oct 19 09:43:16 GRIDBUG systemd[1]: fstrim.service: Consumed 2.812s CPU=
 time over 7min 28.705s wall clock time, 46.3M memory peak.
> > -- Boot 29d2f12d90914b1c80ca78c8427aed64 --
> > Oct 26 01:20:31 GRIDBUG systemd[1]: Starting fstrim.service - Discard u=
nused blocks on filesystems from /etc/fstab...
> > Oct 26 01:27:33 GRIDBUG fstrim[44163]: /mnt/Chronos: 95.9 GiB (10295575=
3472 bytes) trimmed on /dev/sdb2
> > Oct 26 01:27:33 GRIDBUG fstrim[44163]: /mnt/Xtra: 225.6 GiB (2422847897=
60 bytes) trimmed on /dev/sda2
> > Oct 26 01:27:33 GRIDBUG fstrim[44163]: /boot/efi: 578.7 MiB (606842880 =
bytes) trimmed on /dev/nvme0n1p1
> > Oct 26 01:27:33 GRIDBUG fstrim[44163]: /boot: 1.3 GiB (1385877504 bytes=
) trimmed on /dev/nvme0n1p2
> > Oct 26 01:27:33 GRIDBUG fstrim[44163]: /: 634.3 GiB (681097322496 bytes=
) trimmed on /dev/nvme0n1p3
> > Oct 26 01:27:33 GRIDBUG systemd[1]: fstrim.service: Deactivated success=
fully.
> > Oct 26 01:27:33 GRIDBUG systemd[1]: Finished fstrim.service - Discard u=
nused blocks on filesystems from /etc/fstab.
> > Oct 26 01:27:33 GRIDBUG systemd[1]: fstrim.service: Consumed 2.426s CPU=
 time over 7min 1.609s wall clock time, 46.8M memory peak.
> > Destructacon@GRIDBUG:~$ lsblk -D
> > NAME        DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
> > sda                0      512B       2G         0
> > =E2=94=9C=E2=94=80sda1             0      512B       2G         0
> > =E2=94=94=E2=94=80sda2             0      512B       2G         0
> > sdb                0      512B       2G         0
> > =E2=94=9C=E2=94=80sdb1             0      512B       2G         0
> > =E2=94=9C=E2=94=80sdb2             0      512B       2G         0
> > =E2=94=9C=E2=94=80sdb3             0      512B       2G         0
> > =E2=94=94=E2=94=80sdb4             0      512B       2G         0
> > sdc                0        0B       0B         0
> > =E2=94=9C=E2=94=80sdc1             0        0B       0B         0
> > =E2=94=9C=E2=94=80sdc2             0        0B       0B         0
> > =E2=94=94=E2=94=80sdc3             0        0B       0B         0
> > sdd                0        0B       0B         0
> > =E2=94=94=E2=94=80sdd1             0        0B       0B         0
> > zram0              0        4K       2T         0
> > nvme0n1            0      512B       2T         0
> > =E2=94=9C=E2=94=80nvme0n1p1        0      512B       2T         0
> > =E2=94=9C=E2=94=80nvme0n1p2        0      512B       2T         0
> > =E2=94=94=E2=94=80nvme0n1p3        0      512B       2T         0
> > Destructacon@GRIDBUG:~$ lsblk -o NAME,TYPE,FSTYPE,DISC-GRAN,DISC-MAX,MO=
UNTPOINTS
> > NAME        TYPE FSTYPE DISC-GRAN DISC-MAX MOUNTPOINTS
> > sda         disk             512B       2G
> > =E2=94=9C=E2=94=80sda1      part             512B       2G
> > =E2=94=94=E2=94=80sda2      part ntfs        512B       2G /mnt/Xtra
> > sdb         disk             512B       2G
> > =E2=94=9C=E2=94=80sdb1      part ntfs        512B       2G
> > =E2=94=9C=E2=94=80sdb2      part ntfs        512B       2G /mnt/Chronos
> > =E2=94=9C=E2=94=80sdb3      part vfat        512B       2G
> > =E2=94=94=E2=94=80sdb4      part ntfs        512B       2G
> > sdc         disk               0B       0B
> > =E2=94=9C=E2=94=80sdc1      part ntfs          0B       0B
> > =E2=94=9C=E2=94=80sdc2      part ntfs          0B       0B /mnt/Lore
> > =E2=94=94=E2=94=80sdc3      part ntfs          0B       0B
> > sdd         disk               0B       0B
> > =E2=94=94=E2=94=80sdd1      part ntfs          0B       0B /mnt/Spinnin=
gSlowly
> > zram0       disk swap          4K       2T [SWAP]
> > nvme0n1     disk             512B       2T
> > =E2=94=9C=E2=94=80nvme0n1p1 part vfat        512B       2T /boot/efi
> > =E2=94=9C=E2=94=80nvme0n1p2 part ext4        512B       2T /boot
> > =E2=94=94=E2=94=80nvme0n1p3 part btrfs       512B       2T /home
> >                                            /
>
>
> --
> Thanks,
> Hyunchul

--000000000000dd535d065ed0848f
Content-Type: text/plain; charset="UTF-8"; name="boot-list-and-lsblk.txt"
Content-Disposition: attachment; filename="boot-list-and-lsblk.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mvqktyoh0>
X-Attachment-Id: f_mvqktyoh0

RGVzdHJ1Y3RhY29uQEdSSURCVUc6fiQgam91cm5hbGN0bCAtLWxpc3QtYm9vdHMKSURYIEJPT1Qg
SUQgICAgICAgICAgICAgICAgICAgICAgICAgIEZJUlNUIEVOVFJZICAgICAgICAgICAgICAgICBM
QVNUIEVOVFJZCi0zMyBlMTkwYzBjYWFmMGE0OGFiYTU3ODk5Yzg2NGMyMDRlYSBTYXQgMjAyNi0w
OC0xNSAyMjo0ODoyNiBQRFQgVGh1IDIwMjYtMDgtMjAgMTI6Mzc6NDYgUERUCi0zMiBjYTcwMjk3
YzVkZjY0ODVhYTVlOTllMWIyYzA2ZjdmOSBUaHUgMjAyNi0wOC0yMCAwNTozOTo0OSBQRFQgVGh1
IDIwMjYtMDgtMjAgMTI6NDA6MTEgUERUCi0zMSBlMDRmNGM0YTc5Yjc0YTEzYmUzNTBjZjlkYjAy
NWU1MCBUaHUgMjAyNi0wOC0yMCAwNTo0MDozNCBQRFQgVGh1IDIwMjYtMDgtMjAgMTI6NDc6MTYg
UERUCi0zMCAyODA1NDgzYmJhZmM0MTAzYTNiYmFjMGJhZDRiYTkzNiBUaHUgMjAyNi0wOC0yMCAw
NTo0NzozOSBQRFQgRnJpIDIwMjYtMDgtMjggMDM6NDc6MDYgUERUCi0yOSBjZGFiMjViNDU1ZmU0
YjMyOGJmYzUwMWU1Y2JhYWE1NyBUaHUgMjAyNi0wOC0yNyAyMDo0ODowMyBQRFQgU2F0IDIwMjYt
MDgtMjkgMDM6MDQ6NTggUERUCi0yOCA5ZTRhNzAwYjMyN2M0OTk3YWNlZjE2OGE4NzA4ZDI4OCBG
cmkgMjAyNi0wOC0yOCAyMDoyMjoxNCBQRFQgU2F0IDIwMjYtMDgtMjkgMDM6Mjg6MDkgUERUCi0y
NyAzM2VmZTY4ODhmMzY0NzlhYjAzOWJlYTE0MTZjZDI1NCBGcmkgMjAyNi0wOC0yOCAyMToxMjo0
MSBQRFQgU3VuIDIwMjYtMDktMDYgMTc6MTU6MjIgUERUCi0yNiBhMWIyNzg5MTA1YTU0YjY5OTk5
MmQ1OGZiN2M5MDI5OCBTdW4gMjAyNi0wOS0wNiAxMDoxNjoyMSBQRFQgVGh1IDIwMjYtMDktMTAg
MjM6Mzg6MzggUERUCi0yNSBjYzRmODg2M2IxNTQ0OGQ5OGFjYmViZTY5YzNhOGMwNyBUaHUgMjAy
Ni0wOS0xMCAxNjozOTowMSBQRFQgVGh1IDIwMjYtMDktMTAgMjM6Mzk6MjkgUERUCi0yNCBjYzIz
MGNiNTc0Yzg0ZWNmOTVmNzMxNWRjOGQ3YzBmNyBGcmkgMjAyNi0wOS0xMSAwMjo0NTo0NSBQRFQg
RnJpIDIwMjYtMDktMTEgMTA6MDc6MDIgUERUCi0yMyBjMjAxM2JhZGEyYmU0ODMzYjZmOTU0Yzc5
Nzk0YmQwNiBGcmkgMjAyNi0wOS0xMSAwMzowODowNiBQRFQgRnJpIDIwMjYtMDktMTEgMTA6MTY6
MzYgUERUCi0yMiA2MmNhZWM2OTMzMjY0YmI5OTc3ZmRkOGE4ZjJjYTM0ZSBGcmkgMjAyNi0wOS0x
MSAwMzoxNjo1OSBQRFQgRnJpIDIwMjYtMDktMTEgMTA6MzY6MzkgUERUCi0yMSA3ZDFiMjhiYjMz
MzY0MTNkYjFjNTczZjE5MzIwZmU1NCBGcmkgMjAyNi0wOS0xMSAwMzozNzowMyBQRFQgRnJpIDIw
MjYtMDktMTggMTg6MTM6MzkgUERUCi0yMCAxYTRkNDExYmU2MjM0NzdiODlkODRkZmUxOThkYmFl
MSBGcmkgMjAyNi0wOS0xOCAxMToxNDowMyBQRFQgVHVlIDIwMjYtMDktMjIgMTk6MTQ6MDEgUERU
Ci0xOSBiZGM0Y2Q0ZDQ5OGQ0NDIyODE2Mzg1ODZmOGQ5N2JiNCBUdWUgMjAyNi0wOS0yMiAxMjox
NDoyNSBQRFQgVHVlIDIwMjYtMDktMjIgMTk6MTg6MjcgUERUCi0xOCBmMmMzNWZjMmUwN2M0Zjcz
OTI2OTIxZTk0M2NlNTFlZSBUdWUgMjAyNi0wOS0yMiAxMjoxOTowNyBQRFQgV2VkIDIwMjYtMDkt
MjMgMDA6NDc6MzEgUERUCi0xNyAyMDhmYzQ0ZTVlYjQ0NWE5OTU5OTI3ZjY1NzM4YTU5ZiBUdWUg
MjAyNi0wOS0yMiAxNzo1MjoxNCBQRFQgRnJpIDIwMjYtMDktMjUgMDM6NTA6MzMgUERUCi0xNiA5
M2Q1YjYzNzQ2MGE0YWJmOTIwNDRkMjFlYjgyN2I4OSBUaHUgMjAyNi0wOS0yNCAyMDo1OTowMSBQ
RFQgRnJpIDIwMjYtMDktMjUgMDQ6Mjc6MTIgUERUCi0xNSBhNWJiN2M1NjMyNGE0MmQwYThkOTYx
YjdhZjRkNDY4NSBGcmkgMjAyNi0wOS0yNSAwODoxNTozNiBQRFQgVHVlIDIwMjYtMDktMjkgMTQ6
NDk6MTAgUERUCi0xNCA2NmMzMGVkMmVjNmQ0ZWI4ODcwMGJlZTAxZjk3ZjdiZiBUdWUgMjAyNi0w
OS0yOSAwNzo1MDoxMiBQRFQgV2VkIDIwMjYtMDktMzAgMDA6NTg6MTQgUERUCi0xMyAxYmRmM2Nk
N2VhNTU0NmE5YmE5ZTc4NTQ0NGNjYjA2NyBUdWUgMjAyNi0wOS0yOSAxNzo1ODo1MiBQRFQgV2Vk
IDIwMjYtMDktMzAgMDE6MDI6MTAgUERUCi0xMiBhNzEwM2NjMDU3YjE0Y2I4YWZjYTEzNzNhMTFh
OTQwYiBUdWUgMjAyNi0wOS0yOSAxODowMjo0MyBQRFQgV2VkIDIwMjYtMDktMzAgMDE6NDE6NDIg
UERUCi0xMSBjNWNiNTA2NGJjZTU0ZDAzYjNjZTE2YmNhNDg2N2IxNyBUdWUgMjAyNi0wOS0yOSAx
ODo0MjoxMyBQRFQgRnJpIDIwMjYtMTAtMDIgMDE6NDI6MTAgUERUCi0xMCBhNzBjYjdhNGNkY2I0
M2QwYTFkMDQ1MmJiMDkyZWIwNyBUaHUgMjAyNi0xMC0wMSAxODo0MzowMCBQRFQgTW9uIDIwMjYt
MTAtMDUgMTM6MjA6MTMgUERUCiAtOSAwMmI5MDE4ODM1MDU0Y2E3YjFkODgwZjQyMjlkZTMxYiBN
b24gMjAyNi0xMC0wNSAwNjoyMDozNyBQRFQgV2VkIDIwMjYtMTAtMDcgMTg6MTg6MDIgUERUCiAt
OCBiNGI5MjI1OGIwZTI0N2U0OWI2YjJiNjQ4MGM2ZDFjNyBXZWQgMjAyNi0xMC0wNyAxMToxODoy
NiBQRFQgU2F0IDIwMjYtMTAtMTAgMjM6MDA6NDkgUERUCiAtNyBhZGI1NGExM2VmZTE0OTA5OGQx
MjI1MWMwZmRhYWQ0MyBTdW4gMjAyNi0xMC0xMSAwMDo1ODozOCBQRFQgV2VkIDIwMjYtMTAtMTQg
MjA6NDk6MTIgUERUCiAtNiBjYmYxODI5ZDVhZGE0NTVhODEzODFjNzY2YTdiMzE5NCBGcmkgMjAy
Ni0xMC0xNiAxMTowMjoxNiBQRFQgRnJpIDIwMjYtMTAtMTYgMTk6MDQ6MTQgUERUCiAtNSA4NmVi
NTExYjAyNjQ0ZWEyOTkwYjRmMjY1MmRmZWI3OCBGcmkgMjAyNi0xMC0xNiAxMjowNDo1OCBQRFQg
U3VuIDIwMjYtMTAtMTggMDU6MTg6NTYgUERUCiAtNCA5NjQ2MGZmMDA5N2M0MTg3ODRkZDNjZjhl
Mzk4YmJiZiBTdW4gMjAyNi0xMC0xOCAwNToxNjozMSBQRFQgVHVlIDIwMjYtMTAtMjAgMDM6Mzg6
MTMgUERUCiAtMyA1MzhiMDgyYWU0NzU0MTNhYTcxM2Q3M2NhYzVjNzg0ZCBUdWUgMjAyNi0xMC0y
MCAwMjoxOTowMiBQRFQgRnJpIDIwMjYtMTAtMjMgMTY6MzM6MjMgUERUCiAtMiBiMWJlOGQ1NDUx
ZmM0NDc3YjFiZmM3YWUzOWFlOWIwNiBGcmkgMjAyNi0xMC0yMyAxMjoyMjozNCBQRFQgRnJpIDIw
MjYtMTAtMjMgMTk6Mjg6NTQgUERUCiAtMSA2ODczZDA1ZjFjMmQ0MjQ2YTJkNThhN2Y5N2Q3NWJk
YSBGcmkgMjAyNi0xMC0yMyAxMjozMDozMyBQRFQgU3VuIDIwMjYtMTAtMjUgMTg6MTA6NTkgUERU
CiAgMCAyOWQyZjEyZDkwOTE0YjFjODBjYTc4Yzg0MjdhZWQ2NCBTdW4gMjAyNi0xMC0yNSAxMToy
OTozMCBQRFQgVHVlIDIwMjYtMTAtMjcgMDM6MjU6MDcgUERUCgoKRGVzdHJ1Y3RhY29uQEdSSURC
VUc6fiQgIGxzYmxrIC1vIE5BTUUsUEhZLVNFQyxMT0ctU0VDCk5BTUUgICAgICAgIFBIWS1TRUMg
TE9HLVNFQwpzZGEgICAgICAgICAgICAgNTEyICAgICA1MTIK4pSc4pSAc2RhMSAgICAgICAgICA1
MTIgICAgIDUxMgrilJTilIBzZGEyICAgICAgICAgIDUxMiAgICAgNTEyCnNkYiAgICAgICAgICAg
ICA1MTIgICAgIDUxMgrilJzilIBzZGIxICAgICAgICAgIDUxMiAgICAgNTEyCuKUnOKUgHNkYjIg
ICAgICAgICAgNTEyICAgICA1MTIK4pSc4pSAc2RiMyAgICAgICAgICA1MTIgICAgIDUxMgrilJTi
lIBzZGI0ICAgICAgICAgIDUxMiAgICAgNTEyCnNkYyAgICAgICAgICAgICA1MTIgICAgIDUxMgri
lJzilIBzZGMxICAgICAgICAgIDUxMiAgICAgNTEyCuKUnOKUgHNkYzIgICAgICAgICAgNTEyICAg
ICA1MTIK4pSU4pSAc2RjMyAgICAgICAgICA1MTIgICAgIDUxMgpzZGQgICAgICAgICAgICA0MDk2
ICAgICA1MTIK4pSU4pSAc2RkMSAgICAgICAgIDQwOTYgICAgIDUxMgp6cmFtMCAgICAgICAgICA0
MDk2ICAgIDQwOTYKbnZtZTBuMSAgICAgICAgIDUxMiAgICAgNTEyCuKUnOKUgG52bWUwbjFwMSAg
ICAgNTEyICAgICA1MTIK4pSc4pSAbnZtZTBuMXAyICAgICA1MTIgICAgIDUxMgrilJTilIBudm1l
MG4xcDMgICAgIDUxMiAgICAgNTEyCg==
--000000000000dd535d065ed0848f--
