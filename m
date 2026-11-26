Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724955;
	b=d+2p+DUy8eonM02fkJmROXOEsXAEcKuaSRYGGl6rlts/MRb40FC/gtz8ehBT04A6Rcui
	 bM3jgTUW+9U1vxuGGeIL0sfp7UapZI1sVIO6s9uNxTcuZ4u+AIv2Yw4OhTjsvcRkQFjjl
	 Y6sQEirXhwQcN3uMlwHYjk1QPLIxS76XoPDKqVsav/xwcedQB3wPfIrQDauKftKis/2gG
	 XQbIXWF+e6zbmN2nsRKRiOgEmDOzpA9PWDpb9J9sruhzWKJuCi1S+9RcLYW5e8BTl8rix
	 oa0CvYzamrI3jd68tdMeRNOxfhAZcwi6RaSRmsHbZIJkSQvlvRdaJ3hWtdZtqh/fW/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724955;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=dGzYUr/GnftLbsNRvCIK8agsWQyzifa3zJBout/Fz7c=;
	b=uqx8mvNcRsvlgp5lvEBV74HqgxWiSvpLJzBqwQRU7So495MxcGPVwbb7enXgE1ewnWhG
	 V2c18pWHKyq/tR6rDL2drhYIaNtp8RguIkGhBNNuqGH4MEI3+6YtBw10elRe7ZK90ptM8
	 sCzK7znsFTTaPe11nwnmhVjx6jDl2tC6c8J5uGDxTS6kgErFR6pDLLGAeUsVm35QM6Uej
	 OxcuZMyRN1OgMVqOm9SkNNNc9iRWY2CqNPy3NeFBCawoflUHZiiYLUTg6qfG5UhzLHlXp
	 uPq5upldJGw+4Ypiq98FlF11GtQDo0sf6zRRefjHRK5E9P7Nku2/EjqqXcVmwcRuomA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=bihcyuv2wzexti3gnp4bsvo6yi.protonmail2 header.b=iuFZciC2;
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ACB606A31C
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 20:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84ACB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=bihcyuv2wzexti3gnp4bsvo6yi.protonmail2 header.b=iuFZciC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=bihcyuv2wzexti3gnp4bsvo6yi.protonmail2; t=1795724952;
	x=1795984152; bh=dGzYUr/GnftLbsNRvCIK8agsWQyzifa3zJBout/Fz7c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iuFZciC2/UgudReX+zZAnex/d3EX6faCqH3LIMWUIBe54QItzeH07ZNMD5ja+/2Q7
	 az7QpHvfdAtC3xtQ2+0ttbhINHim8KtIYw53wKo4FK3rgQ1NGqUpuEIQQvix5z4L/6
	 bfVHAi9PaiFm9N4GrT2qwpz/OYEsi1WAm68iq33WFDIVPbGRipWEkNqW5iLaQxMSm2
	 7lM3nAIqDqTboVHvuLVl4BnwewW+VdJhnbcZ9EIhYR5QF18uJMsVNoLVMT+h78Y0av
	 Ye6D50PgwKlrL4vfPzUVRbYs0IwHTKxrQxK6NYuD0kVzMrAK/HlrWuKrrEB1JxONs5
	 +OiiNMJUZqXng==
Date: Thu, 26 Nov 2026 20:29:09 +0000
To: liubaolin <liubaolin12138@163.com>
From: Ernest Borowski <ernest.borowski.git@proton.me>
Cc: ernest.borowski.git@proton.me, fstests@vger.kernel.org, Zorro Lang <zlang@kernel.org>, ntfs@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [PATCH 2/4] generic: check the size after a buffered write runs out of space
Message-ID: <179572494434.404914.17528791583106680604.b4-reply@b4>
In-Reply-To: <d485f4ea-89ca-432d-a6aa-de39ee968d81@163.com>
References: <20261125-ntfs-reproducers-v1-0-0cc67533d803@proton.me> <20261125-ntfs-reproducers-v1-2-0cc67533d803@proton.me> <d485f4ea-89ca-432d-a6aa-de39ee968d81@163.com>
Feedback-ID: 236360163:user:proton
X-Pm-Message-ID: ff13e4375c1586ff7ffda7ce63d46e3f748a5274
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
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 02:26:43PM +0800, liubaolin wrote:
>     Could we avoid treating every missing byte count as zero here?
>     For example, if xfs_io reports pwrite: Input/output error and leaves
> the file unchanged, written becomes zero and both the size and content
> checks pass. The error only appears in $seqres.full.
>     I think unexpected errors should fail the test, with ENOSPC handled
> separately. It would also be good to check that we actually get a
> positive short write. A zero-byte ENOSPC result is worth checking too.

Agreed. In v2, a missing byte count is accepted only if xfs_io failed
with ENOSPC; any other error fails the test and prints the xfs_io
output. A zero-byte ENOSPC result still runs the size and content
checks, so any size change fails the test. If those checks pass, the
test reports "not run" because it did not exercise a short write. A full
write already reported "not run".

Checking for a positive short write showed that v1 never got one on XFS
or ext4. Both reserve space for the whole new range at once, so the
append at EOF failed with ENOSPC and wrote nothing, and v1 passed there
for the reason you described. In v2, the write starts 64 KiB (or one
block, if larger) before EOF. The part over the old data is written, and
the rest runs out of space: XFS and ext4 return a short write of 64 KiB
(with 1k and 4k blocks), and ntfs one of about 320 KiB. The size check
now expects the old file size or the end of the written range, whichever
is larger.

Thanks,
Ernest

