Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F001D4C10EF
	for <ntfs@lists.linux.dev>; Tue, 22 Sep 2026 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057975; cv=none; b=mpi0bu9TnxYQ6LqKvXBZAwwujH3+mhrazph88LZU247CRwHiV9pQzM9dpDeBOlWz8cnEIhvgoRIRRTltttvqbRIyHF3TTb74e/7KsRxEm6+xuPMeU9EQHyCo1wiHGrIrZGZoMHrpLjLesjsR6jXMRdPqBjhFkb7fQNxyO9tsppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057975; c=relaxed/simple;
	bh=wKTZyvC4GDlfM8QTkr/pZ27VWhbderGzHNthxtVp1bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eIPspOSpjcN1o2HjCAHQQKUZJ7Ikr4MvbYD9SXb0pI0B69NOQedkglHnWEj5QvsilpxLCnymgkvVckucqSnxo6waMMn/KeaIcZoNg5/p6UZIJ3YWq2rXjIKRgoMhehHtWmSaNGRsfID44M83GdBpcJFTKGl2aqyLavi51/BpKRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjZgDMLV; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjZgDMLV"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc515bef69dso2474351a12.2
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 23:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790057973; x=1790662773; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekWaF+D918WGEMLNsJNwOqPuyVUIujbv/+Fa9sy9oCQ=;
        b=bjZgDMLVjL4MUEor6yQdQWFuWQPsfea9tAUwmG3shXWWIA4CCimXxg65oHxzaX9uZY
         IBZLWHX5U5JM0iseJyIPf5Hx69BV2oYQLNq612DGsueqLE/l08+JHwuGxj4vY5bVExgE
         V+S5jECmp2wRbMxeoT63/IE6gf/9343TJbaKYFAnnw/XQcFBkl+NsXCMVGFisVzmAK8S
         TU+0Piy8XAsMAVjbPd8blcq5wcftwx3TE6n6+6FykrR+wSc7stwkVScPyXP+iv/XB2q3
         Ft/keEod/v/NDvn6wub/hBs1JKURVFae6F0zHQN/zSjLjrPmB4W3mcOU9OyjvrvZvDzp
         DsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057973; x=1790662773;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ekWaF+D918WGEMLNsJNwOqPuyVUIujbv/+Fa9sy9oCQ=;
        b=dOTdBzZvBQewyRNS/NahFyPnfWMiOjNFjDgYBIFtunG6GzPdfq48/Kx60e6d7LHDNN
         COdgGgwzc3cB/u9xuKWLT8dtwCKduVTKhTjHBFw1s/tEh/htfPPXjoc5CKLShQ26sm2A
         Qv107+h6qcv1frSDaPk7XcXvWrvV2Xg9pWX0lgBIchrp4JH3yEqT0NqN/CmkQFzHJZCo
         PfqZ3U5yZ8aG3QYKwwKbi597peFcNuJFtnKLl2SoEp0SY3cDxI//VIB8QxZza/lL7O+J
         La9N3on8KN1Wf2VXA/mjWBSJs1mq3MYaIM+bVtyRkfshxfuszGAbFy24RsZmjMriVrdt
         BZwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjQdp3cS7jrHOu/v7CVJGgTdxqIzxSJZARQeNhaGRet9qabNzICwq6vs82NQBGchnoKgTN@lists.linux.dev
X-Gm-Message-State: AFuF++k4xLSapQT3E07bmla7hbm7xua5et+d73cLOJSNFPqWNmVQMqEf
	Fcb5lqNRTl4EL0FcbdibLlUUjPeIWtx+S5CzKeSl8rKQSCGpT9cLPcF+
X-Gm-Gg: AYBFou1OLqDMG/JP6oRqeo2ZgfXJ063fuKyOSn42itAMJ6Po4lGMfzKNj87LhnbA3Cp
	4z1WJ25JQSI380p9jJvMg55uCl7BbyT8W8ERVyTaDGuMB1NaND9A7DXsoExdgRooX6M+KVWjyOv
	kratO60aw9E2ZyCDm9+9rFdp7FtJDMFM9mJwwpNTuHnHPpaUXlUVvn18RqBrN7pc0cw7EEhVPXd
	hh7PrrOhHWjAbpwWx97Op3Yvhz1UE/Bntl7fumuQzIVeWDDpwH+FCiovhyt4vtUiCf/Q48Bk3Lj
	TR8cu3DtAUPudh6ry4g1uXc8HS0dV0VAuaEu288r1Crfe0bFEeBd+gxuW30GSakZnXlUVtAW1Vv
	VJBo2pDK39iH2ue93nHQzYSIt1mUtXvHGYGggd/yLGmvRKpviRv/9OqPl213XBEx8xemCF/U35r
	lY/hlwXGeq172gBI+VVVq4G0SmMJIdsha9sMNBG45C6RPNQpseciNTOMEdI1YOa6vsQ0GmV6lh3
	Yi0
