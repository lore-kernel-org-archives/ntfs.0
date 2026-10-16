Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB5A5349AB
	for <ntfs@lists.linux.dev>; Fri, 16 Oct 2026 17:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170876; cv=none; b=HQBmUQYft2yk9sPnG9cG8v8pfkzrbf6OaPiD26JY8x409wBfmo5xbvspbp3raOxsfm5/aENaRHhLQbPCBFMsQfZDSc6YcY+DEPCw7L28hbp4ArhkeD/RadC/e16SIHviFPSdN8G6n17xWSe6OGPu+HW0tXq4zBc9lf57qTG2fEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170876; c=relaxed/simple;
	bh=cEsn7PiRkdTCtLlbsl5WTDSTgA0Z4HMti55KlfEvrK8=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:MIME-Version; b=AbO8evAzoqlHUhni8C+9/asYY70Qk/Sc2So1yjOTOJjrkOOaqUrbT0VS8AThrDf20NfAkMvoVPRqORwMtRiUedQL2+Aqyk953ZnbunAdrLEXSfOcAtRcPbik+dkOAB212Ss56e6RIji0bg170p9ZNYUd9qC3qTma3DJfQIojiO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=w72585Jf; arc=none smtp.client-ip=203.205.221.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="w72585Jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792170865; bh=7VYyJStnxiI0OG+kDQ0wre9AeU4MsoiOpilLVte4Uxg=;
	h=From:To:Cc:Subject;
	b=w72585JfJL+mVHBVkQmk6JhhYH/9R/zVtWA3k3KIKdw3WcW+7ZPXVY0jPtL0nm4WV
	 2wqiyaHfqDwae4QAWub3xib6O5NjZ+Ukd4sMnRE4y8TMrDEZBHsRKIVKly1Wf4dU4i
	 3UFfVxJIrpxiW+oMfvRStWyJ33Ma/DcoPPxmFscs=
Received: from [127.0.0.1] ([2409:8d5c:c30:3b3:3535:7b1a:7bbe:6767])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 39713CFD; Sat, 17 Oct 2026 01:14:23 +0800
X-QQ-mid: xmsmtpt1792170863t99q9e5zw
Message-ID: <tencent_B4CAA82E44ED5B89EB9ED691CABE58D3BF09@qq.com>
X-QQ-XMAILINFO: OPIY/Y5G02yjnljCGNGJ4UL7vVtvt2rsPv7YT43+2VRnvyM/478k5uAF0agJgd
	 Y93a2Tmu2ZyiAzl07hLk7K+rtYh6iUaFY1RviGRm73iF8WTzR12Oyt1X3b5uNzf97miFP1+2zWmv
	 WLA1BuLothvEeCXYNRpwIol3S+jvBB0o48uGWndJiWb719BcwdnDbn78sAh92obbWkdcvS7BzGXG
	 FoAW7lHaMGlqjTJ8WM8nKJ94vkwPa5XyGc7+7omYdIXUqyxPCPZ37G9rYewhD9Kno8FLCzJ7If+z
	 oHX7JoCJd8xJCuh4u7D/xBa+wKGfzdFWKouz/HE0IZ6wp/VblGNDPCHN4qfILqi9NBbuNfiz/oq6
	 DjG1b2Y/KVv2BG63jVt2hlOtgievyuwPuZYp6jWVP8CznGyVYxWfDJVtpl1Nr3ifpGdjXSR5Smjx
	 z8DcaIG71JtqXwjgWSs3ITZ1yY8RwwnbVU9pazviNwOpcRe6pe0QA8mq9C80z5wohlhwihmm4v4b
	 SspKpTLaiNH+3938ryIweYX7+7cnVzOcDy8g+oGY/mAPLTVp9OoTtHTDFaGW7jyqrdy7g99RElnm
	 onM+hCt+xNySVFU2AjvQ5QZQuxAAG81ub3IPam7/mBtV22xcLFfZXw5MGjHieDI1hlxU7vZryA68
	 TgmrckYocBJdw4bfX45u5KL5IAwcqrCIDXZYHupAAGqd2+ALNphVFiPneVMym14hec/lv9F2rt1/
	 LQMbqxxXgleVCpL5FG7s4WtuavXx5QT9xNRllWXzJEsZFjMHjevlymekz524yBtPyxXD4Jrj1IQU
	 adAl6TjeMmsIogN0JZ393qHtPUUzw9mVrd3yJFAoPmW6+a8mDd948Yp1PVlL4ApdZo1h16KMwyPq
	 ZDBdB2u+Tj4zPMSaYhOwu0G03KAwuxk//JfZjydzZdqvLVxp7Fj79hR1VCzo+biLtggSQ6/AQQA/
	 e4obykogQ9hiwDiISOsdMU2Cz93X9SguWxPK7BW+tW90QuJsHd4rvhQN2S6sJsTizGn5/9HZGNs9
	 fcezX7hw0QO+NmYs9U++INcsANUzEV5zCs74GiskiVPEOtDKM6ZRBS1NLmT/3x4hXY07MfdLk8Ix
	 pZsEfeU7mgl92LijMObKO8NfvXbA==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Hang Nan <2122295973@qq.com>
To: linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev
Subject: [PATCH] ntfs: check index block capacity in ntfs_ib_copy_tail()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Precedence: bulk
X-Mailer: git send-email style plain-text report

fs/ntfs: fix 8-byte heap overflow in ntfs_ib_copy_tail()

