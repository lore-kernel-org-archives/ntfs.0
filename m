Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BB5408017
	for <ntfs@lists.linux.dev>; Wed, 23 Sep 2026 05:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142534; cv=none; b=INo7xEfu6XA5TA0puIredj1g4hlb22BzDhVftprmM0XMqGncCDawBZeM/WbFKj7jF1lHAK0oZ1LBOrZD74MkDDururRQnGFbdRxlV1YXTrQU67I7+dBokmqdtAIcs2QSHu4Bx0w1uQJH9Yri8Pg9Aht7p6sqxh2+SibMX2sKVUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142534; c=relaxed/simple;
	bh=stPI2sSMuW1XWVB4emrlUtL7Ent/c7djxbJ28FHgoPY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=DgNsHK0PUlTf9A9QNjXRK3hv4/s7Id7irXVrrqVJEr14VLDPG79X7vB4ddTUtlcNj1jLfthCtmYYTRIrKiYIpqwCO96jcKOcnFUTv8mnibe4ycs848Cl9w0MYRwzorDSwr6+YTKRaJpQm6l0NBb1mCvRpMr/X3cxCbg/89n+EVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ciH99XeL; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ciH99XeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1790142520; bh=XBePMc9Y+Ra4CDhPt6rodyIvXkrxM9m8RLsh5c4iGy0=;
	h=From:To:Cc:Subject:Date;
	b=ciH99XeLXQ5srMOJPXzkiAABvdQSBPXmqIcKBusZdzI3b3ADJ4q2ePHEhXtqLV14E
	 rOYb8938oJ5Nn79JpcZ72BqcbZ5+jSVkz0TAVXkRmZBALn7plIU3A08/GoJq2rgZGO
	 PfaEjXIYMhNkmaWOV0+H0+7d5WYowaayzIao0PjE=
Received: from gets.localdomain ([39.144.210.82])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id A46128A4; Wed, 23 Sep 2026 13:41:06 +0800
X-QQ-mid: xmsmtpt1790142066tsihq4504
Message-ID: <tencent_5D0FB865BC14FCE7080CBF2AA1E23ECA2005@qq.com>
X-QQ-XMAILINFO: NmRjDopJZVxOhQtYWy6LH4P1s80Rk7zr7Zz1gvVxG1A9Xr7SkAVespCY4AppDU
	 d2RoALPToMSBgS3S+bTjaVmgxS86E+5Sb9MSpZdpyJoQa3YLGjateweuifiOW1pEkXYPlrxo75pq
	 pIFUrDe4wxA/QH3oBQ9EJnemEnOuRA6iJVDXiOQLh1dPglI+IcUBGUtqbHZYkzVw8VW+TOeyraiw
	 z3SAIEbi3PM0WmBj8jONVJSzK6HWzdaq8/3ZL2KAdZK6CWsKQ0ZmOYFsHdVVzwi3M5s3gQSFs256
	 OAJEUnXQPJVHbejR3t9WuY3gaUvpW8tvd2gKgQxYu2DDPoH1fvbM+KOCJC1GPPUmlyUtiewyAyUz
	 LR3NYO0tGZhwJTuo1WBqhlsEJKVUoTaiVqbFt0Y5UrmnTz36M5LKaaQHjd0T0y4nHyMVIOJvCK5T
	 CL29xWwhTjpDdQcByxq/L2fW7WhkMgj+wQqc7Hf/oBYYstycgyoFqiGXGgz363RYq4mpdG7oKidr
	 zpuEUWjerr8e4aJPYl0NIW2EXD55DfjMWBzY9Lik0ofzgCnwmsF3/SYHhq5tgYiXC9Grl9oTulax
	 R6nTKVE6AfKlY3LigIpzP95uwtn7G5UZBE4OWbf1o4sZ+fIHVS466VupImS/bhRztSvPFzhTVZ0v
	 ITMDRkCXAAJqqdltLO+hK2vnlirIR63urXyFekqEcMjT4pKHbNLtqDsk1YbnFaDJy14gGPJGNeS4
	 Y+bagxGjoAswqjhydU8nzJBTljCr0oYNP/KCOv7ChGUMl9WVg7tC2jwLqqF39HZC6u6PvUua+yMp
	 pJY5ZdL6VJxZ/dmKydTi/4LboA+AI1/bzYBnZ7m7YJVF/EPsXCpenuqUyHR0wsw7u7TaEroDM7TS
	 YsHqz0AfDm9TPjl89ozl8G076nddWnuf02Jz4Ia1biUTXl3IBmpDkTUcLxbZfV5I+EPxXTT3ZSR3
	 ZB90fUCMF8GHrf4kO4e1amO7EGSv+WkX2Ot0esD4vAbRHO3jTUsCMgPrvHaV5Z
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: pwngets <2605452642@qq.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	pwngets <2605452642@qq.com>
Subject: [PATCH] ntfs: fix runlist marker allocation and count
Date: Wed, 23 Sep 2026 13:41:06 +0800
X-OQ-MSGID: <20260923054106.163277-1-2605452642@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The marker path can append an unmapped element and an ENOENT
terminator after the merge helpers have already computed the resulting
runlist count. In that case, allocating ds + 2 elements leaves no room
for the terminator at ds + 2. The path also increments new_rl_count even
though the merge helper already accounted for the final runlist size,
causing a later merge to start past the terminator.

Allocate space through ds + 2, and derive new_rl_count from the final
terminator index instead of incrementing the count a second time.

A crafted NTFS image can reach this path through a normal read after the
image has been mounted and trigger out-of-bounds kernel heap accesses.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")

Assisted-by: OpenAI Codex:GPT-5
Signed-off-by: pwngets <2605452642@qq.com>
---
 fs/ntfs/runlist.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/runlist.c b/fs/ntfs/runlist.c
index 3a61f19bcbeef..f13d28c15887d 100644
--- a/fs/ntfs/runlist.c
+++ b/fs/ntfs/runlist.c
@@ -680,9 +680,8 @@ struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
 				/* Add an unmapped runlist element. */
 				if (!slots) {
 					drl = ntfs_rl_realloc_nofail(drl, ds,
-							ds + 2);
+							ds + 3);
 					slots = 2;
-					*new_rl_count += 2;
 				}
 				ds++;
 				/* Need to set vcn if it isn't set already. */
@@ -698,11 +697,11 @@ struct runlist_element *ntfs_runlists_merge(struct runlist *d_runlist,
 			ds++;
 			if (!slots) {
 				drl = ntfs_rl_realloc_nofail(drl, ds, ds + 1);
-				*new_rl_count += 1;
 			}
 			drl[ds].vcn = marker_vcn;
 			drl[ds].lcn = LCN_ENOENT;
 			drl[ds].length = (s64)0;
+			*new_rl_count = ds + 1;
 		}
 	}
 	}
-- 
2.34.1

