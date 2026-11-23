Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443551;
	b=dxyTJ/WFP9obMflzZadAjq7ZZ1m4PArCZPNxnUWWj+E5Rnff9pjS3DGfzt1rI/wNllX/
	 kwFrs1yUVusTBy9ed+e/Zpe20urSEJTNS6Vmt8IvUWOpI+zJFDfx9Bp7roKrQzTgpYSp7
	 eIqcddJlYTxqVyduo+Ho8rdbCm/k9hEjAMfvXZvpf1/tsFzjGaptMGmYLwkDtsKD9oI9K
	 WsCTXuzTNMhISBsJJH6JLU8+DlpTZEoa1aGxZzcUieOYNVWJYeB/BcBa2Wi7hZLAl7hlD
	 +HjQ5tO52Etk+Uyc8UHtftcS6OunNaUlUe0s0p1HK/dWoyxfyn7sk+cYJNtKthpMCng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SGqpzMMXOxhLnysXHPX7ervAuuBOMpPxjnvIFfmSlbo=;
	b=dBKpxqGMsBR/ocXJ4WkmGJxrsqwjpnH1P6L7Z+PbbrHeAJ/geQ4av1jN+zXWmlC5WkW1
	 72xep+8jZ8oa1sGUhjZt0K29x84KB/GSdrwD5S4eR6H1WDtKQrONuumlc5x5sBwGVbal3
	 UPFdCv40eg/IxqLVIg17SSApilrrqpMWVZf/J4nkkkmgO5o0TXM9sGuTTX71j5p6gMMhq
	 D3WaMCIcnxx+XUaQrwCYaHQP7VQ5Gn2wa4swap895GmYnKFRJNHJTAeElJ4owjSlaQxTK
	 4XXkAwA93h9Zo79qmUakJXHuK4jSodvsiWy4xX57msiAWC+zbdk7tMvswDQxXApaW6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeMwirm1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C7C606A32D
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 14:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C7C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeMwirm1
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so4332530a12.0
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 06:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443550; cv=none;
        d=google.com; s=arc-20260327;
        b=NFngPqi2z1msXgBq/tkhf00sFEJHB5BX8w1znRWuGIvAOKP/91sO8Bpevd8Fa/Ns0b
         5q7Q8FU/gVXDhtfkg4iynlXOjVKhYP453KXzbCPYTEfMHE/hkMxvA5zKwevR+mnc0FeC
         Wkb+gVdyQ7hWHvYERSs+1EtUW2+KN4l2NgXWZzOLEbuPe30HSZSGirA5wPbqtpsFkFPF
         jjM3Pa9b4lx0j3iVQ/PtxSGlmHujGHC9BLWZ4mEAiUr90OCBDlerk308i9KZGC5A7u55
         eu/AUzwmuKEBZG8xtlUJ3H5p9E3wSQ+meym07cZmCSl85q6pkPkifHmAIis23PdfawVr
         /Oug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGqpzMMXOxhLnysXHPX7ervAuuBOMpPxjnvIFfmSlbo=;
        fh=j3Jsb0Bk228tyCN1aD5Y7u4359ZvHlCjJWc742nKeIs=;
        b=dI51RqJYbWKr8nRi7bMILHgGt59vh3h1MCuvuwb8hKYuLdvBvrZyzADWXLKFpinA+c
         0bIfx3aeO8SQE6zEl28r6r+Fnt1Zk1uHv8w3yxug6n5nGbIGaa/dhFffJgMIaEwCsNxI
         IEaUAI5Pw5y0EN5Ev41PD2OGRvd3lcW3T3nKqQiTbMc0rPCKOmmz/mV217JFm4sIAMbo
         d8WcQCe1C+9O063EXu2J2cvZ4aJwCwZ5ojL9frm8wCyJG4wBBpr2XUxs7/0m8AGdufDs
         W++Jm7MHxUEf6PYyCCBC5g2YB61+o2c6IZ45ZxhxYATwfeAsOCjFgV/ujxll4IS83Wg8
         4Qkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443550; x=1796048350; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGqpzMMXOxhLnysXHPX7ervAuuBOMpPxjnvIFfmSlbo=;
        b=JeMwirm1skH4ZnlfM0CLsq7+tvwJifsah43OhNoj+0VMNpbWQai6RezmxnFXKHCYGw
         DJj1xfZCe8AzvgIxe7hNpSMbe6+WOr6d7w8eqIY9m2YERWlsX7O2IFbvcHf/KFiE+/SN
         yfNgIosQq/0eqbdoj4PHQy9RdeXkbnecSEMSXqUj4vGVsWDrHCDdmQyfnoAwKmhUOeHQ
         oT/ByTgpWOaJ+S/HwuXbTvph1Oyp7OyY7lza03kqIQWX1MozHJosSBCq12qiIbjkc2nV
         PyionkKjXlxDNAyEuOuS69Y2Pw8ABrPBcgLCvUBka+HaxhUqecMMwTVB9zD4MyBcmabJ
         XQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443550; x=1796048350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGqpzMMXOxhLnysXHPX7ervAuuBOMpPxjnvIFfmSlbo=;
        b=dZ+BGV+ncKdNkuKKXFE4VDTsdZR0X29QH9Pl+SC4RGu4cGDNV0Q1gXQPGyCrFeGioa
         Kw4LqNR7/MjZVl55bgqykp+vSEJBJgHtJguXZ8SqCv8DSiTFbL0RYAqvU17HJRM8tX+C
         CGtN3f2D4kKGS+wJ2dJ1N8Ses+ktxlF9rGqPHGxU84dsLOiWW+sPm3Lw71fTqRMLyPi7
         SXzuZsjRcNLnZOKEIeZ8ZDkf73EQAfXqN6eGbLkBupWviqYvVH/1n3nzVr72tSG5NeUc
         Grcl5LrtFyRPkccShPgzuI6wniKP2JSGsBvlo7G2rsIJrakI79VZRCmRQwdnNbhuxETL
         oZ6Q==
