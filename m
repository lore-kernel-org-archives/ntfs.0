Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C43630B3
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 23:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789429237; cv=none; b=PVcof0hidwjNeilNWYr8NCpKyIbh4Qr+GpsM4KrpUPW8c+Qec8x7plmWm4gw7mjCc7WzgVe8U59cCfGiA+d1r3ZeahdhAQoEbC5xonmukh9QmP1Rp7QGrXQZhLs/RqM0ApVWPQ52ywHJh8zAsNzVrCZiIgJsmTR4SuJx+4+V4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789429237; c=relaxed/simple;
	bh=mQA10aYsOEP8iIaXuNBGBc5gLNsFdb0tp4I0tLQ4MRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyfe86W/3OhMoD1A9dWmXYcZPXirsXZizVmrE/kHV0OXMZiBmIR7Z+dhynC1xNQVITPkROtDrcdhAgKDguelzBKuQQWJD7pjfGOKhPpQZQxKcMje1RKKFaH+Jx8w2N2FbcoSc82sUlRyuI7tZpvWM/dyOkxEEvmKbe/X7SnAHrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M27W9tWr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M27W9tWr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211321F00893
	for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 23:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789429236;
	bh=liBqBbhKk9zqZy2dq2M0aeZH+K42pgabEGh7x8JOI7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M27W9tWrGrMsDjOoDwe8BB5t8UlGDSX0yu0m5C32qoIH0gC/Acj9c9I8uGi/QuIzG
	 Opa0mFYaXxbSaG/cKAj1ueMD95CJh3R2kJwGZS67OaZmKvTJNQ3u7tIQiWbjYRHL9W
	 Nb2YrM0Y4yUg7y2Ahhf6ZO5z4hKfIxCyoBM9zstUoX10OuoPNMxoAgDlo+bB315HDS
	 /7GQyw9EoMl2SmOn2EOLw/14Z4lB2g7K3SaT2/zYq1e6D+ue2oiiTbw9v2TcngLari
	 OL6gfKosJBPuE6xR/iUFBxds5tW2Q0b++J4WcGZ1vhiCKbgb6h3evZ9AYPM2PIRrB0
	 Dfi0xfFEUu2PA==
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99e9so21642047b3.0
        for <ntfs@lists.linux.dev>; Mon, 14 Sep 2026 16:40:36 -0700 (PDT)
X-Gm-Message-State: AFuF++kLBp9fDcRABxfOYjMHdjJCEuKYJbWX6PxkGU84pV9GStprGwZJ
	5ACV2vfp5eHPRji4checnHKi75KnnvwXsSFy6SUzjKzWifTfJ8bKbJtwLQpPYqsZx8CwnNiaVr9
	VUPsqeNdFG56mzbaq5+V142xMXMePYfs=
X-Received: by 2002:a05:690c:397:b0:85a:89f3:f53 with SMTP id
 00721157ae682-88d2068cf44mr15259417b3.24.1789429234169; Mon, 14 Sep 2026
 16:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-up-generic650-v1-1-d98825ead540@gmail.com>
In-Reply-To: <20260915-up-generic650-v1-1-d98825ead540@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 15 Sep 2026 08:40:20 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-gtdztQPov0JhTmA6f7=zoAqeNWR65LKRkrT1SLQ+8EA@mail.gmail.com>
X-Gm-Features: AcwNN1VZXXqBWE-BRBh9wu8LqploVG2Isu9AaALG8Jkgx5cPKMOEMSdHDLHfdyg
Message-ID: <CAKYAXd-gtdztQPov0JhTmA6f7=zoAqeNWR65LKRkrT1SLQ+8EA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: avoid truncate and writeback deadlock
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:19=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> w=
rote:
>
> ntfs_non_resident_attr_shrink() drops page-cache folios after freeing
> clusters and truncating the runlist. The VFS truncate path calls it with
> mrec_lock held. A folio writeback can need the same lock to resolve its
> iomap mapping, so truncate can wait for writeback while writeback waits
> for mrec_lock.
>
> A hung-task call stack:
>
>     truncate: mrec_lock -> truncate_inode_pages() -> folio lock/writeback
>
>     writeback: folio lock/writeback -> ntfs_write_iomap_begin() ->
>                mrec_lock
>
> ntfs_setattr_size() already calls truncate_setsize() before
> ntfs_truncate_vfs() acquires mrec_lock. Reuse that page-cache truncation
> in the VFS path and skip the duplicate truncation under mrec_lock. Keep
> the cleanup for internal attribute callers, which do not call
> truncate_setsize(). This avoids synchronously flushing the whole
> discarded tail while preserving page-cache correctness.
>
> Fixes: 4e646ecd4475 ("ntfs: drop stale page-cache when shrinking a non-re=
sident attr")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks!
