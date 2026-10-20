Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485887;
	b=pMNaU3dzDEkYqFrYZx/o5h2Z0n2iVzDRcykIKSrRVHln8jDTpNRCr12X95boH4rsoK5f
	 N4n6zMhEKHXMtgivSVtsSUV1dtIo2XQnk/Wkpll040zyU+Xsn0GmoCIs0mLqWKgSQyI4H
	 LD6Lnz35z2tM18sHiM79kcxKj79RhBhpCYr74WHbnFe3f3rJ/4n3D0PQUdzfZorYt92ga
	 Mn/XfWhHrYl4Ew+b1hEBMt2IDCJNgUQ9iIVuy47N/jtbCasA0FTQxiweL8V1ZChA7RKlv
	 0cBTkyaRFSrZ2OYz80hooUsu+x1uFBUegIMw7aA5WOOmp2AdtIsk3ThMropU2oWlVVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485887;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=gw3i+wYguZPCy9Tsb2ibX1AYFlBG7kQvzpqyQvh0sCU=;
	b=sArZP0cGpnnqcu8t9MkXsz69QTIg0XDb+VuMtfmP+qKnO5M8VT3kPxP3vl2mNBxBmiZ2
	 PjXtFDMjvc6XwSHB3nQzit2uC9tPLHwW/M1Gd/37u2k0c8Cwg0QkPyKwAMGeJ7uLhHHQ9
	 YizglzsPYaHGFY4iNicSFVH01ysn2Brqic843Kiq1xD1M0k3bvi9iMnRaxBt1ipnMe/iA
	 QfCjG7thUG95wlOR66E/oz4rsEpMJa/bSzPKVDLj4VcFdAwuVvfDPUj7B29qczWb1ZEl9
	 osLKCZ3ImWh2Me1uAdg3C5iNeaTlI93yktp/TRHZqHqHDWkLp0hGAwzP3IR2hQI9+Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iifMzH2P;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619A9606A31E
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 08:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iifMzH2P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gw
	3i+wYguZPCy9Tsb2ibX1AYFlBG7kQvzpqyQvh0sCU=; b=iifMzH2PYCSlMplLg/
	A/wg+snz2/0z4FWFlzF3S+txh2i8Zha6KuYv9TQAmIssXvpYi4/WaOdsMqU6uneZ
	ardQLUlKf9ewzWzwHcZfA/TPAzNr+cbLkksJapqxQvJBX/hPvFA+zIgoDh8duXnx
	hx/zFKLWEX29dDpiS47CZEwHY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3XyPnKddq1latBA--.56704S3;
	Tue, 20 Oct 2026 16:44:26 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 01/31] ntfs: propagate mapping-pairs update errors from inode writeback
Date: Tue, 20 Oct 2026 16:43:51 +0800
Message-ID: <20261020084421.2196486-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3XyPnKddq1latBA--.56704S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3Aw4ruF48GFW3uF15Arb_yoWktrb_Ka
	4xXa1kKw15XwnYganrurn5Ars0vayvgr1UAr48tF1DJryUAws8ArZFyF43Xa1xWFWjqF95
	Ar1rKF13Jr4S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8ZqXPUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QsV32rXKetJkwAA3N

From: Xuewen Wang <wangxuewen@kylinos.cn>

__ntfs_write_inode() overwrites a failed mapping-pairs update with the
result of syncing standard information. fsync() can then report success
while the mapping pairs remain dirty.

Check the update result after releasing the runlist lock and take the
existing error path. Preserve the errno and retry handling for ENOMEM.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Testing:
Fault injection reproduced successful fsync() returns for ENOMEM and
EIO before the fix. Both errors reach userspace afterward; disabling
injection allows fsync() to succeed, with size and data preserved across
remount.

 fs/ntfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 206db4e99ef1..52e22022b4e7 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2940,6 +2940,8 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 		if (!err)
 			NInoClearRunlistDirty(ni);
 		up_write(&ni->runlist.lock);
+		if (err)
+			goto unm_err_out;
 	}
 
 	err = ntfs_inode_sync_standard_information(vi, m);
-- 
2.51.0

