Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079725;
	b=JI18pzAiu/kMkoeqPs6S9Iae7VWG+lm/LXoRugrep4LkyekZOBdCxKCwePyUKGskRhwe
	 LxQz4+7J2uWem0QeXVLNM9aXHim84uKqcXxAjSXFJ356bFTaUzfJLnOnR7c3y2GoOCKRk
	 triq8lwTOsu5npYmxTq10sLEJEpKOAwjVk/+ivAszWzJ3R7uyTMq4dGzQCn0mSpocpvq5
	 eUHn/RlnKivTzVOTPcMKpn6NLnr9rtYY6dj1VjhOYrx+NhJcE6OLCyjBQ7FPsayXdIhl1
	 zSHPCsCddk+u/H+oqkBkUCTGOSEVpqRHcx7yBK/yimqAbKMYzOeb/NUe4JsICp7SaQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w90szJpdzekfEVNOhw/amrduU9AsVHLVBfjyoWv/t+A=;
	b=WVxl9ymTzlB7HVhyDYU3hcRH+RbyLxJ/T0Ht8nh/cOHVMXLfJTwz8kJ72xvYSf+Hr0Us
	 3Q5BQZ/kTGby8/h38ItugPvHRo4F13IXQ2iIik1WMOP/bjoGk0uwsMCB/Osc7uE5oK+G2
	 TOa81AadLmiAf2LTpdj8V5eEVarhtMHT8AosBGjktdLZB+A0ycdHe4F8T7n2pwYijGwr8
	 4aaZ3CpULGkxEVtcszTGLQpc0sZeCjHETNeUbz1tn74cysBqzBns1Yyp/o5RqUZfTP6Mn
	 IRBBP7RhW5oKmg91c8ZXQewF9N+Okb5H0ymZQPpfupSVFCdFaq43GLZaobD8eMc92vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0h4xxKvK;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3856606A32C
	for <ntfs@lists.linux.dev>; Sat,  7 Nov 2026 19:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3856606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0h4xxKvK
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso57296eec.0
        for <ntfs@lists.linux.dev>; Sat, 07 Nov 2026 11:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079724; x=1794684524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w90szJpdzekfEVNOhw/amrduU9AsVHLVBfjyoWv/t+A=;
        b=0h4xxKvKH56p8yzLh0xPAjRYwVphNJjU8QcGRHwvKeElquGxvGvFAENJorMgsRR8ai
         9/LraE4uNH5kgLU761HoDA6w7pQY1C6ATSi0z5G4UyUtphk55k1R54oS8Y+h2OekHdce
         vy+IazB4ekTqGFjew6IFHGe0CbdGB2+jkyq6EzoEsqcF7AVyRy9zbqKoVeyG6zKdIZ+K
         f4hF5h3nWpwHXwp48xZW2kXXqJqWm6Csbtky4THNXycpxX5meVvQPqYraoDa5fSEaLcY
         FkuBmhTXGCBZDh94HcneWtKg/2KFiH4uPQp8m8luxFY7nEZQ2KuRBM4Wse4bh6S8S6RK
         XdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079724; x=1794684524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w90szJpdzekfEVNOhw/amrduU9AsVHLVBfjyoWv/t+A=;
        b=GZHN9xbW7Ge/mcU4ew/T1Vb+PL2+2bjy4StJj1O5zd9qTpew2UfU5gT5iOSkQfEa/g
         QItpmWDBV1YW/us8BLb+HydDirhiMhhqLJJViGBCTf7b0vWOYNNAhlpASYZ8pvvIBgB2
         sBcBsEiOPMs+FOJNBrgQL9UJfww/dMCx/CPep8bDfIXe5p0wDJQePmsEZrq7C2UMxOAc
         QBuNcsd4iV51pbQ0Uw4pcvGfyPTkLxuUZz/tLwAwBpJ0Ia1Ur2PJY0sx4fHqv/BLEPfF
         o9ZLauf0ufae8Lh+/0mlbUFZUzugwubow0T9KR5wks8fSykivI8nxTHyACsR12ITtWHU
         l0+g==
X-Forwarded-Encrypted: i=1; AL+hErF6u6Znh9vwb67r+6+sNcnAdEkI9lkbHmTq7qZ4kUdm4OFBnK26UHMAFKGDEveKwyXuxEAd@lists.linux.dev
X-Gm-Message-State: APuU4Z9t+A8eCqSb0dDWK/MXgxTWQxJEHaBgrxewZcyFIhARDun9HYf3
	Jm5ClOpO9oVtH8M+QFefoknRHBHrzzBfzaoITw90H+YkFCQ99mlljNop
