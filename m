Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2864499B5
	for <ntfs@lists.linux.dev>; Tue, 21 Jul 2026 09:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627706; cv=none; b=bIyJu6uGAN/7iM728F125RXA8JNNIFultPlIW2NQTlpXtLSSeFp4sOkeAMesxo2g584LxB1PUQUt9xWlnUC4/i4rhBA3E5xcUvwn7PRKVsL+g/yKhA8899hrvnWgB0PeSdzQg/H01FR9cJ05zoYwJFvM+/Joit8P7+eXW5pwVsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627706; c=relaxed/simple;
	bh=96jCO5J2usY6amuDBaNnhb+peNlhRSpyw8hU9ImER58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PKFmQ8xyXyN0W1YOOyKMq275G06bjn5RBWJ/p5IpL/yEYo3DLoDd5fxN2xzBbUrSel8XogtHRnbMPqbScCv0GglqehDhd8ai2kkeHiRM4CJGzdFgmEyG0brhfHrJaqYmWjv3zLyhw5WXhegaWPWjklJKlK77aqKiPac4GGpr4gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vs51XPkN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vs51XPkN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9BB1F00A3E;
	Tue, 21 Jul 2026 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627704;
	bh=IYdcvnc1O5dQgsRhgC9krDwLX3TbMsCpSAUxE907jIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vs51XPkNPYhWYGpGynxGceZtzZb8ga7SlE3QkzJ9R27ePQc2IOZVfq4K5avRq4hMS
	 BrEQnKXGIb/Gq2b9AXgdWSUcCCmPGzqCS0A2DXOO1VuPVseph9mITA0QzHY+/WyOnR
	 XJqjmZ12jCjIKvjAo7G/M1x4BDaPRVIsPg4htHh55N3RPAXXrU85zMILdH3OqIZMFw
	 4uYzaFkgVx150xyk8cTnrCPwvzO5kLoaEvwjDYpURae8rcjDArBdb4sbgmyHtWm5fl
	 yZbszqkVmAR3FtcoZeSroCE4jxoOOEXOYKyEqFOPx2bATVfYE38I9yroigHsRaN4IZ
	 nrS+6wXGY41TA==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 09/11] ntfs: skip reads for full compression unit overwrites
Date: Tue, 21 Jul 2026 18:54:29 +0900
Message-Id: <20260721095431.6619-9-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260721095431.6619-1-linkinjeon@kernel.org>
References: <20260721095431.6619-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_compress_write() reads every page in a compression unit before copying
new data into it. The read is unnecessary when an aligned write replaces
every byte covered by the page-cache folios.

Detect full page-aligned compression unit overwrites and grab locked cache
folios without reading them. Keep the read-modify-write path for partial
units and units that cover only part of a large page.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/compress.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index a3af669b1008..ea29fade9b9b 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1501,6 +1501,7 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 		pgoff_t index;
 		size_t copied, bytes;
 		unsigned int page_offset;
+		bool full_cb;
 		int off;
 
 		off = pos & (cb_size - 1);
@@ -1512,6 +1513,8 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 		page_offset = offset_in_page(cb_off);
 		pages_per_cb = DIV_ROUND_UP(page_offset + cb_size, PAGE_SIZE);
 		index = cb_off >> PAGE_SHIFT;
+		full_cb = !off && bytes == cb_size && !page_offset &&
+				!(cb_size & (PAGE_SIZE - 1));
 
 		if (unlikely(fault_in_iov_iter_readable(from, bytes))) {
 			err = -EFAULT;
@@ -1519,7 +1522,10 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 		}
 
 		for (i = 0; i < pages_per_cb; i++) {
-			folio = read_mapping_folio(mapping, index + i, NULL);
+			if (full_cb)
+				folio = filemap_grab_folio(mapping, index + i);
+			else
+				folio = read_mapping_folio(mapping, index + i, NULL);
 			if (IS_ERR(folio)) {
 				for (ip = 0; ip < i; ip++) {
 					folio_unlock(page_folio(pages[ip]));
@@ -1529,7 +1535,8 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 				goto out;
 			}
 
-			folio_lock(folio);
+			if (!full_cb)
+				folio_lock(folio);
 			pages[i] = folio_page(folio, 0);
 		}
 
-- 
2.34.1

