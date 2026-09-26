Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DFF2D7398
	for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382813; cv=pass; b=UGCCSbcUoLAXipY66DgWtI85aXw/hQ3EUKbpYFbndN92SRQMKygaO+sok0tHnZAlrPHevWIdk0JHKGUuA1l8Sf02FuufcuqJsUOnQ9wF1Blew/kCv8tu52RyTiDO5REv0bPmW6uAQJNwGzrtDVSz8sfdOv/zGVXElGEifbuw9ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382813; c=relaxed/simple;
	bh=KtCpqKwDC0aQ3Jb2ji3D6vLbjLUjIcplOD8xjiZZMrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYsj/5T+f4qJH7QjwZpVIFxhdZMOjEaidNaDaASN9Limz5lRBKu5TuJxCwA+kqeqP0mubFd2f2vmVu9s6l5cM7wrMQOUOL0AVl1jKyjZ6Yq6JbIYrKTIIKf8at3RG7a8c3lxE88/NopjSjy/Ye2V8XoImM4jky4xGbFgJMNLONc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEUQnBJo; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEUQnBJo"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b8eddcef9eso541824e87.1
        for <ntfs@lists.linux.dev>; Fri, 25 Sep 2026 17:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790382810; cv=none;
        d=google.com; s=arc-20260327;
        b=apfXzYZ7P2swommjGuQmwlDeZUUyTsohHbaLtwgokLTmAYIfR+nkr6yvcSbe3YArMT
         5FT7JzCaz9USuDx+b9k9VhfxrDe4K7FmJNHbyjNgynwjxSSYnvBg8d+Lp+0LFUfUUliq
         fCo3l05MTRL/QcAVJq9EX+VuVleIawIejvnuToG4V8lhW9e8/Hnhml0TG9G3zNpq+4vC
         b8m6OQqTrdjGBKjAJ4iPqucKlC6Y4wPbCEF0S+VB4Xj6jVw8+0VqqFZ2WS97FeXgHWBn
         bfdD9l1fuZp6weAwf3S1trHihY2/baw8+I1ahH4DfuAiqM4pKXH8PGk6rbmz4AxHn+c8
         kRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O17YbHvrX0PAAQbh5o1w0redMP420Im1AjYq+vdSjRs=;
        fh=KhRiP8NLHtpEr0AChNPKA30lqNBN23C5FgJAUBOrGGE=;
        b=oyBRmv0278k6kLc9Q4/rToH2bCLcMBRADCyDSZ28fTd9Xnku5hQxj7wONVt4FBEV18
         UHMpG6zL84jkoil74aVeRGTJc1ypoFqF9RGfUpAhJ6UmTZaI5O/M5mky+iLAbl56y8Bl
         hVBzz8daBNHs2Q3uqIHu9yxVaAz5nkuZ/mS+hupfDIxvhSMm5X8SfmwFJaCPJOKKUp3h
         Lpvo3zwvs+ENbrq0C8ChRIcOKTPSn+POfU8Ab0YZ53iziD6rjZpE+wGYi0mwNwRdIwH7
         sZRhFYfL+aLoLvaDtG+D/bl4s+YV56g/wd7dUzvAtFINck0cciU7bhxAgkSEnTU+kyA8
         Gc+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790382810; x=1790987610; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O17YbHvrX0PAAQbh5o1w0redMP420Im1AjYq+vdSjRs=;
        b=KEUQnBJoB8BUlJ5BfK77FbYAPJOsgZq4ayEnq8GcwCiVw/y3z1bsoktsqk/M/eYxLW
         ULU7an/w4thHkPn4vOXZwDOk3CuMhnhmYeCIvJdP6UOs4TxWNEldGzbGN8Gj6IxV5bkt
         lR/KZ2YLi1rvNqiwlIvDlmTSQUBBZlOQV5ikDM6PFAkRV7D3i+JpIOjjudfKaaIoRCLD
         IhBSeg2kFr/E6Nfv/ElsTlv4DZViTC6H2OhCBUEm4fcqbg3a3HXAUolAezY7/FuWhwWO
         2IGxAiMxLgcfCV3M3hVBHM/nx9NwkA19/feAMlJJg0nQpx/RCfaGJ01FR/SCd2T31dLR
         UpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790382810; x=1790987610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O17YbHvrX0PAAQbh5o1w0redMP420Im1AjYq+vdSjRs=;
        b=GFD2ZpMBnDI4BJJh7DpeGrW3XlZGoDxtQGb6J6gHuw/3blDeSJeRPbqP3uEZ29WUeb
         hM89KSVL6BHbHGv6xIGigU3etNOqdahaA9xPLRAujI+oyeLXIEdQhyW5DARByPNkPfDU
         pRdQBaL2MJfiBn2OPEnycYDkdx0VYVHLctqBStFeOeFsgldEKS01DFjT7TbuSC8pcdlE
         utjLiFPJhqvNNUa8B+ojZl3saIaNXCmH7xgbqMldwuigg9hV2s3nK0UQU26nm1bFz++p
         1u10P2MEeRbsgGsaNPe525ULQbR6bJv3++IDsI4YRZJRi5qGLO3v2jg5RAhpd+Hq3/5+
         Uzrg==
X-Forwarded-Encrypted: i=1; AKwUvByxRfBdzwK6mgqHindNDIVeUVFuQlcVMWRzmyPxA6P5tlMj+lBtW37ppKOMisxMC/0bL1yD@lists.linux.dev
X-Gm-Message-State: AFuF++nVllc/kgDiNvRf+Ob0cHs4uepMU5c1jRo952HYxVZLyug0Rhqx
	FWUEGgHKMCKCsS0xoI6G02moYgJRv1X1wSZsu2/TH3OEnAzY5zAs+D3e5ICXNsqDID3UfIf+r7E
	STeO08li6uyzEaqA+9o+Ff9fIvajRvnY=
