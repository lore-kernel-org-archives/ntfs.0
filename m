Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793177002;
	b=wnArBV0ZRsHnA5h3SImJuVDIQrptzbG0m/7iqu6qAdp2WMahqhNruafnkhffbiT9Ckqh
	 uczZiYeLMqVYXa6HVCfV3lkQLFZVlle0Hkf+UemkmqppFkzknenTABLJLkUCjWGpJGUID
	 MgMH54DnU6RRvwuc/cMGoIHKcp2xDkvfaObKsbOw/0NwU7yjt3VqLkkW15q5ezyBTeyS+
	 j9ZA5+Z/Y93HFPu0J9FdLYXqlpd1K0P7Rj8WtKbx+ALIiLqn/it4wrCyerk1lAIxRpUu/
	 w8tjxyJaA54zbHQ/pX2XWD/7KDDX1uaEg3olOU1Ie27NOoxiwsfyAt+f26My9mAJTpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/f00xqu/lJLCaR8LURrZmX1rRMg+ZkZe3FpzcN/t/CM=;
	b=T6DM4kr3yTHol+jqZdtNOXhiqKYatbRx8d9qE1+Umz+SASOgNEYCsCIlgjf17tlPecuh
	 AH1+0hSrfrATN60UPXoxFTCZBNKInnXQbSCVDhDYQlAN04U7JEbgDJMSxoT7+8+AGzXJP
	 XY1hpj0wsp7wU5iA2sfDvPhuBtRT93GDnN5+QltwfZMqwGcOiPQr0mnafAhUjDmIfi4D7
	 JS21vMtGHEJ2JmWqeLmMikqZxIujcVf/Ig5Ne5RmupnmDZMluEVFG3kjjU/VfYHCgO/Ol
	 OY8Y77mzjlC5CptaSdRqPBjggOV7Jl/YIpiNxkw1gxKIgL0ZWVq1CZSCgCzaCwHI3Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jds+CBUI;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0910606A31A
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 08:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0910606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jds+CBUI
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso532232b3a.1
        for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 01:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793177001; x=1793781801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/f00xqu/lJLCaR8LURrZmX1rRMg+ZkZe3FpzcN/t/CM=;
        b=jds+CBUIf7LxgmiPhmmDDHaQVrxUAM90Tm2YnyW5TLxdp3u4jMdtAmquGRG62Atxn9
         VZz7gT99owHFKcsgmeSkbPIqf4oMHie3OKcepNL+uerr1c7OFgIjHrOmmx+qUVbyhFK6
         lkXtnuK7H6Q08oxjHXycceFLRX6ddiXE3ZiDSW6h6ErwXMN9pM6ytQWz5AgFK3FmdZ7J
         VWm0/gs/gKLitEEZG3vKxPCm7/ZA0qN/PuGAFfNuMMtakHdY/mI+J3y1yDuqTLVK8DOp
         eVoE9oJcrxhKyfARA5tufSMWaR6D4QWnrIazm1XPYK/WMJ31SYm8hmwbxbuvxrWeDF4p
         VeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177001; x=1793781801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/f00xqu/lJLCaR8LURrZmX1rRMg+ZkZe3FpzcN/t/CM=;
        b=xBdq+/0TDQ+QjeLB3wHgSmAXB+woOFFfZQNUn3FmiXbHXAv5AGJikGb/AibgKEs6No
         nPvAH4CcKlxeho+qdc7piHmqzjSJNbayhCBY8yIc1BE9U5XnZSOTzNKakp8yjR/sdWig
         7lBy/e8guoKQeRf6zm/GNhfZVnBd+ZaEvfieiDt5ZDogM9mjj0XY6dNVX905Np7418rl
         MqGMcsUyzZU4LxSUQ79FYDHm5HMxrFKs53eJo0zAOl8JltfonqzbQqQPhWcXGTritWQO
         ybjnDTxJ9+T9dj3MCwAkUVhI56uoYIMwehVa8kFW8F+D6jQhngxHPnDTo7smJ+aNtQUP
         nexg==
X-Forwarded-Encrypted: i=1; AKwUvByDs7u0ikI2M5sWSTZVrfeUqftcppmHR7vm4Cw5pO2gb1IKsks2BNvmt5ULqrbJsH1/mvNT@lists.linux.dev
X-Gm-Message-State: AFq9FYIGUfOunICYMwPOwMZwmmZSaI8pivUPJccwQxx3Xzob2f/W0Qyp
	4PN3m4vN8PEzhul1vzN5XmEkqzBcf4/HqIBi0fBgnC8NVbHSL2fGzGBw0NK9HzPh
X-Gm-Gg: AYBFou0oRmn13+4pTS0Hc6maY94C9lo8DZx8p47bF9U+gAe6NAkl8cOjHAgGSnfcfIJ
	FbKIqH1+4S6NVN9+DC4iLBFZn0n37yBFZzQpE0qnzWNlqFjGZ3pp1m+9+G6ShkviLPegBVDf0Vm
	2qeqFlmavhUcD4UeWkZn0BpsUDKCD3i7n3HFFPhS32hekKT1DRuOKoV9d1Fy1lEZoGfIDGhdnGY
	IZdjU8lvYjV9bVyckx/jbaB9sdqAex1CtKaep+5kTCAytDEvFpaNa4LJcpGcbshXgfHV2WKu7ly
	05Q8SHjJIU3DQQOf3IZaRpRp9ivewgur3JxC38mfCRF/QQ6eFoAoY6Kd3L0NKmLNOqb7jzEDmmX
	iVtdTIWPxA6SzvUxq6h8G73oFzWGHfBk8MypKobOHFhKtEg26+5JOVrPCS92TdTbTVpXXgsaq3B
	FbUAzYOOCrYJbi3UIDzNKZKuRGoEfKOkyr0m/NKO4M60U+3gT/HevyMqT2eJyLIQudaAESZrHQq
	NB+O65CbNjR3mW5zMz4eL4GDCvI8UGnOSue3+g+hlYL2YwfQDAWqZGP7Nz39WHr6jOoO9YoUxSU
	BA28nKbGltPkyu2LPXkHSROX3uaAtEimTkQ=
X-Received: by 2002:a05:6a20:431f:b0:3e2:9126:6128 with SMTP id adf61e73a8af0-3e9020ebceamr1786611637.9.1793177000925;
        Wed, 28 Oct 2026 01:43:20 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cc9b25a3sm3756367a12.2.2026.10.28.01.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:43:20 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH 3/3] ntfs: avoid overflow when limiting attribute read length
Date: Wed, 28 Oct 2026 17:42:48 +0900
Message-ID: <20261028084248.2149976-3-hyc.lee@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028084248.2149976-1-hyc.lee@gmail.com>
References: <20261028084248.2149976-1-hyc.lee@gmail.com>
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

ntfs_inode_attr_pread() limits a read to the attribute size using
pos + count. A large count can overflow the signed sum and bypass
the attribute EOF boundary check. Compare count with isize - pos
instead, after validating pos, so the read length limit cannot wrap.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index b8a1af8c4cea..54940e22668b 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3721,7 +3721,7 @@ s64 ntfs_inode_attr_pread(struct inode *vi, s64 pos, s64 count, u8 *buf)
 		mutex_unlock(&mrec_ni->mrec_lock);
 		return -EINVAL;
 	}
-	if (pos + count > isize)
+	if (count > isize - pos)
 		count = isize - pos;
 
 	if (!NInoNonResident(ni)) {
-- 
2.43.0