X-Received: by 2002:a17:90b:554d:b0:39e:6c6a:2095 with SMTP id 98e67ed59e1d1-3a073267c1fmr147219a91.54.1790057973140;
        Mon, 21 Sep 2026 23:19:33 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06cba762fsm552761a91.4.2026.09.21.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:19:32 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	Robert Morris <rtm@mit.edu>
Subject: [PATCH] ntfs: validate attribute-list sizes before allocation
Date: Tue, 22 Sep 2026 15:18:33 +0900
Message-ID: <20260922-fix-attrlist-size-limit-v1-1-c7e10b6c5656@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5003; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=wKTZyvC4GDlfM8QTkr/pZ27VWhbderGzHNthxtVp1bE=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsh2t0icPOXDp+NCfT2S/PKcpugCuR4TEI/Xub
 s0m3an5pY+JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarIdrQAKCRA08jD6945I
 04IHEADFgJ3gFKy45xHit51pmuUQuFzi8AWj5jzPmt+Ioi9bmjbSgC3nQa6SKeDQUqDUFoUL0Ys
 uH83oCRi97QZ9qWVOo+A2cACMd3R5Yx0At1qQMv0qip+NEHUPrZnBEMrUwHeUy969gyTJkx7ufr
 tXqERfBQsWXIplbDpFCShP8VLL69dRQT2MnMlRnwaBcLyspTmSYDO482Rxnb5WcLWyESDuVeKKj
 8e6s+43xaB6d2juRl5Mq0LQXDC0zs3RW4lF5cTiVH8ncRSf5LUUb487DSt+iGRHVMjnJkLUBv5o
 P9JBX5b8rakUnu+NAJ9kET9HCot7aBghuUYP2ysgAk+4oiepUNEUFUNg1nRRr4NfuCxyHCUN810
 KVVa4i0Y7GhWN6pRv/NDRNKUpVfo1OwvnrW1xOZj+vSC8rdZiFyTcvf21cdHbxX54CIlD/6e6S4
 wZ25UlwbyOLgp3ZrREFZYAi0ju0U0wvTYgAdKuJtKF4irMnttugimFMLa86aM7Bq0lPwbd2+Y+f
 uqiGP8FD0UlhjvSx1WmdASCfW+49Yti6Amr+e6bZNeE3iOtc8vsMKhiuUDeHq9xctXarzqNYCn3
 iDlh9/Y3wmfcizmLC8M/FQeIZqTjL104I6Z9y4enmBl6OYXqyr7cK2TeYiCyX3RnMEPiDmNkfEU Z8+ktkMDJgnBozw==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

The NULL point dereference could occur when an on-disk
$ATTRIBUTE_LIST size was truncated before it was validated and allocated.

To fix this issue and prevent excessive memory allocation, limit the
$ATTRIBUTE_LIST size to 256 KiB.

The following existing implementation and Windows test provide evidence
for this 256 KiB compatibility limit:

NTFS already treats 256 KiB as the $ATTRIBUTE_LIST limit in its
attribute-size checks and $MFT attribute list repack/expand paths.

