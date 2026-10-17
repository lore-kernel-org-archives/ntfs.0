Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB423ACA4B
	for <ntfs@lists.linux.dev>; Sat, 17 Oct 2026 02:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205688; cv=pass; b=o+9b9+us6ITFGSKXT+xPlnthsZjW/1J/2FHf8p5HGt6kFCQH6NBxx7Np/J+Vz5Hnvw+6ACUDtshcBJnUn+M8f6Ta6vZjqPerx3ZV6Gt465AvD/lRRyImxz/qNziQP7m0ZiIN2ksZ0fDTQ2G0Zgvgr9WYLOF/DbvwY86Y8YRH3vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205688; c=relaxed/simple;
	bh=2uiIxEIBsEEs1GxvTDbYzaqwXFqrGRoYUmVr/Ubqges=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cTrbGz67PrM1n7Nz3Sj2wqR5ulA3biqH7nuXYy2jRx938LdBbVMdis5wYDTfakMMZ1CUCeCe3VdUls1vF7cnuJ6fLlw3dD+kt8FgxJzylreS2BhCrJdsCD8I3TLqivRYH/XjfqGcONCzHluyQlY2WzMpZAzCRaL9vlkRXOh527I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqyS4V4w; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqyS4V4w"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67990a45e02so503273d50.3
        for <ntfs@lists.linux.dev>; Fri, 16 Oct 2026 19:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792205678; cv=none;
        d=google.com; s=arc-20260327;
        b=MsmT3iQmHTyc9apDPjRdI7RNZI749lzOvqd4VT2YFXnV14R+AjIzl6l6W6SaumwS0W
         aJqY2MelYQdbVq2ncLzhNZd/U/08YVeE/UW83rrQMr+s1K0jhFxGlQr+CG1983sIpSC7
         GiCR+aZk+cdXc3bNKfaAV9NLk3LTIRcGhhCZGP8izVB+2nx4K6+hNS37X80ulLRCiMCi
         prOqLNWkgv28qDb4C0JduMP3+vf+G/fL9u4bxtYbWVccSCBZHZMN68UCEmhqvthuWkaC
         SqOwErkM8d6s9RNKeqv8EApYC2lv4qgzPIUUUHT/eCjvnKiQEHU2p7N/WQjPy6sm1svw
         bBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wfkSXPo0dNMIKT2KF2ALOes0/DMCq2j0ggg+m5sbD2Y=;
        fh=NK9ReezMparmvjLUHKKtfe+wsZZJ1jn0XXC0lpZHPrM=;
        b=G8en9s0em5DeDHhZcakStA0vVjLUaiGaeN/g+vj3xWuiLSeW0ax85TTOuN8Y9tUmJ3
         aMmePuD/UJyzGXWvcYa/aAah9o5MGc/NF+/qlOJNqDzZFPIPFFB07hE5HZ8fRL1LL5YA
         wjvP1nTCHBYlWpWfs3YOgDsk3jJS7Tv8JnkDpy28+j+IdojrnxgwJDKjULfIhpof4I46
         SjVCe14eav33FaOztYleNZr1eQk5M0MBVp9ztJsWMqCEwRoAieXnuNJQqa8uWAti4q72
         GGI14gdsFKApl6LHzKuVri7+KGdKHjqdA4YNtKljVDUpIqvyKTbreSmJpz6pG0K/DJQz
         yU4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792205678; x=1792810478; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wfkSXPo0dNMIKT2KF2ALOes0/DMCq2j0ggg+m5sbD2Y=;
        b=EqyS4V4wGYu3eqEBIS1PmA/rpqBlM7O8vHZ/4RkxtNSsi1wGxz/5VczVw/c8GoG2sY
         XummO4CPQ3p66O5yzre+nzdiQas6MP2Eg361zss+dtLaPGhhOzUOApoY5vtSmqTlwS7n
         DtEkkj8tvzCM72Horn/5D1G/gcLaBkLvqRoF7rsc2ZDYttNk2vAwdiJcEOMIdRE4meQW
         ODMYFQW6iz0p7/jTubHqHx05Obx3tG3O1L8YeNh78ixMaCqt/FUrxgWukluywHtqEoN4
         +KHUhGzgQP+rjRieaDoMsZbkORSErUckUvXRaAt6XiJPoKQAmtYYxI/pmShyco/ofBkV
         2jJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792205678; x=1792810478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfkSXPo0dNMIKT2KF2ALOes0/DMCq2j0ggg+m5sbD2Y=;
        b=ffU7RWZKD00X3VexQh5grUGKFvrbsgpHQGSNyRg+Jea7gxW/BY/fN+WGwClH5v/Lf1
         2fGjuu2Lb9sCzXuiB2TWi3t8P+SV3Ih7naSx0Lf4bLHTg8gsO6j4ZKQ453xM3tE9Touo
         Z1uAJPeV9ZJAz551Utdr2Mlr8vX2XOOCgWxD2LQ8KNEO1SJ5elxo6LSWZ13aTXDeI1pY
         B6BIeKCLeFehfE+cDfRi+eQLDpQ4B3l3FRDaY2CrSsboZ7wATYLb+8Q1+2TrWvF9IZz8
         vkN1M4NLujPsx+HzCBMEpPI2EpBSw7vkVBS84D5QtB4kVsVebR0N3B0g2v7vGvH/oU7a
         /Mug==
