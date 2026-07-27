Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AEA3F99F5
	for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785149450; cv=pass; b=surnH0pPbTIs+VUKNpvR6TkZ4z/h9lXlxZ1vYSZP3ddJjw74CIEa+aYslZcmnCitLlR75tHda43CJLsoihDQDC9wWTXbLsGvJFM2c299wRUi7xthlmH7wDRwYvNH61r6ngcg9JIplQKnrmP7Rr5h6Nd7bTQITdCNRYHggThBAF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785149450; c=relaxed/simple;
	bh=CoCvfhHPki0kOimJhYQsFUDOoO6p4KwDkDzF10OO6mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NzC737iWgcCEoRnlywIatzgA0vZKVtLhZweL/qu/EgCSCklLh3c/FHrk+Xgajxsah836OGN4wC76isGJrxFq9eBdQMsnFg5vacEmAyNv0iwzc4Grg+EKNZ4lHyYeYw9knhkBxsBWEmOu94N0dASvmNLv7+srVXs9yyOqsRSRLEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVU2oKXE; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVU2oKXE"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ea0b7d137so11563747b3.2
        for <ntfs@lists.linux.dev>; Mon, 27 Jul 2026 03:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785149447; cv=none;
        d=google.com; s=arc-20260327;
        b=EjpS45XvdfE8R1+5kVwDe4AVKNGB0zfDtlocQFWN8dhGJr8JO6qOpOUZ0qagM+xmgp
         YpxZhIQVUXG4Rd2Sr6JCG9hs7Qj1lx2uWNLq95nKPWRGT5zJPpUkgjM1l4QYzekdMfK5
         JlTEq0Xxp7IAX1ruBdz2c9kTBqenN9Q8rUD3MsJKrE29hevK9/WLz087v5ncYRDDLq6J
         4CfEvPSHb+3cLWzd8s/VNpm/RYGMI8pAqNXjynDQod/UwFgbIzTEz1WXkvxDC3tMGc2P
         JJGEwQocMHZK8tG0hhqV7UsOcwgbsGlM6uszUVOXNJYE7s1eP5rQnVw9bNQI1fDsb/O5
         C0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ce/xjo3CHtOJo7QCHaSy/rZDr8wa8BVzmFJpkSclkaM=;
        fh=ZStMpecUgayRDEefJNjVfo1buVH1OSEhH132Lbu/fXk=;
        b=MqzB36HsrnsoQ1x/XTIQiqFbZyOL/J8juhNjjq/PZAx/QWcRk/IGa0LCK2fBv4KdEb
         BE+yBuAPLWt72HvnhsWNrA9jmbF9NZ4+e+we08AXoJhUtFKJHkclKMY3gQYQb2x2TESB
         JzaYQXF8Pod3IBpXGLoR26dnHKZbP6S1JqIxn8Bg/xKtZ1/iuZYUnLJLREXdWQE35xq0
         Zrc/27JmxRsi7Jg2Ubx8PUHfZTQJRegB9Jkc2DDbQWCdVJai1xK0DrVaUoOl7NYttW6e
         IhSCRBx6KYAOo1BNWS5ba0W4X853YCtZs3u5EURJtcOfS49Yy7NjEuOAq491Aj2JShL2
         211Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785149447; x=1785754247; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ce/xjo3CHtOJo7QCHaSy/rZDr8wa8BVzmFJpkSclkaM=;
        b=lVU2oKXEJfNctoRPyoWMfpZRMqvpulRHH5rqgpTGoxamISlbser2/XXPTXvudK9rVi
         EgyJEEO3dvMNzC7HRqIZ3oVXjfrsmK6hQSizlLMwcapdHroB7VlVPkl+R0g15dX5I1p/
         L6bd1hXDB8LoZbtDjIQjmo+wfrBs+5Ye12nurOXiRmHWicCh01NmLVPNA8KC2ID7VImv
         3EtI/OOrSEXO6a7WU24DBGQP5IKFm4QgOawjvxjewrG1UZRY2k0vzLepAAzMgTAFQpks
         Qul+xF5bSQ6JwG48wwZkUn6HoyX/ce2CPEj/vg2sHQLOKMyXfvh1KyW49vHvjcoVrf+K
         krPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785149447; x=1785754247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ce/xjo3CHtOJo7QCHaSy/rZDr8wa8BVzmFJpkSclkaM=;
        b=Qs9Pjo5nVmzTr6UQ8NIa7QaIu21sRiucs9UfBbFE7NaCNLMJrs9RPjWICobhCIIgh5
         qc/MaOOK6j4l9ct8McNzCdcuyYnFz9/0AYJIMEuEBRV2G0Kgs1e/vbvlc3wCtqJZjxYw
         GvpTIbwadr8WRKhNJery+V2sWsbw9CnDCu5Qg+8yXJF7hrkYAczuIKJA0W9gOBZZWbhd
         SwOYOoIs2LtdPMDIRJP+/faovQhaq//58mh1sRQOQ+mBUTMZ6ROWXhIlug2YAQQWWQCn
         HdT6j84NgIeRHaHC59LRoSnsqFB+kXjD6AtZtLi+OsB/LyUwLTOjVQr7nds4zP3hNjPc
         bBQA==
