Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB221A23A6;
	Tue, 25 Aug 2026 05:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787636843; cv=none; b=POce8Pk3XfM4Vj5l/rfLq2qrrGZcRxNH+ZmMIF0kmJLC4P0uqqLljwR0L+Q+OZdkr9p+flN9fU0DMdFi6bvPNT5uN+u5y5iPpC+oSS5BHUNxMs/yyEojotOw0dIqp7YHxoCJFGGHJwiIZSeYuI29WiJuPN+1xMfdyDC1w70CQs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787636843; c=relaxed/simple;
	bh=6KHZ1jQKCGuJiPy4u9wqKmrlj2/oQFmHPFeuB3+5xEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BskGJ9X0I+2SZ0fS4Re/CIpu9iUsVXEVLQ4/Bdn0vFoeb4Uop9oiObeuPfEypNDPUSWu7jtQI/+xVbhIRiBOfN/hNc5NZBxZsWTX/i85jgZFPHeKElv4bf27NR90G5wUr1jSLgZ45G050fDvIVATq+UbmKQNZyHLM94wbVatFhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cCjPgf3o; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cCjPgf3o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lrOmmuZi2zKrq4WM18URglN6PfduESyPqGqUeFLWLe4=; b=cCjPgf3oLfyZk38xewAP0QSQV6
	5JnHUedrUKPBSL5PXVvdJZnKNRJmK3R73G6mvBEj7FDycAfWpp0zyB92J3h8/RNi/8VUwAuXNfMqU
	gC8Vm64RRoJiJa78juIlPXvt6EO2PdmJ8ZckJGNey1HkcTAOs1rJm5bMV9mMfa1e1MVDLWLXC77qC
	h7+UvQLKucMN4B0iLOVyGOjy5lL+oVMjaZIRBm8uGzsWH+3/z3l0niwGgUjJEN/uHDhPKVhFwjcDX
	QoLk3VQ/u50hUnTOewqtunIvrUE02E6QsTheOqIQmF2a8vy890lLPbtSBM4chSb0Tp2MnPCc9mFHA
	mJrRQsFA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyk0G-00000000CcW-0qqh;
	Tue, 25 Aug 2026 05:47:20 +0000
Date: Mon, 24 Aug 2026 22:47:20 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dennis Tighe <dennis.tighe@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: mount read-only when mft records are smaller than
 the device block
Message-ID: <ao0saL_dQcM35LFU@infradead.org>
References: <6a8b31d3.6dfd78af.244576.33c7@mx.google.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a8b31d3.6dfd78af.244576.33c7@mx.google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Sun, Aug 23, 2026 at 10:45:48AM -0700, Dennis Tighe wrote:
> An mft record is written with a single bio of exactly mft_record_size
> bytes. bio_unaligned() rejects a bio whose size is not a multiple of the
> device's logical block size, so on a volume whose mft records are smaller
> than that block no mft record can be written at all.
> 
> On 512n and 512e drives this is a non-issue; however, on 4Kn drives when
> the mft record (1k) is smaller than the logical block size (4k) mft
> writes begin to fail. At the same time, other writes that use all 4k
> will succeed leading to a corruption situation.
> 
> This is a stopgap change that mounts as read-only. The longer term fix is
> to perform 4k writes on 4Kn devices when writing the mft; however, that's
> more involved.

Between this and your previous patch it is pretty clear that a sector
size > 512 bytes is not supported.  So instead of adding predicted
band aids, reject this entirely for now and let someone who has the time
actually understand this for real fix it with a real design test plan
and all the others bits needed.

