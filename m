Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2BD399364
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 05:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485716; cv=none; b=Nc13pWFAB4eShF9fLMbKGIdxQhbGbEsAjvD1UWZm1e5zbM7gN/QoQSQQTki8lmLVwngAgrdPvMHG/HEZjZuxOpTihyBs9tTWUJ39EXIUqF2ZrqtJrVlOdnt0XInAD38aQV3SLfKR2EVnnDASsbnZNU0GG6eAFQDO3XDcf06D+Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485716; c=relaxed/simple;
	bh=6xXPxNSmsFKV2TVA93HTty6D+P8jZ+V6clCDU9AmmVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxRT6okLZTexg8iq653Y7Tg7YMKvRpTDplj7pMgZuNuWrYg4tUYRb7w25UVPr5NDYfLREeVrQXd4peGa8YZxylh05jelud4EsbjIA2T9RGYc4NTUkMECQiSaeNbfqQUz6BZBXKQKJhpmqZ18E4IDck5IjnxjICnFEelT17q8kLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j063CJBF; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j063CJBF"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so17865625ad.3
        for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 22:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485715; x=1791090515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFhbuoDvUhhT0NM7dVUo0Ay1NU3i0WuHFz8vsUDnISE=;
        b=j063CJBFz1qv71rbIadlosXk9rD4rPR8psX3Zh9xQUEi6nNVyUo8zRnbP9zyuOO+l3
         xGOXSSXo32oKKo2N93rZw8GQK3GuZFxkQn+7iZzTCUpzqoUUp9tNl66QU4QDFnr3Sk1g
         G5zXNGI6mcBNOr6x39xS7VHakrQzBX2ROd0s4DU2BtufAdPXdz4VBOFvOl9TRiU6q0Ed
         jRxHJOmq8CxG1P/6yUi2Z5KnoahaD7ex7dpmcTWllDJtKnL/Joa0zXmtdFlC9e0J2f47
         McE9KXdC6basRx/NBeQMKc2VeJ8Enc8jaR8nlxKYNsFlRs3RjLRk69ejcPMtt/ewoVo+
         5DnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485715; x=1791090515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFhbuoDvUhhT0NM7dVUo0Ay1NU3i0WuHFz8vsUDnISE=;
        b=XufOmXrHlPjopKjt7sWHBs11Hau7iMIpVnHUa16t2+DkeyfBFGEQ3WbFWv4tuG5qQL
         sW53z3oxHwzvNauGi+8raMPrOVkRCbtlT6eumcBVTH6InvsPmU5qCCScaVeaLFKzLOM1
         1Q3OrHKpISRZhuslpLYHcrHhuzB7lZS5ldxU4JQEfkL2qTTOMm7eZwxVuV94SKG8dWix
         FtYd/y81XhRh38Zlo49H0q2/Ikn15k9WjWWLotawDp46A2uQYIg/mdDO/7rUZHlzWEoB
         uB7K8g7Tr6b8IK48kVG7oSk0D+9L3QjOVFdpTPP6z2ZnjD7G3m1RkS62jna3tH1ApsyW
         KBuw==
X-Gm-Message-State: AFq9FYI68QC94JYEwzYe4shzc3j2uFm3nwMC7fDFxYC4pPGMvF7yRALF
	JTCenLysQYIXohBMNLC7gLMTQ0Amaws7z/QnCTNqDL526hD4ONfStoES
