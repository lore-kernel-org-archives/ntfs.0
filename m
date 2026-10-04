Received: from mail-pz2-f35.google.com (mail-pz2-f35.google.com [74.125.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE60040488C
	for <ntfs@lists.linux.dev>; Sun,  4 Oct 2026 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107787; cv=none; b=ZVDT+sxwqYDB9uP83mNGlTAPyMnm59ChEU1OG7wTyrXUnBW1ohSxuuAlD2i2EbX7U1/3ILQEx7m3FzQ7x9F7Xxhy8n0r6rBJDKBEf5dgAlAYeZXUNJvYFNR8Sl/ZP4vzylit/Yk51zK41j1XRSbA6rMrXmyX8CHCPOtFjPwVR5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107787; c=relaxed/simple;
	bh=5JlpBxYD40ztw40lbBmQXZ5uTOaCMTIyeOq/marxx8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FL0sDNTem2w6c9N94o27U1TI1rVFt+fwxa0h/H8cRATQ/nFbpAb3YEw786NCk0mjxEUqbuDFPzoXD8TrOj7X118ToifIMdnbes4JSPOYdTyDLbojP+ejxMww+PAwjLjVQ/3Y8NlRzRu0/kh9nSSM3EvYVTZtwuCtSaZBbrTGCz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzsB8Bef; arc=none smtp.client-ip=74.125.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzsB8Bef"
Received: by mail-pz2-f35.google.com with SMTP id d2e1a72fcca58-88b4eaccebcso686186b3a.3
        for <ntfs@lists.linux.dev>; Sun, 04 Oct 2026 02:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107785; x=1791712585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SCB/3AIaM5xEYyIzslZamlr+QZIK+RG4HQ9PeozLAY=;
        b=GzsB8Beft0Xnf6dg4eK+8BkcX25JOT9bEmxCRxV+6w8idjyVEikaUJ0gQdIcG6OrW1
         N7FgPZ4RC8X5heP4rmLM9s8gZ3MTYOsx2oz7+jP75bunoPjminIz20DDpEDa6fs+aW3l
         9hjR6s/o3dlieUi0bnlxE93QR3721k5GfIYRlsjnfK1nD7xMnY/ssZXKV47bqsu9VK64
         YgQ+7mtxw42Ped8/Y8EZZYFso5vvx7vBtCgf54JJUjaMeRrAQmUVdBOzswvgpGpBOiAs
         tp1KCIxwBs7MWBIBt7OLbUdIRGtM8I/Usqp47DbrefuvThnEJFISHhKj6sbhArGVIhhm
         3hKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107785; x=1791712585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6SCB/3AIaM5xEYyIzslZamlr+QZIK+RG4HQ9PeozLAY=;
        b=K4/cUDb1Waa/92bBqxO4MUPZ74x6bXzeJjDjT7CdcIVFVv+lgk1YQWsxncMcyVARs/
         P9yX5gNdav9IP8B18u881OBWU9gLBCsy2CaSk1YOWv71399L3TX8gcz97v/SJPFvM1fN
         OOA6s6s5+9/c3gf2Zt1svOlNQxRO2fkIxSSkCAORwzIe/yaAGj9SyXDP4o+1/8ttT6U2
         +w4XUiEPgLsYXspiHARYT+EDJeDh/1zHRmyqAP3KiTDCRUiX0cg/vqsO8a/ZzM/Q6t8H
         jkXUbgZTBpj9NrdKR77pr0hKJgZFoSyzfhLZJ6CA2K2H6RhWJOsMxfkrEuD47hocWL/+
         UMbg==
X-Forwarded-Encrypted: i=1; AKwUvByEZ0PFTmYZyNnJE0TR273D5/w0BHVm19boGSD/b6bmjiWUM+wstchw4GhAuuayhh3lPxal@lists.linux.dev
X-Gm-Message-State: AFuF++nij4qSxoVy1I7/ekOFV94tZ7lOikREyZqaLv+rF5Nohk5y25xS
	+SCAbP7o4maQSTX/AxZ2GvxhH9lHiGIbkEGj6uhMQzkHMjHwcEpTVaSy
X-Gm-Gg: AYBFou0/DhyEKOcEd1J85cKW2QOLtmpni2jUqJIcTPEl3R0tb5rdS1166dQaRvHsS9v
	Uf72ZbKRhCjQnzPVx5JRRs/Cr/BqOxVkUWGEkSjO9sa3OIgaXmaa2d9aSVaOLK/krYw31GzA5f5
	+4U7mx+m7FEAjkha1uhDm+WgPSssIgyZynl4b8pfs3gcW7tK+x68VwA2jTmdaA3/AoYtOSxPh20
	d4W3oSYo++XcJjv9wdsT6dh++0456IvYjXrs6w1Aztx6CVMwKMkADwJVZutQGB7suafuTP494/d
	+lA2LNmjIG4epFG8+cCGiMoa34EEtwh3yXUveMRLLBmFFELrEDMr5538Rsqfl5PitzmZJVAbLA8
	k/9UeXjJg7STCozPYoPgy9b/M/arO37VUezHN0ZLEfqsFoJSdZVg/BaHmHOSbL/iHkW3J9F2P0u
	QGzEi/uU0E/Okf3qm1M08ia7jeF3TTi3bXQVo1skLxkIa4OBQmi9DhX6NW281v2oOHs+bpPXmBT
	yAN//MboVLedmotel/FfzLgKOb60Pzf3Q5EcRa1FxXmRrAl0aKpo4aOtGXPRz/eY5QZoxiVHuTZ
	OMe5JcHUCP9wnp94cfIaYVAiUNlYGecUt49HvPyHpKFLlVeetke/hBvHcIw=
X-Received: by 2002:a05:6a00:1bc7:b0:880:ee58:2768 with SMTP id d2e1a72fcca58-88af8b3f3c3mr6115341b3a.56.1791107784970;
        Sun, 04 Oct 2026 02:56:24 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm2418175b3a.28.2026.10.04.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:56:24 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] ntfs: do not give a contiguous cluster allocation a second run
Date: Sun,  4 Oct 2026 17:56:08 +0800
Message-ID: <d839fd6fce07e1303ae8627739d6db361e50bf07.1791107674.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1791107674.git.matthias.goergens@gmail.com>
References: <cover.1791107674.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_attr_map_cluster() asks ntfs_cluster_alloc() for contiguous
clusters and merges the whole result into the runlist, but reports only
its first run, so its callers zero only that run.  Within a bitmap page
the allocator keeps such a request to one run, because a cluster in use
ends it.  The zone search can also move on without testing the clusters
after the run, though: it skips a bitmap page that has no free clusters,
it goes from the end of the zone to the start of pass 2, and once every
zone has been searched it shrinks the MFT zone by half and goes on at
its new end.  After each of these jumps the first cluster tested is
still taken as the next one of the run, and if it is free it starts a
second run elsewhere on the volume.

fallocate() over a hole then leaves the clusters of that second run
holding whatever they held before: on a nearly full volume, 16 of 20
fallocated clusters read back a deleted file's data, in each of the
three cases.

Delayed allocation gets a second run without punching any holes: filling
the same volume with write() reaches the last case when the MFT zone is
shrunk.  The allocator then takes only the first run off the
dirty-cluster count, and after the fill statfs() reported no free space
while 939 clusters were still free, until the next mount.

Before setting the bit of a cluster for a contiguous request, check that
the cluster comes right after the run, and return the run as it is if
not; no bit has to be cleared.  ntfs_attr_map_cluster() already handles
a short run, which a cluster in use produces in the same way: its
callers ask again for the rest.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Suggested-by: Namjae Jeon <linkinjeon@kernel.org>
Link: https://lore.kernel.org/all/CAKYAXd-agPFvDj2-HvjP3SLtG7AxkqUeNPqYyrLt-BN7fT8w6g@mail.gmail.com/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
New in v3, after Namjae Jeon's question on v2 2/3.  Patch 2's early
return for the run from the hint stays: without it the restarted search
would read the bitmap until it found a free cluster just to return the
run, and if there was none it would fail the whole request with ENOSPC.

The other contiguous callers are the attribute list allocations, which
free a result that is not one run of the full length, and
ntfs_write_cb() in compress.c, which writes the whole compression block
from the first cluster without looking at the length.  That was already
wrong for a short run before this patch and is not changed here.

contig-paths.c and its guest init script init-paths in
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-10-04-ntfs-nearfull-v3
set up each case; the README there has the results.
---
 fs/ntfs/lcnalloc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index c58e689fb585..3ebcac4c2864 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -375,6 +375,16 @@ struct runlist_element *ntfs_cluster_alloc(struct ntfs_volume *vol, const s64 st
 				has_guess = 1;
 				continue;
 			}
+			/*
+			 * A contiguous request gets a single run.  The scan can
+			 * move on without testing the clusters after the run
+			 * (past a bitmap page that is full, to pass 2 or to
+			 * another zone), so return the run when this cluster
+			 * does not follow it.
+			 */
+			if (is_contig && rlpos &&
+			    lcn + bmp_pos != prev_lcn + prev_run_len)
+				goto out;
 			/*
 			 * Allocate more memory if needed, including space for
 			 * the terminator element.
-- 
2.56.0

