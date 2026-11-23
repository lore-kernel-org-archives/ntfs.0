Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795474038;
	b=IazkNLIcs+TPw0dkyrLc2SBtyvbAhnhZzsG2Nyvpb3SsUSkc5F+bKavUDh5b9JEuJTet
	 Vj3kFAKgTtEUwLYhEKUtOU4+fWxgY5i4l58YbqLL2i+ypi8jmrENHtYrz8ZLpJQTM91v6
	 fDVqGXZRobcXXSXLQdffS9m+lzrsf9HbvC+jp8KMKPaelbtjaDFfnOtswkyb+j99OVx+b
	 Urf8t8i1jfX3GaMjaoEjmQWsjOJzZaDrHbbaMp4Rd75qKyjr3oppfUsztrk633ZieUIKG
	 wUgFfuh+6e1A8iWL7jwjqVKMfetoeWzLgd2scpcVig8yeQHu1COfOGv9XA6uLB+g0Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=prDmnot/bOxVS2gCc8v9HfYcjzpcvwnB8HRgvfXYsr0=;
	b=WNjkQ1U7s5d97Q1sy6vkxYT8CmjMVHRdz4CbYP1ZwVEf/Br9gg6AqXdNI5aDmh7hBmQn
	 WlTD9i+s+uEnKqU4PDaZvAbNyOQhRXOZDbYeHVdhbvHV1ar3tnmzwfckKXTlHggBGkZPd
	 I3/exr/Kead2+ymP3V55y3z0XrYo3W7TvC9+Q44qvdG7pdWOUw6xT66uiD03untQ3ph/2
	 wfHe3g4J9oo3EBQw5zjxXWv3bovaFGBea1HEQIoyeV6TDLRhGE4R3+9D0YwrhblXCKEB3
	 sr9rCcyTNl38Aw8ddS4NHcrgWao5CVSqj9MqB7GdwboKwe6sHisVE/16VEvxoBjEZFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzzs5d5a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B61606A327
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 22:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B61606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzzs5d5a
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so5036447a12.2
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 14:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795474036; cv=none;
        d=google.com; s=arc-20260327;
        b=fFgtIOUEpPoShpWhJP8QqhH3Z79k+fnlTM4B2W+egi4yLiBhZY5Gb8VXBKmqK5Jq0U
         6DzG+rVsXb5qsqJMy6PWceXAryyQyrIebDtMkJBhLRWSJnFBOL2aqSYkEuEQ+0BkKAm9
         wtIRq6c3kSLyzc7GWh1gqEaVGCpMlGnNE5lI3V1z1ZgmYu+oOheRrR6lwNNpy5qgqlb4
         PzWW0Wj3Xdg9uPxV+ZGVlFRxO2O4NcbHRWGWTUioh42XKlyjQ4iTDehkRp+tc8ZUMl8S
         g/wXskplSqjxJ0GoVxIDTYFNVKLGjUd835oMSgfOyfpI0daGR6TDYjv/U8BNMSH7cuVU
         k1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=prDmnot/bOxVS2gCc8v9HfYcjzpcvwnB8HRgvfXYsr0=;
        fh=NzLoASXf8nCl7CwAIDJsvfMsiJcorx60dwkXnFoSqoo=;
        b=iNbYtRJFbPdyS0aif/RHNI50QzZA1jBtMNjgveTWY5Gv/oovE0BXXxfNHsd8ANv4tV
         ewtdg/wgkedzbvUnq4PQW0QdRCH0UtGHyXanhLdjOjFVZ5sJwZGigBj9V0NLE/ityWvG
         y6KZeoI2qzoR/XoFeOGk7FZCi/dzpt8QwH7c/9Xv6NxI/jpGre/QGpNXNUIGeNoSUnIT
         STY6aNJlxUV0+e8/tx2plvPX4RAw++LBKnE5xFdu7ZeVYvakVRBODCa6PzSURXD37TW/
         rVoErneD9s/OkW9xlccyyflI/8PsBTxInsWupKQcBXNtnVQnPri3XDwEqoOQDLo5A5Yb
         lfew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474036; x=1796078836; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=prDmnot/bOxVS2gCc8v9HfYcjzpcvwnB8HRgvfXYsr0=;
        b=jzzs5d5aPYyYXmNIVNR+vQcr2/8PImOhp/kjeZpQDig0y7E2/wd2VpfV+bMZYxJa3q
         8pgOZlcD62oGXMSF7JMCDY+1gReOkOzZJ4OwUqqFXzeryqvyEa86o7DGpsWIvUiuhB+F
         y9T/r6Dag3NeyToK292VlbIVg/+Vx6YOFuYFllhgvUBDV6BRp7GmxYMsa04rIYlyKA1z
         u48dv1T+qec0Ns8G2nT+30cRPd35Ekohq/8FfwJDsiSEZPV10BbRfn+/N2hfwuS6FDIL
         d65K1Mo4bTylrO7kZc2S8UQFIeHL4dSpaNWnLOLYqHM+huH5RdLCIUnJ/j1ES/zndPfQ
         0Y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474036; x=1796078836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prDmnot/bOxVS2gCc8v9HfYcjzpcvwnB8HRgvfXYsr0=;
        b=NHVRts4tEnxDulAq9Zy9bOHV8WwM5t3htiANr89G7tl8LfnTl3FuFc8lihSZE7ib13
         bwn/KNV+NvFi1WFPoZwOPd+2L1XFv8x6uAwBExdmwwqtRjppyMyTX3+9i+umksePtyrs
         HIEddz/5a4OgXUBwz81QmKEzinIDtQ0N65j4io6+89GvW1qEW52ZH/AZ9x+hd5hPim6y
         Q06Ap3iVgF2eBrovq2E5PWmXZMXHE+BD07MBZXQEXg+BFtVflI6EMgXHD1FBQtuD2XEA
         8QthwYoUMy7ldw+1cxtRzYeJmgEs5406ro+e8YvPvWrk8VD6ClBWiJ6oYBBiO2h19A0G
         ng1w==
