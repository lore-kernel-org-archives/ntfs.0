Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486894;
	b=rNG+QaO9vlhHI0di7RvXxXCVTaAR0rySHLbe85j95TdawUVTI8vM8PPEgNJa1VKsyNv1
	 YkZ+JsHHXNA8ASzf62wlq0WHBtx/S/jv3Ok4BSYRsqFLRzcuOiBGadsELZTAWit7t5fWj
	 KwgS1M82L7XQEU4mje4sXv0O8FNBznyhjM0Sos2C570nr/t6iQjB49KCwGdgdCMgGnIDU
	 CcWy/pojZQmv2BAxq3nETbkgQpB1tQ4jUc1b32NDY+yToVK3PAkOieIqU83MgYOYafMkf
	 2iTRT1KKsFrbKVwE3fKOO97wnQvqZoeVDo/dyL9qg3bmfVJQjHO8eWI7ROEG/JJzf7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486894;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=txkej36h9367y0x2bES4uUqq4pZI8LsSCqMazCvfZxU=;
	b=t1HqgT1n811iwYBa875VFdRJi7nMAuGz1qhkuTqP0JUpg1h0D6d1FMwRjUNaDaa9UnDF
	 yAQaPfvRz9hG2nj6M9VoSnzajdEmdOzQ+cOGg//F9gMCL1ZyujokYNkCnYnlpr0WAGJVh
	 hqyhb5AKLNwfvlve/T32wQF3ObeMAwzKV8aduOTa5DaPUO6B1llItRlc8MWV1BlLBH2KO
	 Nrz1iaINOWQCdgb1s0Pe91ZyUJ2MrNP9JfidjJxWI4Ll4EGfUXvu8mmg/YHOTosWOnzfN
	 9CocKMZEPbIs8yyyw4/pgFAVMQY001wG7V76r1P5pzHdExO3BfjuGcaKbTLsiCcn6XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hamSkWrR;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1914606A319
	for <ntfs@lists.linux.dev>; Tue, 20 Oct 2026 09:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1914606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hamSkWrR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:To:
	Content-Type; bh=txkej36h9367y0x2bES4uUqq4pZI8LsSCqMazCvfZxU=;
	b=hamSkWrREsZ/Da+B7oS78zrZOiy1SD3vjdQ1X0/VfNNuqFyDe3k2AkjvW7BlKO
	M7r1eNSQAxFyjtLe+RSzHkY6lz1ZdQPBl8UzwqvlzedmoTSzYarhW247A4OWI3bf
	7rL+iLaTeG4FTmo1ge+77vG+zhsBKfCKJUZdcjgnQ61CY=
Received: from [IPV6:2409:8900:1fc3:39f:e8cc:cbbb:bff:8070] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3P1LbLddqqZ2wBA--.38503S2;
	Tue, 20 Oct 2026 17:01:17 +0800 (CST)
Message-ID: <3dc2d90d-fcec-452c-a294-28862a1892b5@163.com>
Date: Tue, 20 Oct 2026 17:01:14 +0800
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
Subject: Re: [PATCH v4 00/31] ntfs: report filesystem errors through fsnotify
From: liubaolin <liubaolin12138@163.com>
To: linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 wangxuewen@kylinos.cn, wudandan@kylinos.cn, Baolin Liu <liubaolin@kylinos.cn>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
Content-Language: en-US
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P1LbLddqqZ2wBA--.38503S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3ZFW7XryDArWDKF4fKryrtFb_yoWDXrWUpF
	93C393t3srtryIqr9Fy3y0qa4F9a4rG3yUtrn8G342kwn5Kw1SqFW8Ka409FyrCrWFg3yq
	qw4jg39rCry5AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVSoAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h0T3WrXLd1HjwAA38



