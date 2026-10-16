Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D93955FE
	for <ntfs@lists.linux.dev>; Fri, 16 Oct 2026 03:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120229; cv=none; b=jsrYmJN5bJ5mVqP2Yp8cT/7GKs6Oga0pjK25TFz9kOkhaOGMQwWDpcHgmAzNQWoZb00Nfyo2T9XoeshT0lvoqMpb9SpPS0keJ0wbkq/VU71QX+KIwAI1JeDQHtjiFcri+KR5rz8BSsXrfY92c8iVmmR+MYufzzAgV1coByPUqrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120229; c=relaxed/simple;
	bh=rA5ggDv9ChQmCB/8QRJpMDUGTOGZug8ohy+IDQOg3VA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YWp2nFzgppbjqBhfHI3/tomS5jKmPaPD3VfC34C19UWl5MXVSWcTQYYsHAopONwzW7A10LtoIpZYDCHi7CNdgRi8r97x8mr1c/k9tlNrP4Mtae+TtCvOkAKlq8b/HuQ2c/aLA7jlmRSbPojGSVDa96wucQFgT3Aq7ok8wtAlsa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1a219054c90f11f19a56ed5b684f684d-20261016
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5c4e9449-0240-4d99-8ef6-89fa866b51e6,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:5c4e9449-0240-4d99-8ef6-89fa866b51e6,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:f21ea0ed1bdcf46785798b09998d501d,BulkI
	D:261016111016W425NWVJ,BulkQuantity:0,SF:17|19|38|66|78|102|127|136|850|86
	5|898,TC:nil,Content:0|15|50|99,EDM:-3|-100,IP:-2,URL:0,File:nil,RT:nil,Bu
	lk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:
	0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1a219054c90f11f19a56ed5b684f684d-20261016
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1824619241; Fri, 16 Oct 2026 11:10:12 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1] ntfs: support persistent noatime attribute
Date: Fri, 16 Oct 2026 11:09:57 +0800
Message-Id: <20261016030957.1053110-1-wangxuewen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NTFS currently rejects FS_NOATIME_FL in its fileattr setter. This prevents
users from disabling automatic access-time updates on individual files or
directories with chattr +A.

Store noatime in bit 3 of the private $LINUXFLAGS EA and restore S_NOATIME
when loading an inode. Report and accept FS_NOATIME_FL in the fileattr
callbacks, updating the in-memory flag only after the EA update succeeds.
The VFS then suppresses automatic atime updates for the inode, while
chattr -A restores the mount's atime policy.

Document the new on-disk bit and that newly created children do not inherit
the attribute.

Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested in QEMU (x86-64, UP, NTFS debug and lockdep enabled) on disposable
NTFS images mounted with strictatime. The unpatched kernel rejects +A on
files and directories with EOPNOTSUPP. With this patch, chattr +A prevents
atime updates on reads and directory enumeration, and chattr -A restores
them. The attribute survives cache dropping, read-only/read-write remounts,
unmount/mount and a fresh boot; clearing it also survives a fresh boot.

Also checked the on-disk EA value, non-inheritance by new children,
combinations with immutable/append-only/nodump, FSGETXATTR/FSSETXATTR,
owner/nonowner permissions, EROFS on a read-only mount, rejection of direct
EA writes, and preservation of unrelated EAs and unknown flag bits.

 Documentation/filesystems/ntfs.rst | 15 ++++++++++-----
 fs/ntfs/ea.c                       |  2 ++
 fs/ntfs/ea.h                       |  4 +++-
 fs/ntfs/file.c                     | 11 +++++++++--
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
index 699e91f884d4..d5819da6ab53 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -38,15 +38,20 @@ The project is available at:
 Linux file attributes
 =====================
 
-The driver supports lsattr(1) and chattr(1). Immutable, append-only and
-nodump are stored in a private ``$LINUXFLAGS`` extended attribute within the
+The driver supports lsattr(1) and chattr(1). Immutable, append-only, nodump
+and noatime are stored in a private ``$LINUXFLAGS`` extended attribute within the
 standard NTFS ``$EA``/``$EA_INFORMATION`` attributes. Its value is a
 32-bit little-endian bitmask: bit 0 is immutable, bit 1 is append-only,
