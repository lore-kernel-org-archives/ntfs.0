Received: from mail-pj2-f36.google.com (mail-pj2-f36.google.com [74.125.227.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01EE376BEA
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 06:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973096; cv=none; b=diTmLuMKc8be+OSjoUfHGLedlSXUvgugQAPahaoJeVd7PY9zFKhuvCErtOEdcBXoOkd4el4K/R3onXxuS0hFaLA+3rqjEGxUdegbO1P34V74Hv6HplVKVL7lucppSRi4dNL1b9aTuSpx3uwxJmfWwj/KLF+9SPOT7QBpISFJiFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973096; c=relaxed/simple;
	bh=F/FiOldzB5FitQqxux427YwALA2lkJe7vkW5UsH8LCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gkphj15A3GGi8Kt5XNHFMZgEEd2Iw5FU2dGkbfMBiit6JOPWZ4ml0FOrfmUpOkMZBcCimQLRema2VEk0UOnjnUNcc5X72BvufhWNN4cF68Un5JW6E3KRTiU7rQoGjg/RWvvK080+7N8/hwqUuBytUxqP4f3FsLjQEYcqodzFRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHSpZHTz; arc=none smtp.client-ip=74.125.227.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHSpZHTz"
Received: by mail-pj2-f36.google.com with SMTP id d9443c01a7336-2d8fdc579daso29507155ad.1
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 23:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973094; x=1790577894; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=diuDiAt1MBoAIRvmG/WpgnaXlcTTHxbIkiMj5XGJGC4=;
        b=aHSpZHTzP0OcyZ4kfQrm/ouHQTcXnLAMe3JZHvWJ6a2vbnQ64a/09kApgGAkbkWazY
         5RiEHus4LccAygeAQ1jPdB+Ex28irnZT+7quSCdutI2FUjppagCN1RFU33n2LtWmwk/H
         kMim2ydV4WxdueJ9J3TAvw3fxRdpqt30gn6Kn/s8iSvEvk1DocLQXeQMJH0Hb4evCXfL
         lVgyvki6ppoUGpAFB+plwchZZJy968Dtg5di7V4mx3coJBbunIwnkdvPXWN22Q/n91Tj
         PLbDKD+aLfNCyH/9F4mef0bqmQs7UbsL7+cWMynvmvnaus+/TUsWrgFe8GhOIiYxdAii
         01Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973094; x=1790577894;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diuDiAt1MBoAIRvmG/WpgnaXlcTTHxbIkiMj5XGJGC4=;
        b=UIgZcsu47UMlrKK0YdCgY0G/KB1yUSwLA5iwR7cgK3S61Fb3KzN4qjorcfbpYBNVOJ
         qiTIpcN46h4yIbYtxSkcYj0b59e1D88aCurV4WxvlbPa1NcvtqcklXngNmfjSCR4PQxp
         V0nkbAjWieLQ07GuNYcFv8DNHr8+FDrz12evHOIye088Zyk3ss3pnq+siGAjz+g9XfwO
         QBKgcyEU008665wG/eH/NjzF9LN7aQKELXpKIowx/+JRb4TfRCa2RDbYrelSTVCQ4se5
         C9OUdTimNhjAKUf10t7yaboCiH1dNiWWY26j7X2G/XFXZV6Q+tIA3/zKehndH0ohcr29
         QzNw==
X-Forwarded-Encrypted: i=1; AKwUvBxaGN0K6EaWzQ9qKlx65b8enAl20xhYA30RHImtpyZyH5cN8BKfwlHcJA9jSO122oSwB96M@lists.linux.dev
X-Gm-Message-State: AFuF++l03wjvHVNPDMU4YtGRL1pc8jbWMtw5DBVGUHubx0uHOHbVHnfS
	OlTm8PCOf9rcgocR+E9C5WLFryr5IoWDpGela2oSRbKNsVGfMj6Eg4kH
X-Gm-Gg: AYBFou1cnxhGhwPO81hcL1y78+Y8jeecWyg+BY3PpSygmU+rgPKWiSd7awMfPY5VluX
	YbdutQPKm++QjjQ2TVWVfsrtWJXaAW68JxxbJML6o+pVXJlD/vU4umknfLObjjMzS0QbMz6lzes
	kYWkmW2SvthlHqNDThDeS4ZMR73PDzL2eLH03Qkitgpl1jq0lFJtwsRDKweq6aL5NNo6wFcFSIN
	sltX86/1gKJcop++o1JAzH8tc74oHgncgqJrvTrIm4S75XOg2wsLmP0HQK6uQSiuwQfW56o46RX
	a+yBlin43hJDrm9mogBQsSbAd88h33fzLvcapktA4KVJjnHIUP34QYH0xBPII+M47IwbHkpWYMc
	UxjsGadXyuQ4d1cw0nG8AxiP01COLRVGtBxgFmrgYkumNIg3L4iXqbNMeXrpKFIUBzH5tkDpwSQ
	naik5t2uQciHdEH7P/dkj8xvOl4E78PdGitocpuO8g2d9w8UzrehC+i6lWox6JsGtJJCUlw2zAE
	IeHjg==
X-Received: by 2002:a17:902:fd88:b0:2dd:c100:313a with SMTP id d9443c01a7336-2ddc1003202mr91242235ad.54.1789973094191;
        Sun, 20 Sep 2026 23:44:54 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc180395fsm28097345ad.81.2026.09.20.23.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:44:53 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v6 10/10] ntfs: wait for attribute folio writeback before update
Date: Mon, 21 Sep 2026 15:44:12 +0900
Message-ID: <20260921-topic-4kn-lkml-v6-10-75069f590b22@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=886; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=F/FiOldzB5FitQqxux427YwALA2lkJe7vkW5UsH8LCY=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsNIMsIktW83shA1BmqQ5wSr1q6Jgo4/rrp6Td
 1I8rTf8WFeJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarDSDAAKCRA08jD6945I
 0795EACoeB1DABEFWtHguQdVNOkbWz6ctf494M+xWM7Ri6Lcyxpq7oGuJk7pQY3di6Ek5NRe9XM
 ikT7grHa10Luiub48kErBWcIemjoZ1n73p24pOWAqIP6/7dufRsXnH6s/kxm8U4VlJm5FKih5u2
 dz/GsdCBrlLPlDaaQvZQRxjzzH8Z3uOZnaWL+hmQhkZ4tey0OjnTGWS+qhui+rhtDCU8s2e99k+
 h64PssKyt7B4kxgJ5cAKMSiB52I9zposYPPrLJdJ+8PeC1pUNnGqDE1V/pAbOPPU8nbEC9iJbjG
 5lZO9gvUtvXhZmAuy+4q4BowH8Z3lyRN4W13547uNUQ8CxwD8bCC11mxWE8UObEgR4bK5VPjM1T
 CDesYMY6Bp9pqKcVNrjM9Ph/dPujQzxuZxuwR2W6a5HoWKJKGO13X60CPpjLzjtVibEa9P6qzEP
 G524W6hxOe7TBkOUMfg+2ZAYlAJLfPcImpNn7pTofx3LMq1hnp1ZoJ5jzGD9jcm9BfwdNBgfEjG
 GcNWbVjqDVoIQrAoEoIF2u297UILphaOZwfYPfIWkSVFsfmSwc+Odw8DcNLq6u6o0UHGxlPojpP
 PPOdDYOfwtZzlOZ5vVJpYsON7Bfvl6E8xiWZ05w8+COc4MEbLroBVGxp+x5Uup7Y/Y+IgMuasku UJgm9ZGxp89C6yQ==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

ntfs_inode_attr_pwrite() locks an attribute folio before copying a new
attribute image into it, but taking the folio lock does not wait for an
already-running writeback BIO to complete. The writeback path can unlock
the folio while PG_writeback remains set and the BIO still references the
folio memory.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 4375ad477809..d5e526d3612a 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3740,6 +3740,8 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 			folio_lock(folio);
 		}
 
+		folio_wait_writeback(folio);
+
 		if (count == PAGE_SIZE) {
 			offset = 0;
 			attr_len = count;

-- 
2.43.0

