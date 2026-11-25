Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592362;
	b=I/xuzGLGsDKgA5x1UQhLVbvc3Xm12wCfuHnAihAoCn3T4y2vQdRtT1yFp8Znp9nOp3Kk
	 YFQfo2xXn1NYLoHdFELeiRCSHQrXzuprBhDSQQm5KSgvLokSPTGozHwjcRA6TgASOzQqB
	 kDZa9XJqwLO7mxsLUxWfV49eFk7GsTHQbWMid7ODnUxa4N2ZRMHJ/10/J8ilF2h28xOdP
	 D6T6dC8oBoOUzJQfR7JvH7QA0g/aZQUVnDEAwCFQH/KyqyjVJ0Wrl111YkUkm5FyHw5A7
	 GvlRWiHtuXmDTwWdl6jKeL2g1x7hBDA+Uer6hZX7cnwua/FrMJsRK90X8waeIWzUsJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dOHKZmJkLbfNeehjlbbga/iwsYv/QQNH6/EI/5MjK9o=;
	b=1TyoQX19qteSb5upifQFHvNyBXY1Wv3FkkzPJwt1hNa7HTFwPF85jHqcGcJZFnPcyOUv
	 Axxkv3ZdW88105EYajqwOYw9abhtZW9b98N6QQLvZt5W9qxhyOOXhzOap6lh2Jt6hRkuf
	 NIYpF34QPWR2fE/qDWxXwsNDDz6IyCO5UZNlJLoy8QcxBxmH66lS0oX5h3UQFx5VcFPxY
	 YLw36dC1M/JH4OKPsVwuIS7WAdioe5PO3tvrV6D33ivuwAto5aC3nNtdBqaH2kJp2sOqO
	 9eA4iFEyddQohUWgenEd1xw0bw5OPWIIvVCgws6N/CGjcgbqYfQXRBEMXFW7MtQYuNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN4I3oWL;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56417606A31E
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 07:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56417606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN4I3oWL
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2554483a12.1
        for <ntfs@lists.linux.dev>; Tue, 24 Nov 2026 23:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592361; x=1796197161; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dOHKZmJkLbfNeehjlbbga/iwsYv/QQNH6/EI/5MjK9o=;
        b=RN4I3oWLbuaqosyuRGfXpxG2lorfAFwXofz+xCDHlsIG7gnaMiALJsl9BSvgZVf/MF
         H6r0t0BTvK5vfGcU8EUvER8D97VhukmG4n3bOMaCC3qn9T+a2YiPZjUH8+h5QKa0oane
         3ali+thmFAmdW8TTVZxlfgMbgGqmKSQTrxJDWLvMwUtF0RHfMIe/qVa/2CwZU69ldIeI
         AzzJZ7+RKQU/2ROygDamnzLw0nVeKIbh4aucgz4Xh9LAnkPkXN8DblxDu5NQl1orIm9z
         J3eSQH0JPiV5VJkU0aIYGVAo9/7//A5vRdoZw7ve8MafTooy74NazdC+mZ3qIkOpbm1+
         QOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592361; x=1796197161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOHKZmJkLbfNeehjlbbga/iwsYv/QQNH6/EI/5MjK9o=;
        b=QSRXpin5VUrMphhwIveltuzcSh/YyH3b0tM51hZY5apyeQPEJEnWLVVBxbjOwklxCQ
         /2ObSOVJm8rljMKlwSBcH72qsrCkH3pjBvVBrxjFcrCZExg6QJ1+27VLrTZrtADmV6xU
         DFpf7LGWfEfJQH1CpeFwqhj6ruPe9Q8QS7V6PrGQXHOf/N2K90YThJdUiOuSlceACfzN
         SX+GcY6Qm0feXdCawIlgHHf5s39zuQq/HjCrM+GshP9JMz9XMr0apxSR4F9YUO0fjXUc
         VxkSMkCgwTBGoH1oTmltEA+fMwR6zpvVAFq8iwVNuXVd0GQl//2G3frqquqv725Ik73x
         guEw==
