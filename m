Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0423AAF5C
	for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 05:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787204976; cv=none; b=d/X38yRKjo+XO22Q8l/jL2cS6Uk3QBDFmMbO9Oglq07a2xQxTNIg6T+MTpKdf1ltkNp6kfenHbsfcwRVIFUafepUH3K5N7JtY86KwVrsZAraOGyskAYv4ynh4qoxtwmS2jZkExUdlcmS2oXJdQaqHgypgc2CYe+gkiEhUPsv1iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787204976; c=relaxed/simple;
	bh=m0qhCbM887aaINCPCloCfUzu7MjIdel2WBCf7XSZAS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ea2w/NmGmLYCUU5GNwFJLfNYzpHGdjVe+o8b6mYEb6UgPuAoKlRcq2gmTMByK9Mne0fALiM6BP2yhVmK4Q5PwEPuqmvbpps5+s3DAf8hp/zO0OrN+sZm8OgDWrxcblKxPfRFowy1gn8U7CdEwsRQTHJ2AkE1YU/ERuCzT97V33k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTZ+AzcT; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTZ+AzcT"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so450792a91.0
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 22:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787204974; x=1787809774; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eSqXc+GR5riKGN+J3Riw47Bg9sRiBl4VIDi0zkcGALY=;
        b=MTZ+AzcTGqJuq0/bo7F3hT2r8j8nU3CSWIW7SLTnhf7oU2LifFNDsI2L1Q+INasf25
         ea3X9bHdZxeRVkzwyxKihy1CFv7TdDdjCxkeexefV36Q89FqOKuV8YG8MK59jTAfx0Et
         xZ8+HjGpsx4NNGYj9a7NdNVgVntKTWgQEpX76qkY9iTF6T9kHKOI5zH2FpogdX4NEaXY
         dYYVrJ3udChal1UpcfGD2MQCzyR3UAWcfdxx1/l+zZlNQhq4J7CxLtylLaiuFZXWkIlj
         edXQTcWrTW02rv9NxOAUCwivWZWggI8CbD6+BdWoNp/fXNIMCwAVDXa5mbrPN+04WdQi
         J2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204974; x=1787809774;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eSqXc+GR5riKGN+J3Riw47Bg9sRiBl4VIDi0zkcGALY=;
        b=gtXmGwoLnktq2YIJCyfOivTK0Y5cvbQdcnDjvfdCzLN03/UqSbHMt8OY2JafCFVtO9
         cfgTyYRrG/Jojp2bd0hQZ4y1j4dzLRwd3sESKNkYcE5YukO5cPO+lR4t+D6bgLz5CAYH
         wAdPypW2BkrUzjI7rrUqYfijE8auaFbemvqs+PSKBkOmmPv2OdSkvTMv6NU8yhLYsi/4
         u1AD9X/OEf42tojWot6Q+LOAG741Vx0zzh4W52Mtb0vTfB/DthzIp+qtVCUAr06mPRfb
         hdiicy8iuKM6zyoIpA+/H8FFVo/GuI3KeY+Xr7BqDDHs/fIy2Uttw/4QcveE4jJnALps
         JTaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGhNMNIVB80V1FnVcD0TW3Yq+BVhTOW1UmmkO0lFbObsi1hC6mWSIp9YWYuiKdMDbGnJQ7@lists.linux.dev
X-Gm-Message-State: AFuF++k03BRK7I8oKbyu7V7EpyiJmeVejXrWgDLz1UC5kd2dWtrnR/J+
	REtKM943Mh02+MPzHVC10XI/Yi6SuUKQSe8sudTNSsupz/6MMWs70bzS
X-Gm-Gg: AR+sD11rL58uPPJfASEOnchc0FEMPjWxmUvmLqQ0WxY0E3ahuGSzmfkcUKNoq+Y/YSt
	0HHTWcZIJUDkpmVakv0yZHB9tqOxjGxFOAafhCe/s+qhah4i0ws8dr+ZqBsjfaQhIpOUi0BZksK
	tQ3Z9B9BkzKZ4I37dEfL3an7DAB4pnXH4jh2IjOLs0Yujq49/+pAA3a2wPvoJDDRDItHyq9UtKX
	CgAAczeJWRAxS4xmm04Vg+m1LpowEkDL140PFb6JFx+mHdASWhMCYAyTAmJWrLbS4m3wqXN71kj
	FB6HLD2fxCi2k1BDtrdDxckpUX5CtLvnSB3xjOrIP+HTqfALZciPa7OKyUoEBz4gpQ2yTB4Y8sU
	IzTF2EtAuHPzh/RKRLjGLPlxzy9lRzfhI1Di66G5GDKwMrsz6Bfy75V5MPjxydvHppzTWKPrQwn
	Q025/UwM54IfP056QGLsgCnOxSPWQiDfQLKOH13UdbOAWScC+fqdXs3Khp/XOk0Xan6OGpOiZKK
	Ug7vw==
