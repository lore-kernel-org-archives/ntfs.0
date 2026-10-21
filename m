Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544938;
	b=sICGXyU6zub39Cb/BdLJyG3HtUZVTD3IQsnyR8Ccb0QLy2+ay0dH3LAG2YZ4XIGaMvES
	 4vg83ARcwTVuaJojwENnleIXLzN9RF8rCjC1EEuwfSHpH7H9k7+8EAdF5PiY53w8Pt4sj
	 mKLDUb05lZYRjC01VlX5Ti/BVleGggCReWXgclAPbJJcsRiWa3t1K2HBMwVMUbFtzr651
	 6FsonH1wYDnYKUN/mkxcA7/S0P/6QAI7JAgsSN2ybXNrXp47Q2FyKoHAXQsg+NSvmI0gi
	 eEXSK6RHVFrsrahMhMppgvZJOJj8D5XkZj8m54yALrQZYc8+vEWiVY0Vt/mr+4+HfBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Yuv5rDY1N08B6dEjeAKBsb8gX3GN84cFs/O3p+HC2u0=;
	b=B0hG7O8Of1gY9rHyhYdEB1qP0Jlt1O6yDNHPWeyyc18EtVUly9OeSUAaTYN7q1o1al/4
	 C8gsQph89AXzvOMg4KYDMw9y0Xohiddf+C0Uwm+ym41HdPrZXkNBc9TviCo8TK6c6EA5b
	 doZ4+oIHwGcc1u6c/194pQBZQoTgHRRALiLB/f7hEK89hMWJZuDkEh9ZODqn+ToObN4Fs
	 DjDlMGql+D6tHqGDnkoUruytLxjnkTfyIP2VF07S1GevzAIrL/IYCcNjDqWrAEGzkIqP9
	 5saVOZrmrbfq63C0cVrEI8Gp0h+FwQjo5EJb9eEg+C50kqL47u1B4/4ohHKukYPFLWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qpbqeF0h;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB15606A31A
	for <ntfs@lists.linux.dev>; Wed, 21 Oct 2026 01:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB15606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qpbqeF0h
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so120672a91.1
        for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 18:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792544937; x=1793149737; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yuv5rDY1N08B6dEjeAKBsb8gX3GN84cFs/O3p+HC2u0=;
        b=qpbqeF0hr2J6evtZbsd1aGt12igxfLKaTHl8QJykQ2W38HPp2X7eTlB1/K8RIrpFwn
         9ZLgieUV7BJZxbdu3nzEOW3bi3xT+oQj2t+TR1iLWujKy8vUM4Qtef5bzdLcvyqOvKHW
         1YMFDMQ8MpIYrH/UzwM1/Z+XrCgta7KKhQQijBZisdjEgMzfr7ZJY+GcUB9mnWYGVVju
         GOGXFaSksDWhnUNeKoHWftqGmJr/PrgFR+RlolG5W7dmCmF57glk1wwsttEo7h0MEj+k
         RyDo93vyx4uHOAdmEP0AcqVWE74utwFCEPVWn7h7sXTdSTSU7Y7YXKpbnALNFLUC9vVT
         /u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544937; x=1793149737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yuv5rDY1N08B6dEjeAKBsb8gX3GN84cFs/O3p+HC2u0=;
        b=xkNVik2NvKSrZlcXK/7WTz5HRHbsqGN+Z5m1a4RxFlKt7uzyNI4R5UcDRMcxu0Zq3z
         AIRXJ6o+9OJR2wmu5bz6Hdwney+vTPqui9ZiLF2lL9NkYBjyIXBYtBJPxAm04dRBLwEg
         OpRYgekNMVYDkG5U8BvIx8AKnjorB986j6P2Q/nTQr2WBA/gfwN6yL9hvIOnt/AgpvS8
         z8TFObg/2IoO/8UPu91UNZ0XIcjpk0BZwHxl3cgPS6df0aNvDcLylajSpC+chhdnzd34
         SkigDbY0baz4L7JEy5NnHOTYxlwwwfq0llhgYyMoNjPB9/KG7x47pmT7Vk5xiDrZTxLw
         kJ9A==
