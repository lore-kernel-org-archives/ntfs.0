Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486444;
	b=Wemewf69VOiIN8t9QC38XH4cJlVH1FsJjpnxtHI7A+4TbuqR1uxTS0KSfx5ZnA6ZNm0A
	 0kdv358DvPcXHHvn0oFMvjBTAaMJHNUrsUmgqDp3G7HgseuG2FVAVyWLDxdIbscRkQbtD
	 xSi/dHUt+0oxJEBInI022yCrG7uaghLPUR/ME3oXOjW5kxMcTq4B67q82mN5+KkUcjpj1
	 uEw8GyOHvWf9Rwi6dEznlCGCbOxhi7yIefwZSnpGhbILwFiX3GyJsfN59CQ4f7RX7BzZI
	 tRJDQwdN7ZfL5JAjVHeea8IJUebYIa4LkqddUBDk1w1HuZp54lJJPp4A1Fef7/yZE7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486444;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=BqDM/aH6+PKiAi7jEJt3/yD3uXSrwjK730i4iqYn9fY=;
	b=RNxW5ud8qmFdPH/S/krS3zg2FExX5iiuJKpSYfInUegJO6zEz+SqA2CuenbwK1oByjPO
	 k4+OrBkFLNTwYhDgLxomK4hIMh1VSe3GrFvHUx//JEyuh/3j+KHgEOuQlQPYmUKOqREO0
	 +u3CgrAAAnqyI8v60GPel6ntunvNBYoyKUjgq/Bjn/ll0C8B30lsV0aW1hCiPoW9R11DE
	 pcEYz+CtBBndpCADWT743jYMEpKjQ4zzYyEy32pkbUVYuHd6bt8rzYFdeDJWbTXQTrysa
	 5MUsp1s/JLXJRxfxa/P2S0+oUZKanYpwnH/0m5iZUj+r0YuC2BhMRNL3XwPpKIKxtyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=wAeEhwIW;
	arc=none smtp.remote-ip=203.205.221.202
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E58606A319
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E58606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=wAeEhwIW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792486440; bh=BqDM/aH6+PKiAi7jEJt3/yD3uXSrwjK730i4iqYn9fY=;
	h=From:To:Cc:Subject:Date;
	b=wAeEhwIW7HhWuL5Zw/D1IepvaKYJwbY7Jo536z/ENpwE2ZJcd6hcqpWn6bRPAMP+s
	 esVlr/3h49UlxKIJSqWUPu7cx5f5u9Ns4pgJsGmR9113Fi5Hh/HQW01hCAe6T+vRqN
	 UDIzxnthAe7N55kwM/J6T4ytNYDAOD3iSDBHeKSY=
Received: from smtp.qq.com ([2409:8d5c:c30:3b3:c448:ac0b:9c62:2589])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id D7A3CA1F; Tue, 20 Oct 2026 16:53:58 +0800
X-QQ-mid: xmsmtpt1792486438tbphg8ju9
Message-ID: <tencent_162F22EDEB882D9E2691DEBF38D243CA4A09@qq.com>
X-QQ-XMAILINFO: MIAHdi1iQo+zGwWI3tSDXmZ6BKZx5MfQJHkwZmUaUuP5Ax4nSJ3GnhBdyCcEVw
	 vKvgplX0202A/PZvB8ii9Ujw0ikbTedqPZ6Vz6G9KOIxwUpKukFco1/FXsUDDmaKaC45U5RoUIM0
	 Qs8Vf8820054r5GSmx5C4zdc0XPBkw1890dqXbCKZUTs9dS8tdqf9bW+aBSjkHTlTnBjY1cIplv3
	 rZ2lVq3n9HGdEpdsIGIDKPNSmfXuEhgGA/NCq0Vi3/eH+ZVIhl4UGD3I9jZXRU/UmlyggE3Tf+vQ
	 QsTUwQXWtzPTME+xsPJmBmU9dhadaOrSRcpcg6X3Fvc6nVQqY2BTBe3HSDNhiH6iJrwr1sxL0lTl
	 4jBHVZEjrvWJMR1lytzwyopxrHy9XLE5E4b2VqAnXUxJGq2pUeQA++ODbWBWjl8qfSnCT0Oehx1A
	 BjlGKMEg13MAPnTlMArenCPo9ej5CmBr1tLlv+9+gyqj7PxCVTPjj86GTbpr+uQveLLf7cb0QHJs
	 Aum/fwAi0fv6JYi7ik9kRwMqV9edXF+gupILwePE+73puZb8PYNbdxnUO8SvCNYD592xNLkhqND4
	 9551nsct3eAzJ0WKsEvHokENPH1dgMRmreNSpxVsrI3YIMVeO9OpaeaIgwTIu9ME1cd7aGqGiMz9
	 vp9rFvTtc6Ki96I59mZ5KScL0vXPFmpeGF2AP16gkJGzyRktE2hoNJL4GdeMzaQ1bjNK4xso/UJO
	 0t7QyZLaViAp0Ze5gHpZ2NTDHAbl2sCRqpJ/+WN/aWYzwmtp04B5nCjv7iTfDWPQ1OF8ZkkxD/of
	 IBItpdqaYVlANu7/JhxYwpQ8rmRtcHSxu6qrYDOqq8w2mlfiEZhRTf4yiAu8GQsVBCzPOiLQdypL
	 l4uuWuPVoo1d0ldguQghGUJiV835S10aovNgF5wPHMzmX/1cboTVNxJede0EiERN/fjJl6naG1ss
	 osOBy38+LjKDixYr+OjVxowL26Ww/N4NkQNC5ZwTagZlYyyM2YM9Gpxk4UI5+a2Wy7cs16k8HXTl
	 5rY1ZdAR5RXxaRqeWzSUDJ0K1TupQK8GM6Rc4ZTOS/cmVRYtEBygW/QsIGvI8MNFVhvZipnM6F6T
	 CoJIveU3BKbri6v68=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Hang Nan <2122295973@qq.com>
