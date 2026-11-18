Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994417;
	b=kXpN3CvmChKNrB/3T2aJaH7XQQd6m3Y3aFiCiOuizAzmmCLFNs5OWCH8oXqHXcc+uWRl
	 SV8QjmnRpt9v3gfr2p67NqfDWnIqszhvWL9tZ3H1N/cE8k4rapXJUbNOZy9uNPW90nn+n
	 IpXcB1+7J+i0/0yOqLewrsPNmfQfwifFK40h/nLJXqaoNF50KNhYfJ0ZLLC/VdcU7jrjp
	 u65vyybNl1MdBRIYcKYD3eyryHYWYkO0U1UOfrSrrU5bU05KjpHGscS/5pSzLQKqTYKSW
	 GTbre4igGg3NZnAGLtdWh8KYPQQ+O6MHiE95YFHq1d0JoR7G+tMlQZVGTuEEbonv6Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994417;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=S7DdyuEWBTTp0gSP5Jm9vE08IR3fBT6lZlQ2grkGRj8=;
	b=bZATvRRW8o3SdvOa6KKLTysKBzkvS6Ddk2HmQIOaNdigoWf0YvDMI199AX/3C0dUJe2g
	 FHJaS5iawBVTaW84xRXdALa4arJ99lZ9mw3cwRIfvHWrG/pnJMssIcNdzUIsxEqbBmlKV
	 tvvnT4+TZLZYGP6A4n44o9dTMFbiM2nc5pI3oRnuu7f0v8FlVIbvxUg3hmcny/wBSIXpR
	 RPZHcI8eLV6A47Gr4N84x+UosdsqK+kvFeSVR/+JjNddJ/eCnt8X8kjwHevW+vOhDvTOw
	 5mkiSf2Q0vLu95iUxUilDkaJFQxgztgK/DQD/PKniiDwbaRHJtg2xIFbBVaqvt/q7oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GcdabHdV;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E91606A31C
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E91606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GcdabHdV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=S7DdyuEWBTTp0gSP5Jm9vE08IR3fBT6lZlQ2grkGRj8=;
	b=GcdabHdVtFxvvWdN9fgYC6S5/Fv5i/UWknRY52sulpXWqk/88zevcgnF/t1yB8
	/b75G8fcAP8mNIgY3GsbnwsgijBURtKv5I/20Osyb6JkDDtodnobEjEkSE+03GvX
	paIqJfC1kTPxWBzXGe122Wedz/zEFwqeIRJuMzWiKuq/Q=
Received: from [IPV6:2409:8900:1fc4:b5fb:fbe8:c5b8:cdd0:2ec2] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXtiPZcP1qve7aIQ--.13858S2;
	Wed, 18 Nov 2026 17:33:15 +0800 (CST)
Message-ID: <e9710bc0-24ca-4afc-b00b-dd22e50a073e@163.com>
Date: Wed, 18 Nov 2026 17:33:13 +0800
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/37] Report NTFS metadata errors and shutdown through
 FAN_FS_ERROR
To: Xuewen Wang <wangxuewen_ky@163.com>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXtiPZcP1qve7aIQ--.13858S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKFykJw43GrykWw47tF4kCrg_yoWfWF43pF
	Z3G395t3s2yFyIg39rt3y2qa4F93s5Gay5twnxG342grs8Kr1jqayrKa409rWrurWFg3yD
	Xw4UKa9rCry5AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUwdbUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6htsN2r9cNtMrQAA33



