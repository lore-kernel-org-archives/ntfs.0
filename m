Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35F396D03
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 05:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781615; cv=none; b=uwQFkrxvQV5VqKV1Z970Vcn1vVX9u9l8vPUjSqLBN+p+AvoNVtNCREcQEzKkKmNIEP5WSSzAP3l+imxZSYaCWWPhGiX0IsGdGlJvkUd0+XX6/mpMf98BQ1qaTz+SVMDwWbewm+gOjvQeUt2rkzi9u/ab8oi7L4iglCjMXyjctFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781615; c=relaxed/simple;
	bh=UgrW/fs5Jhz7Jvkt5e6o7USVzzbUfd8gg4oB605oc20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfO6sR2Ntu+Bf5nwQt/7Pbp6LA3G19kYz9whMB4fKTdahYy01E6gr1djSrsAiybUdgn1+8Uqd5qJKQLu3/9sbC3PEHLvwMOUqfeyHmPvkKwEpDHfW4I8FmQ4+9N/R5Q+GE0q8o7zwmyOG0S2Ty2/0n0q9/CqqJf7cGCMPQZcPLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyPZu1IO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyPZu1IO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B102B1F0089F
	for <ntfs@lists.linux.dev>; Mon, 12 Oct 2026 05:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791781613;
	bh=NeZPrINNOL3KFCO/6o3UhZfq297cDZK8saDBec2fuiQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EyPZu1IOXRT1Jp0WUWt5hqevoW76998db7F+ZNSuteI1fePOAKkWpcU8q6KuTm0NB
	 WNiIJsD9r3iwr8/d39VeYxnZlKUAi+V2gDEWh87+n0hrcBZafXPACUb8JmLCiFa0UO
	 haHxZcRl4l0C9uDkZ9ZSQa9+MyfV4pR7YcSIZU2mHg/UaTzV6ll1T1czs6t0R6hFjP
	 DnZJ6pn5Yx/sr1XlN6psMusdLURn2sRFDxJGABMi5jnanMqF02Jm45+3UVm4X4u1Za
	 tkMysvaDod9avyiMzstq6LQwJyGfbEAZHFpE2I1P0/1vENSq3jtdnl/6g10PYn9itT
	 EbfE0Po25MFcQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c350db5a761so60630066b.1
        for <ntfs@lists.linux.dev>; Sun, 11 Oct 2026 22:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwp1Vk8Hjp5Sa1pWlYZQooFoe0tWeGdd15TeUrmYraOW39ae4DzHeBU2f8guiO1AedUOwF@lists.linux.dev
X-Gm-Message-State: AFq9FYKo1V+lh0SaUARtPqSg9CbBniEWrs1prGmIj22AsDvdcLTBCYo3
	PPzfMpH+TKFdchLRdtjIc1s394vPPAO9PMYeR2pshn6IFhVePAhytBujDAWIczpNOfeg3mcDXG7
	UlP1EQjMSM6SuL7qFnBFJR0pV+r+4tNk=
X-Received: by 2002:a17:907:e98c:b0:c2e:8eb7:53dd with SMTP id
 a640c23a62f3a-c31aa0c19a7mr828171866b.42.1791781612284; Sun, 11 Oct 2026
 22:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923060246.2499192-1-liubaolin12138@163.com>
 <1385152d-9e3d-46da-9a3a-299ad60d521c@163.com> <asxlX7ysgW7--bE5@hyunchul-PC02>
In-Reply-To: <asxlX7ysgW7--bE5@hyunchul-PC02>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 12 Oct 2026 14:06:39 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9JuxCHRHnV5LQRgeQe91XHcG16UNTsDc4bwBo+RoYpHw@mail.gmail.com>
X-Gm-Features: AclHuK9uZ-e8zkm6iMKjUGONkg496_2Rhg_e4M_Eo5YbKfzOBZK-eLNbAqXuKQc
Message-ID: <CAKYAXd9JuxCHRHnV5LQRgeQe91XHcG16UNTsDc4bwBo+RoYpHw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] ntfs: persist Linux file attributes in an EA
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: liubaolin <liubaolin12138@163.com>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chenxiaosong@chenxiaosong.com, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> > Hi Namjae and Hyunchul,
> >     Are there any remaining concerns or changes needed for this patch
> > series?
> >     I'd be happy to address any feedback.
>
> No, I think he maybe have missed these series.
Sorry for missing this patches. I will appy them. If there are any
other patches I am missing, please let me know.
Thank you for the ntfs work!
