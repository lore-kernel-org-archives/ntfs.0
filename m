Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ACB50C295
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860538; cv=none; b=kIWT3pbs2oLDe4bM4l1Ui8aUCMXWV7pjJ/tOcU6WLtTQesoristt5/l9iOWD2LxnHK7gBID1KXtmdENGjsvuFzgMzqpUuap8YDNymRk7gdHS1pFmdEjEdcZHJ1gVqzAWDYcBxzKbTkr7ooW4P2Dl8W0Lf5fAWVmummsv0OfEvi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860538; c=relaxed/simple;
	bh=4mrNDgy6AMSKjtPprwZWZ7OJTzobbZjA2LIfx+rptdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cewxFa81ghH0NhmnGI88yHobN4YJjVCkyljZhdT6sP8GCq01LEVE4+ERuAhT+2bHrje8ZfFdAxIwNep8g9xIOFYPmEVzwZs8gYWhboKpzIZjc2HIDXmt10DLk69r0vKK79i8kyXmbor5AhDHwBUrjoyfqBJp7CeRxQzWNlW+Mg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF531F00A3A
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 09:42:17 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c263110a8cdso351136266b.3
        for <ntfs@lists.linux.dev>; Tue, 08 Sep 2026 02:42:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw/hR8/N1O1ylB+N0hzi2qsJlZu4YcslGYkUBHrp967OAClXa3WQx++4rkC4mttBYz48/b7@lists.linux.dev
X-Gm-Message-State: AFuF++kASm8K8rLc49wWQdsFd8BkjNjA+cScWVG/WYUN1fcVtKWuawIt
	DfQvWda5OfEecN9iU2ryYHhtgkDzpj/Z7M3/5Uy+ayJaypDtYl/T5YmY9cgYHAhHUgHa/UKXDp+
	UEDqA+JBwydRMd8Dc96tL+qc0vR3gC5I=
X-Received: by 2002:a17:907:c5c5:b0:c26:19e3:e983 with SMTP id
 a640c23a62f3a-c2619e3ef06mr929376466b.35.1788860533346; Tue, 08 Sep 2026
 02:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907070852.291323-1-zenghongling@kylinos.cn> <20260907070852.291323-4-zenghongling@kylinos.cn>
In-Reply-To: <20260907070852.291323-4-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 8 Sep 2026 18:42:00 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9gJLgGkMfnZHoXAYibn3f8N2JnRkTB8rtvw9-ag-OJNQ@mail.gmail.com>
X-Gm-Features: AcwNN1W9IzQSzR6_c1WN9casCEjIBxK59Aqdd_IE_CafvM5McrSP169ltZY9jNI
Message-ID: <CAKYAXd9gJLgGkMfnZHoXAYibn3f8N2JnRkTB8rtvw9-ag-OJNQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ntfs: NULL vol->vol_ino in the load_system_files()
 error teardown
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 4:09=E2=80=AFPM Hongling Zeng <zenghongling@kylinos.=
cn> wrote:
>
> The error unwind of load_system_files() drops vol->vol_ino on two
> paths but leaves the stale pointer in place while it keeps iput()ing
> the remaining system inodes ($Bitmap, $MFT bitmap, $MFTMirr; $MFT
> itself is dropped by the caller, ntfs_fill_super()).  A third path
> carried an iput() that can never execute: it sits inside the
> IS_ERR(vol->vol_ino) branch guarded by !IS_ERR(vol->vol_ino), and is
> removed along with the stale pointers.  Nothing in the teardown
> dereferences vol_ino today, so this is pure hygiene, but a stale
> pointer to a freed inode surviving the unwind is a trap for any
> future code walking the volume during teardown.
>
> ntfs_put_super() and the ntfs_fill_super() error path already NULL it
> after their iput(); do the same here.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
