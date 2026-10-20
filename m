Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485945;
	b=46QvaDhyCIEYwxCnGP/1LpS3nXlt9wsqqFhJfERW7YIU8K2UolOi+yyygmjOnsyxsjq1
	 0wjaMmRZxWFTIcclPTyHgppuSJFTZXSieRDw/xYseVE1jY2ujpgaC43G1RzDmDT9JVm1Z
	 5jrSYLRmF1h0Qfw4dnt1uh/pFoJTNTe7DvknAXzhQzmSjTrRjBA5bM8FFJuAWegcc/BM2
	 A4v6jjQt4OMQYyxLo+LV1/oMwOXuWn3Q7ullfa7BcMAO6CJkTDE7sRpdbsw08urP3YKjL
	 2ul4QqzuPcgRtWVetDAZwb9U9bCXJG/w4N1Sj2jvjiEO1PQySA0SefkyICBl2+d1uoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485945;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=AQ5jSJI1Kxt5pKE/9y1epqNS0CAgxyq8X/eZ/7fltn8=;
	b=wlVWd2qyLGHt2RFbU3IyQHyqGHpUUXlKQ8ZUX5TH1AUj0CMZp9Dr9BIJthnWTYrfTlHX
	 g+vJdsv2uC66vebr0u7YYLUEh1frQlBfqeZ2KpxS4S1s+Iosf33E/9Ls8HG8vRfHY0yL2
	 BYJzQE6YqgzhXorTNGNB48ZHm6peQRJFrKq8uCFhC17hGiyo95CjRIYCLQd/DEIuFX9S4
	 ZMOjH2vlpZ+5CB+vMj6V96SnFNYjqjbDK5QoXeuiw1XfsA2nNtn4v7RUOo5eosv25vt2V
	 SfAtpXPgD659uFuxS5I7rhkghJ+Bf0tOeHlld158p2FcKr8ccCXLJg3L5qWOgtI0R3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pL4qpUaO;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE660A2614
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6AE660A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pL4qpUaO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=AQ
	5jSJI1Kxt5pKE/9y1epqNS0CAgxyq8X/eZ/7fltn8=; b=pL4qpUaOxlzxOtBdbq
	/0CyBQk5OtFJKKEtUD2kpGGG7JDEGHC7ObCcIFfXJ4la/sxRVaVNu9yo3lreRETR
	3s9INAVwyIHgiPTldIwmJqV2RxWmNbU3m+5vgfN99waZ9fhrwEKDwWw0ji7uvTUn
	AKjKU1ZE3mmzakJbBxa1H9JSA=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n0ksKtdq7UkHBg--.56105S5;
	Tue, 20 Oct 2026 16:45:36 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 11/31] ntfs: handle source record removal failure during attribute moves
Date: Tue, 20 Oct 2026 16:44:01 +0800
Message-ID: <20261020084421.2196486-12-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3n0ksKtdq7UkHBg--.56105S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF15Gw43GF43ZrWrArW8JFb_yoW8AFWfpF
	9xC3s3KrZ8Ar4ayanIkF43Aa40v34xGwnrWrWUGw17uF4Fqw1xXry5tFyxXFWftF95tr45
	Xr4DW3y3C3y7ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jHHqcUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RAn8WrXKjBZWAAA3J

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_attr_record_move_to() ignores failure to remove the source attribute
after copying it. It can update the attribute-list reference and report
success with both copies present.

Check removal before changing the list entry. On failure, attempt to
remove the destination copy, mark its record dirty and unmap it, leaving
the list pointing to the source. Report destination cleanup failure
separately.

Shrinking a record to zero needs no extra space, so failure indicates
inconsistent record accounting. Return and report EFSCORRUPTED even if
cleanup also fails.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/attrib.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index c59643fb766a..07fb1c77c7af 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3576,7 +3576,17 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
 	nctx->attr->instance = nctx->mrec->next_attr_instance;
 	nctx->mrec->next_attr_instance =
 		cpu_to_le16((le16_to_cpu(nctx->mrec->next_attr_instance) + 1) & 0xffff);
-	ntfs_attr_record_resize(ctx->mrec, a, 0);
+	err = ntfs_attr_record_resize(ctx->mrec, a, 0);
+	if (err) {
+		err = -EFSCORRUPTED;
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
+		if (ntfs_attr_record_resize(ni_mrec, nctx->attr, 0))
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+		mark_mft_record_dirty(ni);
+		unmap_mft_record(ni);
+		goto put_err_out;
+	}
 	mark_mft_record_dirty(ctx->ntfs_ino);
 	mark_mft_record_dirty(ni);
 
-- 
2.51.0

