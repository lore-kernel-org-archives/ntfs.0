Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183AF356778
	for <ntfs@lists.linux.dev>; Fri, 31 Jul 2026 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506190; cv=none; b=H0cfT4wQKYgAqHNR+3zwMEUltKjSMFfqJ6ihINn2CRjV8zn4SbTRNw1HJgRpgjWHO3oMVFDbiB+xuwoASC70toYOhL1mcWyFYn6yET27aNWNbZKwNlmtWfHWg8R0Zqcx8f87/xiAHwpFxwxGLf7+hRVSkpT4EGTyhahOwLBtPaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506190; c=relaxed/simple;
	bh=HlouSjId4hTq1RwnL9VvjUWA+mJLEAQW2fYFV3Ly/cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJgbVDs6MIDDvyyIJi8epE9+QreOQqZ6RvI6Y0zF+Uh0Mt4QXewtjfWqmLwtDIcMev8W+/rGx6ddEHMSTuETERUJn7fJXf6FrUdwW8MYo7pCFauozJtwsaDnizWIBOK94/RoI9lO405RgbjNIkC+elLiXg67GL3XBwQ2rjAuVTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+k+KrjU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+k+KrjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A441F00A3A
	for <ntfs@lists.linux.dev>; Fri, 31 Jul 2026 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785506188;
	bh=vNU2/CVtX06yMKmxx3sw2HcWOA1bjUjgqyax1T4uNLE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H+k+KrjUKXQymky0jZxT+RpGlfly1rO7vZgD/0SwnmSJKLX1HZj5C6q1y9nFJGG96
	 sKVdBKP1rg2nCoZhmoio9c3HiHjf1HOu5TRDDSW5L9TDyF16GmudaCElchJNWDTNpp
	 SMFMLVUFXiJfUC/V4TIaI0xhYdveWCIASqtkvShQeTxFaqoNTYy0lp/xVm5GpwFr2l
	 BUfwWUlmaHiJu12bJIL61Mujm05x5YoCYIhvIsT8x3Vl4Ml2d3XW3FrBECvRPEaTuU
	 E1GWziyyE8xNy1Mf8Ws5dqsT4b7myVxcxZsxnDVUxsce8wOzML/Ulmy9NyQQHtWgr1
	 DwTxg5jq+tNNA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15d47266baso126148866b.3
        for <ntfs@lists.linux.dev>; Fri, 31 Jul 2026 06:56:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YwHCqhCOeWUtBtleO/RW42DGDQmHWUmvKyJzmbgoCuOsWQOwOoz
	tHeiHx33m9CGbuThDW/ZsUHyNtAXjAsExGnGIevsvqWgr3XpwoVM717HxCdXtgglrjM8QYqzowM
	cHygCM1ax+e5utsfn9Kcocrr+kePpd2A=
X-Received: by 2002:a17:906:6a0a:b0:c16:886e:f0f with SMTP id
 a640c23a62f3a-c1fd28aebc0mr125184066b.48.1785506187526; Fri, 31 Jul 2026
 06:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730-topic-attr-list-lock-v6-v4-0-80d5fe0a6951@gmail.com> <20260730-topic-attr-list-lock-v6-v4-2-80d5fe0a6951@gmail.com>
In-Reply-To: <20260730-topic-attr-list-lock-v6-v4-2-80d5fe0a6951@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 31 Jul 2026 22:56:15 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8sQyEjnh69qdOX_-jaP-6ViN0K4YibhaPH+MC4-18QVg@mail.gmail.com>
X-Gm-Features: AUfX_mxOoHBmHcoM1i5th5_e2pUCjOBQA0K14VQPlkaAA1EK_01lWOV-g7-4mZQ
Message-ID: <CAKYAXd8sQyEjnh69qdOX_-jaP-6ViN0K4YibhaPH+MC4-18QVg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ntfs: protect attribute-list buffer replacement
 with attr_list_persist_lock
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, Cen Zhang <zzzccc427@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> +int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni)
>  {
>         struct inode *attr_vi;
>         struct ntfs_inode *attr_ni;
> @@ -111,6 +117,23 @@ int ntfs_attrlist_update(struct ntfs_inode *base_ni)
>         return 0;
>  }

Thread A and Thread B are serialized by different locks here.

Thread A holds attr_list_persist_lock and enters
ntfs_attrlist_update_locked().  It passes base_ni->attr_list directly
to
ntfs_inode_attr_pwrite(), but it does not hold attr_list_lock while
that buffer is being read and written to disk.
At the same time, Thread B can enter ntfs_attr_record_move_to().  That
path takes only attr_list_lock for write, so it is not blocked by
Thread A's attr_list_persist_lock.  Thread B can therefore change an
ALE's mft_reference and instance while Thread A is still copying the
same attr_list buffer to disk.

The on-disk attribute list can then contain stale or partially updated
extent identity information, even though the corresponding attribute
record has already been moved.

The mutation and the persist need to belong to the same transaction.
Either make every in-place ALE modifier hold attr_list_persist_lock
until its update has been persisted, or take a private copy of
attr_list under attr_list_lock and persist that snapshot instead of
the live buffer.


  Thread A: persist transaction                 Thread B: record move
  -------------------------------------------   --------------------------------

  1. Takes attr_list_persist_lock

  2. Starts ntfs_attrlist_update_locked()

  3. Passes base_ni->attr_list directly
     to ntfs_inode_attr_pwrite()
     (does NOT hold attr_list_lock)

                                                 4. Takes
attr_list_lock for write
                                                    This succeeds
because Thread A
                                                    does not hold its read side.

                                                 5. Changes ALE:
                                                    ale->mft_reference = ...
                                                    ale->instance = ...

                                                 6. Releases attr_list_lock

  7. Continues copying the same buffer to disk
