Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE373C0600
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977466; cv=pass; b=gwE/WkNqwLOSHaziCZ9z4ZOmM/tmfKt+rDM9IUDZ53yriKD0IH8djEV3oJqUT5BlOB86jqvFCqHXxfdoXuwdUf/oa4W7rc+3rnx4W9/jZvNEyEQbzZtw3A//99LwgrOJK3VgtFmC6WGyJ0pD3spx+ibyqgnVGpsm6dUZI987uX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977466; c=relaxed/simple;
	bh=wTKF3GJe24qvlJZnP3fb1zIfYdXZhI1ydDoNfbeg+Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ViRwjgO/RbYEr3KqvyAyff89pTsJ9taMCcTMpcznGrfWkPBGv+FHiTqwRxHV5k3tbR9no/O17e1HK6aeH1psrFcqGaPl9XLKIFxjeNwNx/WlXzzpeG8UTQmPj2xqfeY0swtoj4kJxzq+B5cjZcvLj9kdZO22HpBe/NnCSlWBmf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sajLjDLI; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sajLjDLI"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso2488310e87.3
        for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789977463; cv=none;
        d=google.com; s=arc-20260327;
        b=R0iAhmGivmLK8vN1zbamkF0Xub06bUGyeun9IqXbtKtd6wkaJRpL6C9Z2GqdNq02aP
         r5C0paL2Y1aJFWJedgOvqFzsdbUGAGPiHnRNFSoiuMXQG1y5BUExClzPRZWHe/Q3wifI
         jnEIqoJj4+Ss2nsYjQ1zMnJvfPeWZs4glEr8Dv2R1iwsboKmIt6LINP4YpHOle+oaav7
         px2E5N0Ta6CGTU53rzgM3gvxWqul0U43EgdIrBou/9loGnSzp4pWASQ9BXLfyyy58cAW
         rin0C1A4aANW0ZO2BBep7zc5DNBI1DoAUkL1Yvqe5WY+7wAKvoozyFrHYQpO1wdmBqpg
         QYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g9IsRdNBpVaOm+BvbZJMl+aEIv6TVvsoIWi27r6K2mo=;
        fh=WlZpunhnZ/uy6tDqt4+WbKQjR9RBDy1dtQVzcrGvNLs=;
        b=GeWCt9hDjIlqjPlsSiF+/MZjxDaorGUT/fyaosjHTTafdzVBNmHXJOQf2Pc0boFtdO
         BQCuJTw04XM/RhEOGWgMGIAkNEMz0ZROLT1S8fOz+wUrvp3KburCPMPoHt5Zr84g0pM9
         y3AO0jI1z5w/iqlBhTOXBQyIRxtgOt6uBGihTcjnKcgXcf6cf43B3W//9jrDTBb1+AF4
         CqoLHneBgULA32/PNhFp8SRsO3tr6ryrnR9UJt28wNdZ1AO4ImznLULVTbY67ZSJjzpT
         hL/cvk7Ky84K0dDJ/+AbY/cgSnUE8YKIk6qOFs8IHwurbiTKxm15+PQZV3AAfXdCeVDO
         jZWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789977463; x=1790582263; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9IsRdNBpVaOm+BvbZJMl+aEIv6TVvsoIWi27r6K2mo=;
        b=sajLjDLIE0pjDvvCB/kRCl39jxfQ9wJuKORaix4Y60wX95M/94DV0dPoWC2ZHNBRWE
         Vd2bVNM6sSNX7UdKkMkoSrJO6lnM0O70F0XjlnekP/vRoSFtCi8i5/bXX6dAbP9JHpEJ
         PCaa6fs7nZroWUAATWw9DBjhQpZ6TjdNZ23qpFkQxpW7jvaX/oQzqWPTTtGvys1wenGc
         GgSc9B0YN0k9gHktQ1zqs55WWNtgy7X1Zqqh+WX5XuS/4UMoJB25jm3uMOd0zrLX2LTN
         ILL0HlCOTanXFvtY3NvE1eUAcmE8/iD04rviXfSUotWzC6hdUzL2aKu+lZDKr9BBUzwS
         hriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977463; x=1790582263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g9IsRdNBpVaOm+BvbZJMl+aEIv6TVvsoIWi27r6K2mo=;
        b=IXZUeIz3fHNazrd73LWNWWEmmNRMTgq59fJx5MO3/v4AGrkmpOtJS0XPTuRoe3Ep1h
         zWpAhdhmTRGoD8vXIjLGifTKeOhG3tmvl8GU6xY0MA5Q7sTdNVM4qOZKPfrQQYApv++H
         rktLfQYuTn3X5UU/j/ViwlUaqD+NW6Kaw1FoX59y/qOUybnUlgeyTwrSM5annTefVN8B
         CR9BotPolvi0WBoZhgPufdbIyeX2MtH+zx1T8/XmmNsnLPlWW1eSFfBnmP/F5ZLBgq5m
         kLePdVdsgD7JL67gryLiEreGpSknEU2b7vqKtW654Lslt4yzjePITofBWazhbd5q3JqX
         cixg==
