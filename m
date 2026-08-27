Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FEC36897F
	for <ntfs@lists.linux.dev>; Thu, 27 Aug 2026 03:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787802996; cv=pass; b=uEkZk7VpEPuqOOt5czUmiMHp4xs9M4AyBzPl/L1z/BL1iSvdibBlbd14l6EvPJje0jFMDU3m1sABrs2/fSwHSENEFge7gvxzSZBDT3Xnh8caG7rXdwpbhtZ+5q6VbJ4uqKRBY35lGXok0QPyFWl9rij1ygX7dYATwhDM3i+TuOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787802996; c=relaxed/simple;
	bh=4YhYn5FSlPPx84gvttWg80Ipc0md//aTq9lSol72NVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgqP280Pc0Ow2seQznvaxvsYoncJjeG6gNbuwojINbIB+hdtI6qkwHk872TWJkepkU6mNb4NE8mPlHLzZVy5jGUJjtbZ4VR8AGenwGPAKAK+Wg01gz1N7C2K7pW4AUiXGCcvLBRNr6PGxtBxuKxnx3wvBali/pPlZO9vj2myV0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NO6M3q1C; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NO6M3q1C"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c74c469e8so9426051fa.0
        for <ntfs@lists.linux.dev>; Wed, 26 Aug 2026 20:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787802993; cv=none;
        d=google.com; s=arc-20260327;
        b=mySnRzp5d5el6X43P8xDxusiKc/FeXAnHovJW8IzFgEZVW76eyVeT/NVuD0K0Ol1bz
         APWJaNScMkXXqeZS1iGZ1wWbyzI382bWiqE+twVEumfFD8T2aBc4V7lPlaXgHeVpGY1X
         bLtqtKH++fi02jHoUHgbj79n/vi2Laxr+uqsnwmQuu7HL65lnvmgRVWja5FAjypRt9wf
         7LWnubbOzCA8aff5hET0rWTQuux+UW5A/pTyGwCOIwc6SY8QKfGEEEW52AXEAlDU9c9B
         lqgFJDxi6C5jfweO/U64q+kYfoog46bHJvoKthMxn2IaYBEBsJJ+tPeB+ykNqV/aq0J6
         xBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhmHfBCxwPWUairZ9+s6ng99fn2LZtkTw0G10u+xfDk=;
        fh=o4IuJtVdr8P+8nyhwvqYsPSkR9PKwnuYAocUUmSfB7A=;
        b=o1M6/qTclHrqI6kznyVTtD6E0AJg75J2za2HlaJnRaWbkPT+1gj00v+VNhvhP6O8Xz
         8PCtbTcF+cUojWBtAew/Cn/qMjqAKjYNaIb5ncjYU4ndbs16r/9FwL7uRZs2avGH5Yis
         aMIidwK6khQ4GQTlrGLYkbyWUoNufJqlMpbPuRanZ+yYzjJVpMaF9bth2cGQKqwYujDu
         mZ5rUR9Og8+a1YD58nDBkIfhoQhZLIiBSBzTZw520O8eKcLz11SzlEl6f//dO73Vj3bi
         tCKrLYyHzrkek6AgF1FwengbOcb5c0AMBhZlOxFGJfN9r8caw5hqx0GstaR93qMOB/a8
         uTaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787802993; x=1788407793; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MhmHfBCxwPWUairZ9+s6ng99fn2LZtkTw0G10u+xfDk=;
        b=NO6M3q1CmenEF7AWa0pa4S2vHYqw16Pt4CSSDazWbVg8pA0f/m0uy4mfq6Pz+knHa+
         TyGq5L9ZJecKU2UFh09OTXOya7WZo9g1Ln83nOclX536RVWTHKXAXVslr3B6tQ7e2gJX
         yPesHDmgJKqmEzhyxUECxEcLaXPJU7RN6rKpqFmNEBZpv96AfV2DPG6YDxbuw8JwzosR
         cr6BLGQYesbc1AuRcz33OHE1rbbm4LZ3vDvGTzjrp3Q3rPFzYMLOlkQKsKC2ekn6rl9V
         FhUn34wVsg53l4DCrNd43p/0FGahlSN0lHyCGCs8NCNa98eqCmA87cFlkuTw9fPGnbFS
         A8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787802993; x=1788407793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhmHfBCxwPWUairZ9+s6ng99fn2LZtkTw0G10u+xfDk=;
        b=NDnJ7Y3uPsOjSyunSJAjRlIu7ynwNbbr9Uhq6NpDZC9XffbzmewOz1j78fBvm91GNH
         MMLC5wum7jBMaetBDLIT2ogODahsP0zl69evTYvsJ9Ea15m9+7op66B8e2baEULgJYJc
         e8iEyldkb/C4AGHjxuzkulrsnsbXMVAekf7q+g8I8HikhIirs+UGFLpeMtf+U4xwQJIk
         kM+I57nxQ3IiwhpIYBWNcDTyZqMeQdxmePgHtqwXpUQcBfGooivuedLlIXf3YrtelkQb
         Fatg5sGBGNv4awWz7eRw5IgEqV+QQuNYEG82AbJ5Q1XBOlmTH7Gb3nwH/WVamrqPD1fi
         eQxw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3e+jmHZtt5L0ihYpEWBT4Ki5+6Goi0hZOcOAWOeJ0DykE6wTvc+Y9K21S6//sCfKC+2TH@lists.linux.dev
