Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476451;
	b=vRJHJP+GpoTQjjDh0R2bgC9ovpj3xOlk9ZjaiJ0ocCz7RfZUTpgFBtjovUzifXCEOcwT
	 UliZJRNssPCLcdZ/oVuwov/RgJYn8/hZKDjyjn7G2ivQBm5/BqGWzcBaFkKjj6pT7ODn4
	 rhLoKW8j2MohopOQf2Ey18Reg2R2lrXFpB/7TX4TaeLj3jzh8T3FHcbior35+BZUDvc+w
	 n7CaZN+u6mfst2vu3XlLflKzos40TpTY7F+aJDNfk7MSxk+6NzkzcaTmrAoGgTg4S1ryx
	 UfhcaUk2uIn+Pz1gk7v1SvP7O7GFichOxgGm26YSajsRGvf+ntR3t1Uk8uIVMlSmaDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rCbcFIxLvGfqWgZkhTuDnJ8f03/sdMJUAO5PDOg4kQE=;
	b=020KPK1M0S1y6b4CsU4KRxrjl3tf1uNjjcU93f4I+EIJ64ap/oYgve0OpBt36aJZZHgr
	 JU4i7KFv+pZVHN2gG8Z+r2rnpiJjw6Wmi8HWQk6YpWJ14bCoLtTvArRZpMmFLVBJEPWYf
	 W2MDD2JyMqeHA8E4d5IEhqtaVaBh+80yB0OeyhoURvKqKe3UANkcZJ+aacs6reGUENNVh
	 gWLEtZPdYjjEyi2c5MqSy2/h5M68MGi+9WGejxtkTUI5Gut8t6wrdF4Op7PgP9X1/XG4I
	 gs0ryhKHVOPswlkE6GXSXtWLIxEedfRh5dDnRf7nXwhDLbAy3KAkl5vtLWsWailDl/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BcZEwV2e;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC79606A31B
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 06:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC79606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BcZEwV2e
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso1135314a12.0
        for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 23:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792476450; x=1793081250; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCbcFIxLvGfqWgZkhTuDnJ8f03/sdMJUAO5PDOg4kQE=;
        b=BcZEwV2eNq+GpHv/gsctlkd9BiBmbVgkMKa+k1g1wM2zI7WjfA8mZTvP5jveGU9bOa
         zxOuGsKUUvBHFLjuBigEWm8/y2d8nFJw4H/cRowRM769aEDhynw+4Y5uZhv+dXzKqMtx
         BA9AtHORTeO+KpMoZ/Jg2Zdl2L3yB5B8JH9JYiuC2fevN9ze0BttgUnWcXjUZlYsV0ZG
         ZcCPDAYwZDwxGGIE7DHBtH2pdJ0ikT1SJlftQMTfgQcZLonUyX4H12jiwgufThvCu+ob
         7ijIWPeoGF70t65D7cOZzy4XYWiJ3l74cg9iFTT8wqhmiHvvI3BnPKF/DRH7qXetgwpy
         Ixgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476450; x=1793081250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCbcFIxLvGfqWgZkhTuDnJ8f03/sdMJUAO5PDOg4kQE=;
        b=qA4AwjI5M+yU+5JIdLs7ZJhlg/x1tI9inDo84gONWB/HvNPRvA8RLmvfdXgOeE3fhW
         LjYngrp60Ckq6B1qSOs9XneVVkAVuq8nUybHg+ab5XgYjGv8pBZOktY7GCOr4WoXOdwT
         lqGRMnyALUu4C+EvNuiBvSDqa5UhhsheHzPO7ePMcPISyCgbb2Guv8JMGKyAn/8cciMp
         xoI9rFriQgJmaoSpWb69OD4m438SI8H+6nejIwJ7X/kqkl1YBpXvdaLzuHfCV5eXIh5H
         BVxmchSjbZTEVwA/KAHEv5qNwrzZPy37v4IGeGIPBl07VNl0tO9GVKMqGW9NPa6LR3RG
         ccYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH0ndUz2NctGj4vWbZw7goIlweioCGlfYB4MtVdgxgAcmkHrCMFMiZrkL2Ri3bR7OJpwGI@lists.linux.dev
X-Gm-Message-State: AFq9FYLogbIvJEaX/g9JAbT4W45cVdgDClAgSAa0l7BtlYvqLRVbz7f+
	rmpz2yZerP5HPDIOv8SE/PmK8FC4X1x/fdmdh9PCwxMcOWVS/owOOUSs
X-Gm-Gg: AYBFou1EV+0ZW4X25ERfMT0cVGtd/t1u+KULUzbtKUhGcRV9nhIUtsL114asGj8sJ7p
	GLaACsoeuHUOl6Koos+7rtDwTQ85Xi6wCDpNeFU9YxmGeDtRxEhLzD/3VG0c85upB2gulqH3uCl
	Jr3xjFKBOlnatvIK6OPNUlzJCTclAyhwAoQ+uMN0ZPP6LegMcqTaE0m3k0D8FqwPUYv1iNBOPzX
	04+y99eWIpD5LauCS2B0b36w/iPrTU7NZl+sxVNsvXD6hzxjfOg73JjJnkPCNamETb6D2iPaMpN
	W9dZPRZPrzvspI2UPG7xNVRL1Pk2tvDQkaeCJzuwUAMLgoOGbMr1ofVFuC754Ayf9BZlO+pryys
	amswM891UtvRaGwkUZb7EvD9UicCp744uTsLWRsgzyGlp9b2nbRKBBPMJsG0US43W00ZCYr38J2
	8pzHKiVkZsR/h4JDv0EVsiAON3QR7fGpAezkp6AotpGcQYcmr5FHciSsIYswHY
X-Received: by 2002:a17:90b:4b0c:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3aceebb67d8mr8705885a91.8.1792476449824;
        Mon, 19 Oct 2026 23:07:29 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d400505sm2501874a91.4.2026.10.19.23.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:07:29 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:07:26 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v3] ntfs: handle a failed size rollback in the write
 error path
Message-ID: <atcFHqawwvhBIZzc@hyunchul-PC02>
References: <20261020025308.664764-1-zenghongling@kylinos.cn>
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
In-Reply-To: <20261020025308.664764-1-zenghongling@kylinos.cn>

>  			mutex_lock(&mrec_ni->mrec_lock);
> -			ntfs_attr_truncate(ni, old_data_size);
> +			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
> +					old_data_size);

The shrink can clamp `initialized_size` to `old_data_size`, and this can
expose the uninitialized data in the read path.

-- 
Thanks,
Hyunchul
