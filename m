Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6355C23EAB0
	for <ntfs@lists.linux.dev>; Sun,  2 Aug 2026 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785638423; cv=pass; b=ReTfphkosWNP7W+TJS4ysEnt3YNMwhNOIOVrLUVbET/tU2Ciiuw5P06IFBmt2TVfFY6Du8tErGjyD40G2Ti4kIlpnkwYsn9o8urWJogWj0qy/Bw8JBdqbTfrwqnGdwSv/aaQ1ujfDi5R11+IlvUrsWG05nL5TaXhcp3l38ZUb6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785638423; c=relaxed/simple;
	bh=dWYzkBPHjoRWTktMR28GquvCS5W2PfaR5W+p3DMyDjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IuCS4tUoVCdCKUzo0cfBO2JMq1+bzzoGsVtu76IzMm4l8t4qOKTZUnft8SzVKfDUIWQspyzuNoLbp+62bHpATeJuIFlSD8cWAJRKYnHFUZeMStMCyknm8LyO+3Yy/XEZz1MXhI/G43dLh+m6b9gFvm2232dYrWPztNgMmp4cCPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOneMZ6D; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOneMZ6D"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so2217589e87.0
        for <ntfs@lists.linux.dev>; Sat, 01 Aug 2026 19:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785638420; cv=none;
        d=google.com; s=arc-20260327;
        b=Mc/oLwO7BtcyGlH7ESqiKW+PKwu4HyiRSpUXNaSJx2MzumYGUdlgrvChckKA2QUTln
         BdbyIgCGTzNK3yPVOY+5UPODzO1Mi1PMfwmTrCIp8SmBDMtyvgsYJlbFkQajpzpFPcWy
         AUYGWYvnQU8+MvvYpB2Hv4Uwig/mfcTlYkcJxHbnSLh7TTpWiUjsebxwyQWkdWmGWymf
         FuOeeyAHoeHgBrVCcZsljTqQQkSFcjud6aJuPUkkVWagGxwwxM/HiK6D85j3mChilclg
         GOmY72LzKcL9b/JiPPDBsEY71WwIK1g7Mei8eWaw7WUtQSiIBXsPoHMSN3qon4QpKPf8
         nYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jMqriKZrmU/aQM9SZtLPb82GZ5/DQwM7KJHSXQ48bRw=;
        fh=msxMZ6kEuMy61c1HjmZNkacC5gZrb9Vj8Fz5eIfaJy8=;
        b=sRg5ogDT1mPRd6rrUfNRHf55QW737MHeZ05s28juqI0kvsR/sTaj2oZbaOQJowI4hr
         C9iJO4oysROED3CP8UNqI4Zt9U9zdCu+D16PsKxJoG461Qfnqoqpv4jo7JwWGfKtIiph
         +Ipes7em/umFpFz8oeK2B+veNB5U8OzPWvWvan5u/eFW0Kl5atL1WibiAKjDbR9MYRD8
         V7DSEU9IGVxlg4rg0x3cPj7tXupWU3sKm2NsdyeyQ+Z4NtdqsQSFxxXqL0cMOpJXBFK/
         /krgJFKRYoNbVxGeo+7sfVC37x2GZHm6hIWYpgAHuPiu5uHVJ+wT29V7Ae73vsTxtTgf
         1xXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785638420; x=1786243220; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMqriKZrmU/aQM9SZtLPb82GZ5/DQwM7KJHSXQ48bRw=;
        b=UOneMZ6DLSHqmnx0ktxCh0I/SKUeAwMhF9NRAJNbdgfM6h7lk+g8ajQWtCYJPxlXpQ
         4pnpmLalxwF2+qrD1USef5eJ6BgL1dlcaYIKBq/Ser11xfB/L82s7PQDO5OX+ZX5CDcF
         apWIH1bLAQ/AgKGfcigCCWPPOwLOGWvKWa8QkEXvdlLf/q8hM/ZXCYDNg71GnA6z+pmH
         4O1x0ZvbJrUODD9Ag2RNWiyt6Ha/QK4OigsGl/P5n3EVb+KKo/q26Ds24kMniSoqM/xh
         +jaHmvz7yP3tkTk04mgzF3cMaqkRaA2Qd6BMlK8TZZ5jq1IZ/pDxCaPmNw1BQ3cMjyzd
         NQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785638420; x=1786243220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jMqriKZrmU/aQM9SZtLPb82GZ5/DQwM7KJHSXQ48bRw=;
        b=cFJ3W5OS+n4uNqF7mhB5S9RAqpQNDxSjKMkKEnRT7WJDr7QDecEb5XKedhMVkwOauN
         CuaiR7UYm4P5kreRpLg5AZ5nLrDRvyl5s2wL45+3XAaxpHXg/TFJluS1LH9N0Fmv6h4R
         cq3WNlkCVn1WZU/AdZdeF6ZXfJbB7VoJDrsoXe15OgWannsLfmhhIg/fPjU1C4SdWKs8
         UzEw879N/f52b/J6huOsLoovyUaH44nV4QJw4CeuJ7WXZrIU5No6hKJ+3DFxrN2QAGHK
         FhkpGa5F7lRVmEFFvLPU0UtxlYLYVy8dkyMorkOMxfZVKYfbspBX5ADoxe3rdhv7tfxC
         iycg==
