Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166542BC2D
	for <ntfs@lists.linux.dev>; Wed, 15 Jul 2026 01:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784079520; cv=none; b=APZn798c3fUr81ET2l6HEdFCrOMVgCMcGUfO3gifWoL1fzOerntjSb9VbhxwxN/QomxdSvYXuz/++BDCDTaC45CeH2eiNXSlicXVx93kWy4qv5nVislmZLgiGin0UvSgJOm8B/N1bWLmG4K3miWAqGRE7MU2o3ANLziOyXDisYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784079520; c=relaxed/simple;
	bh=gXeS5SuHZYMUemKHOmOz16PUJJbPCl6HIOi2g9LM3eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=myvFbQSJ6Hda5mEkd3/7BM3DyKN0NttJuHM50WXVfE524RgV1+7kijpItFXkuoFoDNJZGdvdyYFdehug0SKloJaRRNldFkHEyTDgdeuXEO1oWWN4/N9HGQFxr4oSkkb/p684B1c+ySS2K3rMMzCi/Wi09AJKUSdJxHY4ehHU4t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuaucK5M; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuaucK5M"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca965de53baso906093a12.0
        for <ntfs@lists.linux.dev>; Tue, 14 Jul 2026 18:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784079518; x=1784684318; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hem65AM0p1NC/6cT8RtuIc3JMoV2gP6hDU7Wj0dcXF8=;
        b=EuaucK5M8JDHK0CuxV3+URjeEk2FET+WGs8aJFpPxpBWKv5CBwiYfW3f84rF2lG0sy
         LbDJJFhLAq9HGQU9y35z0JSgwSenDTfPXFlMhbWZRLeaqvW496migZuacXmibsv8fKvf
         LbBh4akyJG/fyaXDSsgYl2zWVIlpz1hzLs7OZleo7vW5W0lE19fv5fdFpO+K/Kvl/U8p
         FITcHySVGJt4ffQW7I0AKNaSnwfSYDcoSCUM2AV7Vu+TL8YnO3Ndmofa4FTIVf33WeUV
         u4INtSuIzgZhbss0DcenTMAW2kaNdmC9YtVCCUHR4duqv1Nd2V3iiGOjtE56GMmdh2cY
         bnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784079518; x=1784684318;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hem65AM0p1NC/6cT8RtuIc3JMoV2gP6hDU7Wj0dcXF8=;
        b=Xa6HzOx9N+V2A+i3aYwQP0rvi+YpogSV+4dWWnwonjFlAphWHF1lJ7jLxVvM1cx9zt
         3fuEkwBZu0dk3h/oSc7m9HsZchG4wstYJPHkJ8xVYZBG4GYCT77dj5eNMvqxgw82WKYz
         iRy+rJphrBWGHQGlKxAyok2UOh8+fNqCJTkm6MP7IBkltqPTdI2LO9OaHfKaAawtcc14
         xnCWB4FDbs/qcxz08Xk6DhDX3kY9pq8XR91C/I+2f+yJYk66j072+Vha82LffVegnuPJ
         sBZs7zj74FbAjPV4HjFeyYA2kIp2A5+qmx1ahM3ti0EAY0rWRdspx9fOO3GM1fsMl5ER
         dHKg==
X-Forwarded-Encrypted: i=1; AHgh+RoBGAgUry7hDblokDFTkhg0Lrkjqwo4xRojrB+agzh+1JpQlzE8q4OFOInEtcKMVLjOPiwA@lists.linux.dev
X-Gm-Message-State: AOJu0YyUttEHSHEsx3hOZhoqqKK1JPttwQF9cQGGTQIjl2ZuTHGs26Vh
	P7Ieetru+Zg7CZwOVFfOnTYRzYJgWaOFMfqafwkz9vm9dH0icyQdyIAt