X-Forwarded-Encrypted: i=1; AKwUvByXSDdNwfucjyGqwbZUqhELNpiEXSvgklciH22ijEb7f7xFTgyRKXI/eQtw2S0ZhrqZrSRJ@lists.linux.dev
X-Gm-Message-State: AFq9FYLx503wxf05EumMTB7w6tAi+JLCtQeqVtxrsedehKcdP8y3yJDR
	JZxTTFWYC5W+cRFdhQ1xYREdv0muL6tCGXqQjLq8IjKgxhEzv7ZVK7qUX1cWH5l+B3hjvK7wODR
	fVd92TCg34HeVVpsPRqwlGCaewjsPfXs=
X-Gm-Gg: AYBFou0NOVPnhVayTF2LQVXwp63VZzIck+fFPjt+Ko1gQ3XnbvtbkGBAzH02v2EGICk
	pd0gJcWSRR8FGH5NgNt538c8sUR2RjDX8Ryb/ZWuApHz8FGXt3JBC/qKxCZPktIe/N2+q3PfCod
	oCiSta7BfGcvn9sLmpqHErIjimRNPTGcw9Y7b1RxygcmeyK7xr9c//LOGK4dSjnwJWuuQCZKXuQ
	0Okhbb1kL0c0bsNGSTXQxjyKYxHqJnhW6bWd1fq9McFoUBEHzmoM9B3bPm2ElwdFCJf3AYtUvgn
	0iVZ4uE2eZytJlIkK6boHPUn4o8wQnA7mwrHhVyFTqovlqhD1Rm4GgGZchfbelDpWTK8aPYX2Nf
	uGgz7y+uDKw==
X-Received: by 2002:a05:690e:13cb:b0:677:c075:a57a with SMTP id
 956f58d0204a3-679ca9222aamr399271d50.108.1792205678498; Fri, 16 Oct 2026
 19:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812-topic-attr-list-lock-v6-v7-0-2f35e0a38bfb@gmail.com>
In-Reply-To: <20260812-topic-attr-list-lock-v6-v7-0-2f35e0a38bfb@gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 17 Oct 2026 10:54:27 +0800
X-Gm-Features: AclHuK8omokjBD3xPayNXNpHAYjQNY3Btile2rC-o-ompk6JR7nrDrlOQ3WYVQM
Message-ID: <CAFRLqsX+4mzD5t1-1OgWg5K3nQPAY_T24uJHpH853mChUpOkYw@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] ntfs: serialize attribute-list access
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev, 
	Copilot <223556219+Copilot@users.noreply.github.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hyunchul,

