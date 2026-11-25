Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=182.48.54.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616335;
	b=AMF7KDTJrlsu0YUpALZsYg0O8d+SpwV2ZrWyHKz50I2OUjIZP9DGd3gx1MU1q0ywKp5v
	 YigR8Jzk7mYlvmBGXf7v7nwocVUqaQMIK8VTnEFDTxhz6aNbK6oKXcz0Wp5RDRHTXedzz
	 BZFiYxWOuP/j7xSy7HdH9vlXVlsmxYtuZANfJ1DB3lm/+1JFw4e1eO1inB3SgbKWCF2id
	 q2WHEs8sC4T1cgtHaI29+aYtgml+uaECM5MOqCivEJd3UYAoEM0b11e5DrjYEXQZGTzAu
	 pOoREmUhcMY2qoOEdQePlwoj8HjWQ6TkQjWS3cw+S4YZexDc7D7ZUEQOMrHQR7V/wAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616335;
	h=DMARC-Filter:Received:From:Date:To:Cc:Subject:Message-ID;
	bh=QUZRIzrCo3j2nKsGU8AWWA5KbeLJF/TXFpYUX5GHiD8=;
	b=ihHv7gLXjL61WIiwMzL4RqBWyZmIOW31E89NAnCR8QwmCikjePYAAXgJeMJk8ILDwyNX
	 I4/cMTd6Nc3x7zXK9fD5subZRfTsPlHDFReWzt8XQdP3sWvoTMyxTleHVHUTz23C6lW84
	 w+YvhLot87WKsw5Xlj/ivenIearOmhjhou/yMWKslvEFKjr1D1Fjkm7XHrekigqrBQGhX
	 1Wwd1ltAxcpPO1ZlcoSY5U12f0bFHKaSjX2xUkS8A8YJU3yND7ZHGulGTm/eiDK8y2++e
	 WAh0b4l/vFijuspCXhy7UUuudcmfX1WHKxuOTG6kPcGOFgQMQHdZCECbokfPGD+5CYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=snowrabbit.org;
	spf=pass smtp.mailfrom=snowrabbit.org;
	arc=none smtp.remote-ip=182.48.54.220
Received: from bambi.snowrabbit.org (bambi.snowrabbit.org [182.48.54.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15C1606A32D
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 14:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15C1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=snowrabbit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snowrabbit.org
Received: by bambi.snowrabbit.org (Postfix, from userid 3001)
	id 46984C9300; Wed, 25 Nov 2026 23:18:54 +0900 (JST)
From: Showta Ishizaki <zakinko@snowrabbit.org>
Date: Wed, 25 Nov 2026 23:18:20 +0900
To: Namjae Jeon <linkinjeon@kernel.org>,
    Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
    linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    Showta Ishizaki <zakinko@snowrabbit.org>
Subject: [PATCH] ntfs: keep i_size of a directory equal to its index root
Message-ID: <20261125-ntfs-01-v1@snowrabbit.org>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list

After mkdir, stat() gives a size of 0 for the directory until it is read
back from disk, where it gives the length of $INDEX_ROOT.
__ntfs_create() opens the index root but does not set i_size from it.

When the index root is moved out to an index block,
ntfs_ir_reparent() updates data_size but not i_size, which keeps the
length the root had before.

Set i_size in both, as ntfs_ir_truncate() does.

Without the patch a new directory was 0 bytes and became 48 after a
remount, and one with 300 files was 248 and became 56.  With it the sizes
are the same before and after.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Signed-off-by: Showta Ishizaki <zakinko@snowrabbit.org>
---
 fs/ntfs/index.c | 3 +++
 fs/ntfs/namei.c | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index fe2a79b..73c8e6f 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -1434,6 +1434,8 @@ retry:
 		icx->idx_ni->data_size = ix_root_size;
 		icx->idx_ni->initialized_size = ix_root_size;
 		icx->idx_ni->allocated_size = (ix_root_size + 7) & ~7;
+		/* As ntfs_ir_truncate() does; i_size kept the old length. */
+		i_size_write(VFS_I(icx->idx_ni), ix_root_size);
 	}
 
 	ntfs_ir_nill(ir);
@@ -1455,6 +1457,7 @@ retry:
 		icx->idx_ni->data_size = ix_root_size;
 		icx->idx_ni->initialized_size = ix_root_size;
 		icx->idx_ni->allocated_size = (ix_root_size + 7) & ~7;
+		i_size_write(VFS_I(icx->idx_ni), ix_root_size);
 	}
 	ntfs_ie_set_vcn(ie, new_ib_vcn);
 	goto err_out;
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 29f1bf5..e4b0fc4 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -611,6 +611,13 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 		err = ntfs_attr_open(ni, AT_INDEX_ROOT, I30, 4);
 		if (err)
 			goto err_out;
+		/*
+		 * ntfs_attr_open() sets data_size to the length of the new
+		 * $INDEX_ROOT, as ntfs_read_locked_inode() does with i_size
+		 * too.  i_size stayed at the 0 set above, so stat() gave 0
+		 * until the directory was read back from disk.
+		 */
+		i_size_write(vi, ni->data_size);
 	} else {
 		/* Add DATA attribute to inode. */
 		err = ntfs_attr_add(ni, AT_DATA, AT_UNNAMED, 0, NULL, 0);
-- 
2.54.0 (Apple Git-157)