X-Gm-Gg: AfdE7clUXPpteSIwBpS6IXHCbW2d5HIG41lrDRGpQ+p9w+jdNfe+sh0T9daXl/CVwNd
	0ZREX7oqRRirHduTie94xvADIYsGmt+JwT9V4V06IGUQ1p4l6EGi3JO3q4h/+PAG9P6eITzRU/v
	JMFQxfOexnt9rVTp0OK1t5znaIT3Qy16i2Wo9KNbodvnThsOl9ed87iJ9HTvnbhmTmFDi1YgLVX
	II5+oRkiy9aVMcQtqZD0jNxuSKCQvy4P34cYdGk9opIN4k4SOT9IyMNip3pRtyssjqkKEwgPXOV
	aTf6rgFi1+505vDHcNstfkv9Q3S2gsFDHkDua/KnzX23U7QnJw2m0BhFsaLVf69EyP2bxBTrFz9
	IkGIrzTW7SI9REdWUJneZqCaffOoFCr+PrvwRJv0QDrSpv0oNEpzvCcnj3WkAS36Cr5CsgGoiPU
	vfIbzsUgc+It6wAuAXu7E=
X-Received: by 2002:a05:6a21:694:b0:3c0:9c19:b27b with SMTP id adf61e73a8af0-3c110cf96d5mr17213273637.73.1784079518369;
        Tue, 14 Jul 2026 18:38:38 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11080617a12.22.2026.07.14.18.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:38:37 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	usama.arif@linux.dev,
	lance.yang@linux.dev,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 0/4] ntfs: Remove __folio_index from ntfs
Date: Wed, 15 Jul 2026 10:37:59 +0900
Message-ID: <20260715-review-matthew-v2-v3-0-3c996b687a5e@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=gXeS5SuHZYMUemKHOmOz16PUJJbPCl6HIOi2g9LM3eo=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqVuRt1iA9xlpg5xY8cuf+kd/BfQGrnrgHRV55a
 /02UL2y6tqJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCalbkbQAKCRA08jD6945I
 02JPD/9/9vVI31TlxScuAhGjQtrA6ftuQgHF6vnegnnO6uPmNa70Z+hYXl9e7RCwZ9dmt/B18vA
 YpOqfr9J57JBPM/zJ2/JR0imw+dJlJAqoCHIf96uVHVCoWVg8Mp0fW6G3V+UbvWhNY+TzoinZ9D
 jfVE+12mckjY13MW/B47V3NEw7gosPgo6IZwwcTrHdcj4SJxMp1VZ2hUiqeO7VKd23JhoBBaqYE
 MQHRCdchCgP1cvLW80OZrjyPjWXroIc/rNQkkfWNaTXE/8lw3K5z7GkK/NKW31u7tRsI5AOUGyL
 rVZqfYqi1ipENUKn7kRxVB+gbn1oXTbbTpqf99Joc/unRrl37sfyaENagk+iEC7GbeHPriHYJJT
 uDaPgyAFkToE6M8lPJj3fXSatZ6/GeBuNx9psTalr2pzJEuy9ckWzjJVrRh9Lc4Jwfh97LfCxob
 rsvWhL30Ot9bfrT/Q0MpdVmLV0jRLZQv3z4/SgolQdndRTfiCfWvA9hmcaz3y2zGDYr8jTfUsVE
 xyrOs8eRkP1hWcCf+e5qwIdTtJdJ21tMfGsFd4etwEfyDAgaAYlN5L+Qs6rA1M1i3vIDBuFG1Y7
 PNNpXkxBVHiixgWKJYTF/+gKqwMIIR7aXZCnGjPc184qZW77Pd+oMx1UVCszsTk4PGHCitrUujC BVdjjfM25ZmfHCw==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

This is a continuation of the NTFS part of Matthew's
"Remove __folio_index" patch set [1].

[1]: https://lore.kernel.org/all/20260608210618.3437216-1-willy@infradead.org/

To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: ntfs@lists.linux.dev
Cc: usama.arif@linux.dev
Cc: lance.yang@linux.dev

--
Changes in v3:
- Patch 2: Fixed the boundary check so pages straddling initialized_size
  are zeroed(Suggested by Usama).
- Patch 3: Rebased on the top of patch 2.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
Matthew Wilcox (Oracle) (4):
      ntfs: Inline zero_partial_compressed_page()
      ntfs: Remove use of __folio_index in handle_bounds_compressed_page()
      ntfs: Use zero_user_segment() in handle_bounds_compressed_page()
      ntfs: Remove references to page->__folio_index

 fs/ntfs/compress.c | 54 +++++++++++++++++++++++-------------------------------
 1 file changed, 23 insertions(+), 31 deletions(-)
---
base-commit: 0ebe8f625ab0520217a425d7cd366e4670484941
change-id: 20260713-review-matthew-v2-e06bc4211b3e

Best regards,
-- 
Thanks,
Hyunchul

