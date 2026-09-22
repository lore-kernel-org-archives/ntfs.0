Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02120136351
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 01:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790041112; cv=none; b=s2BduBkzPEmk9gWdRNUxw8PcKwo3SOrwdE1qQWoNpH5P6D6PFQhHV9dKVBpoT7ZshaDJ1ckahxiV/JItcqz101/EDI9z1ll6QG3apLFZtV/I7R8/IubY41uzhyFFOJE7AGAZVFJGJm16X0QTmtGH7dBMP6+uxeyXgbEh1nNyLhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790041112; c=relaxed/simple;
	bh=rP9bOsI/Vw45Kq3GvGKjQNfwet9rCfrhWhSikCfBoQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAQCV9TYkY0r5ShCQjlcm33aldmadACzw9qo4ShW3YKK/XL/n5td5ta4XFsXzbQhyENQqFzxR4QEk0wL5Jl3/6khjyI+0MX79S/fxCxjB9kRGZr6pACUYMOiZcnueZibJPOFXBAcu9KTb8+YWLqzkLrnbvcdN+4P51RhOfS6Igk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGFoHwDs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGFoHwDs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D42C1F00898
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 01:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790041110;
	bh=r+xQ8n/EjO1xAHa7oj3qvalz0JvaeK3MRnDLuBBgKD4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SGFoHwDs0IexcYBkYh5VhFD1nOkQXRPNrPL2f8X/Gt4nb+UTOeUMSmXQ1OXjZ9/Sv
	 iPV73HNEtqSDZxSZCOhwMICmGBcqhP4gGGU0apinqGMniIPdY5NGjkZtTcvRK3whCs
	 Izl1zoh61RVazMVa4PJUE/TKTwLw/b7UzVB2fh1/sYtsELeu9Qa/ZfMKEsh+c3VOcu
	 wvoJ9kBDnhea46MUFjwtnuIP5pnXKZpjN+CuGK+OLTbAjcTUR4lGDwv/5CUvR/oG9J
	 JhUYW5V14lyiHYaydWiOlrLL11mX/ApjFQeTsY58/CAdTZs/mBZdYGGjVTOm79BKEH
	 ePFRQWSIRtzFA==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so528723466b.0
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 18:38:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw4RD+6d/TyFtQ2AR7hnli6fVzsCyqCmc2MtrFA2N/XdwGTGni63nn1hUYByIZB7sgXhsPh@lists.linux.dev
X-Gm-Message-State: AFuF++mF+h4K8hg8xv8DLOJtmnkq7TRc4enRmFjHtk+DsNIy1iBZZG7S
	PqBeteI//BSXwVWWdHFjpR2eoztYwRkRz/oHoxH8wORb+mLG72qNm0hqv6sTcAp3DS4+HkyYJ85
	Skq0gfoMLlMyubhmpIb3er9Ipu3JO/U4=
X-Received: by 2002:a17:907:72c7:b0:c29:450f:bdbe with SMTP id
 a640c23a62f3a-c2a156dccb4mr1044938066b.16.1790041109284; Mon, 21 Sep 2026
 18:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916131837.28568-1-marek@wesolowski.eu.org>
 <CAKYAXd9SQ_6fLm1v8nxj3WrnBT60S4Fy8_oZrN+Oi+0rOw2aEA@mail.gmail.com> <f2cdaf0f-82e5-445c-9479-1e3113f8f3d7@163.com>
In-Reply-To: <f2cdaf0f-82e5-445c-9479-1e3113f8f3d7@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 22 Sep 2026 10:38:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_+NXHmPzMGqWoBQWjtQK5smv5uejRTTeiPY-yRCO8wjA@mail.gmail.com>
X-Gm-Features: AcwNN1U-KugN5QhT7514po1ixU3QyOr96H0R1fDyNMaZoudeHlxSUAcv5fwqey0
Message-ID: <CAKYAXd_+NXHmPzMGqWoBQWjtQK5smv5uejRTTeiPY-yRCO8wjA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: stop MFT writeback at allocated boundary
To: liubaolin <liubaolin12138@163.com>
Cc: =?UTF-8?Q?Marek_Weso=C5=82owski?= <marek@wesolowski.eu.org>, 
	ntfs@lists.linux.dev, hyc.lee@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 10:00=E2=80=AFAM liubaolin <liubaolin12138@163.com>=
 wrote:
>
>
>
> =E5=9C=A8 2026/9/21 22:22, Namjae Jeon =E5=86=99=E9=81=93:
> > On Wed, Sep 16, 2026 at 10:18=E2=80=AFPM Marek Weso=C5=82owski
> > <marek@wesolowski.eu.org> wrote:
> >>
> >> ntfs_write_mft_block() tests vcn in the loop condition before
> >> recalculating it for the current MFT record.
> >>
> >> When a folio straddles the end of the allocated MFT, the stale vcn fro=
m the
> >> previous record admits one more iteration. The recalculated vcn can th=
en
> >> equal end_vcn. Runlist lookup fails and the volume is marked erroneous=
.
> >>
> >> This was reproduced on arm64 with 16 KiB pages, 4 KiB clusters and 1 K=
iB
> >> MFT records. With allocated_size 0x13000, writeback of folio index 0x4
> >> attempted to map VCN 0x13. Creating an empty file left the volume dirt=
y and
> >> the next mount was read-only. A mount and unmount without the file cre=
ation
> >> remained clean.
> >>
> >> Calculate vcn for the current record first and stop at the allocated
> >> boundary. The patched driver passed file creation and deletion, a 64 M=
iB
> >> fio write/read verification with crc32c, sync, unmount and read-write
> >> remount.
> >>
> >> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> >> Signed-off-by: Marek Weso=C5=82owski <marek@wesolowski.eu.org>
> > I can not apply this patch to the latest #ntfs-next branch. Could you
> > please check if this patch is no longer necessary in #ntfs-next
> > branch?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntf=
s-next
> >
> > Thanks.
>
> Hi Namjae, Marek,
>
>    Sorry, when reviewing this patch earlier, I did not check whether the
> issue had already been addressed in the latest ntfs-next.
>
>    I have now checked, and e543dc6c5f1e ("ntfs: write MFT folios through
> mapped I/O units") eliminates the problematic loop.
>
>    That commit checks the current record's byte offset against
> min(i_size, allocated_size) before selecting it for writeback. The I/O
> preparation loop also stops at that limit before mapping the next unit.
> For the reported allocation boundary of 0x13000, this prevents the
> lookup of VCN 0x13 that caused the error.
>
>    I therefore think this patch should no longer be needed on the
> current ntfs-next.
Thanks for checking it:)

>    Marek, could you please double-check this?
>
>    I'll make sure to check the latest ntfs-next when reviewing patches
> in the future.
Okay.
