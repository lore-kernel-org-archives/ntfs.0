Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889E33F39EF
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288508; cv=none; b=qYaHsED+F3HfBN0tV4+IeA+kltjniM3A4Kd3sWKCm0Zv5TWTt0vhtrapOi5WPZ3ABjSipWbzaA1PXcQ+/7sb4G35WQjHyC5sRtDOGeCWi9btFQHCdTrFjjv2i5onKoOMEjmEemawHdMVnu6/PuE7RCzwGX5SpRj1YBZHaSrU9jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288508; c=relaxed/simple;
	bh=m0qhCbM887aaINCPCloCfUzu7MjIdel2WBCf7XSZAS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fkiua5XW4vZI2geLVDALC1UZJ13z5hexCHL6gDq7FFUu5x79FoacRm0sP3GNRKDcjUhJkHSjmGLOxzb7cWxKXaq8Lz5sdJbFVlJZ2RrOJk0Y5tSbpy3TRvXgVIuYofPCFdzZOrQeOxwREc9SkNH1gjQ2YnQxTgYdVe/9zfOc508=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FH+NcuSp; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FH+NcuSp"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so375790b3a.1
        for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 22:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288507; x=1787893307; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eSqXc+GR5riKGN+J3Riw47Bg9sRiBl4VIDi0zkcGALY=;
        b=FH+NcuSpsV5ZKsqEhHkCF4/v0oD6ruGG4/aAcMua0a3mOBT/LNecJ3cpkFTQ6XiRC2
         L8Q3KxhQ102hSZnf8WwtI5Z7U1BBk0r2zL5Jy2qGsivFxjK6uHq92VbDGBA7TNRVPlfH
         bn1Nj5aCV1UGUYLlT9x1p28/xfjVmY+dS05QrDBRqZEqy/p8anmCo3Y4u4uxnG5moYAc
         lEQjdTsj4Qi9VUshUKl8ik8fexORQ/O0MxUoSK1x3P7qFVz3neYH6ZyOtElJttMZf1As
         lroLy9BMGgvwQCLsbhyyEKMaSDXqibDvK6qzDXyFbGYnodOYensTvji6YS4NboT8OeQ1
         GC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288507; x=1787893307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eSqXc+GR5riKGN+J3Riw47Bg9sRiBl4VIDi0zkcGALY=;
        b=oxGHmz2zJ0Mgci7HqkCt1SkTuOECqFV3n2tI0tKR77YKk3C/BDkwY5c7zaURWAOYOK
         SpF9AMrAzzLvJgLVNs3kr1CypQo2UqDWbXizDOlrLZi3ZZgozkgug3XAQmvaM15i0n1B
         QrbWVBaNmZp4Ha65KDGhG1u62AUJWJnDsxAHsBRehNDntwgdDkWxCzZVfAmHsb5KrwYh
         TytHchRgH0/B5XpAYClKNwtS89dzvrsh6h7Mfd72zOsq/mejZYYCctFmKzWUNO5q9DpP
         qq02PQY2AHYm2kjQtL6JX47veo62RK1jOYNOlxhjPItqeAfDZdm5RIhyP3ScoH1x2cE/
         1WcA==
X-Forwarded-Encrypted: i=1; AHgh+RpEyz99xaBXOIYH+89aL2//d3BFkVm/5b9jAxGNvpIjWubkpivUEpKDx0ACWPIRzC5alaT4@lists.linux.dev
X-Gm-Message-State: AFuF++mj5ky5Qly0d0Iz1WkZvt6WQuytyQOx1ratbZWvYL1C0EYGOtks
	eO731geHLdp25U5qozYuioha4/qq0h1MM3QIFOHbnjexFFiJiQ1b8AzF
X-Gm-Gg: AR+sD13bHXsgIAnQ7nGNYKtcsDrzeMXJp2jEEaVyWHKm4wA1jcctqqM2usdwHKHq/cW
	0Nm7z5GeKgF37erzVBQEoW6TtJmFaoYThDFnufNcoKuJSP2PQEozq4mC/Q97vycLrVXU3WahD0L
	SDX/Wyy7jzwuwQIX4GAN3tRJIWAWwF5zxqw9r0CEGQQlcEyqYdyKPEQ/u8xm8zAc25EjjilTyMR
	4Qo6ms8x1+KWKGtsDOvcXFG2igUjIPOzBB6+jCJWINq/TiOFhp18bowH5N8Hbrg7yNkkAIM449G
	dbISwXrwGLLcS/GiHc3fWmmtoLbPdEu3uG/mYHlQDWiSUgTWrDV5udBt3cKAjOT09+B9lklvFKq
	SazjqKHWKMSC0828zpL4cJsysfx4HVq+CnFfKkTPw4vfD6ASRHl9or5kK7m2ijygA4SDit+2Cbd
	p3DzmpAQNVFJ6NREt96vF7zEXkMbp843RxYGMqEie29TT+xa/c5URLIyxMJ9IhLRqeIRw=
X-Received: by 2002:a05:6a00:ba8e:b0:848:34ad:3d6c with SMTP id d2e1a72fcca58-851f9f4a715mr5332510b3a.15.1787288506892;
        Thu, 20 Aug 2026 22:01:46 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm2319545b3a.43.2026.08.20.22.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:01:45 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 02/10] ntfs: define LZNT1 codec ops under transparent codec interface
Date: Fri, 21 Aug 2026 14:00:51 +0900
Message-ID: <20260821-topic-wof-v2-v4-2-7a6fa10743b8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
References: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
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
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqh9tNG9ZzAx/Gtjx+Iy084wFslkiPtWX1UCQPK
 uCq0z2LDM2JAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaofbTQAKCRA08jD6945I
 0zfZD/4kj93l320g9SImjpR/Epo2S655IxJaScglrvYUpdJpYzz9losQNgLuOWuxGx1BF+EwKwm
 838hIgKsjmsFBBymLoELDrBXeNZWjgizdnYfA6B6DnLCndgBNq+NbjdPviIiM2kyErxWycDi+Wo
 5kM3wLMRvMuhYofNtt1CtUMuSinwA6iQvUfg+WPMZYrHC5e5KZCk1YZMY1x7KdUmldMQMlQWEn7
 bLf9dVGH0sUJhqS51AEZ+oytI4wAwLfgcmLGFKqILlK4fLkg3OZgVfKPSLtjQ6m2wJTOT41drEj
 0/zQkvhWyMHJkj8URaV466ADa5/k3VysFnFenxLC+ZHCcq2t8qCac9SLyF/hH+cyEnMD7nmSK3y
 IqvDcs/lQ/SV+gg0LqZWBq/iFn9G4X1bULhm+A2ck22AIQzIOTnTDoj0uJfxLmIHm6KEynjfHoU
 UO/wwTsjsIKY7tIfA9WaGuJgAfUlmnJpWS0fGEC1cqzdpjHz2I3jHAoKDkandOvRmJKZeydjb7N
 5s93HkBZBtA3QTdKq0NeSIa/K3NZOEznvmR3fkg4vq+XJfozXwqPsxKtrv+HDOmjVkHaCmEnT+g
 Qp+5fv8YnK6za+HgBWZSCHBcCzYIjEVc1rlwJ78E1lq76QyoDGksrFbjtr1AOwaAX3+ZY6d/+io E8KDEK+spzmcTuw==
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

