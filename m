Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969167;
	b=dXRyjyxNOxw86NYbelwLI4i5wZ8pv8p/2KQABK1D9/5VeC3HOF9k4HvxXfVczfSjbe0E
	 gIu6NJdsx+/1pCOpytEaA1bJgjQobOqfw9AeieBE9BNi5ddtGhKTn+zagOZQ+KFMGapnC
	 Zj4g5RrKeND52OltnH76S1cs+7p5xTQ2ncMogRG/DCuqrUyOoOA9BtVMp4h8ZoJ6JfW2i
	 dhCVwRzhnw5nfThX3YQYaCLeZx3nnP549RLVkeY3GreuIBoYo2uRp0gE118oKR7STkOdk
	 SEGGVMUD4kwID3/CRU+T1CW8jsEWwxZzXG0HBqsgM95p4HYwITah9+JKi8VPyolKWtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
	b=k9zSSy9csQ0ObO5zuykCEl3+bFq6t7Pkh7AfFLsFeRAYb/o382h/JBrjl26u2HxKFKsV
	 wZX3+cN7ihQkVFQ5+/zsKd+jNhuTnqMazRCkJgSLfn9fIyGp44VO/7y82iP5d2I5UsNgO
	 bfuoMU5KiZ6kUWbToTx8+KLOlOwabdIhTAAGKAtRu1eqedoi60Fk/FNRPckyr+Ag5WQ3R
	 A7TSpspj5klB54IgMrPleu2lZ0WCtMtQJ5to4iWnOxyvSTjPyCo2zw6uO6ERK9ERU74Wm
	 AAaN1xuHYR+HjNnKEqMoi56i5et4WTvVYajoMXryoB+rNNmgNHsRS/gXjmlDBtdgqVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gsIOj6Dt;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B27606A337
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 12:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B27606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gsIOj6Dt
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37071c0f42aso173861eec.0
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 04:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969167; x=1794573967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
        b=gsIOj6DtM8X/Da+mXoVUTKzoJI/l2k8KlJvf13WqTGO0pxtJnQ/mTzIfe6y0EEjaQE
         b1tMpr+kNYXhGNWKUXFwUzia6WwOhgx6p3kW6iL/3Mpfg3DxuedJF6gdWu9Y2jGZCsfn
         LcSFLMP/ksvb3lNxtaMOAQZYQ3UFT3wCvj4OMq2FnbhBJWSXwu+sSYxG/oY2I1ezqdTc
         bOnZnYJJfbhjcJsiOy/RCyxKhYGDY0GIQivyjR4xfnq40zAmjDQU5W1fvHmOFWp6rUMh
         MX4mYL5pDzjLY4YLfIlB/22k3zriY+BlJFyXM+Hm7jxYKJB+Dl78juCqFtSEsoC/G/Bq
         1BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969167; x=1794573967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
        b=dUvUIh56WsdJB7zU2+mZ/8pBetQJplJUTapqym6wPVQTiSwGTxSJSp2XVpOwvbCpcw
         WuvdmKDK0UxhYnIoyIviFHIlY9+Kd+JioLy+yNAwaDooD0reCXqcrXoiOjjem8ZAdX3U
         +jhQP97VNSh6pcsqhJcYrOZgLYw6/UlSaU7BFWK0pAI6acaU8i7b0jsUIKivIkN4/55d
         xtMVDqq6nrMv/7DoRk3dIkzsXgRAJIB+kXpeIkaMGsdOMVbflssngp1ee2ymwzxw3NHC
         fg+jodiGB91qOZW3rcOMSg0CmEpFZAV/tsuy4hUSOOUbRg63+iXjseS3QsE15uoAgqn2
         zDog==
X-Gm-Message-State: APuU4Z++CV+Mtbut9CfuLc3/ArwPLZCE85NQRpQiTKWqLc1WDDoONxHw
	8GnbYbE8yFLLljhNKgdr8iwLSosL0nTdcRDRu2fOSFbqBFK9/1+Rwp+G
X-Gm-Gg: AYBFou3p9y/hsQhUVCyCjOYsIfnygNS9saYKNJNPA/z/6RnLQnLE5GOZ6CG6vQnLTru
	7QbFVBo/vA922wnW7S/hgZRNksSjc9Od9JPAcyjvTbI9+0AScxBbsOSaPcPfAutTdI8I6X+c58i
	SJbqxMTELfBi07Klh//BbO1vWKnyKyHSFSDyKhgmvjmU3VzRxmPr8LM0SGJ6oqLaHPSksSLHg6b
	bLPYUGfoXsWGP0VnUjryZ97o+vHKWcY+kfdIhznvpqbsgANYniC9hiCqz0yjUk1GRg/O2Ns8y+t
	ICtYGSSh4txuAGvMh/grnpVF0d4pSn3zXD9xC8PkaEMOxt0s61pgXigahSlmBkJHN04pcXj18+1
	29gErnvUfpch3NP/hSr/n2/jOo7sm95YshswvWYaIkB89eJPZvkcS/mIwTbgMGan7+4BTP+24sv
	hxBSJhQGcXypVhygqYktyL0he0ApVhy/VHmEsoFEWbCAEeGfaQs1Z6PVZm6lsSb1ez9xiiX91bh
	7CjLLCBNo8XyY77nxkHUFTcgZKE3mzi7x9N+MZhH9DNf6qWjbSSYLEMgL9ezsrCYB5r33m0tRzj
	RRdFJ9zaa6IcObiFHZf6Ycg91byH/BHkATxrLYSRK+IMRQYK/xKKUxawsARQ+k3NLA==
X-Received: by 2002:a05:7301:9a81:b0:369:38e3:5363 with SMTP id 5a478bee46e88-36f7494cfb5mr3376030eec.7.1793969166328;
        Fri, 06 Nov 2026 04:46:06 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm6802331eec.1.2026.11.06.04.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:46:05 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] ntfs: do not read an index block outside $INDEX_ALLOCATION
Date: Fri,  6 Nov 2026 18:15:51 +0530
Message-ID: <20261106124553.2617026-2-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106124553.2617026-1-wahidzk0091@gmail.com>
References: <20261106124553.2617026-1-wahidzk0091@gmail.com>
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

