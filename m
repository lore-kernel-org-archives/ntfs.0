Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B93B3E3163
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334401; cv=none; b=KpUZB0oO5xSThOPxOtOns4vchYN7Rgw4KwdnpIciMlCNte2wCA7Tu13xv7l8t9+z9FuWjaGisad/cJr9O3yc7YEqaONDItF+A1xsJZjy8xs8HBj9P+G++o9ZsTphWsa5YM4Hrp/6MLNu+AEbEoH/mBJnFjYf38uBiKezUelbxXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334401; c=relaxed/simple;
	bh=35iHWuYnUQtX9tgekVfOEZb8DN/7rFnryAt1ds2xyg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUOFzJx4RauNpwOzUV0tr8HXRYTYJL/HTDinF0wCKORO/4CzVx6hUslVUpPam4NOLdGOFHiQ0rQ6PqPKj+hsgBs9KhnT9AUep4y/qE0RO9Ru7/FwE8P3vzXCLRTCnFFRgoYBUIJJjBX/xVcXEgJBQN58sSW2GL7Gt+c//S+2KxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gIT0ZWA2; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gIT0ZWA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0J
	vgwKU2flOxnrtag/hZ68OursqVJhjrt3AmThC7Eq0=; b=gIT0ZWA2UNdkM5a8SX
	ikOWYI6G20HmS2CUczPqYLKxPQyG+/R2JtoNOG/m70taZwCKoPj6cUyrX9h0LcwW
	nnnpZZzRSq2L1ZkCK+c8zStlpWWwrmHkFwPRLQ+Ld/ppNA4ms2id4vSxbGBNo+er
	Vci7KA5Hsd1dr4EMoq1lwzCng=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3x_0k0ZdqF_ZSAA--.18706S3;
	Wed, 02 Sep 2026 15:32:56 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH 1/5] ntfs: return -EINVAL from ntfs_collate_ntofs_ulongs() on bad length
Date: Wed,  2 Sep 2026 15:32:45 +0800
Message-ID: <20260902073249.3035977-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260902073249.3035977-1-liubaolin12138@163.com>
References: <20260902073249.3035977-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3x_0k0ZdqF_ZSAA--.18706S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7GFyfKry8tw1fXFWrGw15urg_yoW8JrW7pF
	9rCFn7Ga1kJr12yrs2yr43GayavwnrGr47t390gw1xX3sYqF1rJr1FqF1Ivr4IqaykZw1F
	qr10q3y3ZrykZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMpBfUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Qj+yWqX0Si1FQAA3y

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_collate_ntofs_ulongs() returns -1 when the key lengths differ or are
not a multiple of 4. But -1 is also what cmp_int() returns for "collates
before", so the error is indistinguishable from an ordinary result.

ntfs_ie_lookup() acts on that difference: it maps -EINVAL to -ERANGE, but
treats -1 as a tree-descent hint and breaks out of the loop. A malformed
entry in $Reparse/$R or $ObjId/$O is therefore silently taken as a lookup
miss.

Return -EINVAL, as the sibling ntfs_collate_ntofs_ulong() already does.
Well-formed keys are unaffected; both indexes use key sizes that are
multiples of 4.

Fixes: 5218cd102aec ("ntfs: update misc operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/collate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/collate.c b/fs/ntfs/collate.c
index 77e34038902d..744fdfd7bf58 100644
--- a/fs/ntfs/collate.c
+++ b/fs/ntfs/collate.c
@@ -73,7 +73,7 @@ static int ntfs_collate_ntofs_ulongs(struct ntfs_volume *vol,
 
 	if (data1_len != data2_len || data1_len & 3) {
 		ntfs_error(vol->sb, "data1_len or data2_len not valid\n");
-		return -1;
+		return -EINVAL;
 	}
 
 	len = data1_len;
-- 
2.51.0

