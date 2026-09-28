Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B0135838F
	for <ntfs@lists.linux.dev>; Mon, 28 Sep 2026 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790559994; cv=none; b=H+m7IpTs39BzkfRxOkwxoxxq8sZbDLJyjztBgcCTLrElxfGl6JbupCoTreyXoPnNO1Nw7wyl97+s+JiyvYxvHPJmc6t58TmBa9FFMQSku8X3xMPhM7U0FxppsW8WXxlvzUHcFvJJQVNTwFpdVm3B2FYBStl7uhKvU4NLV9BCvoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790559994; c=relaxed/simple;
	bh=CwEEGkb5LfhUqFL6X0D0pZZFTVWEORWMM1J8tgNwZCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iahUR1n71nSK131QEGL1cVD3S0OT0jiDojlYDNal5yUcNopzOFvWJQ74felJbyv2PGed5dmuWCGjzFuD4mYpLFVBN2zWUd2v+GEg2+hEUl0AscLierRTPWB+yOS+x9zntOjPIy2m7mhWWE65VmM2i0UI6PgEBVHKhThtrIHxcc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3/olq9m; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3/olq9m"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-881269371acso772946b3a.0
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 18:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790559992; x=1791164792; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iZ72eAXwyDEfXVZpzALXLpMAf0n4c5H+3pOzJgid/94=;
        b=K3/olq9mdjCrZ0OZjQfBfBNRPv193YO8hFiyDjR839NuaaDlzeMlm5o7cwb4HtmgVq
         II3+PZSlu2sovzj/kSUIYchVPtT/420auLLH0unlEsQXusuUoUnSrzrUmau/QjjebT8Q
         q+S6fcEdGhWHsy2NSmuspa+izicVBEK48WGJ/SdbLXZpM//68NVs1FVSPaphBLx5+Q5w
         O01ovhdLrJet5nWtasYMrFrsdUoByy+4tdsUcOihC84+o9I107S/RnpgEBe9T5sdz4vH
         Xv5pos9rKHmW2xCtb0hJTXlav2f6QC22r3a7RLdBsAtm/sCkTFg3IuPxZvM+vA9Vf0A2
         dMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790559992; x=1791164792;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZ72eAXwyDEfXVZpzALXLpMAf0n4c5H+3pOzJgid/94=;
        b=G+fC4WAMKsFEU+ncl22ZC9kq5sDKSEN9GP6sjPPs+sz0z2QdVXgV/+ONb1BgLYHuH6
         KQ2Roi3qzeiPQP1tJFt40uIUYbiUvfC7I7fNX4TD8ja7KKlWi0kEqs/uS5enZYqOhdq0
         +1gEBBfM6Mb8DEn/YVaMHVuUB04bYXFcp3cKu+M2DitTPB1yOPLxAwXrkhBeQx2Jfidt
         tAa03DXfO1QZGQZ93AAnUzJUvfceol1YeYnH7qzKQpNQdi3lBjG3m3/2iXRYy5EXxnJG
         B/yU9qm18DI/k0KhD3m0PR3Q2tTneQYxa0HdJW5MFh22Ec80HXYfu3BejDpEWq/2lwIa
         3l7Q==
X-Forwarded-Encrypted: i=1; AKwUvByLlDaclQCpQ9EMryXriCBA0Wsyy9xiLmVfH8Gwq8UVSkVcp05TeCED91H/XIYn4OfQDdiv@lists.linux.dev
X-Gm-Message-State: AFuF++lAu7VO208lCwfsGjN5vj1r6rGf426kcJ2jMQbtsDdCUgAgl9it
	kH9IhBSVUdS468H3gJx9uhtm24mDwB7kXtL5RxcRgDm4B1lo9EY8E4Ptu2Whag==
X-Gm-Gg: AYBFou3c/KKApLnmLs9Tv6inD7hL/dvqPj3GIwP3DHCqfmR0zIHs3imLaMHqy0GskJ2
	O3nQLaw91MzF+Uj4Y16kyADWyjQC9wJHnGDlVF9/6HMV/TUYaTH8cjIJjaLmsE3bsBpC8BDLESa
	mbHNkPIz+3anWUHLhjH8D4WQ+Xh0NtxGMhZIFo9KMxRg6Y2AbKT4jeHsT3pN801pZeHv3++RIft
	kxfYdsOZa7daXHqg45Wz5uAALlQCDpY14qi1XEDOP1Wyp1fsrPYwdnKgBF5UcsMhq6TbdRzqbw+
	kfU+uNfmbV4Q+JbPDQIQXG2pQ9C7OZovaFJ+vAWgIRkfCvbsXCnglS3zpabxBgJBIw5+eN21KPJ
	rePbTkZNb/KqN8zq3FaF/E5RPxR+vTrwtqnAslerVk+JVuITkBk7v8Ixiii8z1+yv7RykKoliW4
	qT11ACiBgelWoFmtpGEOg9/9OFMqXcGNJwt1SC5Rf40JyIGri8BiGYv5kfai9K
X-Received: by 2002:a05:6a00:6c8d:b0:87d:fc55:c995 with SMTP id d2e1a72fcca58-87ea166efb5mr7008558b3a.50.1790559992025;
        Sun, 27 Sep 2026 18:46:32 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feac93380sm3342874b3a.33.2026.09.27.18.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:46:31 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:46:28 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ntfs: do not turn an unmappable runlist fragment
 into delalloc on write
Message-ID: <arnG9F6dyChrAWNg@hyunchul-PC02>
References: <arMoap0ZgeORuktT@hyunchul-PC02>
 <cover.1790417653.git.matthias.goergens@gmail.com>
 <20260927050831.2739166-2-matthias.goergens@gmail.com>
 <army_CjLBEcEiJ_o@hyunchul-PC02>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <army_CjLBEcEiJ_o@hyunchul-PC02>

On Mon, Sep 28, 2026 at 09:21:16AM +0900, Hyunchul Lee wrote:
> Hi Matthias,
> 
> > +	/*
> > +	 * As in ntfs_attr_vcn_to_rl(): a runlist fragment that could not be
> > +	 * mapped is not a hole.  Treating it as one would put a delalloc
> > +	 * extent over clusters that are allocated on disk but unknown to us.
> > +	 */
> > +	if (lcn == LCN_RL_NOT_MAPPED) {
> 
> We should handle LCN_ENOENT also.

Please ignore the my previous comment about handling LCN_ENOENT. I had
misunderstood the code.

> 
> > +		up_write(&ni->runlist.lock);
> > +		mutex_unlock(&ni->mrec_lock);
> > +		return map_err == -ENOMEM ? -ENOMEM : -EIO;
> > +	}
> > +
> >  	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
> >  	if (max_clu_count == 0) {
> >  		ntfs_error(inode->i_sb,
> > -- 
> > 2.55.0
> > 
> 
> -- 
> Thanks,
> Hyunchul

-- 
Thanks,
Hyunchul
