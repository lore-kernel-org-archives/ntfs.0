Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653544B04B7
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 04:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337298; cv=none; b=Vk6Z9EzzRj63p9g9IsoDvN+fuuQ//rgIjoh7tQhr0wsSuCwLsXm/AY4b4+EoaU1oVdcloastuPp270V4QqKlY4AA8p5ml4iwdR8GtclkarX0GLpS6eiv2JxmUvt6Y/Op2cMMOgIaRyAXZ8yPARX3oDp4MKme15fM5WskcbyaOTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337298; c=relaxed/simple;
	bh=m0qhCbM887aaINCPCloCfUzu7MjIdel2WBCf7XSZAS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EKj1iu4+8hI/dHUk2DQUtE/6chP0AgyZFnAF8qvj7seBN7f5ufqEXRXw7e/XdBNC3xBdBy9w+j18eSsl5NhWwjRyLpebTsvMaINItGXB28WdEXdKhhxPTzsvG6tFo481UpJ9f6dg70plFLzQr/EXOobVebtE4CZW5bHD9Ikgm90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl7WAmyr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl7WAmyr"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d01663d816so11344265ad.1
        for <ntfs@lists.linux.dev>; Sun, 09 Aug 2026 21:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337297; x=1786942097; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eSqXc+GR5riKGN+J3Riw47Bg9sRiBl4VIDi0zkcGALY=;
        b=Pl7WAmyrOOeUUdl7Rl7ShvVG/5KKupT0aKlH/9AsvngzEpapKAPl5E7RRiXW65b2/S
         6gyEVxle+DRG7m/oYT5yZ+NfOlJUIqsBv5R5h91tNFe1p/4EJ1qvJ/ra1LyXH0URVO/L
         xGOPecQ/GEkpL7hpf+458spQgEh/I1VrCupTxAdbQLSm6oOitd+WSp4U7u/nMgfLtKNe
         0ddo+UfngJfv/5qbklC7sQFJCi3/Fd/yKkNiq2O8yQpNqvtWSDaeH8JlRTPjJPdDgSZy
         iaFQEVYpMOef6uoiTAQsgt0N3+DNJuM9/OdwiIFpxw5IyV28Q0pTt1nOGPpdSbCrvZaK
         tkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337297; x=1786942097;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eSqXc+GR5riKGN+J3Riw47Bg9sRiBl4VIDi0zkcGALY=;
        b=A46dkxzDjESKD+02YC8t3X3eTlfEoaZwwLFNv1oo6FVE61/3OzX6DMSC3pf9gn/8Qw
         Erxdil8W3a98oVb4jsAYcCSQK0Cad1+TpDfzdi+eieIWusl0j7SUqvFpfnG5TjwoBDt+
         eBuG1aU0YDoHlSXjWkiRDxMEw9fPmJG9QS2/0nQ1OWsy5sNCLd0xpmYTkenNjG4oLr12
         QYEOMWjHijhMLXL6q58fmoeFpKQ+dZnusIzGprySWy8XqE3igqZd8+I+MWSenEXIklen
         YfHZKHFlgYEWI4bU7I2ArS3AQ2EVUPH6nCFM5gq2eWw3JzB4vXR9Cq8zghHk33J2AhXB
         dKig==
X-Forwarded-Encrypted: i=1; AHgh+RqIjvtNZh1H5Ok9mEkpixOXGc73ecAjWZj/Y1KRMUbdj+Zi51ByMFVSTtDnOS7EwHh41Ozd@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr7aNwilrfBByh235cyNtquS8iGKzS5E5OGjNhN0QrF0yjIMUY
	Peofmc++slAkF13prNcONaBK57DiSZGrQZnvZZX3YtjK85OaV0YwpY59
X-Gm-Gg: AR+sD10Os1rADrFjkW/Rm0rHN36MVcht5YaUnd86MSF7+ejn+rcF6gY2t0Tt9du8n7n
	+TJoH3rEIzwHd/EY0rg8yXqGlaKE7reYb/tgy1E4P2JOk+vd34QvLgNzYI2hyeRgVL+RpxOi8Io
	W7t9/68BJ2EbzO2YPdqXX/nA1PzFzKGhBAqN8WPF5BvOKtghJn2p0KtS6qG7iMQkuBV9cjQcpYQ
	thWr+XgdpVRNrf8aoYNaR7yMeAs0c9oM96OdltRcQe62vrhSyQUwJP/uuOkrDR77/qT9G25xqdm
	2B+xmzIoDfnxsGuybkcVIaq7Z1bBgn1RA4rScO0IsUHlvWiEk7s0R750PI7Lt/l5qM3Ey6n38iB
	hUE/VK+DSRvNLOl6aNjTPrWukB3a3SZZ5uzv6EQevESRX21EYCE41GQpJzVw28AQhO1t0bcAPgk
	Vk8tFuHTX+Mj7yvgpaZdNdU99nQhbWlsNe7KLfaqzlhbrEJOOQbUSinUFqjeBrwU3KWHPzouvv5
	PaHMw==
X-Received: by 2002:a17:90b:51ca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-3909d79f8f5mr28512033a91.3.1786337296628;
        Sun, 09 Aug 2026 21:48:16 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm13045106a91.3.2026.08.09.21.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:48:16 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 2/8] ntfs: define LZNT1 codec ops under transparent codec interface
Date: Mon, 10 Aug 2026 13:47:56 +0900
Message-ID: <20260810-topic-wof-v1-2-6a97cfa3bb59@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810-topic-wof-v1-0-6a97cfa3bb59@gmail.com>
References: <20260810-topic-wof-v1-0-6a97cfa3bb59@gmail.com>
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
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqeVePzMm40zPv4rDq5ytFoKEDd5G77y84tjkl9
 Qe1uKcLoTaJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCanlXjwAKCRA08jD6945I
 046ZD/46wC2Zw+LyqZM8Z94G2nRg6HH7Rmtfby2c183Nwvuq8aK3nLN/DKuSixPEuvr+poiYW53
 DXqt/yj/uv3kHJnSapL6rUGwOJ6C7zIyd1TtJ/zI48q3185F3PElRm6JOytf4PG07RGuICjl1cg
 xfW7FHOgeIn4ACbuJWZz5odxCXaQGXZxY0IaMz5f1oMhcy+HTxbWQa1WisD9PL5LxOiYjYVd048
 ReXUAIbhcMuNiK3tittIbgzbme3hzBcAdAPhZ2QB4HkqrQfrxupwxkMXIWNi1cyJg0gaKu9LWOq
 ivIymGHPv8raVs+cQP0B1RzZPvgkzV6IhUDQeNWTfpGDD3AYumKkANBy0rUNJstmJB6B0t2oTsd
 /ASTjY6KRAlIiBlqHAfcShZX4ZZKJgCWzV75bRsaCZjsiSAM5e0ngWPYDJ1Q/Ob/v+59QkgG/wW
 dpDqYu7GdJUhtNfT88AP7ghtfdtmyBk7kAETFVhaGmiqzoERhqhAwVu1D7gtHHmGFCIpr6MZoNk
 858k0aJdVcH6y/8RnXT6AGVLgXuIOdPbPgD5xG5Sdaf/32mMVm7+A9qOH850L7oGjX+SLvlEePz
 RaivnVhaNB+leDycQlFLZFk9I4gFdDhBcNbou7XQGjWvrRyrXf2mpG7sSV9QGB4gCitHGwvwoUm P3hLkBvz35jz51Q==
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