X-Forwarded-Encrypted: i=1; AL+hErEcIKU1H49IiEOPwnt2gJMGxLASi4smwbotknzZM8Qfa0BieIGaqQa4/D7z/QcXCP6aIWXJ@lists.linux.dev
X-Gm-Message-State: APuU4Z+Vv5oA2K3yk72dmpKlzKpzWfq6mWzCD9obdrxy0S2EzaQCB2th
	Kv+G7Ftc7+pIGZV/wG5sbxV4nswfRyL8JGwaDwJqJE27MP9ngRS38EgEQJDDzvu3kVwHd638Ws4
	5v2urEggeJWS7PzzElcYlg/XbQNGDmFI=
X-Gm-Gg: AZFdTZcB2q4mPZuaCnPOBbKaUH5Lt4w95nDBSwNce6NcFOlTGlSvZ7Xo1ATGNiypfFt
	18e6RxjbizZwuYY0Yh8+CbQ1EV8xumRZ5VzvOB4SiNCmrWT56dB4drkQy3ONEbuhfz0d5y0b0B0
	OFbv9zCkYcH4vLEdc45Bb51p2G0y1IS4F6KMrrlG3hkVOWDB6voawN3E0+ghu+YWkDkoctPQ0IC
	bVH7yFy019jtE2yQ0vJvRubhHkNnO7rEKKVYf+74LfGenF+YXh7ZLNnN+7QK4KcbGbqOTL3Y80K
	bm2ohW9z4EQAjgeSkGR2L6t6aFzjzRhPdjF/BYIq9X1ef/t3nvUFOYaBG5c5B9ews00NRvVfV1Z
	kM7ojA9YQ10mHfLF/fYnzjBNHsODSOT8Kwzg9mFNdvdsL2YT+MIWtGc+Z5714SZm27XBElA==
X-Received: by 2002:aa7:c710:0:b0:6b8:e848:d004 with SMTP id
 4fb4d7f45d1cf-6ba37e8dec5mr6855932a12.29.1795474036043; Mon, 23 Nov 2026
 14:47:16 -0800 (PST)
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
 <DN2X3RC5JUFQ.2LNGLQOUX4ZPF@gmail.com>
In-Reply-To: <DN2X3RC5JUFQ.2LNGLQOUX4ZPF@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 23:47:04 +0100
X-Gm-Features: Aa3M54pZr_aGN97hdgjJEJclpmHDWTbmXWMujrk4s8rCr1BMot2r_DEgpbuT4T0
Message-ID: <CAOQ4uxhsv_1EEqAZ3Ebp5Uy8Q6nvEnE3EAomJjjQO86nTcW0cg@mail.gmail.com>
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

On Mon, Nov 23, 2026 at 10:45=E2=80=AFPM koraynilay <koray.fra@gmail.com> w=
rote:
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
> By the way, should I use this description in the commit message (and

You could use that as a short TLDR intro

> integrate it with missing information before/after the bullet points),
> or should I keep the current one?
>
> (current one:)
> > This lets filesystems advertise their support for specific xflags, like
> > statx.stx_attributes_mask does, and userspace can specify only which
> > xflags it wants to change without needing a RMW cycle:
> > - on GET: each filesystem that wants to support this new API fills the
> >   masks according to its supported and read-only xflags, then:
> >   * for boolean xflags: it fills fsx_xflags with the current on-disk va=
lue
> >   * for value xflags: it sets the xflag bit to 1 in fsx_xflags and the
> >     xflag value in the struct field;
> > - on SET: userspace fills the rw_mask with the bits of the xflags it
> >   wants to change, then:
> >   * for boolean xflags: it provides the xflag value as a bit in fa_xfla=
gs
> >   * for value xflags: it sets the xflag bit to 1 in fa_xflags and then
> >     provides the value in the struct field; if the xflag bit is set to =
0
> >     instead, this informs the kernel to unset/clear that value.

You can keep it also but tbh UAPI documentation is more useful in
comments and in Documentation than in commit messages.

Thanks,
Amir.
