Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443281;
	b=2zAtsuhaUgwn/HwGV5Og6ZCvAJBmtdcGf1lEAv5osoA0OEInbzyPn0uDTDSPsyvRjnLB
	 mX9f0AGet4CSgLYXpD5unYmU5KQMZ3fUjMVX8zTF1r+vB4IHvPG9iLLCjaVnaZppX2gsp
	 tpBedjWsirYlxK/Du0vS/DLbwQIEfBv2RWGOrUt6oR05Mjif9ZPNdbKFkhNPi9J0O3tXW
	 DUcJ0lCwY9M/eg/hc4pTcwG50kHH3cVBBurgl+kSNOVpdxsB26Xvv7ZxOpKHuP3+kYbK5
	 RZBT7xQnm+R1LUpNKKBkGw9rl1MnPX1etuhGVACzsoJ116WrokuUD3jvK8O1b6f7k5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AOY0PbbuOL71oawD6vspI9ahlDMqf1h6fTODPqf8U0Q=;
	b=mp/y/JeUv/EliqnmxgzaD2vAhpwgUGytOpPr9XVeyNU8yMZ465tDvfQMpZOo98kotnkk
	 qaAbSrOp3sPAz6XKQU43eRp6Q7uYnTxJ4/9lJuZMhsG5CAwLXoIi12WE06LsbM4ToZiDE
	 Ph7w8GSB0VBJmAT8eOXfyRM93ShHJfVXuAj/JMvteqZDl7zqzaAQVFCaj4Svw3EiJ8OU/
	 LrOQtQc78/BYDOJRz23XlMfq45qVlTZ25XYVxn1Ru6R48w4sfE4NnoZqofBQPRmjNfnzq
	 Aj9xseGLYKXYpD3rji5iat0bZ8d4/W0IBcm5JzF34SZKpUpZLTWa9slI86hsJEgOVnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wxyPZrHQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C49606A32E
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 14:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C49606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wxyPZrHQ
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so4009491a12.1
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 06:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443279; cv=none;
        d=google.com; s=arc-20260327;
        b=RGPMCTAUE+TXs3HByM4lknnvj88YDQ4DIQqecVPnNXnQP6cF0KlKbR4k00jMXEX2Bs
         zjRRdSJfbJ2azCRywUB6nq0+kLGpVkbm8lj++zCHw6+savq3YVVYrOtZsAOT6PNzrMTn
         80BXqHqp+RFMIiW9rAM4d6kOOZ5fW012bzpw2KisqXm0vbIYHYav6NYMbL2cSl1kVZIC
         O/mrC4CeZ6k3xQtK2iISRAZTFQINa/uTYUhIpYla8ivaATEpQ1IT06VWj5wKQ2uZT8zF
         WBLfJARO5O/70vZ5xpgjl++lCpewo1D6y9dTtWrw+rf0l6mqk1OeN+mSa+i+bb71SFsg
         Cwow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AOY0PbbuOL71oawD6vspI9ahlDMqf1h6fTODPqf8U0Q=;
        fh=DsJ9GanoxuCWjYSeOVgNJkZl4fFtkA7p8Wadrqg9M7k=;
        b=KYJA/HOhzi96eDIB34vfZGr0f8Rigv+bgc2KapISz5P+kI0nawMVAStHse5m/AF6Sq
         IKKV+Czw6azc1fWIezqHTXUpPeZmaaZriRGwDZpFEQpefkRCSjB0PFG9wVyF/Qn0iMt3
         Ja2yGJowPvUeuofzskl8Lt0YejrSLCSNNoAet2BpsxIziGAEzNuMVbgQxvatUoS5T9gS
         yBN4NBnV2+NvQheH+9MtaRWCAGXvNSmz2co4xJYuHt66/zNCfRcbI/Y0gXrpFQbdPL8z
         23FlmxxYNcdL91igDnx6Ko/weRSfFQFPtbdIwp36zL9ZoSAyGhzjdtJ+7C+d8c6BtzmW
         ci3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443279; x=1796048079; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOY0PbbuOL71oawD6vspI9ahlDMqf1h6fTODPqf8U0Q=;
        b=wxyPZrHQckv5/DI2PBPMH51Z6g8X7OhGC1ZgjCPH86/pbo9mpxFSQ4rPgSzorhLg0b
         /rZGQiknyDHOEiVkFmuWPICZZg94pJ0OSc5BHQ3lyOYCVD9RryE+XhaBYfObTBVx+tai
         QB0OzASGj4QCqDUFWMf2gRf09+fynFd5EsCrF3MKrsUGwhFzJIspJUGvU4Lw+GzIGWig
         opcfQ6YJ38Qy+/fHDDJpmc35UQ3HDMN2szTCN2CgifO6FbLqs49xFLr8MEfO/Ga+8EyC
         IUyI0mni8wE7b9id8Nf+lD++IEa1NJJbDQfD4VusvdeEHolbXCYEjBaat9bI/eZJbUh9
         vP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443279; x=1796048079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOY0PbbuOL71oawD6vspI9ahlDMqf1h6fTODPqf8U0Q=;
        b=s44eC8FUOhqeJ5GKrRFWrxy+fAvYgEm4fxN3cSXSoSkOdi19KYyLByHUoXZU0T5R6t
         1M1fGhwX67LXDX/pB0AbGV0v4pz2myN4FI0nSOgKo/13ckvMcGUMmSHw41/zri6/bvkz
         Cvb+enRViJ7fjkwwnvmXfew6hXjxvqNWvh+cSYCRd5djp6bQCdy4DC2uBIjLz7sSyh3y
         M2j/tzOQerMfgftkxoPsIYqRJIBU+QQZ5/4stToLe7o2lsh20XAkDuE5zs7NvNJeldvl
         vqt84f33lfEBHrOyRteE/rPeMuEOAfenYcNsyAKhgQi/lqP7ZSx9JwJLLR5coQi7MDZJ
         b2Dg==
