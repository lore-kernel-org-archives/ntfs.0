Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FA4446062
	for <ntfs@lists.linux.dev>; Wed,  7 Oct 2026 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379151; cv=none; b=S/JTyVp8SMGpBD6hdr3bgdPrA3RNwkAOg/nHOv3R3uSoMRTvePPgbBOYBHQluxbzyodvJTYfGuqW1/b/nfcU5A7+whTrqXGUviLI1A8wN4lvlAnO488GqrEQh4tG7MkeLJ8p7NN917nwMBdDhgHlkD6+ZpsCoKprRc37+hMIGg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379151; c=relaxed/simple;
	bh=Sxk8rt+d2hC0zq6dCWlNICtkyNwW0Gxwag3H4Q10gHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s17l8l7Zp467rHrU6UQYwXzrwz0cCom5hJgF8y19Wgqam99Kuz4qqRoUGUYluZ6Te9kPFN9Do3ol7ONzMb0WuyW9gnLv6QLruAxulSfoiOFSF8k3uaSUFlIp4cYyMdwhDABEwuMadI+Yru1aIkYmtTYHpb7r0hH+hjGkhCNBuMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WklIVc1s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WklIVc1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E651F0089C;
	Wed,  7 Oct 2026 13:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791379141;
	bh=NeBIn7ZrEXgaSAGB+YN3E+h6ph2g4yByPxIsg2zBfUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WklIVc1s+kxR7fe1Td5112NzAY2fHdRB8BAgSQT/e6TIdhczeCGA9h3ds8DgLOrMB
	 drnJQBvyZ1f8/k7uSerHX2T9rtah9BDQsfhlInTLem5IzaGbcKjd8ybbEtOKASbkxb
	 8Ih0adBlneRLJgwSn6N8SWOB6NbWFN43tE0+CV37VYJMQkD7XfxByPKu2ZEsCBU99F
	 A4RtyK9NKI4g35Kb4ysdCKDSEynx5pQDODfdOcmyODvUO5nNx28D4RJGg0Uz9nHWxk
	 4LMZjcRjfjpfj+gzRs7QGUxlp9A2V7zA+8VMEtWCrHD6M3beFV+EIpyPC3wZjIHjtw
	 pPl8OQpSjnFXA==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 2/4] ntfs: sync attribute inode size after resize
Date: Wed,  7 Oct 2026 22:18:42 +0900
Message-Id: <20261007131844.8013-2-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261007131844.8013-1-linkinjeon@kernel.org>
References: <20261007131844.8013-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Internal attribute truncation bypasses truncate_setsize(), so successful
resizes must update the attribute inode's i_size. Restrict the update to
attribute inodes to keep KEEP_SIZE fallocate from changing a file's i_size.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/attrib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 4df618abc4ef..07414a20b7de 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -5187,6 +5187,8 @@ int ntfs_attr_truncate_i_locked(struct ntfs_inode *ni, const s64 newsize,
 					ni, newsize, locked_ni, false);
 	} else
 		err = ntfs_resident_attr_resize(ni, newsize, 0, holes);
+	if (!err && NInoAttr(ni))
+		i_size_write(VFS_I(ni), newsize);
 	ntfs_debug("Return status %d\n", err);
 	return err;
 }
-- 
2.25.1