X-Forwarded-Encrypted: i=1; AKwUvByojC0r5OQWbYXYfaW2jFs7tX2/TyvxZRqVnf2uPoWrgdgngmy8BFBOUXoY19RcAGvpUAiE@lists.linux.dev
X-Gm-Message-State: AFq9FYKxDzsUyEQaVPv49C5syE7Im2ddmCHQ7NNIrF1nsgcZc0YjvIz8
	h8vgxkEnD3AEUuq4HvPytk4QZDYNOu8L+khiL6jMHBtefPm0ghhj0w45
X-Gm-Gg: AYBFou1mD8cIYDW41gk5ImnqNrK/mE7D3BT+w8A8l8gh8c6PuoHqkPNAypk99mTto5e
	joDW/CXAZC34fgOXcOLoHN7WbmAbkYjbJmIkgEvPmJ4LBw3XI1SRddd73RQ3dV2nmuFKlNoERdu
	AlSJA795QKyEpqmlbUGxomLakVcYta6qLdOggZjbAcu4/AXjWN7JRabVUB3NyYLpkG596rIdO0O
	J4F0x7wxtUb13At+8Hnc+8VlhhUFqvlUWUwRIWUxQy5bApkd7ZRSzuHqaDJRGolCrofDk9RJlG2
	0KGPaqMxnBIBmJ4tPDuO3z5AIRWBwDsKDOJUN5hi+8YUDMikrLL+jh409XIyPC+roEGXXJOqrot
	TuIUuTHNeBb6kUt4VpL7s2MZO3m1eSlbUeUBzaF1rP+fLgkQOu1H8AEJRs08FSLQkUzCTKE22np
	N9fuqYyYpyB4a3YuVTmr18ZSUTP4o1zbJAou9ca4NeIZCJokreQtpjeNjr0aKS
X-Received: by 2002:a17:90b:3bc7:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3ad86ef5171mr459769a91.42.1792544937058;
        Tue, 20 Oct 2026 18:08:57 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80214aefsm1694443a91.3.2026.10.20.18.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:08:56 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:08:52 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Bryam Vargas <hexlabsecurity@proton.me>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] ntfs: fix u16 truncation of the update sequence array
 count check
Message-ID: <atgQpJDr-3tfZxQw@hyunchul-PC02>
References: <20261020134433.1015126-1-zhanxusheng1024@gmail.com>
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
In-Reply-To: <20261020134433.1015126-1-zhanxusheng1024@gmail.com>

On Tue, Oct 20, 2026 at 09:44:33PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> ntfs_check_restart_page_header() bounds the on-disk system page size by
> recomputing the update sequence array count from it:
> 
> 	u16 ra_ofs, usa_count, usa_ofs, usa_end = 0;
> 	...
> 	usa_count = 1 + (logfile_system_page_size >> NTFS_BLOCK_SIZE_BITS);
> 	if (usa_count != le16_to_cpu(rp->usa_count))
> 		return false;
> 
> The right hand side is computed in u32 but stored in a u16, so the count
> wraps once the system page size reaches 0x2000000.  An image claiming any
> larger power of two passes the check by also claiming usa_count == 1.
> 
> Nothing else limits the value, so ntfs_check_and_load_restart_page() goes
> on to kvzalloc() up to 2 GiB for the restart page and copy that many bytes
> a page at a time.  The size is only rejected afterwards, by the
> (size >> NTFS_BLOCK_SIZE_BITS) != usa_count test in post_read_mst_fixup().
> 
> Compute the count in a u32 so the existing check rejects an over-large
> system page size instead of being defeated by the truncation.  This adds
> no new limit: the array holds one u16 per protected sector plus the update
> sequence number and must end within the first sector, which caps usa_count
> at 240 and the system page size at 64 KiB.
> 
> Widen ra_ofs and usa_ofs as well, as ntfs_check_restart_area() already
> does: both are loaded from __le16 on-disk fields and every comparison is
> against a non-negative value, so no result changes.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>


Looks good to me.
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
