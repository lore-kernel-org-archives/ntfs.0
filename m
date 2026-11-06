Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969171;
	b=Dc5aJJE0eLaZ927TcphuhYWoP485WaePLYHiAmNAo621JbHSpNELEGrsKE1dbCxiY9JT
	 F5VcsARHZJxOvAv0kzAhv52Buiy8yGaB5akTu5XEGfjNptRInKoG4EDt1pYN7gTuJ0rmy
	 xxoKGb3FR1cFEapQLUwbiH6OlkDi+N1Bvg1CtoeevUwGGKrKei5hePPq+Kbc+V9F3aGVX
	 8Iisin4jbSkWvTYmZrit10F6pTrxlbOWS5B5TIvmZeH7zV7btoHfLXHg3iHRkhPAlsTJf
	 dKc5csv+GdgfcAaYkrnaRXQI0wUqeA6vdNEfxZfLHZ3NemRWIJkf0YFBNCvG+W4d3cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JNftfiQYVNrVOWb9CroEjxPZDzjxD7afgRSnyOU7AVE=;
	b=y1evwA7U/Vj2vYnD83/rv6s7lbMNMY+CRTWDmnpzJQmIOPrelozlAC6qncgvrlsrtI8l
	 VQMjSUV8naXvSYyqaKHn+AhOSVqt/KnbwQeV2BfD6uA6T93apUQBAbQK6evWoZPKk0qSL
	 5luM3cSXDvFuKgimNLZltSY0CGAq/yTSD4Y6EVPoJ/j3bZbgJdp+5b23TRMOMBPS/3k2M
	 vTqHhaRl3v6uzhs36ofsuXsoAOfWzY+5cvbPCjR8DAQ85WmilYRte4isji8s0gzaSJdLh
	 WC/yjUavDuOe2I42E40Z4iTSqJT5TMUE5jL+ID0BNrt7lStYQNyM+hIsN4SYj5fQQXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLBFxpsl;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04789606A338
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 12:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04789606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLBFxpsl
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37000e7234bso1207249eec.1
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 04:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969170; x=1794573970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNftfiQYVNrVOWb9CroEjxPZDzjxD7afgRSnyOU7AVE=;
        b=BLBFxpsl7UX4S5IbOSgUi1stkVX+8/x/JkK7p2Jy81OJpa5VvHh/fmJGDD2ouW+9Ha
         IPU4BKbx8SjdmCra3TRTYnA4G6FYntyo3+fvks99wWE/qjJmjjONZf+gYEvDfiDto8a6
         Js9iv0PmJ6Q6ipmNEVUdN2eXFCFRL0q3orA4j1o8wlklZEXkW/wyd6SfVaFTDCEs/ncB
         Em5xyzU0jpug7bR6I4f4ze3jnzS6BNghZGvfumXYmiW7QKXY+MD0kHtxAW0CO7Kc+955
         VlvEE1XDZ+8Dg8+816tUIGi6l6xXskwJLWy7GCooierrhvhpr/kEtEfe3J1k+M10ZwzJ
         pv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969170; x=1794573970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNftfiQYVNrVOWb9CroEjxPZDzjxD7afgRSnyOU7AVE=;
        b=Kt3hrdSgJJU4fULF2YUYHdguRwLcD7Cez1ZB/F3XLzLD/YlzIAjbUrWfRYO5Ud4Jhl
         3WVvc55Xr2l3V5F2KfZQXO7CN7pHk9o4V4nbC7FZnLQkgLuP5RXS8mvImTOZdbI1ZSyP
         n/rDqDxk5msq2jgJqekVVooUxWjde7FNSqBiMyAmK+BU8syIluU/8aRHfuifrPTWCN+a
         Dn3JgtSVrn37k2bL9cEXWsrCba3gXKxlgkwNOtyOhcULmR3u5/icMjjjSdAevTO84UM3
         QvdzQEbl4a3wFwx9Wv5EkH9a0wJfYGZCkrtRYF6VzN20RCH0tkOWOxJWd24x2AX4ZGnX
         0KvA==
