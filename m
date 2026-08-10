Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827A3A383C
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370646; cv=none; b=NDjuEr6Q+af0yVh0MP1YqGevpRHPWWRdATZs6Y2I20+6ULiDz33w7Vy+wPJUssubsa0iWJE13JJ4GlYz1Y16ZCknBeZj4vEjzfvZi9Ds7wffjaG1PxwuM9MxD7r42tFkDUxXNKKZ2Cq4Xw3/64WlkinRvlLNjIwSBE6XiqFls6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370646; c=relaxed/simple;
	bh=xsjLosKCMjliYx17uoy3r0bXmgGSlSSv0DcHJDxAxgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1cpsUMpFlCFJSGuCLkHIAXN4Br0PFNXsIBvwSMkwNjvSymb2G7TFtrRPkWqB9WowjB5uoqtNtKnGHIHZC2e09qkS0Y50zoXu0/BA/qGI2PRHc8LDzfCccXDlWIHHhrEJcGK+r3Cic+OOdWgVc2PubOx+wK65CIcevJp2BQXR6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXwEdcyF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXwEdcyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAB91F00A3F
	for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786370644;
	bh=5RNPBeL0SxywBYGUja65SDX2xWmoOKI3GywPqjKu+t4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TXwEdcyF1dF40cV6WFzXFA/M7c3Y0m/q8FWCkETFk1He+q8VDjFCdtS8QDub6TQ64
	 Wv3bx+4E49k9XjUuuuxT9BY/vmNe67ZGFSTUMlutAx/fnB9K18g6YWX+SrcLzkgF6m
	 228mpPXggLg3MZgRChU1cI6iZsGSlb1yNFWwb0QIFlfgdAdSDel8eYMm/bTeRrEcYG
	 2AdWzU/PlIVSbitph9FhG0Sr7IAU4ci2Z9NI9yOqi8btUjOgSpSf+UWW5OqGGXmMpf
	 BmbHLvfjtadN02qG5RAxmcM9BqAFaZeSdoOQAO9IzmZx7f5l60kaKmrRGCpsHjtzk2
	 V9s3pVyKtxZHA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15f020a223so280680466b.1
        for <ntfs@lists.linux.dev>; Mon, 10 Aug 2026 07:04:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YxLQlhSluUr9kAft7Q9Mym5KErjf9Fjva9Bi9ID7DXWqugO5lti
	Y4Iq/HB4hbmkqvd9LzAzIOBw0lGI4pbtnBW3hFSpbaOSdjALHZim9iK7slzEJGZp3bF9CAWd3PV
	Expo7yta/r1N3F5gVNs3MCImB1pWnJSE=
X-Received: by 2002:a17:907:e00c:10b0:c20:9447:bd5e with SMTP id
 a640c23a62f3a-c209447e6ccmr512397566b.9.1786370643317; Mon, 10 Aug 2026
 07:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810-topic-attr-list-lock-v6-v6-0-e3fb8c4494d3@gmail.com> <20260810-topic-attr-list-lock-v6-v6-3-e3fb8c4494d3@gmail.com>
