Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8744781C
	for <ntfs@lists.linux.dev>; Sun, 18 Oct 2026 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324418; cv=none; b=cXUd2iZ8iryeAY8xk8R5OPXbIQHinCRIDljeL1eSMuiX9nlTOzbHUyNISOY17rT/TnnJn6v5ufgTp6nOfONF50M/p8unuI6hi/uoyl445HZ2wHsj3i07jccd5lJ8NNrzdQHHTX2rj+MAE+4t6H0ulDjliOhRBUNI32Fc3xsZ76Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324418; c=relaxed/simple;
	bh=veF+FB3hlNU7m1FrVaX0Caku6qFuukd4SwnRSpMKWS4=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:MIME-Version:Date; b=hZiJyH7U540Hp3H8v1cQoiKyhQXw8DBYYdpdmUgWDhenPKYHjCP8704vQzXPur2/UxqVNF667tNmTFOJJ4GcTve47BaMqVmN+z/eIG7O97WAq+G7udzIeRr7JXpZ7Fy9zxxCWCypfen75OzHbjRmPyTDJ1Z7Y4qAlNSM8CcdNxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=eGP4QTwS; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="eGP4QTwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792324402; bh=PDD/7w5eEy8ZKNa93p/SVE7jJc2dRpk6KYHBactuk8Q=;
	h=From:To:Cc:Subject:Date;
	b=eGP4QTwS8CCmmF0LY5qTyvaAcRVkOm3GaqiCSJYlwNtR+irc7KpEx4YDk2sVeqCwR
	 2JGOEX8qhZJcUn53Z5dn/SPcet4vTguOhbbz7pOaJ9MaO+Masx0dwP15TxHjybNpLt
	 fPdqHB3wWAdUeWkcpjjZCs8vyIPgr9R4kD2mm8YA=
Received: from [127.0.0.1] ([2409:8d5c:c30:3b3:3d39:a6e9:e5bc:61cf])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id D5383073; Sun, 18 Oct 2026 19:53:19 +0800
X-QQ-mid: xmsmtpt1792324399tquckumni
Message-ID: <tencent_BC3D6D20617FA5A6B394F15E98D98711C30A@qq.com>
X-QQ-XMAILINFO: N9yihP4xsM7RMAtFAAbXDAYY7KhUP+C+AU0Us4CxSC5HqEcYzWf/tZqCRlFwrq
	 nidJNUJeyRNAO5uuxPn0RhIk8rDIVx0zVUaNdmE73BrYEeEbkrtw/qjMvsCKyB6tE30O+3YbLR0N
	 OYJ08I1HTsjzXD1anUE46M0ihFzNlBslKfDr1eCxBnaJLdo+YIqeHRonmnsKSIlYRckdsR/TK2Te
	 0qadixd5HGf9YeDBTpbVQdDJOTImHP+VWsZu068tPBqSfHItW4ozv0gNgHt8h/FYVFipbrcXO/Vw
	 7deN/JtS+R9byKBCfklaySWCBHyfCmyxVK7fv74LjWi9fzLcUixZNZAgWOJ6v9wKvGexmvHmniMG
	 aEH0rycfu1kAhAlaXjIZcxw9VEkbzRQT8DLa6cigmyso8U0n3Dl6yPPa3XT3AuuswmPOh+avj/Tr
	 lFxJPqazt4/8hWm4HDCT73r7hvpy4qwxKnJLFiQAt6WDP4N+wAiDvWaEAWPweUh6yLHpf1mJmQSg
	 6C10Be+mXm9q1sH6wAIo3IAX1tpXw+pJXLbeRRYo+i5fbDZTtEyyCDWwgLb0BT6lJUC/0JJbr2U5
	 H2g0dJ0aNYzP/WEPkoOEX8LvuNvg6ntrBVl/22LdjV0KF9g6+Gr4re6dVWjgFO/MFKje72pnuRaB
	 WC5h3qNYdjOPQV+WnDJYYNu4hkEQ04dWntdJ6xQKZkTJp9RtxBxHJmnhD4tFJqYYHlUgS5xa4UvI
	 UrbNx1ZRoh56eKEeUquH0TNKyimDAxeWzojAoBSBQkVNIgd6DP+caDFqJy4BK5jOHkfL8RDvxvJ8
	 ukUOg4biJaNgz52znU5nkVyf3eK7KRievSc7aqdW2UBaDyg1f3SNhy5P8TLNV+bJ/uHjIGFaPz40
	 yYv/ONo5ChjoVaFnSM6OIPv1nW59uJxli8v6+cjzhsSIja9oLvHQeebKDPghZ6N6smBQYSB2AWHz
	 XKzGIO0RoTeymPsfF87Y/6VarHU18qFSfA7DTYQ/bOJ0i8fnlkvDz+HgKHom/VD5OrrFnWtq1gOi
	 xrxO4gA5LD6QfsB4kRTv+apPHpC0mRe11PItjcR3kz8uC5VGoRrltJ7+zpllycVuqOZGT7R2P5K4
	 ++67558I9t9OdqTaBDuFt1gAv+/PqCXVItDA57
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Hang Nan <2122295973@qq.com>
To: liubaolin12138@163.com, linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, security@kernel.org
Subject: Re: [PATCH] ntfs: check index block capacity in ntfs_ib_copy_tail()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Precedence: bulk
Date: Sun, 18 Oct 2026 11:53:19 +0000
X-OQ-MSGID: <ffbabf44bc9442b08f5e4fc65e3a59eb@qq.com>
X-Mailer: git send-email style plain-text report

