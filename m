Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203007;
	b=gIsp5SLN+N1DNUtQmNtU/sjtisTVqdivZsubE7861QQftx6kLWMhPcPbshjeXZxnnS1l
	 VONBuGaGvuuJJ1VRXg8VeDWY8VsHoupUOVLhd3OhoP0j7n23zV55PCa6R9dKdelFNKLLJ
	 BuL20+rm4QD9+urKgxiCU/lCx8zOMocwjFxS/G0u6aS0QLPLn77Sj81cABP5FAbmXKV7k
	 T7MbZRk1ivqnjEIy5jZJDwVkEMt7PRA5FNNYEPTx9HtPCEU808H8rYtVT3nZEH/iL73dY
	 XQa0YBKDO6ZCjH1hi6WVdEZvY9R8nDmb+nMAyPc3NhchXejonqO+3jJALMTjsZB3eZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203007;
	h=DMARC-Filter:DKIM-Signature:Received:Received:To:cc:From:Reply-To:
	 Subject:In-reply-to:Date:Message-ID;
	bh=6se9dSqn49H6HNcyIirxW49xN33+UWfBNHOSsHXHxgA=;
	b=0q0KYzC5WnzGWZLlhIanXbyofubx/RMQfAhtzrb6EqCIP9X7jrUZNnmDAYHsG1tkrTpY
	 9Js9W/q2jw5XjWxzoQcVZqOXPW7nf8z2kZqlDiflCT1zGBGfW0IEWMEmjsqFaWHLfbYB+
	 /EO7a7DFZNtnH/vp/8ts/KZWK9etNlntvRl8hY2eIgxoNfKMvtGjaC4XIbvymSz2+jVHb
	 fga1kF6+CbhxBXoUDN11CQIxF8jJxjfw9y4G4GTeAmNzaerO9RyeQK2jgTYj6VZnYRsc6
	 axhQRkNNbNwWBSvDMjlvernQWMjF2Z1nBCWVGJu0HIgiuiQSaeSNiTXv86y29/cAvGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=H3Jsi38k;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17DA606A31A
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 15:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D17DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=H3Jsi38k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:In-reply-to:
	Subject:Reply-To:From:cc:To:Sender:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=6se9dSqn49H6HNcyIirxW49xN33+UWfBNHOSsHXHxgA=; t=1793203006;
	x=1794067006; b=H3Jsi38k2Igr94Vo0ho0lRP/AowEcV3doT8DzwrAchw7JzI5HxlWdwC5Am77z
	mfPd5OaJbVgFMa+8h8CVrFow6zWbgDxF4oQZX4/wTXsIZg6j30UGRpyE02jL/q253HuVtMEUsul2W
	q7sfo8mo9N0CXxdLxnugXvWjLuo7RzToJqX/jAUecUrishmKZ1m0J3oRe/ob56I5wA3pp5GRL5zIt
	lNOLOu3jAz9rPW+qSo+79079tm64gJ0g1BmeortqQkISyXB0icm3W/5gX5sKAuQ6NRtlws7JkIPe6
	Wwo2rxnvQR+q6A6FcOwj/LXs6Z9C03BmMMq1q76sY3dPSnYfNA==;
Received: from 30-11-166.wireless.csail.mit.edu ([128.30.11.166])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1xM611-00H6Ui-Hn;
	Wed, 28 Oct 2026 11:56:39 -0400
Received: from 30-11-166.wireless.csail.mit.edu (localhost [127.0.0.1])
	by 30-11-166.wireless.csail.mit.edu (Postfix) with ESMTP id 4542F3E98798;
	Wed, 28 Oct 2026 11:56:39 -0400 (EDT)
To: Hyunchul Lee <hyc.lee@gmail.com>
cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: Re: huge VCN in ntfs can result in a kernel page fault
In-reply-to: Your message of "Wed, 28 Oct 2026 17:45:41 +0900."
             <auG2NXweYw_qjWL4@hyunchul-PC02>
Date: Wed, 28 Oct 2026 11:56:39 -0400
Message-ID: <70368.1793202999@30-11-166.wireless.csail.mit.edu>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list

Hyunchul,

Your patch does indeed solve the problem for me.

Robert

> Date: Wed, 28 Oct 2026 17:45:41 +0900
> From: Hyunchul Lee <hyc.lee@gmail.com>
> To: rtm@csail.mit.edu
> Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev
> Subject: Re: huge VCN in ntfs can result in a kernel page fault
> 
> Hi Robert, 
> 
> Could you test it again with the patch?
> 
> https://lore.kernel.org/ntfs/20261028084248.2149976-1-hyc.lee@gmail.com
> 
> -- 
> Thanks,
> Hyunchul
