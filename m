Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09A2345CCD
	for <ntfs@lists.linux.dev>; Sun, 13 Sep 2026 02:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789268024; cv=none; b=BeQNlCVkD9XgXV6/CpWP5gO/NEbgNf1rJr4GDnNUFNvPHrkdodLm9Set77nxjH9+8iYsl3TwuaJXeoN2UWDA3bZCbBfTqncIxb3G6SYj672g/Jc2ZNiV1dM1UZk9tEzDstIR2PACVZWMSvoGUcAhw/ZZr5+sajD8H0G4CBRnTCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789268024; c=relaxed/simple;
	bh=99+8qAxXumynnT8V+szCRmIxjW4nfNsu8JOEFvWAOkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jaIHmfWuRATVWvW5i54TzNM20GrzxisnXn4u/HplG+cnRU5xk1JWhbGOt26x2ZL1M0Wm0yAn85FocUiI9d3p9h+1Ro1fjr1YFD1WDrrh93Qy1pHXMYl2d5vSQehxBr1m4taI5XoqGnIgXRWWfArtoWK8WHG/pPdjST7KFrCacWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmaDuE+h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmaDuE+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC9A1F00899
	for <ntfs@lists.linux.dev>; Sun, 13 Sep 2026 02:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789268023;
	bh=2vMKjuTOQPXeBhior+kJdtwBkgOzYn1x8pvpdCVImmU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kmaDuE+hb6dQ2Nkn1CtRmSv9ObNcEVaUEnp4VpNIMfpYDmKWY0mPkejIwXoRTiiPd
	 xmnLiiEfTR98UJUFQ1PKXAuBjYGo9Tbq8WzGlSiDAlFU+/cTKJc1ckrp3IvVWujl6y
	 gGoUmSS7EcSTIlox6VQudZNW2QZV2BEwHsVOU4eGdhm3ZVmyEYKr0QJcz1DjkoY2oI
	 729xP8Lbq1suOXRZ2RofqMo0+U0FSDx6v087BTpGEAuXcyiHV/7kd2VVozcgY5H1Jf
	 E1k9rKqybyhrxeeb3akszgW65g0jXN+eumqYgrhzTHQg+Olp+tSQVPyQiklrpiDDKM
	 //XLIxERNbWSA==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so1485259a12.2
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 19:53:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydhFuVXTiMWYKElbvyrRsGMVhRq8HgdvwQB0nhQU5bu94jpkjqrfSdRUm+/baFMnZFSOhs@lists.linux.dev
X-Gm-Message-State: AFuF++mP+m+vmlAsaRk2/rp/I+rNL8sco0XGZyd+sciA7TccrG35fDLH
	FKTdkgtqnJhg+8PjK8xJAWVDUIUkJoycSxJSZvMceaiV+Q4Kpmzmj1PA/P8cPAnHRd/BVyeK/gw
	Cl6ZlGNoD4YLYTkI5Ff7lrLL/shE/VaE=
X-Received: by 2002:a05:6402:1588:b0:6a9:93b9:f098 with SMTP id
 4fb4d7f45d1cf-6a9b56a7951mr11081281a12.16.1789268021965; Sat, 12 Sep 2026
 19:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260913010236.17541-1-liubaolin12138@163.com> <6cdf40b3-1910-45f9-a3f0-2c41782ab267@163.com>
In-Reply-To: <6cdf40b3-1910-45f9-a3f0-2c41782ab267@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 13 Sep 2026 11:53:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9CoXPV3LrXwzhtdgjuBbyc8Y9K-eiv54_YZiNhW18Rhw@mail.gmail.com>
X-Gm-Features: AcwNN1XeTif4kiZ9cOp89fGy0xcyauMXW2p_M4NqA2zwSwrOVQ-udN7dx1L5C18
Message-ID: <CAKYAXd9CoXPV3LrXwzhtdgjuBbyc8Y9K-eiv54_YZiNhW18Rhw@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: fix lookup of POSIX names with Windows-invalid characters
To: liubaolin <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> Hi Namjae and Hyunchul,
Hi Baolin,
>
>    Hyunchul, I noticed that the patch you posted in GitHub issue #87 had
> not yet been sent to the mailing list, so I assumed you might not have
> had time to send it.
>
>    I am helping submit your patch. I preserved your authorship and
> Signed-off-by line, and added only my Tested-by trailer:
>
>      Tested-by: Baolin Liu <liubaolin@kylinos.cn>
Thanks for the test and sending the patch to the list instead of Hyunchul!
>
>    I applied the patch on top of commit 9a05b5715cfa("ntfs: remove
> unreachable code in load_and_init_attrdef/upcase"),which was the latest
> commit on the ntfs-next branch when I performed the tests.
>
>    After applying the patch, I successfully built a kernel with the
> legacy NTFS driver built in. I then booted this kernel in QEMU and
> tested it using an NTFS test image.
>
>    In a small directory, I tested the following filenames:
>      1. The complete filename reported in issue #87
>      2. question?mark
>      3. asterisk*mark
>      4. less<than
>      5. greater>than
>      6. double"quote
>
>    For each filename, I created the file, ran sync, dropped the
> page,inode, and dentry caches, read the file again to verify lookup
> after reload, deleted it, and confirmed that it no longer existed.
>
>    I also created 1000 filler files to exercise the large-directory
> lookup path. In that directory, middle?entry was created, read
> successfully after dropping the caches, and deleted successfully.
>
>    All the tests above passed. The kernel log contained
> neither"Collation error" nor "Delete failed".
Thanks, I will check it.
>
>    Namjae and Hyunchul, if you need any assistance with further work, I
> would be very happy to help.
Thank you very much for your active participation in NTFS development!

Can you work 64bit cluster support for ntfs if you have the room?
Since this is not urgent, please feel free to work on it without
feeling pressured.

Thanks!