X-Gm-Gg: AYBFou1Q6U92E6Ne7mkNEOiz12roxh4o+wVgKXu0qfa+ygfKaJ7+TLfTHE9c2H2L8pX
	IlFpUdv1jyv/QAopLCMssftLAZlw5IoX1fn1daD3xE173gsD4bq3vrMW3vNMu8gZL3IlqpQK8V2
	1ENiGqkT31eU6jL7tiXaDdl21YHHcy9l2+xrZDHW1IgKAOzqbi05whmKv5x9bXM6SEHxW8N2O9U
	KuBYRCoFOwTlQThURXgKDwkmhXQ4/nGVpeLYgPVuDpmvMaZlQx8dQI7sjqkwt0sxnlkqtYt9Jbw
	7jNgC/+RgjohO0ocVdUdqiVO0Z5HlJwziUoKgY0f10Wx6xG08YFuJcFkLwg4VuT5wuoNWiOfUsP
	23Y9+2FeTQnPssnr+0xMSXK3+aA2jxnQ3JbqdYpcRVcHMsJ4uHGoxANS+k+EWc+JfMjfBCk5O0q
	/6d0cZ7UbRubmdLrXuWoM6u5QFnridMW3wTqOmaRUzngxJikaYH+ZxQKIguafFgGDQoYzZ0g+TW
	f6Vb0BEAfp7cFt/q/H2ag6oNgiuu7q0brvf+6gceMO9pf8ieA8Vzc62r8PkCwaKE9pZka+C3qEF
	Xjya4M0Bec38kR5J8UFUaZGOi5I6jZFIpsazRGhHRtxRc9MU75kBFZR9sNs=
X-Received: by 2002:a17:903:1b70:b0:2df:4876:50d9 with SMTP id d9443c01a7336-2df9499777amr48858435ad.18.1790485714624;
        Sat, 26 Sep 2026 22:08:34 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:34 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] ntfs: do not turn an unmappable runlist fragment into delalloc on write
Date: Sun, 27 Sep 2026 13:08:21 +0800
Message-ID: <20260927050831.2739166-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790417653.git.matthias.goergens@gmail.com>
References: <arMoap0ZgeORuktT@hyunchul-PC02> <cover.1790417653.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_write_simple_iomap_begin_non_resident() has the same unchecked
retry.  LCN_RL_NOT_MAPPED passes its "lcn <= LCN_HOLE" test, so a
buffered write into a range whose extent record cannot be read is
merged into the runlist as LCN_DELALLOC over clusters that are already
allocated on disk, and write() succeeds.  If the record stays
unreadable, writeback fails too and the data never reaches the disk;
the error only shows up at a later fsync() or a synchronous write.

On the volume from the previous patch, after a read of the file, an
8 KiB pwrite() at vcn 1000 returns 8192, fsync() returns -EIO, and
after remount the range is unchanged.

Fail the lookup here too, with -ENOMEM or -EIO.  That pwrite() now
fails with -EIO.  Writes whose range can be mapped are unaffected.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/iomap.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index c812d7f19b360..b4475963e57a7 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -394,7 +394,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 	loff_t vcn_ofs, rl_length;
 	struct runlist_element *rl, *rlc;
 	bool is_retry = false;
-	int err = 0;
+	int err = 0, map_err = 0;
 	s64 vcn, lcn;
 	s64 max_clu_count =
 		ntfs_bytes_to_cluster(vol, round_up(length, vol->cluster_size));
@@ -429,12 +429,24 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 
 	if (lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
 		is_retry = true;
-		if (!ntfs_map_runlist_nolock(ni, vcn, NULL)) {
+		map_err = ntfs_map_runlist_nolock(ni, vcn, NULL);
+		if (!map_err) {
 			rl = ni->runlist.rl;
 			goto remap_rl;
 		}
 	}
 
+	/*
+	 * As in ntfs_attr_vcn_to_rl(): a runlist fragment that could not be
+	 * mapped is not a hole.  Treating it as one would put a delalloc
+	 * extent over clusters that are allocated on disk but unknown to us.
+	 */
+	if (lcn == LCN_RL_NOT_MAPPED) {
+		up_write(&ni->runlist.lock);
+		mutex_unlock(&ni->mrec_lock);
+		return map_err == -ENOMEM ? -ENOMEM : -EIO;
+	}
+
 	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
 	if (max_clu_count == 0) {
 		ntfs_error(inode->i_sb,
-- 
2.55.0

