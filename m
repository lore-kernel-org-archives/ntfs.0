Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9334353A9F
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 01:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313488; cv=none; b=Bx0R3Jv0qY+Qx0gQzd7onrZUxKi4dbqM9EzdICloRPL0XfXnfRrD3dr+EWeDXTBNt5RpAgdOX8xyHuYXphkXXxYuTTK6TLaFCsOridqsH/1avvTo3q1KQZENP5U3U4fWeJ5hwvmRWBg612IuXka9t4onYaDcL4XGTtoMLOYQ80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313488; c=relaxed/simple;
	bh=6Tx2jbQpZb4pjjc18kFbL7eRyEbpEfeFJNctoP0lrd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOwjqfaXvY748OXMheDgqqiYAvon08tMZgUXOHXU7PDxIIcXOT9J/lhVhFO0b4RWpSnkmow8gBe2wYVC6CSZAccLCBBVo1Pd5eUZOkCCMyvQvap737w1U/DP/8ZmgbDCzwpUsvVbBahVgGBd+gRVAezje65NX0VDC7n3SJGreZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAg9LUfa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAg9LUfa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1371F00A3D
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 01:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788313470;
	bh=6Tx2jbQpZb4pjjc18kFbL7eRyEbpEfeFJNctoP0lrd4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TAg9LUfavjCxXYmSaTQBXXVfi92R0fWgrMJXzwwygZ1ACkvNaALDnuVvnyD4C9kMu
	 Xzw2yjXk1p1zPdn3DOLlX3jDPN5Jc4Qjish7Hq8chYsZcqF4GfuUq/jPsYe0oemQ0i
	 o7+L/fkVFF2E/5wbKmPg/IuUOmDvFoFjGX/KlrLP5W3m77943IaULkCCpqZIDDrB+k
	 8XHHDGkOf5tWXkd+v2wswyBZms9wdiJ1AkERa0esQvMcEUkeVIS8koeM7Pix+4/O77
	 vHnm5Sr1U1GZxaE1ruNf1Z0kfe6E7tv/RB9ZmMJiLXdK+S1vWhnMtnWJtfSJlfH3is
	 KZqHflwPo0Ktg==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c25b661d37dso69816366b.0
        for <ntfs@lists.linux.dev>; Tue, 01 Sep 2026 18:44:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoEuDSiiKd4bkhi+uW4ah08VD4S8pu2CXHQ4P34yHz3Zr23DZp6IaQv8Y+y41Alm36VjSZD@lists.linux.dev
X-Gm-Message-State: AFuF++n79fxZmeaiy00G20edjvupvgOghTbR3VghpZdgVMgq+oTIcGGb
	MV3XaB0m8uOiJ0CC5tcNMI8AX9Ejmc32YYjd0BJ2j/I2Sci579mAeDlqTChMzhebrvM6yZfL+vq
	3n+Kck4mHfKYwg3No9ucjvbj2bbDiWFA=
X-Received: by 2002:a17:906:c150:b0:c25:afb6:2d91 with SMTP id
 a640c23a62f3a-c25d527a4a2mr66915366b.2.1788313468566; Tue, 01 Sep 2026
 18:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901091519.2885376-1-liubaolin12138@163.com>
In-Reply-To: <20260901091519.2885376-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 2 Sep 2026 10:44:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9HVhS8K3zXhcfUz1H09CDaqADpDzXt0dO9FV3Pa7Rs0Q@mail.gmail.com>
X-Gm-Features: AcwNN1Vh8Eukc5_QZyUCoB7E93Huedt8u5opetwzz8vO6r48cbxPYRn2NqpDhxM
Message-ID: <CAKYAXd9HVhS8K3zXhcfUz1H09CDaqADpDzXt0dO9FV3Pa7Rs0Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] ntfs: wire up the fileattr API
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 6:15=E2=80=AFPM Baolin Liu <liubaolin12138@163.com> =
wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> This series implements fileattr_get and fileattr_set for ntfs so that
> lsattr(1) and chattr(1) work on ntfs.
>
> Patch 1 wires up the fileattr inode operations and implements support
> for FS_IMMUTABLE_FL and FS_APPEND_FL. These flags map to inode->i_flags
> (S_IMMUTABLE, S_APPEND), so the VFS enforces them. fileattr_get also
> reports the compressed and encrypted state, which the driver already
> exposes through STATX_ATTR_* in ntfs_getattr().
>
> Patch 2 adds FS_NODUMP_FL support, which dump(8) and other backup tools
> use to mark files to skip. The flag is stored in a new ntfs_inode field
> and reported through both fileattr_get (for lsattr) and ntfs_getattr()
> (as STATX_ATTR_NODUMP, for statx), so the two interfaces stay consistent.
>
> All three accepted flags (immutable, append-only, nodump) are kept in
> memory and do not survive a remount, matching ntfs3 behavior.
This patch-set does not persist these flags on disk. So, the settings
survive only while the corresponding inode remains cached. inode
reclaim caused by memory pressure or drop_caches can discard them
before unmount. Could you find a way to persist immutable, append, and
nodump in metadata without causing compatibility issues?