X-Gm-Gg: AYBFou0cOP3fxXxH8BiNEN6G+0tzFrZ8gzb+8MWfdwaXzoOUp8DQzZ3+K/di7Brt36X
	m0F8hXAE1XoUcBHVm56MSx2cNOSf/AVFszZK+yU00izKo1HkbsK8CaIH+jj2YT7X95yap02duXm
	Q2PAg4kgXvzMxkAZXCHvh3U8pxOgtMRzHFSDlw7O5EdcwlhqBGcjnmBY6ZaZGGnuORqKgXc5aMN
	J9HT9tQPYR9Cf1+kN8G0KfwcqBAPCnUhial+hBMW3qabsLT4btn6c6BvLW6PIcBYcxzN/jP2EgL
	8M0llVGmmXsxOMqsbMghSchC524KsWlRgLk5dyaizv79XhUiZFfXLWypiLmgMer+SE349BWdo5c
	xHAekiMZ13nWJiph/DHlO9v+P8EB0ibrJ0amWmDcUbzsbcNnFvon5/wrV3LAkhrfL39gN2d2Pem
	u7JwO6Lw8Eodx/2BSx5T20TzTVHiQrUlIZYt5czAz9F+0c8n3blAlQHvw5nNVVserDKThfs843U
	zA9kpp0shpAR/xMtkZUeXT+osso9GVxqVlyrqOIDC58wMbZVBIrKH0Y02xVFrbS9uKtxOpBSmOH
	elu2y/5Y/hzfsAMzC7wlBJno8bgerbYxpynDTql4E9jlVVDreMfl9aB0t7gdPzq8hIJmOyLyvYb
	ycEiKTETrDi4=
X-Received: by 2002:a05:7300:f498:b0:369:fe4c:b48f with SMTP id 5a478bee46e88-3724ff5b718mr132577eec.0.1794079723626;
        Sat, 07 Nov 2026 11:28:43 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fc92fasm23026419eec.19.2026.11.07.11.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:28:43 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] ntfs: open a named $DATA stream by name when making room in a record
Date: Sun,  8 Nov 2026 00:58:36 +0530
Message-ID: <20261107192836.3908453-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
References: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
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

When an attribute has to grow and the mft record is full,
ntfs_resident_attr_resize() walks the other resident attributes and
converts them to non-resident ones. For $DATA it always opens the
unnamed data inode of the base inode, even if the attribute found is a
named stream:

  tvi = ntfs_iget(sb, base_ni->mft_no);
  ntfs_attr_make_non_resident(NTFS_I(tvi), value_len);

value_len is the length of the stream, so it does not match the
attribute that ntfs_attr_make_non_resident() looks up for the unnamed
inode, and the WARN_ON() on entry fires:

  WARNING: fs/ntfs/attrib.c:2115 at ntfs_attr_make_non_resident
   ntfs_resident_attr_resize
   ntfs_attr_expand_locked
   ntfs_expand_for_write
   ntfs_file_write_iter
   vfs_write

With debug output the values were attr_size 13 (unnamed $DATA) and
data_size 550 (named stream) for the same mft record.

It does not need a damaged volume. A file with an alternate data stream
whose record has no room left is enough. The fuzzer found it through a
single changed byte in a file name of an image from mkntfs, which made
a write grow a resident attribute in such a record.

Use ntfs_attr_iget() with the name of the attribute for a named $DATA
stream, as is already done for the other attribute types in this loop,
and keep ntfs_iget() for the unnamed one.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
v3: open a named $DATA stream with ntfs_attr_iget(), as suggested, instead
    of skipping it (v2). Same change as v1 of this patch.

 fs/ntfs/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index ce7c1b524180..c92d1b06afc3 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4933,7 +4933,7 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 		if (a->type == AT_DATA && !value_len)
 			continue;
 
-		if (a->type == AT_DATA)
+		if (a->type == AT_DATA && !a->name_length)
 			tvi = ntfs_iget(sb, base_ni->mft_no);
 		else
 			tvi = ntfs_attr_iget(VFS_I(base_ni), a->type,
-- 
2.56.0