X-Forwarded-Encrypted: i=1; AL+hErFiN98UEznzQQnt0WJZmr+sJoWwY2H67WBNa0YtfyrXie9VzfrEhuKdOtMrVbiNgCiaXSOn@lists.linux.dev
X-Gm-Message-State: APuU4Z96WnVoqsdHM3oiD6N1p818cR4AXogbqg/AIlNuAjOXzP5MugmB
	qC6aMBWpX5VoZFJe4QLjtK201VJy/tFYWc2rMjGr6BmfrmwF2TWdGCIV
X-Gm-Gg: AZFdTZeP8H+dpvkk6Rpe/xDIBE++ZO9DcljIm5lp7KR9Ey0OYXHssxpCgsJ0ySwMZWj
	d0OOMI5Ul00Q3BblE9df30Is1jwlj2k4mTjB1rR4T6bjtEUNU+fwbWfI3DCeJA7pjr4thh0okA9
	xO84e0zdldrArdg5rB4C3I0RVwRuC90wkXCIN0t8VhoHwupoz6ctgE5y0kwck8kai9w6dovViM6
	k27z3/bRqECtUwyuytnHTQFWXA9o29/2RWJOAlD/+PWWbTVl6y9VkpNaVHYoj/yAtFHygfgNPR3
	n+iG+AjnfKqez6MwnVCkaR07x5lM3HUjKNJkZZgPC9Ijpw3FQgaTRP5zgoa60CN46ehB3ryHPGN
	NXJwzw9jGffo8Q8sK44VWCtdAbp8z6hUcdevjDlMK/QW1b8VyzqsBotvyGPqseVxDB7PMF9nliT
	t2fexZdSwENTuVPYJx4VynLzAcXRDHjRPbKXCQhFy/w9w7cYWTEVqQeTAQuW/iKudAfdQe05/sK
	xhVkSYBY2qzzqlQtsUo02M1yLuFef2FvQ7AE3WJ8BNSAdyyrRgd/Oi7k5omuym5aHl/w62FiAqr
	iWKwkDVr9NZJTMXWekfhsOPr/gEBY4L1jYlG445i
X-Received: by 2002:a17:90b:4d11:b0:3b4:d00b:d0b3 with SMTP id 98e67ed59e1d1-3b4d00bd2cemr5306069a91.51.1795592361362;
        Tue, 24 Nov 2026 23:39:21 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm25401175a91.7.2026.11.24.23.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:39:20 -0800 (PST)
Date: Wed, 25 Nov 2026 16:39:18 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: shaos <shawnq1@163.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: guard the final LZNT1 sub-block header read
Message-ID: <awaQpiz7OUqAOogd@hyunchul-PC02>
References: <179558384099.146091.12975349907127521352@163.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179558384099.146091.12975349907127521352@163.com>

