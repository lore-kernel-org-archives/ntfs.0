Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270120;
	b=DLaM5qou/x9DD2951Xvha0MGxrOkVaTh1cWlZ7a9AYnaDQeUue+41v+u7K5Q+bMeHMoD
	 2stZpfAwqzo45Uj3wjJvBDAphQBh7afdg+dXMB17XkjNbmA5pTmqqu9Vf6mYMKbztljD1
	 JtjH9ZCcVkLwCsL5OB0cda7v1rMQ9RGklRd2AzsaSD1yvG0JI7/HhPeO0GI6nE1gK0F0R
	 VgkBq/ETc8K9tuBUOaqUyw4Gx8hhAk5U66PTUBrl6hmHeJ+Er8LyW4LDwaubRtJljl7jD
	 x9zVd0Kd4YvxGoGzCKLmBI6xE6N5o4Y2vJ8rSn0pR+7nQkwOa6y593ARWUUgse+cY1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270120;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lnGVixuqfweqtI7qRoDDqh4cI7BpQx9TnUNrQEVGbGQ=;
	b=0Pis/FHsWZLv9c1/2Irwl4/qnZi9smTZjT1lkN15DnEMLKKUCQxVClS4XlT4D2s53164
	 tMFQpfKD6OvDbvI8kEoAl9HJXnFZKjokkZ4srp7KiBrm0Y/OiZFeTGfNpUYvooMZ/8AVS
	 2C8U9AeFDE8b9oRyENBlrk4g6zD9I8Z9KKdP8T1TUAvyQDBSEIL8fgYDJMoZQRFpaoPBd
	 M/Sk0aMxFZyY3o0MCkzcZ1y36yyWOlD2kYhNsJ5aKVlT2hpPL5gNjC9tu330lUq4SE9d/
	 TRp7r/uSKr1G89aRQBmxa0Q/mGXpBf15gjK0hsH4naZF4nTzP8Zsw1/AZN3bHkHxBrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gYC6W9OL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABE2606A320
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gYC6W9OL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586631F000CA
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 14:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795270120;
	bh=lnGVixuqfweqtI7qRoDDqh4cI7BpQx9TnUNrQEVGbGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gYC6W9OLxGt1XT5SdWLeU+nCBg7zorh8Q6gJSM1yh8p91NjEFQxcwD0sfeyX+KKkC
	 PdyhV4hpIAh/a3OTkmLxiudZCMBtlI1+BSkZsyYuk6fBmpJBvHuElSj9TtlWe1XPCj
	 alt8ge+tS5EBgP5pkqTZgWLN4Bdsa8pUS145Cu4uq+x/yvMeO6807fh+fUFuWpvd3y
	 LKQAJ7iCvh/5n2SeQc+tSAhLWZgLbxFm56ve2I65uSNcOhjfBbY7lDetgiEf10igKq
	 Zq5kVlBv7kd34lBVWbG2dTr8pYoQCbzw4ET6wB9UNCzbmGDxkvsGoc47phP1uuCvax
	 Ia+cJJd+7QP1Q==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so251789566b.1
        for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 06:08:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF1biqZ/BnerFMUu/XWgsGCR8Rgma0xJ9PLagHOpmCyMQVPeuHp9p93HbQ9KxVk+R4D2rdA@lists.linux.dev
X-Gm-Message-State: APuU4Z+Z6/9s5CQ/ekayeIqIW66rA0gySXKIIwyC8qi+tWoPGq8hQITt
	6rK2iLh53Z7HxdWXaUJNYh7mSPyurL7/bc6GorWUXl7RcGfx3p+05PvZQ1SIibwTRvcJIqxPjuw
	ODmcc+jBfNvSkEr5PILWr/xR2ra3rnwc=
X-Received: by 2002:a17:906:6690:b0:c4d:167d:dcee with SMTP id
 a640c23a62f3a-c513aabb216mr429989766b.40.1795270119029; Sat, 21 Nov 2026
 06:08:39 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-2-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-2-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 21 Nov 2026 23:08:27 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9LELh8vZnEEAH13UekhS0tSrXu7rQx-X69fNuK30xjgw@mail.gmail.com>
X-Gm-Features: Aa3M54pWdiCG2Z8XXtJp-AtzH0mAkYUqioKQikR3KMOpN2YjwqtgKK5EYX24HFg
Message-ID: <CAKYAXd9LELh8vZnEEAH13UekhS0tSrXu7rQx-X69fNuK30xjgw@mail.gmail.com>
Subject: Re: [PATCH v6 01/37] ntfs: propagate mapping-pairs update errors from
 inode writeback
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:07=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com>=
 wrote:
>
> From: Xuewen Wang <wangxuewen@kylinos.cn>
>
> __ntfs_write_inode() overwrites a failed mapping-pairs update with the
> result of syncing standard information. fsync() can then report success
> while the mapping pairs remain dirty.
>
> Check the update result after releasing the runlist lock and take the
> existing error path. Preserve the errno and retry handling for ENOMEM.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
