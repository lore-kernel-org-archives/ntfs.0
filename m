Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E33361667
	for <ntfs@lists.linux.dev>; Wed, 15 Jul 2026 01:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784079535; cv=none; b=vBVv2HrfBm4r4aohUvXxu1SbetpSrtXJCvAwIMLijzSiztHEBGKPmGO+i+SQuKm/bkh6QDmneaB3IZttnqrLkHbe3rOTwquJzgWNUGfwUkt2IwG3H1vSOUfg84sa3WGo+WyeR0kyRj9vHD4s8NeYMXuP+gNbqotEa2fZZmKY8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784079535; c=relaxed/simple;
	bh=f8z/LhhSeiGx0YLXejZbUorQu3rV9mes2JD6R/uSQcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OHKcWr28KPpwXILv2e0q61G90KUGSXh6q6ce2gklQqEVD2hTCJo/h2Ft1byaTPj2MaR7oVnKcouCtUyy82u0EDaWVvjELygsk2s+WiGZflkslyhQ9CfwsZiWozoYThLgJDWnlOT1jjiT9uJoXWBEyRWYdxopo3s6vY9zCcYwOF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wnkuk7mp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wnkuk7mp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so59258575ad.2
        for <ntfs@lists.linux.dev>; Tue, 14 Jul 2026 18:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784079533; x=1784684333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CCVOviJ6TW1eoujnKBvwmbbtveOW7jpl9A71qAxKeF0=;
        b=Wnkuk7mproeyIevczuYQm9nc+mlYgRETCgoDqSwooAEEh1XF9jAzJoMZez6eJouK6g
         SJTxCzkEorfbNvZKn0ZizxUnT9WuubW6Tl8QkB6tsXekVPMieDKEztPOKVWw1J8MGset
         Ej1daFYf7FTlUDJRae9um5GYPd5npuWYudE9KmCmLT83zM+OyNPe8FmGhuj6sitfg2q+
         p0349TDIJ4x7m4LXiezD9IUQjdu5542J8O6/5x11u0wMZPrP9zAy5JzfVgX6FmuBhOeB
         3d8BUaVdTAw/3Y2qJkWzBAnxTUHSeYtECmsiw9L4r1L5DAaRLI7A7HoFnTwY7qgNzxdq
         OWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784079533; x=1784684333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCVOviJ6TW1eoujnKBvwmbbtveOW7jpl9A71qAxKeF0=;
        b=d9A754MAvRoqDOdBLOqKWCo5+LHsdwEipT6xTgL/L8bfdRTTwQ8Q/lSRhb1sKdP0Wm
         qSOOdR02k0RrJfldFkBNHzNsNUBh3HJca0I61Wn3BCzXx13z0aAY/YHG7X7aojTT1kof
         2fUtcy4ySgtkvFWbJ6MdCqes/uQ9+I+HXkhgwLYIrjRl2PbEcoTEQNT1ibeNGfsd+C+v
         iXHZwwOxunaT4NNsN9b/4cNsB2C1jYBnHJR9vviOjLTONLUjnTXWuX7WK1iDf5t+k/kL
         W9wjEO4GRCIAyMas47MOVs8bd7vGjvFh6OmzujptjAuvNtxCzmFrtGoO2TKR04eddk1B
         g0ww==
X-Forwarded-Encrypted: i=1; AHgh+RqAw/LNwMo67u0BamzRZD7AQ5t6oxhe7JH60nnCfHAdhaegUkvxhUBGLXetbd/mSG+x1P2B@lists.linux.dev
X-Gm-Message-State: AOJu0YydalAvT4AcbbAHxWPwhZlBHKEHD1iE+4XCEg8Nr9lLJFo7YN7P
	4Ad0qIDQCHNi+xgCQXH7Bz0Wd/V7rljW7W/mT+qCoR+KZYKRHLHzvPye
X-Gm-Gg: AfdE7cm2uYonjlx1pI9NRrCnRx02sCDHtciUT78wZv/22AGm3uz1Ly2bEETEv2v4nd0
	kRh+/rpMXGYAl1vFOAfOw/PPX+hiLczBF2gdQfl2UkBiooNs+OjdLJy/WIA9EvprdEsqmTCi7I+
	b4TGTvtIRaIoxw64hEuZjClr33aKjet9gxca5+FXCFPH229UL6vapqpqKlnD5cL7EmwWGDE/eQ6
	6PRSV0OeYrmVh/qU9AwYCvPZYeTjnSOsSYOXWR0zwjRBj9FDncvBPeMFLNYuFmkik8OwQFEUGfs
	5Cu7Jfuhkgf0PVV6bTdqKR6jG9brs8JFc8kCP9YQ1heyPFdmJqwnuRdqbh8WUrMvuDK3zlapCV0
	tP5XYBtuoamUmgOwJ/1IFdMg47QTyLz1cJAZZ4Godmeii2Yqh7IY/jGcu5PVieUNkQS8rqzF3LA
	suTnW9FTHM5lXw9iTUjso=
