Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749194;
	b=O1goE5JUfP5YdGOkFyWs/GQvx1RoXmF366I8FZFWNZRYb78kxTvWiow0N8pL5GGZjJ94
	 l/n9ab0QA/pdl0/vBmjXBwFDg49/2q4xCe0WcMfO8hENYDHF65Ll/zA+zUOQ1OLXog1kL
	 Rue5komBRbTn3FSvK0CGIFsspQ576cwFoIp+a/0QTOmhlQYTKkuiqSFZOT7SZQ73vxDcV
	 RSxZQT/vNle87Dz4L+GNmozbbwF0VRzFo9ezOzyjPONExZLmgUHBBQ35V+TdPIekWuVcW
	 fOmCQiV6XAdjyfbS1wlm8CHmXGBZIRTrqgabjzhgP9EJdgszSwxD1lBZOQOsmkXtiGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749194;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=r3FCEkbHpguBbj6tYBETaEBD/jS71Hm5EM8ENzIuC98=;
	b=bFGHN8FIvJIWF0TZ27Ni+QPEs8xJ5JnGsaTItkOetNvazOxfBX/24sJirTRUsD91+jIR
	 M9y4FSSfhgkMRrG+7IOKe/4ow/oUjKe/g3yZWVDT1FA495dnRxQC9/jU3hOSKcx4bK2nt
	 m5rviJQAInl8w5INoVquUkxNoSlZ+4pAbA4nfsJ7F6oMYRlB6THR96w+cpbbHfHeDNJTG
	 qNy9sCi1dk7X71kJLqhljCwAzD6rglhGFlsgSCY97zUNa1uMnfx4v+PXfEelpnmDilYIF
	 XS/9VFfaJHHyJA9gTlCZv7kGiR5MwczrLGwyMYj1KRuqZ+g88MU5Uo3fSG/6LuLmUOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RPHlaL0Y;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371A606A31A
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B371A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RPHlaL0Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=r3
	FCEkbHpguBbj6tYBETaEBD/jS71Hm5EM8ENzIuC98=; b=RPHlaL0YY2PUFY9rl4
	LRATTk6ioWDBF1FjOnuFVllrDI6sFCwQGAwW4MAMEH3VucCNFftHKBT4MEquoT/x
	NZtIsTiokikgbJrkjOL/c22CulC1lwfU3YAGtJKWw/Jbrt6dFMs82kzElNw3wijy
	KsZErO1gXaqYHITJrATpw3HU4=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD33yHzsvlqXCkHHw--.36757S5;
	Sun, 15 Nov 2026 21:26:15 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 03/12] ntfs: discard reparse attributes when creation fails
Date: Sun, 15 Nov 2026 21:26:00 +0800
Message-ID: <20261115132609.209957-4-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33yHzsvlqXCkHHw--.36757S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1rKw1fJFW8uF4kArW3trb_yoW5JF18pa
	93u3yIkwn7X34I9rnakr4F9r12g3ykWF4UGr4UJ3WSywn5Kw1Sva4kKr1j9Fs3ArWrKryq
	qF4UtrnrJFZ8uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jdEfOUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RcDzWr5svdtWwAA3Q

From: Xuewen Wang <wangxuewen@kylinos.cn>

Creation rollback removes the reparse index entry but leaves the
REPARSE_POINT attribute inode cached. The inode retains the old base
inode and MFT sequence number after the MFT record is freed.

When the record is reused, later index removal can use that stale
sequence number and leave reparse index entries referring to freed
records. Remove the attribute after deleting its index entry, and drop
the returned inode reference after releasing the record locks.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
New in v4.

Injected FIFO creation failures after ACL and FILE_NAME setup with
512-byte/4 KiB clusters. Offline checks found no leftover reparse-index
entries or allocated MFT records; space counts and retries passed.

 fs/ntfs/namei.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index b46fe44b63b5..a84d7bc9bc28 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -429,6 +429,7 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	struct mft_record *ni_mrec, *dni_mrec;
 	struct super_block *sb = dir_ni->vol->sb;
 	struct inode *rollback_data_vi = NULL, *rollback_sd_vi = NULL;
+	struct inode *rollback_rp_vi = NULL;
 	__le64 parent_mft_ref;
 	u64 child_mft_ref;
 	__le16 ea_size;
@@ -740,8 +741,13 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 			ntfs_error(sb, "Failed to roll back DATA attribute.\n");
 	}
 
-	if (rollback_reparse)
-		ntfs_delete_reparse_index(ni);
+	if (rollback_reparse) {
+		if (ntfs_delete_reparse_index(ni) < 0)
+			ntfs_error(sb, "Failed to roll back reparse index entry.");
+		if (ntfs_attr_remove(ni, AT_REPARSE_POINT, AT_UNNAMED, 0,
+				     &rollback_rp_vi))
+			ntfs_error(sb, "Failed to roll back REPARSE_POINT attribute.");
+	}
 	/*
 	 * Free extent MFT records (should not exist any with current
 	 * ntfs_create implementation, but for any case if something will be
@@ -766,6 +772,8 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);
 
+	if (rollback_rp_vi)
+		iput(rollback_rp_vi);
 	if (rollback_data_vi)
 		iput(rollback_data_vi);
 	if (rollback_sd_vi)

