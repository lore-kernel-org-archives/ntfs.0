Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4AF386566
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973070; cv=none; b=QTxr/4PFM/ZHl/OtBm3/nu1OfjTwker7xzf+hX8zcLysy2Xq4qag9t93h4tJQp9pGJc1OgdkDhisCauIOHl+nHHIEX2S1MWOXR/fyfbfrcmh+jRxhsNLJiqqwbLDiImuacEchknXnEQnDyOHn3VqIVAP4uqZHJLRRh0PK1JbfWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973070; c=relaxed/simple;
	bh=ak9dADGghcuChCCYufRRo9PZpvy+34D/rUyr1Vb60so=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FT51LpIzyTTt/cU6yyfr4pV7RbGX8DHxaebBwbXa20ry4GGs0W7W0mZm/JjiNte87kNf4ta0N7DMiznWzzIzLeFQv3E01ZSwavYRWdSg5OVSgcalTg1Dej0L341txwhuk1R01WRDJfu3x6+9yXbIHgeyuCIKqQ/FWnlA8xgqbvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOgyIvlT; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOgyIvlT"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so31600665ad.3
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 23:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973069; x=1790577869; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftIvz1rLTkqHy1BTg2ZR+qbQLDLbs1QKXbJpaRGt6bI=;
        b=TOgyIvlTtyE9BC/FaebNaxCZC+14/+/AR+Hqnu2Ist4RsXMFIB3mizgZnEA0rwrw6n
         R0laSXJI8IDDFmBjt2U+pXZraEOCY54JV8BWjJv5ravsKZZ3B6jvV2ssUQ5bPO7yiDVI
         e+lhhzJ6fdL9pCsvhQly5oB+7Rfbv+M1ludPVpTKo3Kf8fTyykAFNtVZXnRx21Li1QRX
         dhObpSPRRvCPrU+B0CIe57S6nJx97IQ3cQ+JVVefLt00iGH7rfh7zpEApmuZ3cOf7MKL
         9BSCEIJ2bx77vqaWMkc6gc89SYrhmP/E/Ak6cjvLafyrhSg+Dc9u/Fb4i/I+PCUSj/yO
         tq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973069; x=1790577869;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftIvz1rLTkqHy1BTg2ZR+qbQLDLbs1QKXbJpaRGt6bI=;
        b=LRFl+tmp/ueBaKFS1N1j7pCYfpIYQJFh9Wbnh5CWKSeHgnjNR/vxINW9w7m1N0dins
         g2IUcM17brKxy4djyFwJVdOXCsXJGKw6SDmlRUgoEnLXGP6OnFwTiv/O6Dvz4oAqRwA8
         sCYnGeiePea8ZCbdlvTYMlRRrGZx4Z/INl5NJ1PjG/IergOnQvXATbAzmBrVgpged70X
         8yiNGBrG3sN3OHRsblcI+TlQmb/VZvW2+p1fdbDol3/CyTnVxzXlBHcOGRhHyKfAqo3z
         Q+SxUMxVXzuX1u2Cjm8oTIoR8h7PlBKX+J+HTaGwdpmUbPtxsSd7um7XFwZXJgzJ4To8
         X/HA==
X-Forwarded-Encrypted: i=1; AKwUvBxdsz/JRyjFgCEXkfesvgnV/77EOdfjhJgcaXhFRZNMX8MYlpLmpXdPp0IjU8Fbfy9F1OsL@lists.linux.dev
X-Gm-Message-State: AFuF++nOJu+Y2EcLbjd7SwgabT5CnZjCqf+hm6xyu7VsoFVGytA6pUUs
	gAfzNzLXeoBXl+rltlsfIuirnae1UXA9BMYClMAe38dyBN/luZ4IQsqe