In-Reply-To: <20260810-topic-attr-list-lock-v6-v6-3-e3fb8c4494d3@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 10 Aug 2026 23:03:49 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-9o32RfkeH9oxY5ASDVocXBm+SO+ATDu_B2qBaJ779cw@mail.gmail.com>
X-Gm-Features: AUfX_myuDWfoor6pc73zMGk6TM83i9iW0n0SGLjMtOAWjL-UoW_C6ibSScKU_7U
Message-ID: <CAKYAXd-9o32RfkeH9oxY5ASDVocXBm+SO+ATDu_B2qBaJ779cw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] ntfs: protect attribute-list creation/teardown
 with attr_list_persist_lock
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, Cen Zhang <zzzccc427@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> +       /* Keep ALE removal and the follow-up need check in one transaction. */
> +       if (!attrlist_locked && type != AT_ATTRIBUTE_LIST &&
> +           NInoAttrList(base_ni)) {
> +               mutex_lock(&base_ni->attr_list_persist_lock);
> +               attrlist_locked = true;
> +       }
> +
>         /* Remove attribute itself. */
>         if (ntfs_attr_record_resize(ctx->mrec, ctx->attr, 0)) {
>                 ntfs_debug("Couldn't remove attribute record. Bug or damaged MFT record.\n");
> -               return -EIO;
> +               err = -EIO;
> +               goto out_unlock;
>         }
>         mark_mft_record_dirty(ni);
>
> @@ -2837,19 +2849,42 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
>          * delete $ATTRIBUTE_LIST itself.
>          */
>         if (NInoAttrList(base_ni) && type != AT_ATTRIBUTE_LIST) {
> -               err = ntfs_attrlist_entry_rm(ctx);
> +               err = ntfs_attrlist_entry_rm_locked(ctx);
The first NInoAttrList() test does not prevent an attribute list from
being created immediately after the test.  In that case this function
later observes the new list and calls ntfs_attrlist_entry_rm_locked()
without holding attr_list_persist_lock.

For example:

  Thread A: ntfs_attr_record_rm()          Thread B: ntfs_inode_add_attrlist()
  --------------------------------------   -----------------------------------

  1. Checks NInoAttrList(base_ni)
     -> false
     -> does not take persist lock

                                            2. Takes persist lock
                                               Builds and publishes attr_list
                                               Sets NI_AttrList

  3. Removes the attribute record

  4. Checks NInoAttrList(base_ni)
     -> now true

  5. Calls ntfs_attrlist_entry_rm_locked()
     without holding attr_list_persist_lock

This violates the _locked() helper's contract and will trigger its lockdep
assertion.  It can also race with Thread B while Thread B is constructing and
persisting a list that may still contain the attribute being removed.

For every non-$ATTRIBUTE_LIST removal, the function should acquire
attr_list_persist_lock whenever persist_locked is false, regardless of the
initial NInoAttrList() value.  This serializes removal against both an existing
attribute list and concurrent attribute-list creation.

>         /* Free MFT record, if it doesn't contain attributes. */
> @@ -2857,17 +2892,18 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
>                         le16_to_cpu(ctx->mrec->attrs_offset) == 8) {
>                 if (ntfs_mft_record_free(ni->vol, ni)) {
>                         ntfs_debug("Couldn't free MFT record.\n");
> -                       return -EIO;
> +                       err = -EIO;
> +                       goto out_unlock;
>                 }
>                 /* Remove done if we freed base inode. */
>                 if (ni == base_ni)
> -                       return 0;
> +                       goto out_unlock;
>                 ntfs_inode_close(ni);
>                 ctx->ntfs_ino = ni = NULL;
>         }
>
>         if (type == AT_ATTRIBUTE_LIST || !NInoAttrList(base_ni))
> -               return 0;
> +               goto out_unlock;
>
>         /* Remove attribute list if we don't need it any more. */
>         if (!ntfs_attrlist_need(base_ni)) {
> @@ -2878,7 +2914,7 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
>                 if (ntfs_attr_lookup(AT_ATTRIBUTE_LIST, NULL, 0, CASE_SENSITIVE,
>                                         0, NULL, 0, ctx)) {
>                         ntfs_debug("Couldn't find attribute list. Succeed anyway.\n");
> -                       return 0;
> +                       goto out_unlock;
>                 }
>                 /* Deallocate clusters. */
>                 if (ctx->attr->non_resident) {
> @@ -2889,16 +2925,16 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
>                                         ctx->attr, NULL, &new_rl_count);
>                         if (IS_ERR(al_rl)) {
>                                 ntfs_debug("Couldn't decompress attribute list runlist. Succeed anyway.\n");
> -                               return 0;
> +                               goto out_unlock;
>                         }
>                         if (ntfs_cluster_free_from_rl(base_ni->vol, al_rl))
>                                 ntfs_debug("Leaking clusters! Run chkdsk. Couldn't free clusters from attribute list runlist.\n");
>                         kvfree(al_rl);
>                 }
>                 /* Remove attribute record itself. */
> -               if (ntfs_attr_record_rm(ctx)) {
> +               if (ntfs_attr_record_rm(ctx, true)) {
>                         ntfs_debug("Couldn't remove attribute list. Succeed anyway.\n");
> -                       return 0;
> +                       goto out_unlock;
>                 }
>
>                 na.mft_no = VFS_I(base_ni)->i_ino;
> @@ -2914,7 +2950,10 @@ int ntfs_attr_record_rm(struct ntfs_attr_search_ctx *ctx)
>                 }
>
>         }
> -       return 0;
> +out_unlock:
> +       if (attrlist_locked && !persist_locked)
> +               mutex_unlock(&base_ni->attr_list_persist_lock);
> +       return err;
Several old `return 0` statements were converted to goto out_unlock,
but err is not initialized on those successful paths.

> +       /* Serialize the initial state check and attribute-list publication. */
> +       mutex_lock(&ni->attr_list_persist_lock);
> +       attrlist_locked = true;
> +
>         if (NInoAttrList(ni) || ni->nr_extents) {
>                 ntfs_error(ni->vol->sb, "Inode already has attribute list");
> +               mutex_unlock(&ni->attr_list_persist_lock);
>                 return -EEXIST;
>         }
The newly acquired attr_list_persist_lock is not released on the
existing early error paths.

  mutex_lock(attr_list_persist_lock)
          |
          +-- map_mft_record() fails
          |      -> return -EIO
          |         lock remains held
          |
          +-- search-context allocation fails
          |      -> goto err_out
          |         lock remains held
          |
          +-- attribute enumeration or kvrealloc() fails
                 -> goto put_err_out
                    lock remains held
