Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093734;
	b=gJih5VXRm/pa5KTZB3IFcRNmb5SsRwV5uRu3sejJGTEiGKtNJp75TTdBmv9fYBo/UPAJ
	 KEo6UW9MCoM2p6xvjUl3H/+0PM3MrT0Qbw9juSR7T3VUMAxMDvxb9RvCDctkxePLcrt7L
	 lqcGVi6T58QnB0Sgwk34NalyF7RiLr4RhtwgGGr/gnSCeHoy/cSQ0E+7cmavMFm1bS6Wz
	 m0CtHk7SraIjEqK03leTnf5vzhMJ5bp5IAnYA8QgRkl0f+MBVQDNb31olz9vbPetBXwI/
	 agI/JESF8WfVsY+CbtX0eALtHqlVHcipChmln4mrtWs0qeoV2kzvH4kFReuPYgv+qGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093734;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9PFg1tiFxtrMY3H3LlJpJ8GZvRMHcfHEPOcGYZAAP8I=;
	b=mMJLt8P1/iiQp5WwYAdBJt0cpNXSioL8BCzKMmg9WOGE0Dqetlp0l0k7qZ0TmBQJm4FB
	 uyXCVJDmH99VEB0B1DaMsW89J7e6RttmMroPb12qt5qq30fpIYRipMRgRAu/Ry3lewlyz
	 VbXUObEoWpKeKxlBjkygk/UYvI1+cdNURb324uAacqwGrumlag47cOprbKQsvmlU2sMv/
	 tJi+87bsXgkVledEvAskChihLFXKAivDwPSYIqD4VJ7N9s9hyGxsj5MAEs04unjlC3vxL
	 ymSnMlu8avSL5uSO0WWwEIAe+eaKE4kKJ0zYxW9uy6K3fhDPXpEmdfvbm3bHARNBaeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ow5KUI8g;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B0B606A328
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 09:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B0B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ow5KUI8g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9P
	Fg1tiFxtrMY3H3LlJpJ8GZvRMHcfHEPOcGYZAAP8I=; b=Ow5KUI8gBHEyjgPA00
	9HgdRwMKZDMwS87xncR0jHj/0ibsWfXxk/A7mbjfn//1Qlu5Iq7gCOrRDtb4slse
	i+MA4KtqvQjzWBdKkqzhOWAWl+OQ9/nEZcC8gBULd7Qz69TbVzjxK7xEQQyLWfQR
	5xYOTjsyI4VryWoEBzfHT4sOg=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD33xFVcOBqdMGFDQ--.18497S4;
	Tue, 27 Oct 2026 17:35:19 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1 2/5] ntfs: preserve timestamps when creating hard links
Date: Tue, 27 Oct 2026 17:35:12 +0800
Message-ID: <20261027093515.344799-3-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33xFVcOBqdMGFDQ--.18497S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4fZrW5Gr45Jr1DGryUWrg_yoW8Wryrpr
	W3J34DKwn5CrW7u392yFsrXFn2gayxWF4xJFZ8A3W7Awn8KFnaqF1rtryUX3WfAr95Wr12
	grsYg34UXryYyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jk2-nUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RcEzmrgcFdKfgAA3t

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_link() resets atime, mtime and ctime on both the source file and
the destination directory after creating a hard link. This overwrites
the source file's atime and mtime and the directory's atime.

Update only the source ctime and the destination directory mtime/ctime.
Mark both inodes dirty so these changes are queued for writeback instead
of relying on the earlier FILE_NAME write.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested with the complete five-patch series in QEMU. Explicitly assigned
atime and mtime are preserved across ordinary hard-link creation and
O_TMPFILE publication. A separate persistence check set and synced
atime/mtime on the published file, then verified those values after
cache eviction, remount and a fresh boot.

 fs/ntfs/namei.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 0c84a5c..4442e1d 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1663,12 +1663,13 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 	}
 
 	inode_inc_iversion(dir);
-	simple_inode_init_ts(dir);
+	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
+	mark_inode_dirty(dir);
 
 	inode_inc_iversion(vi);
-	simple_inode_init_ts(vi);
+	inode_set_ctime_current(vi);
+	mark_inode_dirty(vi);
 
-	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
 	d_instantiate(dentry, vi);
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);

