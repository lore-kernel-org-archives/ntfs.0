Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793082100;
	b=UWYT1jYhFRbjR0hZaDPasJbzB7H3Tk5IEIke++UwkRO/okOpVpeljaMhIeGqkusArQIT
	 JIzDwR6jtY2xWt6kmY3eF1QjQ9s0hrqaYJaiBrOCy604rEsgyhg7SdxznkzX6ws0/lbw1
	 ulz7y7M3snJZb/t9VH2aUZdRArrDfXbJm4NFqSGiEKtFx19LxW2mNP+YVnyMSwvBfG2Ix
	 0+LsWEQTB22OlpjD5obZCCGgJ0I4Px8Ud0l84qgwOSjbXID3jZ7MsGGVcgnwZVADHUNC6
	 193llVBMA13uorcXotcx0H2b1ltPdBnU2nuxL90nSm4O/IM3MMUCx+CbBL1BTqdHL7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=+dwzZJMJtrGoJ5Q/KBBaHCTosvWjf/evRfwhGsMewnU=;
	b=WZZIn9J5ztu4QNx6VNkdcIDRpZx8sfeRWWsfWSbLSuFlV2TBwu5ndBj9SjzbQKA7/Ah+
	 76+vVITukvANGK6RF5bSVp7Tu2P1SZ9PpyQVAWBJdSQck9D10oW5q+yG1Oto6Dtrf2Y7e
	 117PKThTKJGLKMmxE3srBCLtFD/xt664BG8aIiNGajeJMaKu8IeAcrRGPKLyWtuFYfuhF
	 nIow75H0BtRTjTYA3vFPokkqZCoXvLIOZ/tPUdZ5tc8oVyXpEoH3QCTkF4/0uAIm6nbyd
	 Mg6LCzHNV8eevVLgrxnFcHoUH9Aj6LuigsHesBbpyzj8vzsX66+aKACB22sd2ZnslJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IMkSClI6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14298606A31A
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 06:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14298606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IMkSClI6
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b126b23502so4120947b3.1
        for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 23:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793082099; cv=none;
        d=google.com; s=arc-20260327;
        b=kn9mJAEP5ZjMVhvlv4CagltToGZa830hdxlnb0pG3MJDqR+y+oT2GqTtF93YJ/MORi
         SNkEwor5EbtmKrtHtgk2549UJfPao182azpN8vf8yL1ITMSviCDvmZsnlvjytzIOzqUW
         VAhFjvHYXaGtU5rRp9Ed4RZ7PGE/MltEecq9DIGTJFVqyWIjH1ynbgz0lbqdKxl2Uino
         pSSCaomN2Fclh3NyUkUX7D5LE/LH7B4CxR9DrATcMI9Ygzpb8cmtgRybAfiQCipq2msd
         9B0Ippa/x5wJPTaihDBNbIXif4hBHVLmmuP5SFAQPgbnDuqetHCj2UqDKGTp3lKZtkWu
         fMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+dwzZJMJtrGoJ5Q/KBBaHCTosvWjf/evRfwhGsMewnU=;
        fh=VunGTfO+5wxe6nEk/OXOMK/4D9tS997+MAJhvdcygQ4=;
        b=n1xn/xky19jGWaBKtWavM2G1e63qVI2q0VvXtX5yYZ09GBlV10+ikR4MzWq2CXcxL3
         j3uVdXozhqyn9NYsfpBCudjo9QUia1AykywS+CcrywDirF58RZ1SSsIeHcboa4Z9xywG
         qjuoXgG/KYkKp26XGiagIViiBRX6HA+kD1fS/3TAkvtE3phzD3MJF+pD+RxJ+Fy0OKUp
         6LNysmIsp68PPbBu7ZdePypPkif2veu69H5lSoFNC7UkpJKvLiO4+ZZGBXygrdnva2OZ
         S9vmSENEBUh9BdaSis0S9dKN5W3jItuDG0YYkm5L6ZWMB3bQBZ9M8GYU9DlO/0rhozG3
         j7iA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793082099; x=1793686899; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dwzZJMJtrGoJ5Q/KBBaHCTosvWjf/evRfwhGsMewnU=;
        b=IMkSClI6YcXbxR+jmF/lLsdB8Va8ko2mj/pe4xon32hEQ03wLKWuVw9aeUozoHiNFi
         iRbxiaBKmL+UM8mSe1OfVs8aktiWKcXSST4UbNN59dH12V95jqFcKtFKiYWCy/IBxu3A
         TBUtr9YxOlruK+KNJgQPIfgHbHpDKkzx/gkidSGH4xOobqQ2J8YmdHVLZPsEJrMhmvst
         NSNqqkl7QnqG9PNnUdpUftUbL4CGu0vmffLrQDS3tTdN944RAzcGpy0ynUZ71isw301J
         YxQmbzWOiq24486OP0fnIDYVd8TNbJcwdu4mOdEyrFsiraAyxXe2BCOToaYY998w03Sx
         CHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082099; x=1793686899;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+dwzZJMJtrGoJ5Q/KBBaHCTosvWjf/evRfwhGsMewnU=;
        b=d/lqkSnfiOdRPEE/Jh216Kr74xb6Rc+TwnOSFk6pLlvO9RgXK4yyGfSkrhX/x1ueS6
         /0Rz9tq3rpBl6SOy3ZBiWjMGK3kflpo4rL6vzOexj+HJpVbjTCnYZguYRGTo4zeqKwuY
         pTUg6RBEJ/5aLEklmCN4lPWrdbzblKtGuVHkLVZt66rfkiipLEq46CWgvntCcRySvqXz
         RyasqPwNanXhHVorbDhwwshentfb9W83i/cdXfFLBYyImBxJIbWHSc+gvn6DxG9ULgTL
         ekYH6eMGITgCEEuZGNCPUp2hvAu6WqgTlVQJvnU1p29aLbJx+QSa+731WRdMOc/GFEHl
         AwZQ==
