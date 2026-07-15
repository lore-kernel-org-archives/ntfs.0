Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CB026FD93
	for <ntfs@lists.linux.dev>; Wed, 15 Jul 2026 01:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784079531; cv=none; b=LNIQ/sdAmOK85bXAPSRww6irMl8T7WjdSh0d3NVGBxS41DHbU/oYqe9LzNssyGWE6wwJgnoufLJwLVk9zJCHy92E88Kc34LWKJWK3kUTY5amZScrdv8gEbZRAttcuDvWMlcxECVMunKfRm7w3DDjMZKQkEV9hUcDjopAheK7OVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784079531; c=relaxed/simple;
	bh=F17rsBBuOWvCClxx/8Tf0zeDsKdA1cxNPr8LWCXZd3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H8EZOpw3Cptq/IDBGmxaiwoRJ3ZnQV6E2lEzx0dRsw3r+VDSKxwU6hOly8BYyfO4ai3h7hZFR+cieeB4+JWhOE2xjfu6o/v28ByPXjhkPFJNDBPL9S1Lw+YKxo0QPNtmPpRtl5PFb+qPmhAeJGnHUcOB3zZS6j6B0+CMYwIdO5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiUvcLMK; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiUvcLMK"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca7c1176317so3580484a12.1
        for <ntfs@lists.linux.dev>; Tue, 14 Jul 2026 18:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784079530; x=1784684330; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kAnBQ4moZYAMbNlECesx6CSe5rVoQ3fX//k62FLjJ04=;
        b=ZiUvcLMK2nTGzCIEfM6EIU3Y2GrnZxgVaJ31lg0W+6kC0iOR5mVHNVnQeO5yyOnbvN
         jgNZD6QZoeg125uy4sN8/MxIRw2pPj2syLSu9ffV1FviBCOVoXJDY4j79EhARA+wV20s
         4J1PGj003sbB3vPtr/1w0wH7mF/J3kVmjEmQN2L4v1HpOMIV2pPn8bujKmsOOpQ4rWZq
         w1O9fnzyHscEBc0GDEsKMRyDyAHag+Iiw0rsHO+FJ5O5LdU0xqxvTjRm30TeSDG81Jmc
         YGugBb1NXLF+xSsQyVeq7VkaUBeRiqfPybfh7NHcPQEq6ki4r3FtJrKgpozAxIw17BS+
         fTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784079530; x=1784684330;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAnBQ4moZYAMbNlECesx6CSe5rVoQ3fX//k62FLjJ04=;
        b=H7bcKJ3YEvAPN2CgIArqVpqXw5/Mw4VX5htz/p0D0V+1ubA6txpOfORAxPJXBY0Q8n
         opEU6WQ/q3eETpH5kkYCksDnWNA7OzM1pNoJ/8kJAIhMBVJjuJaTV5o23Ubo510caOMr
         P4TazYnLeQaMVbGuSaIbOy8PwC6FRVqV6qVmZAMG/64E/RkIB5Y0gvrJQDzt/Esp26fy
         XveqEy9mVpIiA7hXb07BUJodyjyHo+QgCla7Z/VANK98f06U24snnf8S945pPcXVcnFI
         i2X/pU0FB3JDn7XH7/eFBNrC6tvsAdYZVvO+86gflMRcWufLCdt1NqaJoMEuoZs5hQfL
         /RCg==
X-Forwarded-Encrypted: i=1; AHgh+RoDaLRCSuxv9caQSQF/cuR+F+IMDe9aF6Y9zBIyGKEq9j53N5L6dTf+0Pq79KSewyuWCG74@lists.linux.dev
X-Gm-Message-State: AOJu0YxTtvpHsexajU5svo6hCXeVPJvxIiA9lY0jscNVGDWqr2FyWDMO
	Ahe3Y9DuqGDqgPAxryaNaWQFujRvbCTGG6MTY4EYu/6U2cfbzLQnu0Vg
