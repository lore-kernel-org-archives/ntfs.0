Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750960;
	b=uG24ZfpBdaXNWrlinCzCkSRC3A2vhhsbVbfPxZnouxfeykR+rxeEZ0tA5ZcHeyQ9I7Fg
	 mVAGcLtpHMDzlkWHbZPjFeWhkDdvp6AP/N5qiDGNDCYmgXBc35AKHCxJi6RsSizd+Culz
	 BJguXQuWXkf0tkFc1CCC8ey58UQtnRKkZADNlUjGm7lE0lP618QuRLerQYHVdfC39XiGP
	 yDi69UgHsFE3EfQUjVzKwAp5usHcSMAoYZwPcrsgVQlukPP37kido6MIX/70pSSMVcvov
	 8fr9aXjhFXm48EZ0V/phYE9jp7k2gByPRFEtTey7CWxNaq+TrPHYXnVN1KwiaBQ48mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750960;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hAp1f5HJymx1C1eLBNtpgn3RwhEpebpPxR/1OejtNF0=;
	b=0bvmfST5tiHEhmTH7t8SGvoGU8/N62wufc5jH2+bUUJM0GfIOgQIny7cZrNzhbBc6tZy
	 YR5EN6WMXTrXeuqZ9Gv8vvLS4d2gQ5UJBjKPSM1c41oDRbgeR+lAIC/K5wuYfUf/0GUYv
	 9CwYPO4UWl6fsJsUaEUqJGnlitoK7d1FbNLBFc/Xxpc3E5KVRF/cPKjRPdIa08wxrHsQP
	 pI+o5S7I3CWlAYpiGzwUtNMvwCP+EIRf3/EMOcmG0hBaH8CeyZAlnTkzAN5OVMm1l6/LW
	 50RNAPATVAStwl8bScC6GDM9Aj0N9SGP687I7NayCaPyUZp5WF5s3F6rf679t9OkyZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XsVqAIWj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE566606A31E
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XsVqAIWj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754FA1F000C7
	for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794750960;
	bh=hAp1f5HJymx1C1eLBNtpgn3RwhEpebpPxR/1OejtNF0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XsVqAIWjC4lXMDgMwr/kFUj5/a6++KNyH7YKRVm0ZEkKu1Zh3omRmhWW5xyLZS6L7
	 zlPvJVzf0aEwvM1FREYrv7XutE7sCtUg5jEjD7PoO2Jh2QehaPebInvjUTlNMDm/Q+
	 8xDubh84hs/1iNiQWFAheh4CoIZvkJBmfMP056Y0s09xMOceLaO2hHCsbQ8u8CVfiw
	 wXILBB3jwSRHBQqQejKF1y8t1o9VmJlpgztn2hV/TBX7IYtjt5wg2Ml4aG/HCjzrY1
	 xh2MxG6pzN0NBtU9FXeOMNTt0aHYvn3ej6qwcVwzmjv3Va8c2UdJs6dQx8PR/MS/lu
	 Y/ARWUHh4tbFQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4322d310e7so507869566b.0
        for <ntfs@lists.linux.dev>; Sun, 15 Nov 2026 05:56:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGPzybXXrrwnH+zpN6zsOrpGAgQlDhTWttxU9Ik8ASj0hWqD1kinXwfOQ2rJJvqjlTOw9Vb@lists.linux.dev
X-Gm-Message-State: APuU4Z+1KrQbYC6Dpeghtcy+7Fu+a9ntcay54RR6FZ/yX+56J0d3SFSM
	owlAohmNF8dT9r1W0Q9ImvVkj/oy75hmgKv9xoQAJ4sQUg+opRpE4/DtP/+LnYcfa399bAOfZVW
	c4iiKvr88+o+vHqFNepfzktzNgIbAVG4=
X-Received: by 2002:a17:907:944e:b0:c29:22cf:b0f5 with SMTP id
 a640c23a62f3a-c509634ac8cmr630049366b.33.1794750958896; Sun, 15 Nov 2026
 05:55:58 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112134041.4133634-1-liubaolin12138@163.com>
In-Reply-To: <20261112134041.4133634-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 15 Nov 2026 22:55:45 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Zg6Qy8vyu1tOXLn387R-1KOVWnuv+Z+y6=_E4so23ig@mail.gmail.com>
X-Gm-Features: AclHuK-NDR_thR0DehYI3BeOo38-z7P-1doiJEQQKyLyO4Pxr6t_QdkIQXbmVn0
Message-ID: <CAKYAXd-Zg6Qy8vyu1tOXLn387R-1KOVWnuv+Z+y6=_E4so23ig@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: add Baolin Liu as an NTFS reviewer
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 10:41=E2=80=AFPM Baolin Liu <liubaolin12138@163.com=
> wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Following Namjae's invitation, add myself as an NTFS reviewer to help
> with patch review.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
