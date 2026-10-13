Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC48451CF78;
	Tue, 13 Oct 2026 20:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924577; cv=none; b=tERdyAjTBJ1alAx0m1nnZxWEqIHvbYThD2t4mfnTxW5fCVFi7QXG//vqqjnxsxvXq2Gr5T4xKRjuBT4bB1F2grRipQEclNuM86cJQWLKjGuVAK2ESpgo4SRsJXe+LfZuale4lQ2jREfTTpMbqg5wUfi743V35Vk4FET7/7Eh8ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924577; c=relaxed/simple;
	bh=QTSX6QPpMg+9sCN0elNGYodHswvF0CSyxlA2iJhaVCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PRzKkEyi2AqpP7MVaihAGmvD9qnHHREw93moed/UtZI5kfX0BvXhBf6nAH3+uDFSnF7EE6n0msdpnugekdDSBPgugFTCHMZ9MFTirvOGQwNLlD0/D5jPChqtv+dy40G0OYqnytTwJntawMdRhAMpxMydcy2PnPvox7yC4lQrZZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJKnx04N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJKnx04N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364811F000FF;
	Tue, 13 Oct 2026 20:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791924575;
	bh=n0x76FvMNjwdnTI4hMIC0B3uly+z96rCdJgiGOgndE4=;
	h=From:To:Cc:Subject:Date;
	b=bJKnx04NNmzzcUSwvGH1hTuu981CiOShv+UDcE9LcO6XEUsxR24iUeV3f5us0+Gu5
	 rdaKw9h6gLJ0CNg2sqS2gGzpFIe7w0o8J18r0Inl+8nV2pOh+CnxGEV1JKrNTg1ci8
	 j1OAe2Rcl+scvqn1N1P5ExK240PScFKEtuvuhF/qljGwAelGIF6XAMaNReJo4B+AXg
	 AzcxmknjUN8Mc0xkSPoshw9KsVIafG20Q1l/G3fu2P4DzBMg9+qEfY2KjSG8k4uzsT
	 4oFqvDC9hkUf0MiWt81H95/o0Ecec837gwaPPvdknBVNrwg/jZWz2aceYMaocTeK9S
	 bMnDkIsIWv5Mg==
From: Arnd Bergmann <arnd@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs: avoid unnecessary padding in uapi structure
Date: Tue, 13 Oct 2026 22:49:17 +0200
Message-ID: <20261013204931.2287813-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building the uapi headers with -Wpadded shows a warning that
may indicate an incompatibility:

./usr/include/linux/ntfs.h:91:1: error: padding struct size to alignment boundary with 4 bytes [-Werror=padded]

This is relatively harmless here as the 64-bit members force natural
alignment, so this is not a problem for compat ioctls, and I checked
that the padding word is still initialized by means of using kvzalloc()
to allocate it, but it's better to avoid the padding out of
principle.

Change the reserved member to use a 64-bit type so the name field
starts after the structure and all padding is explicit.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/uapi/linux/ntfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/ntfs.h b/include/uapi/linux/ntfs.h
index f5b3d4997a56..89467ba07262 100644
--- a/include/uapi/linux/ntfs.h
+++ b/include/uapi/linux/ntfs.h
@@ -86,7 +86,7 @@ struct ntfs_stream_entry {
 	__aligned_u64 alloc_size;
 	__u32 name_len;
 	__u32 name_offset;
-	__u32 reserved;
+	__aligned_u64 reserved;
 	__u8 name[];
 };
 
-- 
2.53.0

