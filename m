Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A60738C42F
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 03:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740131; cv=none; b=TgTJxAZTr0t18gnVUKkFpeVQ1pJqBjjmzuNA88zOHKipGLb9FnbLbw7oszfcvPJTLSvQxkdjQlVA+0YoDy5VOZGkyjgBDo+utTtZwTMKojDI4LoNXo89zPQz7adraH3RjtyG6Xnd2M6PdwGkC4yZ1GWmucMDpi6Iu8P2ogiNs/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740131; c=relaxed/simple;
	bh=WRPywmVYQO0VtIPWxm29CrmFWUlUwbhwwdpQgzpRPMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWivfjjHWwJ9Rm59dYonHYlPwo0kBlkWQ/j3xShxZOG3nOEVURebxGKcKw2jBWXY9pl4HtTXPlGQ8ifw0sDcwDWPPSEVXX+LRYc3llXZozC6T/esMvUPe9YkdCx9+EGVZ+opcWixFZhXFx9B1ZYm74/ccHHRjXQhZiEzL0Ov7qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIjOBQ34; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIjOBQ34"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so28790735ad.2
        for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 20:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740129; x=1791344929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufLJ+ytiFqLa5W5DPoK5dh+B3PH/RjJJE+Ibm3U4zmw=;
        b=cIjOBQ3444vNSOgw4Q8O8mVVe6hbp7oIid+Kgbjw8gr7/fAPaFFoKBOsHdzP80Oedl
         0UwIAh8+6Bbu4wcTuKwFxY6DS9NlEmu9loAyQs1M8gfkJ3S5GONMy32y7QCz7t9MWyB2
         t+Yv7z6VG3SENBVFsi3DYjHblahWGyyWMqy7mHjsyBTpWtAdGLAbN+6C2xmOVpaO3unh
         IxgsWRhZuTzM7zXXhfchqpvJundUlSe420CH17WMUpXWX+hlRDZr5OOsOelRPvhqpYfQ
         EslSn4r6GEcJQSUqjp/57y3rQESHr4NNhJ2Q6Ojz9Ax6ZUQ2ItycCqyC7P5pg1F2yRDD
         WDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740129; x=1791344929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufLJ+ytiFqLa5W5DPoK5dh+B3PH/RjJJE+Ibm3U4zmw=;
        b=2RzMzrWNd6mIOr1jrp0N4PmY0gEITqRFSqCPynm2K0Ika7XX0E9auL39Zgn7FzObur
         ids/HHla/gnlKYLMONToX9857ORNM1iwQrRJufY8YxxYcZNdgLizgABv2YpHVgyOACFy
         +tS17zAuvTk9tO29srnk0tvyEDJV8QkOaNYmKF92An1rfWanXcQbD+P8WXG8snElebcR
         aUps3jczcp+LzXz/Xq37qTDB+s/S9u23ym5RHF1M7ey7WRYSrmgUDt66CvYbllL8ZOj0
         4pVPC9c22nDQfaC+CdpgoWtHXQHLfUeq921Z5i8lwD/dFgjmiutyIK7YK5lGp1xDitFb
         /7yA==
X-Forwarded-Encrypted: i=1; AKwUvBzjwmALtEQsz0Y/p9aWwceSTgnRg49a3CGPKwPsuC3vDqUXudib93DT5bQTmzTYJKQbgFKA@lists.linux.dev
X-Gm-Message-State: AFq9FYIw1sNJ0XOoO5pycHoSy9rR1lQnSmtzTHiO5H/16hZdsGMorp1h
	TIgsZ5JrH9GqzsvGHxyF5PgTD7tj3g94OTnkGlL6Vm5BWFbvnbIRN4w0
