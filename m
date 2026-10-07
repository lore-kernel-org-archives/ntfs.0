Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD8A3C8C68
	for <ntfs@lists.linux.dev>; Wed,  7 Oct 2026 13:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379155; cv=none; b=Id8CRl2Fb/Hob4i8oi7Ey66PFWLldvhn+vsOS7yVsuQgPnWsBrV19s+3HdJdc48CTzWIMbsFhjJke1F0IErlyCXysRa2hXjWewDLwjSpCi0EeFPlZyJQ+vRfWeMxzbxhbGhzcp5+O8nlLQBCczJnCV+KAHUBj6s/4Tvb1omsfNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379155; c=relaxed/simple;
	bh=xTpJFE5gQLPszgHGsiDE/h57b5+w+eiTGuW9SsFvCHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tlno3Xxun2eZ8SZksk/LA3N8CQQOzQqU+AoWiTKgjh7XYAYXAJvoeGAXi3RQ6a0b6Kq2dBx/2gjRWi81R+ltol79CJaRiZBT+9OKbcrwkW4rcy3f+F/4CXOStQe8vzCA6Vk7HCvqRr+/J+K/ABp428uuTXYBrJkWrK7sG/QtkhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiBWq7jy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiBWq7jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881F91F0089E;
	Wed,  7 Oct 2026 13:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791379145;
	bh=hmcD/JZFWzBHazNc4IqG1d33c1PYwAVswzTWex/V25Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kiBWq7jy20I0PVVjBLjxygSOqEF3LupPIntJgFycrqRdNWUbVkFbcCYGlol55XT/x
	 QLL76Il7n15HYi5wdcyM0q7t0+0NyTRBrkA6FZI7d8pWoS07PM+YXPCpVDNWPlMzY0
	 l0c1IG68xYW2QSFua9Jb7zELx3x758EsoTG+avAPAP8QZZthKxPMOeVB1DxvNiBdkt
	 Jm+uw/9uulWzv1MZHJ0FrbDYD6rk3cdX4U6EUDH4LSJzNvEnVzj4ibRIx2agWb0ah1
	 3Fx+K0xFhtmcbusuWigCqQECrQXkbwzNS+Z8/JGgWPlEcDqX8igdroPoWEz4cme9q7
	 Wiwc80WmtEEqg==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 4/4] ntfs: propagate EA truncate errors
Date: Wed,  7 Oct 2026 22:18:44 +0900
Message-Id: <20261007131844.8013-4-linkinjeon@kernel.org>
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

Propagate errors from truncating an EA stream so callers do not
report a successful xattr update after a failed resize.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/ea.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index b4fcfbe2da4c..ff69fb07f84a 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -37,7 +37,7 @@ static int ntfs_write_ea(struct ntfs_inode *ni, __le32 type, char *value, s64 ea
 		struct ntfs_inode *ea_ni = NTFS_I(ea_vi);
 
 		if (need_truncate && ea_ni->data_size > ea_off + ea_size)
-			ntfs_attr_truncate(ea_ni, ea_off + ea_size);
+			err = ntfs_attr_truncate(ea_ni, ea_off + ea_size);
 		mark_mft_record_dirty(ni);
 	}
 
-- 
2.25.1