X-Gm-Gg: AYBFou3W+Rti8qISBmB/WSEY9EYlNz7SmwvKkt/HJ/AqdKpqVZbW12yll4TCADvepDD
	TsKZ1sNOE53JNRCqKEaDNNJSkEAJXUY7+QWLHXWjz1cB1rkr1pUsZdyfO45EovED1/j0P//MiPS
	COa+CzL+BmsrxPmQcDhpUn6wPQxMEPgdO2AAwW7awPVDg1bm3qoXDdJBVmmkP7+piqagaG8OE0n
	+Tec66MbB7jaxn/Oj/ZjFvnHnQMdgfBALHEXZ9CAwcJ77LN1z+eOu5bmosc6L8sYpCbdbbka5rB
	6OXA2xN1Nxk531HlV0cKWdlsdgWgiEn00CM1y2uE3eHEwcplq4r/g/Ve4yhj8bopGU883sDbeP+
	FCkV5xfTfW6QwOnp8ov8r4WfBzcYLya/os+f8zgVddLUJGMeCtYgCku0q9solB4NXUrcmR7/B21
	L3azeloVhsvusqhOwpYcbXEtjdVwLT/nHbCShavltzJ3Srj8GaGsOE2hQg9nnF84JR6GQ6RR8Wp
	lAhcb0Wmxo4N2PS
X-Received: by 2002:a17:903:2349:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2ddc100a706mr84160885ad.50.1789973068541;
        Sun, 20 Sep 2026 23:44:28 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc180395fsm28097345ad.81.2026.09.20.23.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:44:27 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v6 01/10] ntfs: read MFT writeback bounds under size_lock
Date: Mon, 21 Sep 2026 15:44:03 +0900
Message-ID: <20260921-topic-4kn-lkml-v6-1-75069f590b22@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
References: <20260921-topic-4kn-lkml-v6-0-75069f590b22@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=ak9dADGghcuChCCYufRRo9PZpvy+34D/rUyr1Vb60so=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsNIJUmoLpBlqtKv1k2NIgUVFkKJBO3us1Vrrl
 RTPQjCKIjeJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarDSCQAKCRA08jD6945I
 0zW+D/9bgPD6T+PALPcZetD8brPfhyCnH11bQTcJJR9vlmuFNeOE+lXZEJ0369u/AirM835KglR
 dp6FyAew0XPzoU8SJyerypzS/SiMled6+sS0LknBRr9TxjAbcAJufbVnl61L7oMNDS/G+j2xcTm
 s++I12DNMGjXGe3qYWTXGKlV7TOBgB+N+hMynrKhpZp1ML4So/eXIqJUEugY2AXQVBs7W1id74U
 dbx0L7iqfGihi68rqzK4FcO/TS4o+AIDNwl07ytXN75zxT5tfgonWhlIKB+YUs94AVCd9bI5gSG
 oNvcPMvvimZA7qU742k09BNSJU3WTmVefQWFyR1AIt3R7e4g6HIYAvms1rFc8BUKWRwJoNHIZ7x
 03CnuQ77wT63yEPzgnQnQE1PczXvYhcxtaCjA9bQo89dBTnwFuDJ3g0amS9/wAhcp64WTB8MwIS
 7pNkwr4LEeoCQdJ0uv2H3rHAd9ABdwRoe5qocDWagDHuZTqPfIhR9xJcM79SFq8JzHGmkRltcyv
 6WAOodrouaLZOU0Gu3Ec/L+OauVw01II2Me0qxAN+14hxYzYlsLeWzQl9H1a5XqbOSzzuOWyEjw
 8JwqO4YNBNk5d23WdtvAvAQtKJxFOqjrWSVRBQxtbR99jYswS3kSsFvF7GUFFlu6eRQhUjHH70W 4/59BVQvQbFwcYA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Read the MFT inode size and allocated size under the size_lock critical
section before deriving the folio writeback limits. This prevents
writeback from combining an old allocation boundary with a concurrently
updated file size while the MFT is extended.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 4b7449495375..c9ea11198aa6 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2901,9 +2901,17 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	struct ntfs_inode *tni;
 	s64 lcn;
 	s64 vcn = ntfs_pidx_to_cluster(vol, folio->index);
-	s64 end_vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
+	s64 end_vcn;
 	unsigned int folio_sz;
-	loff_t i_size = i_size_read(vi);
+	loff_t i_size;
+	s64 allocated_size;
+	unsigned long flags;
+
+	read_lock_irqsave(&ni->size_lock, flags);
+	i_size = i_size_read(vi);
+	allocated_size = ni->allocated_size;
+	read_unlock_irqrestore(&ni->size_lock, flags);
+	end_vcn = ntfs_bytes_to_cluster(vol, allocated_size);
 
 	ntfs_debug("Entering for inode 0x%llx, attribute type 0x%x, folio index 0x%lx.",
 			ni->mft_no, ni->type, folio->index);

-- 
2.43.0

