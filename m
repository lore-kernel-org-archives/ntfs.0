Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176383;
	b=yL3mtoexDId9D4BYYocl2TnUtnCUilE3xBM4k1s+8pChoZ5WCEhhJt12odFsZ0wC4sln
	 tP5n1YkrJuicSpfgsGitEx4HmfuLlYXgoL4bVLDClZCL7it5o8hV1lrHOHejBc1orkEyg
	 9s/d4Wsy/zqW+l8CwJMfN11wrE1XhZBfiYzH9DPibEe180OdQB66peZv2XvLXTxu85b4f
	 V7RRHtHPU8OnaG8bLJPIiJh6L7WQKX8nq4c5VJmlmhmHcgTL+dyfhMOsxoBNfO0z9//yK
	 Ho6eQFOcMoeai4s1v6Vl+a1kjyvm9P6o2lL8az0gmc3ogFHMqQakjNoqmfs9j00n9iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176383;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wadGAf9UcwNjDLswV81dAooaozmFOADl2JBBpwK0b2Q=;
	b=oP0fV8VK+QKdHDyHIJ0pJPv1t+VtywUCQtptW995l31LiYgYq57cdfYhLlcbHWSqrj9P
	 NkV0lJF6ohyz1ZlEk9lDQ5/5NhNgAJcV9yteom+cjosjgOWe6RwMbrO2/DmyVN32T/0kE
	 K+ONZucub+zcTzOM2Hu/u240dq5zcec1gm4o1n7djUjUEywk1KyETRmO8fWXdjt9XeaEb
	 auoPifmTjNpCzorpdWHJlsjsOiNT4dvkLuvFSaEJWCJYryJVfxrgE5jhMm7itH6vdskud
	 /x4vvlMcn28Y1eDSdZ6NPFm059wZjyGGw+0X8kHYKqB1AeoYAAADyKoIAyCPn+JcAmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6jIwzcX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3579606A320
	for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6jIwzcX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474BE1F000C4
	for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795176383;
	bh=wadGAf9UcwNjDLswV81dAooaozmFOADl2JBBpwK0b2Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G6jIwzcXu8OZxFa42inp+GS0NhhEc2ijyvLu81mcWJGMaGaL92XJRy+F4dY3fbFEU
	 pK4WjF+8NLBWqWABNDVOugEJL6HMfbnMt7CRiN7CCiXtN6iEA/lGrIaY4477v16PEt
	 nptSemdTM4JJygbtdiwuIE7F04S8RFaQt86WOnGUB8L5Q2aRlw/1ulM66Uo/W7qzxp
	 aiC7YjOQDXk2MWOYXBaBts1zFu3D1m+Hql63c0/LRIGrCDjHw5gYwZnUOD336dfnRj
	 uvwloCppn8fzDcB1Nj0qZdIQpkdIlB0G6FcE3XTP09w0B00pAffiFuIbUZ+d1midfm
	 lWI4A6WplwYmQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c51373ae637so124763166b.3
        for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 04:06:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFnGCDwZ3JGmz8fda0tnrhiIU32kt57tmV0Q3XxLqlc/q1ACCVTPf6kyDgHbWMTpbkDlRjn@lists.linux.dev
X-Gm-Message-State: APuU4Z+tCKveeutAZgGdggUMW+wi9kcC9xQiYUTpG/f/glsFtbUQVDxm
	2lJlOZPVbDr4qHvReC9NwREyrE/1Kc6NXZAprBWLShOcmOrh9prlfFj5rBfUDRYdQzvzfM67kkR
	bLvzjYzVpfU81XINnpcNjwnfGGriC0n0=
X-Received: by 2002:a17:907:a90c:b0:c49:9231:5518 with SMTP id
 a640c23a62f3a-c513a884ddamr277649166b.21.1795176381918; Fri, 20 Nov 2026
 04:06:21 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120005105.2718500-1-hyc.lee@gmail.com>
In-Reply-To: <20261120005105.2718500-1-hyc.lee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 20 Nov 2026 21:06:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_hM1EKZ8OGONwt8aD5=ntACOryCwQrn0UsfkoBSi=Rwg@mail.gmail.com>
X-Gm-Features: Aa3M54qvg-DrkB2LKHl_wfN0_MGOT0svHB0zdUBu5s3wh3-S9xHfRc6VxtxS2cU
Message-ID: <CAKYAXd_hM1EKZ8OGONwt8aD5=ntACOryCwQrn0UsfkoBSi=Rwg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: use kzalloc_flex() for FILE_NAME attributes
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>, ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 9:51=E2=80=AFAM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> Allocate the variable-length FILE_NAME attributes with kzalloc_flex()
> and use struct_size() to calculate the attribute length.
>
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks.
