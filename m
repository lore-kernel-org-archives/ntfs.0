Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BC134A3BF
	for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893126; cv=none; b=c2i9jPpjVd6ArFpWhe2e8CVLkZz20n7xqVZ/+Gi3p+GA1hcLSU7xgvbZcsKR+1xwkv7X4nOk58vSRb+AwGEttkVS7rVeL0aUCz4XNIafdQB1FxM7U+WnRzHia8vS0PEXbrh6O7HZhcWEk4YadeG068DD+OLA99JxfIzKBR9T4Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893126; c=relaxed/simple;
	bh=6VmmV/JuhqxQc7xBKPMLln2fs1lFZm9Xd7P0G/mSW1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eikNI4tGptTqFzlJVcYGcILjpo2edzvRhyP8gjUA77johVWJfHunAYDOJijzIYkSW9SDE7hjaO/T2Elq7Xq0B7OjB4Uxqn4gyaN5Kw7sxNxFtzpALlPFM2uPHS25kxnGZeLTINYr/hR6GqxeMfrsEP0q2Yi9cXL0HulpAHaxTaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=l59vCU3p; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="l59vCU3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5O
	ANPeAoJ3qwbO5lpNbD5qpk2dFx16dUqLcV09Tdn5A=; b=l59vCU3p04ceG1uPEh
	L3plUXmaqP/es9PyTJ6dl5nP5PE9ly58GZbLyHRiWOYydFqj4deBAh35hZ3L/SSs
	tFTHWZwcr+MgYX3P5DVqQkM2OAdg34adJztLfnoK8ZvM/ypZ2/fRqL31BueL0cFb
	jcN5jUHBRvVtQJEBPuBW/WxQY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S3;
	Sun, 20 Sep 2026 16:31:38 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 01/10] ntfs: keep the EA presence flag after creating the first entry
Date: Sun, 20 Sep 2026 16:31:22 +0800
Message-ID: <20260920083131.1880061-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260920083131.1880061-1-liubaolin12138@163.com>
References: <20260920083131.1880061-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWrXr15WF15CF4xAFyrZwb_yoWfAFb_Wa
	yxZr4kKw1Utrn3C3Z7GryY9r4SqF4qkr1qqr95tFs7XayDtws0krWkuws5uF4DC3yUtrZ8
	uryvg34UJrs5WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8iZ23UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQon8WqvmeoLXwAA3-

From: Baolin Liu <liubaolin@kylinos.cn>

The successful EA update path tests ea_info_qsize when updating
NInoHasEA, but this size excludes the appended entry. Creating the first
EA, or replacing the only entry, can therefore clear the cached presence
flag despite a successful update. Reads then return ENODATA until reload.

Include the appended entry in the size used for the presence test.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/ea.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index b4fcfbe2da4c..bb97df3045a0 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -402,6 +402,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 
 	if (packed_ea_size)
 		*packed_ea_size = p_ea_info->ea_length;
+	ea_info_qsize += new_ea_size;
 	mark_mft_record_dirty(ni);
 out:
 	if (!err) {
-- 
2.51.0

