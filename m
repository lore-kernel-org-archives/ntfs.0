Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870B537A847
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786051; cv=none; b=jLjmPiMS5DcEtmTA/UlnCjaxE6Z/MaSD05SKGK0GLeYGNSXdsT65m5UKjnBhcZMPceeqZprPRZrZMpV0EwsyHQ512Or2JERMNuPKpOuAr21GEvSBw5mk11KLvzfHHv6zroxF3clDOwtdqdgb+4UbvkUXpftVyebvi3ftuN0EqLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786051; c=relaxed/simple;
	bh=8oXkWJxXLk6r2mXf+O8P0D81zPxTgLXqzVRb/j1nEE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXOHJcrNeXK4nTKP5YghksILj4CT6t/g56JagKZwEbc6HFAn6vZvyuHYNt5THtrf9QC/6AR3it0X6vYu2W4oD/DXG9uey6/tGNGraE9yJKnwZRvmbVsDkqR+4h6fBba7puIojIXo9iqEMKAsL8+OwJUouyQTrfVvOgDWl2DiPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8LvPLDj; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8LvPLDj"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc502d509c0so323420a12.2
        for <ntfs@lists.linux.dev>; Sun, 11 Oct 2026 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786050; x=1792390850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbHsI6frsHIB41psCPxLJ9ys+iCKk7bXzIuJcw6lvTw=;
        b=r8LvPLDjG6fHdo+aNR96uWF4+IhlIhYscyy1codTk6HIqL+G9PepcRXKbRHEGNGr7m
         m5Z70lo28pn9oZOFbZhjtUf4p/yyLsJEdYsZOn99aTrNm3m46b5qZpo0vBkvNdmoGoTF
         4IZPg8olOl+5k9O7KamWN74Mqu2wOwTs2I+NFv65zC9Ya7qUBN2mW+UIDPwdKxpdOTAa
         CtWyDKiKRJvqxWOl2y27Kh/7SsytijE7PJrGNro9U+AmKUW8G4UTFzNPopIvFsoKdbzQ
         6VuQ24Yngq3URqxFoam3bz/jAvEXCpxB2zwE1MFsn1QHZfdAdfz739ttSjKAcWrkjOi3
         mtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786050; x=1792390850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbHsI6frsHIB41psCPxLJ9ys+iCKk7bXzIuJcw6lvTw=;
        b=iJY+Qp5e2v9G5MlytHPsmqENmkgKnDC3LuU0Nz+cweijJvEygFh/nHKdDAfDvrNRol
         KApk0fhBSOcK2dCEUuj8AECO/BoybffE1F7R0yqqGEanJIpTgp0Wmu3iS/flolcwVCQK
         t9p79ByV2mmWk7EqboNjEplBmCNu5K9YdOKlkThe7YYfNpK6vac+oMvd+pjm/fZUSSdi
         ke9CWvqkbfEcb+/nCbpGw/kXRevLE6rwHfyA0YKYjy+zbxSQbCbmrMwUL2N24qh8v1vr
         6n3HEGbtoHkVRnU0xfvsDPb5QrjT4NEDujRHNG2lyFXUaApSYQUm77N9B99IMeaHKMEs
         6J9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZC2jX2vJmwX3yf/sjqDxoaBGrL+Bxgs3fEMITwm6B3Ty1kNeTYGsm39yCsoBXp3CMro83@lists.linux.dev
X-Gm-Message-State: AFq9FYLnHQViTmSRVzuAfgciHBNoY/pa/KRlHNTFFCufpb5yacWyl+5J
	3hCNOeAihhUmETAyKw4SaTVT+iiUy/Np1MJCcdZl1F4Nr+g4QP1nMYQI
X-Gm-Gg: AYBFou2+kbLUatXJPw7ChvnxMQNocOpdtlQI2TYyjFkW0LbirbWoShYIaLVvNkZKcSg
	XJlbo1fGIUVK1WUSlfI0U/funWTxqtsJp+c/zv/jLyTDTbnwWduNkHCvBtEAlworVd/anCxjz8Q
	gcNdM21pYLzlQYJnUVGhMyPx9HELXWWDg8RylISvfzlKEXQIATrK1aZpbAkiXHx+jezDktwn5gl
	oOb2yi4brmHG6DD7Y/SvID6azBAt62d4Oh3yZH5SJrHPAH6XOnYRaSA3fRVWGMNl19bWP6pT0sS
	l3Qxi5AJ81jR4tSBg22XXZZ1pwa6fUc/DG81GWTBdLZpTKZYlzxkPT/whJodDi3u9PwG8fVGqFh
	EkF9PTQZ0hfWselF20lvzOOQJK9mg/lMB06x5X9JyW5l1DcoUYh14P/loXtFnIWZh2OJUy8T06D
	NAD6pEsIwhJ//6GJ5ecku3K1VR5tS+2VSAFHT/9fHQC1n9Fsl3pUU8ioi8ivWCQFNqKwPYOR/JX
	i7ge6iXpfbvoQdtZwcX9A==
X-Received: by 2002:a05:6a21:3297:b0:3de:463c:7fcd with SMTP id adf61e73a8af0-3e16baa6e51mr6873235637.4.1791786049787;
        Sun, 11 Oct 2026 23:20:49 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d93c2c75sm3990091a12.0.2026.10.11.23.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:20:49 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 1/2] ntfs: do not read ahead encrypted files
Date: Mon, 12 Oct 2026 14:20:39 +0800
Message-ID: <20261012062040.3826828-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_read_folio() refuses EFS-encrypted files with -EOPNOTSUPP because
decryption is not implemented.  ntfs_readahead() has no NInoEncrypted()
test and passes them to iomap_readahead(), which maps the runlist and
fills the folios with the raw on-disk ciphertext.  The folios are
marked uptodate, so the read that follows never reaches ->read_folio
and returns ciphertext instead of -EOPNOTSUPP.

ntfs_read_locked_inode() sets NInoEncrypted() and NInoNonResident() for
a non-resident encrypted $DATA attribute and rejects the
encrypted-and-compressed combination, so none of the three existing
conditions fires.  read(), mmap(), splice() and fadvise() all populate
the page cache through readahead.

Skipping readahead leaves the folio unpopulated, so the read falls back
to ntfs_read_folio() and gets the intended error.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
---
 fs/ntfs/aops.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index 517d9a1563e7d..ad781674fef1a 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -240,10 +240,11 @@ static void ntfs_readahead(struct readahead_control *rac)
 	};
 
 	/*
-	 * Resident files are not cached in the page cache,
-	 * and readahead is not implemented for compressed files.
+	 * Resident files are not cached in the page cache, readahead is not
+	 * implemented for compressed files, and ntfs_read_folio() refuses
+	 * encrypted files because decryption is not implemented.
 	 */
-	if (!NInoNonResident(ni) || NInoCompressed(ni) ||
+	if (!NInoNonResident(ni) || NInoEncrypted(ni) || NInoCompressed(ni) ||
 	    NInoWofCompressed(ni))
 		return;
 	iomap_readahead(&ntfs_read_iomap_ops, &ctx, NULL);
-- 
2.43.0