X-Forwarded-Encrypted: i=1; AL+hErG7y63HzqFzmQk+lliERldkUWxW7NjHLkCvQDQDVSACfzgamzxivNhtioRol7xwNRSiJI6t@lists.linux.dev
X-Gm-Message-State: APuU4Z+8MchDOFrn3hKQj93ceOaLo717/Z0y7bIZlvw2hkb/Ikgr46K+
	Wh5Mo31aTJIGIAJYO+rfJqKsNr0yvc9IiV5SvEiZegHmsI1K49SdcSeND/Krzj11gjrIXQtLFWc
	GSHEtQ5kUqykNvsQ3sz2gA+DHElyj1S8=
X-Gm-Gg: AZFdTZdlJvspH8Z/KlWOaVKhmxEBjtTBkegbwtMGGV6ZWJ6hoggllI8IrDPiefb67MN
	My7lIS81sVqhdqQmt93Mx2KWHbneBovxV0t38itIoa9SvA2eu/GUgS6cNGJ3ugdFRT9uep4XOz5
	mk1+rEunhtOuppv5uHreozMRZ69GnAVEqMXBQyh7CSEHnHNVtdoQNxZu0Oeas2fTRitB1FsDfUs
	JDkQIRSoqkz0U3QmXwe9kRCzjdg8sdUQonWPLLfeoYVsQQCFr4/fyCDz/yhTG4JHNHwupd5bUZS
	hWSYJSLG8WXCZY0G4q3v3a6mc52srUHR5xAbWZu4a1yb549UiqYWVT8v+QQsxFza0eiWOP4vr1W
	yBN/CvYROv+CfERgB1siYrhjetS/PFXXNTOGrsrjlHNw5QfgMBLIDoRND/TOTe9x/kQeQoQ==
X-Received: by 2002:aa7:c61a:0:b0:6b9:86d:bb5e with SMTP id
 4fb4d7f45d1cf-6ba37e91e14mr6755202a12.41.1795443549130; Mon, 23 Nov 2026
 06:19:09 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <20261122000856.536902-2-koray.fra@gmail.com>
 <awP8S5KF9v-nqWVY@aalbersh-thinkpadx1carbongen13.rmtcz.csb> <DN2NJH234CC4.2LSWRSOO4TX5I@gmail.com>
In-Reply-To: <DN2NJH234CC4.2LSWRSOO4TX5I@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 15:18:57 +0100
X-Gm-Features: Aa3M54qCw9X0Tb0EaHQOCg1GMA-OBfzeB1bXtwNxs39Fn8cRfeeS4nOAW1KHDXc
Message-ID: <CAOQ4uxiREfVU-WKiUVRZLb-uzMXzDEsmG13FVMW7YBoyq10=Nw@mail.gmail.com>
Subject: Re: [PATCH 1/3] vfs: use goto out on error in vfs_fileattr_set()
To: koraynilay <koray.fra@gmail.com>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Hyunchul Lee <hyc.lee@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 3:15=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 23, 2026 at 9:42 AM CET, Andrey Albershteyn wrote:
> > On 2026-11-22 01:08:54, koraynilay wrote:
> >> Switch from using if (!err) { ... } to the cleaner if (err) goto out;
> >> in the main body of vfs_fileattr_set().
> >>
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >
> > Looks good to me
> > Reviewed-by: Andrey Albershteyn <aalbersh@kernel.org>
>
> Thank you, can I add this tag to the v2 version of this patch (since it
> won't be changed, and link to this thread in the comment section of the
> patch)?

You should always keep RVB when re-posting without meaningful
changes to a patch.

That's how reviewing works.

Thanks,
Amir.
