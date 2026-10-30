Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329034;
	b=htfQiAq6tknCNxG2p3kw03BOGi64glkdYucRXkPg/S6sjvckGpHnTpV/vgf1oNee21bL
	 Pu6L4OxoznNQ4cOT/hXDHwdkzko+Fh+2rTzoABI4De7Ij1tinwP/sYwQjXFSobbDKLLPv
	 qlIc2muipcfPdFv7d/o8MGTRwiLxoFZ9gL695qCnU1yPclZmYUWjYnuArVvUDi7zaPOxd
	 4oZJlSBUAjI3Yc6Jzzsquuha8RRZuUspJE+P1wivNmmMtYLPT3PT9kvlwRe60YnDiiFMz
	 ETWL6YToPFykv6zzEQ0cLa3eJa/s8cPVq2zV2Hq8T6luW7e7dkYPvuusoj0k45KQD/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=/ZdXC9RaNc34pyVI5ALRxFES86jLTzutVsfPjdP/KMA=;
	b=sLDKA/IHDFlY0vhRo80grroloF2aE4pGlA/GTJ33pCJygyzUax1087RHuZg3mzl6Btmg
	 iMQROobx4X7Mi/r0vo7FBGetQx+JEZPv+pAOKoTz8FQCwZFL1Kz0ftxrxC2SEsKgi4+Jc
	 denrly5B7l9m3g/FN9Or1QsoPwcA1x/mz4IxMUah9iGV3ytIedb9G8D8Sr8j2pKyAhftK
	 2aEYD5mP6/I3rN0h3xhsAauF9X3hl/Is15ysSrsozOXOe1Pnu267JeoDAIkduao4VnEa7
	 86cYxXcgydO5rUkVNUxKlvIwODJQrs8YvwqXEhq2WOupEv8+JbeLFrC3eT/+S/g2rxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afsQPX0w;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F43606A31D
	for <ntfs@lists.linux.dev>; Fri, 30 Oct 2026 02:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F43606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afsQPX0w
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so70656b3a.0
        for <ntfs@lists.linux.dev>; Thu, 29 Oct 2026 19:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793329034; x=1793933834; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ZdXC9RaNc34pyVI5ALRxFES86jLTzutVsfPjdP/KMA=;
        b=afsQPX0wqAvN/KiEkIkJYCBXNXO53epmyJUNAT6edwYCaD80ZlFc28CVCw9m7cH6lr
         bv9zhcwhcQgghOmPZEgvTfGg65o3DeaJJ6mV+yg2T0TDpHGF6NIonkvoeCrwLKB2M7L+
         t1gP5SLvpU8WiNtQNywTw3q8lfUVNQ8kvP4p1LB5UOouw4xbY0iL5wFd8vZ8egMaFVoB
         M8rEGxHK9i6dwj/eWY7MnB0qmBJAr0XHA2m8APoenMY5srpRbP2BkU8NBfpd28bcG1yM
         /lk8Ly9uZ5F8T4tyjASZ+qQNpTCpv84pC+K+h+QzPKwkLyoRrZySpJOQ8gM8t/4aUEwL
         PNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793329034; x=1793933834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/ZdXC9RaNc34pyVI5ALRxFES86jLTzutVsfPjdP/KMA=;
        b=fgexTEZZALu9hliX7OKccvn03WhcC2nkVNlbWpxRVRbAG2BtAXFPGYDbAy4zDkiZsc
         ypSXRptf7U6BooyFzNokEJhdcy7/+EXsBraPS1H6QGzDIwvQxBtsr/LQGYTHx5c0L41D
         tfwYByR2bE6PrHZaH5qdAaCa3VZxMZaZ2jW9hcrZ00rgtN1ZathWRAAYv+pd4B5wa4L1
         64Tzok4EyglzZaUht6UL92DKzUnSf9mW5RXgUGuCPR1e3aqykqyYCRIzIotOD8z4yyrC
         q4LJnOHxzzd3Fn1BrExbzzeQ8Tus927o6/63IXiHgVUQeSsRocbc+b1flTpuYViFSzC8
         dhLw==
X-Forwarded-Encrypted: i=1; AKwUvBwlI/yoCRV8SJrNg3Lfp5ifgG/qfLvp/dbtwTGaF0mB4FackuS4oWC2zau+pGiocwUw9iuH@lists.linux.dev
X-Gm-Message-State: AFq9FYJRZ/jkcNMRwa3n1kmlParldQ6y8mLy+sPjlQvGb7U69+OXEN+A
	LMEgTQOFzqIWWj0rPkdDo3wSyt940GZe0CKVk9wNGaaENAQ+448/AUWJ
