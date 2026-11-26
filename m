Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724942;
	b=zJAN+avuN8O9XH1HgBFxRDzrJEjLgfEkgrTi4T6eYn3xR4REx2gUMf53ai7oTK6HOJSs
	 A3bTUx8pxsEcbpmSOPUk1AeXTfm3V8WiY659yiRLLf6lzLOByBQNRYe9uRrZuvaPTlUyK
	 B3UGQ3AnLdf9HKtU1bETjOBqn0gea67eXk5m3AH3/yTI076atqqGowVjtwFDwYYwc/T2G
	 +he5SxsJpGed1piesYpXbvqjM0HvXe5QgbS8q1SUFLm7sm9u7pn6B+qk8yGWtzFmzgnp2
	 FAiRDZLYJRZWVqIQ7uXbTndrlAqXSO1VCqjR6uJtOPdrevr+TZahF60OmTLgM6kNoTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724942;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kdLL7Yg506/OU3194+lHpPleSU7z2Nbl1xEkWPkllrw=;
	b=iBd8DMfRCc3YxoY9Qot4bA9MRUdwdPnjvsVh+CG9Bh7BaTk1LXtC+tlyh/aY4ZjxjGVD
	 91bkZRlHRk45wuxkauSvFynu2xoqUgcL1WiBC/JELE8fGVqojzCaDyvCzsMduau0uZ0bA
	 +/k6yr5WZTX9zA5aQQqy/TO4yLtn409pmaE9QH56k5oDWigw7fGk8TGylvnj+YK7vUoCW
	 0mCTHB0LTh1B4GTHK5S/vMDAe6Lu7tEiXyb+8A+zfN8+rKRzJe/KygrXizqdODHN0RmXk
	 BD3ytoQLz+1WBLvnh4YTXYxIHjzhKLtT1EXgxXFRdwKIsfkgyboABPnQu3ssg157fPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=4pe3q63tznap5lvaoa7tac2tbu.protonmail2 header.b=LwBPqNbK;
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE1606A31C
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 20:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CAE1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=4pe3q63tznap5lvaoa7tac2tbu.protonmail2 header.b=LwBPqNbK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=4pe3q63tznap5lvaoa7tac2tbu.protonmail2; t=1795724939;
	x=1795984139; bh=kdLL7Yg506/OU3194+lHpPleSU7z2Nbl1xEkWPkllrw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LwBPqNbK5CHnwqaq+3pJh6dYTdSo0GjllODeqUMHUnCXvhVdBKUyInAUJgYL5tnIR
	 0/zJEtIU1NmTlWgiuNQBHMKRwy5/YCa9c1iEJoJgjCFHVb2gOPo1gvV7TSNbFpEvPV
	 6BfjPnrBjzT6KJN/N1aO0SFOaUI3KPlm2FlZqY/YxPCi7ZWJpw7cN1qE9cFf4ZclKe
	 s8jN3+bU3IHMU/G1qEoUd3uBwlaCUbXOiV3Bj4S9LM9GXYTy/dhDP7gqLslpzsVJip
	 GByaiKhKuUQFz8j3UM6oA9yDgiui12N6t+JfNWdqjV6SbAaQJjO+j1XZxzJ5HH+AQ3
	 CZRHuKh6U8LTA==
Date: Thu, 26 Nov 2026 20:28:53 +0000
To: liubaolin <liubaolin12138@163.com>
From: Ernest Borowski <ernest.borowski.git@proton.me>
Cc: ernest.borowski.git@proton.me, fstests@vger.kernel.org, Zorro Lang <zlang@kernel.org>, ntfs@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [PATCH 1/4] common: add support for the ntfs driver
Message-ID: <179572492929.403959.7488744115552484847.b4-reply@b4>
In-Reply-To: <2ff07282-cb19-4098-b171-bb0875939976@163.com>
References: <20261125-ntfs-reproducers-v1-0-0cc67533d803@proton.me> <20261125-ntfs-reproducers-v1-1-0cc67533d803@proton.me> <2ff07282-cb19-4098-b171-bb0875939976@163.com>
Feedback-ID: 236360163:user:proton
X-Pm-Message-ID: 135b13f77f1fbd3df64752fe621ec9e2a7535804
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 10:39:24AM +0800, liubaolin wrote:
>    _common_mount_opts() is only called when the corresponding mount
> options are unset. If someone sets MOUNT_OPTIONS or TEST_FS_MOUNT_OPTS
> directly, for example to "-o noatime", that mount command will still be
> missing -i and could invoke an installed mount.ntfs helper.
>     Could we add -i somewhere that also covers explicitly configured
> mount options? That would make sure these configurations use the kernel
> driver too.

Good catch. v2 moves -i into _mount(), which every mount and remount of
the test and scratch filesystems in common/ goes through, so it no longer
depends on the mount options:

_mount()
{
=09local opts=3D()

=09# mount(8) hands an ntfs mount to a mount.ntfs helper when one is
=09# installed; -i keeps every mount and remount on the kernel driver,
=09# including the base filesystem under overlayfs
=09[ "$FSTYP" =3D "ntfs" ] || [ "$OVL_BASE_FSTYP" =3D "ntfs" ] && opts=3D(-=
i)
=09$MOUNT_PROG "${opts[@]}" "$@"
=09[...]
}

_common_mount_opts() keeps only $NTFS_MOUNT_OPTIONS for ntfs. No test in
tests/generic calls mount(8) directly on the test or scratch device, so
all tests in tests/generic are covered as well.

Thanks,
Ernest

