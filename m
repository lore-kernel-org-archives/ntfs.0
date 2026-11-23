Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448577;
	b=Zaq3J3JdNt+sgIDPrWqErL/tFQIKxWSA3EJ2BaStWB2asTbwJJiC5cDMh6HyrxDZhlps
	 /dAs6WpIRsUnQrroidSv/n67PeknVsUgu7nr+w9oB2weFkXm58oALI44MvKo9COovm1wl
	 8UjCJEn7ixfBOOI8cBf5r53Yc/AznbMSK8Y1rju39r08aUkVxh+rkoqWvbDEM95drk/GZ
	 /exyyi/wdKQkXShAwHdemKZo9c+fyndnNy5Z/nqMGn4kOGh9Wr8aY1+26AMk0V4fP+ARq
	 /hPUcrkgE9G918BsxF+KXmIoGavxd8Tyr2nioL63krh7/fu3PUW4+QYExA2x5QpuHtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4hoS7D/yU9yneseDLwIn7QnnUwkm6mFkBGls0/3F3fA=;
	b=MG/8A5JmXV6LumJsEnRe+B/c4pP7Qh19NWpWefuud/lSR6qYyZy+Z+rYU5ldc/e4hnT6
	 Xaac3Xet8OD9BwyocFWRWl+MmABSJHQPP0+b+2JXbTBkHjStrLkQpIl6vrDSs3Zz/H45k
	 XLYbTz9IbkKzGeuu244d629yc+087pUdEJkYW1jjOXJDdolGj0xcPJCViD3VQxeHbViEi
	 xHsljuba9tKbxLrFTAPQdF5VMVXtHebSURjcr9oUhLVtHH4JdprIsf0VKbiwd5Avr9hTO
	 RjpD/43gzsfiQs7WN1yam8c+pJNJJPHZyM24CGkY7ZTzSLYm5jHsJkn3hryLdoXpgeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3bWax0U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16B606A33A
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 15:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF16B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3bWax0U
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so4525502a12.0
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 07:42:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448575; cv=none;
        d=google.com; s=arc-20260327;
        b=LpOm/cGXbU0NPybWSMtxVhq2jXL4JYoKHs+h0osqYRE+eiuQwnYl9x1NpujpELmif4
         aoj6+Dv/4aYDCmnJZ48f4UwahGxg+lNU5QhHQVB0Rk/yvsyDd7gnbGEXZevLiCtNEaPj
         Xtg/fkGP4OIdfrfoldnpnPH+FERnmaLlPflFo7kXX94cIG1bhA9r3mUwr52Q2CbIsuTb
         CWovXpzZJMUqAXd32Ht0BCgkIyw/dNOpsLFtiHoAtw751ONio03Yb3/kLcPMYHF4Tujn
         pXbi2CXg5LjLr7hGRle1+nT0BBzpdd1On6xdXzt4YMAMcC/IL5EEoqEIu9N9IAlkTe61
         YVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4hoS7D/yU9yneseDLwIn7QnnUwkm6mFkBGls0/3F3fA=;
        fh=xHt8h6iMlGIoh3TDJoESmXNJtB5VI/a5i0wUZKFp7Fw=;
        b=PXnuUqwlgpnWrH/Q241vL1Wvsb6eG2egHLPTC+FSDKP754rVncaFuH8Uui3cEnaGOu
         Qs3mpIgOXj4p71l6sNOgsHXxy4uf1eL8s4DirrzAV8oAwX2AEunzbm8eDgmLvI9nfSDb
         3p7vhCyvU/EQTwjmIQ7IadMWImVH7GXa8LzqyewKol2falput7myaYy9nLldKLDYpL6R
         WrwyvHBXLh03fNe5mt1njCUvp16WEBcVPFxr+TDhNPOTO36obqPwuYC7eO1pTa+lMtqO
         vl1D4oGIHoTbVTlH7XIOWISJ1241OPv1+jVMVkxpilvaULo0hiLljDYbs6mvOf4IJpn0
         JqAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448575; x=1796053375; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4hoS7D/yU9yneseDLwIn7QnnUwkm6mFkBGls0/3F3fA=;
        b=L3bWax0UHxfy2qrxAnO+HiLvDXknmMM0q1AlQPTZcYSb7THFpgORpBIVOPWlcaQLhu
         96x2BPtlD4aQBsGyXXdeGztAf1kafm3st7GLo3Z65p72D+jP8WxY19oHvdN73oj9MQ3D
         5+q3morzUiT+I2FPmVVh8mvkkf068/DaSK56N3Q0nzvaChNYfl4KUnvUPgqu2FT6rmbP
         oHSbHjQhUd3lZKMuSkQPqdOra6CNBPhyG8ucPWrnCWP0rNU6ZxmMSEHA41KQjbug/6+s
         4F1vhDY6pJuv3oC5DFhSGv0/51/su7H5riAr7IfrGFBRUG39Okb16sgKCs92x5Y9gzdt
         j8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448575; x=1796053375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hoS7D/yU9yneseDLwIn7QnnUwkm6mFkBGls0/3F3fA=;
        b=gq5fB8qEzde75K/WmWuHGdEd6fRr9DP8ISf09tcuz3mKVKQRo/XNga1pSCEneP0x3V
         afVN06sb2Q5IvyWob5EW9BKmRi6oIAcX/XDhKL4IoWZNL1RFJAKWWB9LvYC9N/t0APeM
         XrqkFInkgLo+DXa9lrmSrb+7gI02TkRNXR7BZZ6fnMLgGv5Izz0LjmW3ORy/3bLVRLK8
         jFHBeEMOOhpiyPWlj5Q3LWdUeRWH8nJoQ5DSsYJUSupB3di/UYRGoPmanpm6gopTR+56
         PVn18D92QBHFlYlk1js6ufK7XSiNiIu74AIOftWsA+dpdkvnGljGxkUEWKJVvQjEVFen
         HtDA==
