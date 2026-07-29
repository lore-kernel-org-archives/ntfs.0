Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7A53603C9
	for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319865; cv=none; b=qFqhDQLOgX1l76PCeO/2lGTLtlHi7OxCenxi3SIDbvJ/NYhP/EYh9tOfccfuBjiLK4+/6Vdt/XdKVwFjAHJX7jCd18JGuSmyAlFv3WkUqQP3XQHc1EEn6YT0BHwvsJDFNRSKbJ5ycK+pKPBJFK63OwU3j/hxKFvgaWjBqKTkLSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319865; c=relaxed/simple;
	bh=a9eeQykelGPvKWKWoE/Iy6I4BeJAbLTi117HEmSX3eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJ6KfRtWhoeNYB/dzK9mtWUj9MBuF5tubZtq8DeCS0BXZXF4t0onxPC3Dm0bzlpIoQUHsBjygJw3jXqMVdglj57l/KKTKvF41VGqHoyiJlvN/YV8B1+MFytUASpzpuxkOIrB6Xms+svEXt10+7Lby4tUJLNyQ5uGqps8yILzLp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZObwIlHL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZObwIlHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730101F00A3F
	for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319864;
	bh=KATAC0++4IN/IZ1A9XEYDbdZjGaiy6CO70pPntrOpAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZObwIlHLSaTySXA/FEm52e+HAlpqV1A0Cppx8mawcWLPOi68Fq4ZhfzcHn5CNA6hj
	 vID+1a15ghd9k8H8Ag7V5GSP/tsmGMbVeZyiqOGRMv0uOBK5FEjrQRHtD/wf9jwsDa
	 QhPhgrkUMG+BTXFOVxNJKu5JWPhgORsAd+O4kh8Jl1+cZTg70VmF75IVVcfDT9DslG
	 lSRfJaoo5QhiDIyYeHx3IrAdhmh/rXQ4GyryJLgJVQ8pWmftM7AoWAvGZx7VtfhxwT
	 PFo/2ZoXexYvKqTcH5DH1binLCpsf7KL2khy1PKMD/mAwliIhhySUha2nPYKJagsDw
	 kIedpB8Ia8uXg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so114364066b.3
        for <ntfs@lists.linux.dev>; Wed, 29 Jul 2026 03:11:04 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywvn7i790JBOuefvILyUw/lbvgDapQd2kFayrDZTwOExuMiVKUm
	1usZJ3aRycBuuXuoxo9JZVAsZw3NQqPg6ggIX7CHij2Spm6xuzqcYEcJUXOb2Jf9kEXetiZv4/H
	u1SgZKTDIZAjLm2RR15hUzbrq6GfHbso=
X-Received: by 2002:a17:907:3f83:b0:c15:f65a:43a8 with SMTP id
 a640c23a62f3a-c1f71e917aemr308980266b.12.1785319863058; Wed, 29 Jul 2026
 03:11:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729-topic-attr-list-lock-v6-v3-0-7f690b9b98ad@gmail.com> <20260729-topic-attr-list-lock-v6-v3-2-7f690b9b98ad@gmail.com>
In-Reply-To: <20260729-topic-attr-list-lock-v6-v3-2-7f690b9b98ad@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 29 Jul 2026 19:10:50 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_WQ62btrrAqhFE6QocbWhs5FNs3xVWPpgj_=VvroaVmg@mail.gmail.com>
X-Gm-Features: AUfX_mzzLhiN9d88YnEEJmxyfvDne93JiRsSwm3ecBPmQc4K_bS0lyGnjfGi9YY
Message-ID: <CAKYAXd_WQ62btrrAqhFE6QocbWhs5FNs3xVWPpgj_=VvroaVmg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ntfs: protect attribute-list buffer replacement
 with attr_list_persist_lock
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, Cen Zhang <zzzccc427@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
> index a99c228184ce..ee7e5ec6ade4 100644
> --- a/fs/ntfs/inode.h
> +++ b/fs/ntfs/inode.h
> @@ -69,6 +69,7 @@ enum ntfs_inode_mutex_lock_class {
>   * functions). Setup during read_inode for all inodes with attribute
>   * lists. Only valid if NI_AttrList is set in state.
>   * @attr_list_lock: Protects in-memory attribute list state.
> + * @attr_list_persist_lock: Serializes attribute list replacement and persist.
>   * @attr_list_gen: Generation of the in-memory attribute list state.
>   * @attr_list_size: Length of attribute list value in bytes.
>   * @attr_list: Attribute list value itself.
> @@ -123,6 +124,8 @@ struct ntfs_inode {
>         s64 mft_lcn[2];
>         unsigned int mft_lcn_count;
>         struct rw_semaphore attr_list_lock;
> +       /* Serializes attribute list replacement and persist. */
> +       struct mutex attr_list_persist_lock;
The new mutex covers ntfs_attrlist_entry_add() and
ntfs_attrlist_entry_rm(), but existing paths still call
ntfs_attrlist_update() without holding it.