-and bit 2 is nodump. Unknown bits are preserved when updating the flags;
-the entry is removed when the entire value becomes zero. These settings
+bit 2 is nodump, and bit 3 is noatime. Unknown bits are preserved when updating
+the flags; the entry is removed when the entire value becomes zero. These settings
 survive inode eviction, unmount and reboot. Direct writes to this EA
 through setxattr(2) or removexattr(2) are rejected; use chattr(1) instead.
 
+The noatime attribute (``chattr +A``) suppresses automatic access-time
+updates for the inode, including when mounted with ``strictatime``. It
+applies to directories as well as files, but is not inherited by newly
+created children. Use ``chattr -A`` to restore the mount's access-time policy.
+
 System metadata files and files protected by the ``sys_immutable`` mount
 option cannot have their immutable protection cleared with chattr(1).
 Protection derived solely from the mount option is not stored in the EA.
@@ -55,7 +60,7 @@ configured per file. Compression and encryption are reported but cannot
 be changed through chattr(1).
 
 These Linux flags are enforced by Linux. Storing them in an NTFS EA does
-not make Windows enforce immutable, append-only or nodump semantics.
+not make Windows enforce immutable, append-only, nodump or noatime semantics.
 
 
 Supported mount options
diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index a1f948c4d2ec..fd97da73ff5c 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -501,6 +501,8 @@ int ntfs_ea_get_linuxflags(struct inode *inode)
 		inode->i_flags |= S_IMMUTABLE;
 	if (ni->linuxflags & NTFS_LINUXFLAGS_APPEND)
 		inode->i_flags |= S_APPEND;
+	if (ni->linuxflags & NTFS_LINUXFLAGS_NOATIME)
+		inode->i_flags |= S_NOATIME;
 	return 0;
 }
 
diff --git a/fs/ntfs/ea.h b/fs/ntfs/ea.h
index 8f144fa4f9bb..3ad20431877b 100644
--- a/fs/ntfs/ea.h
+++ b/fs/ntfs/ea.h
@@ -11,8 +11,10 @@
 #define NTFS_LINUXFLAGS_IMMUTABLE	BIT(0)
 #define NTFS_LINUXFLAGS_APPEND	BIT(1)
 #define NTFS_LINUXFLAGS_NODUMP	BIT(2)
+#define NTFS_LINUXFLAGS_NOATIME	BIT(3)
 #define NTFS_LINUXFLAGS_MASK	(NTFS_LINUXFLAGS_IMMUTABLE | \
-				 NTFS_LINUXFLAGS_APPEND | NTFS_LINUXFLAGS_NODUMP)
+				 NTFS_LINUXFLAGS_APPEND | NTFS_LINUXFLAGS_NODUMP | \
+				 NTFS_LINUXFLAGS_NOATIME)
 
 extern const struct xattr_handler *const ntfs_xattr_handlers[];
 
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 58aad7f5c6c5..2cbe780758e3 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -167,6 +167,8 @@ int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 		flags |= FS_IMMUTABLE_FL;
 	if (vi->i_flags & S_APPEND)
 		flags |= FS_APPEND_FL;
+	if (vi->i_flags & S_NOATIME)
+		flags |= FS_NOATIME_FL;
 	if (ni->linuxflags & NTFS_LINUXFLAGS_NODUMP)
 		flags |= FS_NODUMP_FL;
 	if (!NVolCaseSensitive(ni->vol))
@@ -200,7 +202,8 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *vi = d_inode(dentry);
 	struct ntfs_inode *ni = NTFS_I(vi);
-	u32 allowed = FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL;
+	u32 allowed = FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL |
+		      FS_NOATIME_FL;
 	u32 readonly = 0;
 	u32 linuxflags = ni->linuxflags & ~NTFS_LINUXFLAGS_MASK;
 	unsigned int new_fl = 0;
@@ -245,6 +248,10 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 	}
 	if (fa->flags & FS_NODUMP_FL)
 		linuxflags |= NTFS_LINUXFLAGS_NODUMP;
+	if (fa->flags & FS_NOATIME_FL) {
+		new_fl |= S_NOATIME;
+		linuxflags |= NTFS_LINUXFLAGS_NOATIME;
+	}
 
 	mutex_lock(&ni->mrec_lock);
 	err = ntfs_ea_set_linuxflags(vi, linuxflags);
@@ -252,7 +259,7 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (err)
 		return err;
 
-	inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND);
+	inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND | S_NOATIME);
 	inode_set_ctime_current(vi);
 	mark_inode_dirty(vi);
 	return 0;
-- 
2.25.1

