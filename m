Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEDC481FCA
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399315; cv=none; b=Nv/yeIpk0wfvZyEgrkmAoPoJDgaTHd/RkB5KqD5edQwvCc809WFJAus/i1CxFreokeL91xxYmAP0cMXzg5T/oK7mX0Mrt50YJ4R40StzjONNyfLRIIX2La/1zP5PPIBovFfYqMHQxLzrdz8DFmGsToSgiJ9D2BW1g/opsSd1o1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399315; c=relaxed/simple;
	bh=cQTODnujfP0yE10YdHrOzfFMpunixfAc6VziSPNK5CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lXt1nePRhrrkfXOcTvNlUdI8Qi8UonG4PYT1SlXB+NTzPqiTWofKE1gU5dCMb1+r9+FxvDTxP4tWuI9QzYiW5/FWNPTDXq5et0ykCsCe17Ecm71/muolrX0PMI1MYLVLvJWykXx0iPYarX2GB4cN97lyK88wEsZ7w9CzjVlbA4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qTEG9Oui; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTEG9Oui"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so2281656a91.2
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 08:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399313; x=1790004113; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRt3xqC39vYxGeRh5uqegIJjn6NsaAqUWIyWSntHMRE=;
        b=qTEG9Oui9cHQ/2dsooYbPXbYSr/QMIQ/OLN1Z26Q2595mXBGh0pFSrMQivsVJp/jTp
         f4Sc3plIbA5HrMqBt1dcL17Z6XQpYMepvB16EvWDDSPfI+y+AToP0Bo3S+SUiwZuclxp
         IYvvcxxxkOQwdbWPMDtLCcmqVaNRRwjIMDKJSofmr5BS3aCWWIC5LLs/zHvdOkQivBbZ
         MHH9sRCZhyyZUf4ltpRQblFx17QwibIrFZohLzebnXFM2tw09M+IvBGWs7ledwAlU79K
         hTecX7WK0izMLk2+G1vkkTKA6CnFQW0m3kLAsO3QwkP/wpyXuMRVP5zVRfqBq/U1dqyy
         N+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399313; x=1790004113;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bRt3xqC39vYxGeRh5uqegIJjn6NsaAqUWIyWSntHMRE=;
        b=Ju/lt4kDR3uUMQ73ZbwMqx+/1t0fCgN4chxfGHcZUpuGZG/PsZT3H5Ft3CTYJcozQR
         iXjnteOy1Xad1JO0Ckw1j6Haj44HokjE6lteoVQBrZYreiyLM7G1hSgLOEa+W7rUtjPq
         N65HbLegIGx4dosCqBuDxF4uWNjElRMpKo8A7JIaSDz/pFl7Rjw8b5sr6hLFLFQPc8Qn
         DQUu74PSoPGvnefoVj+kynEyAT5YPz6Z7EJq3wt64hdStbwBMGUEd1aA4noD3y96i6SC
         UliUiB4xh0DYoYPLDReRYDhRrE43rtw2D4Cs4Z3J4VtPNPmjfJn7KdWXHVaZBAFSAW37
         DDuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6WU+14qOI6sNRZRXLxG07AZ+rlVM1Y5tIwUz86M7n9CywpHIAusavFPt9NbbaYo4un4Of@lists.linux.dev
X-Gm-Message-State: AFuF++nj6SnwwYsurxT9Dq+U0EAOkhlw1N5SpCdF7r3o/wD9Yo/jpDNH
	PNsYcgYnordvVLCbHPAWOwrx20flGSvfVm1Px/PjyrWoEdxmKrp5SJDCmZ8dwA==
X-Gm-Gg: AYBFou2nfOcjx5qnA+Csqkla7VxSQ8c/zrFremBrVBV1fChE6N86gutKsLjZsTjTEUy
	ykGul02dHHALPNevquXDVF0LFyzYJmNH8HAwnWkIiubOJZxOxyF6QNs2j2sV85gSYo2jBBpSCwf
	pyHq1jh0YW3IToIkN4oEF60GLVRQshOmYX7z7fNDJMGe1x3UEYp52nBixTKJv8INCEst9Or4m/D
	QAengzJBDyFPCFNRcuclY71k+9pGGTXFdtQtI2uQpMIo4eDzrVg2dvDHPg+PGq+hHXG4K755Zfj
	SLCNGVlrVY2iNFnp82jNyj1boa2pzZUQAd+pc/m5AtpriMI8hfO2ejqlxrRsENATyo4kkM9LMLS
	i6xP54IpCxEDUPHnr8SaPBmoxz68y0D6be8Eej++bdw4p865tWEePArKBjJ9vsnw+LppnZDVE7U
	arrVEvKBs14SOg/exWQQv50Tl29f4fRq1EsW4NCEB1R+nXxrrq66WroTaU7ynPNKUPTzKyH36+Q
	+aBDEH42clD66JVhiHMBB4=
