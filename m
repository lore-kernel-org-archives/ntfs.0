Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585698;
	b=zLjW2T91LIZR/ogmgspwN2Lw9F8pq1aopf9Gtd3Z+Y/Yd+l48EsRVmoaG446i4inVuCL
	 HrxuTzj3i2rzHmq5wX6Hu4QvHwZuD0Fsb3fwwQA89oBehZwpJZ7XsUYgEAViLch3j3haC
	 zm8lQLcrGuDtJ0WnqFvxkjo30XqmkWlt//0ajameOjL7824UfFXFjy6GsrmYiBPr8HeUg
	 Pj6zsAaLT2kdxyJHvhIdfhZ8jPY0/uMsxeDu/DlLRS4D4YRiwaqcmoxXO6uomByyMcSKi
	 HZwy4gAcDJnnwKrWzux8/QHq0u3Ad4MtlyiWvhLifuT4i8lYfu5RMFlou8XfTlpIrsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585698;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=XMTTnUVnekXsBCzMHYIoQgsgJRY5Zj+8OZvvB9sy4rI=;
	b=3viKsutk/VntYRMUyEEQqbuCJXpoR+KJWGcGPTy6DcGrOheLEdSlD1CfUxIU4f28wKfc
	 bhXDelnC9YA5DwgiYsO0Bf0CpEaS0FfWUJxdefHXz6yx5R4NE3JE8bvNjJTJIU7k5SQjY
	 LpbQq1JsBH22T551K6/SpOXgPhJdxdvH8J7z3znTKY1I1JSDOnYZwSAXQOYpjGfHvjRsy
	 gP09wa+wHWGWINHz5MDMvYXB9OzaiFC1Zkaa8ysB+DDPG5utW90b6/1w28uqqxJCu9x0r
	 ZDIVxuc7JqppVuyhrG5FBm+h0phZW5NcleDPJN0sNWcDYs669aAGU5S9JPD/bF0SF3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13761606A327
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 05:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13761606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 686F368AFE; Wed, 25 Nov 2026 06:48:14 +0100 (CET)
Date: Wed, 25 Nov 2026 06:48:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: ernest.borowski.git@proton.me
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
	Baolin Liu <liubaolin12138@163.com>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>, ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng1024@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 01/11] iomap: punch out a run of clean blocks in one
 call
Message-ID: <20261125054814.GA20604@lst.de>
References: <20261124-b4-ntfs-delalloc-fixes-v2-0-f394c800ec03@proton.me> <20261124-b4-ntfs-delalloc-fixes-v2-1-f394c800ec03@proton.me>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-b4-ntfs-delalloc-fixes-v2-1-f394c800ec03@proton.me>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 24, 2026 at 11:49:35PM +0100, Ernest Borowski via B4 Relay wrote:
> +		unsigned int next_blk = ifs_next_dirty_block(folio,
> +				first_blk + 1, last_blk);
> +
>  		punch(inode, folio_pos(folio) + (first_blk << blkbits),
> -				1 << blkbits, iomap);
> -		first_blk++;
> +				(loff_t)(next_blk - first_blk) << blkbits, iomap);

Overly long line.

Otherwise this looks fine, but did you test this on ext4 and XFS?

