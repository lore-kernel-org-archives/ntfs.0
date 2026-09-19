Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E6A2E0B5C
	for <ntfs@lists.linux.dev>; Sat, 19 Sep 2026 20:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850407; cv=none; b=sDNuRWjjRQKBugh1lgPvWAmRzxKGyG+0YJO59RaoGYrxiygHt8UC5zeF1yfOjIi49CSw49XLK/qqRWUpAbu6MxyGj/s0Ms1zqBH+vYBiSZ8Atg9mEpfOLcQ15upYtO/dWgIWY6zVaza4M9QhGwIhyTtKc6bysh4hsNqv5fVUCWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850407; c=relaxed/simple;
	bh=5HG82rkN+wckf+mYn/agApvsGvFae59ZRR0s3fnyIUk=;
	h=To:cc:From:Subject:Date:Message-ID; b=mmmyWeqbDFlArcisbmWtM1FnQjF42fh883H06v8FTiV2exB3+d3OYOI2w64o98AF7pdSfB/irXGHUb34PdY3XpBOE12XU72Ip3p4ZVFeAt8IzA1kphGqyWAt3LjD6o2sKIHr9xkxFiSXn5ENNBCeauLLGm1eqtfQ5E/Y7uH29k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=OrJ+GXx0; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="OrJ+GXx0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:Subject:Reply-To:
	From:cc:To:Sender:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J2+kNhEhOXXIhzNTUtnuS2Xd+teQ63Om5mRhuW3CZGc=; t=1789850405; x=1790714405; 
	b=OrJ+GXx0A0p95nTSEmx5PeyMj8CerICUBKCoAu3EA0F8MjOMOW283Z3M4UHWbUG69akOuqqKcZu
	vmRhxd0ThYEiObQxYxy5QLhA47XeA0ROkSDVdFJCj6QMpsRwdjuutewApicYtFx9VpvCgKVL6eYbD
	Iu2XOirEHUoOy4W7WCaAZI81eP6AkB3Jkirv5FY6PEi7DBKHMVzIW1CI6272rAiw5iiJsj/QY66rw
	WY7MKVt92LJc6fCGZjADG+gmbK0cPJZmfz6Y+lPWgbU7ezJjMhHPSTvjcJXHOhQRsQ1joKBSydlaY
	qZ+pqvvZ+9rwz4BsSMbFHyNRlMzfAVTw2NUw==;
Received: from [24.147.175.133] (helo=crash.local)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1x81Zz-000rp7-Ve;
	Sat, 19 Sep 2026 16:22:36 -0400
Received: from localhost (localhost [127.0.0.1])
	by crash.local (Postfix) with ESMTP id 365203D41274;
	Sat, 19 Sep 2026 16:22:35 -0400 (EDT)
To: Namjae Jeon <linkinjeon@kernel.org>,
    Hyunchul Lee <hyc.lee@gmail.com>
cc: ntfs@lists.linux.dev
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: integer wrap in ntfs load_attribute_list_mount() can cause buffer overflow
Date: Sat, 19 Sep 2026 16:22:35 -0400
Message-ID: <37528.1789849355@localhost>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>

In this code in fs/ntfs/inode.c load_attribute_list_mount():

                rl_byte_off = ntfs_cluster_to_bytes(vol, lcn);
                rl_byte_len = ntfs_cluster_to_bytes(vol, rl->length);

                if (al + rl_byte_len > al_end)
                        rl_byte_len = al_end - al;

                err = ntfs_bdev_read(sb->s_bdev, al, rl_byte_off,
                                   round_up(rl_byte_len, SECTOR_SIZE));

rl->length is read from the NTFS disk image. If it is large enough,
then "al + ll_byte_len" will wrap around to a small value, and the
"if" statement won't prevent ntfs_bdev_read() from reading more data
than there is space in al.

Robert Morris
rtm@mit.edu