To: linkinjeon@kernel.org, Hyunchul Lee <hyc.lee@gmail.com>,
 liubaolin12138@163.com
Cc: ntfs@lists.linux.dev, security@kernel.org
Subject: [PATCH v5] ntfs: reject index blocks with a too small entries offset
Date: Tue, 20 Oct 2026 16:53:53 +0800
X-OQ-MSGID: <179248643354.3676.4927804810897931377.20261020patchv5@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0


Index blocks read from the volume are checked for a plausible header, but
nothing keeps a block from placing its entries closer to the header than
ntfs_ib_alloc() does when it creates one.  The allocation adds the update
sequence array, one entry per 512-byte sector plus the terminator, to the
index header and aligns the result to 8 bytes, so the first entry of a
4096-byte block starts at offset 40, while a corrupt block may declare 16.

ntfs_ib_copy_tail() then copies the entries that follow the median entry
from the source block into a freshly allocated destination.  The tail is
sized as index_length minus entries_offset and the median entry, both from
the source, while the destination only has allocated_size minus the
canonical offset of room.  With the values above the tail is 4040 bytes
and the destination holds 4032, so the last 8 bytes are written past the
end of the new allocation, with contents taken from the mounted image.

Reject such a block when it is read: entries_offset must not be smaller
than the canonical offset for the block size.  Derive it from block_size
rather than from the block's own usa_count, which post_read_mst_fixup()
treats as "not protected" when it does not match the block size, and use
the same helper in ntfs_ib_alloc() so both stay in sync.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Hang Nan <2122295973@qq.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
---
v5:
 - drop the comment on ntfs_ib_canonical_entries_offset(), the helper name
   and the commit message are enough (Hyunchul).
 - regenerated and checked with git am on a clean tree; sent
   quoted-printable so the indentation cannot be mangled on the way.

v4:
 - validate the entries offset when the block is read, as suggested by
   Hyunchul, instead of checking the destination capacity before the copy.

Testing: with slub_debug=3Dzf and an image whose 4096-byte index block
declares entries_offset 16, the split now fails when that block is read
(ntfs_index_block_inconsistent(): entries offset 16 is below the minimum
for a 4096-byte block), creat() returns -EIO and no redzone report
appears.  An unmodified image of the same volume still mounts and accepts
new files.
---
 fs/ntfs/index.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 580998990..b94a5b704 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -489,6 +489,14 @@ static struct index_entry *ntfs_ie_dup_novcn(struct inde=
x_entry *ie)
 	return dup;
 }
=20
+/* Offset of the first entry in an index block created by ntfs_ib_alloc(). */
+static u32 ntfs_ib_canonical_entries_offset(u32 block_size)
+{
+	u32 usa_count =3D block_size / NTFS_BLOCK_SIZE + 1;
+
+	return (sizeof(struct index_header) + usa_count * 2 + 7) & ~7;
+}
+
 /*
  * Check the consistency of an index block
  *
@@ -548,6 +556,16 @@ int ntfs_index_block_inconsistent(struct ntfs_volume *vo=
l,
 					   offsetof(struct index_block, index),
 					   inum))
 		return -EIO;
+
+	if (le32_to_cpu(ib->index.entries_offset) <
+	    ntfs_ib_canonical_entries_offset(block_size)) {
+		ntfs_error(sb,
+			   "Index block: entries offset %u is below the minimum for a %u-byte blo=
ck: vcn %lld inode %llu\n",
+			   le32_to_cpu(ib->index.entries_offset), block_size,
+			   vcn, inum);
+		return -EIO;
+	}
+
 	if (ntfs_index_entries_inconsistent(vol, &ib->index, cr, inum))
 		return -EIO;
 	return 0;
@@ -957,8 +975,8 @@ static struct index_block *ntfs_ib_alloc(s64 ib_vcn, u32 =
ib_size,
 	*(__le16 *)((char *)ib + le16_to_cpu(ib->usa_ofs)) =3D cpu_to_le16(1);
 	ib->lsn =3D 0;
 	ib->index_block_vcn =3D cpu_to_le64(ib_vcn);
-	ib->index.entries_offset =3D cpu_to_le32((ih_size +
-				le16_to_cpu(ib->usa_count) * 2 + 7) & ~7);
+	ib->index.entries_offset =3D
+		cpu_to_le32(ntfs_ib_canonical_entries_offset(ib_size));
 	ib->index.index_length =3D 0;
 	ib->index.allocated_size =3D cpu_to_le32(ib_size -
 			(sizeof(struct index_block) - ih_size));
--=20
2.47.3

