Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8321A1DC198
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 00:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036935; cv=pass; b=dP9Z2YMB4Zg2AbBjjbdmjqKzoJ2xS56b+xs6EEHx6veTZc0Tu7W2I9plh1f6+1YG8E6g+j55RCxeLf9NQmbWNOOorh5+JDz94MfDix7bRObzSx4RGSxvAf8VDv19Q6ocL8GDDmO+/uogzqrCDAN+99tQr2Wyls3rPTSz3wzaGW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036935; c=relaxed/simple;
	bh=9K8vEP5DPBvbXAhyF0r86XDr/JVcelb5fGqLZ8GVrV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SO7Ou1cqUtYJu7BBWAm/+x6IdhoN2FiJumS088dKEZKJO+KSXwwjFwSpQnlqTfi3AG8PdpPr1cHDezATVq5j1YbhKfX7NocEwfBsJmAhVw6C/arXz3nwl9MpXg0hJfv6/LiGNyEfgKXO/17bX351YXHGqBFzesZnmkw/mYrcNR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PICXoPK9; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PICXoPK9"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d47b5987so45632e87.2
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 17:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790036931; cv=none;
        d=google.com; s=arc-20260327;
        b=cQn0pGyadieLBqx3kiaa+Vk8AHreYnU28CXlTTz3LYZp7z+P2udwOkzPhgHYfqvPC9
         uDj++6DYOYK56up23GJpvPFj6efjjJJwggLZpuzz/RYaUvdKiJNDzTWziJpJIhOTpFwy
         yy5JNZc/2TraYruoY78ZlYOw4/aWQmYD6X7JTsNOdOswRDInwEQva1URWLIh5pJXg+sw
         uWOG8ux4ZlK99HxQ/Gp6MlxhjmI5Z9rnQMOagSI5w7iINi1kYTHw2D//6007GZQ5vrQi
         fkcfR5OGQF1Q+TWAuIE2ahYeSKQ5bst3pA8FaFFiX3rkp8PRj5IcxZjlfx1ZOcsbp8iL
         ThNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B1EgxVlVCCNrIV7KXVjIE4eTSDXnDsQycoYJ8SPkPD4=;
        fh=TEwg1uix//DYEgV+O8bOnzxPfxI4zEBJbRizMOpkYUs=;
        b=pg7uwhE4KvmwbDDLAArf9gL+pnHAc0wDgl0J85l6qmBB7QW1BmyrDqLLkNj9+abGxk
         pgP3tlp/BN5UWN7R9s4t4kqlguDFcQIVYjqGhW/0wyMpDMHrXeDaB4a3HAJAYpuNz/jc
         52x7ont4RYGMbD65po0te6F0mMzdrFKQvbjQ8zRpXxg9iOLc1AsE02cMSILevRKFhPSi
         arOJEqlOOPIsRZnhQI57istLMNxOkZsSCC3VW56+dEWtwvQNNhuaKkbUv/BAtKY7tPCx
         /GF+a4zj1GY9OQl5hbqYs9X34s3a1diy5c2jy5TGDGVUhOezmGN6KGzSyQVQg+L2bD9B
         BRHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790036931; x=1790641731; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1EgxVlVCCNrIV7KXVjIE4eTSDXnDsQycoYJ8SPkPD4=;
        b=PICXoPK9hBTjc28Jnaz2/Qc49XhnUYbV4wQqOBtYHUuOm8vYpRQi8vqoJAIVSIVC/I
         DBDhuvcdts5cy8xDI61td/hJyFOI4WJnDxEXpW7DDJl1N3RYTPqiLKEsnm+ns8b4Gs9D
         7gZn/CrT59v3WERFBRYFAzPlbQF+iJ0OENADB6fqRiw/MF9hQqHdsDki5VXp54x4uz5H
         wGaYMCnyUE9KP9h7iy12jV9VucfQo8/ftX6dzS65OPSi8+IfCAuHxaAZ3R3VwsfvcL9w
         maBu1mcSQP7AGFUG16CwObFUkzDkLIBw8ODSaFP+Vj4k+hnG17iJKwfcTdyfDtCiVsRM
         wxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036931; x=1790641731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1EgxVlVCCNrIV7KXVjIE4eTSDXnDsQycoYJ8SPkPD4=;
        b=0U8kRAmm5w7jpep+lN+D99lnCiMYj6Tgjruxi3mqQ1pAVj5a1+Kw78DaL0HcgTBbYG
         WZJdym+qjruRKeNJOefEAobaYlOLVyJp9oRroxE+gor/7KwmR5PhvlcO7OpVCo72BUbW
         +m9lIRXBg0yxT7LU58GYN0oFcJAkpmWcyE4m1Jx9b3vU5uIIf7Ra4QNYHJ8qM/41GPkx
         UxrjWZ2vK7z6swAfc9FaDZz9fp8x7keylA+wxbkOd2bmz6D0uTeEdUAqht0rS8FerSZ6
         AvSxxjBFSZC0bq2lOuZHUh9GiIiiL5k9L/VkGmBYHThTh3T9xqstGP1lzloSCZOguSN/
         j7AA==
