Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270150;
	b=M23smOY93XXO3SM5t6P3ia52jIGJCea6WYQD/qG06a1mcY6Aa7YZ7kt2eWGAW2g5SRZK
	 oszWFmec/S7ATU1BCP6aPriiXwXIsPLnrjf5JAnCtz5R4lNP/MSFuZ0SrsSrJyc1xlHJB
	 +Jf1LnpB2xWqCw2ULRd6sAIDxXs1frXB/rJDDsYtKyr6YdzQ5iKzkN3XSaj7NP6vq1BIM
	 okaRcw7A405wstuB/UdJFWYLjp3vhZQvQuU5mlBtyCJj/rKvd/yKTUZRchqvSnDcfN+dC
	 gTdBXoKIJYXPWiFG9Bh+lwG7Pr0zIs+nJx9QsPWapvPIb8BseHUxhXjEfRdLxTbNreg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270150;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vHYiioNpF1NGJmY/P1Pd4vnFnoPCtbj+gizOvrXBmA4=;
	b=nh59FNg2o6fWkGDS5Tx107kjTohLg8SQAcDveVyxFJ4H26pPnmV7FOjTRpkDbXhOD71g
	 NYj03t8BJVXs09DUpE+HJjqHZ3vawEIChFEJ1I/RM3MoLvCBiZCKE836dnW94GH3fN3BG
	 aKH26pg3EbMjAV8Aelrl2vkWZeG9yONsJypWQqL1GvGKNBV4vQqA9kQqdEdKowtQvtKuZ
	 8zPBG4/wurrg/5gqfVIF/4b1lXFbWUyM8uzUOEDMBZQ1GYu1eYH2ZSRVj1TUXRpXruhc4
	 2ctImb5xLGh2Yybwz6FpChpCR3KDjUZ22BdbriY6Hgv34NzGHOzlUeRryqEd5aHQ4ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLlJPcLw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E01606A320
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLlJPcLw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7D21F000D2
	for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 14:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795270149;
	bh=vHYiioNpF1NGJmY/P1Pd4vnFnoPCtbj+gizOvrXBmA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oLlJPcLwgUqmyDuXvILgBFW+uggSg2a39l91Emz31qIlaR9U6+GklY5Mmp9REhI+T
	 rmFtBFSxfpviU2jyA5BlyoTn5DqbKMKzKgCNsImL4dekaZqQAClC503uFmiykI25v9
	 Xw6ymwMADvVwMh+Jo2RgqO/Oh+tDnWLIKCSRa0wsBXASuKem9BE8cDojeRm/KNryxF
	 Gyb7eZz+SLal+kJFFmNwlXtkMOXlX5VcEow98PRdvPu0MeACMSH0vHYkLRahYyADn7
	 kUfLDWrqie0SQLjWRuqdk5H9pvmQ3clgQN44fkqMugK+OeK6XS444Rot6ZuZacl3cl
	 /zjPcytSvFJMg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so314526366b.2
        for <ntfs@lists.linux.dev>; Sat, 21 Nov 2026 06:09:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHVYvs0y9mzcAfiLHWXs0GBJ3GcBhB9eNh3K1wRDX7TUwimPAJOeKpC3pxU4LIALvyXIE0b@lists.linux.dev
X-Gm-Message-State: APuU4Z90VOI+8IiEhzsApvoAT1yB/jtAk2P3fRLhGnQhOqCnArs8uYKz
	vWu2I1OAf3m8qxqq/d+Stc6KHPt7VI5eDdr+6J2Jb0AiM6XXQCls3+H9ZTihV/h37iiU23wrPZV
	dIPMrvocIsIaRbrHFxDDvG1gurCjHI8c=
X-Received: by 2002:a17:906:15c6:b0:c40:231:6eab with SMTP id
 a640c23a62f3a-c513a5eaa3emr444289066b.16.1795270148311; Sat, 21 Nov 2026
 06:09:08 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-4-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-4-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 21 Nov 2026 23:08:55 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_-uG6Y+h6-=xkCBw1E24fSDAFeAWzKuK4qSm7Zr6g35g@mail.gmail.com>
X-Gm-Features: Aa3M54oTJdzV2212nmgx90b7obSSvWMrC6fRe-ifuKwo-NflQJbozIao4xW-XkY
Message-ID: <CAKYAXd_-uG6Y+h6-=xkCBw1E24fSDAFeAWzKuK4qSm7Zr6g35g@mail.gmail.com>
Subject: Re: [PATCH v6 03/37] ntfs: handle source record removal failure
 during attribute moves
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
> ntfs_attr_record_move_to() ignores failure to remove the source attribute
> after copying it. It can update the attribute-list reference and return
> success with both copies present.
>
> Check source removal before changing the list entry. On failure, attempt
> to remove the destination copy, dirty and unmap its record, and leave the
> list pointing to the source. Record both failures with the existing volum=
e
> error bit and log messages after releasing the destination search context=
.
>
> Shrinking a record to zero needs no extra space, so failure indicates
> inconsistent record accounting. Return EFSCORRUPTED even if cleanup fails=
.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
