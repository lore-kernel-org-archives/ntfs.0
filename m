Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956488;
	b=44geSz6T+geegM5vrXP3NzK/R5RUc8uKhjMYbcstiDA8FPA0906RSYMuTPjLGeFV24DO
	 tFiF+Lyjovkc8t9iDb51q0ezT4XetCicvBqqcbYPdWH17+kau6xPtNW0s3A0oc+A1WivM
	 bxTwF/5uppIc+TgGi58RYlTsLL2zIgxkRKn/s6Lmjg+i0caYTzFfv739eh+yrBg2Kcvpi
	 XVzz9W2gGkV42ygFZ+Q+iCr28glVXjmNW7o5nbEHNzHsblJzHf+dVyDUIo2DWx05jXB6K
	 5GVYcTecflWsfcJkg1kjr58Az8q77JjaBgEUmsTocmHBwU2vgF7Psn8uPvo5l5cHdzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i4Sxkl+QpMR/bLZklf38xS+ljN5KiJdnyEPnXqWkDcc=;
	b=FqqVMbnz81b9ISQlKOVBFjc9BcHBhm5iL636Q+3iArhziivQ3ztQdrGiBGm+edlpzQfJ
	 IN6bChXcHPWDrSGlsCS+Vw46VlxeubMjFBRKi/AeEc+1Fy+8JqTqIUn7VbNHMpeFFHVM/
	 0PD3t6j9JxtkDql8P2LvpI0JQert/b9dwHd4EdT2IDOpTV1SpjmG8nKJxgDd/vw6F9mXs
	 Hnr9hc9PG9yZb2T+hgjMauuAHBPG2W2tu3Inmv/wFEMBR1QxQR+86mDhgGtORo17gIFaJ
	 tiRinnwMDll66KXQZoi2Lv7ybBHLRDULal1h9O/rF3CawwdC332KW8NvSqmCvIicYNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOqXsR6f;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBEA606A333
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 09:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFBEA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOqXsR6f
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so960931c88.1
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 01:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956487; x=1794561287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4Sxkl+QpMR/bLZklf38xS+ljN5KiJdnyEPnXqWkDcc=;
        b=tOqXsR6fBgpPk/Y+KE+47HBoWpxor9jIi22MhAms9HImjtmXwk71VaSwHfn8w/VIjk
         HwFsOMrn9mJRGholr335L60eI4U6ztBXArrEdiqDWVjLRIm+hrTRqVMgzmYVrb7nk5sI
         ynWNeiAgafiivrpZkWiXJcngLMa/74VpHSl4BbEDnOLe8a4ZS2yH4+w4eQwBDjj0nK/B
         EUDbyHnuImr9xsGLfEwlkjxfzCaDMs3jGK3Z5YAg2p7x+vmpN5t9bJ/iWhHp+WMIHIul
         AhVpL4aPsrKfxc8sFvMd8ZN43eFRbaCSClw2G+XAzLhKoSuHKhNSMVPvtAkf+ktudKpS
         xWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956487; x=1794561287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4Sxkl+QpMR/bLZklf38xS+ljN5KiJdnyEPnXqWkDcc=;
        b=1pEBtVRuufO/CZA+K3hSZ47hYgeEIO/76Yf+il3W8xiSklrAUz2M/q+tD61+OAIOM4
         0ad04S9JZvPkmZPWHV9njyPCXtW5GTM8+XKHvQpuFHNwRXQXeWQiBiud+Jp0X+3OCu0h
         lMYeYpOi17IbaQLNHrRIrrEVT6nBxKWZjumWzHwmW/Nrre5AGHBektPtD2lPzvYLU7Ch
         qQSHmoXCdMpeGKcZfhwTEk/fLOKd4vH2F9o5ehC7d17XW2pTO75px9z9CMEBSPkH7ule
         je5tjquwuaZ0kIcqBKAvD4nSu4ERZYT2tSu9/pap7Nx/eSaWeBluVo/8uevFI6F9jAm1
         lhMA==
X-Gm-Message-State: APuU4Z8zh3dGPHpHj7Ef3ga880YBc7QuuHP816/x7ZY6ue8hSiBnu61/
	iDWyq4RqrDaDDuJdaCECngBA2f22QiDvLglBqASnjuqxJxG7db4RMkIF