X-Gm-Gg: AYBFou2gl7XOnyLvXVZEOva/4IG3TSVJt+10d9caaUZ1mm36vISBJirLoYUT/0QEnXI
	u8dWJCcJyuvjMh0Hbmb1O2BYQ2uGMasPB1TUP61e4vlbLlfL7MrMVNuBOApYQHwl1lBMPaKQXRu
	fgezlTTmzjpYpaaVG0XSUhGYk6hdRZfG5hWsWYWef0MjPgSdqSer1nwPV9bl+3jgdlE1sxJwPm2
	Sk7XL4w4I7BEmPq18+W11TZRlKG1YDalT4q+1F4xmYZ+l2xYHr9mRIQ12ujfdpiFKMngxAPkJ/Q
	pEvqJ0muh/xr9GYcy0W+76SA0eZpEnIRHv+BSPtApEdu7gzJsP/84cxkFTz9b1K66iISZUeqveg
	4w+YZzx1E5VK0h4+OHrlFLXQsUBw9hlonmE+sdHCqD0PbsASW1kwsOMV+mnHnMs4+E1iXfszYH1
	gkyi6uVL+QEBWjpeG3Rjn8b9tubdpdHnxSkqvaK+Fj+Wn3FDIKMC1OwfdXLhLnnefjuCaypK6qB
	/qVv1xo7oDcJ8x1g2f7rlSbhtp0QekL5IEgloYO4Et37DLgt7CyojQfnw6YUPgGy3gx0YCfxYKb
	9G+QiEY2Qa/+NPOwabTtx90bzRdVgKeldki9ZXJt
X-Received: by 2002:a05:6a00:290f:b0:8a3:df84:4c14 with SMTP id d2e1a72fcca58-8a9bee525bbmr794496b3a.57.1793329033656;
        Thu, 29 Oct 2026 19:57:13 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef95cb5sm162643b3a.9.2026.10.29.19.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:57:12 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:57:10 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>
Cc: liubaolin <liubaolin12138@163.com>, Namjae Jeon <linkinjeon@kernel.org>,
	ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ntfs: wait for bitmap folio writeback before modifying it
Message-ID: <auQHhmnBbntRem3o@hyunchul-PC02>
References: <20261029-b4-ntfs-bitmap-writeback-wait-v1-1-e2ba711b2dbf@cherr.cc>
 <374bf856-f880-4fa2-abec-c4b2a063bf57@163.com>
 <auLlFEHMZvANXUvU@kernel>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <auLlFEHMZvANXUvU@kernel>

Hi Shengzhuo,

On Thu, Oct 29, 2026 at 02:17:56PM +0800, Shengzhuo Wei wrote:
> On 2026-10-29 10:07, liubaolin wrote:
>  
> > Hi Shengzhuo,
> >    Could this deadlock during MFT bitmap
> > expansion？ntfs_mft_bitmap_extend_allocation_nolock() can recurse into MFT
> > record allocation while holding mftbmp_ni->runlist.lock.
> > 
> >   With L being that lock, could we get the following interleaving?
> > A and B are $MFT::$BITMAP folios; B is outside the cached iomap.
> > Time flows downwards.
> > 
> >   Writeback                        Bitmap expansion
> >   ---------                        ----------------
> >   lock A
> >   set PG_writeback(A)
> >   map A (take/release L)
> >   add A to wpc->wb_ctx
> >   unlock A
> >   [BIO still unsubmitted]
> >                                    take L
> >                                    extend bitmap mapping pairs
> >                                    need another extent record
> >                                    ntfs_mft_record_alloc()
> >                                      mft_bitmap_alloc_free_rec()
> >                                        lock A
> >                                        folio_wait_writeback(A)
> >                                    [wait for A's I/O, holding L]
> > 
> >   lock B
> >   set PG_writeback(B)
> >   ntfs_writeback_range(B)
> >     __ntfs_write_iomap_begin()
> >       down_write(L)
> >       [blocked on L]
> > 
> >   Cannot reach iomap_add_to_ioend()
> >   to submit A's pending BIO.        Cannot release L until
> >                                    A's writeback completes.
> > 
> >    ntfs_writeback_range() obtains the next mapping before
> > iomap_add_to_ioend() can submit the pending BIO.
> >    Would we need to submit that BIO before taking the mapping locks?
> > 
> > Thanks,
> > Baolin.
> > 
> 
> Hi Baolin,
> 
> Thanks for the analysis. I checked the paths and agree with you.
> 
> Following your suggestion, I prepared a change to submit the pending
> ioend before obtaining a new mapping in ntfs_writeback_range(), clearing
> wpc->wb_ctx even on error to avoid resubmission. I plan to make this a
> prerequisite for v2, retaining all six waits.
> 
> One concern is that submitting at mapping boundaries may reduce BIO
> aggregation, including for ordinary file writeback. The change has
> passed object builds, but has not been runtime- or performance-tested.
> 
> Does this approach look reasonable to you?

I think the early submit should be limited to $MFT:$BITMAP only.

> 
> Thanks,
> Shengzhuo

-- 
Thanks,
Hyunchul
