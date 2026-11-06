Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956482;
	b=308BIaU4scvrfbkgEUOqIHceuqTUv4OiqVsRCeA7yQHJcjwkOprQ3fjBlPDFBD9jiZBw
	 SC6LnUbZxjmsz0IAGKFtKcxqgwoM2a3J6aK1KJbsGwF6RlDhbxKPOeIrL2QZfNgTJQtSv
	 bWCKMDxkNzuybB9vIqeWzEpFJ2J5Pxqs+D/meFjaN/+LBJUD/+6fMsmOwjAEdTN9fHels
	 UYYJlShVAQd+AcrXAGREfRikwQSiO+h5yFyG+9ts2A1Hat3mHjk2SnXDyTpkCvtxxCZ9R
	 gTVsvDmEnNbtjSazDucj8sUmqIS6quenZPhulGnG7+Gbd3YStTNLqoSpS/qVIT3W5iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
	b=dogZOG4xReTWK0oblFfckkbKJGqowKlkZUTXMl4ShXOM7FRPjMDA/O+hmo2O9VcQWTXL
	 smbvfJMmCc7pwPCwi9ksQsfz4MroZOZUY/yjHaFAXgBprvCYWjbSbc0U+5QQGQhoiHwRz
	 xu1Igfxsgu+Jwja6w7HgY1kgU2avF57lcfVtJ/YSbMNMsZk0abIiREKvUX688R2ywRJbu
	 ohia44EVkN24J6Orv9Y74Kl2TZEJo757Q7Uh8EcNvVm2fUDOueQxndGzPCvXclgvMqf7k
	 BMd5kXHhNZkrarKje5khX01k4AlQf3kHmnbN6G5LXh0ZiWjla5roKBEmrDyR9f9OS+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1vGvN62;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BC1606A334
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 09:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0BC1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1vGvN62
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a8cc11ac42so419532c88.0
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 01:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956481; x=1794561281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
        b=s1vGvN623GT/REHPwWjrVtHI8FdOs7rjaX2L3gcGBi0UHB1fuxCl8mTajgKlYKBTf5
         GW6yHOVGnSjybYRPz+o0L2sIOCssXtg1WQdkPp0KIwXG6xd8LVSw9oV2Lb5pbIwzgWKF
         mUv7lxs1ZK7E42Qqd4rAaKRBC1+ov4K9JJ07has+EY7o7WImTNghs/eSfjL2TzO0E8Vo
         jW0eEZrJemuB6p+PbMdNR+er5H44pnfF4/ltsvdXblX6Xi66im+TgOMEIFj8VSytr4hz
         x1+dfm+c36JdQAjSn9Fc59D+Pi8o4lXyjCOMu3wCyBTneMFaPb7SzeXAE4zPFNcDGfcN
         /RUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956481; x=1794561281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
        b=M5sxAi4KSb2LMQEd3wybBZ61XKLC3U7nBiri/ZwPNqUVW9T9SFDeMJXgm+lMGHDY0C
         VREidgvaumchHLU/5YClKu7SGQvIYEMo7GPM1f5BfqN7YGzWiniq025m0yUvZkyl8ohk
         sds1eIISkIFCjWCGYEwL5CeqQy8tmBLNFhcX284GxM66tplyGH3qyAqArHzQNx6B97cZ
         1Hxm8cS2xHLqBljhaizHta/teGET4IXpN4K/cR2Vnsq6s262xWrW5E6f8qb4Bxlq955N
         tZkJMUcdU7inV5JjNAEvmna3yJCghiD+kHOoPbAorIXijGiqYv0FP/DFkhIXzUxYCjlT
         FkqA==
X-Gm-Message-State: APuU4Z8LfZS5uwL9OqICgEXxfWix6uC46J5Gh5EhBzNpXWautd015+bh
	5/6bhm/MXtTYjpZrg6DzCV+647iXHf6M4MjbsHzY0XH3qdgE8EtHCeDb
