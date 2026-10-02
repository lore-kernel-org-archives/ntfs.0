Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543FC247291
	for <ntfs@lists.linux.dev>; Fri,  2 Oct 2026 05:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790919447; cv=none; b=jV2G1Ook3ZsRMPe7wR8bVeTyYkRIdlSozgR093OceMrZkA0KNlM8Im7boML3FVOUJAw2IjbnQ6k1EVobG7gogdwoQ4K/nomfHjGiTyxBc0s54HhEZ1EUSkGgVUaRxom86HKY5zxWO89vb9kS0za23jwCIe1AVt1axvuKo/d3NaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790919447; c=relaxed/simple;
	bh=Qu+IT/SfaKywPp0ftNmip2dBTQBBkOkDk7AmvwWlwRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4fWBN3rSOsnakF0Dq8ThaKKDffVq1Ai+MOZfovODplzAd9yz3R6qx6ArDRjZcnil46Sw7gLKVRYcUhVKNNwHlY/5VU5MRbc1SZxG3QOHTxnNEUH7wFVvS0BbmaNrNdE1ZsfomJWzrAleSaQCaseVlZe0WMDeju+seUM3zRE0iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCdebBo5; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCdebBo5"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc78d45f78fso4755767a12.3
        for <ntfs@lists.linux.dev>; Thu, 01 Oct 2026 22:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790919446; x=1791524246; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfrkmb0eJpHRNYj/pvBngGN4IjRZKZRH0wkIARGATCw=;
        b=lCdebBo5ZkxlUPZ8I1x9Ymy2+MsoKjjCtgaKwttQnVoKHMgooLXrviZJSOP37Luv5o
         1JW6tDCVtodlH2JI91C3qH4lf1pG6YCNLCFl9oLb32vb8rPTNClFIf352/U1PXn/Qsrk
         KuPk3JbHKjzeZJMGl3/HquVjImbm/qvwg18db758AZOGPFOiurpNNM81dKh6Rou4CXWi
         0HGfweI+r22SEshCCUvmDSbu25H26rjExgg+NsuQpauCeoR+Ph6aQuQgHzWixW+8jc3p
         zFJLOiQu+ERjXmBCrsrR9XVRpWdfWZr6P5hGHfCtUTEUW6G4As2qk2VrvsD6Z8HDgs+G
         elpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790919446; x=1791524246;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfrkmb0eJpHRNYj/pvBngGN4IjRZKZRH0wkIARGATCw=;
        b=w5M9Tk2v7SYTpw/mtlGjv7FZsJu+/dCvoZ+OAE3qZSYOe773CrOWxNhveLQE7dg51B
         ZY8OTp3CMhL4LHrgisTGoLbtbX2OHWfw6XZBGEDApIc+J3/k3BGyZNJWNGhLW415Foh+
         KbrC4kKeBiuZ31NsRpoX1t7+FXXLs0E6jx18fI7ehB2AOvDryKAKBkOcLgdlb6bm5N4x
         h5VVNpEnY2s17oHh2j0cJ6GcrYoJGLrYPVps4eUMdnoGTSHT36HeSUW23tVjbfFoPJHy
         7FfV2Uv76iT3PctZ+Sg2HG8or6qcRIVHH5yA3IfZ5IUb2qWk8JlYdQMe4dhjTZask6mq
         hNuQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4Y0w8GwpFSa6gnOullbLalunsMpPMr88wVCQShLg4/NWCbzgYYGKkR3WnO+VPJirSXggQ@lists.linux.dev
X-Gm-Message-State: AFuF++ktuiqfHVVvqjWZD7yrWrJhchw5uUXbvWhlzffMI3wn+K8HpHY2
	URQUOvkC9R6/rKee9zVoYDdXIiqVp7nmGknEibehLn6wNXREc/kf3aPJ
X-Gm-Gg: AYBFou2yZTj4jWRkL2Rks56g/FGlIIwH/koNDWi1cJyaSlvJakPp/pXOQVkb83LHc6R
	YtsXWBD8lStugIMLv88AGFpYr1l0GAyixWjI5gV3n5Z9BKbBPjLl3EW9Wz43G0mamiclp7ZUkHQ
	OvM8LH6zxVfUP/PiZrroUE0Mn7CBbk06lnNGHpg2VwJU5of9N4WRMFp4LVw9vUA4CRsuWHe3EUj
	vdnDPBwnKruISmTnty5xqe6YfPTfnqCSz8I8SN3sFm/F85z954nzebQVonfmUDmaz6r0gWtLYa8
	0GF1xs0/E2f0Pq9J8syNtl2STQnyKkj48bZ0uDuQ4orlu6QX334bpK+PruwNKveCKUqQWmvh9Wj
	bLDqzrCHnxS0TtdhZ25tAk20ZpEJhq3PQ7cUz8dxeqpdHLIKcA6+DaDH96GNjWOnEuedjOSQ5Q0
	+Ktnp92kxTsjMsaCRSKlZMvSV+663qvQCNcVFVn6eObkRwVGJs8TS6yXlCICw2
X-Received: by 2002:a05:6a21:2c01:b0:3de:74ee:c05d with SMTP id adf61e73a8af0-3e0bcfba78amr1843334637.23.1790919445425;
        Thu, 01 Oct 2026 22:37:25 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0cb77df7sm468216b3a.47.2026.10.01.22.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 22:37:24 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:37:22 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Baolin Liu <liubaolin@kylinos.cn>,
	liubaolin <liubaolin12138@163.com>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ntfs: fix spurious EIO and ENOSPC on nearly full
 volumes
Message-ID: <ar9DEnzfkEvi3Oo9@hyunchul-PC02>
References: <cover.1790853718.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1790853718.git.matthias.goergens@gmail.com>

The whole series look good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