X-Received: by 2002:a17:90a:dfcb:b0:398:ba56:b926 with SMTP id 98e67ed59e1d1-39dec142834mr7201837a91.25.1789399312622;
        Mon, 14 Sep 2026 08:21:52 -0700 (PDT)
Received: from hyunchul-PC01.tail461a24.ts.net ([125.177.232.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm31667a91.0.2026.09.14.08.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:21:51 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v3 00/10] ntfs: support 4K-native devices with smaller MFT records
Date: Tue, 15 Sep 2026 00:21:29 +0900
Message-ID: <20260915-topic-4kn-lkml-v3-0-447cfa17f780@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789399242; l=2168; i=hyc.lee@gmail.com; s=20260727; h=from:subject:message-id; bh=cQTODnujfP0yE10YdHrOzfFMpunixfAc6VziSPNK5CQ=; b=F7y0GzmabOsMR6lflv/9ikU7AVlFwtXSimXTpIwikC5bX0bJB/cZxCcpw1ZmzDTYP7h2zgfUd agJa4dX0k1QDTQ+n4m5VIW4guI5XbZhb9EeBYzglqoEc+1GvuwC1Phz
X-Developer-Key: i=hyc.lee@gmail.com; a=ed25519; pk=XjFN8PRLk/ZCdNmwABbNomUbzLtXDFRX8iJkKn3fgGc=
Content-Transfer-Encoding: 8bit

Make MFT writeback safe on native 4Kn devices when MFT records are
smaller than the device I/O unit.

Validate MFT I/O geometry, map and submit containing I/O units, and
coordinate direct writes with generic folio writeback. When a write
covers multiple MFT records, preserve the unchanged contents of
neighboring records in the containing I/O unit. Keep the completion
behavior requested by each direct-write caller, while requiring
synchronous completion before releasing an MFT bitmap entry.

---
Changes in v3:
  * Rebased onto ntfs-next from
    git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git.

Changes in v2:
  * Fix compilation error in Patch 3.
  * Keep valid but unsupported MFT geometries read-only and reject
    read-write remounts.
  * Document the sync-dependent -ENOMEM return from write_mft_record().
  * Add Patch 9, which trigger page_mkwrite after native 4Kn partial-EOF
    size extensions.
  * Add Patch 10, which wait for attribute folio writeback before copying
    a new non-resident attribute.

To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev

---
Hyunchul Lee (10):
      ntfs: read MFT writeback bounds under size_lock
      ntfs: validate the MFT I/O geometry
      ntfs: write MFT mirror data in mapped I/O units
      ntfs: serialize raw MFT updates against folio writeback
      ntfs: track direct MFT writes until BIO completion
      ntfs: write MFT folios through mapped I/O units
      ntfs: write MFT records through containing I/O units
      ntfs: use sync flag for direct MFT writes
      ntfs: trigger page_mkwrite for native 4Kn size extension
      ntfs: wait for attribute folio writeback before update

 fs/ntfs/file.c   |  33 ++-
 fs/ntfs/inode.c  |   2 +
 fs/ntfs/mft.c    | 888 ++++++++++++++++++++++++++++++++++++-------------------
 fs/ntfs/mft.h    |  19 +-
 fs/ntfs/super.c  |  86 +++++-
 fs/ntfs/volume.h |   8 +
 6 files changed, 716 insertions(+), 320 deletions(-)
---
base-commit: 8809c3f29555f9d1e66fe015080a8d4979d91eaa
change-id: 20260913-topic-4kn-lkml-8ccfb4922915

Best regards,
-- 
Hyunchul Lee <hyc.lee@gmail.com>

