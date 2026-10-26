Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043793;
	b=1QBXoGTCMv+2T43eU04JCX8v3CIujI/AEfXGI8mif8s5+pU1qS+ktqGykYuFSek2//0u
	 urdNcq5Mj4/fNN6oSgDuxGpIql6JZuAzi2EpCW3sUWdCVOIi+i9tNLGyfxcjYnXfHkJeH
	 s76wSSGJhNC8/2gOzgzYY/voAv1bgnGRPnLlCBClS5khkC4YgzyyS4vNq88plWQcrK98j
	 Yn+PltVo0kUsxWnf74BPrvK8LwEZc5SusT9OwT32367jKYmqFQy2ME03BVxGmmV9lAy98
	 2AsjMuesBpqNdxX7fAWqYQv/eosQFzpLNF6aRcJK8fUvOQLc54rsW/zjkI5e0r/NAhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kBMCb7RcCV+8caCyuLc3yIo5s/GTy2aYFC3sl8QUZ0Y=;
	b=MI4vr2zR2OagjRMlXvKHg/bFbKFFjIDXRo0iHnHd1OhOtcGsSoDUmEczCbzpWfy6kLZB
	 dgEEUJBr/uAMNPHB9SzfTGtMkW/zrXUHuzYrPTddHvSOUyp/s7Sr+ZxaK+JjjuHVSnUCz
	 h2WsFs64768e2H/rqvMg6G9afMV0KUAF9wRtGJG3hWvmDwLApQ6Hs/8c/4Staqr6swnpe
	 Waq4zNthw/lMLDb4kDaixdkGkyU4u3PS3rAZOX5DPEb6dTWIVkoCGcHvJ4TbQa/RK38tf
	 oWK70TiR1vphiD8QdG7xtbSH6EHWUhrZQZy7ftBA7m8x3wvSD4YkjUHdfJkp+jmCTDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=NNyeMdLn;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EE9606A31A
	for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 19:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9EE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=NNyeMdLn
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jD3vN0wtBz1XM30g;
	Mon, 26 Oct 2026 19:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793043789; x=1795635790; bh=kBMCb7RcCV+8caCyuLc3yIo5s/GTy2aYFC3
	sl8QUZ0Y=; b=NNyeMdLnprhX4NKEJ28lxYFvdlbPHY8vcUiiJmgmFHKL/oNh6fu
	5/RP7a7dl83Gwhw+HLx8b/9nlcmjs0EakdGe9gd6a+wY0ewY9FgTlPzC6y7t1MIi
	KNKAE+H360EEit7xFWUYwhzlVF1T/3M5OjAasSOpJhAc4Rh/FWAWVj5Jhugdi9Bt
	zXFlKTg8FFlFDc0jm0177/lOQGpWhT83hx8ViAE6iEQH9CJMlzMmjBNeMih/Ttbj
	q0bWAhXlU6evf3P+DoL2cCOgpb06rr9BAoKqEOMKA4vQBib0R4DCVyLJSeiPpuSl
	2PGivRBBltMmM+BswYWBj6pBrxecHgu2DOg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id fWQ-iVHGBq7Q; Mon, 26 Oct 2026 19:43:09 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jD3vK0BVWz1XM4Tl;
	Mon, 26 Oct 2026 19:43:08 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] ntfs: Fix error handling in __ntfs_create()
Date: Mon, 26 Oct 2026 12:43:00 -0700
Message-ID: <7c0b17f73a031ae5564825ab94909f77eb2387d9.1793043780.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In __ntfs_create(), if ntfs_init_acl() fails before
ntfs_mft_record_alloc() is called, jumping to err_out frees MFT record
0 ($MFT), unmaps an unmapped record and unlocks the unheld
&dir_ni->mrec_lock and &ni->mrec_lock mutexes. Call iput(vi) and
return ERR_PTR(err) directly instead, matching the
ntfs_mft_record_alloc() failure path right below it.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fs/ntfs/namei.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 62b01646c262..b46fe44b63b5 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -472,8 +472,10 @@ static struct ntfs_inode *__ntfs_create(const struct=
 mnt_idmap *idmap, struct in
 #ifdef CONFIG_NTFS_FS_POSIX_ACL
 	if (!S_ISLNK(mode) && (sb->s_flags & SB_POSIXACL)) {
 		err =3D ntfs_init_acl(idmap, vi, dir);
-		if (err)
-			goto err_out;
+		if (err) {
+			iput(vi);
+			return ERR_PTR(err);
+		}
 	} else
 #endif
 	{
