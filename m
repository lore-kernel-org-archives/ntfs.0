Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358EF253B42
	for <ntfs@lists.linux.dev>; Sun, 13 Sep 2026 01:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789261387; cv=none; b=nq3WftcRmLGubIzebSWO0oRHA9bFdJDvfOJcB03bQ7io/AlQ0wYKH9k6PdBp/LQ0/JeNHjocBg9Ifg6K/JFPSpJ+kCx8+EhpZbcyJ01MGSMGeVSqXUdDUo/ap0di/9qHay68qkg/fdvItUCT+i43Zjgh9k+zC2855LgOYAofFV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789261387; c=relaxed/simple;
	bh=BQCKEBKUQsh/MoXPv2I1/M7I8JmQwo8HwZVgNGR3L1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXJYmdxKMYgnbBqJ4YyUqo3T1wmolHF12hL+wuRmCh/YuP6uMhn3i44M10hyDM2BoZst5JtV4ZalJSpGIffynwGc2W1vflI89vxg96Vd8XIwQ1xsaW8r9QGHsPq9C9VwPa7acD6q2zGKOvtZo8SLSQ2j/5WmdKkjvR/BogHG5c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OXae2rIQ; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OXae2rIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Mj
	DdsCTuiXNAoysA10hBlw3FzU4uICRpv8BHm9r3LpQ=; b=OXae2rIQizOLXNRrWu
	lkFoZX5xTu8C/kNrywDWvcq2xPnhcKeKpcENLa4D5upOSs6kb9d0HOo+lhPAOXhi
	XyTe4fxCsuue415u4czeIV3XZMvykbQ9VlenYNcO0Fxl3fb5/x/KioXNftEhWzRM
	unaW+Yac9F2SU9wpJbBTDv56s=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3fzcu9qVqUzF9AQ--.1985S2;
	Sun, 13 Sep 2026 09:02:40 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1] ntfs: fix lookup of POSIX names with Windows-invalid characters
Date: Sun, 13 Sep 2026 09:02:36 +0800
Message-ID: <20260913010236.17541-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fzcu9qVqUzF9AQ--.1985S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gr18tw4DtF1UKw4UtF4UCFg_yoWfGFy8pr
	nF93sxAw43GF1avrn8t3ykWFy5Ar9rGryqyryqga97Cws3uw1kGF4UKrn29F1rtrWkA34x
	XF4jq3y7ur47XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPpnLUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhDNmGql9jByfQAA3B

From: Hyunchul Lee <hyc.lee@gmail.com>

POSIX FILE_NAME entries may contain characters such as '?' that are
invalid in the Windows namespace. Directory index lookup currently
passes an invalid-character error value to ntfs_collate_names(),
causing lookup and removal of such names to fail with -EINVAL.

