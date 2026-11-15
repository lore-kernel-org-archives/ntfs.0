Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749194;
	b=48SP8nG804OR6ElUu4hDVT00FLe2JGX2Mk00Jpfv7Z6IGqwchpoczukAidtt7ag2mnFw
	 W/kyvv55WVwsGGCQZ/XA/tBJbH1PT2Gf8ODPwsD0fPJsOG2JEnYC1cAvXY5PUl7NuKpq6
	 plPWf5NM5yG45TRssSQibSuPtEQ6LSO9/pEzbsLyaPL+phMZXzwurnxSc97DnbqWDywzq
	 rndWVrVB6lGbkKnx860uKMwch4k0oP09f0EBxudzu2i3+PdXktAhI6sLTsNlzofAmm6Nl
	 NuyyyFOOV6loN0NmEGy/6llOmCnBYUJER9dc66fhDVIgVCt83Mkf9S9jKsV8A43I6xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749194;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=DxFqHk89+AUxsswFbtHbs6sZwleEydVjCKAy+YjPdgc=;
	b=m1kiw6urrfDGcSQ/lX/uThkkSx5quv6knG9I3sATMMDx8eKAvuuLR5Zs0tozYOPHC4kx
	 wscMYznUNFbmlSEmh8DX9PRiXxoMM9qgnw7BvKj7j0yEFiq4m78KNjxeG0bCc3C/OLxzE
	 whLLh0GWKa63U2c06NKBhxJu0F1vM0Jc/wERCIYu3fD3E0X2v26jhdLpFK9BH7sB9mKqw
	 PufgWOJOnxi7IGyniGvBSiKt9ckTrTddaisi/RX+DNc0I84o7F30+zjHtrlZfvJ4PtApK
	 gEvFhn5by2ZtmGfVfEEK+/aw7RFG4ztOqrCRG0ECa1O/2W4+/4mxbh8B4LKigKujjwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RGJq4BJd;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13BC606A31F
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13BC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RGJq4BJd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Dx
	FqHk89+AUxsswFbtHbs6sZwleEydVjCKAy+YjPdgc=; b=RGJq4BJdQ3sWN3ehbj
	AAcb0TSLaLe2co11goFSE9YHc8K0oLObAiSUCbO8TzIsk7y0MR3GqDgRQhSZFg5L
	nvfnxaBXs04fL8tv5WE3fmyljA6QdqvXPxNMUrnwtsHO2Qu4RXXUb9AZ9r6QLUGC
	WtlB2HMh0CScNTMIQQRc9+UQM=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD33yHzsvlqXCkHHw--.36757S9;
	Sun, 15 Nov 2026 21:26:17 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 07/12] ntfs: load uncached ACLs through get_inode_acl
Date: Sun, 15 Nov 2026 21:26:04 +0800
Message-ID: <20261115132609.209957-8-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261115132609.209957-1-liubaolin12138@163.com>
References: <20261115132609.209957-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33yHzsvlqXCkHHw--.36757S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWkGr1UJryxurWkKFWDXFb_yoWrXFyxpF
	sxJw1rKa1xZrWSgwn2kr4DXw1F9ryxWa9Fg34rWw1Ska4Dtr13tFy8Ka1xuF95trWrGFnF
	gF15Kr4jvr15Wr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uio7NUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RkEzmr5svltpAAA3r

From: Baolin Liu <liubaolin@kylinos.cn>

Permission checks and default ACL inheritance use get_inode_acl(), which
cannot call NTFS's dentry-based get_acl callback. After inode eviction,
these paths treat stored ACLs as absent unless an explicit xattr read
has populated the cache.

Use get_inode_acl for regular files, directories and special files,
leaving ACL caching to the VFS. Return -ECHILD during RCU lookup so the
VFS retries where the EA read can sleep.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
New in v4.

