Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F4142BC2D
	for <ntfs@lists.linux.dev>; Wed, 15 Jul 2026 01:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784079528; cv=none; b=WSWaTHI7qjaC0TdbYDmR5m2sBhAGbbAhiVxlYyWcMTjdEewMRTaygTPwOuNCUlmoqiA3LLtY6xnZPRrHmBjqyUKXjR/dZEK8Dfq7fXDAU/xBAxzJJarKANsZg9L88z44xBayYaI7LIOylD9SXpb3x4rDNK8ZVBro9rrJXcDl8Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784079528; c=relaxed/simple;
	bh=36W67RmH5hXk2GWT1Q8Um9zA/ZFMgU1CMu+VhSVmeVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JL787GRxpIn/KCr+soIPn8MH5AOFAxIjOVbKJjdFOuOZKEbVx5xe+hJSWyNW7p3Gktbym4ExkSfLoIRUGcJ4wq+ISQlm7F8Wian7Zq4OIAQEXlKJgvibrBHElYc1ULjCG1NgeuFbv5hlkKecYh+LIGnsdgCSLyvQrMnLlXcqOFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ui4iIpTZ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ui4iIpTZ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so3181390a12.2
        for <ntfs@lists.linux.dev>; Tue, 14 Jul 2026 18:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784079527; x=1784684327; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EjW5lTWxLCnVY/vldHhy8VJ53gqcIIkNYP2oB02yWV0=;
        b=Ui4iIpTZvZjRjOa668H77GQ+R2O7hCpeL9GDSgPq7Efx62qw/09x/HgkRPyNAC+IEN
         EvbHnvLrQKza7gEz7w+nSLcyac5hGSUaAd/WW7R+TFO3k8Fm2txGDoGmhNctwXQIxZ1j
         orWfeetb3PhtR6KToX5/V94aunpcZ/tlrNPjMZW8Q8rhmXeK0P03prx4XcTZ8LOo4Lxr
         iOE+TzyqsHtPfywlDKzaSeeC5EPPFJtXcqZwtW4Ik2Ec2H2EK7g7j1FGwy1gq7W+Yuo/
         Ki7zRIvWRi/W7G/EUh2bC0JD/tprRi9OQ3TYXSi9GoX0fBwdcGPtBMfOmyfS/P3AUSgJ
         pTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784079527; x=1784684327;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjW5lTWxLCnVY/vldHhy8VJ53gqcIIkNYP2oB02yWV0=;
        b=ffwl5oolSnhYMI5hYALQdGUBLBvX/DppZsfFciykETZgPX7u7pC4vO8ZiDJznZEUM+
         5KDCPeHSlRhc/WQrTOnETibO/+3d9/SO0Jt6F01/PpXwHY5SCNox7bc79liJSKFWksJZ
         Nuy9IU63Hx0MdDVG3LoFWZ7vhckvr8OqQE+4cahwgL/Hf0o6gamRhdaWvn+Q+av4zbUZ
         yDR/4mlxCjBPNWL5itYgAxBT4H70+vrak5bObS8OIZcfvCa5+9hTk4Oza/ga4Pw43/cK
         K6se2aUhAw8QLo7Bz/qMP/yI3G7et/LQq5nL2Q2fnjEHmZrPfs9IPzdvXTSSbSEmhkYN
         MWYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+EMbSYV8nka/VYGv3u6+T2mlVb81oUSSSQspI2mgx3fNc5in9NKZSl6cQrgfMgyU8kz61@lists.linux.dev
X-Gm-Message-State: AOJu0YwKCU6lwlQkIp5F9OqHdBWVJ8cfYGmgAVEpE73Szu9ftIT5alTd
	EsYQTVVuCJAd2FSR89J7gvq6Eo+aW2DDCjiFXaPXLnXLJM5VHp6LRRyWxi74ky81
X-Gm-Gg: AfdE7cmg651O9iRe23OOVR/UuM1rcNoEYDXuxW6FK4gbpIZ+iYoLQVCj30dbN6t6pxq
	otyxpkQIjWO90XGRl2uy7dcbRvgukQGYqp2fZnh1ci/wXsk0oG33k8C6vWQi+KnUlK++4fshbrV
	iYJfQ0ehCPP7yfDVbMXgMOY4u2b+fym0gPGuhm4JSNYNC6z89ZjledCYTfWqQaFpxV1QHBGGD3i
	5j8j2feTr2R4i0UbFMSlvKT1ua1bPmJDof/XknAOrv9ULxI7LKjz3V7qINBlR4LOrGvZKHlScoF
	SIEjF6VWGLIeqSHVCjZs1e/pt6qwAfXkGu2N1VrYZn9cBs7G+F8b8ko/fk1OCcgmXuZxIbAMw2M
	Nh+xLIQDIOU3AbJpplTwABnf4R+LO4R8Lun4mZm1c6y0ZFuxUlwP4H87W7qPwRqOrQwGwTcl8Yn
	2ca3zyYDG17O71G8AIIzE=
