Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C2E1FF1C7
	for <ntfs@lists.linux.dev>; Sun, 30 Aug 2026 02:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788058289; cv=none; b=H8YqkELlRCZRteaeecnwMsGZHqdoJtyxoKUzzXSTO7WgZnGM0chFNTsns63IydscPkpLVP0QKeTzq8J39SuZh8BEMifhEalhlCoeX/8Dmzo85PMz81iLVUN2K5reCMq3Ed2QL+ZA1TgkgLcW6dNERvtfOB4Ikw1diNLv2KPmud4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788058289; c=relaxed/simple;
	bh=dtmW7LEfzq7vnL7rO3CsSWiUOt714P5Jvq2lvDMQCY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUFYAhD0Bjdnmt2OOTUwhHsdJUd5J2jQj7fZfK0qqD+J1kTjuPZlFDeY7DCoYdXZywf3tLCzrWldJnjNarahyZRpodMl3kLRfZQWjwURyD+okiVntPxn3BcR0c57vN8mZYcYne/fwuaonvFqTNQkwdPraPTiR+28b3wleBBh7AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRiwdXs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRiwdXs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291271F00A3F
	for <ntfs@lists.linux.dev>; Sun, 30 Aug 2026 02:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788058288;
	bh=7qDDRV1k85VdfK1WwAoU5erYPDU59dYxBHzB4Q8B/UE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hRiwdXs7USyQNSCQy3JxtvrATg0TiX/JPgk2p7hAI9NrzB+4CZYVDNutpDUEJD76/
	 QpH30hk8GkfiBa2z+ioxa8GsMcVamyN51uMycUvzTuyJjVEvXFclL/IxHT50jqyKoo
	 Hcn1Rj6+ZPMzA8fndCusOA5fmYbYWchte0Y51RD/gdNqphfWTfyZZEZoElzn4sYy6I
	 yQ1qPD+MK9/UPJvnNitDkd/K4YH2lt5/DoXrWSyU/BScZEiUZFe2LyX3ni/+ij8Za2
	 fRsJDiJ/BQhwHRaHToVeMYqSa74jJyRab35tgp1m9lBtnmrKuyfYAGwrEuSc743Yp0
	 l3W/arEzlE4eg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so2544956a12.1
        for <ntfs@lists.linux.dev>; Sat, 29 Aug 2026 19:51:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTDzmj8DEr987TILmKRm9fZJTwZbfHDx6/oxF9D5e4dYlEjZYjEJmLXKMY2fKkszQ7I76e@lists.linux.dev
X-Gm-Message-State: AFuF++l6kclN0N3bH4A1x7QUIJf8l+zzcgmNm/9Dn/5OElIKaE7zxPwR
	PG/r7uHM5D4sOgs3i4rho4mqKbACb2okg24j+gO6RY4WgMeRIMzT+yduypTvqVQsTEbilxc1xZN
	G3wcgOPmoDnTEaOupRUEY3UsH3pl+JtE=
X-Received: by 2002:a05:6402:4283:b0:6a5:c4ae:43d4 with SMTP id
 4fb4d7f45d1cf-6a60d344732mr11120062a12.3.1788058286716; Sat, 29 Aug 2026
 19:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828045843.1203490-1-zhanxusheng@xiaomi.com>
In-Reply-To: <20260828045843.1203490-1-zhanxusheng@xiaomi.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 30 Aug 2026 11:51:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9BF+3Gksz-5MPjmS+Q_-KXtB60MRGpncos_3T6b4fm=g@mail.gmail.com>
X-Gm-Features: AcwNN1XMkKLih7E90yQSkWGZnv3EgoXsTcOcGu5vN_kRmql1BvaAkoZTgWRk_WQ
Message-ID: <CAKYAXd9BF+3Gksz-5MPjmS+Q_-KXtB60MRGpncos_3T6b4fm=g@mail.gmail.com>
Subject: Re: [PATCH] ntfs: read WOF chunks outside the decompression lock
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhanxusheng@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 1:58=E2=80=AFPM Zhan Xusheng <zhanxusheng1024@gmail=
.com> wrote:
>
> From: Zhan Xusheng <zhanxusheng1024@gmail.com>
>
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>
> WOF decompression uses four module-global workspaces, one per compression
> format, each with a static mutex.  ntfs_read_wof_compressed_block() takes
> that mutex once and holds it across the whole chunk loop, so both block
> reads run inside it:
>
>   mutex_lock(ws->lock);
>   for each chunk {
>           parse_wof_chunk_table(..., ws->input, ...);   /* reads disk */
>           ntfs_read_wof_chunk(..., ws->input, ...);     /* reads disk */
>           decompress into ws->output;
>   }
>   mutex_unlock(ws->lock);
>
> Readers of system-compressed files then serialise system-wide on the disk
> waits, not just on the decompressor scratch the lock exists for.  One
> reader sleeping in submit_bio_wait() blocks all the rest.
>
> The waits dominate.  Reading an 8 MiB xpress4k file (2048 chunks at a 48%
> compressed ratio, so 2048 acquisitions and 4096 block reads) and timing
> ws->lock against the part of it spent in ntfs_bdev_read():
>
>   backing store                held     of that in I/O   held after
>   virtio, host page cache      348 ms   321 ms  (92%)    24.6 ms
>   virtio, throttled 100 MB/s   978 ms   948 ms  (96%)    36.6 ms
>
> The page-cache row is a lower bound, having no seek cost at all, and the
> share still grows with slower storage because only the wait scales while
> decompression stays near 26 ms.
>
> The reads are inside the lock only because they land in ws->input, a
> buffer shared through the workspace.  Nothing else requires it:
> parse_wof_chunk_table() and ntfs_read_wof_chunk() already take the buffer
> as a parameter and both set *chunk_mem to a pointer inside it, so a
> caller-owned buffer works unchanged.
>
> Allocate that buffer per call, do both reads without the lock, and take
> the lock only around decompression, which is the step needing ws->output
> and ws->scratch.  squashfs is arranged this way already: its
> squashfs_decompress() is handed a bio that has been read, and locks only
> for the CPU work.
>
> Block reads are unchanged in number, they just no longer run under the
> lock, and hold time stops tracking device speed.
>
> This also unnests two per-inode locks from the global one, runlist->lock
> taken by both reads and base_ni->mrec_lock taken for a resident stream.
> A resident chunk needs no I/O at all, yet used to queue behind a reader
> blocked in submit_bio_wait() and then take mrec_lock inside the global
> mutex.
>
> The buffer is 4608 bytes for xpress4k and at most 33280 for lzx32k.  This
> path already does GFP_NOFS allocations per call in ntfs_attr_iget(), and
> in ntfs_attr_get_search_ctx() for a resident stream, so one more does not
> change how it behaves under memory pressure.  The workspace keeps output
> and scratch, 4 KiB to 32 KiB and 6224 bytes (xpress) or 10240 (lzx), and
> its "already allocated" test moves from ws->input to ws->output.
>
> The lock is now taken per chunk rather than per call, which differs only
> for a folio spanning several chunks: a few more uncontended mutex
> operations in exchange for not holding it across the reads between them.
>
> Verified under QEMU against an uncompressed copy of the same data, on an
> 8 MiB file and a 100000 byte one, the latter covering the tail chunk that
> is not a full comp_unit.
>
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Applied it to #ntfs-next.
Thanks!
