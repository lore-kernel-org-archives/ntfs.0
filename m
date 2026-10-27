Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060622;
	b=ehl7taUe81sA0BTVxagezuj/a8viGgjfm1Lu5WCEARgTNQbqEmPCNeX9IXQJRLKbWdC+
	 Q/ZicWZM+jtObCGiZcesOlFkCUo1B5QmAHF/c17cAuVTUISQ9SodcvyCehSt7CC72Cf/F
	 CTnHXllcK+Et2KTj1i3SZSu+KY4uTQznix4um4aOHXYn4iKpsw4/LULEWnUA20UOdqFaz
	 CQdRwHWA8rlEXHRE7sipqdZi/suXBu6vFJ69BBhv5ICgzbFWKN7ZvyoUOfzuXUWEYSso6
	 Xhl7XN3FTIlJ7ATX5ucBIMhw3psW+vvk0SinSf0bNkQz3BaH7nWuqfLV8WUnDXTi8Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0Oer6OZKK3H/7K/HnFhlDtT8h86r03JGpz0+RkaxxSU=;
	b=aMH7DygLXaYYarBWEbbf6uTQ4F2//p4BTpoW2cPrefquFAukO1lyrbXRyVvZlsHH2WcW
	 aK87KuabaPuh5b8RgklQqFRT4VghRBERxQ86l0rV+R/MP+pJ3PYBSCl1uhHf+SqDeax/U
	 zrMKhHbpsUVp+V5hsekXeHQpw/rR34ArURqQkG843ojkSxIuWqqugZBKjCNH3cHo7HMk0
	 GTymna7EzpynzKPrZ6FnSzf6KJ3LZMJXluNkZNT4Uf+VN7OqAeKzM9V4/axzRuSq0XiEF
	 LeyLmz0YpOyye+VGVkz4qUEQll4EK3bfzucetrqrcrqK4Saw9CN/7G7pskZKr1XYHhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SPV1DxWU;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF07F606A31A
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 00:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF07F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SPV1DxWU
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3550c917fd3so5367090eec.0
        for <ntfs@lists.linux.dev>; Mon, 26 Oct 2026 17:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060621; x=1793665421; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Oer6OZKK3H/7K/HnFhlDtT8h86r03JGpz0+RkaxxSU=;
        b=SPV1DxWUFikA1prD9Zyo3itayaZwAfAF0r1e+s7Ns4tIavsd0hl8v9Mi8dO2IyLLfC
         IgBSHibHwgIL8p+hKRRV3+fVKCIDJ4CpMTX17TJ3l8QJ09ymryYSdjd8v3J2OGGwEBFq
         e01CZYHETGOU1sSBMbulXfF/yZhse22HH/Wni1fBhMbWMcWRIWdICdCtcNnkJEGYNMbq
         pUlljY2bVEO9uCzrhJjZraeI8DvLdUsTVnygZnwsZ8s+cIKls59zhHTuscbh3z+6Qq0y
         ZYNxKFdWMlmA/BWwYTQAXoB0fs47A+BVv2kMf0Ht7hkTfa3zyS7yW8P902kPQfrTXEWo
         QdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060621; x=1793665421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Oer6OZKK3H/7K/HnFhlDtT8h86r03JGpz0+RkaxxSU=;
        b=zhZNReYH/iB/jtFvyUt09Lup/+8J5eLS5nVnFK/O1XVUKfSVRqDoe9y+tL/Cf6AssM
         lUa1l+20VT08uO56nMdrXAxhgxq+CkXBQSXrZVi1Y9t0Wyr1mK35Br/pDwIn1CD2547g
         /EZfS8d/lzEvCbCKjDnM73lZSCpx/gged9IWLYUmT3b0s9CfjkaYEl2BKccWnXgIDLpS
         QsQ2LYZcGrRyc1uz9Ee3tOdmU/eGK9IPrRKfr6DnzdoOnJfRdyE8XNMAADkYDrmeQlja
         Fk4h7UbERuP6oqVIBP7+ZDBwuhq0mXPVu7qM+lE+c91wYlokSzSbSASughoxmlZOmwqD
         Kusw==
X-Forwarded-Encrypted: i=1; AKwUvByvq87ybSLZBTLLuOlBZcTyZuJG0aAQ5eCMlcXBLHnYclqxqAlJV/5I9AkBwyjmPcekMZZ5@lists.linux.dev
X-Gm-Message-State: AFq9FYIzcu2Td7uN3/uK6g3eltdwGsIBZCl63omGnVEZSukvTaeIsuLd
	AY4MvSud25kdIU+SBAQ7wrcGN9y9KKYuIww6DhFoJ4fWppDSqc3JblfH
X-Gm-Gg: AYBFou0Gsk66J10eKlG9tuCSnmc6ct8K/KKXYriViIT6d4yOd/WApb6fQaN8zQ2umZV
	V2BF5U5gdxJ1r9dtsTq7z7CuBF6ce3eVGiiuq34+fdGC15igFm5VBYNkJ2vygMTj5tGQy4kN4uW
	XOhfjfxqoDLp1YJDWVsz3CDYIvnMxDgnsKczdZ30kYMDOj3tSZBCh9vMs2IfL0Sa9/sMTuBSZYC
	05YP36HPwV6BbBpH9M6QK8AqMHgZFvArKNnxFAgInrUZRAx0w2Vwj1UEoutNNmQgWOwfaL5YNMz
	ylx0dJENoQGHIqVIjJdXza8dFDsQE/ZrSaRoLJMijjUhZZuq9iswuUGtWEUWEPSmm6dkQe2/KCf
	e95pN6l2iMg7cyVxiv0K4HLJM0FpqQISuC4+/bKdj3tPuo99uFrsspzOYkDJEbwEnzf1tzV6JI4
	H874MYqw+e3o+2ktq4l3e40P9PQJgea+hCLdlkwexmBljTGF1XoeW66kJFVspG1jIIhNKpI6kb+
	ysMggWrIjHQFTRZ8E4QE5rRjNsNmTlOLXE/j0hT86CMag==
X-Received: by 2002:a05:693c:66c2:20b0:369:efcf:2642 with SMTP id 5a478bee46e88-369efcf2862mr10286088eec.31.1793060620528;
        Mon, 26 Oct 2026 17:23:40 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm36683836eec.28.2026.10.26.17.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:23:39 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:23:37 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: Fix error handling in __ntfs_create()
Message-ID: <at_vCRaW7SSkAKN6@hyunchul-PC02>
References: <7c0b17f73a031ae5564825ab94909f77eb2387d9.1793043780.git.bvanassche@acm.org>
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
In-Reply-To: <7c0b17f73a031ae5564825ab94909f77eb2387d9.1793043780.git.bvanassche@acm.org>

On Mon, Oct 26, 2026 at 12:43:00PM -0700, Bart Van Assche wrote:
> In __ntfs_create(), if ntfs_init_acl() fails before
> ntfs_mft_record_alloc() is called, jumping to err_out frees MFT record
> 0 ($MFT), unmaps an unmapped record and unlocks the unheld
> &dir_ni->mrec_lock and &ni->mrec_lock mutexes. Call iput(vi) and
> return ERR_PTR(err) directly instead, matching the
> ntfs_mft_record_alloc() failure path right below it.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
