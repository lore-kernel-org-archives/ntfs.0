Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C5713B293
	for <ntfs@lists.linux.dev>; Wed,  2 Sep 2026 03:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319251; cv=none; b=tte0nWJepF3QqquB9ljwBzTw3xi19MMCeMSrTTbCBrs9gw0xQu7uE4NmEN1kWmhw/sOXmxUsneQeHPzhiUMMsfZgUPMGxypH8V6ok/ihuTMq0cPi1Fb100NYIuw4bDDsVoPHv1bNvNlioTd4rnm8Xs0cvdGgnN35WFfYMRNJYYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319251; c=relaxed/simple;
	bh=8jM3Bnlq+ZwJkZJE7XrGSEXsI/6OTQMH6QvyUVuXDhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PEwBWap/78r8SufWOA19IMvff0pZXHG7lq5gOptVNIVA86Mb92zRTqA2kSGxD8Ta4IsQYmAgxT5thfp9uI00hBDEdrIAD4mLh49zE7R+ZeOW8jEfaRYQS8e/C5GKywDNWPwO8WsQdtx9jUMBA3HTIRspzfzJY3yiVla1xKlyRJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZHEDFN3Z; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZHEDFN3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=b7
	Mvq2k8jDZP3d/dYIjerGnXM6zK00UAj6IA1ui2GZo=; b=ZHEDFN3ZWIt9V1octL
	7fpekTlJTS0TF4wZIBgB9Bpe3VpDpZKKerGs9m2QasEEGFLi+qvPfoxTk/0rKaMQ
	gY3H+A0ycLjaTGD6EKfvHf4LjFRp66TlyrUT8rI5GwRPvApr5g38A8xuQdjE3tsT
	60tYCAbMovEJpET+StZEEqq2w=
Received: from ubuntu.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wB3Jy3ylZdqApQfAA--.3300S2;
	Wed, 02 Sep 2026 11:20:22 +0800 (CST)
From: huhai <15815827059@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	huhai <huhai@kylinos.cn>
Subject: [PATCH] fs/ntfs: fix -Wmaybe-uninitialized warning in ntfs_ioctl_fitrim
Date: Wed,  2 Sep 2026 11:20:06 +0800
Message-Id: <20260902032006.173174-1-15815827059@163.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3Jy3ylZdqApQfAA--.3300S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw15Zw1kAF4fJw13Jr43Jrb_yoW8Kw17pa
	sxuwn3KrWUWrWjg34qyw43Zry0qwnrW3y0vr95Ww17XFWfKrykGFn0gw4Fkrn2yFWDKa4x
	KFy7W3y5Gw1DZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UEg4hUUUUU=
X-CM-SenderInfo: rprvmiivyslimvzbiqqrwthudrp/xtbC8BYjqGqXlfaxEwAA3R

From: huhai <huhai@kylinos.cn>

With CONFIG_KASAN, CONFIG_WERROR and -Wmaybe-uninitialized enabled,
GCC 16.2 reports that range may be used uninitialized in
ntfs_ioctl_fitrim():

  CC [M]  fs/ntfs/file.o
In file included from ./include/asm-generic/rwonce.h:26,
                 from ./arch/arm64/include/asm/rwonce.h:81,
                 from ./include/linux/compiler.h:369,
                 from ./arch/arm64/include/asm/current.h:5,
                 from ./include/linux/sched.h:12,
                 from ./include/linux/writeback.h:8,
                 from fs/ntfs/file.c:9:
In function 'instrument_copy_from_user_before',
    inlined from '_inline_copy_from_user' at ./include/linux/uaccess.h:184:2,
    inlined from 'copy_from_user' at ./include/linux/uaccess.h:222:9,
    inlined from 'ntfs_ioctl_fitrim' at fs/ntfs/file.c:845:6,
    inlined from 'ntfs_ioctl' at fs/ntfs/file.c:876:10:
./include/linux/kasan-checks.h:38:27: error: 'range' may be used uninitialized [-Werror=maybe-uninitialized]
   38 | #define kasan_check_write __kasan_check_write
./include/linux/instrumented.h:146:9: note: in expansion of macro 'kasan_check_write'
  146 |         kasan_check_write(to, n);
      |         ^~~~~~~~~~~~~~~~~
./include/linux/kasan-checks.h: In function 'ntfs_ioctl':
./include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
   20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
      |      ^~~~~~~~~~~~~~~~~~~
fs/ntfs/file.c:833:29: note: 'range' declared here
  833 |         struct fstrim_range range;
      |                             ^~~~~

copy_from_user() initializes the entire structure on success, but GCC fails
to recognize this after the KASAN checks are inlined. Zero-initialize range
to avoid the false positive.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: huhai <huhai@kylinos.cn>
---
 fs/ntfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 88747217ba61..9bc979af4031 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -830,7 +830,7 @@ static int ntfs_ioctl_set_volume_label(struct file *filp, unsigned long arg)
 static int ntfs_ioctl_fitrim(struct ntfs_volume *vol, unsigned long arg)
 {
 	struct fstrim_range __user *user_range;
-	struct fstrim_range range;
+	struct fstrim_range range = {};
 	struct block_device *dev;
 	int err;
 
-- 
2.40.1

