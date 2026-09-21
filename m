Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3A24B28
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950017; cv=none; b=DstjN0Nuwz9E8gFHIlbEkHft0ZKIFSmmAuHXqhNdGar4fYY838QL7aOotVBoMva5YOk6uSA2uiUv4ZAA+Lu+eAvsnlQ7hGVWGziyu/9JRTE4U/A/twvrSvCod+1nTDPuyOfc1rH+SJUll06AvEgHxYw8ZAfLYQAirvPhGr83bVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950017; c=relaxed/simple;
	bh=WzRlngA1H5Wtqwk65t2IwAg6GK7eP7rvSbNqcEtlkB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VdmClRUodTB8qP7G5Vf/Okm83m0uQ10GALm8i1WumfUfQuUeD+M/TSosOFRtSljgARqOYz1D/auFjqNfdxznNZ2Lbg2Cf2JPxMc1NxTblnHLWjrKYTm2MencM1uKXOuJMzU9Oqi5KyOhwBdigwl9XPAVDFHdo5SllMBgmqpbrFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9SRp3y2; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9SRp3y2"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8674704dab1so3474499b3a.2
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 17:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950015; x=1790554815; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W0jJ4flsmkV/YoQILu+fGMHbeZ/OzecuHGor6pKvtSo=;
        b=F9SRp3y2v66NhgfuTTh5xExmy9aByTkfSfoljzy760b8Md1sopIOIkcehSMeoKXDyD
         StLKk1E8L4YvillBjgznK6Cdhc9NLn1vJ1sjtUGgImata7bKQ+iupoFlTjUHOh7SirrF
         LL3iiv/Ppyw7YcGaclaCekSKEjQdVvHPo8X2zSAzi2xcvrDPwRDVO3rYKFHkSHsvvfzW
         eUq/P0LkR1cpLgh25O7aI3fT7lp39jruqFvzkSSBN5pusvAy6PylP4vFzsPObYtYMXyu
         uncTzX47KMoi1BpQQLzLcsOXdSHttUtnc+8W+RLUqRNcfNWL4CWw+CNWHRC82X+DbBx0
         e2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950015; x=1790554815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0jJ4flsmkV/YoQILu+fGMHbeZ/OzecuHGor6pKvtSo=;
        b=CQRFqHhe680ZecKSczhaCnYUj7LYbzSMso18TtUZxvNt+QOE6wrSl28wGQmIiOFioq
         PSKzdbQTklXP2bIZj8gC5/vBbXT1bzec+/xU0/MB7ih74Ttsj719sIr32tbe9OkeevU9
         SvymaX71SikkWBqQO2+Sx7DUUA4KYHFGutpE3FzGutl970inrXn3JMwAJewG+7EjwWHF
         6ISJqJpMhSmxBO4ByqKY7a0sBcsYxngL2MQAIyvBrYJXunzD2fNMZCpYdjZDIC+PsCSV
         A5YoDJIto4eQsDQ1pyAevR0gSnA5JGe6XXs8SPuJyvEBrmL2ZOlWOhG+3PKko46z0dnj
         4VeA==
X-Forwarded-Encrypted: i=1; AKwUvBwA5IUcnh8sfWMfmcD+1QHQrSfDBbXGM/ZS83sGT+Q8TSjnkxiWtAEZqi8OkAQ7oGfYtvco@lists.linux.dev
X-Gm-Message-State: AFuF++lDFfGZHt6sryRyHhsUTK/shcZiFOsjWALjpspkT681Yk1Wo3op
	55kWwt5JI6rKjdzxa+w/chRQapqN9gGnoEGEFWVZ/izAuS0U4gp4Gyg+4ebBCQ==
X-Gm-Gg: AYBFou15rA2zWWARatQ1LFCZSeZbjsYl8aw0DPtQ5Nl+nNzuXxdnWQZVQnQnLE2c+vL
	Mu6E2OYffdBLmaIJXYYGqE6SUJAp55oXAwOL/cTcvAoTeTMQ8WnsGQzD1vh1+N7byczhw66c4U2
	My/euURDeDXVXno0RQRrB2dy3m1/aYsn1Nz9ZGYCO2HTl45r/Tlt5aGu3tV12LeQx9NWo6+fKg9
	LckMgEF/O8NlydmHzmMQSIM9xWTiSaFUhVg1VN/9OOAtXWk9Pr3loGeLwxwtUi3jWjXSrHsWNcF
	Lnem/8pR0+XkDFhQKy7RJfaRYbH0qx9SLc+sD6k0VOqRoC76FMK7MUIFI9qy73bsvIqrjkkDC/x
	QoKWmmP9Q8lpoCPl4kYhE+qjh1Q/HMJ8vzU92GuXfehKNhW9xgiFa+ZVZU2YleihFIZ6zWhABoA
	LYttwIz2JdrYvKpuGyfINtmvJ4l3TRkY0thxSRIEu+2j34K5IiN1XXWZc90Pu/QC0j4I2jnE3wt
	0or8A==
X-Received: by 2002:a05:6a00:1309:b0:878:3783:8a89 with SMTP id d2e1a72fcca58-87837839306mr5986704b3a.53.1789950015173;
        Sun, 20 Sep 2026 17:20:15 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2289557b3a.21.2026.09.20.17.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:20:13 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v5 04/10] ntfs: serialize raw MFT updates against folio writeback
Date: Mon, 21 Sep 2026 09:19:43 +0900
Message-ID: <20260921-topic-4kn-lkml-v5-4-938afe402cd0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
References: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=WzRlngA1H5Wtqwk65t2IwAg6GK7eP7rvSbNqcEtlkB4=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsHf0nHo96eLyqLND788kZ1axh1s12mbe2BAWL
 tQWpMux5SCJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarB39AAKCRA08jD6945I
 0/JvEACl1qErBnohOFNBMN0qzcW8h/JvyoHGZ+WXHPyWwF96+dOmYzfgfwPGZxNytOJ0cMBXq0g
 g2+5vn+r/Gp0ZYqzg4NsHsurPeNWi9hxxZG3TajqHkDpZK4/PSplNJF4e9VNP++g5vO7mIC1qIp
 KxR8vVfYWeAHLkSzTdFnz92NA5UvBZDjTUrcYkxF/IXDy6R+5B9guQq8CWjgGiC+hXnFgSfW1Sv
 HeW0F3jNRos+wlGZP7IAFpRTCHfw6/hpkTlShTWOMfZATStxbefCPx5RRx/Mm804+MFEYvhtSnd
 rULEMzuWjXWXz0/60I++zBvQEpRLR30LHC25xUZ9k4O4LGxbHqHJnBomWr6U2ZuhX4ktcPdhOP9
 wKP1QFt70O1oavywHMvsDBqMb1jKnAUcm/V2ulbeqIMTSqM/TlHQlAPU1SlCxq5f39ndaZWL6AR
 4XoQeAdW7Zcqo7CqJmMhZuxnGJDbOqvz4hDB4IsS/wVkaQmhGfUInDOTufnib4f0FyAbc/Oskb8
 tWMnScytOnQb7QJWg2wnJX3bfhFm0HIAIMHapzY+u0B4ESXuXKshQ1pN96GIbXA7ulDRBuJ7iQY
 FSjMoJYPWmNurklK7GGG3aLO3jCvyG5sQKgfR1igSi/Mg+83RzJk4612oZSMOrr6ZvjgWF1iog+ 2GmD8Lu7WPE3Qow==
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
index b102e0204eba..c7577c322454 100644
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