X-Gm-Gg: AYBFou2eUB72l1IoG1nnE9yy2gdaTLJZaOVB1QuhVpQuOBL788tPFhVFReDXp+djbIC
	YiiyXXDqY8cPdRar4+xk1BgCtMBDiYfKMtZyPC5iRV9y1umA9Ynydo6jgX6csyDJ8e6QFo++qAX
	v2GtCJpCwO+WJhSGtOPUa3lJC+zfhsbUGsIvXDCPHGCSnEuxM13cXZTQKPz+7an3k0Si1My+yuq
	lqx4LNRApFr0YISHUFyOTDLQpFKe5RjHZBxwASyGo9Z31DjOgUL6/bDai3Ax8eOQ/9+Eipaud6k
	w9Xw81yUHcgApZRbd0zXDHl/eY9hRyDoQgOo6w+kI736emPE1tfTyR8bczUAZKNs6uC239dPiNI
	E94ZuMEn3SCiCXSbH1/RNa2zbjePwLLZeOaWQDOsygD+5+nLMpNx6jOveEHBzqrO6UT7tbWhNTY
	BIi1LiLCjU7AwO071w46BxX40YA9W/hQrJyNdpeV7HYuhMfb3M2vAUFqjNZlDIm67FsEfETaRWf
	b+B0Uuq+lUFCxgYaCg16abvjH/gbwFDfl3s63chTKOmqPS+nUCDmMNbNgKbT3xzJ2/gnup27IRh
	5ps5XFndfgSJWBgNJjDVoyt+KQy5KhrbY/mHF6zt5l3picxDzqzYgvi17rksJMBTpQ==
X-Received: by 2002:a05:701b:4282:20b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b25d30af49mr2369009c88.15.1793956486772;
        Fri, 06 Nov 2026 01:14:46 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm4200968c88.7.2026.11.06.01.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:14:46 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] ntfs: open the index allocation before reading or writing an index block
Date: Fri,  6 Nov 2026 14:44:19 +0530
Message-ID: <20261106091420.2461683-3-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106091420.2461683-1-wahidzk0091@gmail.com>
References: <20261106091420.2461683-1-wahidzk0091@gmail.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_ib_write() and ntfs_ib_read() use icx->ia_ni without checking it.
ntfs_ir_reparent() only opens the index allocation through
ntfs_ia_add() when the root is a small index. For a root that is already
marked as a large index it calls ntfs_ib_write() directly.

The lookup does not open the index allocation either when it ends in the
root. If the last entry of the root has no child node, ia_ni is still
NULL when the root has to be moved into an index block, and the write
dereferences it:

  Oops: general protection fault, KASAN: null-ptr-deref in range
        [0x0000000000000128-0x000000000000012f]
  RIP: 0010:ntfs_inode_attr_pwrite+0x52/0x1600
   ntfs_ir_make_space
   ntfs_ie_add
   ntfs_index_add_filename
   __ntfs_link
   ntfs_link
   vfs_link

A single byte of an image from mkntfs is enough. In a directory that has
one empty index block, clear INDEX_ENTRY_NODE (flags 3 -> 2) of the last
entry of the $INDEX_ROOT and link() a file into the directory.

commit 9365c4a1357e ("ntfs: fix NULL dereference on index allocation
open failure") covers the case where ntfs_ia_open() fails in the lookup.
Here it was never tried. Open the index allocation on demand in both
helpers and fail with -EIO if that does not work.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs/index.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 66411a712..f808c887f 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -97,12 +97,25 @@ static s64 ntfs_ib_pos_to_vcn(struct ntfs_index_context *icx, s64 pos)
 	return pos >> icx->vcn_size_bits;
 }
 
+/* Open the index allocation inode if no earlier step of the operation did. */
+static int ntfs_icx_ia_ensure(struct ntfs_index_context *icx)
+{
+	if (icx->ia_ni)
+		return 0;
+	icx->ia_ni = ntfs_ia_open(icx, icx->idx_ni);
+	return icx->ia_ni ? 0 : -EIO;
+}
+
 static int ntfs_ib_write(struct ntfs_index_context *icx, struct index_block *ib)
 {
 	s64 ret, vcn = le64_to_cpu(ib->index_block_vcn);
 
 	ntfs_debug("vcn: %lld\n", vcn);
 
+	ret = ntfs_icx_ia_ensure(icx);
+	if (ret)
+		return ret;
+
 	ret = pre_write_mst_fixup((struct ntfs_record *)ib, icx->block_size);
 	if (ret)
 		return -EIO;
@@ -768,6 +781,10 @@ static int ntfs_ib_read(struct ntfs_index_context *icx, s64 vcn, struct index_bl
 
 	ntfs_debug("vcn: %lld\n", vcn);
 
+	ret = ntfs_icx_ia_ensure(icx);
+	if (ret)
+		return ret;
+
 	pos = ntfs_ib_vcn_to_pos(icx, vcn);
 
 	ret = ntfs_inode_attr_pread(VFS_I(icx->ia_ni), pos, icx->block_size, (u8 *)dst);
-- 
2.53.0