Allow callers to disable invalid-character errors when collation is
used for index traversal, and suppress those errors when comparing
POSIX FILE_NAME attributes.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Tested-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/attrib.c  |  8 ++++----
 fs/ntfs/collate.c |  6 +++---
 fs/ntfs/dir.c     |  8 ++++----
 fs/ntfs/ntfs.h    |  4 ++--
 fs/ntfs/unistr.c  | 29 ++++++++++++++++++++---------
 5 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index c7c09a751c6a..808b44671fff 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -909,7 +909,7 @@ static int ntfs_attr_find(const __le32 type, const __le16 *name,
 
 				rc = ntfs_collate_names(name, name_len,
 						(__le16 *)((u8 *)a + le16_to_cpu(a->name_offset)),
-						a->name_length, 1, IGNORE_CASE,
+						a->name_length, true, IGNORE_CASE,
 						upcase, upcase_len);
 				/*
 				 * If @name collates before a->name, there is no
@@ -922,7 +922,7 @@ static int ntfs_attr_find(const __le32 type, const __le16 *name,
 					continue;
 				rc = ntfs_collate_names(name, name_len,
 						(__le16 *)((u8 *)a + le16_to_cpu(a->name_offset)),
-						a->name_length, 1, CASE_SENSITIVE,
+						a->name_length, true, CASE_SENSITIVE,
 						upcase, upcase_len);
 				if (rc == -1)
 					return -ENOENT;
@@ -1313,7 +1313,7 @@ static int ntfs_external_attr_find(const __le32 type,
 			register int rc;
 
 			rc = ntfs_collate_names(name, name_len, al_name,
-					al_name_len, 1, IGNORE_CASE,
+					al_name_len, true, IGNORE_CASE,
 					vol->upcase, vol->upcase_len);
 			/*
 			 * If @name collates before al_name, there is no
@@ -1326,7 +1326,7 @@ static int ntfs_external_attr_find(const __le32 type,
 				continue;
 
 			rc = ntfs_collate_names(name, name_len, al_name,
-					al_name_len, 1, CASE_SENSITIVE,
+					al_name_len, true, CASE_SENSITIVE,
 					vol->upcase, vol->upcase_len);
 			if (rc == -1)
 				goto not_found;
diff --git a/fs/ntfs/collate.c b/fs/ntfs/collate.c
index 744fdfd7bf58..5417288c5825 100644
--- a/fs/ntfs/collate.c
+++ b/fs/ntfs/collate.c
@@ -100,11 +100,11 @@ static int ntfs_collate_file_name(struct ntfs_volume *vol,
 {
 	int rc;
 
-	rc = ntfs_file_compare_values(data1, data2, -EINVAL,
-			IGNORE_CASE, vol->upcase, vol->upcase_len);
+	rc = ntfs_file_compare_values(data1, data2,
+				      true, IGNORE_CASE, vol->upcase, vol->upcase_len);
 	if (!rc)
 		rc = ntfs_file_compare_values(data1, data2,
-			-EINVAL, CASE_SENSITIVE, vol->upcase, vol->upcase_len);
+			true, CASE_SENSITIVE, vol->upcase, vol->upcase_len);
 	return rc;
 }
 
diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index 2d594cbb4ebe..af16c7d6ea0b 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -238,7 +238,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		 */
 		rc = ntfs_collate_names(uname, uname_len,
 				(__le16 *)&ie->key.file_name.file_name,
-				ie->key.file_name.file_name_length, 1,
+				ie->key.file_name.file_name_length, false,
 				IGNORE_CASE, vol->upcase, vol->upcase_len);
 		/*
 		 * If uname collates before the name of the current entry, there
@@ -257,7 +257,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		 */
 		rc = ntfs_collate_names(uname, uname_len,
 				(__le16 *)&ie->key.file_name.file_name,
-				ie->key.file_name.file_name_length, 1,
+				ie->key.file_name.file_name_length, false,
 				CASE_SENSITIVE, vol->upcase, vol->upcase_len);
 		if (rc == -1)
 			break;
@@ -474,7 +474,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		 */
 		rc = ntfs_collate_names(uname, uname_len,
 				(__le16 *)&ie->key.file_name.file_name,
-				ie->key.file_name.file_name_length, 1,
+				ie->key.file_name.file_name_length, false,
 				IGNORE_CASE, vol->upcase, vol->upcase_len);
 		/*
 		 * If uname collates before the name of the current entry, there
@@ -493,7 +493,7 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 		 */
 		rc = ntfs_collate_names(uname, uname_len,
 				(__le16 *)&ie->key.file_name.file_name,
-				ie->key.file_name.file_name_length, 1,
+				ie->key.file_name.file_name_length, false,
 				CASE_SENSITIVE, vol->upcase, vol->upcase_len);
 		if (rc == -1)
 			break;
diff --git a/fs/ntfs/ntfs.h b/fs/ntfs/ntfs.h
index 45f77848a9cf..1bee1626abdf 100644
--- a/fs/ntfs/ntfs.h
+++ b/fs/ntfs/ntfs.h
@@ -234,14 +234,14 @@ bool ntfs_are_names_equal(const __le16 *s1, size_t s1_len,
 		const __le16 *upcase, const u32 upcase_size);
 int ntfs_collate_names(const __le16 *name1, const u32 name1_len,
 		const __le16 *name2, const u32 name2_len,
-		const int err_val, const u32 ic,
+		const bool check_invalid, const u32 ic,
 		const __le16 *upcase, const u32 upcase_len);
 int ntfs_ucsncmp(const __le16 *s1, const __le16 *s2, size_t n);
 int ntfs_ucsncasecmp(const __le16 *s1, const __le16 *s2, size_t n,
 		const __le16 *upcase, const u32 upcase_size);
 int ntfs_file_compare_values(const struct file_name_attr *file_name_attr1,
 		const struct file_name_attr *file_name_attr2,
-		const int err_val, const u32 ic,
+		const bool check_invalid, const u32 ic,
 		const __le16 *upcase, const u32 upcase_len);
 int ntfs_nlstoucs(const struct ntfs_volume *vol, const char *ins,
 		const int ins_len, __le16 **outs, int max_name_len);
diff --git a/fs/ntfs/unistr.c b/fs/ntfs/unistr.c
index 7f11a2825527..733bd6fe8599 100644
--- a/fs/ntfs/unistr.c
+++ b/fs/ntfs/unistr.c
@@ -64,7 +64,8 @@ bool ntfs_are_names_equal(const __le16 *s1, size_t s1_len,
  * @name1_len:	first Unicode name length
  * @name2:	second Unicode name to compare
  * @name2_len:	second Unicode name length
- * @err_val:	if @name1 contains an invalid character return this value
+ * @check_invalid:	if true and @name1 contains an invalid character,
+ *			return -EINVAL
  * @ic:		either CASE_SENSITIVE or IGNORE_CASE
  * @upcase:	upcase table (ignored if @ic is CASE_SENSITIVE)
  * @upcase_len:	upcase table size (ignored if @ic is CASE_SENSITIVE)
@@ -74,13 +75,14 @@ bool ntfs_are_names_equal(const __le16 *s1, size_t s1_len,
  *  -1 if the first name collates before the second one,
  *   0 if the names match,
  *   1 if the second name collates before the first one, or
- * @err_val if an invalid character is found in @name1 during the comparison.
+ * -EINVAL if @check_invalid is true and an invalid character is found in
+ * @name1 during the comparison.
  *
  * The following characters are considered invalid: '"', '*', '<', '>' and '?'.
  */
 int ntfs_collate_names(const __le16 *name1, const u32 name1_len,
 		const __le16 *name2, const u32 name2_len,
-		const int err_val, const u32 ic,
+		const bool check_invalid, const u32 ic,
 		const __le16 *upcase, const u32 upcase_len)
 {
 	u32 cnt, min_len;
@@ -98,8 +100,8 @@ int ntfs_collate_names(const __le16 *name1, const u32 name1_len,
 			if (c2 < upcase_len)
 				c2 = le16_to_cpu(upcase[c2]);
 		}
-		if (c1 < 64 && legal_ansi_char_array[c1] & 8)
-			return err_val;
+		if (check_invalid && c1 < 64 && legal_ansi_char_array[c1] & 8)
+			return -EINVAL;
 		if (c1 < c2)
 			return -1;
 		if (c1 > c2)
@@ -111,8 +113,8 @@ int ntfs_collate_names(const __le16 *name1, const u32 name1_len,
 		return 0;
 	/* name1_len > name2_len */
 	c1 = le16_to_cpu(*name1);
-	if (c1 < 64 && legal_ansi_char_array[c1] & 8)
-		return err_val;
+	if (check_invalid && c1 < 64 && legal_ansi_char_array[c1] & 8)
+		return -EINVAL;
 	return 1;
 }
 
@@ -191,14 +193,23 @@ int ntfs_ucsncasecmp(const __le16 *s1, const __le16 *s2, size_t n,
 
 int ntfs_file_compare_values(const struct file_name_attr *file_name_attr1,
 		const struct file_name_attr *file_name_attr2,
-		const int err_val, const u32 ic,
+		const bool check_invalid, const u32 ic,
 		const __le16 *upcase, const u32 upcase_len)
 {
+	bool compare_check = check_invalid;
+
+	/*
+	 * POSIX file names may contain characters that are invalid in the
+	 * Windows namespace, so compare them without treating them as errors.
+	 */
+	if (file_name_attr1->file_name_type == FILE_NAME_POSIX)
+		compare_check = false;
+
 	return ntfs_collate_names((__le16 *)&file_name_attr1->file_name,
 			file_name_attr1->file_name_length,
 			(__le16 *)&file_name_attr2->file_name,
 			file_name_attr2->file_name_length,
-			err_val, ic, upcase, upcase_len);
+			compare_check, ic, upcase, upcase_len);
 }
 
 /*
-- 
2.51.0