This report was produced with the help of AI tooling, so per
Documentation/process/security-bugs.rst I am reporting it publicly.  It is a
plain bug and not a security bug under the project's own threat model (item 3).

1. Affected version
   v7.3-rc7 (and v7.2).  File: fs/ntfs/index.c:1218 (ntfs_ib_copy_tail()).
   The file is byte-identical in mainline
   0fcb05b72344f40806cbe810de8872f1698bf053 (2026-10-14), so this is not fixed
   upstream.

2. The problem
   ntfs_ib_copy_tail() copies the tail of a source index block into a
   destination index block without checking that it still fits:

       index.c:1216   memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size)

   tail_size comes entirely from the on-disk fields of the source block, while
   the destination is whatever ntfs_ib_alloc() allocated.  Worst case for
   ib_size == 4096:

       tail_size    = (24 + 4072) - (24 + 16) - 16 = 4040
       dst capacity = 4096 - 24 - 40               = 4032        => 8 bytes over

   The sibling helper ntfs_ir_to_ib() already got this check in the v7.2..v7.3
   window (index.c:1163-1169); ntfs_ib_copy_tail() was not updated, so one of
   the two copy sites is still unchecked.  Path:
   ntfs_index_add_filename() -> ntfs_ie_add() -> ntfs_ib_split() ->
   ntfs_ib_copy_tail() -> memcpy().

3. Triggering conditions and classification
   - image crafted so that index blocks report entries_offset == 16,
     index_length == allocated_size == 4072 with a single INDEX_ENTRY_END, and
     usa_count == 1 (which also switches off the MST fixup);
   - the image has to be mounted => CAP_SYS_ADMIN (or a loop mount).  Per
     Documentation/process/threat-model.rst:219-223, "bugs triggered by
     mounting a corrupted or maliciously crafted file system image" are not
     considered vulnerabilities ("mounting a block device is a privileged
     operation") - so I am reporting this as an ordinary bug, not as a
     vulnerability;
   - observed on v7.3-rc7 with slub_debug=zf:

       [Right Redzone overwritten] 0xffff8937c24e5000-0xffff8937c24e5007
       @offset=20480. First byte 0x50 instead of 0xcc
       BUG kmalloc-4k (Not tainted): Object corrupt
       Call Trace:
        check_bytes_and_report+0x11e/0x140
        free_to_partial_list
        ntfs_ib_split+0x120/0x540
        ntfs_ie_add+0xcd/0x200
        ntfs_index_add_filename+0xca/0x120
        __ntfs_create+0xa68/0xd60
        ...
        __x64_sys_openat

     The 8 bytes written past the block are attacker-controlled image data (the
     log shows the marker bytes planted in the image).  A KASAN kernel reports
     the same window: "slab-out-of-bounds in ntfs_ib_split", "Write of size 4040
     at <object+64>" on a kmalloc-4k object - also 8 bytes past the end.

4. Reproducer
   Available on request: a script that turns a mkntfs-created volume into the
   crafted image (plus the initramfs that mounts it and creates the file), and
   the console logs.

5. Proposed fix
   Add the same capacity check ntfs_ir_to_ib() already uses, and return -EIO,
   which ntfs_ib_split() already propagates.  Tested on v7.3-rc7: with the
   patch applied there is no redzone report at all and the create fails early
   with

       ntfs: ntfs_ib_copy_tail(): Entries (4040 B) exceed IB capacity


--- git format-patch output ---
(format-patch 信封的 From/Date 行已删去；下方即为补丁正文：提交信息 + diff)
Subject: [PATCH] ntfs: check index block capacity in ntfs_ib_copy_tail()

ntfs_ib_copy_tail() moves every index entry after the median entry from the
source index block into a newly allocated one:

	ie_head = ntfs_ie_get_next(median);
	ies_end = (u8 *)ntfs_ie_get_end(&src->index);
	tail_size = ies_end - (u8 *)ie_head;
	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);

tail_size is computed from the source block alone and is never checked
against the capacity of the destination, so a source index block whose
entries do not fit the destination's allocated_size - entries_offset area
writes past the end of the destination block:

  BUG: KASAN: slab-out-of-bounds in ntfs_ib_split+0x481/0x1a60
  Write of size 4040 at addr ffff88800358c040 by task creat/...
  Allocated by task ...: ntfs_ib_alloc+0x29
  The buggy address belongs to the object at ffff88800358c000
  which belongs to the cache kmalloc-4k of size 4096

The destination is allocated by ntfs_ib_alloc() with the source block size,
and the sibling conversion path already performs exactly this check before
copying entries, in ntfs_ir_to_ib() - added by dc09bf79b76f ("ntfs: Fix
index_root heap OOB write in ntfs_ir_to_ib()"), i.e. the same overflow in
the same file, fixed in July 2026:

	ib_cap = le32_to_cpu(ib->index.allocated_size) -
			le32_to_cpu(ib->index.entries_offset);
	if ((u32)i > ib_cap) { ... }

Add the same check here and fail the split with -EIO.  ntfs_ib_split()
already unwinds correctly when this function returns an error: it clears
the newly allocated VCN with ntfs_ibm_clear() and jumps to its error path.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Hang Nan <2122295973@qq.com>
---
 fs/ntfs/index.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 580998990..b9d0544f3 100644
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
+		ntfs_error(NULL, "Entries (%d B) exceed IB capacity",
+			   tail_size);
+		kvfree(dst);
+		return -EIO;
+	}
+
 	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
 
 	dst->index.index_length = cpu_to_le32(tail_size +
-- 
2.47.3

