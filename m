Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BAB41D11C
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293391; cv=none; b=Upa5/E/1pT7ACdng1LAjZ0B1MdUChpure3ybHIV/kcg9LTqyRo/SBEBSzDALzX+AyvdxOdMrymkhsNXxFQFsc0ylYF66K2kJW1V3j9v9Fe1RdA9q78AkgHbCp/P+Ua7mId5atNWcw1BHffRKYESFyFpm45wrx/N/nx8bdZYhjpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293391; c=relaxed/simple;
	bh=7s6DgFyq/XTRr0lAONkGfWkOBYQLRr59KfuSlt50gp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmuFYd4Y41epvNtHNqDprQhdRUUHy941I8pGdO3NhqX+Yu57rQBPH8XVjnjjqAodXOT6VnWE2s2hkSujNuILO2DbzlQ5P+NjUNTVvxBzfaNY7nFru2qsNnWKnX6v1btAMBUGYZU+mBjgCh57/plQ7qw/yn9W6WO/hxSbx2KEXZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EglOd1Yd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EglOd1Yd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA8A1F00898
	for <ntfs@lists.linux.dev>; Tue,  6 Oct 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791293389;
	bh=xUvigWDBMkuVymkQGaRDI1n7AgYoB907VlbLXH72s4Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EglOd1YdpsdmJ6iieyIAouMUL8zZVxw8FlHgEz8tiZE59x31n74SfFFzb7eQgFHOh
	 7tjkEp3wiTisbGHts+EcRFtvMMldhJ02TQ0qzWbZRvKpNVywhpEIa+lEx5vsknTPoh
	 If/6UeWN4dUT+mZbxhI3GXft05ZgXADCnTJYrIWvuZ94Ox03p5zcjIUUjK9wdIMHVs
	 5FkpURDCXMKaDi0QwsBwZrgJE5PdwO6Q4MIIpJid6b+t44UO/R/QH8IM0lcY6vHpXk
	 oROBQD0TrrhCJhlYeW3Yt4aLWyVVS/YqPjHaOBW1siqVGqo+s3TqpTMkR81We9WBBX
	 DN9WmYmI0nazw==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-676858d42f8so589796d50.2
        for <ntfs@lists.linux.dev>; Tue, 06 Oct 2026 06:29:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3Trwf1z55uwlNm3vQaGRWX0X+hE0BOxVAKH8QfmyVO/ld2CgRP2EjUZgnO/31k4sMm3y6@lists.linux.dev
X-Gm-Message-State: AFq9FYJCEX632Z3gzT4qy7+0nXdq01fX2jgb28UEcjbcLB0hjnd3IwSN
	7C7W+sYJpP8h8y6HOki/bAnQoe8PCLs8bqLX4uipyM69J+oXhVvw6ZGC0pCuHyyvBxlLaNoY2XF
	pzpTCe/NA1uU0Ye66kGi1Tvl0jNrinPY=
X-Received: by 2002:a05:690e:1509:b0:675:4672:5940 with SMTP id
 956f58d0204a3-678fce07d00mr466083d50.74.1791293389041; Tue, 06 Oct 2026
 06:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006045136.5911-1-kmehltretter@gmail.com>
In-Reply-To: <20261006045136.5911-1-kmehltretter@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 6 Oct 2026 22:29:35 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-6EazcGmH1qq-oYrQMs8oqkP_ARP=h9NXMKF9yxAK8Ww@mail.gmail.com>
X-Gm-Features: AclHuK-Q4OBSY0H0yEURSN_p7BUs1ngXvFeje-E9Rg7Wm77628JVayfXbGdgDJE
Message-ID: <CAKYAXd-6EazcGmH1qq-oYrQMs8oqkP_ARP=h9NXMKF9yxAK8Ww@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ntfs: fix two kmap_local bugs on 32-bit kernels
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 1:53=E2=80=AFPM Karl Mehltretter <kmehltretter@gmail=
.com> wrote:
>
> Two kmap_local bugs in the mount path of fs/ntfs. Both only show on
> 32-bit kernels with HIGHMEM, where kmap_local_folio() hands out fixmap
> slots from a per task stack of 16 entries. multi_v7_defconfig enables
> both NTFS_FS and HIGHMEM, so the stock 32-bit ARM configuration is
> affected.
>
> Patch 1: check_mft_mirror() unmaps pointers that were advanced past the
> end of the page. On 32-bit ARM this clears the wrong fixmap entry and
> the mount dies with a BUG a few calls later. syzkaller found it on a
> multi_v7_defconfig kernel. A fresh mkntfs volume reproduces it on the
> first mount.
>
> Patch 2: ntfs_check_logfile() maps the same page once per loop
> iteration and unmaps it once, so a mount leaves three entries on the
> stack of the mounting task. After one mount the CPU it ran on can no
> longer be taken offline. A process that mounts ntfs volumes five times
> hits the BUG_ON() in kmap_local_idx_push(). x86-32 also warns when
> mount(2) returns.
>
> The two fixes are independent of each other. Patch 2 was tested on top
> of patch 1. Both were tested on 32-bit ARM and x86-32 in QEMU. Details
> are below the --- line of each patch.
>
> Changes in v2:
> - v1 carried an older copy of patch 2 as a second 2/2 by mistake. The
>   patches are unchanged.
>
> v1:
>   https://lore.kernel.org/r/20261006043810.5393-1-kmehltretter@gmail.com/
>
> Karl Mehltretter (2):
>   ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
>   ntfs: fix kmap_local leak in ntfs_check_logfile()
Applied them to #ntfs-next.
Thanks!
