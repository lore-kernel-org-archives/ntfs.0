Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B458286D5E
	for <ntfs@lists.linux.dev>; Tue, 25 Aug 2026 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787621288; cv=pass; b=WvT7H48ak3Y2egdG7Opo3pQDipi3gXdHB9MB0g73JD4bQJzSchzRumMKWaIv924KOShVcRBARPQJetFlGRFG8uusaF8Hcl0y4RxYcVCqzXMn5+O/dESgJ0EvEK8TMH7gKjpK0eJsNTwfvol3hHfMO4Ll5K9+kDNCEVR+Wiqzvkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787621288; c=relaxed/simple;
	bh=OgFIw1ITBHOjtxRBAvgZTYDe6yst15gd8beHS5lZ8qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4AtETmMup+RbBeldo4KP5gMzAAxxvN5tdG7kwGeubekzaKAKsS36Ln/rygWQc6XdH26oyNAhp3nv6fYg6DPidHpEzPws9TucNTyVpKcW8VQEcZ/IzN+Myd4VOV0QPhxk3D5QDIUOMHTrxV0ZFKs5EzVZQ0O0Ie0rFPJ6hcIHW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBMlAO3U; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBMlAO3U"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso4041447e87.1
        for <ntfs@lists.linux.dev>; Mon, 24 Aug 2026 18:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787621284; cv=none;
        d=google.com; s=arc-20260327;
        b=c512RTtfxaKsZ50pzsewitPDe0E8sqpRVzftL58ZcR869FqfwjJf+m1HAmbisOWih/
         PO6p2C8RGvubvwKrliWJsQFuF/R3/PRhTXDKB4iKdEs7tAhMyimlPEANnNnQ7hJHjr+6
         epE26tEOdSkmZSqQsfDJpQY8ryuJ6qeDIjZv0Dmb4fPkpShufigjE5VAkzeMQOBECmd5
         fw/VGFWeKTTmYnOwm+SA28WQhEW66WBNDV7aR1uI1vVHjmdGIRGLeAA2K4+vSM0Ija54
         LWnPVeFEPEfjZ67g5cC0vfBq8omg+hPE0uFXPRJkloSzWInN2UJ5+YQzW4wXDYv0WNT6
         oYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OgFIw1ITBHOjtxRBAvgZTYDe6yst15gd8beHS5lZ8qs=;
        fh=6DFHX+EydnFRlM8Tr3IJQ+DPfow+4sSHQ4pI43fdoS4=;
        b=EyVVe3oP2GOhPxkXbySI8UHpxXw0VfonSJBa5zR2zDVi9t8G9VcNbfW6A50EI3FtvE
         WtylZMIbuzfcjdbECzjFqBFX2N2c38TtMoZ6GbSy7IlsiRud5w6kYz6bJEokQztK1kwT
         AtgR4LCtWvPijW67UEsh+HHJqtl651yPZ65C6iPiSRgEOmW9/0sbpZGQqyuANAyFilKM
         krxzju1ywNmYW4JfMt1svR6RAWws15zisu3qczbRhMOf1V4IZlPFBXFZiDuihn7U/L9R
         anl17SibN4o6oqIczfi3FaBHaBBEyQyjj6QyIf4t6aYSRmAaWcn2zt/L8TZv79BQa4JN
         R7Wg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787621284; x=1788226084; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OgFIw1ITBHOjtxRBAvgZTYDe6yst15gd8beHS5lZ8qs=;
        b=QBMlAO3URwBkOqpD3N7hA3j62hJUkv0q/4LE0H3jBshK67v8vXJ/prYx6mcv2daKVD
         SZq+ERnT8A3RExxjvMzN1PxRoXnIzqmuYUhnwYG0x1jk0lgK7oB+r4VJOdTPc5/awKe+
         claQ26OOmGKF0mvQH0I9+MWjTqnOmeh1WEN7ROxSgz9zor5pBlIVVtVtZnd+UTbRy5E8
         bnC9VAEIS4QhewnzSA9i22Uq2MH3c2uy7+0Jjz8DhDS5vP//trDVlKdqKjP+BLDyBj4t
         Y+7PgPmCwJRD2hEn4ZCuT3CmtW8WdnFaNRNBSzyp5Re/Fp8HoF/d+Obxgn7JMQDGfdTN
         djqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787621284; x=1788226084;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgFIw1ITBHOjtxRBAvgZTYDe6yst15gd8beHS5lZ8qs=;
        b=MvCOyUpsfZ+lAk1tupiWOafWDpCPtWcWLh3eKdEKnTSKiPJqUPyCRweD/CPfcPeVc6
         VoM0sJ+aDb/T5zaGFVbbHf1H3RBod494V9rabl+vcW3ztfG3nisE0VytMLh5RmKYP8C4
         83Xs/6eegZEdqpjZ/ulERphKVB2N9/WvHNj1q2WDCDPtWPX9XdwZmILfVOC+MKFONkaA
         rdVBAvtJ8XNkCuqy3VXH2Xm+xgI8a/tmbVyiHYPM5RXDY6vAYvOGOVkDmm0DdZfeTd5P
         JnIj1SKJQJ1TkmGlsM81d/4OVsplvEnAdsDZh/P4O2eu/ZDAhXAu3zwKb5o4BO2dx3Fs
         Pnkw==