Tested cold-cache inheritance and permissions, O_TMPFILE publication,
chmod, ACL replacement/removal, idmapped mounts and concurrent default
ACL replacement/creation. Remount and reboot checks passed.

 fs/ntfs/ea.c    | 10 ++++------
 fs/ntfs/ea.h    |  3 +--
 fs/ntfs/file.c  |  4 ++--
 fs/ntfs/namei.c |  2 +-
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 834f38ea4a00..b745391b3f25 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -1010,10 +1010,8 @@ const struct xattr_handler * const ntfs_xattr_handlers[] = {
 // clang-format on
 
 #ifdef CONFIG_NTFS_FS_POSIX_ACL
-struct posix_acl *ntfs_get_acl(const struct mnt_idmap *idmap, struct dentry *dentry,
-			       int type)
+struct posix_acl *ntfs_get_acl(struct inode *inode, int type, bool rcu)
 {
-	struct inode *inode = d_inode(dentry);
 	struct ntfs_inode *ni = NTFS_I(inode);
 	const char *name;
 	size_t name_len;
@@ -1021,6 +1019,9 @@ struct posix_acl *ntfs_get_acl(const struct mnt_idmap *idmap, struct dentry *den
 	int err;
 	void *buf = NULL;
 
+	if (rcu)
+		return ERR_PTR(-ECHILD);
+
 	/* Possible values of 'type' was already checked above. */
 	if (type == ACL_TYPE_ACCESS) {
 		name = XATTR_NAME_POSIX_ACL_ACCESS;
@@ -1049,9 +1050,6 @@ struct posix_acl *ntfs_get_acl(const struct mnt_idmap *idmap, struct dentry *den
 	else
 		acl = ERR_PTR(err);
 
-	if (!IS_ERR(acl))
-		set_cached_acl(inode, type, acl);
-
 	kfree(buf);
 
 	return acl;
diff --git a/fs/ntfs/ea.h b/fs/ntfs/ea.h
index f200d49063e0..e9ea024f6a8e 100644
--- a/fs/ntfs/ea.h
+++ b/fs/ntfs/ea.h
@@ -28,8 +28,7 @@ int ntfs_ea_set_linuxflags(struct inode *inode, u32 linuxflags);
 ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 
 #ifdef CONFIG_NTFS_FS_POSIX_ACL
-struct posix_acl *ntfs_get_acl(const struct mnt_idmap *idmap, struct dentry *dentry,
-			       int type);
+struct posix_acl *ntfs_get_acl(struct inode *inode, int type, bool rcu);
 int ntfs_set_acl(const struct mnt_idmap *idmap, struct dentry *dentry,
 		 struct posix_acl *acl, int type);
 int ntfs_init_acl(const struct mnt_idmap *idmap, struct inode *inode,
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 5ab0e3437d67..a52483d16c6e 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -1580,7 +1580,7 @@ const struct inode_operations ntfs_file_inode_ops = {
 	.fileattr_get	= ntfs_fileattr_get,
 	.fileattr_set	= ntfs_fileattr_set,
 	.listxattr	= ntfs_listxattr,
-	.get_acl	= ntfs_get_acl,
+	.get_inode_acl	= ntfs_get_acl,
 	.set_acl	= ntfs_set_acl,
 	.fiemap		= ntfs_fiemap,
 };
@@ -1600,7 +1600,7 @@ const struct inode_operations ntfs_special_inode_operations = {
 	.listxattr	= ntfs_listxattr,
 	.fileattr_get	= ntfs_fileattr_get,
 	.fileattr_set	= ntfs_fileattr_set,
-	.get_acl	= ntfs_get_acl,
+	.get_inode_acl	= ntfs_get_acl,
 	.set_acl	= ntfs_set_acl,
 };
 
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 05e2747bae54..d3c63b1c166f 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1703,7 +1703,7 @@ const struct inode_operations ntfs_dir_inode_ops = {
 	.mkdir		= ntfs_mkdir,
 	.rmdir		= ntfs_rmdir,
 	.rename		= ntfs_rename,
-	.get_acl	= ntfs_get_acl,
+	.get_inode_acl	= ntfs_get_acl,
 	.set_acl	= ntfs_set_acl,
 	.listxattr	= ntfs_listxattr,
 	.setattr	= ntfs_setattr,