X-Received: by 2002:a17:90b:4ccb:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-395a06edd3bmr4412600a91.8.1787204974406;
        Wed, 19 Aug 2026 22:49:34 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395b66bccf5sm106766a91.2.2026.08.19.22.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:49:33 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 2/9] ntfs: define LZNT1 codec ops under transparent codec interface
Date: Thu, 20 Aug 2026 14:48:15 +0900
Message-ID: <20260820-topic-wof-v2-v3-2-ef6149b4541e@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
References: <20260820-topic-wof-v2-v3-0-ef6149b4541e@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=m0qhCbM887aaINCPCloCfUzu7MjIdel2WBCf7XSZAS0=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhpUL9lbWz+s+k4oRpxb23VEFwb8u4IMbjR7Dh
 JfE+9TCjMqJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoaVCwAKCRA08jD6945I
 02hYD/wOb5xdufchBB7dr0Y1UFknKaQpTbjjlrpLg8jZ4NgkSTnJoMqvECF+eNCNRREh1aLbwLD
 XkSSKVFOzge+aWAD2pNrEiG4rDPpxovJ3HeJwURWpCvYvbwiC/LevWBJKh8cGQsaMvLnRsZqXTf
 do5eka+rZRqqyNaMjEk8jcd2GgKCnRD6pwmsfJLo3hE2NNw8Ijkw0GlfAV4zexr78FOBflQjQLH
 PK0E6G7DcK+hLcOo+vmj3c1srJUl7IbpKh6C8041wkxG9VVE5O2nBS/5Kf5nN/zTWIgqwqBd/CQ
 SV6AoQcd4YhX9Ien6bT90pejTTOsLBmcDXv/+IkAIB2xnhHapfMeRu2MfJmxaDU06xE7uYuzobb
 ayBKhFRkBsdjGj1ts1tTuzRB+luw1Jyn8MGJESIAT5jFBSCb3PtMHAQmFr6atHJI4pfrNQ48Rub
 46Gt81SQQCoUgAZUxb6PjkkZjOYtpCjCGgUwZopNkwFrsjNCLg1WlP8tKtfzCNSrBJoaHfkyIgK
 sRP3ZuKTcT4T46dtKASWXgKiIWYPpczPdd7lJS7EIrLKNntpgT3/yYVRI00VJHZgexVEGAFubaI
 CtoCcwWUpo0jTzZAuIHItiIvZjFzHV+CCKXPNH5+J4keUQDXCnz9eMOXbnRKUuYA3vio0Ov3cZd L10CNdimZlsUccg==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Define the ntfs_lznt1_codec_ops structure containing decompress_pages
and compress_subblock callbacks in compress.c, and export it in
ntfs_codec.h. This structure binds existing LZNT1 decompress and
compress helper functions under the unified transparent compression
interface.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/compress.c   | 12 ++++++++++--
 fs/ntfs/ntfs_codec.h |  2 ++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index ea29fade9b9b..f980e0610a8f 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 
 #include "attrib.h"
+#include "ntfs_codec.h"
 #include "inode.h"
 #include "debug.h"
 #include "ntfs.h"
@@ -774,7 +775,7 @@ int ntfs_read_compressed_block(struct folio *folio)
 		unsigned int prev_cur_page = cur_page;
 
 		ntfs_debug("Found compressed compression block.");
-		err = ntfs_decompress(pages, completed_pages, &cur_page,
+		err = ntfs_lznt1_codec_ops.decompress_pages(pages, completed_pages, &cur_page,
 				&cur_ofs, cb_max_page, cb_max_ofs, xpage,
 				&xpage_done, cb_pos, cb_size - (cb_pos - cb),
 				i_size, initialized_size);
@@ -1351,7 +1352,7 @@ static int ntfs_write_cb(struct ntfs_inode *ni, loff_t pos, struct page **pages,
 		pbuf = &outbuf[compsz];
 		addr = kmap_local_page(pages[page_idx]);
 		input = addr + offset_in_page(input_offset);
-		sz = ntfs_compress_block(ctx, input, bsz, pbuf);
+		sz = ntfs_lznt1_codec_ops.compress_subblock(ctx, input, bsz, pbuf);
 		kunmap_local(addr);
 		if (sz < 0) {
 			err = sz;
@@ -1609,3 +1610,10 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 
 	return written;
 }
+
+const struct ntfs_codec_ops ntfs_lznt1_codec_ops = {
+	.id = NTFS_CODEC_LZNT1,
+	.name = "lznt1",
+	.decompress_pages = ntfs_decompress,
+	.compress_subblock = ntfs_compress_block,
+};
diff --git a/fs/ntfs/ntfs_codec.h b/fs/ntfs/ntfs_codec.h
index 14a69d1e4d7f..408b18561a03 100644
--- a/fs/ntfs/ntfs_codec.h
+++ b/fs/ntfs/ntfs_codec.h
@@ -43,4 +43,6 @@ struct ntfs_codec_ops {
 				 const char *inbuf, int bufsize, char *outbuf);
 };
 
+extern const struct ntfs_codec_ops ntfs_lznt1_codec_ops;
+
 #endif /* _NTFS_CODEC_H */

-- 
2.43.0