X-Gm-Message-State: AFq9FYI8ozbRhIOWzRyGj2LHOHCRZZAgcu+3lem9MmnkiILJc+eqHGkz
	T2hIVYtrrRc7cKEItW1ud6xJ7wqo8IQooylnpwQ+Q0YHWaBW2wyTi5o7tqu0eAzmN3sJaIXv3y0
	LyuLzr6wkFPClahxxzz4TW+6n0s5HBSc=
X-Gm-Gg: AYBFou2wSgjflMGY04dTzNs4dXJxiZtr78cIyizmBji+ufnxhhRecrgNrMPr55WB+lP
	3GBoORhALRAq/HS59xtz3PYRi/1RZ9+lZZBMZVKE4UrjuuE7kpXdOkmibWw4nbnMsuZxPnk8XPz
	GXg8A6B2mMOOSgPjuk7UHdkkASDcI/w3ejMwejC0ldLB8HZSAWX3no8Ae76P5jk+RvAr1SQqXVQ
	dzaccin/OtmBrLLcCC85z+DsWNOpyZj7lFh2HFAYFh2pxCyrH6lCqOILvvqHgr/ftoC8X0OPhW7
	F0UBUrMLN/RVqqkhv4zdn3zuDKuWyMfl5ku9IvpTe8N+l/FJbB05x2Va6oqYCpEmeka3LuBxaeu
	JwfZbz8rPct3eFAogaNW7dURhf4LLGOgK3+Vwig==
X-Received: by 2002:a05:690c:e24b:20b0:8b0:cb79:345e with SMTP id
 00721157ae682-8b1669a3dbamr78347057b3.1.1793082098876; Mon, 26 Oct 2026
 23:21:38 -0700 (PDT)
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
 <auA-MOGIj-J4dLGF@hyunchul-PC02>
In-Reply-To: <auA-MOGIj-J4dLGF@hyunchul-PC02>
From: Jaidan Brashier <jobrashier@gmail.com>
Date: Mon, 26 Oct 2026 23:21:26 -0700
X-Gm-Features: AclHuK9DPuLpzCmW4rAs7gN4cnYGDYPC3q_z0yJEFNDGEzk1uZHUq6PipuFmXD0
Message-ID: <CAPLZLeaVAoFefe06b+7MaoLHVMJbAZ+PaDuVkiPMAry6TKpE0w@mail.gmail.com>
Subject: Re: ntfs: EIO/stale-reference errors on several volumes and on-disk
 corruption after switching from ntfs3 (Fedora 44 7.2.x)
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linkinjeon@kernel.org
Content-Type: multipart/mixed; boundary="0000000000008ebad9065ecc7530"

--0000000000008ebad9065ecc7530
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I accidentally addressed only Hyunchul in my last message. I have
copied to reply properly including the mailing list, sorry for
duplicate mail:

Absolutely!
Find attached all the logs i looked at plus the one you requested

