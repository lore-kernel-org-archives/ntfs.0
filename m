Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605751;
	b=JMpe4DlDc4c6eoWZ7mvRJShDURQ6NxMG3o8cK6qkvUEx/jVdz7A8tiCXu2NP2dilBC4q
	 fjXEljyhHr1pSUxuaL0U5GlkjVw5YTa/g2wckvSiqbgLbqJ3en37ODh8Sp1+1zJW+Z4U0
	 0NmXsuRANJBpKcTmihQL3zWZLhKp58dgqKvLD8VM0NduLcFgelC3OHEQH5DVW/1yFYnXV
	 G816iaSpFSOadfLZD87qnpWKLAwhlRs3f4n61wojtVelWKuxUaS4cJWaWknQdh3FKaga5
	 R9f2P7hOXGUE/4j+85ty2G5P24k8acNGJYeR6FURKUZZqaftB+SjDDhna+FmXDYs+wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605751;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QEmXdMh7d6UQ5qSrIrm3i09BCxEkFdn5oz+HxR3awpY=;
	b=bV94i4KhMmeDu8owLTcSSlGyAu2MzsOL0j7qVLvjYS3Enxed8c1DxlufC2WNMQLNagsN
	 te/zSyEhplw5MLVoyo07GxITIZggTo74XOYXrSHNzaQCG+hvO733wwOMD/mVGf3AeGBxh
	 jLJvDVb/knWIpbB6KFQ2NPZvelBTaRQmDiWh9lJbYg05XmyKt+wD7wC1xzC01Yug6BcCq
	 n3auqf0OBOi00OyJ7QQ3nEREMvxFkwFpeE/XpE+zyHyEe6I9r4tQHjyAtenXq2FSU6ZkK
	 F+SUrqJE/dU5Sfi60Y2wV1dmC6K8BbyeouTZYuV6CBOKMZNkE0ys39cwo54BFzFUPzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHgYWm6H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47005606A6B5
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHgYWm6H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D381F0180F;
	Wed, 25 Nov 2026 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605750;
	bh=QEmXdMh7d6UQ5qSrIrm3i09BCxEkFdn5oz+HxR3awpY=;
	h=From:To:Cc:Subject:Date;
	b=UHgYWm6HUrBEZwUQ71Oh4efDTCiOOh8MWiiaZ4YcVfZK/WpuQlIyP1YSQ2oEILz35
	 XPyX1XWeHuCvy9vynFhFgcZcJbnnlfCP5rmh/MUmI1WWY0UPWDU5rbGAoyr1ytmIai
	 jPkq2JkkqhYtKe3ahFCVmNBg7Ea+9aNyBWE+8sjxxhz1xJoT1j0/pqVqpjuDXyWl1K
	 todkess0Rp6af6RWrMLpJxjxyRW4nZrQG9DsOoSrr0h0BtaK9QKFQbBkZ//5Lw9xPE
	 l72kvZnMtH61Nl7aiz6G8RazP5BmaSF0t2oBhQH0f3arxoMHcmSC4bNrbJGF7Mrgwk
	 6s51/8HX1hlDg==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: liubaolin12138@163.com,
	liubaolin@kylinos.cn,
	ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>,
	theBIT5 x3zk <x3zk@outlook.com>
Subject: [PATCH v2] ntfs: prevent modification of $Extend system metadata
Date: Wed, 25 Nov 2026 20:22:26 +0900
Message-Id: <20261125112226.96786-1-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
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

The $Extend directory contains system files such as $ObjId, $Quota, and
$Reparse. show_sys_files only controls directory enumeration, so hidden
system metadata remains reachable by explicit path. With the default
mount options, forced immutability covers reserved regular files,
allowing removal of $Extend and its entries. This can make later mounts
fail when load_system_files() opens FILE_Extend.

Make FILE_Extend and its direct children immutable independently of
sys_immutable. Classify the children during inode loading so protection
covers directories and files with an unnamed $DATA attribute. This
prevents userspace from changing directory entries or writing to the
protected files. Return -EPERM for file flag updates before writing
the $LINUXFLAGS EA or updating ctime.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Reported-by: theBIT5 x3zk <x3zk@outlook.com>
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
Changes in v2
- Use Baolin's inode-loading change with the existing lookup helper.
- Block file flag writes with a direct check in ntfs_fileattr_set().

 fs/ntfs/file.c  |  4 ++++
 fs/ntfs/inode.c | 19 +++++++++++++++----
 fs/ntfs/inode.h |  3 +++
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 7d93a520566e..612498b45fbb 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -231,6 +231,10 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (fa->flags & ~allowed)
 		return -EOPNOTSUPP;
 
+	/* File flag updates would modify $Extend metadata. */
+	if (ni->mft_no == FILE_Extend || NInoExtendSys(ni))
+		return -EPERM;
+
 	forced_immutable = ntfs_is_forced_immutable(vi);
 	if (!(fa->flags & FS_IMMUTABLE_FL) && forced_immutable)
 		return -EPERM;
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 4fbdcd459652..3aac1d7d310f 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -960,6 +960,15 @@ skip_attr_list_load:
 		goto unm_err_out;
 	}
 
+	/* Classify $Extend children regardless of their data or index layout. */
+	if (ni->mft_no >= FILE_first_user) {
+		err = ntfs_is_extended_system_file(ctx);
+		if (err < 0)
+			goto unm_err_out;
+		if (err > 0)
+			NInoSetExtendSys(ni);
+	}
+
 	if (ni->flags & FILE_ATTR_REPARSE_POINT) {
 		unsigned int mode;
 
@@ -1307,11 +1316,13 @@ no_data_attr_special_case:
 
 	/*
 	 * System files such as $Bitmap and $MFT are maintained by the driver
-	 * itself, and writing them from userspace corrupts the volume.
-	 * Always make them immutable regardless of the sys_immutable option.
-	 * Directories are skipped so the root and $Extend stay usable.
+	 * itself. Always make them immutable regardless of the sys_immutable
+	 * option. Protect $Extend and its system files too; modifying them
+	 * through the VFS can corrupt NTFS metadata.
 	 */
-	if (ni->mft_no < FILE_first_user && S_ISREG(vi->i_mode))
+	if (NInoExtendSys(ni) ||
+	    ni->mft_no == FILE_Extend ||
+	    (ni->mft_no < FILE_first_user && S_ISREG(vi->i_mode)))
 		vi->i_flags |= S_IMMUTABLE;
 
 	/*
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index 7ea52c59c04b..8c1929bebe44 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -182,6 +182,7 @@ struct ntfs_inode {
  * NI_HasEA			ntfs inode has EA attribute.
  * NI_RunlistDirty		runlist need to be updated.
  * NI_StreamUnlinked		Named stream is unlinked but still open.
+ * NI_ExtendSys			Inode is a system file in $Extend.
  */
 enum {
 	NI_Dirty,
@@ -204,6 +205,7 @@ enum {
 	NI_HasEA,
 	NI_RunlistDirty,
 	NI_StreamUnlinked,
+	NI_ExtendSys,
 };
 
 /*
@@ -265,6 +267,7 @@ NINO_FNS(BeingDeleted)
 NINO_FNS(HasEA)
 NINO_FNS(RunlistDirty)
 NINO_FNS(StreamUnlinked)
+NINO_FNS(ExtendSys)
 
 /*
  * The full structure containing a ntfs_inode and a vfs struct inode. Used for

base-commit: f674e4b6c315ebe742d08af80659386992d58ce9