On Wed, Nov 25, 2026 at 05:17:20AM +0000, shaos wrote:
> Hello,
> 
> The legacy NTFS LZNT1 decompressor reads a 16-bit sub-block header
> before checking that two bytes remain in the compressed buffer.  If
> one byte remains, the read crosses the end of the 64 KiB
> compression buffer.  A crafted compressed file on an NTFS volume can
> reproduce this as a kernel page fault while the file is read.
> 
> Check the remaining input length before dereferencing the header.  This
> preserves the existing end-of-buffer handling while avoiding the read
> when fewer than two bytes remain.
> 
> HEAD commit:    8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
> git tree:       fe970b05333fb8e41da21e9e289f652abcc7cba7
> source version: Linux 7.4.0-rc4
> compiler:       gcc 11.4.0, GNU ld 2.38
> 
> Related work: ntfs-3g has a separate userspace LZNT1 bounds fix that
> checks for two remaining input bytes before reading a sub-block header:
> https://github.com/tuxera/ntfs-3g/commit/6aa66d98980ac1d966d7977c7b079f4fe380eb42
> This report concerns the in-kernel fs/ntfs implementation and is backed
> by a kernel reproducer against the revision above.
> 
> Console output:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/console-output.txt
> Kernel config:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/kernel-config.txt
> PoC:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/poc.c
> One-byte image control:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/one-byte-control-console-output.txt
> Fixed-kernel control:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/fixed-kernel-console-output.txt
> Image builder:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/build_image.py
> Initramfs builder:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/build_initramfs.sh
> QEMU runner:
> https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/run_qemu.sh
> 
> Build the test kernel from the specified commit and config.  Required
> tools are gcc, make, cpio, gzip, QEMU, and the ntfs-3g tools mkntfs and
> ntfscp.  Run these commands to download the Gist files and build the
> kernel, create the images, and run the positive and control cases:
> 
>     work=$(mktemp -d /tmp/ntfs-lznt.XXXXXX)
>     cd "$work"
>     gist_id=acbe634bf90826a626ed95d0f32b5ab4
>     gist_revision=ada97c11fe984e4bf47b9c93a0d90d30766ca3c4
>     gist_base=https://gist.githubusercontent.com/shaos26
>     gist=$gist_base/$gist_id/raw/$gist_revision
>     for file in poc.c build_image.py build_initramfs.sh run_qemu.sh; do
>         curl -fL "$gist/$file" -o "$file"
>     done
>     git clone \
>         https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>     cd linux
>     git checkout 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
>     mkdir build
>     curl -fL "$gist/kernel-config.txt" -o build/.config
>     make O=build olddefconfig
>     make O=build -j"$(nproc)" bzImage
>     cd ..
>     python3 build_image.py images
>     ./build_initramfs.sh poc-init initramfs.cpio.gz
>     ./run_qemu.sh linux/build/arch/x86/boot/bzImage \
>         initramfs.cpio.gz images/positive.img positive.log
>     ./run_qemu.sh linux/build/arch/x86/boot/bzImage \
>         initramfs.cpio.gz images/control.img control.log
> 
> The image builder creates a positive image and a one-byte control.  The
> initramfs builder compiles poc.c statically.  The PoC mounts
> the positive read-only NTFS image as /dev/vda and seeds the shared
> buffer by reading offset 0, then reads offset 65536 to trigger the
> fault.
> 
> The positive image faults in ntfs_decompress() at the end of the 64 KiB
> vmalloc buffer.  In the preserved run, CR2 is the first byte after the
> allocation and RDX is CR2 - 1; the faulting instruction loads a 16-bit
> value from RDX.  The one-byte image control completes without a fault.
> The proposed patch was built and tested against the same positive image;
> the fixed kernel completes and returns byte 'A'.
> 
> The trigger requires mounting a crafted legacy NTFS volume and reading a
> compressed file.  It can crash the kernel on the tested x86-64 layout.
> This is a local denial of service; no information disclosure or code
> execution is demonstrated.
> 
> The range check uses the remaining length rather than forming a pointer
> beyond cb_end.  The Gist includes the positive, one-byte control, and
> fixed-kernel console logs.
> 
> Fixes: 1e9ea7e04472 ("Revert \"fs: Remove NTFS classic\"")
> Signed-off-by: shaos <shawnq1@163.com>
> ---
>  fs/ntfs/compress.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -201,10 +201,11 @@ do_next_sb:
>  	/*
>  	 * Have we reached the end of the compression block or the end of the
>  	 * decompressed data?  The latter can happen for example if the current
> -	 * position in the compression block is one byte before its end so the
> -	 * first two checks do not detect it.
> +	 * position in the compression block is fewer than two bytes before its
> +	 * end, so a complete sub-block header is no longer available.
>  	 */
> -	if (cb == cb_end || !le16_to_cpup((__le16 *)cb) ||
> +	if (cb_end - cb < sizeof(__le16) ||

Could we go to return_overflow if only one byte remains for the next
header? And the existing phrase-token path seems to need a simillar check.

Could you also format the commit messages with the Linux kernel patch
submission guidelines, and address the warnings reported by
scripts/checkpatch.pl?


> +	    !le16_to_cpup((__le16 *)cb) ||
>  			(*dest_index == dest_max_index &&
>  			*dest_ofs == dest_max_ofs)) {
>  		int i;
> -- 
> 2.43.0
> 
> 

-- 
Thanks,
Hyunchul