On Mon, Oct 26, 2026 at 11:01=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.com> w=
rote:
>
> On Mon, Oct 26, 2026 at 09:55:17PM -0700, Jaidan Brashier wrote:
> > Hello Hyunchul,
> > Thank you for your timely response!
> >
> > I do have fstrim.timer enabled. According to my logs, since Oct 2, it
> > has issued fstrim requests 4 times:
> > Oct 05 01:05:41,
> > Oct 12 06:59:03,
> > Oct 19 09:35:47,
> > Oct 26 01:20:31 (today).
> >
> > Cross-referencing these times with when the issues occurred, I do not
> > believe there is significant correlation.
> >
> > Additionally, fstrim.timer only operates on drives that have
> > discarding enabled, which my two HDDs do not, including sdc2, the site
> > of the major corruption.
> > The fstrim activity logs confirm that while it has been operating, it
> > has only operated on my SSDs; therefore, it cannot be the sole culprit
> > behind the issue that has spanned both drive types.
> > I can post these logs as well if you'd like.
>
> Thanks, this is very useful information.
> However, just to double-check, could you please share those logs and
> the output of the following command?
>
> lsblk -o NAME,TYPE,FSTYPE,DISC-GRAN,DISC-MAX,MOUNTPOINTS
>
> >
> > On Sun, Oct 25, 2026 at 11:43=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.co=
m> wrote:
> > >
> > > Hi Jaidan,
> > >
> > > On Sat, Oct 24, 2026 at 03:18:21PM -0700, Jaidan Brashier wrote:
> > > > Hello.
> > > > Recently on Oct 2, i swapped from ntfs3 to ntfs, and since then I=
=E2=80=99ve
> > > > seen recurring EIO/stale-reference errors on four NTFS volumes, a
> > > > hardlink creation error, and one case of on-disk corruption (repair=
ed
> > > > by Windows chkdsk) on Oct 23. Logs attached.
> > > >
> > > > Environment
> > > >   OS: Fedora 44 KDE Plasma 6.7. Incidents spanned several boots
> > > > ranging versions 7.2.8-200.fc44.x86_64 to 7.2.11-200.fc44.x86_64
> > > >   Mount (all 4 drives):    rw,noatime,uid=3D1000,gid=3D1000,umask=
=3D00,iocharset=3Dutf8,
> > > >             case_sensitive,errors=3Dcontinue,mft_zone_multiplier=3D=
1,
> > > >             windows_names,native_symlink=3Draw,symlink=3Dwsl
> > > >   Devices:   corruption occurred on a SATA HDD, sdc2, NTFS 3.1, 4k =
clusters.
> > > >   3 other NTFS drives are present (2 SATA SSDs and another SATA HDD=
).
> > > >   smartctl and Windows chkdsk /r report no bad sectors on any drive=
.
> > > >
> > > > Fast Startup has been disabled for months. No volume was ever flagg=
ed
> > > > dirty. Unclean shutdowns occurred on these volumes before the switc=
h;
> > > > none that I know of since.
> > > >
> > > > Workload
> > > >   Previous issues: General desktop use; I don't know precisely what
> > > > activities preceded previous errors
> > > >   Most recent issue: Steam Linux Runtime 4.0 update (heavy I/O
> > > > traffic, lots of temp files, symlinks and hardlinks)
> > > >
> > > > Twice prior, i noted a seemingly random file on my system was refus=
ing
> > > > to be read, returning an I/O error.
> > > > Both of those times, I fixed the issue by running `sync && echo 3 |
> > > > sudo tee /proc/sys/vm/drop_caches`, unmounting the drive, and
> > > > remounting, in some order (unsure). The underlying files were prist=
ine
> > > > both times, i therefore suspect the issue was only a stale referenc=
e
> > > > in the cache.
> > > >
> > > > Yesterday (Oct 23) i encountered a much more pronounced error i
> > > > believe to be of the same kind as, or otherwise some how related to=
,
> > > > the previous ones.
> > > > The Steam client errored while updating its Linux Runtime 4.0 packa=
ge.
> > > > After some digging, i found similar EIO messages, and expecting an
> > > > error of the same kind, i tried unmounting/remounting and clearing
> > > > drop_caches a few times.
> > > > Realizing that did not fix the problem this time, I shutdown my
> > > > machine in preparation to boot up my secondary Windows install to r=
un
> > > > chkdsk. Shutdown hung for ~10 minutes (normally ~10 seconds), likel=
y
> > > > on the NTFS volume.
> > > >
> > > > Booting into windows, I ran `chkdsk /f /r /x` on the relevant drive=
.
> > > > chkdsk cleaned up the following errors, and more:
> > > >   - ~350 index entries deleted from $R of file 0x1A ($Extend\$Repar=
se)
> > > >   - Many $I30 entries deleted that pointed at nonexistent records,
> > > >     including runtime library names and Steam appmanifest/appworksh=
op files
> > > >   - "Recovering orphaned file appworkshop_32470.acf.async217386.tmp
> > > >     (and two more .tmp names) into directory 2B582".
> > > >   - Several libraries (libcurl, libcrypto, libSDL3) recovered into =
two
> > > >     directories each. Expected hardlinks
> > > >   - Free space marked as allocated in the volume and MFT bitmaps
> > > >   - No bad sectors, cross-links, or security descriptor errors
> > > >
> > > > After this process completed, i ran `chkdsk /f` on all my other
> > > > drives, which cleaned up some small errors but nothing major.
> > > >
> > > > Attached are 3 logs, of every ntfs error my system has logged since
> > > > Oct 2, the shutdown hang, and all the times i cleared drop_caches,
> > > > respectively. You may note that errors ocurred several more times t=
han
> > > > i noticed and attempted to fix them.
> > > >
> > > > I made a few amateur attempts to recreate the issue, hypothesizing
> > > > that it might relate to moving and renaming, temp files, symlinks,
> > > > hardlinks, and possibly full MFT tables, but i was never able to.
> > > >
> > > > If necessary, i can supply the full chkdsk output too, and i'd be
> > > > happy to test a theoretical patch or supply further debug info.
> > > >
> > > > I wasn't sure who to address, so I addressed all three.
> > >
> > > Are you running a service that periodically issues FITRIM, such as
> > > fstrim.timer? A patch fixing an incorrect FITRIM dicard range was
> > > released[1], but it is not included in your kernel version. Some of
> > > the corruption patterns appear consistent with this bug.
> > >
> > > Could you check whether FITRIM ran before the corruption occurred?
> > >
> > > [1]: https://lore.kernel.org/stable/20261023163719.159193934@linuxfou=
ndation.org/
> > > --
> > > Thanks,
> > > Hyunchul
>
> --
> Thanks,
> Hyunchul

