Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7553456DF7
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835439; cv=none; b=dSHQ3FlwmD5g7vtxdUeVhffDR0S3ji/TxJn3swrE5HqRx+sw7c0AV6/qpFxFnQs3G4TYlWIE0RziXe2KB6H4xIMuahc8ujh6zHpeLIIL2yDa3c3O6I0rn5U0MpU2OeQ7nCqdckvo2+Q/6AThHYvzrBNInZPSERMDApiq9qVMrUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835439; c=relaxed/simple;
	bh=iF05bV+uBP8E+RNzKPFNTuiJqsAqU249j95ePCSKAZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzkFLTq5JI8X6QSVghIep2O6iUlBVcwVAsxTX2zjoBnGwfBJFGQnuQmp3yMmGShsvufJG5f1bO3evbAPLlrj3XpzboqyuJ4o9BmTF1gqVhqKNq6m4fC/8NYM/PmjjkqmuE7ruddaaS9KKWM7YYkGJB4L7/mQIMMGn4dAESSmRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+tQom7H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+tQom7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD261F00ADF
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835429;
	bh=iF05bV+uBP8E+RNzKPFNTuiJqsAqU249j95ePCSKAZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I+tQom7H8f1iFZdWfhHmTFqhJ2gc3EpS3IslCSnzCMDYzBTHaIBrtg901HEf2Y6lS
	 csyoC6WOfWgAtf77bjqZB2bdIdcHjA50wu27DnqcqzcifQgLh/glckPfkrnSenQUcm
	 NK77e9a2l35z4dqxiVErATTDeZ3CBshbdKBJdEu2gj0mHwFzvp9OX1SY+c2rUzr1GQ
	 zPeONg7VIIseK6HuIPeDTYgVvzUXq4RJZe4dFJFrZqR0/bwItHd8c0a3GOnPMlQhaO
	 /XeGHn/d+UsljYKctZeNV99Nt3agbjKK8m/frqYUfobO9iLS2VUkjJj6Ur2WSTFTo7
	 8tBLKXOGXTZGg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c253358b121so90662466b.1
        for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 05:57:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq5Y23FM7CJtvyy/vxXdyUDXw6zpHgAqSQqtOQNk2iYcfVLt13v0MDKuuSjJabghTJJhl3L@lists.linux.dev
X-Gm-Message-State: AFuF++mqbmeogSCGNy6zpcy2FAcawm61/d2m6RkBojN3qwUvzzEXZD3E
	CnOixiaWUlWDm1J/Kod+48arPT1uLCnEnNM4vlEGcMQbqVE04BaV8PSt9V23243hSdWZNyzl8De
	mgsnHxT0EbnsS7G1pUbmLmcc9QaKDNkk=
X-Received: by 2002:a17:907:6093:b0:c08:417e:3696 with SMTP id
 a640c23a62f3a-c250c318ec5mr1442235666b.20.1787835427955; Thu, 27 Aug 2026
 05:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827064317.2252884-1-liubaolin12138@163.com>
In-Reply-To: <20260827064317.2252884-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 27 Aug 2026 21:56:54 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8khoiBJ-xawzVTnRTzhzBE2Vu7XR8MOOMupVpGcJHxKQ@mail.gmail.com>
X-Gm-Features: AcwNN1WqYhpuYqE4RwQQa7iDJ-6rVTINrAHJdSKeCz51rNhDqSr1_-aSQLTvL5g
Message-ID: <CAKYAXd8khoiBJ-xawzVTnRTzhzBE2Vu7XR8MOOMupVpGcJHxKQ@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: leave HasEA flag untouched on setxattr failure
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:43=E2=80=AFPM Baolin Liu <liubaolin12138@163.com>=
 wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> In ntfs_set_ea(), the exit path unconditionally updates the HasEA
> flag based on ea_info_qsize. When an error occurs before
> ea_info_qsize is updated, NInoClearHasEA() hides existing on-disk
> EAs until the inode is evicted.
>
> Only update the flag on success.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
