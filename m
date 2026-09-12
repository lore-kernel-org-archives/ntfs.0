Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DFE345EA2
	for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230133; cv=none; b=npJ/egd7toivp/atIQDh/qO9q+uv55Au65L9p2oR6x8Z5lkfj1rBBo5DpS1hI1lYFYQQCmq3GKvQFVv9ElHiHGU4E/HYa/vNdpBYtkig90Wujs0+zpX1q2tS0GrfAb7HhTJe/hqAEVlQahS/PKIsx6jo4SEVVbhaENr5BzDBCeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230133; c=relaxed/simple;
	bh=0+WdJg2b2PVjagN0smWD32CcorzhjdxGFUf68JQxc0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jP4viBLZp4QWziSzFQYbDAG14VQ0+vqLgonhTciBOvxzr40M/IXvg2gdc3Esa9LWrC7jiS8M/DmTGboFWvzC+GyOwH9dSl+fxa9xkIucfv1hgBaoRgULWFHI5RGjKTc9ZzQqadjMwkH3BDcGfl9KISqyTBsSWOz6wpmUa3flccc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIDTYVsB; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIDTYVsB"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so409436a91.0
        for <ntfs@lists.linux.dev>; Sat, 12 Sep 2026 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230131; x=1789834931; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UT9D+G+XUCAYEeVQQ+E+lt3ym7J6BQtqtJrevfVyMkc=;
        b=oIDTYVsBq/PGsf0RXm9Nb8PwyDDazu4Sfd9Gk/aVJWS3bwRuWBkMxgpQzgHvpNoZJz
         slFcAQGO5sx2BEpBX10Um/qweguc11mCLS6rbtTQYCkSeF1LZ7XTvuHyKmE2Q+lrGoUW
         iDW/K9Gar4LJCXbdne2xPNYSJEricqzizWWGgt2nDIcWP94petr0x+xdTOzjKjxmv6s8
         KNXhIdMsPICDWNCXaYLnv6n5LPQKKfVrZOPujjDShWOgd0CxplSwuj0iBS0UVK0hQntH
         2yu0Hz5X6f7ScBVPiWK0FnVfnw0Ar0wEFxJP8OOvxCjN2ttl0xX42bVZkKwYh+iqdlhu
         Q9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230131; x=1789834931;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UT9D+G+XUCAYEeVQQ+E+lt3ym7J6BQtqtJrevfVyMkc=;
        b=BVIjoY/2KbEUqngBeZuM06tkdQm7N2vp/5sDmHDHUKMy5NSkxMl5GtLljHGo3AmLGT
         4gL6zF5xCXP41hVtpbr8bxQsgAh4QrxmcUwt+UxhsriN9tMxNMVwtR+DDkMn+g+jDEa8
         cyoWe6Dv27uy9JTeMW4RD4XGlUxpAI6UXqk3l2ynm4EUf2kgS99HMvWthtQPZurcksfC
         5QIF8IePQaUcpwgX947wFzbR5QGpfhOnKTutyGCcuNdROUCaE/rfUqXtlDH/lBiUnzwO
         0Z5a+mpLyS8cXa7W42eAk6vJ1wH09mdvLHmKJX6Y3eKEq6zpyFLaoBerYds8zoWXA+tC
         eq+A==
X-Forwarded-Encrypted: i=1; AKwUvByiB4oSGe7eKuIaeyyNUEHVhZla7wvfRTYK9ri6jzjDoy6T1dmvHISnsQRqsovk/WUSdQlH@lists.linux.dev
X-Gm-Message-State: AFuF++l9qgO+K1Zt2IhxEZiCTrFtg0SqUSfDCclshqafcmdOylaaWs/T
	aw0dqraFHWuOjwzIc0vyOBT+PvUFFMio7SGbhrf0iYfvxQYkpgSigq3L
X-Gm-Gg: AYBFou1MLlAmOjlS4F9hFvkSWU5rGEzaCbAtaAJbUYu2/NKCOoz1v7r3Znibvf2fBWQ
	jslFxKFWN08aHT4vVvnuPlStHNoBdwe0ITmJCbOvIEhvT3z6LkHhyWtu1/EvAz7Ir26kHM4TB3A
	zirbS7HWHgNL+YrVSh9m4rneXCPfEkjVx1Bw+a9aXGxfAlscg6joWmltbEO62/Y++ESwFr630U4
	dvc0Klu3+gIqkL60pWKyhaqdsUHv41VNW71oFn0V+xbsQNCp1KrBXHSI1ZgcIBNDoezpvtuiyGz
	C6BfwS5lFlxp2msF4AuKaLNndvoxZLE4H4a3n3veKGZhziSV47z6UQR2QT7SXwIRx5MDn0tTIs0
	darxXPEbJEiQJeMzaPPGs2UryteS2x3r5yJptyCL1XavSgyAh53Ld1vS45V1iHaVxVkOYwNtmBy
	GcELM2KdLpKfq8nSEirkVOga5wC9xxNp4jojCcypylrN/MSR1xtVH3AeVKy/G5u/HgdPgN55UGN
	pbaGpVOcKEt5IMmuPqyOKY=
X-Received: by 2002:a17:90b:58e4:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39dbc70b960mr6814317a91.24.1789230131347;
        Sat, 12 Sep 2026 09:22:11 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b21sm10804999a91.13.2026.09.12.09.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:22:10 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v2 10/10] ntfs: wait for attribute folio writeback before update
Date: Sun, 13 Sep 2026 01:21:22 +0900
Message-ID: <20260913-topic-4kn-lkml-v2-10-2bc455e81635@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
References: <20260913-topic-4kn-lkml-v2-0-2bc455e81635@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789229949; l=805; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=0+WdJg2b2PVjagN0smWD32CcorzhjdxGFUf68JQxc0g=; b=X+XhNxXd5dmIZgl0dICVft7Z6u7XmnAYxyxueUzh+vlSoyLbVjXzOqbINq4SJYlTAnFzXSU7w pbvUc2Vnc6xBi1bZ0vBdWNX6JkPMJEsWFb1HNj0WBz4NXcyPPUxMk2I
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

ntfs_inode_attr_pwrite() locks an attribute folio before copying a new
attribute image into it, but taking the folio lock does not wait for an
already-running writeback BIO to complete. The writeback path can unlock
the folio while PG_writeback remains set and the BIO still references the
folio memory.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 5aedc045f65a..bd210ea9b4d6 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3728,6 +3728,8 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 			folio_lock(folio);
 		}
 
+		folio_wait_writeback(folio);
+
 		if (count == PAGE_SIZE) {
 			offset = 0;
 			attr_len = count;

-- 
2.43.0