X-Forwarded-Encrypted: i=1; AKwUvByUy1LosVLKVtbW5J6XveaF/cg/vv+Gu/uXAPtOa+D80Tw631L9GvWolr38BiQ+VlptYBV7@lists.linux.dev
X-Gm-Message-State: AFuF++lMLt0mjOnymiV2OHLh5NojkIVetzOvhxLU5XIEzLwSmeXJaG3h
	MMFd0VfyyDfzZ/3VFB7ogpFRcNYELUdr0x1s2MkyBS0VUYmQdSZ/NWvv5VgAE9rprcN+OERdCIp
	sCJ1pULQOXYc5IotTatMzVnFUy01R6efYWQ==
X-Gm-Gg: AYBFou0ObFeENNe1r+1JJyDicNTzlaVYNJJO4UxD47V2wHi+r4wyBiz7oHyhAmTirux
	N+ufa5Ymjz6OAvF8QpvB8zYbBJLypL4i1bp3vVW3CB461UemWungBC7XfFn3SkposI2B0Wug/1g
	xL8nJH1m2KBsMW3o8n2bTNJ5Dr9uwvmfldZRI/8OfvP/lvssJXe7LG5AZ9HIDsxqpPnvOZ++l6/
	dbfRdKekVFCUxrbxjo7EawB512wfs/euSscmcwfNsFRBfOA7hxB+r4QR/wQaNtWRZqJKNX+fZqv
	xwBNzdLXMt9fyKMs4fgmY92VH6lZgD9EUnizJmQBKeLR+KJHfPOTaJI=
X-Received: by 2002:a05:6512:104c:b0:5b8:9ef4:2bdf with SMTP id
 2adb3069b0e04-5b8c1809487mr2756705e87.26.1789977462770; Mon, 21 Sep 2026
 00:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920025955.31209-1-zenghongling@kylinos.cn> <04255390-4133-4e8e-81ad-4d2402498431@163.com>
In-Reply-To: <04255390-4133-4e8e-81ad-4d2402498431@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 21 Sep 2026 16:57:29 +0900
X-Gm-Features: AcwNN1XT333aOgbhzPsm-JYe6T_jxFAvajhOncAJFvThd79_ZeNb3_O9r7eZWKk
Message-ID: <CANFS6bYLBPr+FmE_MVWxBBMw+Qz55EFfy1u6UmBgkTak2CMyvA@mail.gmail.com>
Subject: Re: [PATCH v5] ntfs: mount hibernated volumes read-only regardless of errors=
To: liubaolin <liubaolin12138@163.com>, Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Baolin, Hongling

>    If you agree with this approach, could you please incorporate it and
> send another revision? I'd appreciate feedback from you, Namjae, and
> Hyunchul.

I agree with this approach. It looks sound to me.

>
> feel free to add:
> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
>
> Thanks,
> Baolin.
>
>
>
>
>
>
>
> >       if (unlikely(err)) {
> >               static const char *es1a = "Failed to determine if Windows is hibernated";
> >               static const char *es1b = "Windows is hibernated";
> > @@ -1581,12 +1594,25 @@ static bool load_system_files(struct ntfs_volume *vol)
> >               const char *es1;
> >
> >               es1 = err < 0 ? es1a : es1b;
> > -             /* If a read-write mount, convert it to a read-only mount. */
> > -             if (!sb_rdonly(sb) && vol->on_errors == ON_ERRORS_REMOUNT_RO) {
> > -                     sb->s_flags |= SB_RDONLY;
> > -                     ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> > -             }
> > +             /*
> > +              * A Windows hibernation image is not a filesystem error, so
> > +              * this is a safety interlock rather than something the
> > +              * errors= policy may downgrade.  The super block is already
> > +              * read-only here: the temporary flag taken for the check
> > +              * above is not restored when the check failed.
> > +              */
> > +             ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> >               NVolSetErrors(vol);
> > +     } else if (unlikely(temporary_ro && sb_rdonly(sb))) {
> > +             static const char *es1 = "Errors were recorded during mount";
> > +             static const char *es2 = ".  Run chkdsk.";
> > +
> > +             /*
> > +              * Errors were recorded during the check or earlier, e.g. when
> > +              * loading the LogFile.  Stay read-only, like ntfs_reconfigure()
> > +              * does for volumes with recorded errors.
> > +              */
> > +             ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> >       }
> >
> >       /* If (still) a read-write mount, empty the logfile. */
>


-- 
Thanks,
Hyunchul
