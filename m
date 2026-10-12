Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EA8415B87
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 11:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804485; cv=none; b=HCIuVo4czVx6ZLP/QQB3SIpkoBWNYpaY1GMQ7DdGF+Kc84n2QcFDqGqPPF5KXsE/f7eKqsWekGgif8BmbVNCV52C4VsX0x3phFwufiVX+CNJIFbrBFgPWnmBHsi+PGXiWJebS6XhXBsYrxLI6oYbPzTB9lQrKx8YCGbM8mNV4ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804485; c=relaxed/simple;
	bh=exqEXLN2SY94nU0jMh7MM0HV9X3L3BalWjmZ/lzq+sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rp3ti8qAZZ6cFTSwoW1zHLHRf0QTAt0goD7sVJBB6W1PxLbwROoue+UdUgm+NlT6vBlAOx3/gRTBN1ygO3QvTjsuAi5qZGEptl9YdeQ8R3vS/iQU7S1dh6Dph+Ck+lkJa/OkIKE+m6iPlx0OSprP/pdJR0vNAhnk0irghh0iyd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BajHLbih; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BajHLbih"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc785ed8aacso50905a12.2
        for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 04:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791804483; x=1792409283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDB3l5shmaXveZ9dlihn63ZuXd4kW273Wtsgs+YqQR4=;
        b=BajHLbihhwtrTmswfZtix/UeJn8g0CFgNq+yX+JrgeM5dpAd6pAxZtIPhWkMYO50b9
         FMaV3N7e8zwI0S/ZIDMe34HrIwDMk+44rwwBn8x2SNo//ZvV+3rmwFXU0716YPvWcfCi
         Ef49ZM6OOxB9nkacsUYrifZtAtCHoRtJLTJRR5i22fdTrZy2U2zHwn/1NJ3TeYDzj4lM
         4nrwuElTcl4zsDRDAtcypgkDTvf/k/ldicpnaO60aF+xx8mUgYg2SUSZN1blC1L+R2/s
         pG3fwV6+TTKBv1l5BsJXNXTg2kNdfHqQjTB7IMRu++ZSvctPXdgLQsFAcVTi+1VFNECX
         w7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804483; x=1792409283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDB3l5shmaXveZ9dlihn63ZuXd4kW273Wtsgs+YqQR4=;
        b=nRh5qR9XTtR3awNnViZePZDTIyhKKb4IOaIb+mC737ZRre+/ANOHa4w3soxOlJ9ZfP
         /H9gW2Q4juG5GRemNpU2IKREt2O3Ex85X5FK5En2kmzTxPK8MWFLHZOcoUXPyddHHLls
         jn596YV+kdPhEzFkCmjKT//uMkU4qoYzit6ozDHWZO1k4XxsgLCGIYLNvCI/xZecD+Q0
         PP992Ip8MdR+mGzVnzqCe1HYEFy4OJ1fqNRkRRhnT1cBsGyenlYKEfX6HIVOjIfjMdHt
         tuWAAx/QccmkShK/IVlE1ByMj+oRuamgDRcUMG/ifxmX41jofnX53QdF+VPCNxUPVBgM
         l8lw==
X-Forwarded-Encrypted: i=1; AKwUvBzY8Uk2jpng22EY0A5sUEAm+dF70RlZFOyUGJZTO6jZmYJYWhmziiDGsg6NxuMQ9CttHKEe@lists.linux.dev
X-Gm-Message-State: AFq9FYI3luc5q3EVwj8Uy+WpY8EFoYNAL7p20rFYxVFnChfYoDgMMVkC
	yiYEOVgpljL6DEeAf4i7oCAraW0zq2TuexscdOVBfVU4+tluDcu9b/6k
X-Gm-Gg: AYBFou0n+CoXxS/5ftxhAUqZ5XnoLTIMBTUR6FyeL6mspih7Aa2PyyKEs2hXPAAjKqy
	I42nuyafPT2SpHguQtKONObjuyTbFDYQ9aN35pSN+9VP05/Ov9ShxYq4ysrxv1WTOSK2/cDkfBS
	ESw0OLA+9nsSUoWBKOlM8yywop82oIKSTUTbh00SWscKN59v5MlbBSA8fxHCJNKMmWp4W98/bvp
	mscFKsNnulH8+KJuzug0TxuJuSCSN4wsCMLT9k28sq6Yzdc0cihyfXSZLNNep2xvGWQRmXIbycf
	6JR/tKAsnXOJznu3B3/wORwWwanaZcAFoFE2Z30/RL2V6JZ4XVuQCoUEasA7XC24f8VJqRtF/I1
	Bjh8ZeX58MEBD0CzKP4WVOShR/F9fYgQxV4dZ6X/JwQmaxv9GZeGJCjoOSMQAG81fuVukgc2IOR
	ssmQPprPCvKGRU2mC9AGDDRFSDYR7Zr+9qwlY7fnTZ7fq3AG1JfS8SLEJ5n8KHoItwbQbOiR/Y+
	g==
X-Received: by 2002:a05:6a20:734c:b0:3df:15f4:756e with SMTP id adf61e73a8af0-3e16bd0ab2dmr12145528637.1.1791804483113;
        Mon, 12 Oct 2026 04:28:03 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c43ae1d3sm3911281b3a.48.2026.10.12.04.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:28:02 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>
Subject: [PATCH v2] ntfs: compare streams_interface with mounted volume on remount
Date: Mon, 12 Oct 2026 20:27:55 +0900
Message-ID: <20261012112755.1353990-1-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012031656.3858771-1-charsyam@gmail.com>
References: <20261012031656.3858771-1-charsyam@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During reconfiguration, fc->s_fs_info points to a newly allocated
ntfs_volume. It does not contain the mounted volume's stream setting.
Consequently, a windows mount rejects a remount with the same
streams_interface=windows setting, but accepts streams_interface=none
without changing the active pathname interface. This also breaks an
ordinary read-only remount when the existing windows setting is passed
again, for example from fstab.

Compare the requested setting with the mounted volume instead. Report
an unsupported change with ntfs_warning() so it does not invoke the
mounted filesystem's error-handling policy.

Fixes: 2de2cdd9cc08 ("ntfs: add pathname access for named streams")
Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
---
Changes in v2:
- Use ntfs_warning() so a rejected option change does not invoke the
  mounted volume's error policy, as Baolin suggested.
- Explain in the commit message why logging must not invoke the mounted
  filesystem's error policy.

Link to v1: https://lore.kernel.org/r/20261012031656.3858771-1-charsyam@gmail.com

 fs/ntfs/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 242fb19ced2b..ed9f29b16c7c 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -275,9 +275,9 @@ static int ntfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 			result.uint_32 == STREAMS_INTERFACE_WINDOWS;
 
 		if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
-		    NVolStreamsWindows(vol) != streams_windows) {
-			ntfs_error(vol->sb,
-				   "Cannot change streams_interface on remount.");
+		    NVolStreamsWindows(NTFS_SB(fc->root->d_sb)) != streams_windows) {
+			ntfs_warning(fc->root->d_sb,
+				     "Cannot change streams_interface on remount.");
 			return -EINVAL;
 		}
 		if (streams_windows)
-- 
2.43.0
