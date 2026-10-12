Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238B65192
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 00:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791766202; cv=none; b=M9PmrBluQ87gA0LLWGDdXevyHLig0qX4hDCai18rC7Uqw6MK/ofxik6nyvxcPvZ5uatw8YUAKZ1B17mOnzDcHqZpSE6nOfHxHgTdJeacxQWJezwLa9jM4j2TQnM2uIMTM2VR1rYdqqx7AqfO3YWZw3Fg/nARzfsZSYaeWPzgG2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791766202; c=relaxed/simple;
	bh=UTsiobJzqDxR0bFFwFxp55iUFp/NDEWHqzx3SQiIz3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZ5VxSM0ppynA8K+K+TJE0tn6DUr8eN+bGg84rmm7mzfWJdtj9QP9luSHO0nd1JloFuIM7Y3XEeLyqch3gyTpRIjiw8BevoWEQZYzdI+F9Wr7lNT456NDhMV4VssYaBmeeREc5yYloa0Jl6QYaRh+EreB9d8WHq64ikm+lDku0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXqXhPRZ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXqXhPRZ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so568987a91.0
        for <ntfs@lists.linux.dev>; Sun, 11 Oct 2026 17:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791766200; x=1792371000; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b7HXCBjbd0eaxfFgbg/k4v/Vnkzyazq6CMKtLY0TiC0=;
        b=fXqXhPRZ9zDRRzLjfW6tdDJAz4XGyVaisHj47WNuiYUf1oGQQbNA8bFPKHcHZ/Reac
         KDxRJVOpgDQHnA4ZXSzsU7WYc78uohrOr8WO6KtytUHk7ATOvCcU1/bbUIElGdSVxFny
         +F+wUoCkFxE6V8oNelwMOqLAW8xv7alZYpUy2rp8MAEkaemc/dg7H0wu24G3Pspu3QoY
         NSs+gta32a2fRi9o+n2dTIxMM8gbTClKniEMhgsdamjXEV+MkY2y/8R1Pn7Mj1YvLHcV
         fSX45gaKTKH9QgpuBRzC2UcvA/5mFvylwvPLWlZacdhtw1B9NQOXYsCRAFltJA+yploG
         8b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791766200; x=1792371000;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7HXCBjbd0eaxfFgbg/k4v/Vnkzyazq6CMKtLY0TiC0=;
        b=w+T2Scw9fQCFr4NlEf+myWHce/KWAkqm/z2Uii11ak7zKD4ehCITUA25juAoduYjqZ
         Wa2cIm/VuOTeowDPGXIb09FcGM6l9J5PtSh/VGqhNAwOGrzEG/l8JIzWadNAzBN8CHZm
         T9ZQTWDZ0KB1uRMF1LD2+g/+RYjBOZkTF4JviTx4W98+UYB2ciWNNzphdkN5IExhEbiU
         W2y4Yt1EaQ9MjZr/rzMz4MGlzqf8e8gMuOOyRaG/4jYuWUNdIrXGhguCKrhahkkfnxCZ
         nKor8lDEVmSgc9/0fJC75GWONPGFHDFhYwYQdv1dMTBUxMJjU32smb3s4hcyAmVyKhe6
         W//g==
X-Forwarded-Encrypted: i=1; AKwUvBwSq5QUta4jwv+O4ICly9uW2B9G4FqTUtOz1DqfsplCeDg1FHGXb+1+txINJrmc+0QRgvfE@lists.linux.dev
X-Gm-Message-State: AFq9FYLH0GBwkueANCydvVFIe9NiEzSSLZbBHoqijnHWlmReVR9jMP98
	zJy0Jz2lsEgZEXemoEvd5ElNM/NjDtcTMo06Fr8XCruUvP7EbVzfD9Me