X-Gm-Message-State: AOJu0YzFvA5G4nZWcVB1b0Rg+XZOnLvfpx3xW5N4wbj5QwUyxOymtm4k
	4X0Io3zztA7z6/mKS8iQ7jDY2Ck13L2rfGS3FjtwNhshL6ITtPFDl/mOu26G4mYEPfeKNGfmctu
	zg3fhqL/ZIY61WxJsroVMajgmqUScORw=
X-Gm-Gg: AR+sD12GrfIkIi7z9mbw+oTZA4baA1+3O14SbdbDbbslbwmuiWiDkJNl5SQASVng7uB
	4ePoTzNKlR0kSwVtBXXsZX88APPeZG5q3NEHAse4A88Wa76iaLMHBIrP5bLWGLekpo6tuOM/vtQ
	FGYdGL8rMnZoDdiWwsLN4q8jfTxxGUGcjTHjhNiZSjCzZ6l7vqfoQ29oN9uFSIGSgFrupipuhWo
	hJGpmakzEvsxuvVVc59mzKMC1Qtgg5VQ/rSWTX7yNb42KgngV3yT8j4qiuDKNC69jDVQxzu/DhS
	kcWXf0urZcUY9lRmqOGEUlqeENqL+6Z+rHpB6C5FMK/UAg==
X-Received: by 2002:a05:6512:10cd:b0:5b1:59ec:2452 with SMTP id
 2adb3069b0e04-5b2e4f1af20mr802759e87.9.1785638420093; Sat, 01 Aug 2026
 19:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729110036.12129-1-linkinjeon@kernel.org>
In-Reply-To: <20260729110036.12129-1-linkinjeon@kernel.org>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sun, 2 Aug 2026 11:40:08 +0900
X-Gm-Features: AUfX_mz1QryY1YiO8B-7V1ridiP1cPu51EZnnD1BpsBy69qUokY6kOuLPiyUdPc
Message-ID: <CANFS6bY95QuokT5bDLnVTkHbJt_jwzS9jgBSp_rFhMMZp4+p_Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] ntfs: add ioctl support for named data streams
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sebastian.n.feld@gmail.com, 
	cedric.blancher@gmail.com, Lionelcons1972@gmail.com
Content-Type: text/plain; charset="UTF-8"

> +
> +       bytes = ntfs_inode_attr_pwrite(attr_vi, offset, len, data_stream,
> +                                      false);
> +       if (bytes < 0)
> +               err = bytes;

offset is u64, but ntfs_inode_attr_pwrite takes s64.
If offset is U64_MAX and len = 1, pos becomes -1.
A resident stream can the reach memcpy(addr + pos, ...),
causing an out-of-bounds write.

> +static int ntfs_remove_named_stream(struct ntfs_inode *ni, __le16 *uname,
> +               u32 uname_len)
> +{
> +       if (!ni || !uname || uname_len == 0)
> +               return -EINVAL;
> +
> +       return ntfs_attr_remove(ni, AT_DATA, uname, uname_len);

Dirty folios are not guaranteed to be evicted before
ntfs_attr_rm() frees clusters. So invalidating
page caches seem to be needed.

And we have to serialize ntfs_attr_remove() against
other mft record modifications.

> +       case NTFS_STREAM_OP_WRITE:
> +               err = mnt_want_write_file(filp);
> +               if (err)
> +                       break;
> +               err = ntfs_write_named_stream(ni, sname, sname_len,
> +                                             req->stream_offset, req->io_len,
> +                                             kdata,
> +                                             &req->bytes_returned);
> +               mnt_drop_write_file(filp);
> +               if (!err) {
> +                       if (copy_to_user(&ureq->bytes_returned,
> +                                        &req->bytes_returned,
> +                                        sizeof(req->bytes_returned)))
> +                               err = -EFAULT;
> +               }
> +               break;
> +

We have to check NVolShutdown().