X-Forwarded-Encrypted: i=1; AL+hErHBGs8e1HLE3kRGVFGoiNkh9Tuu40O4+aFqnESMsWwOy7eOoRThGJr/1E+f8XvC0YaIoKUz@lists.linux.dev
X-Gm-Message-State: APuU4Z//6+HpsPaKWzQ0cG1vG/nDDiXMBzVd2Q++C+VBoN374vk4gez/
	EFlxXhmIeAIV6aHhiyE06EtosJgZnSMs6c+1tx+aO+raYDzm88+6YHn/la2YEEX/2R0axKEN1wG
	GEbbaDmQ6/rFz06NsmOAchumIIouClLU=
X-Gm-Gg: AZFdTZfov7tlIPL9hJDMqaFWs7L7oa3b2mS5xCO1xYk3nFLlmFdjJ+OrWKLFgeEAXb6
	ovhD1yKIjj5bU8VNr/kKCnUSA1YMR1EhgiP+dcrB2QQOnodWm/Hp/WBVq7g8ApZNKZNtu7rwYIW
	lL7mrKG3Cs1VZ9aRQ5oExwqiGFzZGJfiaux36Z5Zddk6ncGCe+ILlRq5mqqW80gCMPv1yxll0+h
	J7KC8zy4YU8VIYKKPqKfWYJpk0YFwJqV+Q93OBFQKOX2HokX0Q3x8hMD5KNjjRgOUjR7fVIb4S5
	G2GDddayN7HL+vNvdUlNxfzJ/lwgDhMQqOJ6i07PrYDka73PYgoY/ZAT5Di0Q0P5uHtwtijThzP
	uS/BSvvVnCzj1xtHvMCXhsBh0xCZ9L6CTp3nAO1lO5R2yEp7x6+FWfx4kZsv/+dfXt70Z9Q==
X-Received: by 2002:a05:6402:1e90:b0:6b7:245a:a509 with SMTP id
 4fb4d7f45d1cf-6ba37ebe297mr7495627a12.40.1795448574799; Mon, 23 Nov 2026
 07:42:54 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <CAOQ4uxgf2KE=Ag13EPAu5=KnrFwt7zRH=im-qmLc8+i10Tjd+Q@mail.gmail.com>
 <DN2NFOEO4XGN.1PEF1SWOF7YCQ@gmail.com>
