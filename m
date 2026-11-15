Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749263;
	b=bokrsBp5CzjyJ/KI8flas81Ao3MY6WCO0rc38aLH0pK5oyxEqSsMuj3D3hwt1njmjVds
	 tswYaAnWYwMJ6MnBMCIKxL3y0oth4Z0AveFZ0zKM6BBLB3NOknrmrZOoPFGArSLYWcScX
	 A/m/li2EAmtWDf+OY+qM7xP8Qz6kSW0TA/E/DORPWVHwh8IGAMNO2hB11xF2xq7taeorM
	 fAkDR3FzeSKCfQYdigEQI7mHIJL3SlN5Kgz0dN546znT6YMsZ/s3yohkAY2WaPRe4JrLq
	 JWkInVBIjhKx3YEiajaYJ6Lqt7vVJ2RPe2OjpODzFuFkL46K95HqorHxI0XvLJmij+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749263;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=RcSJMzTllFpoqlcqD030BZbd0w78HeFLQAwQPSIp/eM=;
	b=WDvutM/J8r2gMCrAzfefNbxF9m4+q7QW+vFEiOyIFLKQ5bULJn9b+g06AGR88GE56C3K
	 uezGsc+NJNBbzz3a74a+dOI6rlGxJbJGafiCCYSpGmw25O9AjxpKoGg/LfBP7B/1ss/LM
	 IHbpedqLXwN93A0MkEnIqjQIu+53QRIbZTSZA+RLbBuJSuzlCyYbfWULf0z3Ii6vZh71l
	 caerAaHtqNkltSZkg4SodjT8uSCs0WTgpGOwuHLKG+CFwHPrJ1nMjEH560tTLpNEYZdlk
	 vITvOeSDHOXUBfg5/HXTGQ1mJPzgruyqJvIze9/DlCMVTF8hjeiad8NvVRMz2WzR24g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J5y6xgZ0;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DADA60A380A
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DADA60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J5y6xgZ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Rc
	SJMzTllFpoqlcqD030BZbd0w78HeFLQAwQPSIp/eM=; b=J5y6xgZ0Ulyr91S7HW
	Uu+AF6ALf+4oiMe2jJHxfbQzSiZMTdl31ATptpuU5PYuv3CoGMB6N3aWRzBw6OSS
	ffDHGP9qdP5ITVYnP31+kOdaYDnsVwQdPOrIiXYmc+9IJXHuvy4fkQq3FFqbE5xQ
	6ii09kRw7KNVv4F0KIgdw4SSo=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXP_A1s_lqfjtyIQ--.47831S3;
	Sun, 15 Nov 2026 21:27:19 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 09/12] ntfs: initialize packed EA size when creating hard links
Date: Sun, 15 Nov 2026 21:26:06 +0800
Message-ID: <20261115132609.209957-10-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDXP_A1s_lqfjtyIQ--.47831S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4xtF1DAFyrKF1xGr1Utrb_yoW8ZrWUpF
	ZxGw1Fqa17XryagF9ayrZIva1fW397Ca1UGrs3Kr12k3ZYq3Z0ga4xKryUWrn3JFW8ua4Y
	qF4Yy3y7XryUZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwAwsUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hcT3Wr5szcKPAAA3S

From: Xuewen Wang <wangxuewen@kylinos.cn>

A new hard link has a zero packed EA size in its FILE_NAME even when
the source file already has extended attributes.

For files with EAs and no reparse point, read EA_INFORMATION and check
its attribute length before adding the name. Copy its ea_length into
the new FILE_NAME's packed_ea_size. Skip this assignment for reparse
points, where the same storage holds the reparse-point tag.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes since v3: add the Fixes tag; no code changes.

EAs remained readable after publication, cache eviction, remount and
reboot. Offline checks confirmed matching packed EA sizes in
EA_INFORMATION, FILE_NAME and directory index entries.

 fs/ntfs/namei.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 4d94e3012677..3eb2d57bef1b 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1332,6 +1332,24 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
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