X-Gm-Gg: AYBFou2RIevIgbRSN84rnZSYK/KStvhzZm/F21ZetbAdR0ulWJ6hhfkPBUCeiDqEOyJ
	cNht/x/g8HNzkJmhIa920VVwrdgvznUold55YjmMoSRFHqwQFaEc2igOKlpXKdiVuagL4nVdq/y
	naQylpi+vhWe1hntKLgdJKbEikfoVLQ4ACxHQRr7/B3gR9Oj5PpA+CnG+FrxOAJDwoorX0MQ0rb
	qskosp2oWOBVpEydFV4kEtiT1iQ4nspO0msGqMM3V/hSkBWhpJyBWqR0hXiTPSzWymaVl+GhM31
	YgfRmaBIuRyqKl/3pGuczZit+J+UFtV548dzBG/VIIFbPzWIbd/TQH2mWyMMMIB0UnpQBlzZINb
	1K71Q/ZSek5Y/zw1NR1u5DJqlsZOwBirFtIQOEEmUMdYwyTR69z48ePFOu6mXPHDgBkdClW9pMt
	JGM8l59EnoVy3H18IrXS4JN5CjesnNMJCuAosYHS9OzXsttPIcVp9sA+lbhZsO
X-Received: by 2002:a17:90b:3c8e:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3ab3ae696c8mr5407929a91.51.1791766200345;
        Sun, 11 Oct 2026 17:50:00 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3371f748sm8775454a91.1.2026.10.11.17.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:49:59 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:49:55 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] ntfs: widen the sub-block offsets in ntfs_decompress()
Message-ID: <aswus4M5zs8OxMPG@hyunchul-PC02>
References: <20261009075523.3135206-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009075523.3135206-1-zhanxusheng@xiaomi.com>

On Fri, Oct 09, 2026 at 03:55:23PM +0800, Zhan Xusheng wrote:
> ntfs_decompress() tracks where the current sub-block starts and ends
> inside the destination page with two u16s:
> 
> 	u16 do_sb_start;
> 	u16 do_sb_end;
> 	...
> 	do_sb_start = *dest_ofs;
> 	do_sb_end = do_sb_start + NTFS_SB_SIZE;
> 
> *dest_ofs is an int page offset masked with ~PAGE_MASK, and
> NTFS_SB_SIZE is 0x1000, so do_sb_end needs PAGE_SIZE + 0xfff of range.
> That exceeds u16 once PAGE_SIZE reaches 0x10000: the last sub-block of a
> page starts at 0xf000 and do_sb_end wraps from 0x10000 to 0.
> 
> The zero-fill that pads a short sub-block then computes a negative
> length:
> 
> 	if (dp_addr < dp_sb_end) {
> 		int nr_bytes = do_sb_end - *dest_ofs;
> 
> 		memset(dp_addr, 0, nr_bytes);
> 
> A sub-block made only of symbol tokens reaches this without consulting
> do_sb_end on the way, because that path just does
> 
> 	*dp_addr++ = *cb++;
> 	++*dest_ofs;
> 
> and is bounded by dp_addr against dp_sb_end.  With do_sb_start at 0xf000
> and eight literal bytes emitted, nr_bytes is -61448 and the memset()
> runs for 18446744073709490168 bytes.
> 
> Getting there is cheap: fifteen sub-blocks of eleven bytes each advance
> *dest_ofs to 0xf000, since the same zero-fill pads each of them out to
> 0x1000 while do_sb_end is still exact, and the sixteenth one triggers
> the wrap.  A compression block is 0x10000 bytes with 4 KiB clusters and
> the fixed compression unit of 4, so all sixteen fit with room to spare.
> 
> Phrase tokens are bounded against do_sb_end and so return -EOVERFLOW
> instead, and the
> 
> 	if (*dest_index == dest_max_index && do_sb_end > dest_max_ofs)
> 
> check at the top of the sub-block stops firing for the same reason.
> 
> Use int for both, matching *dest_ofs and dest_max_ofs.  The narrow type
> came in with the original import and survived the removal and revert of
> the driver.
> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
