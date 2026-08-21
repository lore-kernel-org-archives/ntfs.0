Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84205403B1E
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290389; cv=none; b=hauLc8Ta7/BgarUnFNmAeCCbuWi9JRyJl0TzM2zHdYjTNPbKYdng9CO7QAhs1qB/ShZA8hFY++X+WaiXgr8+X5CxGWRcGUTS+4NE3bpi8GdUaMqdr7c3pAbazlm8zJb5jg30E2KrKzzWktJFB11MZFFKMjXf4IQVTA5fNICOtO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290389; c=relaxed/simple;
	bh=vXZ82cIJl30J/lUUuNAiztPZPzHrSOIFtnVNeXs7Fic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPohTQcGe39/A73Xo9hgOr0r/WjPHm/xqZDd98XOKzRGWZxWQdQND3CXMzOcZQdM+uvG0VdS2VPgulKVA506NY+wzsJRbdO1LSy962hUzu/iFC3tDWEHKYhcz+/hrfoIcimFfbM1ul/rtPJF/HSBDDRUZffU4EjKRRqGVDUdNkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VcR1qGOB; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VcR1qGOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=t9
	QYEKYGLGk6E0NVSSKqtALxrXdnw0JG/Gs8KcVSN7M=; b=VcR1qGOBgHkpiYsEpH
	7xe4QgJKMlmSCQNHW+L3nTdgowOIln4MnYTp49rBkSHUT3yoBvj1HRK3ksZBqXAo
	T5OvCkxZ0ydH9qyG0RAC/z42CZHua0JubiAfDX2Jd/9jRBkpensyR2FL4VvA7q6x
	Ne9IGt+F3Iwx9xisftD6fRgLU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzHn44odqtfQKPQ--.8742S9;
	Fri, 21 Aug 2026 13:32:54 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 7/9] ntfs: fix kmap_local leak in write_mft_record_nolock() error paths
Date: Fri, 21 Aug 2026 13:32:36 +0800
Message-ID: <20260821053238.1281310-8-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260821053238.1281310-1-liubaolin12138@163.com>
References: <20260821053238.1281310-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnzHn44odqtfQKPQ--.8742S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4xXFWxKrWxGr43Cw4UJwb_yoW8Gr45pF
	ZIkwn7Kw4ktr17KwsrKF4Yyay2k3s3GayUWw4kWw12krs5tw1qvanxta4kXryfKFW5Kw48
	trZ293y3XFyUZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_UUUnUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgZ2QWqH4wajjAAA3U

From: Baolin Liu <liubaolin@kylinos.cn>

write_mft_record_nolock() maps the MFT record folio with
kmap_local_folio(), but the pre_write_mst_fixup() and
bio_add_folio() failure paths jump to the error label without
unmapping it. kmap_local mappings are stack-ordered per task, so
leaking one corrupts the nesting for any outer mapping.

Unmap the folio on those error paths too.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/mft.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 984a0827f9ac..69b007e574fc 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -580,7 +580,7 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	err = pre_write_mst_fixup((struct ntfs_record *)fixup_m, vol->mft_record_size);
 	if (err) {
 		ntfs_error(vol->sb, "Failed to apply mst fixups!");
-		goto err_out;
+		goto unmap_err_out;
 	}
 
 	folio_size = vol->mft_record_size / ni->mft_lcn_count;
@@ -645,6 +645,8 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	return 0;
 put_bio_out:
 	bio_put(bio);
+unmap_err_out:
+	kunmap_local(kaddr);
 err_out:
 	/*
 	 * The caller should mark the base inode as bad so no more I/O
-- 
2.51.0