X-Forwarded-Encrypted: i=1; AHgh+RotsOHGNFoFsOpLMv5HomUcHJqBbUE1aes67O9gKTgfmunYZJo0xfFt0ZN+wG1YwIMa2L4l@lists.linux.dev
X-Gm-Message-State: AOJu0YzzwmPcgu/eYHheTHnQobJw0efcEDgTYXWQtvCgBf4Ob17JxFEd
	Kk2SIP+qfjulObn6XC/h/T2Q2Y1nhF1RQS0jqsKpmvoWbJ9xc2NYPtMBCHe+nC/p063JzUyNLd+
	wuzoC16d/6jxUUCKdAprp4V9YWAXDCm0=
X-Gm-Gg: AR+sD10ctyKP5Rg/1g3OXzMIk7TIeI+mUtePJGO0hKZ4maGq8n98CASPx7Ong+VhNHi
	qDzrJ/pUJjoHaoT3oU46q98gtfMhZ+n8RW1sgD/gTdNgjaxaGghP/DY6YpGjLji3+B7xCntyG/A
	2yjlwiJ1OHPfHtMDkNfTUAqdr6pUMwhl4EDD8fYw8nD1JObqWagIVm55TUpvEzPiGS+UXKAiVVL
	j4dlXDwD7m2D/Kp7r/RFCIIfvsLhBAlia/XoM7a6ZjPaU1HywXBm+iwfFJx8ov/vGOmQ6a/GgM=
X-Received: by 2002:a05:690c:d07:b0:81e:92ab:765a with SMTP id
 00721157ae682-81f69eb9d62mr26907017b3.69.1785149447115; Mon, 27 Jul 2026
 03:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-topic-attr-list-lock-v6-v1-0-664c5339d9b9@gmail.com>
In-Reply-To: <20260727-topic-attr-list-lock-v6-v1-0-664c5339d9b9@gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Mon, 27 Jul 2026 18:50:34 +0800
X-Gm-Features: AUfX_mynHnWRBMx_8g85d4DEgKX0WHb2FjT5AK2wEmoGazY3tD3KFGtwzTtOgls
Message-ID: <CAFRLqsWywpyaaqQS86o27KEp1kA7dkq_nbmK3B94v34KGk8Z8Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] ntfs: serialize attribute-list access
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I tested this series using my original reproducer/PoC for the reported bug,
and also ran a focused set of generic xfstests write/fsx cases.
Everything looks good to me.

Reported-by: Cen Zhang <zzzccc427@gmail.com>
Tested-by: Cen Zhang <zzzccc427@gmail.com>

Best regards,
Cen Zhang


Hyunchul Lee <hyc.lee@gmail.com> =E4=BA=8E2026=E5=B9=B47=E6=9C=8827=E6=97=
=A5=E5=91=A8=E4=B8=80 08:59=E5=86=99=E9=81=93=EF=BC=9A
>
> ntfs_external_attr_find() walks base_ni->attr_list using raw
> attr_list_entry pointers stored in ctx->al_entry.  Because other paths
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
> The inode gains an rw_semaphore, attr_list_lock, and a 64-bit
> attr_list_gen counter.  The lock protects attr_list, attr_list_size,
> and attr_list_gen; the counter is bumped on every buffer replacement
> so a stale locator is detected before it is dereferenced.
>
> Because ntfs_attrlist_update() can sleep and recurse back into
> attribute lookups, attr_list_lock cannot be held across persistence.
> A separate mutex, attr_list_persist_lock, serializes the whole
> publish-buffer -> persist-to-disk -> rollback-on-failure transaction
> for each mutator.
>
> Lock ordering is:
>
>     mrec_lock -> attr_list_persist_lock -> attr_list_lock
>
> attr_list_lock is never held across anything that can take runlist.lock
> or extent_lock.
>
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
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
>  fs/ntfs/attrib.c   | 411 ++++++++++++++++++++++++++++++++++++++++++++---=
------
>  fs/ntfs/attrib.h   |  46 +++++-
>  fs/ntfs/attrlist.c | 139 ++++++++++++++----
>  fs/ntfs/index.c    |   3 +-
>  fs/ntfs/inode.c    |  69 +++++++--
>  fs/ntfs/inode.h    |   9 ++
>  6 files changed, 561 insertions(+), 116 deletions(-)
> ---
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> change-id: 20260727-topic-attr-list-lock-v6-f1a909e3c859
>
> Best regards,
> --
> Hyunchul Lee <hyc.lee@gmail.com>
>