X-Gm-Gg: AYBFou1dNYx7oXcyO21CbR18gTnm9ytja75e6dwWtUX0CnE9Bsj+dxIciaQRWaQjQ+E
	I+9qhAuPnrM+IUU5e8QdZjpWJSBkfV4/Blv7Sm/745CphFE/jtthjTAzCvDzRDI8/peHbDIzT+i
	Wblq2QCOiHwqEqSyN7tz+BRAb73XfsKgJV/4/ce0u5yeV9iYBoqwkGX/rU5KIRxce2mxMJJpVGw
	ZJvSC2M+oArC5jCVf8Ia8T5XpJzJg4SPZZTe7NIvVuHk3BXAsLBGnsyIk+IDlBQReJkSBUaSq/6
	sy2Ep6+XrfA7WIJlsTNVKTeOaJPPqWLxM3hn8SDoRCWY3e00EpZV9ia+S6eOQklo6Sm3uhNVbwQ
	0nKHTXp/dW+Fzu+F/k1GRcya3TYkxf3MDqgShP8ociXPDYVDikrsMYvIjUWGbevirabsEU2+LwO
	mBxor13dPe0slZJqVgd8DHeyDuhqsgrZ5smf4j/wWnJgkwuhRoqYlpPevbOwbUuYspHPy2k+BZh
	ZbN9Jdx/ruvvfhaRpzvL3rHvDedsPzdKqorQ9EwoNudF4Wse2/1n/TxYkM/nv25ZgLXDb9jYrfR
	4S0KuKloTU5qjFyWPeP3Q/zHaUC9u68Ja7mlEAO4ijz87dziUcjtfnuSve3fhUT8Uw==
X-Received: by 2002:a05:7022:2097:b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b25d34277amr1679882c88.31.1793956480611;
        Fri, 06 Nov 2026 01:14:40 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm4200968c88.7.2026.11.06.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:14:40 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] ntfs: do not read an index block outside $INDEX_ALLOCATION
Date: Fri,  6 Nov 2026 14:44:18 +0530
Message-ID: <20261106091420.2461683-2-wahidzk0091@gmail.com>
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

A directory whose $INDEX_ROOT has a child node but whose
$INDEX_ALLOCATION is missing or damaged gets an empty index inode from
ntfs_read_locked_index_inode(): size 0 and not non-resident.
ntfs_lookup_inode_by_name() still follows the child node and reads a
folio from that inode while it holds the mft record lock of the
directory.

Since the resident iomap read started to take base_ni->mrec_lock, that
read waits for a lock the caller already holds:

  INFO: task init:1 is blocked on a mutex likely owned by task init:1.
   __mutex_lock
   __ntfs_read_iomap_begin
   ntfs_read_iomap_next
   iomap_read_folio
   ntfs_read_folio
   ntfs_lookup_inode_by_name
   ntfs_lookup

The task never returns, and neither does anything else that needs the
directory's mft record.

It takes one corrupted byte on an image from mkntfs: change the first
byte of the type of the $INDEX_ALLOCATION attribute header of a
directory with index blocks from 0xa0 to 0x00. The first lookup in that
directory hangs.

Check that the index inode is non-resident and that the vcn lies inside
it before every index block read, and fail with -EIO otherwise. This
also rejects a negative vcn, which was only checked on later descents.

Fixes: d9e00c457d4a ("ntfs: serialize resident iomap reads with mrec_lock")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs/dir.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index fce10baa2..9fb5bb3d3 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -308,6 +308,20 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 
 	ia_mapping = ia_vi->i_mapping;
 descend_into_child_node:
+	/*
+	 * The child node has to be inside $INDEX_ALLOCATION. A directory that
+	 * lacks the attribute gets an empty index inode that is not
+	 * non-resident, and reading a folio from it locks the mft record that
+	 * is already locked here.
+	 */
+	if (!NInoNonResident(NTFS_I(ia_vi)) || vcn < 0 ||
+	    (u64)vcn >= (u64)i_size_read(ia_vi) >> dir_ni->itype.index.vcn_size_bits) {
+		ntfs_error(sb,
+			"Child node vcn %lld is outside $INDEX_ALLOCATION in directory inode 0x%llx.",
+			vcn, dir_ni->mft_no);
+		err = -EIO;
+		goto err_out;
+	}
 	/*
 	 * Convert vcn to index into the index allocation attribute in units
 	 * of PAGE_SIZE and map the page cache page, reading it from
-- 
2.53.0

