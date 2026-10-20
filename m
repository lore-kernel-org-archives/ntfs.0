Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486453;
	b=QFjKdC4KQR0G5+AC5LWpV+sDtd8/nBYqso3/6nwamzjhnT9xyKGc6rA32jPtibjhpJGx
	 OXbY0GhMEF4vrOhU2GvnSFedYN1LNahvS6cuv3tVHBjpIGKqXR4FK39RLomhdvQMX7Qaw
	 ADkaGcM4W/nGcm4HnmKBkhlwoBieHyk92CGkYG2Z4utwR2iG89/BajEm+vXydR6r/+Cwc
	 2oCP+NyTCubLUgITF/6VAyPlCUdlEKkarLDtsmxxcVQPwEk1SKUmoq8IWTkMw0SXjZXPJ
	 EMxTtdarXC5LJ+oCtKgGqP49aOiv7oKjpbYc+Ss6MybkzpceJvzACmGwDc/0M9uRbTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486453;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=TBZEFDG/d8ahaJRDHCgyEAAnLMPcOqatDPnd8aUeC14=;
	b=OVwtICIPx2GbGdWGIfSeXBNNpc4ScRItzy6MIHbhgvYpypkGvrtYQsuPozGOHkVQ4tRg
	 QRRb1qPz92ssDNuEBq+D4EGhCpEGdqKmWdLAHerKkZFJfpxMIRzaM+h6V+0ASThkrWgC/
	 kTwxgq1UYNzTUUxHUlt1DrOjA/MbfsAbMI0SY3CZI7s7JX+SpM02972D1Kn8J334LhGWB
	 8sJqJvHyKm1NfeZ8m7RHdRCqL4Cxrn3PX67S4AbTliSdddd/Yui5LY3lCPNpprjtRnC2J
	 PkFTQM7XLhXTDy/xr679Pda6h6LIJW/2gTwuf+hOgzahC4cl2mYazMMvcp9h6KvYQcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=twFUKn3Z;
	arc=none smtp.remote-ip=203.205.221.153
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E885606A31A
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E885606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=twFUKn3Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792486450; bh=TBZEFDG/d8ahaJRDHCgyEAAnLMPcOqatDPnd8aUeC14=;
	h=From:To:Cc:Subject:Date;
	b=twFUKn3Z9mmhsbhI1Wzbtqk0a6nz/2Zj0xp6Q9sw2smd7Dk1Xz3AwfFuMUTbP48Ka
	 JT60w+paAjMughf4iLTnrodS5imB/AFZhIeIrG4eJYngiEtEOd7zZ1Ajt0D1rs72Tg
	 JK98a06ifmKvVaZBytkd4oQGK5AJQ+c2uALY8I/U=
Received: from smtp.qq.com ([2409:8d5c:c30:3b3:c448:ac0b:9c62:2589])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id D87ACAF5; Tue, 20 Oct 2026 16:54:07 +0800
X-QQ-mid: xmsmtpt1792486447t3e373uwh
Message-ID: <tencent_48DCDBCB12733CA121597FFDA71795515F0A@qq.com>
X-QQ-XMAILINFO: MpSLeT6aCErCi29tYAN1WEbc80Yo3T03VNbRt94J3M+PApI6Wt4GGppUr+Rg9I
	 zvfJZl/ErrI7Be9dVvqE+L0kAv9tTGw4RcJlDQZXmJmQgkLo+yQj+26U1K+cNsb4x2RAFxH3e8V5
	 4ZbGJOfJW5BOJYMeqYr86BbApvIRIMuj/TvqcIHWupdTqF1f6Jo74/KtqxZI8Irymn1fHwiyzJmu
	 Qgxedr551o9/mPBV+ordgP9boK9YuJmRooctwMLIZNBTpZSqV8yynuEva9EvP61DLWirWFuikX2P
	 1Zb80HMk2fz+ex0O4Q5MI3HRK3L0VYXR6C9h8nyfLECFjjxUud/cOtlr5iaCQ/BZHKKWyk3WUAQK
	 iAr2YTA58iXxV2mWhvG6Mz2nTx03PGOymLx656DWgDLK4e8EbwFvahK37Vgu9pMtmW4NLIkqXrDl
	 mWxEMmTv/amtw4Pp/PJIkrd9mFJd5e0XreD2l0D8JmkRiGEdTXPyfMR1iyKXAfAjhj1wVc84xiyH
	 St9pp2/Kz22IWhR587F30yDgjDxO7xhdo/huyisMyLZhTVJZMJUIFVvAg+H5ydYNt7Tdc4FCvyAm
	 d9W0jjOaInkYoYG7a+BMunfdBwdV5MiymZlvm2E/sbvpTVPUJOOSnG+9nrT+z7hU6Vz9/R3572w2
	 xlO/rXfc5j/WJ8uRNzoqqr1t+pYkingooiEURUaA15k9s6509IiPwFlAO9AY8HQxm+Md2TvRq1O8
	 tJYx4Q50fWKizgL7eGwPWFRgIJ0XpEB+GMOgO3HFlz4/ffdkPtGjNa89xKfvUiBB89mKiOPnaCrd
	 OyO/gVe3KJ67DUi8ScWGsz1s/dPuCP49XaSxF/qSZ6Zd8P0NMxunaY2+LS0u9WUahTUKdfG99iHb
	 OyiA75WAjRPwMKauEzjXpnt+Dm7tkbkqeWibQq0VS7Sc8MVoguaZXQsGXTwmE1Vd9H3i9RfhlRRG
	 lCPPUBsRALIxLkoMftAIk4dAPhrfBNEQQBSmE3xPgO6NVl0iRKwZR+iX9/WqxUPJlwReHd1OI8Mx
	 fwTOQVIhqanTK2EX+dQEOASmqVpeBDxelSLQfLmiQqdXwONLJ2AMcuAhQUQjFW+W9Ppt8UQnUkAD
	 hPat1r90atm7zuEaPJ18dDh5FUhQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Hang Nan <2122295973@qq.com>
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev
Subject:
 Re: [PATCH v4] ntfs: reject index blocks with a too small entries offset
Date: Tue, 20 Oct 2026 16:54:07 +0800
X-OQ-MSGID:
 <179248644718.3676.17295254008320591051.20261020ntfsv5reply@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Hyunchul,

Thanks for both reviews.

> The changes itself looks reasonable, but the patch does not apply
> cleanly because whitespace problems.
> Could you regenerate the patch to fix it?

> And this comment seems unnecessary.

v5 just went out as a separate patch, with both points addressed:

 - the comment on ntfs_ib_canonical_entries_offset() is gone; the helper
   name and the commit message carry the reasoning.

 - the patch is regenerated from 32c52ec87d62 (7.3.0-rc7-00245) and sent
   quoted-printable, so the indentation and the space-only context line
   survive the trip through mail clients.  I applied the message I sent
   with git am on a clean tree at that commit: it applies and leaves the
   file byte-identical to the tree the fix was tested on, and
   checkpatch --strict reports 0 errors, 0 warnings, 0 checks.

If it still does not apply on your side, could you tell me which tree you
are on?  The patch only touches fs/ntfs/index.c, the two hunks in
ntfs_index_block_inconsistent() and ntfs_ib_alloc(); if your base has
changes around them I will rebase on top.

Thanks,
Hang