X-Gm-Message-State: APuU4Z+7LQCW9WC2qRVSwCzuYgJtJCLGtZnuN5xUSw9mEN3fgzGxVhnH
	T+FW0GUVlM2K8zbtd6+rMSgBMhcNyWAZ1Ru/73jYGwtajTNAqi/ZS6RU
X-Gm-Gg: AYBFou3B2XEiSH7QLqHbX3YfmB2Nvzi4x5Fv2Y9LX6RP4z3hFlNdT2UOTyRYHVVqYQd
	DmPOTgSsxBY4WVptXG8OHrCVU71BgEDP0ulAf4ODJJkPB6QnvCLZ1A51f24nS+MkJj7u3e4+AzQ
	Dl9/Q59AbbHLyZfBZ2h2BbxFz1Qf7VuZuKWMJfAFYAKuGUBNaeKr0Da2FlR8MfcNVFb9u0cjO00
	9KandYOuIiAnJ8PmyKdWerjCLjm/5gp2kAdI05IADV0J6SpzidokcPeIJRrNT29oYW8Bj2ii6i+
	KEVOvy9j8XNGTcH38QGN4s3WA60/QcJnO9aWGTBhzcJKwF7Klt1SKB6TjsysCDrrs2jXwz47kpj
	DaSqxV8lyMiTk/6mN9Efg5T1/cQFfvaQWOlZb0D9WsIL64SwQHnNuacsS9QRPqYbB7DkgnCCCGT
	tUOR5MSS2PMb9MrvyWK8um+hvM13Wis6ZLj7uDKlLirjcUwpeeF8xWwRkPevOyAGjqqnibm400J
	EOaTuiIpx3P0NnbPBAohkrfggNmwAGzKHeWJiG64bdRQOao4Li8xS22fXxFxc0Chid71SbEZQUY
	HucMxI5UxBDkN/olEX0txD7HVSI4mwuHhlvawaFeVBa+v5fVqvjrFCpr6xpIXZ17+A==
X-Received: by 2002:a05:7300:10c:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36f771025d2mr3480312eec.36.1793969169592;
        Fri, 06 Nov 2026 04:46:09 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm6802331eec.1.2026.11.06.04.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:46:09 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] ntfs: open the index allocation before reading or writing an index block
Date: Fri,  6 Nov 2026 18:15:52 +0530
Message-ID: <20261106124553.2617026-3-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106124553.2617026-1-wahidzk0091@gmail.com>
References: <20261106124553.2617026-1-wahidzk0091@gmail.com>
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

Commit 9365c4a1357e ("ntfs: fix NULL dereference on index allocation open failure")
covers the case where ntfs_ia_open() fails in the lookup. Here it was
never tried. Open the index allocation on demand in both
helpers and fail with -EIO if that does not work.

ntfs_ia_open() also succeeds for a directory that has no
$INDEX_ALLOCATION attribute. The inode it returns is then an empty resident
stub that does not describe an index allocation, so reject that case too.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs/index.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 322cb371d..74716f916 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -99,12 +99,30 @@ static s64 ntfs_ib_pos_to_vcn(struct ntfs_index_context *icx, s64 pos)
 	return pos >> icx->vcn_size_bits;
 }
 
+/* Open the index allocation inode if no earlier step of the operation did. */
+static int ntfs_icx_ia_ensure(struct ntfs_index_context *icx)
+{
+	if (!icx->ia_ni) {
+		icx->ia_ni = ntfs_ia_open(icx, icx->idx_ni);
+		if (!icx->ia_ni)
+			return -EIO;
+	}
+	/* Without $INDEX_ALLOCATION the index inode is an empty resident stub. */
+	if (!NInoNonResident(icx->ia_ni))
+		return -EIO;
+	return 0;
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
@@ -805,6 +823,10 @@ static int ntfs_ib_read(struct ntfs_index_context *icx, s64 vcn, struct index_bl
 
 	ntfs_debug("vcn: %lld\n", vcn);
 
+	ret = ntfs_icx_ia_ensure(icx);
+	if (ret)
+		return ret;
+
 	pos = ntfs_ib_vcn_to_pos(icx, vcn);
 
 	ret = ntfs_inode_attr_pread(VFS_I(icx->ia_ni), pos, icx->block_size, (u8 *)dst);
-- 
2.53.0

