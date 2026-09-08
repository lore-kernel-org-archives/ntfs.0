Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9DD3264CF
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860484; cv=none; b=MI8LSjTKhp5MZFb1DmJIjHQzcAcNyqJm0OcXzvZIQS88R036oORueaZgHMDVPXK7zlyBP5Mu1J2s3kqgxOt/Yq02Q2uz0WKo8/1FCSmxKYH585UEvSLtMkUTwTN+x+GcyqZd9A7r1PnTDGJzpJvKR1yqnJIDTN5CQ2F3OpDKJDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860484; c=relaxed/simple;
	bh=RwLQFqLrDNVfkarvRNPNob4p6+k/51OfvwavENLv0Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keh76VueEJdEh10DqeZYKpEIgy44VFAmDhBiyV3oE0pnF+Hm0aoDzI6SG2IDgC2u1/zwR2vrmb2l59NAYvxtNu9VGGGxfvfQeeMcv1hQmDJPfLiic0GTNiAcoWCpAziOuys6Yo1MpNpAg+O01VY2CU7JsFiV26kF4+BQNZLn1l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQaH6eRO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQaH6eRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69781F00A3A
	for <ntfs@lists.linux.dev>; Tue,  8 Sep 2026 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788860482;
	bh=/o85pS/qqd9I0BuTSjXv275q+WHwEmXL7pWePkBg4zM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cQaH6eROPbXpCSWdztk67bny7BITqyRlfqMxjfYHXIfU/uprINaVOProkBIcXEQRA
	 /zwfPsFBOhYzBP3PS1xj+dxBWfocOb3xeszA31pfyjT6UDtE4Vmp8kjlYCFCs7fpw3
	 hAOEZFxlWEHFG/J9S4AwBB5fdK1C3AvmlPt+IKVqhg+hbS21/4SCqMWevlDDnpJ+N6
	 OdJaPPrFF7s1cuS6xZNCggKxTFy3CTg+zsHLzdLDSlb4nXpKYyI5qrAIBDYtDWDoaT
	 b3Gfkt+WwAhCgwmyhoycAHVK1TQw4SZKYe6EbriAXb5FJRQ7vJmCVZnvy0/ZA19otp
	 +1c6/OltifWow==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so506619666b.2
        for <ntfs@lists.linux.dev>; Tue, 08 Sep 2026 02:41:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBygJ2KN/r6VDKSfJXHvDZ8l0YgdVh9Z4Y0xj8ZK9s3dRLa8zb6PWn6YsthcaWJ5x1JUFF1w@lists.linux.dev
X-Gm-Message-State: AFuF++kL88Lj6FpBzcEnXjM3yg3p2+B+OydeP/PiTyVHWbC87t6QEe/8
	8NNjLnmSJGT6ntwCPTme68Md0glv7qRI8wQ+BRlC4XoTKYgoOtN4fQO1E/8egQrcVWtWMVdrgor
	7qW6/XCulU7Ylo7ocQHB7WNKEBJaEqGo=
X-Received: by 2002:a17:907:ea8d:b0:c26:2795:b494 with SMTP id
 a640c23a62f3a-c262795c1b3mr687549966b.49.1788860481301; Tue, 08 Sep 2026
 02:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <SY0P300MB031263862D7FD47834F1E87FDEB42@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
 <CANFS6baT-+_u+c99qThd7jekqXZ3BW5utLPERLa_X3FE7XiBNw@mail.gmail.com> <SY0P300MB0312DC95FDD1B45AF364267EDEB22@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
In-Reply-To: <SY0P300MB0312DC95FDD1B45AF364267EDEB22@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 8 Sep 2026 18:41:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-8aGEA=cPifa48iF8Ek8_SjZMSEzpK0+bW6Y7PgGsYNg@mail.gmail.com>
X-Gm-Features: AcwNN1UoA1V7RNEpcatzH43l99XRM3sttmDQkqqVNWQ3Gm5BlcgEnGg1xEUXCU8
Message-ID: <CAKYAXd-8aGEA=cPifa48iF8Ek8_SjZMSEzpK0+bW6Y7PgGsYNg@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: fix $MFTMirr write offset when it spans multiple folios
To: =?UTF-8?B?5pyxIOWkqea1qQ==?= <zhutianhao75@hotmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, "ntfs@lists.linux.dev" <ntfs@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:41=E2=80=AFAM =E6=9C=B1 =E5=A4=A9=E6=B5=A9 <zhutia=
nhao75@hotmail.com> wrote:
>
> When commit 115380f9a2f9 ("ntfs: update mft operations") refactored the
> MFT code to use folios, it assumed $MFTMirr is allocated contiguously,
> which is indeed what mkfs arranges.  However, the folio rewrite kept a
> leftover from the old buffer-head/runlist based implementation:
> vol->cluster_size_mask is still applied to the mirror write offset.
> In fact it is no longer needed -- and in some configurations it is
> actively wrong.
>
> The bug triggers whenever the four mirror records do not fit in a
> single folio, i.e. when mft_record_size exceeds PAGE_SIZE / 4 (for
> example mft_record_size > 1KiB on 4KiB pages).
>
> For example, on the built-in 4Kn SSD (Apple SSD AP0256J) of a
> MacBookPro14,1 with 4096-byte MFT records, mirror record 3 is still
> written to the location of record 0.  $MFTMirr therefore gets out of
> sync with $MFT and the following warning is printed on remount:
>
>         ntfs: (device nvme0n1p3): check_mft_mirror(): $MFT and $MFTMirr
>               record 0 do not match.  Run chkdsk.
>
> Fix it by always adding the folio offset (folio->index << PAGE_SHIFT)
> to the base LCN address instead of applying the cluster_size_mask
> truncation.  This is the standard file-offset calculation and is
> correct for every combination of cluster size, page size and MFT
> record size, provided $MFTMirr data is contiguous from mftmirr_lcn
> (which mkfs always arranges).
>
> Tested on the volume above: before the change mirror records 1-3 are
> all written to record 0's sector; after the change the write-back
> probe reports:
>
>         ntfs: NTFSDBG pre mft_no=3D0x3 folio_idx=3D0x3 ofs=3D0x0 mftmirr_=
lcn=3D0x2540c5 clu_bits=3D12 rec_bits=3D12 PAGE_SHIFT=3D12 sect=3D0x12a0640
>         ntfs: NTFSDBG pre mft_no=3D0x0 folio_idx=3D0x0 ofs=3D0x0 mftmirr_=
lcn=3D0x2540c5 clu_bits=3D12 rec_bits=3D12 PAGE_SHIFT=3D12 sect=3D0x12a0628
>
> which matches the expected sectors computed as:
>
>         (NTFS_CLU_TO_B(mftmirr_lcn) + (folio->index << PAGE_SHIFT)) >> SE=
CTOR_SHIFT
>
>         record 0: (0x2540c5 << 12) + 0x0000 =3D 0x2540c5000 >> 9 =3D 0x12=
a0628
>         record 3: (0x2540c5 << 12) + 0x3000 =3D 0x2540c8000 >> 9 =3D 0x12=
a0640
>
> A 13 MB file write succeeds on this volume and the file is byte-for-byte
> identical after a umount/mount cycle.
>
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Assisted-by: UOS-AI
> Assisted-by: CodeBuddy:Hy4 preview
> Signed-off-by: Zhu Tianhao <zhutianhao75@hotmail.com>
Applied it to #ntfs-next.
Thanks!