X-Gm-Message-State: AFuF++lNL/TaAihB+HlEZ2/O+LyHqWqC27TUn0sGW46nWOmSzQL03m8x
	W5uD9vtqHIjYjaM4mghtPwr/GsVqV2J9b/2MEMWD1HJQY4R4TRhOU5df+GVOk5lIZMHQbtSS/Kj
	xXU27hJOLomPQDp8ktz9nHuwLIxFzg2Q=
X-Gm-Gg: AR+sD13/v7juItBXeSE8+s8nYt5dcSPkk70kJP5lWTk91fLbsb/cWXFHwfn/hZOpq+g
	S+sUyu/2FNnJ1QkJ5/BgnLQdQLb1umL3ju/HL4g01n4qpYlkKeTJBc5Bd+WRqE1Dd6B4DGkgtDl
	V8rsw7fkiDOL7nxflbns06dVePtkq8rqrcYCMGxiSgjE5jWNbBdD6mINswV0A2Ddy6xbNARmFSG
	sT+Tfng5HAkURTCtXKckffWllbKsNBOyTqlrkeFwOGDUlF1koPRFXDNVUDpDK7mraTudOjJjxyO
	8TY0T319ZsEFsbuOapI6kTYOn6Ax8i3QPvIGhTMzWFoa13yCRjE9Dfyg
X-Received: by 2002:a05:651c:2124:b0:39f:75f5:907d with SMTP id
 38308e7fff4ca-3a1fd454d23mr24384781fa.2.1787802992881; Wed, 26 Aug 2026
 20:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824075935.170457-1-zenghongling@kylinos.cn>
 <CANFS6bZczfbx3HKO9pN2wOm9Wy8oCX0GAA_uAoXzhu1j34Jo7w@mail.gmail.com> <6A8D37D1.7010800@126.com>
In-Reply-To: <6A8D37D1.7010800@126.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 27 Aug 2026 12:56:21 +0900
X-Gm-Features: AcwNN1W4ADiFsA1DExE0Miz_nGo___YnVaIMS7fjmTlaGnkmeF19MvmI3fsDMKk
Message-ID: <CANFS6bbfYTTyg_3vUi6i42mGczQyAVeQJc59SMvcu2xqOg5y8Q@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix memmove overlap in ntfs_new_attr_flags
To: Hongling Zeng <zhongling0719@126.com>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 25=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 3:36, H=
ongling Zeng <zhongling0719@126.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>
> =E5=9C=A8 2026=E5=B9=B408=E6=9C=8825=E6=97=A5 13:45, Hyunchul Lee =E5=86=
=99=E9=81=93:
> > Hi Hongling,
> >
> > 2026=EB=85=84 8=EC=9B=94 24=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 4:5=
9, Hongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >> When the record shrinks while the payload offsets increase (e.g., enab=
ling
> >> compression reduces padding, making arec_size < old_arec_size, but the=
 header
> >> grows by 8 bytes), moving the name first can overwrite the old mapping=
_pairs
> >> before they are copied. Move mapping_pairs first in this case.
> > Can this situation occur even when
> > it is not a crafted image?
> Hi Hyunchul
>
>    Yes. This can occur during normal operations when modifying
> system.ntfs_attrib
>    on a file with a named non-resident attribute. The header grows
> (adding the
>    compressed_size field) while the total record shrinks (reduced padding=
),
>    causing name_ofs and mp_ofs to increase and creating the memmove overl=
ap.
>
>    No crafted image is required - a valid NTFS filesystem with the right
>    attribute layout will trigger this path.

What I am wondering was whether there had been
cases where such padding existed.
I has been considering where we should guard
against that case.

This patch looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
