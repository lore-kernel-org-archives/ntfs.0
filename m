Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A042CDF6C
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 01:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520637; cv=none; b=XECFjwqgs8FhsOhaWoA0cW/Tj11BLQCW/3xz1hiht+qDFMfz6kM0zRqbykJDH2WbamOBQtw9+3p/3X9yH2yUnGuc8H5aEOsrh+MoVOH1Muu08w94ENRNGI4+RSgxXjx+w8prrI3IHoEGWz05t/ekVDA5j1bp5sF3fitis5DqMxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520637; c=relaxed/simple;
	bh=P7yc0nLbJCjA9ro5oLJ6i6IKL4Onq6Cmbq1Uct0/WKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mBJcppkCsyuT6bhuk4NYj5YMZ3fnCqiE+6yStnwbXd5k2QgvTyzvaLTZy56R8mUlG1OAdGefgYW9+vQUZogUlZgp77iTxnATo2RsVbFqAlBRcsbMZuc6NqbCJtHcOVjeVQ4UYvTofegTIPL1jzgnJDPjyAB/IAHs6BEseT4ykgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9uDJf74; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9uDJf74"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0b25dso3578185ad.2
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 18:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520636; x=1790125436; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gv/dU8fg3byPLWi7cbWbkkSr2mxs9ztephTi7wvfr6g=;
        b=m9uDJf74KcB6U4PalFCoYeTyhKMN0PEO5jBG1tiJMXdR6NAAF0oR2m94fFs1sjpesa
         RzCEKsRe9Cjyma0qhtb5ALTL8SLaH7BR0J3/HN2HNldX9iSvySKAO3aJk/L9JGbLtYR/
         kAN4Rt/KpSfs2upZW9nxTCPkZiS6OoP9PRoowS8FF6U58aSo250SDzIa5S04nMQ2oIUR
         ACY7/Ik86f/THuFQ1UCov5V/9podpYAQJbaIC7jpuN6YJMO4UVeZfbHE+HMAGIxbUc5V
         rhzUpq2JQNQyH/UlRe7TBm4wo1YVDgPDwm63KtBFD8+kHl9XhZMlMRD/fYZzdiELtByo
         UPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520636; x=1790125436;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv/dU8fg3byPLWi7cbWbkkSr2mxs9ztephTi7wvfr6g=;
        b=ypEJ77PxT82E9+7L8z/iCcAVo1+CSuC1oCQbVGD3u5Unny3R3K0CQCHRTznE13agR7
         P4yBmgwYR+W5Ue9bbYOpZ57IEwa1SF+Eh6adl40sKbxMTVy0cIqc+6DRvbUoW5HNkUVx
         Xj7PH0/wPZ1RfRAHEdVkPK1MK3gwgG5gWsLZQtxRvDrpXe23MCtH4I7cqYjgNFj+VL+W
         xBbmiYlwmpC2UDt25Haz+YUsV6k79h1eiUeMyqYv73q22G5OakJNaE84PoU/WNLFM6VD
         T+G2YzVRImBfghoYBYHwSyec/Lyo+0ETU7w4GomznqaTicAU9LCdUV+lCHoonz3XD6ow
         2zSA==
X-Forwarded-Encrypted: i=1; AKwUvBxtGcCKl0wWhX920AyqD7Rm6IBR8oYxqN5noG8GnhEUHecQ6eB3a/e7rH4q/apFyq+IQ60J@lists.linux.dev
X-Gm-Message-State: AFuF++nDvmkCiV+s0stxANg5+f5XEgKRWfSyl9RoFQ5NrgzkLbTWhVJY
	mk0aer8BY4mgfeF5q1IpbACO9BavBtycHhRVp6bzIDGbUAJTqZitV//F
X-Gm-Gg: AYBFou2ulw2zpH9ZTnRJbKYC9BDZG1HK011QvW/QwC4EGycg0tCnakIbzldUM7h2UhV
	NSV1whYc/k8FzLIlGKVfDYRMus6VPbUuPtKtBSdeZBBojfcRHU+IFeVUg5G8mSoCRMpK0JKZd3n
	RYa0bzrBNWaP3WsU2H3hSCVWeUGvjiSKuqYKQQx5BCwR2xfcGr6y1o25FxGN4k8nXTAyVOcj9sR
	YtcBrsIrPbVFs6e9mMYqUktwfV9WcbFA3rqDfCKwg+3b8os0kOta6rid91mBrA9RFpQ1rcV5scn
	4iOOA57EtG9E2bL81ZgzK5XGMpmh/6cJYcaXOFax6lSmylgzw1d12yr8w9LAa56i4gKYdArpicw
	cpBQVy3FEL7fHxTQh6uFd93yKRgx5eQOeDjultwq968jgP2wSMTQ4eWKn6rBvt02kKOycbuGfyT
	S3zglPVXM/MKUmptpYPf2QATE0ttc4atwfcdmPxzQoIr2OjsiYN5jt6QzUp/SR8mjcwp5g9R/fE
	uVP+Q==