X-Forwarded-Encrypted: i=1; AHgh+RqY6m8NioRXaS9ih81rd6s9yX4Z5Kutee80EFM7P49sNbvDlODIKDr2UR5oPUoymT2U4Ntp@lists.linux.dev
X-Gm-Message-State: AFuF++lAVeAH88YomgzuXQfiRU64hE0hab3JHGElqBNHNc5py336IHB4
	tWUlUVf8qk8cZXWMljMytJeVCFmUrzGpzuHt0do2/OC05uenUBnlEVPjHe1P6fWkORmZnD1g2UW
	6gxoVqQoF7JZ/72M+2rqq8HO+Ct0Wnqn3+Q==
X-Gm-Gg: AR+sD10kSPx43ldyAs0zweW4jFwwB+PdtNqyjolmNyHSD4UVbgUqLtEndaJyZXEMKsA
	LnFKMac/VKHRtYSpPfbg83FSaZCrUAGCwEzP+n6iaixloOsmP+k6n/GTHO7B15ZQ5SAm4w0INud
	/GKqoAoLIOahgkEB7T+wUpXWop4dS1Sb3Nu4CliV2kdH0mg0kvyiYNpleOO6RJo/MTKBv/xF1kN
	FtnPGPlOxDUkOHFihwgheg4Sce1bwoMzvJPrGnkWxOgyb6QpTAIUVWBvc92P96dxlCh9k0xHwWv
	XNcYt6o5MIcVzpJ4+IImX2P7cYbDj5cK/WSGRynRGLoR
X-Received: by 2002:a05:6512:2356:b0:5b4:5352:e2db with SMTP id
 2adb3069b0e04-5b49cdbf946mr629437e87.20.1787621284021; Mon, 24 Aug 2026
 18:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a8a9d9a.fdee0002.34cbe9.559f@mx.google.com>
In-Reply-To: <6a8a9d9a.fdee0002.34cbe9.559f@mx.google.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 25 Aug 2026 10:27:51 +0900
X-Gm-Features: AcwNN1WIXAg39AFOqUD6aJisxaiVpxY4q1Ck_OBHsL7d3qXQ8FwoFhkEifyu9NU
Message-ID: <CANFS6bb_WdkXBanNr+MXXN=5OemG_DfmTAec7xCNyEkRBrSUSQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs: compute bi_sector in 512-byte units
To: Dennis Tighe <dennis.tighe@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 23=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 4:13, D=
ennis Tighe <dennis.tighe@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> bi_sector counts in 512 byte sectors and not in multiples of the
> volume's sector size. Under "normal" circumstances (with 512 byte
> sectors in NTFS) the current code works as is; however, when we have
> a 4k sector size on the volume the current usage of NTFS_B_TO_SECTOR()
> and ntfs_bytes_to_sector() end up converting to the number of 4k
> sectors after mount.
>
> Reads work today on 4k volumes as bdev-io.c as performing the shift
> correctly inline. With writes, we end up with significant silent disk
> corruption on these volumes.
>
> This fixes changes to use the new ntfs_bytes_to_bio_sector() function
> everywhere we're performing this calculation (including the existing
> read path). For the change in inode.c it removes a dead code block
> rather than updating.
>
> Fixes: 40796051991d ("ntfs: update in-memory, on-disk structures and head=
ers")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Dennis Tighe <dennis.tighe@gmail.com>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