X-Gm-Gg: AfdE7cmYaC7PtzR3NKbf1qqmGHaJvYTzThwyn+ahfKNzkmPyGWTLULboR45Qr02Jdww
	+2mHOremfIZKNxJkG+jVJLQFArsi+Y570t5wPXBLB61wPrs2+s6WiH+TSPGUnLDtNAsay0hcehi
	qVTNaYnFqudAluTUepfipS5xW95THOfSX0p2iH1aIZmb7ObKC9BjWjhNUOBnXL8bHIudShLculn
	BURlN1jraYwkHc+vALQ14dn7Q0g49lmA3YMEG8e3PwTgh7QQqzPT6WzoLtR1ZU1Enn/nFkt3orI
	+FMDB2ReNaWJJ06XvBnZUB+m94X5rJK+0rypNi1rpY9ZEouYk+9lAsZ6kRV516EuMLIBh40xmT3
	pi/LF9w+DMpJaeyvG5r1Qh6M/XNzZ5xEqolGrQrsA/dp21qZ/O+I/cJ1B40yzWYVuCxZpp2A5a4
	6kkAAXwJHYrxV9/X2oneUDc57wjh3gWA==
X-Received: by 2002:a05:6a21:a98:b0:3bf:a0e5:99a1 with SMTP id adf61e73a8af0-3c36c3c69f2mr928500637.51.1784079529800;
        Tue, 14 Jul 2026 18:38:49 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11080617a12.22.2026.07.14.18.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:38:49 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	usama.arif@linux.dev,
	lance.yang@linux.dev
Subject: [PATCH v3 2/4] ntfs: Remove use of __folio_index in handle_bounds_compressed_page()
Date: Wed, 15 Jul 2026 10:38:01 +0900
Message-ID: <20260715-review-matthew-v2-v3-2-3c996b687a5e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=UVZV76zI7O9Usr7L3d4M66b1fjph8c3bYDu1XSTbLus=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqVuRuTJxTIJDzvnQ46JnDLPCUaf7VnFqqE8gUY
 XhWv16BWsWJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCalbkbgAKCRA08jD6945I
 04FQD/9rZw7URMEtu8i1HHpyVvD5/XlGvx3DXlX2KAO/a1Q8Bzhn8vWwGtKczdOXj72rWkPyK71
 qlZk4PPYs0zheKamACjwK5LYL9umsTkNRUf10xiqqwIipoLy/Cpi2GVywLRD/CdSQs2bmU5a+0R
 BwdMukdI414glGKaCQ/4l+lQpvDQOtXi6qkazFIQqqClmrw3rd88y1wHx2ejDsxtuqeljPlWlg1
 KA9SXteG3A8LXYObi//fjzm/+pd6cyQEOMEBjfG6A4LbUlGYJ+iN+l+tEwYrdo19GrcMM016hEc
 3KeancvJnOsJa386+n6GsSj3vpRwazCATEc9B8YqgXHpdjOAsuXqUhIEiVOGz4sN3i5/tHe6if6
 v12G9AVRxOPgGuzjjrRVcv8GBYDyxwKqnK7712eOhe5AcbkfZI7M2638gfgYVIajRyDrPpbxDOF
 3AIpO4Rse+iJQ05rEEwHKzOvnVm4efCYS5zp+1/fKsVtVeXE+DnlmR9DpPo8ZB7wzS50Xbyj7un
 H2p/Fd4sTeYcO8Ll3YQFeDpqlhDy/1GzV06BTazuJ8gC97IVJibOzbVWwK3d0FNRrd036bSfCZm
 Jep+oltMv56PA7crPOF7k9ZVn96xFbmqKFHvsgYjfMw4vNjn4sEjF8HYoj6Mr5GeykVMFxjS15R Vse/hXESsKzdo+g==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Nobody is supposed to use page->__folio_index.  Use page_offset()
instead, and simplify by working exclusively in loff_t instead of mixing
up loff_t and pgoff_t.

Link: https://lore.kernel.org/all/20260608210618.3437216-3-willy@infradead.org/
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Co-developed-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/compress.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index c904858dff3d..8078041b8796 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -105,13 +105,15 @@ void free_compression_buffers(void)
 static inline void handle_bounds_compressed_page(struct page *page,
 		const loff_t i_size, const s64 initialized_size)
 {
-	if ((page->__folio_index >= (initialized_size >> PAGE_SHIFT)) &&
+	loff_t pos = page_offset(page);
+
+	if ((pos + PAGE_SIZE > initialized_size) &&
 			(initialized_size < i_size)) {
 		u8 *kp = page_address(page);
 		unsigned int kp_ofs;
 
 		ntfs_debug("Zeroing page region outside initialized size.");
-		if (((s64)page->__folio_index << PAGE_SHIFT) >= initialized_size) {
+		if (pos >= initialized_size) {
 			clear_page(kp);
 			return;
 		}

-- 
2.43.0