In-Reply-To: <DN2NFOEO4XGN.1PEF1SWOF7YCQ@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 16:42:43 +0100
X-Gm-Features: Aa3M54rfVJcDYHks7IXLbcOSfYk3rl16ClzvXAxdlbzoJ0nkqLtOGzUzvEIPewE
Message-ID: <CAOQ4uxirKKi=uwyiFWev_5h-LBTLjHgw-FHJ9T2X+JUNSEpf=w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add f*_xflags_{rw,ro}_mask flags to the fileattr API
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Darrick J . Wong" <djwong@kernel.org>, Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 3:10=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 23, 2026 at 2:35 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> This is a follow up patch series stemmed from [1] and [2], splitting t=
he
> >> _mask change for the fileattr API into its own separate patch.
> >>
> >> The first patch is a preparatory patch so that the code in the patch
> >> after can be formatted better.
> >>
> >> The second patch is the actual implementation, which introduces:
> >> - fa_xflags_{rw,ro}_mask fields to struct file_attr
> >> - fsx_xflags_{rw,ro}_mask fields and has_masks selector to struct file=
_kattr
> >>
> >> These masks have the following semantics:
> >> - rw_mask:
> >>   * for filesystems: advertise which xflags they support changing
> >>   * for userspace: specify which xflags it wants to modify
> >> - ro_mask:
> >>   * for filesystems: advertise which xflags they support only reading
> >>   * for userspace: ignored
> >
> > Nice!
> > I think this API description is very clear and coherent
>
> Nice.
>
> >
> >>
> >> (ro_mask for userspace was also proposed as a "verification mask"[3] b=
ut
> >> I left out that semantic to keep this patch series more contained, and
> >> can be added later if needed.)
> >
> > Not so easily added later.
> > We cannot change the meaning from ignore to verify without any opt-in
> > later, but we could use the combination of
> > rw_mask |=3D X
> > ro_mask |=3D X
> >
> > to "verify" (set it as long as it is already set)
>
> Isn't this just "preserving"?
>

I donno I am confused let's keep this side discussion for another time.

> > all we need to do now is make sure that the API returns -EINVAL
> > for rw_mask & ro_mask on set.
>
> Yes, the current (v2) code does
>
> if (fa->has_masks && (rw_user_mask & ~old_ma->fsx_xflags_rw_mask))
>         return -EOPNOTSUPP;
>

This is not the check I was talking about
Use should not pass via the new API a flag on both ro_mask and rw_mask
This one is definitely EINVAL and not EOPNOTSUPP.
It is a basic contradiction of the API definition
it is not a specific flag that can be supported on this fs and not on the o=
ther.

> at the start of set_prepare(), I think that is enough, since we assume
> the filesystems return the masks such that rw_mask & ro_mask =3D=3D 0.
>

It needs to be in the vfs before calling the filesystem at all.
It is a UAPI definition.

> >>
> >> This allows userspace to not have to do a RMW cycle when using the
> >> file_[gs]etattr() syscalls, avoiding possible race conditions and
> >> simplifying their usage.
> >>
> >> Patch 2/3 also introduces the missing FS_XFLAG_PROJID flag so that
> >> programs like chattr can leverage the new mask API.
> >> FS_XFLAG_PROJID is kept out of the legacy FS_XFLAG_MASK and so it's
> >> defined as part of a new FS_FILE_ATTR_XFLAGS_MASK group of xflags that
> >> will be used moving forward for any new xflag (like the one proposed i=
n [2]).
> >>
> >> Patch 3/3 converts fs/ntfs to this new API, to show how it can benefit
> >> filesystem drivers too.
> >>
> >> The series has been tested across NTFS, ext4 (with project quotas), XF=
S
> >> (project quotas and extent size hints), and Btrfs.
> >>
> >
> > Judging from the number of bugs reported by Sashiko and by my agent
> > on the COMMON flags change,
> > I think this needs test coverage for the old APIs, especially with old =
binaries
> > chattt/xfs_io that do the get/set cycle and re-built binaries with new =
headers
> > both tested against old and new kernel.
> > Sorry, but the UAPI issues are fragile...
>
> Yeah, I thought about adding some tests to xfstests yesteday after I
> made my agent test the sashiko issues in my test vm, but I don't want to
> make it generate them and submit them with minimal oversight.
>
> It could still be worth to make it generate them to just test locally,
> then clean them up and submit them after the vfs design/code is
> finalized.
>

I think that selftest will be easier to check these backward compact
issues with a C program that can use its own re-definitions of the struct.
Then you can post it as part of the series which is much preferred for
visibility of the test coverage in the context of review.

> > This is one of the changes that would have been very hard to audit with=
out
> > the LLM agents. Hopefully with the agents it is doable, but need to gui=
de
> > them how to review/test for regressions.
>
> Yeah, the amount of edge cases it catches in my code is very high, I
> manually wrote the main vfs code in this patch series, but I took at
> least the same amount of time to fix *some* (considering the amount
> sashiko still reported anyway) of the bugs the robot pointed out.
>

My 2c: prompt the robot how can I make this easier for human reviewers
to verify - keeps it away from being too creative.

Thanks,
Amir.