X-Forwarded-Encrypted: i=1; AL+hErFz4XYYjqtwLUwdNSzlmWj4EO7x2xAg8em6GDkaQRVtDJzdN5MkSZB0JCZ6aIJAP6dgdTiO@lists.linux.dev
X-Gm-Message-State: APuU4Z+Scv8znOQ7A9uDKbo4twZj9I6KTZVViu3IccWLDtnwCacYyAzh
	Wxfn4iMkDFeT4wePWeYAQGCBNYz/Xkb0+XE+vNSWW4JqPwAm61VQOesWo6B+8PbW8srFnFjKNvG
	7kPop+IQmNpNiA9t6f4JKueTaSlVRSBw=
X-Gm-Gg: AZFdTZdyUZrPOy9pnYKrFAWuUUdvgk1sgifjL6brUo4Uq4oTCywNw46a3eCkv/HvIQ1
	cnbf45+Qt8/TxLC7zuNBPacGaJ8iWX8cKES+/Rxtl2zQCIo9zy7WtETJuniooCcvLxcS1wLl3dk
	cfFsFu0SQkLvFssPBsfXM20/WZc1rmEm990n7uIzyvY+xjTZF03Ua0vY/tIAeB/KNgyco24IPqj
	xbNxIJQgY8thrmBexy9vhR+EYyutgfXJ6t96o5IaFmcKxp94/Dz/3seldDo95sVoNQNiBAdq0kQ
	uZ2QbZFTa1QGwjC53scD/OvT6qGWa/UVMDkYgPOg0260aC5iqusEnhEkN+9YYtltYrMyrKn727a
	lLdJPAPVUdYmQAoIvRPEEWi4BtihZ9sAwL2TqexDTtWC7aGp373ERQ887z3gfO1oA4taCMA==
X-Received: by 2002:a05:6402:1e90:b0:6b6:8ed8:765a with SMTP id
 4fb4d7f45d1cf-6ba37eb79cdmr8133267a12.38.1795443278525; Mon, 23 Nov 2026
 06:14:38 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <20261122000856.536902-4-koray.fra@gmail.com>
 <CAOQ4uxgc6pP+_xvJMbqj6wOdGzS75Vn6x6i_vUfCJDD46DAA_Q@mail.gmail.com> <DN2N0BY83OY2.1OV3ZAZFSWCDG@gmail.com>
In-Reply-To: <DN2N0BY83OY2.1OV3ZAZFSWCDG@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 15:14:25 +0100
X-Gm-Features: Aa3M54qAtfdGB0LeRebZKK7K89qIg_MfhE7-Z5I2BzYrqC2uKTrvU0S-v_Coln4
Message-ID: <CAOQ4uxg9O-R_SUPAZ75ESGB99-4Z4EEUKGMkCF2f-sXkGPq1GA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ntfs: switch to the new xflags fileattr API
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

