Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C3135E922
	for <ntfs@lists.linux.dev>; Mon,  7 Sep 2026 03:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788750072; cv=none; b=gA/OPPbAMRuLhzM2VHSjvvbFDRN7m99XlfXeT4uvAtpmiNPHdRE4ssuLd7rSC5VGVT0Li2LtpoYvIEEZuBT3wL5gS8ocksJBgqApCs+pg1soRJBVX7bGZLdrgppYFYpCjM+zWYKXtgqpTpIe+nsa/CUGcXc3pcJggfJMRQpkHzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788750072; c=relaxed/simple;
	bh=x3Ut6I17OxA2cMeZp4Hr8Nzxzp+mZJJGT5+Ndm3N9kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oyr71iA6ecVQ/39sfSNHXSkzPOkfEJaXMCjc33wwAoHzWTJV6H1Sd2i8pKaNi7+OOZO5+/B15hoidKZ6E4nxjgDCtNgTUQY2Gq3QXhotetwPot825jL0fzyFSpn1JGFtgY2Bx8sW5q6Q2GaRO9OqO9xpmVuxCNGIIzUdCSEuwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jk4+S8gc; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jk4+S8gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lB
	dpVxiV8qt8reu3ODDOYW/NrjSf2HK6BDFTo6I8Mu0=; b=jk4+S8gcYpUgwW1sBK
	BcZnZUUrXxAYlraIguZV66Xxvrxyl5jTIjU2iwCW8+vnZ0fb1U3f7UuLJrRLxssX
	ypEjOymPJ1myOXs6meZfSAUfpfW8sndot9SWXDIPgSH49UZq5AxxnwPASXvjGmn8
	8JVFZvg9A/secmRKBDLCgdbmU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wC34gLeKJ5qxSd7BA--.57496S2;
	Mon, 07 Sep 2026 11:00:48 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3] ntfs: fix error handling in ntfs_extent_inode_open and propagate errors
Date: Mon,  7 Sep 2026 11:00:43 +0800
Message-ID: <20260907030044.3649349-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC34gLeKJ5qxSd7BA--.57496S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryfKF4UZFWxWry7ZFWfGrg_yoWrZr48pF
	sruw1xtw43Jry7KrWvyr4q9F1akF4xKrW7Gw1DJwn7A3Z8t340vF1jvr109rnayrZ5J34F
	qr4jka17ua47ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnhL8UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QCET2qeKOA+QQAA3h

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_extent_inode_open() has two issues:

1. When map_mft_record() fails or a stale extent reference is found,
   it returns the non-NULL 'ni' pointer instead of an error, causing
   the caller to treat the failure as success.

2. For allocation failures, it returns NULL, losing information about
   what actually went wrong (-ENOMEM).

Fix both by converting the function to return ERR_PTR() on error, and
update the single caller (ntfs_inode_attach_all_extents) to check with
IS_ERR() and propagate the actual error code with PTR_ERR().

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

---
Changes in v3:
- Return -EIO for stale extent MFT references.
- Call ntfs_destroy_ext_inode(ni) before returning ERR_PTR(-ENOMEM) on the
  kvzalloc() failure path, instead of overwriting ni first (Namjae Jeon)
- Drop the now unused err_out label
- Use ERR_CAST() instead of ERR_PTR(PTR_ERR())

Changes in v2:
- Convert ntfs_extent_inode_open() to return ERR_PTR() and update
  ntfs_inode_attach_all_extents() to use IS_ERR()/PTR_ERR()

 fs/ntfs/inode.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 5aedc045f65a..cf914e1ab0b7 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2904,8 +2904,7 @@ int __ntfs_write_inode(struct inode *vi, int sync)
  * abort if deprotection or checks fail.
  *
  * Finally attach the ntfs inode to its base inode @base_ni and return a
- * pointer to the ntfs_inode structure on success or NULL on error, with errno
- * set to the error code.
+ * pointer to the ntfs_inode structure on success or ERR_PTR() on error.
  *
  * Note, extent inodes are never closed directly. They are automatically
  * disposed off by the closing of the base inode.
@@ -2921,7 +2920,7 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 	struct super_block *sb;
 
 	if (!base_ni)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	sb = base_ni->vol->sb;
 	ntfs_debug("Opening extent inode %llu (base mft record %llu).\n",
@@ -2940,7 +2939,7 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 			if (IS_ERR(ni_mrec)) {
 				ntfs_error(sb, "failed to map mft record for %llu",
 						ni->mft_no);
-				goto out;
+				return ERR_CAST(ni_mrec);
 			}
 			/* Verify the sequence number if given. */
 			seq_no = MSEQNO_LE(mref);
@@ -2949,7 +2948,7 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 				ntfs_error(sb, "Found stale extent mft reference mft=%llu",
 						ni->mft_no);
 				unmap_mft_record(ni);
-				goto out;
+				return ERR_PTR(-EIO);
 			}
 			unmap_mft_record(ni);
 			goto out;
@@ -2958,7 +2957,7 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 	/* Wasn't there, we need to load the extent inode. */
 	ni = ntfs_new_extent_inode(base_ni->vol->sb, mft_no);
 	if (!ni)
-		goto out;
+		return ERR_PTR(-ENOMEM);
 
 	ni->seq_no = (u16)MSEQNO_LE(mref);
 	ni->nr_extents = -1;
@@ -2968,8 +2967,10 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 		i = (base_ni->nr_extents + 4) * sizeof(struct ntfs_inode *);
 
 		extent_nis = kvzalloc(i, GFP_NOFS);
-		if (!extent_nis)
-			goto err_out;
+		if (!extent_nis) {
+			ntfs_destroy_ext_inode(ni);
+			return ERR_PTR(-ENOMEM);
+		}
 		if (base_ni->nr_extents) {
 			memcpy(extent_nis, base_ni->ext.extent_ntfs_inos,
 					i - 4 * sizeof(struct ntfs_inode *));
@@ -2982,10 +2983,6 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 out:
 	ntfs_debug("\n");
 	return ni;
-err_out:
-	ntfs_destroy_ext_inode(ni);
-	ni = NULL;
-	goto out;
 }
 
 /*
@@ -3023,9 +3020,12 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
 	while ((u8 *)ale < ni->attr_list + ni->attr_list_size) {
 		if (ni->mft_no != MREF_LE(ale->mft_reference) &&
 				prev_attached != MREF_LE(ale->mft_reference)) {
-			if (!ntfs_extent_inode_open(ni, ale->mft_reference)) {
+			struct ntfs_inode *ext_ni;
+
+			ext_ni = ntfs_extent_inode_open(ni, ale->mft_reference);
+			if (IS_ERR(ext_ni)) {
 				ntfs_debug("Couldn't attach extent inode.\n");
-				return -1;
+				return PTR_ERR(ext_ni);
 			}
 			prev_attached = MREF_LE(ale->mft_reference);
 		}
-- 
2.51.0

