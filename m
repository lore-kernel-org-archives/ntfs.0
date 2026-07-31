Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA402F3C19
	for <ntfs@lists.linux.dev>; Fri, 31 Jul 2026 11:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498766; cv=none; b=i471vO0It7AVUs/8BgI6+lMC3VyK8jvKdjU1tc+pZ01nTdSYK5/2smEAgOjcQaz5MykerG20P5zkeSvhgO4VE8+eTyhbF7lg9yt4iUeNyhwKZ9498rtlgS8pWC8fqggpxVFtO++1Il5K1idWOwehjvuxzQEWZIcUv7yokJWVl5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498766; c=relaxed/simple;
	bh=Isex+aY+2GEnb5LGWcJaGlZniPO6K0eac7fkq8Crfrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBFu8OujnqBuKAF8bEuDXLH9yeSXqL/GkiMkCv/wyYFtIv9ZvgBAioWAapeSy6t9mtWARnEFynkk1UmXMy62ygq2v5j6k/QWsOOBzbvONJX+M7qOWVuPtdKj+Tjfw56f7BBdEDSE9fGVBjGNSGEYbTAUPpygt2MVO11LSudjNCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6V3wAVX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6V3wAVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5CD1F00A3D
	for <ntfs@lists.linux.dev>; Fri, 31 Jul 2026 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785498765;
	bh=I9PW+/Hdr3Asf4nJO7I1J4Gf0say1LUGfL/l7OfkjEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y6V3wAVXsL7Q5loHlEfkrpVn4+0IeLdKRyP+zJ2fcn1aN/UHjwBNJNOa5QRY9OY03
	 NWPV5xtFJHaHpdHTfVpFe18TGECi0YePYj6tg0+1zZAujG5x3jw+mS6sYuO8kNNb2R
	 M0OFyTAn+oXwrpy++pMYehD1lOapxzJN23LRXkzAZVzZZLeDJ+WeIwpGk+Hf8MoeF+
	 tfU3TmJ5XgSNU/gzM9uzmtPZyvRMka5WOTlo7LesFrRRMavcZXTbkonbftHFvswhwd
	 tB2ZgJVHp/bhlRE/CwaR/uavz4Ogd/Dkzqo8x8qjZhN6P0BNmmVdqc6Sv101NI9bgk
	 pDV7ILZxIzO2A==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15cd3fd760so101931366b.2
        for <ntfs@lists.linux.dev>; Fri, 31 Jul 2026 04:52:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YwmC4mAxuF3IW1qahYr/U8Tgrtf/scbA5cJ+U9/VMH1xzA+IJT8
	NfQJ1T3xVzExRvakPAhYZgEN3zKgTCcSw2UGRCVxsvFxgyQJFZibixbjmizdjp0gFY6FQQYxwCt
	OkfqdAhaeF8RphqzzNOpCVfOan6rovJM=
X-Received: by 2002:a17:907:3e0b:b0:c1f:586a:8514 with SMTP id
 a640c23a62f3a-c1fd274b965mr81473166b.65.1785498764051; Fri, 31 Jul 2026
 04:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730-topic-attr-list-lock-v6-v4-0-80d5fe0a6951@gmail.com> <20260730-topic-attr-list-lock-v6-v4-4-80d5fe0a6951@gmail.com>
In-Reply-To: <20260730-topic-attr-list-lock-v6-v4-4-80d5fe0a6951@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 31 Jul 2026 20:52:32 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9u5hpANu2WKf590L-wQzmu_fU1L_pHELKBdxOZ1PU8yw@mail.gmail.com>
X-Gm-Features: AUfX_myhDW-YkCeHDqql6n25VA_9uX_wUFCHMe2lV70ZPgcXZ_bhYt7v9mqOzNA
Message-ID: <CAKYAXd9u5hpANu2WKf590L-wQzmu_fU1L_pHELKBdxOZ1PU8yw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] ntfs: protect mapping-pairs attr-list updates with attr_list_persist_lock
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, Cen Zhang <zzzccc427@gmail.com>
Content-Type: text/plain; charset="UTF-8"

There is still a race between this initial NInoAttrList() check and
attribute-list creation.

Thread A: ntfs_attr_update_mapping_pairs()     Thread B:
ntfs_inode_add_attrlist()
 -------------------------------------------
----------------------------------

  1. Checks NInoAttrList(base_ni)
     -> false

  2. Does not take attr_list_persist_lock
     attrlist_locked = false

                                                  3. Takes
attr_list_persist_lock
                                                     Creates and
publishes attr_list
                                                     Sets NI_AttrList
                                                     Starts persisting
the new list

  4. Calls ntfs_attr_lookup()
     -> now sees NI_AttrList == true
     -> uses the external attribute-list path
     -> ctx->al_cursor.valid = true

  5. Updates an ALE under attr_list_lock
     attrlist_changed = true

                                                  6. May still be
writing the same
                                                     in-memory attr_list buffer

  7. Calls ntfs_attrlist_update_locked()
     but attr_list_persist_lock was never acquired

This allows Thread A to modify or persist attr_list concurrently with
Thread B's persist transaction.
