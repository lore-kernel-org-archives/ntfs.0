Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424569;
	b=V1JRfJXAVkvO034MP63qW0qPBZ1+THOnhguTF3SZ3Hezll2pJo6/ulCnNmBLqXWl7YBQ
	 IFOcqNEhbuJ9bzQJC3DPCny/pCeVRT9Lx9yuGnFC9j6F4s+MNBwBiOZxVsLzFTAOo+OTl
	 2SXxwTbxtL0w85O3xJzJ7VqYzMb/sWzcTWU8Y1DXGakioAwNom/zIzcUMqfSMRc5Pf4uZ
	 VG0sJkwjaXHkm12TjKOpOtETaVtwhOhCSj7gKlqYk5E7eqGHFdcFlNNWHXTh/LX70t+yT
	 HYcl3NdutzFiaD6VOO8yWsrlNk/UMthDc7SGmPk9fxqnBetCKY9ePs71p6Fc3wWz81w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424569;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=ipiwYmBGt3kV8WoGVnfjKgzTk3jGwziE3HCRQl92GmY=;
	b=XRpUM9DIe6s1yEVdzwXmP2tqeXdHHip28/JSM8OjlwxIETR83jpvinIfTzGp0HSmE1Vb
	 iVsKoDViEeEV0BhcsqPxrOAfhf7qavx1HjunixlXbeqBGxJ2/o8UPuvrjc7fFINC7isJ5
	 tfFo4hi/cNRzy/Y06qC50LOYzsuNP2dybvjya0vXGqQOC8CAr7kD2sndCkgc+A1ts6dgw
	 qnj/Oc9kigqWXotuFxs8UkicdPMHxoXZCIHzqQdNcc0Zlx1xDJR3rcJ6xNVTrUYHqebPs
	 aginGPyTPrQqItYbzpJUD6yMg5Tk4VCRIp+bvfymPg677l58ueOYXyUkKEIywKfKPZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nf6rI1cP;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5FE606A31A
	for <ntfs@lists.linux.dev>; Sat, 31 Oct 2026 05:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nf6rI1cP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ip
	iwYmBGt3kV8WoGVnfjKgzTk3jGwziE3HCRQl92GmY=; b=Nf6rI1cPnn2SCPjdtL
	GTnXA2NIX1tvHXXllboy/PpbeydCB6qkGoSY8tfjNbI+h6VIAt8FU/X8E7jqqWIn
	crjy6FoXOwI6K1swOgt9nUpK2XThcSMbUbSn+oZaWZ+fIcpQS7PoonSTX3vSNHWE
	JGl+Ewm93oBww/VDmMAPUekxI=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDX37adfOVqFDprDA--.9490S6;
	Sat, 31 Oct 2026 13:29:07 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v2 4/5] ntfs: write unlinked file attributes before dropping their cache
Date: Sat, 31 Oct 2026 13:28:56 +0800
Message-ID: <20261031052857.1542936-5-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261031052857.1542936-1-liubaolin12138@163.com>
References: <20261031052857.1542936-1-liubaolin12138@163.com>
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
X-CM-TRANSID:QCgvCgDX37adfOVqFDprDA--.9490S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryDtF48Gryrur1fuF1UGFg_yoW8Ww4DpF
	93uFW5Gr4DGFyIka9avF4Yvw1Fva95Jr45Jrn0qF1UAwn5XrnFqFWSy3W8JFs7tFWfZFyj
	qFs09w47CrWUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jco7tUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gNbJmrlfKNqHgAA3w

From: Xuewen Wang <wangxuewen@kylinos.cn>

Attribute inodes copy the base inode's link count when initialized.
Those initialized after the base file is unlinked have zero links and
are evicted at the final iput(). Nonresident attribute writes can leave
dirty pages in that cache, so an immediately following getxattr can fail
to find a successfully written EA.

Use the synchronous nonresident attribute write path when the base inode
has no links. Keep named data streams on their existing I/O path. This
allows anonymous files to prepare nonresident EAs without retaining
attribute inodes that would pin the base inode and prevent its
reclamation.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested the standalone five-patch series in QEMU with a 12000-byte EA on
an unlinked file. Attribute writeback and cleanup completed; published
EA contents also survived cache eviction, remount and reboot.

No functional change from v1.

 fs/ntfs/inode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 62dd5bd5bb81..2b1388de7bb2 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -4052,6 +4052,14 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
 
 	WARN_ON(!NInoAttr(ni));
 
+	/*
+	 * Attribute inodes of an unlinked file have no links either and are
+	 * evicted at the final iput(). Do not leave their data in dirty pages
+	 * that eviction would discard while the base file is still open.
+	 */
+	if (!VFS_I(base_ni)->i_nlink && !ntfs_inode_is_named_stream(ni))
+		sync = true;
+
 	if (ntfs_inode_is_named_stream(ni)) {
 		if (NInoEncrypted(ni))
 			return -EACCES;

