Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956491;
	b=dBH/JlDrlq+jrbS4mzmuPImXzV4kWr0LOuneePB8UsI2QLrKiXIpdI+bd18+38yrj4fQ
	 SgqJNdjqRfF0UG26pwjGsW1bf5DCTdWzCEgYxg1JP9Z42/AQuo01m/68BNphQUR34h5UO
	 CuKWNWdqXUXtg4i8v2vLgm0B0qRRtpAihhZYTfdmdJbVUFnzPauRztcAwdtzMNF0xZQCs
	 acLOPmhYG1HeeV6NMiWpqgYwBbRQqj3qjqzzkowgAyMMauMcnmfWg3k0u1ZT+WUYt6V2k
	 Ejpxs0pgvbGvNWBE2hSqkXcWaDGRK7AZcaFVaiejJTl1fLU51xJIHJe0Btms7xyGouw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cc6pG2na6zv7wFv5oObixxN/7ExlBCLIUKtBmr4Nunk=;
	b=30btEje05IF39NAlAoPPEiY4aOICna9RSo1rTW4JV0LQR4Iet91Byv4JmEhGyG6dQ+tp
	 UB5K2Tyd4pHiCs2BygAOYaPTMi7Wlho+JNptue4AR7r/GDuUwlIE1ISg+Yc2GQUkVlUlV
	 AyOFw3JweHVpBAZi92VB4hI4lVs2hATWEPIE9geWSUCwElkEKhJFgxIZtLzGOaWqiSIJg
	 C73y/XQc1x6zCyax0xIto6mummVQvJHzWXMVdqPLqEip0n9hKFvPxx17u4pLn31iQKTYo
	 wVFkKJJEANa5iWskqaru1NL2vstP4PacSZ/gsEhLsmzzNlsDpmy1SX6wup8PPLzJm+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VpuPTeBm;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C364606A330
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 09:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C364606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VpuPTeBm
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1042792c88.0
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 01:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956490; x=1794561290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cc6pG2na6zv7wFv5oObixxN/7ExlBCLIUKtBmr4Nunk=;
        b=VpuPTeBmqEBirYF+W6Uo+CDVInjUPl+Kpaofm+kYR3PsnNAga+hsxiYBiRlV5/3gOy
         cJu24+c8A6IS+J/awWg1J96Bas/vfOTGYGhqB7Eima1WahybMciVCMSewccOI1JdXOBU
         pVzMdJ3V3ukmGKgsHmEiz+JBYfg1JNjRKlR0INLDf47MlH1Q6mweoeNE+F1cZiWkz3mK
         txTzPBKVEKATkpHK2KQrf10lnFsWo0z9ZSr9VdVHm2Xdsl5NXIRZMGr6MGLOA7Z3XDTt
         ywGLHJI9/8F78dr5iOMJ6gQL30YYpIZRbYcPTJiOe/du8t4nN1b2K0QfiM5pJLXIvY+d
         tCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956490; x=1794561290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cc6pG2na6zv7wFv5oObixxN/7ExlBCLIUKtBmr4Nunk=;
        b=ZFOg71C+J5Ha1j2YxW32SPZIP3DGg/3yW/tk6odO7nufamFBL7+ICHBWsSYIUZc1rx
         V2rfWn1fzbtfg2EHE9SPZzoBvnLq2UmfBH5Ul1Qy0/ULzSmHY+bQvcsR3V4I97sdKvAg
         bwDxIlzg0E8Y0sGIblL4gmu3Y3TPB5YNtavloxZ0Cs97TXQMRECQTnyIeXaar2naD6ob
         CMUGsL2l+I8TE3vEaIkj4sYObGCaNY0j0Hy5Suv2g6cTcveKrf/gdwKsDyXK8T7TwB0o
         TFftFwb1rnSEYyTIXiHCpWmtiA/Y2OJCD57pK4dG9O9fbQAIooAeoXM8E5Sp77V8J88V
         l5Dg==