在 2026/10/20 16:43, Baolin Liu 写道:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> Report NTFS metadata corruption, failed recovery and shutdown through
> FAN_FS_ERROR. File events identify the affected base file; volume events
> cover errors without a usable file reference. Preserve the existing
> volume error bit and shutdown policy.
> 
> Confirmed metadata corruption uses -EFSCORRUPTED (-EUCLEAN) in both
> events and failing NTFS operations. This intentionally changes
> userspace-visible corruption errors previously returned as EIO or
> obscured as ENOMEM/EINVAL. Genuine I/O, allocation and unsupported-format
> errors retain their own errnos. Ordinary EOF and missing names or streams
> are not corruption. Partial-I/O and best-effort operations retain their
> existing return semantics; an independent recovery failure may produce
> an event with a different errno from the initiating operation.
> The generic open_by_handle_at() wrapper still converts decode errors
> other than ENOMEM to ESTALE.
> NFS handle decoding also maps corruption errors to STALE.
> 
> Based on ntfs-next commit 19dc08f1f2c5 ("ntfs: support persistent
> noatime attribute").
> 
> Changes since v3:
> - Extend reporting to previously uncovered corruption and recovery
>    failures in system metadata, attributes, runlists, directories/indexes,
>    MFT records and writeback, LZNT1/WOF, EA/ACLs, named streams, reparse
>    points and object IDs. This includes ntfs_ib_read(), nonresident iomap
>    and ntfs_lookup_inode_by_name(), the lookup path in this base; the
>    cited ntfs_lookup_inode_by_example() is absent.
> - Reuse ntfs_inode_base() for attribute and extent inode attribution.
>    Use volume reports during eviction; before SB_ACTIVE, record only
>    the volume error state.
> - Use test_and_set_bit(NV_Shutdown, &vol->flags) so concurrent shutdown
>    callers initiate only one shutdown report.
> - Preserve specific errors through attribute search contexts, index
>    traversal, buffered reads and mount initialization. Keep recoverable
>    resource failures distinct from failed recovery after metadata changes.
> - Stabilize export parent reconstruction against rename/rmdir and avoid
>    classifying unlocked named-stream revalidation races as corruption.
>    Preserve directory resume behavior after deleted keys and partial
>    reads, including retries after traversal errors.
> 
> Series organization:
> - 1-4: fix lost writeback errors and cluster-free count handling;
>    add reporting helpers and preserve search-context initialization errors
>    through the API and all callers.
> - 5-7: boot geometry/MFT bootstrap, required system files/volume
>    metadata, and logfile validation/emptying in separate patches.
> - 8-10: runlist/cluster allocation, iomap/buffered reads, and
>    LZNT1/WOF compressed streams in separate patches.
> - 11: handle source-record removal failure during attribute moves
>    before updating the attribute-list reference.
> - 12-14: attribute lookup/validation, record updates/cleanup, and
>    attribute-list updates/recovery.
> - 15-17: attribute conversion/mapping, resize/relocation recovery,
>    and range updates.
> - 18: inode metadata and eviction cleanup.
> - 19-22: index validation/block I/O, traversal errors/directory
>    retries, directory metadata, and index update/recovery failures.
> - 23-24: namespace/file recovery and export parent reconstruction.
> - 25-27: MFT record lifecycle, bitmap/data growth recovery, and
>    MFT writeback in separate patches.
> - 28-30: EA/ACLs, named streams, and reparse/ObjectID indexes.
> - 31: add the atomic shutdown helper and convert all callers.
> 
> Validation:
> - The final kernel passed 35 QEMU guest cases covering normal file and
>    namespace operations, streams, metadata corruption, directory resume,
>    compression/mapping gaps, AttrDef, mount, concurrent shutdown, export
>    handles, fsync/remount/readback and filesystem ustat selftests.
> - Compression-buffer allocation injection reproduced EIO before the
>    fix and ENOMEM afterward. A complete retry succeeded after disabling
>    injection, with no filesystem error event; the healthy control passed.
> - Six additional ACL guest cases passed with CONFIG_MULTIUSER=y.
>    On-disk invalid UID/GID values in access and default ACLs returned
>    EUCLEAN and generated EUCLEAN events identifying the affected inode.
>    Valid ACLs read back correctly; invalid userspace ACL submissions
>    returned EINVAL without error events. These tests used no kernel hooks.
> - Eleven additional NFSv3/TCP loopback guest cases passed using kernel
>    nfsd, a mounted Linux client and targeted RPC tests. Tracing confirmed
>    ntfs_get_parent() calls from nfsd for healthy and corrupt parents,
>    with subtree_check enabled and disabled. The tests also covered
>    stale handles and 320 rename/rmdir race iterations without false
>    corruption reports. Corruption events identified the affected directory.
> 
> - Sparse C=2 checked all 31 NTFS translation units, including WOF,
>    on both the final tree and its ntfs-next base, without diagnostics.
> - Seventeen guest cases passed with KCSAN and lockdep enabled, covering
>    normal I/O, namespace/streams, concurrent shutdown, ACLs and NFS races.
>    KCSAN selftests passed and both monitors remained active throughout;
>    no KCSAN or lockdep diagnostics were printed.
> - Eighteen targeted injection cases covered the two resident free-space
>    failure exits and six attribute/MFT errno branches, including moved
>    versus unmoved records, source-record restoration, ENOMEM controls,
>    event attribution and cluster cleanup.
> - Twenty-six directory-retry, EA/ACL and iomap/MFT injection cases were
>    rerun against the final source tree and passed.
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
>    ntfs: report iomap corruption and preserve buffered read errors
>    ntfs: report LZNT1 and WOF compressed stream errors
>    ntfs: report attribute resize and relocation recovery failures
>    ntfs: report incomplete attribute range updates
>    ntfs: report index validation and block I/O errors
>    ntfs: preserve index traversal errors and directory retries
>    ntfs: report directory lookup and metadata corruption
>    ntfs: report index update and recovery failures
>    ntfs: report namespace and file recovery errors
> 
> Xuewen Wang (9):
>    ntfs: propagate mapping-pairs update errors from inode writeback
>    ntfs: preserve attribute search context initialization errors
>    ntfs: report boot geometry and MFT bootstrap errors
>    ntfs: handle source record removal failure during attribute moves
>    ntfs: report attribute record update and cleanup failures
>    ntfs: serialize and report export parent reconstruction errors
>    ntfs: report EA metadata and restoration errors
>    ntfs: report named stream metadata and recovery errors
>    ntfs: report reparse and object ID metadata errors
> 
>   fs/ntfs/aops.c         |  24 +-
>   fs/ntfs/attrib.c       | 738 ++++++++++++++++++++++++++++++-----------
>   fs/ntfs/attrib.h       |   8 +-
>   fs/ntfs/attrlist.c     |  43 ++-
>   fs/ntfs/bitmap.c       |   2 +-
>   fs/ntfs/compress.c     |  30 +-
>   fs/ntfs/dir.c          | 108 ++++--
>   fs/ntfs/ea.c           |  84 +++--
>   fs/ntfs/file.c         |  33 +-
>   fs/ntfs/index.c        | 313 +++++++++++------
>   fs/ntfs/inode.c        | 265 ++++++++++-----
>   fs/ntfs/inode.h        |  10 +-
>   fs/ntfs/iomap.c        |  53 ++-
>   fs/ntfs/lcnalloc.c     |  17 +-
>   fs/ntfs/logfile.c      |  51 +--
>   fs/ntfs/mft.c          | 326 +++++++++++-------
>   fs/ntfs/named_stream.c |  55 ++-
>   fs/ntfs/namei.c        | 140 ++++++--
>   fs/ntfs/object_id.c    |  40 ++-
>   fs/ntfs/reparse.c      |  98 ++++--
>   fs/ntfs/reparse.h      |   2 +-
>   fs/ntfs/runlist.c      |  16 +-
>   fs/ntfs/runlist.h      |   1 +
>   fs/ntfs/stream.h       |   2 +-
>   fs/ntfs/super.c        | 279 +++++++++++-----
>   fs/ntfs/volume.h       |   4 +
>   fs/ntfs/wof.c          |  41 ++-
>   27 files changed, 1970 insertions(+), 813 deletions(-)
> 
> 
> base-commit: 19dc08f1f2c5563ba4da6afd5ecace8eba163aef

Hi Namjae and Hyunchul,
    Sorry for the delay in sending v4. It has been about a month since
I posted v3.

    Hyunchul raised three points in the v3 review:
    1. Some paths detect corruption without calling any report_*_error()
       helper, including ntfs_lookup_inode_by_example(), ntfs_ib_read(),
       and ntfs_read_iomap_begin_non_resident().
    2. Reuse ntfs_inode_base() instead of repeating the logic for finding
       the base inode at individual call sites.
    3. Use test_and_set_bit() when setting NV_Shutdown to avoid races
       and duplicate shutdown reports.

    We have addressed these points in v4. Xuewen, Dandan, and I spent
considerable time auditing the error paths, especially looking for
missing reports. During that work, we found further reporting gaps
and related error-handling issues that needed attention, so preparing
this revision took longer than expected.

    The series now contains 31 patches. We split the changes into 
smaller,focused patches to keep individual patches manageable and make 
review easier. Sorry for the length of the series, and thank you for 
your patience.

    We would appreciate another review of v4. Thank you both for your
time and feedback.

Best regards,
Baolin.

