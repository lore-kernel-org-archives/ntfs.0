Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225437;
	b=DdNRYvt2XsPv4vtu+3kMbe6RFx1uK4s7WEmGyYugSo8dW47Ec2a3LWmXaYkWe7Z0pVHQ
	 DnMHwr2bJX8GXtbIvdHtNOJCWAzIw+s/MhjtpX+lvuRcc1752h71OA7F8x8m7IRnyZHDy
	 1VttuErXimEv6nQwYGUs5U/O9O5SuOA+wCgHSRhQktkQLawF02dfo6Hh38yvrWRXVXQ60
	 l+aFNij5qi5mOCWuiBxh1rxB/vzDjK1ntLeDqQxvBOGQW5f0Q5UhljlY5hCrCW9QquOLc
	 xtlxIt4P9ef8wcL1RJSnqBKrm8gOBZVO0e2q6kvpmH31yx4P60MpSB9KiKySJxkqSCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225437;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IZHBpmYgwg2uHcAp2EVwGofB3o+jQ8LHJLT3ugevwxc=;
	b=4Mib368lXeQ7tOT0nCMvpTKpTYihpX+t5KswFqVm4EnKg1h9Cr9bwp2LGAJri6uos3vR
	 zf7xtLKjWovzQTEwpPE2PrYYw9UC39oHCZmupVxQMyO+xeb8FM2GDwknn9x6tnNVNbEcu
	 wHWa6bvx+xvpqz5DOE83ohk6R7MjrIp0CMQLS8TpAYjRiIsxm3dZYSKwT2ReYeiw1l80R
	 8D3ua80HtV9Z3cbVhEOp7hog2iL+1vNxI21qlhFQ/0YXGpQvlhuaUgFtmCeoURM2I1+gL
	 oNsmdUJxocB2PrGsL65SPWbjyuZo3vxEFAk+ut4uLYi6+iqY857ZGPsuzPb2FdqsYGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFm9trbG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7A4606A69C
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 01:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFm9trbG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B31B1F000D1
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 01:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795225436;
	bh=IZHBpmYgwg2uHcAp2EVwGofB3o+jQ8LHJLT3ugevwxc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aFm9trbGR1ttSbNewz/MAIEVl2v5cjfdDYKiyeGDWaDt9zYxg1ZFQPM+BfCDY/aKl
	 yDXfd0n9dTenoorzPADsFvbz5T96kpXTvAV2KE3v8/RwcRf0bfRi8SskaR76tLMMgc
	 cNeH3TbCDM05WCXybXi9AKAVPi6qVoT9Sgk3lUfMSJbK3e95wjWTM2Zx9Z8qecu/fF
	 qaMOMbH3lhKYzxT8zfh35uojyoxtLlH9jhVS+w1phhfhF+VHHPsr2lb7H/xUfH6qJo
	 irRnFU3Sw+zeD5/eoJn6D6ox0t2Uyy4x//lC5Zv+BPnzw0TfN7GV4S3+riMIYNjjSW
	 R9rbNfqsyMHbQ==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so2117958a12.3
        for <ntfs@lists.linux.dev>; Fri, 20 Nov 2026 17:43:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGVmheUOIC3QQQ5X6wNtLngqGDDmakqktEF3EcJu+jgSWSGOVDX0XgsglOJHz7nem9liiay@lists.linux.dev
X-Gm-Message-State: APuU4Z90XyrZvawdpHEP7zMqrrk1aSOr/NpJTxlfo7phJh8HOSUlm7ji
	hY5oFvdEVuRnzaJ8XE1flOs3aCSvPhpg8Qw6q4Mqyb3OpXhl4loFC+IHoM3of+zHyd9bwqN8DCG
	y9mwr5t59YJtFTZ/DqEMbe32ZunO10pU=
X-Received: by 2002:a05:6402:1512:b0:6ba:12e2:46f2 with SMTP id
 4fb4d7f45d1cf-6ba37d18d2emr2899334a12.8.1795225434798; Fri, 20 Nov 2026
 17:43:54 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120155021.1618964-1-liubaolin12138@163.com>
In-Reply-To: <20261120155021.1618964-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 21 Nov 2026 10:43:40 +0900
X-Gmail-Original-Message-ID: <CAKYAXd97DoyU_uorCoM1viB6T=z14t3V21gXehBg9gDL_b4SRQ@mail.gmail.com>
X-Gm-Features: Aa3M54qJWxRShaBRDGyYV0K_jGwemM3TQK7CLamk1rs-YxAipl2WbAM4lXns4n4
Message-ID: <CAKYAXd97DoyU_uorCoM1viB6T=z14t3V21gXehBg9gDL_b4SRQ@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: limit MFT mirror comparisons to system records
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, d3nchk@outlook.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 12:50=E2=80=AFAM Baolin Liu <liubaolin12138@163.com=
> wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Windows 10 can leave $MFTMirr records from record 16 onwards stale on
> volumes with large clusters. Comparing them can falsely report
> corruption.
>
> Commit 749357bd48c1 ("ntfs: mount hibernated volumes read-only regardless
> of errors=3D") made these mismatches force a read-only mount even with
> errors=3Dcontinue.
>
> Limit the record checks and comparison to the first 16 records within
> the mirror, following ntfs-3g. Keep reading the full mirror for runlist
> mapping and location checks, and leave mirror writeback unchanged.
>
> Fixes: 2beaa98b46c4 ("ntfs: restore $MFT mirror contents check")
> Cc: stable@vger.kernel.org
> Link: https://github.com/tuxera/ntfs-3g/commit/85e208176ffd16ce9a51a9f534=
b194f0ebbde6e3
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
@d3nck, Let me know your test result.
Thanks!
