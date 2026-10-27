Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093735;
	b=bge56ibh/N47zW09VWpjeArDMrguZW5zJdkl+/QY7D/qGRJv0QxuM2Rgp4bPHcDKoM5+
	 dx2fFTw3rD3MjFZWNAQpFgbwLRh4gSha3R5dy8dfFfAQYTIgP8W8PIeDHMhw45Vsgfd/N
	 VUksroeWtBKqQZkWHf7msWIdHSy4gloOnawMoglfqVviu9avO05XToa6xPA0Mk1Hnf/is
	 cCS7Wm9+/hL15gRortmSChd0WjUyuWYT2IGNVUVN3wXNfKHnzbmUwV+P2mCIlLsrgvIoW
	 VyhhJ3V9Y2r3yi/ynxOVlTVHnC9brKSksdDmDUJejd9O/PYSawkIlab4xluPRtLtCjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093735;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=zO705erkzkkbOFgseM2V3u/J1XcG7q9YV+Ps2I7c14E=;
	b=2N4IvmGZDT6pR70vABxRrS0YInNuEu9c0Ea+00X83HulM+dHEkqxIzq2IW30ldgcoDIs
	 i25jbtR/8g5A3iXhJiKnhY8x3ONQ/z1e6JInOPjnU6sPC4bhQmZWQpwT1H+CXU/liKEkk
	 JGWyxZPW2UqZmIlg3yFyAK/f5nYLtl6YrXzW2p7QlMQ6x0JtOuzisLUGTFWxHBy8+aVfR
	 YB6IIUiCAhfckdMwvXOlbrhFV2mhSXTYQnyZYE8yy29pz0znOzKzfdfyde709fB9ROWDx
	 5mdn70dBFoszVO7PCGO9MpFUUyHpEpNGywwkDCfzXAjQLaePuC4JhKCjzvvRVk8Nmtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Jobqr103;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4F606A31D
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 09:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B4F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Jobqr103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zO
	705erkzkkbOFgseM2V3u/J1XcG7q9YV+Ps2I7c14E=; b=Jobqr103DL/W7J1swt
	E1R+k/FAlKCEP4mBiHO/w70n8XWjPLMymXA80U/j2YYeOTfRTgGjzo/3KhHP5VBA
	YKplEZX72lD+syvtN15lgs+Dhzca+i0TCyiL8SOx80z6D2m+GSNhqbgxpnUSEncB
	gRjJX2WuArCGQWzCYGpiuVb7Q=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD33xFVcOBqdMGFDQ--.18497S3;
	Tue, 27 Oct 2026 17:35:19 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 1/5] ntfs: initialize inherited ACLs after allocating the MFT record
Date: Tue, 27 Oct 2026 17:35:11 +0800
Message-ID: <20261027093515.344799-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261027093515.344799-1-liubaolin12138@163.com>
References: <20261027093515.344799-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33xFVcOBqdMGFDQ--.18497S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxury3GrWrJFWxCFWktr17GFg_yoWrZryfpF
	s3Wr47G39rXF1xWan3tw4Y9r13t395uF4UWr43J3WfAw10gwnIga48tFyjkFyftrZ5K34v
	qF4UKw17JrWDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7Ef5UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RcEzmrgcFdKbQAA3+

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_init_acl() can write EAs, but __ntfs_create() calls it before
allocating the new inode's MFT record. An inherited access ACL can appear
correct in the inode cache and disappear after eviction.

Initialize the ACL after allocating the MFT record and adding the standard
attributes. Release the parent and child record locks around the ACL
helpers to avoid recursive locking, then refresh the local mode from the
inode. On creation failure, remove any EA and EA_INFORMATION attributes
before freeing the MFT record.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
QEMU tests used the complete five-patch series with NTFS debug and
lockdep enabled. An ordinary new file inherits an access ACL from a
parent default ACL containing a named-user entry; that access ACL remains
readable after inode eviction. An anonymous file's inherited access ACL
also remains readable after publication, cache eviction, read-only and
read-write remounts, unmount/mount and a fresh boot. Offline inspection
confirmed that the recorded base MFT record was freed after an injected
creation failure following ACL and WSL EA initialization.

 fs/ntfs/namei.c | 44 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 0db7da0..0c84a5c 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -422,6 +422,7 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
 	struct ntfs_volume *vol = dir_ni->vol;
 	struct ntfs_inode *ni;
 	bool rollback_data = false, rollback_sd = false, rollback_reparse = false;