X-Received: by 2002:a17:902:ce86:b0:2db:5f00:ff52 with SMTP id d9443c01a7336-2dd8e752f3bmr11638075ad.22.1789520635775;
        Tue, 15 Sep 2026 18:03:55 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm2880995ad.8.2026.09.15.18.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:03:55 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 04/10] ntfs: serialize raw MFT updates against folio writeback
Date: Wed, 16 Sep 2026 10:03:16 +0900
Message-ID: <20260916-topic-4kn-lkml-v4-4-4f8a574ba3fb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
References: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=P7yc0nLbJCjA9ro5oLJ6i6IKL4Onq6Cmbq1Uct0/WKA=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqqeq2Gacc2cWWNSZAUVBcit2JAGXFaPqMzpgSp
 kL0UFGM7tiJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaqnqtgAKCRA08jD6945I
 06PWD/95gTlz5Y1nre8tuomQXcJxFQfnzkBHmso91tNiYf4V/Zb36hxi+21G0n5RpNKb+VFF+Jo
 PSczIYJBlqKWrei7+2tmA9iXWdf69eFz8xPJYgFl1yqIKqtEn1TOAeO7WRGYUSHgegI8EKrOWFR
 1D0JBiFuyiBlCOcNRMI4pzgfk8kqlx8qfvMhb/Z38Fr1O3+RNLx3ZSiqMpeXXrwD9kqyf9lxjhr
 /4F52AxDfcYvy1qDXURvzzTFkIhx5aH4Rt3Y6VfLxemPIbKoP0YzJn7HZ/V5BzsCF5MHSu0auRB
 1yGJmneFn3DViAAMTxnruamWZDRDb+hUtSjjvIk8X1Ueji7uH1QzPNZF3pV9P68go6eEgPxhVtT
 lngquF2dJVBCkvms289hqFIdjYZ0ymXM8OXsV+nVLkKHBM/ShqS7FQMGiPDseMO24+PtQlEgXcV
 UR1vgYkWjkla5joGQCy7DacZx0wWlppGFcSJJ8LYZpMg+6BvFGk6u7RS1hUCjlFTmgQcv6pgkam
 lzVeNcSrKMfb4Es3bQy/5WPB5VlrXcvXDVoiVKbDeiPYpuZq2gb+rkIlWkha+vu9OWvJtT+u7BW
 zRZGeaibWLXcn5jZtOePYGrPvF4UYgIGOPITf+vQNyLOaqiAGKXQLqNgtjNmq1sUP3TrpCkBDsi HRydKa1QmmWVeIQ==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Because MFT folio writeback can remain active until its asynchronous BIO
completes, raw MFT record formatting and allocation must not modify the
folio while it is still used as a BIO source.

Wait for existing folio writeback after taking the folio lock in both
raw MFT update paths.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 955b1f9ab372..75945f89cd0c 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2022,6 +2022,8 @@ static int ntfs_mft_record_format(const struct ntfs_volume *vol, const s64 mft_n
 		return PTR_ERR(folio);
 	}
 	folio_lock(folio);
+	if (folio_test_writeback(folio))
+		folio_wait_writeback(folio);
 	folio_clear_uptodate(folio);
 	m = (struct mft_record *)((u8 *)kmap_local_folio(folio, 0) + ofs);
 	err = ntfs_mft_record_layout(vol, mft_no, m);
@@ -2539,6 +2541,8 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, const int mode,
 		goto undo_mftbmp_alloc;
 	}
 	folio_lock(folio);
+	if (folio_test_writeback(folio))
+		folio_wait_writeback(folio);
 	folio_clear_uptodate(folio);
 	m = (struct mft_record *)((u8 *)kmap_local_folio(folio, 0) + ofs);
 	/* If we just formatted the mft record no need to do it again. */

-- 
2.43.0