在 2026/11/18 17:06, Xuewen Wang 写道:
> From: Xuewen Wang <wangxuewen@kylinos.cn>
> 
> Report NTFS metadata corruption, failed recovery and shutdown through
> FAN_FS_ERROR. File events identify the affected base file; volume events
> cover errors without a safe file reference. Preserve the volume error bit
> and errors= policy. Before SB_ACTIVE, metadata reporting helpers record
> the volume error state without queuing an event.
> 
> Use -EFSCORRUPTED (-EUCLEAN) for confirmed corruption in the updated error
> paths, both in reports and in failing NTFS operations. Preserve genuine
> I/O, allocation and unsupported-format errors. Ordinary EOF and missing
> names or streams are not corruption. Partial-I/O and best-effort
> operations retain their return semantics; an independent recovery failure
> can report a different errno from the initiating operation.
> 
> Based on ntfs-next commit b028412297e6
> ("ntfs: convert a named $DATA stream safely when making room in a record").
> 
> Changes in v6:
> - Address the v5 review of the Fixes-tagged attribute-move patch. Put the
>    source-removal fix before the reporting infrastructure, using the
>    existing NVolSetErrors() and diagnostics. Add FAN_FS_ERROR reporting at
>    those sites in the final patch. The fix no longer depends on the new
>    reporting helpers.
> - Check the other fixes for the same dependency. Keep mapping-pairs
>    writeback and cluster-count fixes first, and move search-context error
>    propagation before the helpers. Separate buffered-read and compressed
>    I/O errno propagation, readdir retry state, buffered fallback writeback
>    errors and export-parent locking from the reporting changes.
> - Rebase onto the updated ntfs-next. Retain its uninterruptible metadata
>    reads, current iomap callback interface, named-stream conversion
>    safeguards and index validation.
> - Adapt the new ntfs_icx_ia_ensure() caller to error-pointer returns from
>    ntfs_ia_open(). Clear the failed pointer before cleanup and preserve the
>    original errno. Report a missing required INDEX_ALLOCATION attribute as
>    corruption without repeating errors already reported while opening it.
> - Classify the new index-entry VCN validation failures as EFSCORRUPTED.
>    Report the new directory child-VCN bounds failure through the common
>    cleanup exit, with the same errno returned to the caller.
> - Report attribute-move source-removal and destination-cleanup failures
>    after releasing the destination search context. Keep an independent
>    cleanup failure distinct from the original removal failure.
> - Avoid counting a propagated MFT mapping corruption again in the inode
>    loader. Keep the report from MFT/runlist validation and preserve
>    reports for unreported I/O errors and inode-local corruption.
> 
> The earlier review fixes remain:
> - Cover the directory lookup, index-block read and nonresident iomap
>    corruption paths identified in v3. Use ntfs_inode_base() for base-file
>    attribution and test_and_set_bit() for one shutdown report per
>    clear-to-set transition.
> - Preserve search-context failures in ntfs_attr_exist() and its callers;
>    preserve the inner ntfs_read_inode_mount() error instead of returning -1.
> - Consolidate local reports at cleanup exits in the affected paths and
>    avoid repeating propagated reports, while retaining independent
>    recovery failures.
> - Distinguish malformed or missing required EA metadata from lower-level
>    read failures, and recheck HasEA under mrec_lock in listxattr().
> 
> The series now has 37 patches. The extra patches separate existing fixes
> from reporting, so they can be reviewed and backported without pulling in
> the new helpers.
> 
> Series organization:
> - 1-9: fixes and error propagation without the new reporting helpers.
> - 10: file and volume metadata reporting helpers.
> - 11-16: boot/system metadata, logfile, runlists, iomap and compression.
> - 17-23: attribute metadata, failed updates and inode cleanup.
> - 24-29: index/directory operations, namespace recovery and exportfs.
> - 30-35: MFT, EA/ACL, named-stream and reparse/ObjectID reporting.
> - 36: atomic shutdown reporting.
> - 37: reporting integration for the standalone attribute-move fix.
> 
> Validation:
> - Built NTFS with W=1 and checked all 31 NTFS translation units with
>    Sparse C=2, with no NTFS compiler or Sparse diagnostics.
> - Passed 15 QEMU guest runs with NTFS built in. These cover normal file
>    and namespace operations, named streams, inode/index/runlist/EA
>    corruption, readdir, shutdown, filesystem ustat selftests and
>    fsync/remount/data verification.
> - The index cases include invalid INDX entries_offset and child VCNs
>    outside INDEX_ALLOCATION. Lookup and readdir returned EUCLEAN and
>    generated EUCLEAN events after the listener was ready.
> - Passed 403 controlled scenarios using extracted functions with
>    controlled dependencies and ASan/UBSan. These include the existing
>    error-path regressions, the new index-allocation guard and VCN checks,
>    and source-removal/destination-cleanup failures both before and after
>    reporting integration.
> - Added two exact-count QEMU checks: an invalid MFT FILE magic and an
>    inode-local zero link count each return EUCLEAN and report one error.
>    The old kernel fails the same MFT check with error_count=2.
> - The guest runs enabled non-strict KCSAN and lockdep. All three KCSAN
>    selftests passed, with no KCSAN or lockdep diagnostics in the test logs.
> 
> Thanks to Hyunchul and Namjae for reviewing the earlier versions.
> 
> Baolin Liu (11):
>    ntfs: preserve cluster-free counts in attribute cleanup
>    ntfs: add filesystem metadata error reporting helpers
>    ntfs: report runlist and cluster allocation metadata errors
>    ntfs: report attribute lookup and validation errors
>    ntfs: report attribute list update and recovery failures
>    ntfs: report attribute conversion and mapping update failures
>    ntfs: report inode metadata and eviction cleanup errors
>    ntfs: report MFT record validation and lifecycle errors
>    ntfs: report MFT bitmap and data growth recovery failures
>    ntfs: report MFT writeback errors to fsnotify
>    ntfs: report each shutdown transition once
> 
> Dandan Wu (11):
>    ntfs: report required system file and volume metadata errors
>    ntfs: report logfile metadata and emptying errors
>    ntfs: report iomap metadata corruption
>    ntfs: report LZNT1 and WOF compressed stream errors
>    ntfs: report attribute resize and relocation recovery failures
>    ntfs: report incomplete attribute range updates
>    ntfs: report index validation and block I/O errors
>    ntfs: preserve and report index traversal errors
>    ntfs: report directory lookup and metadata corruption
>    ntfs: report index update and recovery failures
>    ntfs: report namespace and file recovery errors
> 
> Xuewen Wang (15):
>    ntfs: propagate mapping-pairs update errors from inode writeback
>    ntfs: handle source record removal failure during attribute moves
>    ntfs: preserve attribute search context initialization errors
>    ntfs: preserve synchronous buffered read errors
>    ntfs: preserve compressed I/O preparation errors
>    ntfs: retain directory iteration state after errors
>    ntfs: preserve buffered fallback writeback errors
>    ntfs: serialize export parent reconstruction
>    ntfs: report boot geometry and MFT bootstrap errors
>    ntfs: report attribute record update and cleanup failures
>    ntfs: report export parent reconstruction errors
>    ntfs: report EA metadata and restoration errors
>    ntfs: report named stream metadata and recovery errors
>    ntfs: report reparse and object ID metadata errors
>    ntfs: report attribute move removal and cleanup failures
> 
>   fs/ntfs/aops.c         |  20 +-
>   fs/ntfs/attrib.c       | 898 ++++++++++++++++++++++++++++++-----------
>   fs/ntfs/attrib.h       |   8 +-
>   fs/ntfs/attrlist.c     |  61 ++-
>   fs/ntfs/attrlist.h     |   4 +-
>   fs/ntfs/bitmap.c       |   2 +-
>   fs/ntfs/compress.c     |  35 +-
>   fs/ntfs/dir.c          | 115 ++++--
>   fs/ntfs/ea.c           | 173 +++++---
>   fs/ntfs/file.c         |  30 +-
>   fs/ntfs/index.c        | 370 +++++++++++------
>   fs/ntfs/inode.c        | 269 ++++++++----
>   fs/ntfs/inode.h        |  10 +-
>   fs/ntfs/iomap.c        |  66 ++-
>   fs/ntfs/lcnalloc.c     |  17 +-
>   fs/ntfs/logfile.c      |  58 +--
>   fs/ntfs/mft.c          | 353 ++++++++++------
>   fs/ntfs/named_stream.c |  61 ++-
>   fs/ntfs/namei.c        | 144 +++++--
>   fs/ntfs/object_id.c    |  50 ++-
>   fs/ntfs/reparse.c      | 109 ++++-
>   fs/ntfs/reparse.h      |   2 +-
>   fs/ntfs/runlist.c      |  23 +-
>   fs/ntfs/runlist.h      |   4 +-
>   fs/ntfs/stream.h       |   2 +-
>   fs/ntfs/super.c        | 310 ++++++++++----
>   fs/ntfs/volume.h       |   4 +
>   fs/ntfs/wof.c          |  49 ++-
>   28 files changed, 2311 insertions(+), 936 deletions(-)
> 
> 
> base-commit: b028412297e640db52195df2649368c1910e8e4b

The series looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