Hyunchul Lee <hyc.lee@gmail.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=B8=89 09:18=E5=86=99=E9=81=93=EF=BC=9A
>
> ntfs_external_attr_find() walks base_ni->attr_list using raw
> attr_list_entry pointers stored in ctx->al_entry. Because other paths
> can replace base_ni->attr_list and free the old buffer while a lookup
> still holds one of those cursors, a concurrent attribute-list mutation
> can turn a saved cursor into a stale or freed pointer.
>
> Reported in:
>   https://lore.kernel.org/all/20260702161710.2606853-1-zzzccc427@gmail.co=
m/
>
> This series fixes that hazard by replacing the raw ctx->al_entry
> pointer with restartable, generation-checked locators, and by adding
> locks that serialize attribute-list buffer replacement and on-disk
> persistence so concurrent mutations cannot corrupt state or double-free
> memory.
>
> The four patches are:
>
>   1. ntfs: replace raw ctx->al_entry with restartable attr-list locators
>   2. ntfs: protect attribute-list buffer replacement with
>      attr_list_persist_lock
>   3. ntfs: protect attribute-list creation/teardown with
>      attr_list_persist_lock
>   4. ntfs: protect mapping-pairs attr-list updates with
>      attr_list_persist_lock
>
> What changes
> ------------
>
> Instead of a raw struct attr_list_entry *, the search context now
> carries three value-only locators:
>
>   - al_cursor  -- where ntfs_external_attr_find() resumes enumeration;
>                   invalidated on generation mismatch.
>   - al_insert  -- insertion point captured on -ENOENT lookups.
>   - al_exact   -- immutable identity snapshot (type, lowest_vcn,
>                   mft_reference, instance, name length) used by writers
>                   to re-locate the same ALE after a buffer replacement.
>
> The inode gains attr_list_lock, an rwsem that protects the live buffer,
> its size and generation, and in-place ALE changes. Readers hold it
> only while dereferencing the buffer; writers hold it while replacing the
> buffer or changing an ALE, then increment the generation. Pointers into
> the buffer never survive an unlock, and the rwsem is dropped before
> persistence or an operation that can take runlist.lock or extent_lock.
>
> attr_list_persist_lock is a non-recursive mutex that serializes a
> mutation through persistence and rollback, including list creation and
> teardown. ntfs_attrlist_update_locked() writes the live buffer without
> attr_list_lock, so the caller holds this mutex from mutation through the
> write. It also stabilizes the buffer while attaching extents. When both
> locks are needed, take attr_list_persist_lock first. Creation owns the
> mutex itself, so callers must create first and then restart; re-entrant
> teardown uses persist_locked instead of recursively acquiring it.
>
> ---
> * Changes in v7:
>   * Patch 3: serialize non-$ATTRIBUTE_LIST removal with concurrent
>     attribute-list creation.
>   * Patch 3: initialize successful removal results and release
>     attr_list_persist_lock on every early creation error.
> * Changes in v6:
>   * Patch 2: initialize new_al before an early error path can reach its
>     cleanup, fixing an x86_64 allmodconfig Clang build warning.
> * Changes in v5:
>   * Patch 3: keep each in-place ALE update and its persist in one
>     transaction. This fixes the Patch 2 review: a record move could
>     update an ALE while persistence copied the same buffer.
>   * Patch 3: serialize attribute-list creation, teardown, and extent
>     attachment.
>   * Patch 4: acquire the mutex unconditionally for mapping-pairs updates =
to
>     close the attribute-list creation TOCTOU; drop it before creating a
>     missing list and restart afterward to avoid self-deadlock.
> * Changes in v4:
>   * Patch 1: fix attr-list lock/unlock and uninitialized locator on
>     the AT_END path
>   * Patch 2: hold attr_list_persist_lock around all
>     ntfs_attrlist_update() callers and recheck the attribute-list
>     state after locking
>   * Patch 4: avoid self-deadlock rebuilding $ATTRIBUTE_LIST's own
>     mapping pairs
> * Changes in v3:
>   * Patch 1: fix $ATTRIBUTE_LIST extent double-delivery during
>     mapping-pairs rebuild (xfstests generic/040)
>   * Patch 3: fix self-deadlock on attr_list_persist_lock during
>     attr-list rebuild (xfstests generic/040)
> * Changes in v2:
>   * add Fixes tags
>   * add Reported-by and Tested-by tags
>
> Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
>
> ---
> Hyunchul Lee (4):
>       ntfs: replace raw ctx->al_entry with restartable attr-list locators
>       ntfs: protect attribute-list buffer replacement with attr_list_pers=
ist_lock
>       ntfs: protect attribute-list creation/teardown with attr_list_persi=
st_lock
>       ntfs: protect mapping-pairs attr-list updates with attr_list_persis=
t_lock
>
>  fs/ntfs/attrib.c   | 568 ++++++++++++++++++++++++++++++++++++++++++++---=
------
>  fs/ntfs/attrib.h   |  48 ++++-
>  fs/ntfs/attrlist.c | 181 +++++++++++++----
>  fs/ntfs/attrlist.h |   3 +-
>  fs/ntfs/index.c    |  26 ++-
>  fs/ntfs/inode.c    | 116 ++++++++---
>  fs/ntfs/inode.h    |  10 +
>  fs/ntfs/namei.c    |   2 +-
>  fs/ntfs/super.c    |   2 +-
>  9 files changed, 795 insertions(+), 161 deletions(-)
> ---
> base-commit: 5c244a0e9ca95468f4c2087b2c9269825429a13f
> change-id: 20260727-topic-attr-list-lock-v6-f1a909e3c859
>
> Best regards,
> --
> Thanks,
> Hyunchul
>

Just checking if there is any update on the v7 series, or if the issue has
been resolved otherwise.

Thanks again.

Best regards,
Cen Zhang
