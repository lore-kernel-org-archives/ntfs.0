Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27271372EDD
	for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 23:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790726353; cv=none; b=SumLz2iu7oe7BSD5QlDKu4ar+iEDkjWnTZl/IKNiL/pSr8odOf+qRIzwwW0uWB1OzvDCruSL63Igl4j8FOFbBnLjzGMYsogug5UQbBEeQwCkYpciuDIkW7oemXd8a41oEB0Y9U5NYklDfQdGs9YIC8ccwKcshhfLfL6jVBpxZFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790726353; c=relaxed/simple;
	bh=IRYqe8zCoKUR4ujMjKxB/NRwHG9A+j9KmCr7zwX5+vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfqA68v+cpz/EeR7xPaMJ5zP9o3KurZuN3UWMEHg3RWdov1iNf/PzbbXGRUVLyKcPbIsvvArV/kZJ/xnYGydTfGLjEmhfIzDFhtk3V9o8tvJpTgWHq8oudqiPl90svpbue24O67H35tMgiPlwrENDKOa/HZsKhaDucvHY/BHygo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbArg0WD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbArg0WD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73291F000FF
	for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 23:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790726351;
	bh=IRYqe8zCoKUR4ujMjKxB/NRwHG9A+j9KmCr7zwX5+vs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YbArg0WDa/GjS6/giYoQ/NRydFNqDFwdwDLr5dsxroPH9/hsgXkVcD3teYs6E662B
	 AfNZCQwohMOahPSf1O7GxiEFU/BqdmQ1AywAvFYYoPECuaoceiAi06qQ34NRYrkcs4
	 pGx8J8R1ZcxpKTMGgluy6lCJVjEDvPY+asui2vAO5F4FUU7n1u+3t0CyJNp957ZSVf
	 vR+O694ocrhk5+cIdn3m1Fx7Mi1Gos6FxjZ+dQdd4mg5GBq/Fg8BnxufQHKxjaBwQh
	 AwWtEq5eR0XHcF6t8wHcWyUYyWaGN+1PYQnGw8K5SqqmhaOShrdP82NPzETu5lY6m0
	 0NmD7RY6CxjqA==
Received: by mail-ej2-f17.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so721652166b.2
        for <ntfs@lists.linux.dev>; Tue, 29 Sep 2026 16:59:11 -0700 (PDT)
X-Gm-Message-State: AFq9FYK2DpL4rwh8fe14qhFZKeTKefOm4b+7QWJ/TnEtmAfoYljALR9y
	SZvRigQbNMW9WPSfLruomI7abQVyE9VXCXQ4dsO4EarHMXlx6c+gK4ZxBm80QBMzc1kkClj9cVQ
	sgzipD1pYR2XhtKz/VC90RRAa+qKoeCQ=
X-Received: by 2002:a17:906:8f8a:b0:c2d:c6e7:9ea5 with SMTP id
 a640c23a62f3a-c2e1673625cmr72342266b.48.1790726350417; Tue, 29 Sep 2026
 16:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260928072451.1776484-1-hyc.lee@gmail.com>
In-Reply-To: <20260928072451.1776484-1-hyc.lee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 30 Sep 2026 08:58:57 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_mzP_JZpQMDHBfd5FkhjF7UwmUmVYh2=wFctoxr5zPAA@mail.gmail.com>
X-Gm-Features: AclHuK8wz38mh_CZFHlXdbBAp0Ph9-n1n0otNXtKRAVRzEyUxbsmYp-kbH50WPw
Message-ID: <CAKYAXd_mzP_JZpQMDHBfd5FkhjF7UwmUmVYh2=wFctoxr5zPAA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: avoid misclassifying directory reparse points
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 4:25=E2=80=AFPM Hyunchul Lee <hyc.lee@gmail.com> wr=
ote:
>
> Windows directory symlinks and junctions can carry
> FILE_ATTR_DUP_FILE_NAME_INDEX_PRESENT in their entry while the reparse
> flag is stored only in. The old directory enumeration path treated such
> entries as DT_DIR, allowing no-follow userspace scanners to recurse
> through symlink targets.
>
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
Applied it to #ntfs-next.
Thanks!
