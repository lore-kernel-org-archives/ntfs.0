Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079732;
	b=sA9u0wPZGLU1FHHa86WPk2BPYHNOcmgjCgA+Jrnpk9tVEloG4SLE0HkbsUJIhzKBK1Xf
	 W7TRe/DG0ME0qUR4/RXcc/kMq7JlCt6MnlMBZYBHPW464Htvym2K+i8AhASLdBFmvmTIA
	 EYm47F8LxkPBUvqj2zMEp3sA78eOi8gpvhG8KJtjwOD+O4AP1b1CMgRQ6+FoU6z0IQNeu
	 fBcU5+c5iWKoBmaQy0GxYDw5sIXU5YEwU6ttoQGNCXW7S4EStdxD1oG7eTAoCDjfbOnm5
	 TKrujN8Q50IvzpAJdoNBhC21hEBrAZOcgnDLQB42rYyonYSvzOdnv/JBvaCHBrNTL0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4YvQ88Tw3BpTAX+GwccgHZpr8xDWaxtWSxka8yipfg8=;
	b=YUBDhjUFGhT4qA4q0JNkcPAZkDSXU+O67MGiuLE4Mv4BovATbNL6Luazi+7Lw0r6i94q
	 Q4mazJJwx30h7QluWLtEu0WoLkDpN3fBgZP8ZyZQqzR/SE9Bguo0nQYSn7FXEo+fIREhQ
	 oZr9neEmf2smwuIAa3h5470NBzQ9JWioYma6LNnviGo2YxJ+3DiIQnWILgN95RsgzYnUj
	 sO6N3zw/lt4sEGQzVaG5m7D8u8PiTpxkLBMRYq1RTutj3cfNrydo+BXFBbV+Grd0eo00f
	 uOXe8lKjbkeQ/Z71yVm5K4cGEaGWJG6Q3Zj2zkOpkMUuSki85tSSSuI0RYLtBdK2knw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DT20NRBG;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7827D606A32F
	for <ntfs@lists.linux.dev>; Sat,  7 Nov 2026 19:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7827D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DT20NRBG
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so5062256c88.1
        for <ntfs@lists.linux.dev>; Sat, 07 Nov 2026 11:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079731; x=1794684531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YvQ88Tw3BpTAX+GwccgHZpr8xDWaxtWSxka8yipfg8=;
        b=DT20NRBGe0aUsBLnVzQV/JVqDTnIwTu4sNJZ2EfX3p0INAG1XkHhBvN1DJrHl8t60R
         1Ps1s1tDOsZ0arQrhuDtSSPRs7pkxHKZLZ70NKcfaPuXKMb71oWA9W0z4GBNL/0itl26
         FcxoYqL0CgX28v30d5ZuHaV8iKOqICSK+6uO9E83b+8EA3mBctCUrm7tq/Sjx5KQ5zBr
         Is4QwU1FcoKUNwqnsqXbuI/LkX+sFJXvQ1hdc5BFtnjHCLSVP0IQt0ziLbwV0TIRWwxs
         0vEU7f5s2hy1o9E2rlLdQGg4oHbL3Kq6nWlHeGOSAX8mpb3Nh4xRy1XW2hXlnqdelozz
         cfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079731; x=1794684531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4YvQ88Tw3BpTAX+GwccgHZpr8xDWaxtWSxka8yipfg8=;
        b=NKANM9EJqjTlCGBWOomBB7nAWG4UWyGXuo5q6rOP75C4IyDeOU6Qf+FeiXQSzx7urj
         V1V/E2YE9yX0eKiM5Atn3E5drYM+uKQLa78+ItEKhMrNJAKgFWi5jEBoe6mACSQ1dFGH
         YLKrlW2CYFUI3bGKnPWP8bJ3IyFOoep/lU/6fZGHv+IHzeURzh++l0SOLwic3GGp95W7
         wbe8XhJXLtkBHpRBNDY7Rl0Ly8S5zl1KMGqsSTN5ZJO52ElHJZ5EyOmDM3BvuO6LaqAM
         4E3AqHf9CE9eVXAXZ8tE2/sTjedGYNYI2ECbVXkAfTudkjPOj8O4dSX6G+3o7xBOIgko
         enTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOI9xQo63gnZ5S+WO8oynJQ4cMUT3betJzUo1gKKtav7ODmWtV0JiTmcdOhFc46/nN0wsp@lists.linux.dev
