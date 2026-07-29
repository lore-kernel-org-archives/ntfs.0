Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACFA33F394
	for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320169; cv=none; b=bMwjgRQEWMSfFYBKXV8dpRJw/hh0NOO1PwtsII12C0ycFgHBmP0z1j2R4Anm8Wm1cMUfhJnif35FH9Xg+TChTRenHUMWVzLDGDbxFV6VrLAqxZrq5BtPsuGqstXPXusgYdOxRVBswH7LlHjpJl73aWfMTjfXk+nRzYPO7qKzUe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320169; c=relaxed/simple;
	bh=Z9trM1R+JwW+4zGOtG0fF1LER7FrVUUfv7Fsdfbr0+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3pbffLjQnN8ka6P9Vgvcp0C+PwQGy7VKDa6Ugctf7n3Q8x/9m4j105KwpjEgzK8t/CjZ5wwBva/g+Hwpnz2AfC5e2rm/KDkw0pPZ+dxT9T6suZ4ASc1+TgtZv+R2izMTbyM5x7S5qTApDLSVMq+fgqUZ28ckjGbtAAfYzSaaIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkMHLMVo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkMHLMVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFFC1F00ACA
	for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785320168;
	bh=VGa5Wmhqz7BQdPAzockCye6vagWZzdd7aHSq5N13F00=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YkMHLMVo2xGyt4q/lwhGFgQYBBx9Cn9NE1zSGQYb2nA7/B7Rh4KEgesc7SMuVwKMW
	 LqVwVNhJuUnedpmu2qutCM2fm7FTEpqzOdr4E/l0K6cz7sETtcdR9bFCtVD7BKBoOX
	 B5qoDcz10WmolLn1rhuL4KXrAABNeWKCEhibvPJjuktwar9aCL3zIb/N4ZYIdFtu+L
	 GrfbFQFdS6qD7rxzR7X6MOAjRRiTa19N8GBkqHhI1pHClSNNidisg0krNDdKiokgWT
	 ELfPa9EPGlpKF8UdqTKEnAo42JUguJIA9pwQ5O/wm/lNuhFWLwqGhhqDA3eLOAWleH
	 qdvu1VrnRF8Kw==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so741226a12.2
        for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 03:16:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YzB/HKpSpG4aEzsRRc1SHbtLftBeZgADQ4yXk4ToD8dSMSZtw/s
	8rc+47Fdx3SB4V5MJ5hf6uUkwXh1xc1cVAuVtHZ3eg88e/vmA0FpIAt3PIeZFRzEZJOvhBQaauR
	SDBoL9IfSCRn3DaZ3KCnfxIwdJbF4JqA=
X-Received: by 2002:a17:907:7b9e:b0:c12:4cb8:a826 with SMTP id
 a640c23a62f3a-c1f71d07823mr291904166b.6.1785320166794; Wed, 29 Jul 2026
 03:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729-topic-attr-list-lock-v6-v3-0-7f690b9b98ad@gmail.com> <20260729-topic-attr-list-lock-v6-v3-2-7f690b9b98ad@gmail.com>
In-Reply-To: <20260729-topic-attr-list-lock-v6-v3-2-7f690b9b98ad@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 29 Jul 2026 19:15:54 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8fqH0iJWYV=3SCkhPqWyAL9yutXESg97t7MCDtYKaatw@mail.gmail.com>
X-Gm-Features: AUfX_mx10AztS6CHIxijxjsQ1HOZwXyW7qtIPsOPoSi9UdhGp4BBySNKH5_kI8I
Message-ID: <CAKYAXd8fqH0iJWYV=3SCkhPqWyAL9yutXESg97t7MCDtYKaatw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ntfs: protect attribute-list buffer replacement
 with attr_list_persist_lock
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, Cen Zhang <zzzccc427@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> @@ -153,13 +154,16 @@ int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
>                 ntfs_debug("Attribute list isn't present.\n");
>                 return -ENOENT;
>         }
> +       mutex_lock(&ni->attr_list_persist_lock);
>
> -       /* Determine size and allocate memory for new attribute list. */
> +       /* Determine size of new attribute list entry. */
>         entry_len = (sizeof(struct attr_list_entry) + sizeof(__le16) *
>                         attr->name_length + 7) & ~7;
> -       new_al = kvzalloc(ni->attr_list_size + entry_len, GFP_NOFS);
> -       if (!new_al)
> -               return -ENOMEM;
> +
> +retry_lookup:
NInoAttrList(ni) is checked only before acquiring
attr_list_persist_lock. If another thread removes the attribute list
before this thread obtains the mutex, retry_lookup proceeds without an
attribute list. The normal lookup does not populate al_insert or
al_exact, so the generation checks can repeatedly fail and jump back
to retry_lookup while the mutex remains held. Recheck the
attribute-list state and buffer immediately after acquiring the mutex,
returning -ENOENT if they are gone.