X-Gm-Gg: AYBFou29R/diQgWBtgWsrJATRApLNsDfs9aHmMW4EzYVtsgShfU6uqEg7uSJJSpisO0
	LFJ4LMCVn91iy7RJKYhMn9llYkT0Q+V4/xNzk8KsExZyBbzRsPZOApStKR27KZbERysnqZEi9m4
	SSEHgfXePVGll0Ic0Q1Xq6eUz1qtw7jKpk2jG6nzuKAMMAm1OR/YLz1G104cVYIj7n41nW3mwY9
	f9s2RWUhQtPxIaE3hjt8hEWzwY+a2w0jEmDDEnVFGjNecVNzOJ2+zS66gvBm8SBxXT4mZzuRrJN
	mjqpzVNhyc+8/IGiUvxaiMC8e2Skn0d55u44oCjuc3M9x+XbbwjZDd2tRQ==
X-Received: by 2002:a05:6512:318c:b0:5b8:d50d:9f21 with SMTP id
 2adb3069b0e04-5b8df20e794mr2225898e87.37.1790382809696; Fri, 25 Sep 2026
 17:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924090102.2865942-1-liubaolin12138@163.com>
In-Reply-To: <20260924090102.2865942-1-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sat, 26 Sep 2026 09:33:15 +0900
X-Gm-Features: AclHuK_qmxs54f3QKzPDOufhh3oPGrGix3RysP4LVi2HSwQAI62dqjvM8f8mKnk
Message-ID: <CANFS6bZu50diLF6Rk2BNLgpCWry3yW3n+JAjiqBXTijviRJ8JQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] ntfs: report filesystem errors through fsnotify
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baolin,

2026=EB=85=84 9=EC=9B=94 24=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:02, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Report NTFS metadata and shutdown errors through the generic filesystem
> error notification infrastructure. Use file-level events for errors

There appear to be several error paths that identify corruption
but don't call any report_*_error(). For example:

* ntfs_lookup_inode_by_example(), ntfs_ib_read(),
  ntfs_read_iomap_begin_non_resident(), and etc.

> associated with an affected inode, and volume-level events for volume
> metadata and shutdown errors. Preserve the volume error flags and report
> failed recovery independently of the error that triggered it.
>
> Report errors where they are detected and leave queued event merging to
> fanotify. No error_reported state is carried through search contexts,
> mapping-pairs updates or MFT mappings, so releasing a context cannot lose
> that state or suppress a later rollback or restore failure.
>
> Changes since v2:
> - Follow Hyunchul Lee's suggestion to remove error_reported tracking and
>   the reporting-aware mapping APIs throughout the series.
> - Report independent cluster, mapping-pairs, ATTRIBUTE_LIST and MFT
>   bitmap recovery failures while preserving the original operation errno.
> - Base the series on ntfs-next at 401898d748fc ("ntfs: validate
>   attribute-list sizes before allocation"). Retain its MFT parent BIO
>   and folio writeback implementation. Report synchronous and asynchronous
>   device errors in the existing completion callback; fserror itself
>   defers notification work and holds the inode reference. No additional
>   NTFS completion workqueue or pending-I/O counter is introduced.
> - Cover stale extent references, failed extent-record cleanup, mirror
>   failures and MFT preparation errors. Resolve attribute-inode reports
>   to their base inode and keep cluster-free counts in 64-bit variables.
> - Split MFT reporting into two patches: metadata validation, allocation
>   and recovery in patch 4; write preparation, mirror and BIO completion
>   errors in patch 5. This keeps the two review topics separate.
>   Shutdown reporting is now patch 6.
>
> Testing on this base:
> - QEMU passed mount/read/write/fsync/truncate/xattr/rename/unlink, MFT
>   growth and unmount without FAN_FS_ERROR events during normal operation.
> - Verified EIO with a valid FID for file MFT corruption, EUCLEAN without
>   a valid FID for an MFT bitmap mismatch, and ESHUTDOWN for forced
>   shutdown.
> - Fault injection of an initial mapping-pairs error followed by an
>   independent restore failure produced a merged FAN_FS_ERROR event with
>   error_count=3D2. Synchronous and asynchronous MFT completion failures
>   also generated notifications. The injection code is test-only and is
>   excluded from the series.
>
> Baolin Liu (6):
>   ntfs: report allocation metadata errors to fsnotify
>   ntfs: report attribute errors to fsnotify
>   ntfs: report inode metadata errors to fsnotify
>   ntfs: report MFT metadata and recovery errors to fsnotify
>   ntfs: report MFT writeback errors to fsnotify
>   ntfs: report shutdown errors to fsnotify
>
>  fs/ntfs/attrib.c   |  84 ++++++++++++++------
>  fs/ntfs/attrlist.c |  17 ++--
>  fs/ntfs/bitmap.c   |   2 +-
>  fs/ntfs/inode.c    |  12 ++-
>  fs/ntfs/lcnalloc.c |   4 +-
>  fs/ntfs/logfile.c  |   2 +-
>  fs/ntfs/mft.c      | 192 ++++++++++++++++++++++++++++-----------------
>  fs/ntfs/super.c    |  32 +++++++-
>  fs/ntfs/volume.h   |   4 +
>  9 files changed, 235 insertions(+), 114 deletions(-)
>
> --
> 2.51.0
>


--
Thanks,
Hyunchul
