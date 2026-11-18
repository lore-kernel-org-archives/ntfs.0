Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993127;
	b=vLEvatJMIMmAilushxmtXo8GigOwZDKSQyYiuJII940CDjTpCBfxNAldCmLWG1q/nm71
	 tfm2Z4vHzdPrVgRuseU1s8QZDb2vMZQqkFi9fo4Bync/QKYjrUJaeYxY9QToOseQgd7Je
	 fHe5PeJg+YjtWf8UN3mRB0/vwTuLUfXRqa5WXXi2rfWhR0tPFv0JUoHMgzr2RfJaXtgOw
	 aGptRPMLaekt+uh4RzSAsDxO+uKsG5zgLjman61CqmTl1zLWK21krQcVHbNjYdTFCF1iu
	 4m0SBBEv7sPhuILhikpKpqAT7URwyY//M1/lk2y4lb6AfMoG2TENIr6M/u4r83SJmaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993127;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=SgfZ+LNnsqWZfGGf7VC/KCgYqnX/cf12Sh4IpDvmxqM=;
	b=g5rwq6if6YqCdJgxe4BhyGk9p03iVP8dGjhhd7Po7YAxn1MKTXl+hQYRYVIF1XKw9xOG
	 dHR3JsnP4WfHdVhPGAjF9WTUZn3skNmAPMhgu33BayUIUjz7jFji7d0akfaxXXxSFX80C
	 TrhqRGpJjZ4CPZhyIpZu3CAN916/IgvfKGIV5dHHUG28vWgH3mXT8Lyq7GzCJMnnNjphr
	 YIeGNL/ZBPvwrfPkWN7am1f9LUJf4TBrlRpK3JlFBbSIKEpT6bYEli3T2S6VrEyP039O0
	 TgKXXYRrukryG0djrrlrf2Umw/BNZrxjFWTF3qq80dFKszSmFid4SQyIf4sY0zwIzYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Tr6rp5UU;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32D3606A8A9
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32D3606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Tr6rp5UU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Sg
	fZ+LNnsqWZfGGf7VC/KCgYqnX/cf12Sh4IpDvmxqM=; b=Tr6rp5UUp2qwMpyYKy
	eG7VUOHpy3yNJX1Pf7M3rl8+NVlWcDCjQLh9jmVTisIY1SVnvt618Acq7KcNlW1m
	L0x3UHOnOBywuCnDBh5dhlisTUalpsH/h1aS81hqxCgYa3wki+/SFb8j+sk+VR2D
	cFBTHkoiey3WgjZDRNMvea/1E=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3v0nSa_1qVwxBIg--.34758S7;
	Wed, 18 Nov 2026 17:11:50 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 37/37] ntfs: report attribute move removal and cleanup failures
Date: Wed, 18 Nov 2026 17:07:01 +0800
Message-Id: <20261118090701.1858849-38-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3v0nSa_1qVwxBIg--.34758S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxJry5Gw4xWry7Zw1xtF4ktFb_yoW8Aw15pa
	s7C3sIka4DtF17Kws0q3y2q3WI9FykuF45Xr13G3W3Z3Z8t3WqqryxKFWFga4FyFZ5Jws8
	Xw1jv3y5CFy5uFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTq2iUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8BYqE2r9a9akJgAA33

From: Xuewen Wang <wangxuewen@kylinos.cn>

The earlier attribute-move fix checks source removal and destination
cleanup with the pre-existing volume error bit and log messages. Keep
that fix independent of the new reporting helpers for backporting.

Replace its volume-bit updates with file metadata reports. Report the
source removal and an independent destination cleanup failure after
releasing the destination search context, preserving the return errno
and both diagnostics.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Add reporting to the standalone attribute-move fix in this final patch.
Report after destination context cleanup and keep separate source and
cleanup failures.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- Eight controlled attribute-move cases passed for this stage,
  including source removal and independent destination cleanup failure.

 fs/ntfs/attrib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index eae88b45d05e..c7e32ef15135 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3739,11 +3739,11 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
 put_err_out:
 	ntfs_attr_put_search_ctx(nctx);
 	if (remove_err) {
-		NVolSetErrors(ni->vol);
+		ntfs_report_file_metadata_error(VFS_I(ni), remove_err);
 		ntfs_error(sb, "Failed to remove source attribute record");
 	}
 	if (cleanup_err) {
-		NVolSetErrors(ni->vol);
+		ntfs_report_file_metadata_error(VFS_I(ni), cleanup_err);
 		ntfs_error(sb, "Failed to remove destination attribute copy");
 	}
 	return err;
-- 
2.51.0