X-Gm-Message-State: APuU4Z9/nyAtupi4g6UtJI5E1KKHligHGhwzQUWrKYBXAkc0cu1+eWjV
	9rlMTg/R4cBqKzgscftFtlGZqCFb7dwt59qHR2teRkJAqaZ5ooAztbqA
X-Gm-Gg: AYBFou3UWdS1l0DuRdyHexMh9ak9VAjyc0Py+6mIlWfJzChnKwfPcLUZUWdmaOTHeLT
	oSjbypk4jzBSX0PLZ4Z7lcBNLQxrBNHW0kGx3c0ixSoBMo72oFvT4xn6BO2adExqiESLKgzVQtz
	t332n5Ewn32hcueskL08xWrMj35jrsU38NMRBnKefK8vutseVtmdBLd7OcSdPejdMamPx4FkcRx
	xXe0kgAa7S5x+qr0qaxmn+tBBVnAPwmnqrqvkXdNM7Rk/eo8O+molEEv7Djv+o7LkyRSpCSaLmo
	u7WP6DMCJFIsp5uE6Fd62ESYJH5XHibLGieATEFZCOrGJ9UfZhcDeZbnR5HbmSpJBzRloXGxKzR
	+eeej8pui4IkPcrXzm9Z79G7f9l6T12XFUjpipPuQXcYwucuJwKqEH+aJGJ04hcO3Gr3WVFslXE
	Elo+alopFtpozJVzMDhMdrgQXt7J+2NWbi97cHmipIpAb8ZWfE1o9QrXshEPVtfMJ2CxzFM8VhF
	cHwaxtL+5U62ghB/ujlNzABkvpO7l/oHU4gaoHRuz6KfBwe/7/adHl+h6CiAe0iQWkN93n0Xdhw
	TjhHfL7/O+RBCdW8yCf3dobyIx+sbXEt7Cx5NlEpQX+sdfXXO2j+StDhlscTSVyRww==
X-Received: by 2002:a05:701b:270d:b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1b25d30af61mr9520523c88.14.1794079731268;
        Sat, 07 Nov 2026 11:28:51 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm551856c88.6.2026.11.07.11.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:28:50 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ntfs: do not convert a named $DATA stream when making room in a record
Date: Sun,  8 Nov 2026 00:58:44 +0530
Message-ID: <20261107192844.3908575-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
References: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Namjae,

I sent v3 of this patch as a reply to this mail. It opens a named $DATA
stream with ntfs_attr_iget() like the other attribute types in the loop,
and keeps ntfs_iget() for the unnamed one. With it the image that
triggered the WARN mounts and walks cleanly on a KASAN and lockdep
kernel. Without it the WARN fires at ntfs_attr_make_non_resident().

About the lock ordering: I checked the code. The comment above the
__filemap_get_folio() call in ntfs_attr_make_non_resident() says the
folio lock nests outside all ntfs locks, but its callers hold mrec_lock
when they get there (ntfs_expand_for_write() takes it in file.c and goes
through ntfs_attr_expand() into ntfs_resident_attr_resize()). The read
side takes the folio first and mrec_lock inside
ntfs_read_iomap_begin_resident(). So the two orders do exist. This is
true for the direct conversion at the top of ntfs_resident_attr_resize()
as well, not only for the loop.

I could not turn it into a hang. A reader and a writer racing on resident
files, also with a delay forced between taking mrec_lock and the folio,
completed every time. So I do not know how reachable it is, and I did
not want to change the locking in this patch on a guess.

If you want the order fixed, I think it needs the folio to be taken
before mrec_lock in the callers (or a non-blocking folio get on the
make-room path, which only tries to free space). Tell me which you
prefer and I will send it as a separate patch.

Thanks,
Wahid
