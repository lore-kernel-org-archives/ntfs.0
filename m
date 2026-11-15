Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749198;
	b=ryLRnaCdJJPL19UfzSmyD/erFyv9/shI5sI+c5zH/y6zV96LQzMfW4H53dzGWp/Nn2P/
	 96xY1yg8FAhzaTkkQdzzDTd/Y8YsiXXkSdhXcC9fdrpMqdliJPwt/5bF/zIPsmjo7qXzp
	 rUAtoa0Fkd7aapPjaGxYVcyJ3wEbvP1TSaHbzUsOgEHf82IYHJGXeg4PgSGBcz5krju8S
	 Jtz9ZvEvOt1YFb8Fpyv3wgaXAkbykIZ2FxSOhCWl3KigUmF5ooQypAFImiu7Cc3UcumH8
	 VdnStOQ5Wsgh826h7bY6TCL+jeNuQO7Ec1C7sP9z/zF65LDiX1II6rwce0VN39syJYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749198;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=fJ54AZ8kyr59gug8UziG62hUVeqhH61HdqqjIRIFVek=;
	b=lgUP3MANAPNZwUJ7SQ7uw7i/Fjjv+buXBmBAik45/q+Gu2AQRaF+KHTqmiKCWo3zIeqv
	 7xK/lq2912W3KrXeg6+W6OLKbrZOglpNuNIG+wxxpJgHgv0F4RjlpeSG/9Xqy20P58wsZ
	 e7esKSDBXARK70gwUWM0QmbRCUKeJsfEO6k8GFQHLs9J+eUpQ50LBe/FS/iD1DeXslSZh
	 XMN9w+LO9DlXzuBq0vDX9Jf7y+ULUmP0toFDOY4t0+Y1xnRzz1xLb+pKWd5XxKmy7hpiK
	 lBiuL/F7OhpqfJjGRXB1isKxHNH0O/r793Qz7kOubSbaVD8qjGz1EJvZVfhM7NEWDQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mTgfCIiO;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9C0606A31E
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC9C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mTgfCIiO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fJ
	54AZ8kyr59gug8UziG62hUVeqhH61HdqqjIRIFVek=; b=mTgfCIiOLIROMyqLDj
	iWAyq0yMRi3qsSNb4mV9uHlOiidL2Hos5fLVMiHv5kr/SjKAEeeBbA7za5uocibH
	kxyCF9Rrna4j9wZLHJhmUIs81dgweW3p1xaxRxvITicSe7HyBH6JRkj2PSFSBZ+1
	hy704s5838NLejOzrSEwFEOkU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD33yHzsvlqXCkHHw--.36757S3;
	Sun, 15 Nov 2026 21:26:14 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 01/12] ntfs: return zero after removing nonresident attributes
Date: Sun, 15 Nov 2026 21:25:58 +0800
Message-ID: <20261115132609.209957-2-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33yHzsvlqXCkHHw--.36757S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFy3WryrWrWkArWkGr1kGrg_yoW8Wry7pF
	Z2k34fK3y7Jw17Jws7t3ykXa4Fga18WF4jq345Gw12y3Z8tw4xt345tFy0gw1xKryDK3Wj
	qr4jgw47ury3ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzOJnUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RYDzWr5svZtOQAA3y

From: Dandan Wu <wudandan@kylinos.cn>

ntfs_cluster_free() returns the number of freed clusters on success.
ntfs_attr_rm() retains that positive value after removing the attribute
records. ntfs_attr_remove() treats it as an error and skips invalidating
the cached attribute inode.

Store the cluster count in an s64 and propagate only negative errors,
so successful removal returns zero and the caller invalidates the inode.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
New in v4.

Tested 1536 injected creation failures with small/large inherited ACLs
and 512-byte/4 KiB clusters. Free-cluster/free-MFT counts and offline
reclamation checks passed.

 fs/ntfs/attrib.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 9266a3ea3b0f..a18d74a9f685 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -5515,6 +5515,7 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 	/* Free cluster allocation. */
 	if (NInoNonResident(ni)) {
 		struct ntfs_attr_search_ctx *ctx;
+		s64 freed;
 
 		err = ntfs_attr_map_whole_runlist(ni);
 		if (err)
@@ -5525,10 +5526,12 @@ int ntfs_attr_rm(struct ntfs_inode *ni)
 			return -ENOMEM;
 		}
 
-		ret = ntfs_cluster_free(ni, 0, -1, ctx);
-		if (ret < 0)
+		freed = ntfs_cluster_free(ni, 0, -1, ctx);
+		if (freed < 0) {
+			ret = freed;
 			ntfs_error(sb,
 				"Failed to free cluster allocation. Leaving inconstant metadata.\n");
+		}
 		ntfs_attr_put_search_ctx(ctx);
 	}
 

