Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441832;
	b=bzo2r3dFIUmvHyehusxf/Ixx0xQXtn+6JJrktZbMKBrl83oIMHwu/xlYjhzkcbzqMEom
	 A7qb4lO89150YOzMGWBONOJc9EmExoAyyB9bSSAjAks0p4K5f3OZ0ropoYnTCH7rGQb+E
	 ihhh21CSVoE/9PIrmQtnIVInhO9XhgDW/VLzNhI5OErEuT0QcAd4OlcelQ6DZ9ff2sxDe
	 UmS6SHQYhnfU+W4yQ6QTgTdXGIkilH5NewRG/a00tBkNL5fninRxptrzM2lK/pz95pPxR
	 NlocUtJnaJx1Q8Tla3ey0bk8+P0sNbHvR1N4oU11eiqbtBQBbuNizlV0uzLJLVVkimg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=nDVijpGqwKWyH50w8XVucnbg4rdJHZCpEUX0lljvpb8=;
	b=Jjk7REDUzyzp6fmHCYeb1VxLOJs69VuTnXgBqZoAiz1C5u6yjUlxE5h0pGFwwz1Ii4CO
	 Kr7HeO9Bco2bv5J7sGmhAWbi5HAzU3Tz6VOSd305Y056OVAlBwsHddVziQ+SH+S8dNo3T
	 h+Q0kRUHyQEuiofljEi/6zupJvyqnlhCRN/Zmqpg2MH0HSkxR6TzsRCHsIZwQOPjYS2QX
	 SXMo8xZNVYrMoFlcOJqfnLPRdL6ku6f9wsknCh47b4vDfbZ0srRCkRQynnWLZ/WkXXG1G
	 6avoBTyKNvTDYxTlZ/EvIHmFWpsqIfdRYLyZfTcvNHvwKKYgHImGYI6e0CJdLPUa55A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OCuldFyx;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB70C606A332
	for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 13:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB70C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OCuldFyx
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so35234235e9.1
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 05:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441830; x=1796046630; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nDVijpGqwKWyH50w8XVucnbg4rdJHZCpEUX0lljvpb8=;
        b=OCuldFyxwE4QI4z6tOjqkX3GVbTwDj57h3WFFnK3D0PQOrb2ohpr3iiUT6jEDPn724
         rz1TnXRVQ46lXJN5wAH7kEViV/28wCvzseKGgqprL5djnXEhqhUz1uR2pxfVocDQGJmF
         saSxS7SFiYG8FA7KL91ujplPuDMI+eFrB+Evf5dI+rcFZ/4qdndGKsFrEWpt2YQJX00w
         u2XW2zKj7pPkHViIJLeHpdOl9H8nj53zIcGEzy7fs2+sRx/JIzQVbafw2gIURIkZehcm
         P2lxdMIWkShr192pZ/oktb/dgNXSvQ3pMIkk79fwMDh4Y3CV0/p9XoX1R9CsGl8ibVwS
         tVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441830; x=1796046630;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nDVijpGqwKWyH50w8XVucnbg4rdJHZCpEUX0lljvpb8=;
        b=yfhmQuHM+Dg7brvcjDMLy7Ndk6e/WcAY8lB18OJu5ZY8jxiUIQsq0Gv53+tQM5a26w
         tdYB3Yf0XitnkULugVng9wu4F+ju3hT5NeZEATL+Z2XFOiVmVMqYCM0Y9yFtNpB8YVU1
         AzcOVxMePCiqqAbPzqVLyqmgnNzJ9T1V3jtZcykH8elG74no5rZsNtL6H90S2pQiY/yq
         bmNVbfFCBn5KcTTXaL2oJC2KUAa/7/7aIyVYQ0hvj86yTifAPoyfkz2VnB7B88Qyd+Wh
         OoynU/OxFLeZ6xP4Fur7euAilSqKJz1ghLqiXmNoJZfQmXo1O3h9vXfIIzOHEWzL9MQP
         FyHQ==
X-Forwarded-Encrypted: i=1; AL+hErGUI44cj6qrBiJmfb/qVU5PeFc0Gz7lJHN/+eEKbnE/C9J2kAGBYkepVa8ZDRO6Jyucj7Ra@lists.linux.dev
X-Gm-Message-State: APuU4Z+ResL/5lRtpfA36jEupHHUtY4PbGgfYbBOf9mlPpQzkec9ZXdn
	kto5le67HW7gIRgX8Fc1kYKloNWU4Q3B6Ke+1usyyRjqYg+LYfc2Bfks