X-Forwarded-Encrypted: i=1; AKwUvBy0K71MG0rltx5THMa+pg3Z+n7zstRYFarV+zT6yaKyu2emsEQThrRi2XorffV4Zy1Rtyqr@lists.linux.dev
X-Gm-Message-State: AFuF++lD+4fUCZt38C/xALizuvT+0cs+lNvW14vsgjHcVQQcxokM9A1p
	FDh+l9WThT25LNXU3E3CfNKQDYXVTxqqZNWsb12UjTAcqH9XIAlOv7aiTniCgIdRrxtpYZ9+/TY
	f2OyC34wiqe+yNP6PGuRBT4ZUxnybCbg=
X-Gm-Gg: AYBFou3OMn+rRnAughM5HJ7LU2IAYIwZw1FRNMM89yTpP/+91uwW8+WInV/5gDpGP9i
	muDA4Auiuff/E9UOX8NYfG97XPVuILW+eXttdaNhsgRxeR+cyJdMDP+u44A767Xd9zuS6ZeRUQ0
	lUzI0iiBJw2luvo7HkIbvFYJyaCXkD4JNHd+9/uLtRVsY9VeDFuq46FGHcvNxIOdhdeRl/GfPIq
	Vuv88MuzaivjS9MhZRn7sRcpojw109U4jZ7SmvmSAEdLmjFTPIPSHL0GcT8MIvfSPi3sSVNPMEz
	lVxOlqlbrM8eCr2nnIiM9pvWquKmxw6q7gCIL7//IKTR+6HiEW+3VLI=
X-Received: by 2002:a05:6512:3e0c:b0:5b7:637e:f025 with SMTP id
 2adb3069b0e04-5b8c197ce85mr4215264e87.48.1790036931005; Mon, 21 Sep 2026
 17:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <88468.1790006025@30-10-12.wireless.csail.mit.edu>
In-Reply-To: <88468.1790006025@30-10-12.wireless.csail.mit.edu>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 22 Sep 2026 09:28:38 +0900
X-Gm-Features: AcwNN1VZsb-nx2h9jOFVddWA5pkODxBasv0T2Ao5oDt8v0YoXZIn5C5gHQ3wZFw
Message-ID: <CANFS6bZWCby_oDVpD04CDXNAsE4cZd+LK=Ke-UrpsOcgALFsHA@mail.gmail.com>
Subject: Re: ntfs_read_inode_mount() can pass size=0 to kvzalloc() -> crash
To: rtm@csail.mit.edu
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 12:53, =
<rtm@csail.mit.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> If ni->attr_list_size (a u32) is e.g. 0xffffffe7, then this code in
> ntfs_read_inode_mount() rounds the size "up" to zero:

We have to change the type to s64.
I will send the patch to fix this.

>
>   ni->attr_list =3D kvzalloc(round_up(ni->attr_list_size, SECTOR_SIZE),
>                            GFP_NOFS);
>   if (!ni->attr_list) {
>           ntfs_error(sb, "Not enough memory to allocate buffer for attrib=
ute l ist.");
>           goto put_err_out;
>   }
>   err =3D load_attribute_list_mount(vol, rl, ni->attr_list, ni->attr_list=
_size,
>                   le64_to_cpu(a->data.non_resident.initialized_size));
>
> kvzalloc() returns ZERO_SIZE_PTR=3D0x10, so the "if" doesn't catch it, an=
d
> load_attribute_list_mount() proceeds to treat ni->attr_list as a valid
> pointer, and crashes.
>
> A demo:
> # wget http://www.rtmrtm.org/rtm/ntfs50a.img.gz
> # gunzip ntfs50a.img.gz
> # mount -t ntfs -o loop ntfs50a.img /mnt
> BUG: kernel NULL pointer dereference, address: 0000000000000050
> #PF: supervisor write access in kernel mode
> #PF: error_code(0x0002) - not-present page
> Oops: Oops: 0002 [#1] SMP DEBUG_PAGEALLOC PTI
> CPU: 8 UID: 0 PID: 2279 Comm: mount Not tainted 7.3.0-rc3-00508-g40288c92=
06c1 #44 PREEMPT(full)
> Hardware name: FreeBSD BHYVE/BHYVE, BIOS 14.0 10/17/2021
> RIP: 0010:memset_orig+0x33/0xb0
> RSP: 0018:ffffc90000a67be8 EFLAGS: 00010203
>  <TASK>
>  ? ntfs_read_inode_mount+0x868/0xb80
>  ? inode_init_always_gfp+0x1d8/0x210
>  ntfs_fill_super+0xb77/0x2c90
>  ? sb_set_blocksize+0x67/0xd0
>  ? __pfx_ntfs_fill_super+0x10/0x10
>  get_tree_bdev_flags+0x135/0x1d0
>  get_tree_bdev+0xf/0x20
>  ntfs_get_tree+0x14/0x20
>  vfs_get_tree+0x29/0xf0
>  fc_mount+0x13/0x90
>  path_mount+0x35e/0xc40
>  ? kmem_cache_free+0x20a/0x2f0
>  ? putname+0x40/0x80
>  __x64_sys_mount+0x11f/0x150
>  x64_sys_call+0x13d9/0x2220
>  do_syscall_64+0xdd/0x4a0
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Robert Morris
> rtm@mit.edu
>


--=20
Thanks,
Hyunchul