On Mon, Nov 23, 2026 at 2:50=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 23, 2026 at 2:00 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> Switch ntfs_fileattr_[gs]et() from the legacy FS_*_FL flags to the
> >> modern xflags (FS_XFLAG_*) fileattr API with masks.
> >>
> >> Introduce FS_XFLAG_COMPR and FS_XFLAG_ENCRYPT and add them to
> >> FS_XFLAG_COMMON (and add FS_COMPR_FL and FS_ENCRYPT_FL to FS_COMMON_FL=
)
> >> to be used in this API switch.
> >>
> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
> >>  fs/file_attr.c           |  8 +++++
> >>  fs/ntfs/file.c           | 63 +++++++++++++++++++--------------------=
-
> >>  include/linux/fileattr.h |  6 ++--
> >>  include/uapi/linux/fs.h  |  2 ++
> >>  4 files changed, 44 insertions(+), 35 deletions(-)
> >>
> > ...
> >
> >> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> >> index 50be49f4c913..fde6fb2fe39c 100644
> >> --- a/fs/ntfs/file.c
> >> +++ b/fs/ntfs/file.c
> >> @@ -155,31 +155,37 @@ int ntfs_file_release(struct inode *vi, struct f=
ile *filp)
> >>   * @dentry: dentry to report the flags of
> >>   * @fa: filled in with the flags of @dentry
> >>   */
> >> +#define NTFS_RO_XFLAGS (FS_XFLAG_COMPR | FS_XFLAG_ENCRYPT | FS_XFLAG_=
CASEFOLD)
> >> +#define NTFS_RW_XFLAGS (FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
> >> +                       FS_XFLAG_NOATIME | FS_XFLAG_NODUMP)
> >
> > Nit: checkpatch may allow 100 chars, but this due formatting is not
> > easy on the eyes
> > pls break to RO line
> It should be 78 and imo it looks fine, but yes, I'll split it in next
> patch.
>
> > and indent the broken lines below (
>
> This should be a diff-only problem, in my working tree the file has them
> correctly indented using 3 tabs (wide 8) and 0 space, probably same
> problem as the PROJID line being unaligned here:

Sorry, pls ignore.

> >>  #define FS_XFLAG_PROJID                0x00100000      /* project ID =
*/
> >> +#define FS_XFLAG_COMPR         0x00200000      /* Compress file */
>
> >
> >> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> >> index 4faa40febf11..219e7c8eb601 100644
> >> --- a/include/linux/fileattr.h
> >> +++ b/include/linux/fileattr.h
> >> @@ -7,12 +7,14 @@
> >>  #define FS_COMMON_FL \
> >>         (FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
> >>          FS_NODUMP_FL | FS_NOATIME_FL | FS_DAX_FL | \
> >> -        FS_PROJINHERIT_FL | FS_VERITY_FL)
> >> +        FS_PROJINHERIT_FL | FS_VERITY_FL | FS_COMPR_FL | \
> >> +        FS_ENCRYPT_FL)
> >>
> >>  #define FS_XFLAG_COMMON \
> >>         (FS_XFLAG_SYNC | FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
> >>          FS_XFLAG_NODUMP | FS_XFLAG_NOATIME | FS_XFLAG_DAX | \
> >> -        FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY)
> >> +        FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY | FS_XFLAG_COMPR | \
> >> +        FS_XFLAG_ENCRYPT)
> >
> >
> > Rule:
> >
> > You cannot add a flag to common without carefully auditing all
> > filesystems that support the legacy flag.
>
> Yeah, sashiko pointed out a problem in f2fs, and I could reproduce it in
> testing, where adding COMPR to COMMON makes f2fs crash, it also needs
> NOCOMP in COMMON.
>

I don't think this is correct, or at least not enough.
My agent said that this breaks or changes things on  f2fs/ext4/ubifs
I didn't bother to check if all of them are true - I doubt it
bottom line - need careful audit and good testing.


> > FS_XFLAG_ENCRYPT can go into common but must also
> > go to FS_XFLAG_RDONLY_MASK because it's read-only for
> > all existing fs.
> >
> > COMPR is rw for some fs and ro for others.
> > As with CASEFOLD, you cannot make it COMMON before
> > converting all casefold fs to new API so that each can say
> > whether it wants RO or RW.
>
> How's CASEFOLD currently handled? in the v2 I'm drafting, I added
> fileattr_mask_to_legacy() and fileattr_legacy_to_mask(), which convert
> between the old format (filtering by FS_XFLAGS_MASK) and the new mask
> format.
>

Good question.
Need to check this.

> > I think there may be a way to deal with this easily since
> > ntfs doesn't need to set either but not sure.
>
> We could export the 2 other helpers I added for v2 (xflags_to_flags and
> flags_to_xflags) and make NTFS use them?
> Though adding the fileattr_ prefix will make the current (v2) vfs code
> maybe too verbose.
>

Honestly, I can't say for sure - you can try
I think you may need a different set of helpers fileattr_prep_ used by the
filesystsems that are converted to xflags_mask, which may be different from
the set of helpers used by the user facing ioctls but I'm not sure.

The thing is - this is all hard to wrap our heads around

You and I have parts of the design in our heads w.r.t backward
compat with legacy API, both UAPI and vfs internal api.

I think you should put it in writing to see that you and I have
not left anything out because this v1 surely does get it wrong
in several places both wrt legacy UAPI breakage and internal
API correctness.

Thanks,
Amir.
