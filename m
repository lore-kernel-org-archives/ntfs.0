Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424566;
	b=eORcRFtFjVhWZm+BBMYVu7ldiOUkRTpb27tmSYkq/uZz4PLZGF4R3E01i74f6kybHNZ2
	 spDekPABXNaz+1uT/aokkngiSz+FG+XjOvEYKugEeavHWh5wC9IscDSPLGxhubz2Ij7Pj
	 ffQ0jHku50OufQs0LrJQz3yqVLAsaCHHorUmU1ofABR3GrWjWP9XCuSuIO/0QmBEDIH5V
	 jZKv8hf6pTMynBQPXNaBcs7Qc7DYTbhmgmnRnzhZRvnbQ7nNkMRxjZt5UC6VZS864zbUv
	 HglWmM4h/27OzmVIVkEcdJDYowH/cMGKY2n6emTtlnRKJH9YAKbFaXEBPBQ5c87PtIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424566;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=I7frXlGnMCDV3UFrGk5yfnthPFUH9+/nnSFzMhXI7Yo=;
	b=OaSsFTOqKVdkkTyuBZrVmZ1IaxKH78VeRoaiLiL5j8oqALLPPjbrwxdrydiEWxu1dssR
	 dYN62Q6Epuih/qUGep5zwDsYzlkeWpNTALgn9oSlpZEyyDtewWA7I2l8zSXIY/Zs1tIHD
	 5ZrHJlX6269DuwvVTfb4zrWEWjkxU8BAGeKM5ROq96w3XGVLzZJGpkxoX292FknFBCUAU
	 FKNRyT+hH6p0mSfmy7LHni86qa9ktsyWoJMwVksTHABHwFs7SQ2OK2bSzxWFY/lCcMfvr
	 Erfi/f/DYfDVjvHt76qarw+ik4hGY88rjVy8PFif7SITLsOKpJN2uNoGNjfFsM+rUGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kL0XuHHV;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DC9606A31A
	for <ntfs@lists.linux.dev>; Sat, 31 Oct 2026 05:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11DC9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kL0XuHHV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=I7
	frXlGnMCDV3UFrGk5yfnthPFUH9+/nnSFzMhXI7Yo=; b=kL0XuHHVL2R2IwA03t
	JyiZw8KeBrt7+wfuMXXWeQXUe5fTx3dSES5e8X97QoG8FQO5a9g64SYlUmaFg+Ja
	HjTT71F1MNCv0QroF3XvmxAAL7aIoJgFolAI1ez5JVK4F9rAw0ijnZNOpj/HaUeB
	2F3KEz/TW82eJJbnNUsFKXQNY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDX37adfOVqFDprDA--.9490S5;
	Sat, 31 Oct 2026 13:29:05 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 3/5] ntfs: initialize packed EA size when creating hard links
Date: Sat, 31 Oct 2026 13:28:55 +0800
Message-ID: <20261031052857.1542936-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261031052857.1542936-1-liubaolin12138@163.com>
References: <20261031052857.1542936-1-liubaolin12138@163.com>
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
X-CM-TRANSID:QCgvCgDX37adfOVqFDprDA--.9490S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4xtF1DAFyrKF1xWF18AFb_yoW8AF43pF
	Z3Gryfta17Xry2kF9Iyr42vF1Sq3yxCF4UGr4xKr12y3ZYg3Z0ga48Kry5Zrn3Aay8u34Y
	qF45t3y7WryUu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlCJQUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gJbJmrlfKJp8QAA3c

From: Xuewen Wang <wangxuewen@kylinos.cn>

A new hard link has a zero packed EA size in its FILE_NAME even when
the source file already has extended attributes.

For files with EAs and no reparse point, read EA_INFORMATION and check
its attribute length before adding the name. Copy its ea_length into
the new FILE_NAME's packed_ea_size. Skip this assignment for reparse
points, where the same storage holds the reparse-point tag.

Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested the standalone five-patch series in QEMU. Prepared EAs remained
readable after publishing the temporary file and after cache eviction,
remount and reboot.

No functional change from v1.

 fs/ntfs/namei.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index a83a648c8ff8..5124e7a3e124 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1318,6 +1318,24 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	fn->last_access_time = utc2ntfs(inode_get_atime(vi));
 	memcpy(fn->file_name, name, name_len * sizeof(__le16));
 
+	if (NInoHasEA(ni) && !(ni->flags & FILE_ATTR_REPARSE_POINT)) {
+		struct ea_information *info;
+		s64 size;
+
+		info = ntfs_attr_readall(ni, AT_EA_INFORMATION, AT_UNNAMED, 0, &size);
+		if (IS_ERR(info)) {
+			err = PTR_ERR(info);
+			goto err_out;
+		}
+		if (size != sizeof(*info))
+			err = -EUCLEAN;
+		else
+			fn->type.ea.packed_ea_size = info->ea_length;
+		kvfree(info);
+		if (err)
+			goto err_out;
+	}
+
 	/* Add FILE_NAME attribute to index. */
 	err = ntfs_index_add_filename(dir_ni, fn, MK_MREF(ni->mft_no,
 					le16_to_cpu(ni_mrec->sequence_number)));