X-Gm-Gg: AZFdTZdsPkgJ3YyG5x4u77xP8recJ8yCT1XRXxHMa82ovwmGU9ssWi0BRr5TaBOdHn7
	flmOtRf99pzOocUWA7hSgz0qRH8Kq1hx7tdWZHy8QjrLht43z0bZTuxOjt3iDQLoVbG42VQrxZh
	YslAarbJxS98uGVL5GeNLsj3dAKJc6QiPChW8XE1qee7tGxeHok6KEYcp6WZ/4hSUh13rBr73zB
	Ox8drD1ks9GX1nPBw8o9Lj6pYrq28AtFvvkC/ZpYnukaRLZUJUG/QC9Nz1dILpF7OrQMsjgJ2Wg
	/I2YLkAG48e4CHCCW08smkRdKsBrZcU/nekbzQQZRLchRe6N0DtwUr05NXdbWh1UTkVMs8nJYic
	q2v9uP8UyNXvBI3XkBqahBcrmJrVzoxrcCBJkOtwTAFUvI860TVg/vHGSDTxC32S3tSN5zgNFl6
	dygyTDrWGEEWjoiaQrjOldyY0g61RbydaO9dK8dCITSpWFmPC34O1mnVYlYaIeLHMcJ/dQyjc0r
	Q6kinYGW01SQWIUC/5PuAAG2qx9Ai42d+3108d/PB1FYtMp0lmm0Rd9+JGa2vIyQtF2ZlDTBQko
	youc/bQphPJxI3y0y+cHuWhHDWQvqBsuqeANqsrhtoJOjmU=
X-Received: by 2002:a05:600c:5493:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4bb8881c734mr251533555e9.7.1795441829886;
        Mon, 23 Nov 2026 05:50:29 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm348754825e9.15.2026.11.23.05.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:50:28 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5849192148479b23b3d4c31f6e3ae6158a9ba4dcae3531b8cba6e234b57e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 23 Nov 2026 14:50:25 +0100
Message-Id: <DN2N0BY83OY2.1OV3ZAZFSWCDG@gmail.com>
Cc: "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee"
 <hyc.lee@gmail.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian
 Brauner" <brauner@kernel.org>, "Chuck Lever" <cel@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, "Jan Kara" <jack@suse.cz>, "Darrick J . Wong"
 <djwong@kernel.org>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Lauri Gates"
 <lauri.gates@gmail.com>, "Christoph Hellwig" <hch@infradead.org>, "Dave
 Chinner" <dgc@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <ntfs@lists.linux.dev>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
Subject: Re: [PATCH 3/3] ntfs: switch to the new xflags fileattr API
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122000856.536902-1-koray.fra@gmail.com>
 <20261122000856.536902-4-koray.fra@gmail.com>
 <CAOQ4uxgc6pP+_xvJMbqj6wOdGzS75Vn6x6i_vUfCJDD46DAA_Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxgc6pP+_xvJMbqj6wOdGzS75Vn6x6i_vUfCJDD46DAA_Q@mail.gmail.com>

--5849192148479b23b3d4c31f6e3ae6158a9ba4dcae3531b8cba6e234b57e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 2:00 PM CET, Amir Goldstein wrote:
> On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Switch ntfs_fileattr_[gs]et() from the legacy FS_*_FL flags to the
>> modern xflags (FS_XFLAG_*) fileattr API with masks.
>>
>> Introduce FS_XFLAG_COMPR and FS_XFLAG_ENCRYPT and add them to
>> FS_XFLAG_COMMON (and add FS_COMPR_FL and FS_ENCRYPT_FL to FS_COMMON_FL)
>> to be used in this API switch.
>>
>> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> ---
>>  fs/file_attr.c           |  8 +++++
>>  fs/ntfs/file.c           | 63 +++++++++++++++++++---------------------
>>  include/linux/fileattr.h |  6 ++--
>>  include/uapi/linux/fs.h  |  2 ++
>>  4 files changed, 44 insertions(+), 35 deletions(-)
>>
> ...
>
>> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
>> index 50be49f4c913..fde6fb2fe39c 100644
>> --- a/fs/ntfs/file.c
>> +++ b/fs/ntfs/file.c
>> @@ -155,31 +155,37 @@ int ntfs_file_release(struct inode *vi, struct fil=
e *filp)
>>   * @dentry: dentry to report the flags of
>>   * @fa: filled in with the flags of @dentry
>>   */
>> +#define NTFS_RO_XFLAGS (FS_XFLAG_COMPR | FS_XFLAG_ENCRYPT | FS_XFLAG_CA=
SEFOLD)
>> +#define NTFS_RW_XFLAGS (FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
>> +                       FS_XFLAG_NOATIME | FS_XFLAG_NODUMP)
>
> Nit: checkpatch may allow 100 chars, but this due formatting is not
> easy on the eyes
> pls break to RO line
It should be 78 and imo it looks fine, but yes, I'll split it in next
patch.