X-Received: by 2002:a05:6a21:d82:b0:3c0:9c19:659d with SMTP id adf61e73a8af0-3c36c42555amr849460637.69.1784079533391;
        Tue, 14 Jul 2026 18:38:53 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11080617a12.22.2026.07.14.18.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:38:52 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	usama.arif@linux.dev,
	lance.yang@linux.dev
Subject: [PATCH v3 3/4] ntfs: Use zero_user_segment() in handle_bounds_compressed_page()
Date: Wed, 15 Jul 2026 10:38:02 +0900
Message-ID: <20260715-review-matthew-v2-v3-3-3c996b687a5e@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715-review-matthew-v2-v3-0-3c996b687a5e@gmail.com>
References: <20260715-review-matthew-v2-v3-0-3c996b687a5e@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=TRJ3n3ISfczJK3q0xHH43P90Tc9BsvL22PZunl/JTiE=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqVuRuNoIzE9kcsYle7zSZK7cVhdszSu3dQhIsT
 CL2qX682nWJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCalbkbgAKCRA08jD6945I
 0/L5EACE03HQ/Ljn80HMkIJiR32r+XZp75DZfSZyDsltFHxUx2nDZ3qW3OTzt6Q1vUtNqQ7Y9Wt
 Nf/rhsciLnumeYx7zVWYdIDWVzHa6imc/AG3LQ7cFcnhCMxTXKvaMjsrQ6lWgXVGVkztGrAiYMV
 1xKv0/hU8vMaBFUgIJd02BLR4LfORhWna0qYvT2qEfyd93QXnwT5RmOEN9gF+xsdfR+QRllx58p
 A812TRgIg+UaIiBGzJ3Qzgfw3E7gqPA5xVTaQkX3eJTVZSaSP2c7l4QpXjYKB8+DbwBM7L88n5L
 9xbPi85KiJeVTB/XKjp8ELL0rcJoNLbHdqmaPFesI+MjnXxcL65vdGcwoa3CA5CHMcCkRhKMiG7
 MtGjrq3xOVwnrydx1PNAHkbjb5SomhYs0Paw72CmF25duFWMLoRpVepBGhWhE4oPK95nfkwLlCh
 5TjunIpC6R2oIsCdkfK3nIV8L8P6zWdqqK2L0C1EiCkZ0KLcY4MwrC7Kwkuy5EGPRvxf8JeIX+K
 fkAzhWnOqI7e5dbI6ZSZJybrlRZKfb3Tog0XTvq10IriWP0vpKpHycRnFdpeJCZ8K5dM5di8FUD
 2+2hQfGOIpvq6XyXEzcpEmIzknLdptyGuX5xQsCuSbok6HonunyGXK0N7YM3Nw++qAnJke8x7ac pAlBF5tdIOThgOw==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This fixes handle_bounds_compressed_page() on highmem memory
as page_address() does not work on memory which has been kmap_local(),
only on kmap() memory.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 8078041b8796..f03fae63c199 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -109,16 +109,16 @@ static inline void handle_bounds_compressed_page(struct page *page,
 
 	if ((pos + PAGE_SIZE > initialized_size) &&
 			(initialized_size < i_size)) {
-		u8 *kp = page_address(page);
-		unsigned int kp_ofs;
+		size_t offset;
 
 		ntfs_debug("Zeroing page region outside initialized size.");
-		if (pos >= initialized_size) {
-			clear_page(kp);
-			return;
-		}
-		kp_ofs = initialized_size & ~PAGE_MASK;
-		memset(kp + kp_ofs, 0, PAGE_SIZE - kp_ofs);
+		if (pos >= initialized_size)
+			offset = 0;
+		else
+			offset = offset_in_page(initialized_size);
+		zero_user_segment(page, offset, PAGE_SIZE);
+	} else {
+		flush_dcache_page(page);
 	}
 }
 
@@ -223,7 +223,6 @@ static int ntfs_decompress(struct page *dest_pages[], int completed_pages[],
 				 */
 				handle_bounds_compressed_page(dp, i_size,
 						initialized_size);
-				flush_dcache_page(dp);
 				kunmap_local(page_address(dp));
 				SetPageUptodate(dp);
 				unlock_page(dp);
@@ -759,7 +758,6 @@ int ntfs_read_compressed_block(struct folio *folio)
 				 */
 				handle_bounds_compressed_page(page, i_size,
 						initialized_size);
-				flush_dcache_page(page);
 				kunmap_local(page_address(page));
 				SetPageUptodate(page);
 				unlock_page(page);

-- 
2.43.0

