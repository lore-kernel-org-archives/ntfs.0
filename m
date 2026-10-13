Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4DD2FE074
	for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903533; cv=none; b=aQy1dowBhyQW2UUoajZvQTLCYzOeblkv0OG7SxhBcik8CuduGmLdS+5NK2gVqZEE751L2xF4KK/TlvsxOmCGwFdcfYy7IB9dBMyEEHgFEDCYa9IplT+hWi7ZRJZiISU938rEkrdZrTNqf/nn2guegvJeUeKjzr/I0/M3WrP0W2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903533; c=relaxed/simple;
	bh=5XTF+lbN/3XQzs07ZUpzVUN/0HcjsBHSudr3yav8th8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VHczbII9dHjAgu6Qx6ap3r8TXKHiCAf3KUQuszWFW/dTLD5rQII80du4X/zDLTJLE9/o05//Qi7VfQNbGv1ObPGyvFfFXX7vG6boHf9ypGkFon+jo5KuRa35w4NSLoynh+kF4h04SRzkaFjboePMI95DUniwTqyoCK5waxdP3Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qimxJ5AL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qimxJ5AL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-887d902c651so319069b3a.1
        for <ntfs@lists.linux.dev>; Tue, 13 Oct 2026 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903532; x=1792508332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4vYE1CNRZ/CztX0XDspWeyRLbeGw4BH9y4hZGra0Ns=;
        b=qimxJ5ALb2S6xDbUAHwFCGHK2c5cdHxKj0C5DOs4XaKtbFECJ0p/7Woq1y+0ulN5d/
         qyLM5j1s5UoS5vp6Ho0DvAjf9ftXzzF4ZDV3AMWpc9NJd8YIqC3G6tBacRe9g2FtPH/r
         yTFZMCn4WcMocAoSHOO6o+hZkcHNFtJs3boU43ZaL5LPBKrVj0sBDbQ4OpF+Itls0dwY
         fTcMR5DePVt0F86rbZNN38GQ0yyb5PVU1Vi4WRjsncf3cBmBM7qbTYvy5pgDnA+61prH
         bQCT5EaD3V2lKJ199DbaScSFDw3Q9bR1y1OC/mrol51OkvjxQBCfqaV/R2NMoRFDsdjY
         6hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903532; x=1792508332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4vYE1CNRZ/CztX0XDspWeyRLbeGw4BH9y4hZGra0Ns=;
        b=ookSgIwI/tG4yh3p/8UC5fmhhzbXIq2+7gTz83bhJBdbSHr1M+SyJUWkdIPhRPVzT4
         Nl9Cyd1CvZ6XGN4SY/bzaFxOQFr9qr7ij6s2EG5UkrLOhs7Gtyt+oAxw2u4LfIAK17Mb
         P2QtkT8SJlT10gHSKopTPCBZd1kLnNjXPRFZzJN1Qcmejd/fsnRTV+DECba04BSu1Svb
         u3x07SPDkjfi/26U4gTtYBQL5Pt3ddUnalAE4WmmpMm/yzjG2mb4V/SYE73m/m+L5ZpN
         l158uFTntlM1DsbIBRLfjCXoUl/x4wa1OBXhIEZ8VjQgohJadvmPBu87UOdGFyC4/3aI
         T77w==
X-Gm-Message-State: AFq9FYJoDM5UEi43gVShJ83LJRpkc6uasdbhbDWRsUwP+Ft7SHtixsql
	g3F+CoLShuvS6+TltzM0SQ/UvsJi+3GMalxHIOlc6otg1uZXmTS6JsIx
X-Gm-Gg: AYBFou1vt6GovF3+5n15gDWeZBztuFniMtS8tHN6PRGIb9/Dq/imM76bcQSfDyLLMTq
	H2iLfKd/w7iWKKrF+miN5YL5tP/x5ISOWYprZQLj3fHLMjB3e17HveH0Z9+dJSMZpkl7r+offyR
	xo8tQxTRu1r1PCMoM52x56dD1fZhi+u5WTlhl7p2YKegHU+WvJiv4gNm1aoMtj3Tt7gYhzqfgiD
	nsEuiIOU9v/TZMpCuPfaUYEDgpQK8gQsxhzV+SVomF/XxHf2ezYHM/cq4+5R9LKODUEi8/Q09nu
	GevoTV0rtHsqEn3QL1GiHcPys2j+l/Z02OglbYQfpzzv8NL8fD3FbsW7xJAGqWZ7udkMpba+2vG
	5mgKzgi21myL3ThpX6s8IB8U67P0uVb4Vu3uuLvQTYjJ1FjTvDYsU6Zx7qK08K4mZpyfzqTXdGA
	9Ivqkpmm9HaGnmNdG7RuEPg2SRCxIQP+J31j56KdHhbkp/uEkT6FK8pnTtw58QuWY=
X-Received: by 2002:a05:6a00:4a06:b0:89c:e556:cfed with SMTP id d2e1a72fcca58-89ce556d1a7mr2192597b3a.0.1791903531667;
        Tue, 13 Oct 2026 07:58:51 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89a0724a045sm2987330b3a.45.2026.10.13.07.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:58:51 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>
Subject: [PATCH 0/2] ntfs: handle block device cache flush in fsync paths
Date: Tue, 13 Oct 2026 23:58:44 +0900
Message-ID: <20261013145846.56415-1-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regular-file fsync currently ignores a block device cache flush failure,
while directory fsync never issues a cache flush. Both can report success
without ensuring that the data and metadata reached stable storage.

The first patch returns and logs flush failures from regular-file fsync.
The second adds a flush to directory fsync and reports its failure. The
syncfs path already handles flush errors.

QEMU blkdebug injected -EIO for flush_to_disk on ntfs-next at
04fb910da2c8. Before these changes, both file and directory fsync
returned success while syncfs returned -EIO. With the respective fixes,
both fsync calls return -EIO. A kretprobe confirmed the flush failures.

DaeMyung Kang (2):
  ntfs: report block device flush failures from fsync
  ntfs: flush the block device when syncing a directory

 fs/ntfs/dir.c  | 2 ++
 fs/ntfs/file.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)


base-commit: 04fb910da2c857cdf99a331c576c3e5e7197c6dd
-- 
2.43.0