Hi Baolin,

Agreed, and thanks for the careful read - the excerpt is gone.  v3 below: the
commit message is prose only now and explains the size mismatch in words, and
the code is unchanged since v2.

I re-ran both kernels just now with the same crafted image and slub_debug=zf
(v3 differs from v2 in the commit message only):

  before: [Right Redzone overwritten] 0xffff8d344216d000-0xffff8d344216d007
          @offset=20480. First byte 0x50 instead of 0xcc

  after:  ntfs: (device vda): ntfs_ib_copy_tail(): Entries (4040 B) exceed
          IB capacity
          creat -> -1, errno=5 (Input/output error)

The "(device vda)" prefix is what passing ->vol->sb buys us, so the mount's
errors= policy applies to this message too.

Full console logs of both runs, the image-crafting script and the initramfs
that mounts the image and creates the file are available on request.

--- 8< ---
Subject: [PATCH v3] ntfs: check index block capacity in ntfs_ib_copy_tail()

When an index block has to be split, ntfs_ib_copy_tail() moves every entry
that follows the median entry into a freshly allocated block.  The number
of bytes to move is taken from the source block's on-disk header alone: it
is the distance from the first entry after the median to the end of the
source block's entry area, so it trusts the entries_offset and index_length
values stored in that block.

The destination, however, is a new block whose entry area starts at its own
entries_offset and which must additionally keep room for the terminating
entry.  The two computations do not agree: when the entries of a source
block fill its entry area right up to the last reserved slot, the computed
tail is larger than the destination can hold - by 8 bytes for a 4096-byte
block - and the copy writes that many bytes past the end of the new
allocation, with values taken from the mounted image.

Reject such a split before the copy and fail it with -EIO, which
ntfs_ib_split() already propagates after freeing the newly allocated VCN.
The sibling conversion path, ntfs_ir_to_ib(), received the equivalent check
in dc09bf79b76f ("ntfs: Fix index_root heap OOB write in
ntfs_ir_to_ib()"); this copy site was missed.

Signed-off-by: Hang Nan <2122295973@qq.com>
---
v3:
 - drop the code excerpt from the commit message and describe the size
   mismatch in words, as requested in review.  No code change since v2.

v2:
 - pass icx->idx_ni->vol->sb to ntfs_error() so that the mount's errors=
   policy applies and the message is prefixed with "(device %s)".
---
 fs/ntfs/index.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 580998990..2c345e32d 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -1200,6 +1200,7 @@ static int ntfs_ib_copy_tail(struct ntfs_index_context *icx, struct index_block
 		struct index_entry *median, s64 new_vcn)
 {
 	u8 *ies_end;
+	u32 ib_cap;
 	struct index_entry *ie_head;		/* first entry after the median */
 	int tail_size, ret;
 	struct index_block *dst;
@@ -1215,6 +1216,17 @@ static int ntfs_ib_copy_tail(struct ntfs_index_context *icx, struct index_block
 
 	ies_end = (u8 *)ntfs_ie_get_end(&src->index);
 	tail_size = ies_end - (u8 *)ie_head;
+
+	/* Entries must fit in the allocated index block */
+	ib_cap = le32_to_cpu(dst->index.allocated_size) -
+			le32_to_cpu(dst->index.entries_offset);
+	if ((u32)tail_size > ib_cap) {
+		ntfs_error(icx->idx_ni->vol->sb,
+			   "Entries (%d B) exceed IB capacity", tail_size);
+		kvfree(dst);
+		return -EIO;
+	}
+
 	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
 
 	dst->index.index_length = cpu_to_le32(tail_size +
-- 
2.47.3