For additional Windows testing, when $MFT's attribute-list data_size was
above 256 KiB, Windows attached the disk partition but did not mount a NTFS
volume and target access failed.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Link: https://lore.kernel.org/ntfs/88468.1790006025@30-10-12.wireless.csail.mit.edu/T/#u
Cc: stable@vger.kernel.org
Cc: Robert Morris <rtm@mit.edu>
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/attrib.c   |  2 +-
 fs/ntfs/attrlist.c |  2 --
 fs/ntfs/inode.c    | 21 +++++++++++++++------
 fs/ntfs/ntfs.h     |  2 ++
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index d8dd40526c3b..333b3371acb4 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -1775,7 +1775,7 @@ int ntfs_attr_size_bounds_check(const struct ntfs_volume *vol, const __le32 type
 	 * $ATTRIBUTE_LIST has a maximum size of 256kiB, but this is not
 	 * listed in $AttrDef.
 	 */
-	if (unlikely(type == AT_ATTRIBUTE_LIST && size > 256 * 1024))
+	if (unlikely(type == AT_ATTRIBUTE_LIST && size > NTFS_MAX_ATTR_LIST_SIZE))
 		return -ERANGE;
 	/* Get the $AttrDef entry for the attribute @type. */
 	ad = ntfs_attr_find_in_attrdef(vol, type);
diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index 7c09d02fd941..1bbd2bc62c58 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -14,8 +14,6 @@
 #include "attrlist.h"
 #include "lcnalloc.h"
 
-#define NTFS_MAX_ATTR_LIST_SIZE	(256 * 1024)
-
 /*
  * ntfs_attrlist_need - check whether inode need attribute list
  * @ni:	opened ntfs inode for which perform check
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index cadf623d54d4..99232a94cac0 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -805,6 +805,8 @@ static int ntfs_read_locked_inode(struct inode *vi)
 			goto unm_err_out;
 		}
 	} else {
+		s64 attr_list_size;
+
 		if (vi->i_ino == FILE_MFT)
 			goto skip_attr_list_load;
 		ntfs_debug("Attribute list found in inode 0x%llx.", ni->mft_no);
@@ -827,11 +829,14 @@ static int ntfs_read_locked_inode(struct inode *vi)
 				ni->mft_no);
 		}
 		/* Now allocate memory for the attribute list. */
-		ni->attr_list_size = (u32)ntfs_attr_size(a);
-		if (!ni->attr_list_size) {
-			ntfs_error(vi->i_sb, "Attr_list_size is zero");
+		attr_list_size = ntfs_attr_size(a);
+		if (attr_list_size <= 0 ||
+		    attr_list_size > NTFS_MAX_ATTR_LIST_SIZE) {
+			ntfs_error(vi->i_sb, "Invalid attribute list size %lld (mft_no 0x%llx).",
+				   (long long)attr_list_size, ni->mft_no);
 			goto unm_err_out;
 		}
+		ni->attr_list_size = (u32)attr_list_size;
 		ni->attr_list = kvzalloc(ni->attr_list_size, GFP_NOFS);
 		if (!ni->attr_list) {
 			ntfs_error(vi->i_sb,
@@ -1955,6 +1960,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 	} else /* if (!err) */ {
 		struct attr_list_entry *al_entry, *next_al_entry;
 		u8 *al_end;
+		s64 attr_list_size;
 		static const char *es = "  Not allowed.  $MFT is corrupt.  You should run chkdsk.";
 
 		ntfs_debug("Attribute list attribute found in $MFT.");
@@ -1978,11 +1984,14 @@ int ntfs_read_inode_mount(struct inode *vi)
 				"Resident attribute list attribute in $MFT system file is marked encrypted/sparse which is not true.  However, Windows allows this and chkdsk does not detect or correct it so we will just ignore the invalid flags and pretend they are not set.");
 		}
 		/* Now allocate memory for the attribute list. */
-		ni->attr_list_size = (u32)ntfs_attr_size(a);
-		if (!ni->attr_list_size) {
-			ntfs_error(sb, "Attr_list_size is zero");
+		attr_list_size = ntfs_attr_size(a);
+		if (attr_list_size <= 0 ||
+		    attr_list_size > NTFS_MAX_ATTR_LIST_SIZE) {
+			ntfs_error(sb, "Invalid attribute list size %lld (mft_no 0x%llx).%s",
+				   (long long)attr_list_size, ni->mft_no, es);
 			goto put_err_out;
 		}
+		ni->attr_list_size = (u32)attr_list_size;
 		ni->attr_list = kvzalloc(round_up(ni->attr_list_size, SECTOR_SIZE),
 					 GFP_NOFS);
 		if (!ni->attr_list) {
diff --git a/fs/ntfs/ntfs.h b/fs/ntfs/ntfs.h
index dd56894762a9..9557a5c36b81 100644
--- a/fs/ntfs/ntfs.h
+++ b/fs/ntfs/ntfs.h
@@ -80,6 +80,8 @@ enum {
 	NTFS_MAX_LABEL_LEN	= 128,
 };
 
+#define NTFS_MAX_ATTR_LIST_SIZE	(256 * 1024)
+
 enum {
 	CASE_SENSITIVE = 0,
 	IGNORE_CASE = 1,

---
base-commit: 444c7dc82415a353b57e43189f276124cc5fd785
change-id: 20260922-fix-attrlist-size-limit-a2a6a02feebb

Best regards,
-- 
Thanks,
Hyunchul

