Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992864;
	b=UU8Y0NrbU+31oXTJLZFc7cHMnIA7qy70katZofd+eEeAXcTOHaN3gA3sHaEomB6JKFnD
	 UjJSm/zE5mPJv52MVC4h7AncbvvXGsjbUU+KaiU/OsWvzcpn12xAblp2qkeWTnAkgP74a
	 l91hmCj0iO0ZohzFUP+ArN9d5xShOcYZVGf82wMB1bYcfQaAMQwhA8/MhbIUNg0qKsXFZ
	 klCQfYldCUCYAqrFwaDVb57Q6FHvgmyqoua0axvSfIhjaMmqw+YzpqtqD8UKV7IBiSiQU
	 f6T48FiDGmNZbOfdqzV2mAR/wnjkjGEkkk881edqbmYGTrx3wxjxByoyYZ1PjiOmuzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992864;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=2Oyu1LNp3shrdkOkrJoMwhNcFXaJKWO77Sr2rmrk81U=;
	b=l4B6aD8jLgKp4AR2mqvB/dbFlSkaQOsc6BZio2OQ1MevrMqaB/PxG5BZdHYBt+hCr1P0
	 HMwTJonEWUl/tjoVmxSZG2QM/ARDTNtlbbX7vr6nUNemimp0BwKGspdLW7AaLhFt900PL
	 Z8LcjYUwU6GO9PNr1V6Qpx11JYvchIGzCB1cvHhextGdI8AOxfQp2Z+FF464ng8tpq0DN
	 f/rKrF8MaD9bMhJddnH0ZgQywpkytwzqDOl5nfeC/kmLc7PEUIAdAd1W210sTH2NIEh/b
	 KG8LRagsazzDI9tnMGgFSttHry4+8UtdUPLRr69s7LlxElYk9c15ERHqENBNlGb6AGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Y1L7tUJh;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A00606A332
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A00606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Y1L7tUJh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2O
	yu1LNp3shrdkOkrJoMwhNcFXaJKWO77Sr2rmrk81U=; b=Y1L7tUJhusrSnrda+M
	gQgSNqakWHUcbtKTHo+6HJOoPkZ4KjujPDyIVcAqhvHTfsonoM7khD7/qW24VA/f
	LNqoteGsDutP5cyScq1l0BUK/rgx1lovGLk+1IlkQfn0kLP19qTsq7g4y+LUW3As
	x4/pa7nlZtGXTtgz1CoSKGPmM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDn7yTNav1qnmzWIQ--.7895S7;
	Wed, 18 Nov 2026 17:07:28 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 05/37] ntfs: preserve synchronous buffered read errors
Date: Wed, 18 Nov 2026 17:06:29 +0800
Message-Id: <20261118090701.1858849-6-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wDn7yTNav1qnmzWIQ--.7895S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr18Cr1kWryDWrW7XFW5Jrb_yoW8try8pF
	Z8Cas8Ka18Gr47urn5tFW5A3WSkry8JayUWFW8uw4Sk3WYy3s0gas5K3WYyF1rG348Gw45
	Wr4rtrWkWF1UAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UcyCJUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7xDo0Wr9atC0cQAA3u

From: Xuewen Wang <wangxuewen@kylinos.cn>

iomap_read_folio() discards errors from the mapping callback. Returning
success from ntfs_read_folio() then makes the page-cache reader report EIO
instead of the original allocation or metadata lookup error.

Capture a negative mapping result through the iomap iterator's private
pointer and return it from read_folio. Keep asynchronous completion and
partial-read handling unchanged.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Extract buffered-read error propagation from v5 patch 9 and adapt it
to the current iomap callback interface.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.

 fs/ntfs/aops.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index d0d1a8402bc4..d02d8dde833e 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -49,6 +49,18 @@ static const struct iomap_read_ops ntfs_iomap_bio_read_ops = {
 	.submit_read		= ntfs_iomap_bio_submit_read,
 };
 
+static int ntfs_read_folio_iomap_next(const struct iomap_iter *iter,
+				      struct iomap *iomap, struct iomap *srcmap)
+{
+	int *error = iter->private;
+	int ret;
+
+	ret = ntfs_read_iomap_next(iter, iomap, srcmap);
+	if (ret < 0)
+		*error = ret;
+	return ret;
+}
+
 /*
  * ntfs_read_folio - Read data for a folio from the device
  * @file:	open file to which the folio @folio belongs or NULL
@@ -73,6 +85,7 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 		.cur_folio = folio,
 		.ops = &ntfs_iomap_bio_read_ops,
 	};
+	int err = 0;
 
 	/*
 	 * Only $DATA attributes can be encrypted and only unnamed $DATA
@@ -104,8 +117,9 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 			return ntfs_read_compressed_block(folio);
 	}
 
-	iomap_read_folio(ntfs_read_iomap_next, &ctx, NULL);
-	return 0;
+	/* iomap_read_folio() otherwise discards synchronous mapping errors. */
+	iomap_read_folio(ntfs_read_folio_iomap_next, &ctx, &err);
+	return err;
 }
 
 /*
-- 
2.51.0