> and indent the broken lines below (

This should be a diff-only problem, in my working tree the file has them
correctly indented using 3 tabs (wide 8) and 0 space, probably same
problem as the PROJID line being unaligned here:
>>  #define FS_XFLAG_PROJID                0x00100000      /* project ID */
>> +#define FS_XFLAG_COMPR         0x00200000      /* Compress file */

>
>> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
>> index 4faa40febf11..219e7c8eb601 100644
>> --- a/include/linux/fileattr.h
>> +++ b/include/linux/fileattr.h
>> @@ -7,12 +7,14 @@
>>  #define FS_COMMON_FL \
>>         (FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
>>          FS_NODUMP_FL | FS_NOATIME_FL | FS_DAX_FL | \
>> -        FS_PROJINHERIT_FL | FS_VERITY_FL)
>> +        FS_PROJINHERIT_FL | FS_VERITY_FL | FS_COMPR_FL | \
>> +        FS_ENCRYPT_FL)
>>
>>  #define FS_XFLAG_COMMON \
>>         (FS_XFLAG_SYNC | FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND | \
>>          FS_XFLAG_NODUMP | FS_XFLAG_NOATIME | FS_XFLAG_DAX | \
>> -        FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY)
>> +        FS_XFLAG_PROJINHERIT | FS_XFLAG_VERITY | FS_XFLAG_COMPR | \
>> +        FS_XFLAG_ENCRYPT)
>
>
> Rule:
>
> You cannot add a flag to common without carefully auditing all
> filesystems that support the legacy flag.

Yeah, sashiko pointed out a problem in f2fs, and I could reproduce it in
testing, where adding COMPR to COMMON makes f2fs crash, it also needs
NOCOMP in COMMON.

> FS_XFLAG_ENCRYPT can go into common but must also
> go to FS_XFLAG_RDONLY_MASK because it's read-only for
> all existing fs.
>
> COMPR is rw for some fs and ro for others.
> As with CASEFOLD, you cannot make it COMMON before
> converting all casefold fs to new API so that each can say
> whether it wants RO or RW.

How's CASEFOLD currently handled? in the v2 I'm drafting, I added
fileattr_mask_to_legacy() and fileattr_legacy_to_mask(), which convert
between the old format (filtering by FS_XFLAGS_MASK) and the new mask
format.

> I think there may be a way to deal with this easily since
> ntfs doesn't need to set either but not sure.

We could export the 2 other helpers I added for v2 (xflags_to_flags and
flags_to_xflags) and make NTFS use them?
Though adding the fileattr_ prefix will make the current (v2) vfs code
maybe too verbose.

>>
>>  /* Read-only inode flags */
>>  #define FS_XFLAG_RDONLY_MASK \
>> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
>> index e40806b3a69c..09fc7e066485 100644
>> --- a/include/uapi/linux/fs.h
>> +++ b/include/uapi/linux/fs.h
>> @@ -275,6 +275,8 @@ struct file_attr {
>>  #define FS_XFLAG_CASENONPRESERVING 0x00080000  /* case not preserved */
>>
>>  #define FS_XFLAG_PROJID                0x00100000      /* project ID */
>> +#define FS_XFLAG_COMPR         0x00200000      /* Compress file */
>> +#define FS_XFLAG_ENCRYPT       0x00400000      /* Encrypted file */
>
> This is a mistake of patch 1. the newline should remain above HASATTR
> which is allocated from the end.

Right, fixed (and removed the blank line between CASENONPRESERVING and
PROJID).

Thanks,
koraynilay

>
>>  #define FS_XFLAG_HASATTR       0x80000000      /* no DIFLAG for this   =
*/
>>
>>  /* the read-only stuff doesn't really belong here, but any other place =
is
>
> Thanks,
> Amir.
>>



--5849192148479b23b3d4c31f6e3ae6158a9ba4dcae3531b8cba6e234b57e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawREoQAKCRDmj22qf5IG
XPikAQDShiHwdlBzVhBmmlaSOjx657TCRAUhtq5TpU0jWZ2HUwEAqm4ENGadEir3
5R98mqEdCF353Ii7LkdpHNEHYRGrkQE=
=QROX
-----END PGP SIGNATURE-----

--5849192148479b23b3d4c31f6e3ae6158a9ba4dcae3531b8cba6e234b57e--
