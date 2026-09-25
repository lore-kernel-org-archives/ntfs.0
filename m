Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B9476CDD
	for <ntfs@lists.linux.dev>; Fri, 25 Sep 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325673; cv=none; b=iY6G/S1gVX3fm3VHLtyie5tT2KyZqpCjoWPzpJy9mPevUISRZOWYeGCunOnhTyYpVInILXkUyt9L3/XzzvZH32n6CC5EGt/WIyKO4M0gpce7ENP9sj7WdhK7YpjXgbKrXkXbJwQL5Wr/gnvU6PDcZGGPvaLzvXTYCy81ggl6VyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325673; c=relaxed/simple;
	bh=y9XteAkCyP+v0FYz44SQwqSifvuiXc3WM9WstF3aM5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jj4hjyX9WWYCVeuc4kxV1WZVOtK/3ndH15vaUnFIgiCMXp5UuMd2N3mwI/T/RUvGsT5AUdIm+kumthAjIafWEXJAydOFKDBuyFv6Ki5Ym4b52vRza2Fq8UeL/l5h/aP711imyjBu+zwAjxqiJ2+g4foquVw4+Y5g/Dr9+D4lvtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuovNcyL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuovNcyL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09081F000FF
	for <ntfs@lists.linux.dev>; Fri, 25 Sep 2026 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790325671;
	bh=TBQwqB2tvKCGdJ3ul4N5dIovuA+f4EhpXvTWX1hdc6A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IuovNcyLixXSMbgQQQn4wor3DqLr3t5QoDKb9+RbTHElGuRy0VOuwu7a+0iD0M404
	 PuCy+I3C/RRpAbA5a1IFuMrjcWvmqORWfIlOEJaFcsjtSCKQF8NYhwTou4RJHc/mJk
	 SDLTh5ahW+J6nMcLYviwpBx1w46Z0r3j0y6pJnZhByaNrn/Ckv+3wE6UREV/1mAIJt
	 9LCD7t9ldqjDD4Q0ootv1GY4Zfy1Yd3ujDtSsR6cbS3VChFk7+xMhg+XtCwxblA1cE
	 SKa8wBFl3JaUrmjHBy97kUlX30XTbOqd7ektenWhBA2NF6eNf3E6OmIdp8IwfW/xV2
	 +pN27q6IsR31A==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa650c8so104879166b.0
        for <ntfs@lists.linux.dev>; Fri, 25 Sep 2026 01:41:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzk4aZ/0ryD0WH0zH6dRhTdgBuqAUhIYRcqp2skBWKzYhfGdUMCK+myl83i+TNvjpPiXBz8@lists.linux.dev
X-Gm-Message-State: AFuF++kf7gmr1eRroH+rIFUp0ptCgH06aGMl7ujpbBHzqRs+gIypxzjj
	NJmi92AUdVNQLyJbNsAuXegYxSItegHC9xOSS7UilXIwfEyIWDJACy2t7mD2w9kSXi0kROSZx+S
	wnLuUqomLW1K9ytluO2k7bZy4PicI88Y=
X-Received: by 2002:a17:906:9c82:b0:c29:49fd:c98 with SMTP id
 a640c23a62f3a-c2ac24c4c6dmr434654866b.32.1790325670498; Fri, 25 Sep 2026
 01:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924014207.1678305-1-wangxuewen@kylinos.cn>
In-Reply-To: <20260924014207.1678305-1-wangxuewen@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 25 Sep 2026 17:40:56 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8HNjkz68hk__RmZ8geWt4eCWXbETCHcRAAFz7t_qUDTA@mail.gmail.com>
X-Gm-Features: AclHuK_g2TYqXeJoYpryfeiypDlcSa2suqJy_86YFTUgbbmD3dvnTxeYCKUybDU
Message-ID: <CAKYAXd8HNjkz68hk__RmZ8geWt4eCWXbETCHcRAAFz7t_qUDTA@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] ntfs: fix MFT bitmap extension allocation
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 10:42=E2=80=AFAM Xuewen Wang <wangxuewen@kylinos.cn=
> wrote:
>
> This series fixes four bugs in the MFT bitmap extension path:
>
>   - The adjacent-cluster candidate can be outside the volume. Check it
>     before accessing $Bitmap and fall back to the regular allocator.
>   - The allocator can return an adjacent cluster that merges with the
>     existing run. Preserve that run when rolling back a failed extension.
>   - Rollback can wait for the initial $Bitmap scan while holding a folio
>     the scanner needs. Wait for the scan before starting the allocation.
>   - Direct allocation changes $Bitmap without updating the cached free
>     counts. Update both counts and honor per-page accounting and space
>     reserved for delayed allocation.
>
> Xuewen Wang (4):
>   ntfs: bound the adjacent cluster in MFT bitmap extension
>   ntfs: fix rollback after MFT bitmap run coalescing
>   ntfs: wait for the bitmap scan before MFT bitmap extension
>   ntfs: account for direct MFT bitmap cluster allocation
Applied them to #ntfs-next.
Thanks!