X-Gm-Gg: AYBFou3D5gKVkAxc5cAZzcUGqoFbHUYBqpiSmRMznw3xtyBDA3QWuOgU6IQgYYAvgoO
	NZoWWCyJHTiJ8AqODWnxbK2POXYG88QtSC3L7fdFgR48ev4xxBf+EeNKw8lQghD+Y8J5qf8UnUT
	6aJjkktxekdfFwGVVZS9lmZHYiRXrQVVmmtZIES15qHhdTaLP6Vy7ZPq3cKCss/cIWOfVM4/A1h
	kpwdKRmhzrTyQ9OKH4vTPKBvyEefMBeUC3ykhnRxDin9ba86Vad1PTkmdbXDMcexTPqyMiVupKu
	mca5FJl2uY14bOPMmyreJGRUykwhi0W1IuMD57OwYu2UNE8lIOvBbwkwFwNUPcczNhVtU9w6QOz
	KWOsa3H8GWtiVHRgcpcF2I1pq50F/H/VD3MCazECZPeHqIV0qa7DZDu6Rg4K9Mxv6xBLjC5x0Aa
	4VFAV1hLZ9yWhHJ9UV1DrO6N+IsqkcHMC7kVC90/rZE5kuYMtTGKqh30Y1q9gkSVBpIxSnggyu6
	liChpJFEXiWhR84oBoz/4qATgi3ndDqLfqaQGZth+hYVW/uXsPpyBlV+d/YiZbO4TOK9EBmcuT1
	I7KrCbw/TI55d5mI5PvjMIpGsH1zk0D/zqQPFtuCdgnhaWGKUifnJKFJCQg=
X-Received: by 2002:a17:902:c94e:b0:2df:991b:4368 with SMTP id d9443c01a7336-2e2e4a24f0amr1533905ad.53.1790740129442;
        Tue, 29 Sep 2026 20:48:49 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:48 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] ntfs: fail the mount when $MFT's data size exceeds its allocation
Date: Wed, 30 Sep 2026 11:48:34 +0800
Message-ID: <07983b377d36748124fd5b06012b67ea02a0f642.1790684177.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790684177.git.matthias.goergens@gmail.com>
References: <cover.1790684177.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_read_inode_mount() takes $MFT's i_size from data_size without
checking it against allocated_size, unlike the resident case in
ntfs_read_locked_inode().  mft records between the two are not on disk.

On a crafted volume with 512-byte clusters whose $MFT is cut to 4
clusters while data_size still says 27 records, reading the folio
holding records 0-3 finds the end of the runlist at vcn 4.  An unpatched
kernel hangs there on the folio lock, as in "ntfs: fail the mount when
$MFT needs its own extent records".  With the previous patch vcn 4-7 are
past the allocation and so read as a hole: records 2 and 3 come back as
zeros and the mount carries on until check_mft_mirror() finds the zeroed
record 2.

Refuse such a $MFT before anything is read through it.  The mount now
fails with:

  ntfs: (device vda): ntfs_read_inode_mount(): $MFT data size 27648
    exceeds its allocated size 2048. $MFT is corrupt. Run chkdsk.

fs/ntfs3 rejects any non-resident attribute whose data_size exceeds its
allocated size.  This patch checks only $MFT; the next one covers the
other non-resident attributes.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/inode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index a61f1519549cb..9c97fc3f9e5ff 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2136,6 +2136,16 @@ int ntfs_read_inode_mount(struct inode *vi)
 			vi->i_size = le64_to_cpu(a->data.non_resident.data_size);
 			ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 			ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
+			/*
+			 * Records between allocated_size and data_size are not
+			 * on disk, and would be read as zeros.
+			 */
+			if (vi->i_size > ni->allocated_size) {
+				ntfs_error(sb,
+					   "$MFT data size %lld exceeds its allocated size %lld. $MFT is corrupt. Run chkdsk.",
+					   vi->i_size, ni->allocated_size);
+				goto put_err_out;
+			}
 			/*
 			 * Verify the number of mft records does not exceed
 			 * 2^32 - 1.
-- 
2.55.0