X-Received: by 2002:a05:6a21:689:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3c35738e888mr5763801637.17.1784079526833;
        Tue, 14 Jul 2026 18:38:46 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11080617a12.22.2026.07.14.18.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:38:46 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	usama.arif@linux.dev,
	lance.yang@linux.dev
Subject: [PATCH v3 1/4] ntfs: Inline zero_partial_compressed_page()
Date: Wed, 15 Jul 2026 10:38:00 +0900
Message-ID: <20260715-review-matthew-v2-v3-1-3c996b687a5e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2095; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=eZlVwutmrn5+9vjBX24DhNDtYv8SOPRCB9m8OIPm5nc=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqVuRuayJavxD6g0rXjo7CuF5VfQTX09Y484Y2i
 frKwJWAxweJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCalbkbgAKCRA08jD6945I
 05dKEACoN5HFq4UqHeM0YECzH28tOVekPnnDN82BNMlgC5PXFhWLNq55rsZQzcn/4LjMoulsHsl
 MPN02i1d1C1U8J+DI+vFO7cw5wCkLKNvVeYuOrv1yl1GnIveHhXpKUVw6hl+SUjq9Z/UFc1naTo
 qTtrugKb1x4vTOsNWqrgDL5rZmcHPPLUnCJ6XRHWVpJ482/JxIMf7Fw7ZIEDFpukJE2Jx6LVs4o
 kF7dAFEl6au+0wmEpTFChKwR6Vf1tp3jHcF+DY1TJ1Mnwx/x2kdYwIeLZ0lYcExquMsAJLtJadr
 kmg26Reuupk+hg2dxzZgOLpXUgF5kyCqvwa8wcaL6Ygdbensg//PlqZ7StpTlokDOx+AU5tR3H4
 ZDIvfCOUsS50eGvYRPFg5VpmOijT79kPE/ebFulpwVjgzf0q3qyx9wcBPkFEmlZFB/OLCMaBgB0
 WrzkA7eBe4q6HIdW/dqebAHcWWNWlGzHzsLlEtFyALjbiOfxqGkcHl9mENt1i8zCSTrcbb4K/rw
 SYLQJes+LXOB5gaQuWBuJ7lv+TznSUj08tMYXZyn2as9r1nSLzkdVmtNUOSkb33Sui1Dt9QE+Gp
 6qb2eUBjTGJb8orZ+aRx2qzCfol5FTwFWnveYHS+6ndC7pL980Z/yxrdrL/JHjqxZBGx7n60oW8 djz2xrdcYpQSK5A==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

zero_partial_compressed_page() has one caller and the next commit
will make changes to it that make it inelegant to split across two
functions.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/compress.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 76bd806b41ed..c904858dff3d 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -96,26 +96,6 @@ void free_compression_buffers(void)
 	mutex_unlock(&ntfs_cb_lock);
 }
 
-/*
- * zero_partial_compressed_page - zero out of bounds compressed page region
- * @page: page to zero
- * @initialized_size: initialized size of the attribute
- */
-static void zero_partial_compressed_page(struct page *page,
-		const s64 initialized_size)
-{
-	u8 *kp = page_address(page);
-	unsigned int kp_ofs;
-
-	ntfs_debug("Zeroing page region outside initialized size.");
-	if (((s64)page->__folio_index << PAGE_SHIFT) >= initialized_size) {
-		clear_page(kp);
-		return;
-	}
-	kp_ofs = initialized_size & ~PAGE_MASK;
-	memset(kp + kp_ofs, 0, PAGE_SIZE - kp_ofs);
-}
-
 /*
  * handle_bounds_compressed_page - test for&handle out of bounds compressed page
  * @page: page to check and handle
@@ -126,8 +106,18 @@ static inline void handle_bounds_compressed_page(struct page *page,
 		const loff_t i_size, const s64 initialized_size)
 {
 	if ((page->__folio_index >= (initialized_size >> PAGE_SHIFT)) &&
-			(initialized_size < i_size))
-		zero_partial_compressed_page(page, initialized_size);
+			(initialized_size < i_size)) {
+		u8 *kp = page_address(page);
+		unsigned int kp_ofs;
+
+		ntfs_debug("Zeroing page region outside initialized size.");
+		if (((s64)page->__folio_index << PAGE_SHIFT) >= initialized_size) {
+			clear_page(kp);
+			return;
+		}
+		kp_ofs = initialized_size & ~PAGE_MASK;
+		memset(kp + kp_ofs, 0, PAGE_SIZE - kp_ofs);
+	}
 }
 
 /*

-- 
2.43.0

