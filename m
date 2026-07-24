Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B20A35CBCB
	for <ntfs@lists.linux.dev>; Fri, 24 Jul 2026 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908159; cv=none; b=R6v0j3rCQ7uvRYY1XK4bu4kyorqB4V04fsUirARKzdemB75uCSCVYw12ArCUcZkZFp3pkBa5H6L5zHEpM+Rk54yaR12ZDcoicz8//fj4yupBzTo0nJ8SaZQtDm2c8xmIcIVcUVcvnwdxdbFehbJM0fIeRHyHQtINvZ4x9bmpbFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908159; c=relaxed/simple;
	bh=Kid7kzjyiJZq0fsr4zMbqPNB89s1nKUByOuHDd8rrXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=idy/Us81HnKqX1e7Fxog7jkRw8KcD5b2YxGBZ//cfu5Oqd1buaOUWQBLPQkSsTfn/t/Yjl18l/6ryeu1bmPsoT2Qw8Ndbvx4StJV2cbBOfAul6v+IkJO0NFdX7f+cAeX3BsQ9Cd244W4FIfYPyw4V5MHcG7d9DxMA79giIjqmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsY7lRNN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsY7lRNN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACC91F00A3A;
	Fri, 24 Jul 2026 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784908155;
	bh=uBb4HcecEgoHT0K8PXoDUp1+Ikfs2wdQmL9aptR0ad4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GsY7lRNNEDkjL0XckULs94KOL0WQuLTHbYx1jrcPO+nAws+Pi8YC70e/dtzUAf/om
	 gNyoA7YI7UFM0szmbtXjI9xrSRcRae0jj+lQEXiajREUVpn1XDe/SdUpjWo9uiJWQU
	 cCE3yIQfa7SAWK7MMbtRIXP1idx+Y0xhKeWM8eXL1tqdh9Lk52GV8o6cncVTDoJfmT
	 4xE4GVBD0b/wfU+nMQkIqGiG/632psKJ/1cdX5SeRPJF8ChfrlLQRNOsuLOt4TBbkb
	 hnIiWJO35jB6vtzOV7pvGmWPGXccna6nQq2sjGDkisl9gO/L0jn9d4KzbUEQHUFSQS
	 BCNhD58/5uL3A==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 2/2] ntfs: preserve chmod mode before applying mount masks
Date: Sat, 25 Jul 2026 00:49:00 +0900
Message-Id: <20260724154900.21524-2-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260724154900.21524-1-linkinjeon@kernel.org>
References: <20260724154900.21524-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fmask and dmask must continue to constrain the effective permissions
of every file on a mount. Applying either mask before persisting an
ATTR_MODE change, however, stores the masked mode in . later remount with
a less restrictive mask then cannot restore the mode that chmod requested.

Store the requested mode in  first, then apply the mount mask to
the in-memory inode. This retains the mount-wide access restriction
without making it permanent. Also return failures while writing the
WSL inode EA to the caller.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/file.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index c8e49f83fd92..a6855d62e1fc 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -342,14 +342,17 @@ int ntfs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		if (ia_valid & ATTR_MODE)
 			flags |= NTFS_EA_MODE;
 
+		mutex_lock(&ni->mrec_lock);
+		err = ntfs_ea_set_wsl_inode(vi, 0, NULL, flags);
+		mutex_unlock(&ni->mrec_lock);
+		if (err)
+			goto out;
+
+		/* Apply mount masks after saving the unmasked POSIX mode. */
 		if (S_ISDIR(vi->i_mode))
 			vi->i_mode &= ~vol->dmask;
 		else
 			vi->i_mode &= ~vol->fmask;
-
-		mutex_lock(&ni->mrec_lock);
-		ntfs_ea_set_wsl_inode(vi, 0, NULL, flags);
-		mutex_unlock(&ni->mrec_lock);
 	}
 
 	mark_inode_dirty(vi);
-- 
2.25.1