+	bool rollback_ea = false;
 	struct file_name_attr *fn = NULL;
 	struct standard_information *si = NULL;
 	int err = 0, fn_len, si_len;
@@ -429,6 +430,7 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
 	struct mft_record *ni_mrec, *dni_mrec;
 	struct super_block *sb = dir_ni->vol->sb;
 	struct inode *rollback_data_vi = NULL, *rollback_sd_vi = NULL;
+	struct inode *rollback_ea_vi = NULL, *rollback_eai_vi = NULL;
 	__le64 parent_mft_ref;
 	u64 child_mft_ref;
 	__le16 ea_size;
@@ -469,17 +471,6 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
 
 	mode = vi->i_mode;
 
-#ifdef CONFIG_NTFS_FS_POSIX_ACL
-	if (!S_ISLNK(mode) && (sb->s_flags & SB_POSIXACL)) {
-		err = ntfs_init_acl(idmap, vi, dir);
-		if (err)
-			goto err_out;
-	} else
-#endif
-	{
-		vi->i_flags |= S_NOSEC;
-	}
-
 	if (uid_valid(vol->uid))
 		vi->i_uid = vol->uid;
 
@@ -644,6 +635,24 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
 			goto err_out;
 	}
 
+	/* ACL EAs need the allocated MFT record and initialized attributes. */
+	rollback_ea = true;
+#ifdef CONFIG_NTFS_FS_POSIX_ACL
+	if (!S_ISLNK(mode) && (sb->s_flags & SB_POSIXACL)) {
+		/* The ACL helpers acquire both the parent's and child's locks. */
+		mutex_unlock(&dir_ni->mrec_lock);
+		mutex_unlock(&ni->mrec_lock);
+		err = ntfs_init_acl(idmap, vi, dir);
+		mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
+		mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
+		if (err)
+			goto err_out;
+		mode = vi->i_mode;
+	}
+#endif
+	if (S_ISLNK(mode) || !(sb->s_flags & SB_POSIXACL))
+		vi->i_flags |= S_NOSEC;
+
 	err = ntfs_ea_set_wsl_inode(vi, dev, &ea_size,
 			NTFS_EA_UID | NTFS_EA_GID | NTFS_EA_MODE);
 	if (err)
@@ -718,6 +727,15 @@ static struct ntfs_inode *__ntfs_create(struct mnt_idmap *idmap, struct inode *d
 	return ni;
 
 err_out:
+	if (rollback_ea) {
+		if (ntfs_attr_exist(ni, AT_EA, AT_UNNAMED, 0) &&
+		    ntfs_attr_remove(ni, AT_EA, AT_UNNAMED, 0, &rollback_ea_vi))
+			ntfs_error(sb, "Failed to roll back EA attribute.");
+		if (ntfs_attr_exist(ni, AT_EA_INFORMATION, AT_UNNAMED, 0) &&
+		    ntfs_attr_remove(ni, AT_EA_INFORMATION, AT_UNNAMED, 0,
+				     &rollback_eai_vi))
+			ntfs_error(sb, "Failed to roll back EA_INFORMATION attribute.");
+	}
 	if (rollback_sd) {
 		int rollback_err;
 
@@ -764,6 +782,10 @@ err_out:
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);
 
+	if (rollback_ea_vi)
+		iput(rollback_ea_vi);
+	if (rollback_eai_vi)
+		iput(rollback_eai_vi);
 	if (rollback_data_vi)
 		iput(rollback_data_vi);
 	if (rollback_sd_vi)