--0000000000008ebad9065ecc7530
Content-Type: text/plain; charset="UTF-8"; name="fstrim-logs.txt"
Content-Disposition: attachment; filename="fstrim-logs.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mvqaqax50>
X-Attachment-Id: f_mvqaqax50

RGVzdHJ1Y3RhY29uQEdSSURCVUc6fiQgc3lzdGVtY3RsIHN0YXR1cyBmc3RyaW0udGltZXIK4peP
IGZzdHJpbS50aW1lciAtIERpc2NhcmQgdW51c2VkIGZpbGVzeXN0ZW0gYmxvY2tzIG9uY2UgYSB3
ZWVrCiAgICAgTG9hZGVkOiBsb2FkZWQgKC91c3IvbGliL3N5c3RlbWQvc3lzdGVtL2ZzdHJpbS50
aW1lcjsgZW5hYmxlZDsgcHJlc2V0OiBlbmFibGVkKQogICAgIEFjdGl2ZTogYWN0aXZlICh3YWl0
aW5nKSBzaW5jZSBTdW4gMjAyNi0xMC0yNSAxODoyOTozNyBQRFQ7IDEgZGF5IDRoIGFnbwogSW52
b2NhdGlvbjogMmM0MWI4NGM5N2QzNDU0ZGJlNDFkZTE5MzRjNDNmNGEKICAgIFRyaWdnZXI6IE1v
biAyMDI2LTExLTAyIDAwOjIyOjAwIFBTVDsgNiBkYXlzIGxlZnQKICAgVHJpZ2dlcnM6IOKXjyBm
c3RyaW0uc2VydmljZQogICAgICAgRG9jczogbWFuOmZzdHJpbQoKT2N0IDI1IDE4OjI5OjM3IEdS
SURCVUcgc3lzdGVtZFsxXTogU3RhcnRlZCBmc3RyaW0udGltZXIgLSBEaXNjYXJkIHVudXNlZCBm
aWxlc3lzdGVtIGJsb2NrcyBvbmNlIGEgd2Vlay4KRGVzdHJ1Y3RhY29uQEdSSURCVUc6fiQgc3lz
dGVtY3RsIGxpc3QtdGltZXJzIHwgZ3JlcCBmc3RyaW0KTW9uIDIwMjYtMTEtMDIgMDA6MjI6MDAg
UFNUICAgNiBkYXlzIE1vbiAyMDI2LTEwLTI2IDAxOjIwOjMxIFBEVCAgICAgIDEyaCBhZ28gZnN0
cmltLnRpbWVyICAgICAgICAgICAgICAgICBmc3RyaW0uc2VydmljZQpEZXN0cnVjdGFjb25AR1JJ
REJVRzp+JCBqb3VybmFsY3RsIC11IGZzdHJpbS5zZXJ2aWNlIC0tc2luY2UgIjIwMjYtMTAtMDIi
Ck9jdCAwNSAwMTowNTo0MSBHUklEQlVHIHN5c3RlbWRbMV06IFN0YXJ0aW5nIGZzdHJpbS5zZXJ2
aWNlIC0gRGlzY2FyZCB1bnVzZWQgYmxvY2tzIG9uIGZpbGVzeXN0ZW1zIGZyb20gL2V0Yy9mc3Rh
Yi4uLgpPY3QgMDUgMDE6MTM6MjkgR1JJREJVRyBmc3RyaW1bMjM0NzE0XTogL21udC9DaHJvbm9z
OiA5OC4yIEdpQiAoMTA1NDMzNjU3MzQ0IGJ5dGVzKSB0cmltbWVkIG9uIC9kZXYvc2RiMgpPY3Qg
MDUgMDE6MTM6MjkgR1JJREJVRyBmc3RyaW1bMjM0NzE0XTogL21udC9YdHJhOiAyMjcuNyBHaUIg
KDI0NDQ1NzE5MzQ3MiBieXRlcykgdHJpbW1lZCBvbiAvZGV2L3NkYTIKT2N0IDA1IDAxOjEzOjI5
IEdSSURCVUcgZnN0cmltWzIzNDcxNF06IC9ib290L2VmaTogNTc4LjcgTWlCICg2MDY4NDI4ODAg
Ynl0ZXMpIHRyaW1tZWQgb24gL2Rldi9udm1lMG4xcDEKT2N0IDA1IDAxOjEzOjI5IEdSSURCVUcg
ZnN0cmltWzIzNDcxNF06IC9ib290OiAxLjMgR2lCICgxMzgxNDMzMzQ0IGJ5dGVzKSB0cmltbWVk
IG9uIC9kZXYvbnZtZTBuMXAyCk9jdCAwNSAwMToxMzoyOSBHUklEQlVHIGZzdHJpbVsyMzQ3MTRd
OiAvOiA2ODguOCBHaUIgKDczOTU0NTQ4NTMxMiBieXRlcykgdHJpbW1lZCBvbiAvZGV2L252bWUw
bjFwMwpPY3QgMDUgMDE6MTM6MjkgR1JJREJVRyBzeXN0ZW1kWzFdOiBmc3RyaW0uc2VydmljZTog
RGVhY3RpdmF0ZWQgc3VjY2Vzc2Z1bGx5LgpPY3QgMDUgMDE6MTM6MjkgR1JJREJVRyBzeXN0ZW1k
WzFdOiBGaW5pc2hlZCBmc3RyaW0uc2VydmljZSAtIERpc2NhcmQgdW51c2VkIGJsb2NrcyBvbiBm
aWxlc3lzdGVtcyBmcm9tIC9ldGMvZnN0YWIuCk9jdCAwNSAwMToxMzoyOSBHUklEQlVHIHN5c3Rl
bWRbMV06IGZzdHJpbS5zZXJ2aWNlOiBDb25zdW1lZCAyLjI0NXMgQ1BVIHRpbWUgb3ZlciA3bWlu
IDQ3Ljk0OXMgd2FsbCBjbG9jayB0aW1lLCA0Ni4xTSBtZW1vcnkgcGVhay4KLS0gQm9vdCBhZGI1
NGExM2VmZTE0OTA5OGQxMjI1MWMwZmRhYWQ0MyAtLQpPY3QgMTIgMDY6NTk6MDMgR1JJREJVRyBz
eXN0ZW1kWzFdOiBTdGFydGluZyBmc3RyaW0uc2VydmljZSAtIERpc2NhcmQgdW51c2VkIGJsb2Nr
cyBvbiBmaWxlc3lzdGVtcyBmcm9tIC9ldGMvZnN0YWIuLi4KT2N0IDEyIDA3OjA2OjM3IEdSSURC
VUcgZnN0cmltWzY2ODY1XTogL21udC9DaHJvbm9zOiA5OC4yIEdpQiAoMTA1NDMwMDg5NzI4IGJ5
dGVzKSB0cmltbWVkIG9uIC9kZXYvc2RiMgpPY3QgMTIgMDc6MDY6MzcgR1JJREJVRyBmc3RyaW1b
NjY4NjVdOiAvbW50L1h0cmE6IDIyNi41IEdpQiAoMjQzMjQ3NDMxNjgwIGJ5dGVzKSB0cmltbWVk
IG9uIC9kZXYvc2RhMgpPY3QgMTIgMDc6MDY6MzcgR1JJREJVRyBmc3RyaW1bNjY4NjVdOiAvYm9v
dC9lZmk6IDU3OC43IE1pQiAoNjA2ODQyODgwIGJ5dGVzKSB0cmltbWVkIG9uIC9kZXYvbnZtZTBu
MXAxCk9jdCAxMiAwNzowNjozNyBHUklEQlVHIGZzdHJpbVs2Njg2NV06IC9ib290OiAxLjMgR2lC
ICgxMzg2MjQ2MTQ0IGJ5dGVzKSB0cmltbWVkIG9uIC9kZXYvbnZtZTBuMXAyCk9jdCAxMiAwNzow
NjozNyBHUklEQlVHIGZzdHJpbVs2Njg2NV06IC86IDY2NS44IEdpQiAoNzE0ODUwNjE5MzkyIGJ5
dGVzKSB0cmltbWVkIG9uIC9kZXYvbnZtZTBuMXAzCk9jdCAxMiAwNzowNjozNyBHUklEQlVHIHN5
c3RlbWRbMV06IGZzdHJpbS5zZXJ2aWNlOiBEZWFjdGl2YXRlZCBzdWNjZXNzZnVsbHkuCk9jdCAx
MiAwNzowNjozNyBHUklEQlVHIHN5c3RlbWRbMV06IEZpbmlzaGVkIGZzdHJpbS5zZXJ2aWNlIC0g
RGlzY2FyZCB1bnVzZWQgYmxvY2tzIG9uIGZpbGVzeXN0ZW1zIGZyb20gL2V0Yy9mc3RhYi4KT2N0
IDEyIDA3OjA2OjM3IEdSSURCVUcgc3lzdGVtZFsxXTogZnN0cmltLnNlcnZpY2U6IENvbnN1bWVk
IDIuMTg4cyBDUFUgdGltZSBvdmVyIDdtaW4gMzMuNjM4cyB3YWxsIGNsb2NrIHRpbWUsIDQzLjZN
IG1lbW9yeSBwZWFrLgotLSBCb290IDk2NDYwZmYwMDk3YzQxODc4NGRkM2NmOGUzOThiYmJmIC0t
Ck9jdCAxOSAwOTozNTo0NyBHUklEQlVHIHN5c3RlbWRbMV06IFN0YXJ0aW5nIGZzdHJpbS5zZXJ2
aWNlIC0gRGlzY2FyZCB1bnVzZWQgYmxvY2tzIG9uIGZpbGVzeXN0ZW1zIGZyb20gL2V0Yy9mc3Rh
Yi4uLgpPY3QgMTkgMDk6NDM6MTYgR1JJREJVRyBmc3RyaW1bNjU2NjJdOiAvbW50L0Nocm9ub3M6
IDk4LjIgR2lCICgxMDU0MjcwNTg2ODggYnl0ZXMpIHRyaW1tZWQgb24gL2Rldi9zZGIyCk9jdCAx
OSAwOTo0MzoxNiBHUklEQlVHIGZzdHJpbVs2NTY2Ml06IC9tbnQvWHRyYTogMjI2LjMgR2lCICgy
NDI5ODQwOTE2NDggYnl0ZXMpIHRyaW1tZWQgb24gL2Rldi9zZGEyCk9jdCAxOSAwOTo0MzoxNiBH
UklEQlVHIGZzdHJpbVs2NTY2Ml06IC9ib290L2VmaTogNTc4LjcgTWlCICg2MDY4NDI4ODAgYnl0
ZXMpIHRyaW1tZWQgb24gL2Rldi9udm1lMG4xcDEKT2N0IDE5IDA5OjQzOjE2IEdSSURCVUcgZnN0
cmltWzY1NjYyXTogL2Jvb3Q6IDEuMyBHaUIgKDEzODU4Nzc1MDQgYnl0ZXMpIHRyaW1tZWQgb24g
L2Rldi9udm1lMG4xcDIKT2N0IDE5IDA5OjQzOjE2IEdSSURCVUcgZnN0cmltWzY1NjYyXTogLzog
NjU1LjIgR2lCICg3MDM0Nzk5MTQ0OTYgYnl0ZXMpIHRyaW1tZWQgb24gL2Rldi9udm1lMG4xcDMK
T2N0IDE5IDA5OjQzOjE2IEdSSURCVUcgc3lzdGVtZFsxXTogZnN0cmltLnNlcnZpY2U6IERlYWN0
aXZhdGVkIHN1Y2Nlc3NmdWxseS4KT2N0IDE5IDA5OjQzOjE2IEdSSURCVUcgc3lzdGVtZFsxXTog
RmluaXNoZWQgZnN0cmltLnNlcnZpY2UgLSBEaXNjYXJkIHVudXNlZCBibG9ja3Mgb24gZmlsZXN5
c3RlbXMgZnJvbSAvZXRjL2ZzdGFiLgpPY3QgMTkgMDk6NDM6MTYgR1JJREJVRyBzeXN0ZW1kWzFd
OiBmc3RyaW0uc2VydmljZTogQ29uc3VtZWQgMi44MTJzIENQVSB0aW1lIG92ZXIgN21pbiAyOC43
MDVzIHdhbGwgY2xvY2sgdGltZSwgNDYuM00gbWVtb3J5IHBlYWsuCi0tIEJvb3QgMjlkMmYxMmQ5
MDkxNGIxYzgwY2E3OGM4NDI3YWVkNjQgLS0KT2N0IDI2IDAxOjIwOjMxIEdSSURCVUcgc3lzdGVt
ZFsxXTogU3RhcnRpbmcgZnN0cmltLnNlcnZpY2UgLSBEaXNjYXJkIHVudXNlZCBibG9ja3Mgb24g
ZmlsZXN5c3RlbXMgZnJvbSAvZXRjL2ZzdGFiLi4uCk9jdCAyNiAwMToyNzozMyBHUklEQlVHIGZz
dHJpbVs0NDE2M106IC9tbnQvQ2hyb25vczogOTUuOSBHaUIgKDEwMjk1NTc1MzQ3MiBieXRlcykg
dHJpbW1lZCBvbiAvZGV2L3NkYjIKT2N0IDI2IDAxOjI3OjMzIEdSSURCVUcgZnN0cmltWzQ0MTYz
XTogL21udC9YdHJhOiAyMjUuNiBHaUIgKDI0MjI4NDc4OTc2MCBieXRlcykgdHJpbW1lZCBvbiAv
ZGV2L3NkYTIKT2N0IDI2IDAxOjI3OjMzIEdSSURCVUcgZnN0cmltWzQ0MTYzXTogL2Jvb3QvZWZp
OiA1NzguNyBNaUIgKDYwNjg0Mjg4MCBieXRlcykgdHJpbW1lZCBvbiAvZGV2L252bWUwbjFwMQpP
Y3QgMjYgMDE6Mjc6MzMgR1JJREJVRyBmc3RyaW1bNDQxNjNdOiAvYm9vdDogMS4zIEdpQiAoMTM4
NTg3NzUwNCBieXRlcykgdHJpbW1lZCBvbiAvZGV2L252bWUwbjFwMgpPY3QgMjYgMDE6Mjc6MzMg
R1JJREJVRyBmc3RyaW1bNDQxNjNdOiAvOiA2MzQuMyBHaUIgKDY4MTA5NzMyMjQ5NiBieXRlcykg
dHJpbW1lZCBvbiAvZGV2L252bWUwbjFwMwpPY3QgMjYgMDE6Mjc6MzMgR1JJREJVRyBzeXN0ZW1k
WzFdOiBmc3RyaW0uc2VydmljZTogRGVhY3RpdmF0ZWQgc3VjY2Vzc2Z1bGx5LgpPY3QgMjYgMDE6
Mjc6MzMgR1JJREJVRyBzeXN0ZW1kWzFdOiBGaW5pc2hlZCBmc3RyaW0uc2VydmljZSAtIERpc2Nh
cmQgdW51c2VkIGJsb2NrcyBvbiBmaWxlc3lzdGVtcyBmcm9tIC9ldGMvZnN0YWIuCk9jdCAyNiAw
MToyNzozMyBHUklEQlVHIHN5c3RlbWRbMV06IGZzdHJpbS5zZXJ2aWNlOiBDb25zdW1lZCAyLjQy
NnMgQ1BVIHRpbWUgb3ZlciA3bWluIDEuNjA5cyB3YWxsIGNsb2NrIHRpbWUsIDQ2LjhNIG1lbW9y
eSBwZWFrLgpEZXN0cnVjdGFjb25AR1JJREJVRzp+JCBsc2JsayAtRApOQU1FICAgICAgICBESVND
LUFMTiBESVNDLUdSQU4gRElTQy1NQVggRElTQy1aRVJPCnNkYSAgICAgICAgICAgICAgICAwICAg
ICAgNTEyQiAgICAgICAyRyAgICAgICAgIDAK4pSc4pSAc2RhMSAgICAgICAgICAgICAwICAgICAg
NTEyQiAgICAgICAyRyAgICAgICAgIDAK4pSU4pSAc2RhMiAgICAgICAgICAgICAwICAgICAgNTEy
QiAgICAgICAyRyAgICAgICAgIDAKc2RiICAgICAgICAgICAgICAgIDAgICAgICA1MTJCICAgICAg
IDJHICAgICAgICAgMArilJzilIBzZGIxICAgICAgICAgICAgIDAgICAgICA1MTJCICAgICAgIDJH
ICAgICAgICAgMArilJzilIBzZGIyICAgICAgICAgICAgIDAgICAgICA1MTJCICAgICAgIDJHICAg
ICAgICAgMArilJzilIBzZGIzICAgICAgICAgICAgIDAgICAgICA1MTJCICAgICAgIDJHICAgICAg
ICAgMArilJTilIBzZGI0ICAgICAgICAgICAgIDAgICAgICA1MTJCICAgICAgIDJHICAgICAgICAg
MApzZGMgICAgICAgICAgICAgICAgMCAgICAgICAgMEIgICAgICAgMEIgICAgICAgICAwCuKUnOKU
gHNkYzEgICAgICAgICAgICAgMCAgICAgICAgMEIgICAgICAgMEIgICAgICAgICAwCuKUnOKUgHNk
YzIgICAgICAgICAgICAgMCAgICAgICAgMEIgICAgICAgMEIgICAgICAgICAwCuKUlOKUgHNkYzMg
ICAgICAgICAgICAgMCAgICAgICAgMEIgICAgICAgMEIgICAgICAgICAwCnNkZCAgICAgICAgICAg
ICAgICAwICAgICAgICAwQiAgICAgICAwQiAgICAgICAgIDAK4pSU4pSAc2RkMSAgICAgICAgICAg
ICAwICAgICAgICAwQiAgICAgICAwQiAgICAgICAgIDAKenJhbTAgICAgICAgICAgICAgIDAgICAg
ICAgIDRLICAgICAgIDJUICAgICAgICAgMApudm1lMG4xICAgICAgICAgICAgMCAgICAgIDUxMkIg
ICAgICAgMlQgICAgICAgICAwCuKUnOKUgG52bWUwbjFwMSAgICAgICAgMCAgICAgIDUxMkIgICAg
ICAgMlQgICAgICAgICAwCuKUnOKUgG52bWUwbjFwMiAgICAgICAgMCAgICAgIDUxMkIgICAgICAg
MlQgICAgICAgICAwCuKUlOKUgG52bWUwbjFwMyAgICAgICAgMCAgICAgIDUxMkIgICAgICAgMlQg
ICAgICAgICAwCkRlc3RydWN0YWNvbkBHUklEQlVHOn4kIGxzYmxrIC1vIE5BTUUsVFlQRSxGU1RZ
UEUsRElTQy1HUkFOLERJU0MtTUFYLE1PVU5UUE9JTlRTCk5BTUUgICAgICAgIFRZUEUgRlNUWVBF
IERJU0MtR1JBTiBESVNDLU1BWCBNT1VOVFBPSU5UUwpzZGEgICAgICAgICBkaXNrICAgICAgICAg
ICAgIDUxMkIgICAgICAgMkcK4pSc4pSAc2RhMSAgICAgIHBhcnQgICAgICAgICAgICAgNTEyQiAg
ICAgICAyRwrilJTilIBzZGEyICAgICAgcGFydCBudGZzICAgICAgICA1MTJCICAgICAgIDJHIC9t
bnQvWHRyYQpzZGIgICAgICAgICBkaXNrICAgICAgICAgICAgIDUxMkIgICAgICAgMkcK4pSc4pSA
c2RiMSAgICAgIHBhcnQgbnRmcyAgICAgICAgNTEyQiAgICAgICAyRwrilJzilIBzZGIyICAgICAg
cGFydCBudGZzICAgICAgICA1MTJCICAgICAgIDJHIC9tbnQvQ2hyb25vcwrilJzilIBzZGIzICAg
ICAgcGFydCB2ZmF0ICAgICAgICA1MTJCICAgICAgIDJHCuKUlOKUgHNkYjQgICAgICBwYXJ0IG50
ZnMgICAgICAgIDUxMkIgICAgICAgMkcKc2RjICAgICAgICAgZGlzayAgICAgICAgICAgICAgIDBC
ICAgICAgIDBCCuKUnOKUgHNkYzEgICAgICBwYXJ0IG50ZnMgICAgICAgICAgMEIgICAgICAgMEIK
4pSc4pSAc2RjMiAgICAgIHBhcnQgbnRmcyAgICAgICAgICAwQiAgICAgICAwQiAvbW50L0xvcmUK
4pSU4pSAc2RjMyAgICAgIHBhcnQgbnRmcyAgICAgICAgICAwQiAgICAgICAwQgpzZGQgICAgICAg
ICBkaXNrICAgICAgICAgICAgICAgMEIgICAgICAgMEIK4pSU4pSAc2RkMSAgICAgIHBhcnQgbnRm
cyAgICAgICAgICAwQiAgICAgICAwQiAvbW50L1NwaW5uaW5nU2xvd2x5CnpyYW0wICAgICAgIGRp
c2sgc3dhcCAgICAgICAgICA0SyAgICAgICAyVCBbU1dBUF0KbnZtZTBuMSAgICAgZGlzayAgICAg
ICAgICAgICA1MTJCICAgICAgIDJUCuKUnOKUgG52bWUwbjFwMSBwYXJ0IHZmYXQgICAgICAgIDUx
MkIgICAgICAgMlQgL2Jvb3QvZWZpCuKUnOKUgG52bWUwbjFwMiBwYXJ0IGV4dDQgICAgICAgIDUx
MkIgICAgICAgMlQgL2Jvb3QK4pSU4pSAbnZtZTBuMXAzIHBhcnQgYnRyZnMgICAgICAgNTEyQiAg
ICAgICAyVCAvaG9tZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Lwo=
--0000000000008ebad9065ecc7530--