X-Gm-Message-State: APuU4Z+QK4qoAsJmGQMqZ8NVehIPLdq+uwLCnpjmD8PuXwIlZlF2jj5o
	MTRGSmbkvboCXRV7B2U6Ng7qUIU0VFt7MsCfsYRq8kvotvj699bdtPaD
X-Gm-Gg: AYBFou3rR6qE7mcWZB/PBkamiqnqbAVHaCninDJI9BwS/XvDVEZhoOTz8iJJMBQOgJi
	htflvmQEBJ1oha9FNRad4KASDHkc1FyyIXZa2IcqxIQnMAXX+GfqvFK5hm3ETa9/upLkcaYoEWi
	WcQReJypN2JYWGhl3VU7c7caB7pNoHZgD5G4EQyLxXx4dLvhU+DCOxAY5fCcKdK0SezS3chCUYa
	SQkwVRLW+a6V5yMRquDPXySGeQW52tXQ4pIRUi0cP7LeINS2IGyFKpnAc6id6CYC2x1pXqUWmIN
	IYitYvGYQxVCeAXRHKhzmPzTx7VZYGeHjvMerAf4/SUk4U//N8MubTcFBeoQ9kBmbHqgte5eZ5f
	j+eg2Ygdajtl6dlt6BISbOTOhoARVjceHhVGcmKrVDs/aBA1OZysn0nd7ArkMWfZQnFgZtBnG2j
	3WBp/1t3QoBM4aIS2vhnxRyi4R2SdE0y36IKpWdGyPFSa8wo0dt4yE9uMXVI9ZqYF8tQ4It4bpL
	YOZgbmzN4Yh4P7HMkTX/qVoq7ac7+F/34Z+MAmsEVoWa60qqDjOa0CdzDIojNweGiVd3oXe18Sb
	tXtelD5GBasRylPK7aAyV2BRjuP8ook5yn24fiA2/+QLTBDE+Y61+I9P3C28DESBWw==
X-Received: by 2002:a05:7022:288:b0:1a6:7a2:cfc3 with SMTP id a92af1059eb24-1b25d30ada5mr2387351c88.13.1793956490207;
        Fri, 06 Nov 2026 01:14:50 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm4200968c88.7.2026.11.06.01.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:14:49 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] ntfs: open a named $DATA stream by name when making room in a record
Date: Fri,  6 Nov 2026 14:44:20 +0530
Message-ID: <20261106091420.2461683-4-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106091420.2461683-1-wahidzk0091@gmail.com>
References: <20261106091420.2461683-1-wahidzk0091@gmail.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an attribute has to grow and the mft record is full,
ntfs_resident_attr_resize() walks the other resident attributes and
converts them to non-resident ones. For $DATA it always opens the
unnamed data inode of the base inode, even if the attribute found is a
named stream:

  tvi = ntfs_iget(sb, base_ni->mft_no);
  ntfs_attr_make_non_resident(NTFS_I(tvi), value_len);

value_len is the length of the stream, so it does not match the
attribute that ntfs_attr_make_non_resident() looks up for the unnamed
inode, and the WARN_ON() on entry fires:

  WARNING: fs/ntfs/attrib.c:2115 at ntfs_attr_make_non_resident
   ntfs_resident_attr_resize
   ntfs_attr_expand_locked
   ntfs_expand_for_write
   ntfs_file_write_iter
   vfs_write

With debug output the values were attr_size 13 (unnamed $DATA) and
data_size 550 (named stream) for the same mft record.

It does not need a damaged volume. A file with an alternate data stream
whose record has no room left is enough. The fuzzer found it through a
single changed byte in a file name of an image from mkntfs, which made
a write grow a resident attribute in such a record.

Use the unnamed inode only for the unnamed $DATA attribute and open any
other attribute, including a named $DATA, by type and name.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index fce7144d7..0ff671e9d 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4930,7 +4930,7 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 		if (a->type == AT_DATA && !value_len)
 			continue;
 
-		if (a->type == AT_DATA)
+		if (a->type == AT_DATA && !a->name_length)
 			tvi = ntfs_iget(sb, base_ni->mft_no);
 		else
 			tvi = ntfs_attr_iget(VFS_I(base_ni), a->type,
-- 
2.53.0

