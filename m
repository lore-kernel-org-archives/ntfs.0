Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055801;
	b=nHUccOG6h+vpLuPgUBvdYEuuYjT9lamcCPywplvu8hvpWbvfG6XJSveneulqH7TO7FdN
	 HHI5FhccUQ2mP66EA7wtla/jW/OackZkpuLP7NydvHU8tzLS/fdFiEKr1HkuVnM+9nhdv
	 /o0eV3t4C5FH0MTBKWqwWM1/Hun1uDcxc4Zph8dZS7XIMFX5BzJkZOGJuOamQ8a2U/gzK
	 O23pPNB/FTWunr9RZrenT45szkwmov8Z/LwdTa5kgzy7ThRlE67+tVQo6T5EjYpAT02Ni
	 5RH/GJ77o7e3AACzSamA1i7SgtbUt8VUPwokwZfoOINS6rE5VeUvr5b7VhGOlXcqCmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055801;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=wvSpWqjeLmfCA5i/nNBI6xKjGl3BUXxpHWvapvsXUhA=;
	b=UIYRAdKGmmNF4MNf+djFO6CXqqrN1xlHNoJl6y4LJeKqE5BSvKsYmMeuAO4iIU4KvNsw
	 JQBxfmSXHvD5rfhwZayP0HDf4+vEArQ8I57322R4d3phAs1yQH2KF7d9U5mAO+P8mZoL5
	 w+175lM0WtjE9M2ZVNkOeNTl8jBuh4RE4qLvXF7vbY9JPKWLO6TbkiSIUUAz49bSPr+/W
	 lSpPubrEsValOcUaiPhqmcesfkSpmwRdarGK44UA/e/KZSjrppV9KqTDDrY8mnFUjwUfL
	 sk74pXEmr7CM3kjF5vFaZtgtE81gth+tdjvBqrDrBOfq7qsKKOyMhCCzvqf5yFLqU6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=d9GK2cUz;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AB4606A32A
	for <ntfs@lists.linux.dev>; Thu, 19 Nov 2026 02:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65AB4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=d9GK2cUz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=wvSpWqjeLmfCA5i/nNBI6xKjGl3BUXxpHWvapvsXUhA=;
	b=d9GK2cUzfYaShF4kD76fpCpiVfQC5eYnPlUrk21WoGoBm3HLEEfn8ijbqmP5mx
	sPQtCvwUPYAvUCnOVOWoIhZXRP/hB4JZMssZviF/di07K5pQRd/hy0dmKY0BFzH/
	Ns61flvfuJT7B3+NXIlpyTSqf91ztcBDzB6N1LnyoMYkI=
Message-ID: <66391daf-8160-4168-bf54-5369f7267ec6@163.com>
Date: Thu, 19 Nov 2026 10:36:17 +0800
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
To: Hyunchul Lee <hyc.lee@gmail.com>, wangxuewen <wangxuewen@kylinos.cn>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
 <3a5764f4-2b8d-49d8-8e84-d500e1be3d8e@kylinos.cn>
 <av5VtYFk9MQE7kw-@hyunchul-PC02>
From: Xuewen Wang <wangxuewen_ky@163.com>
In-Reply-To: <av5VtYFk9MQE7kw-@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v96hYP5qy2yyIA--.55317S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3ur15Wry7Jw1fKrW3XFy8Grg_yoWDWFWkpF
	Z7Kan5trn2yryIvrsrt3y0va4Fvwn5Ga1UXrnxGryagwn8Kr1IqFWxK3W09F95uryrK3yq
	qa1UJa9rZry5AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEdWrNUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzgOag2r+YKN71QAA3t



在 2026/11/19 09:49, Hyunchul Lee 写道:
> Hi Xuewen,
> 
> This series looks good to me.
> Could you check whether EINTR related code is still needed now that
> the following commit has been merged?
> 
> https://lore.kernel.org/ntfs/tencent_BED06C76C024128D13E6854C2FC31BF48A06@qq.com/
> 
Hi Hyunchul,

Thanks for the review.
I'll recheck the EINTR-related handling against that upstream change and 
remove any redundant checks in the next revision, keeping only those 
needed for paths that can still return EINTR.

Best regards,
Xuewen
> On Wed, Nov 18, 2026 at 05:21:26PM +0800, wangxuewen wrote:
>>
>>
>> 在 2026/11/18 17:06, Xuewen Wang 写道:
>>> From: Xuewen Wang <wangxuewen@kylinos.cn>
>>>
>>> Report NTFS metadata corruption, failed recovery and shutdown through
>>> FAN_FS_ERROR. File events identify the affected base file; volume events
>>> cover errors without a safe file reference. Preserve the volume error bit
>>> and errors= policy. Before SB_ACTIVE, metadata reporting helpers record
>>> the volume error state without queuing an event.
>>>
>>> Use -EFSCORRUPTED (-EUCLEAN) for confirmed corruption in the updated error
>>> paths, both in reports and in failing NTFS operations. Preserve genuine
>>> I/O, allocation and unsupported-format errors. Ordinary EOF and missing
>>> names or streams are not corruption. Partial-I/O and best-effort
>>> operations retain their return semantics; an independent recovery failure
>>> can report a different errno from the initiating operation.
>>>
>>> Based on ntfs-next commit b028412297e6
>>> ("ntfs: convert a named $DATA stream safely when making room in a record").
>>>
>>> Changes in v6:
>>> - Address the v5 review of the Fixes-tagged attribute-move patch. Put the
>>>     source-removal fix before the reporting infrastructure, using the
>>>     existing NVolSetErrors() and diagnostics. Add FAN_FS_ERROR reporting at
>>>     those sites in the final patch. The fix no longer depends on the new
>>>     reporting helpers.
>>> - Check the other fixes for the same dependency. Keep mapping-pairs
>>>     writeback and cluster-count fixes first, and move search-context error
>>>     propagation before the helpers. Separate buffered-read and compressed
>>>     I/O errno propagation, readdir retry state, buffered fallback writeback
>>>     errors and export-parent locking from the reporting changes.
>>> - Rebase onto the updated ntfs-next. Retain its uninterruptible metadata
>>>     reads, current iomap callback interface, named-stream conversion
>>>     safeguards and index validation.
>>> - Adapt the new ntfs_icx_ia_ensure() caller to error-pointer returns from
>>>     ntfs_ia_open(). Clear the failed pointer before cleanup and preserve the
>>>     original errno. Report a missing required INDEX_ALLOCATION attribute as
>>>     corruption without repeating errors already reported while opening it.
>>> - Classify the new index-entry VCN validation failures as EFSCORRUPTED.
>>>     Report the new directory child-VCN bounds failure through the common
>>>     cleanup exit, with the same errno returned to the caller.
>>> - Report attribute-move source-removal and destination-cleanup failures
>>>     after releasing the destination search context. Keep an independent
>>>     cleanup failure distinct from the original removal failure.
>>> - Avoid counting a propagated MFT mapping corruption again in the inode
>>>     loader. Keep the report from MFT/runlist validation and preserve
>>>     reports for unreported I/O errors and inode-local corruption.
>>>
>>> The earlier review fixes remain:
>>> - Cover the directory lookup, index-block read and nonresident iomap
>>>     corruption paths identified in v3. Use ntfs_inode_base() for base-file
>>>     attribution and test_and_set_bit() for one shutdown report per
>>>     clear-to-set transition.
>>> - Preserve search-context failures in ntfs_attr_exist() and its callers;
>>>     preserve the inner ntfs_read_inode_mount() error instead of returning -1.
>>> - Consolidate local reports at cleanup exits in the affected paths and
>>>     avoid repeating propagated reports, while retaining independent
>>>     recovery failures.
>>> - Distinguish malformed or missing required EA metadata from lower-level
>>>     read failures, and recheck HasEA under mrec_lock in listxattr().
>>>
>>> The series now has 37 patches. The extra patches separate existing fixes
>>> from reporting, so they can be reviewed and backported without pulling in
>>> the new helpers.
>>>
>>> Series organization:
>>> - 1-9: fixes and error propagation without the new reporting helpers.
>>> - 10: file and volume metadata reporting helpers.
>>> - 11-16: boot/system metadata, logfile, runlists, iomap and compression.
>>> - 17-23: attribute metadata, failed updates and inode cleanup.
>>> - 24-29: index/directory operations, namespace recovery and exportfs.
>>> - 30-35: MFT, EA/ACL, named-stream and reparse/ObjectID reporting.
>>> - 36: atomic shutdown reporting.
>>> - 37: reporting integration for the standalone attribute-move fix.
>>>
>>> Validation:
>>> - Built NTFS with W=1 and checked all 31 NTFS translation units with
>>>     Sparse C=2, with no NTFS compiler or Sparse diagnostics.
>>> - Passed 15 QEMU guest runs with NTFS built in. These cover normal file
>>>     and namespace operations, named streams, inode/index/runlist/EA
>>>     corruption, readdir, shutdown, filesystem ustat selftests and
>>>     fsync/remount/data verification.
>>> - The index cases include invalid INDX entries_offset and child VCNs
>>>     outside INDEX_ALLOCATION. Lookup and readdir returned EUCLEAN and
>>>     generated EUCLEAN events after the listener was ready.
>>> - Passed 403 controlled scenarios using extracted functions with
>>>     controlled dependencies and ASan/UBSan. These include the existing
>>>     error-path regressions, the new index-allocation guard and VCN checks,
>>>     and source-removal/destination-cleanup failures both before and after
>>>     reporting integration.
>>> - Added two exact-count QEMU checks: an invalid MFT FILE magic and an
>>>     inode-local zero link count each return EUCLEAN and report one error.
>>>     The old kernel fails the same MFT check with error_count=2.
>>> - The guest runs enabled non-strict KCSAN and lockdep. All three KCSAN
>>>     selftests passed, with no KCSAN or lockdep diagnostics in the test logs.
>>>
>>> Thanks to Hyunchul and Namjae for reviewing the earlier versions.
>>>
>>> Baolin Liu (11):
>>>     ntfs: preserve cluster-free counts in attribute cleanup
>>>     ntfs: add filesystem metadata error reporting helpers
>>>     ntfs: report runlist and cluster allocation metadata errors
>>>     ntfs: report attribute lookup and validation errors
>>>     ntfs: report attribute list update and recovery failures
>>>     ntfs: report attribute conversion and mapping update failures
>>>     ntfs: report inode metadata and eviction cleanup errors
>>>     ntfs: report MFT record validation and lifecycle errors
>>>     ntfs: report MFT bitmap and data growth recovery failures
>>>     ntfs: report MFT writeback errors to fsnotify
>>>     ntfs: report each shutdown transition once
>>>
>>> Dandan Wu (11):
>>>     ntfs: report required system file and volume metadata errors
>>>     ntfs: report logfile metadata and emptying errors
>>>     ntfs: report iomap metadata corruption
>>>     ntfs: report LZNT1 and WOF compressed stream errors
>>>     ntfs: report attribute resize and relocation recovery failures
>>>     ntfs: report incomplete attribute range updates
>>>     ntfs: report index validation and block I/O errors
>>>     ntfs: preserve and report index traversal errors
>>>     ntfs: report directory lookup and metadata corruption
>>>     ntfs: report index update and recovery failures
>>>     ntfs: report namespace and file recovery errors
>>>
>>> Xuewen Wang (15):
>>>     ntfs: propagate mapping-pairs update errors from inode writeback
>>>     ntfs: handle source record removal failure during attribute moves
>>>     ntfs: preserve attribute search context initialization errors
>>>     ntfs: preserve synchronous buffered read errors
>>>     ntfs: preserve compressed I/O preparation errors
>>>     ntfs: retain directory iteration state after errors
>>>     ntfs: preserve buffered fallback writeback errors
>>>     ntfs: serialize export parent reconstruction
>>>     ntfs: report boot geometry and MFT bootstrap errors
>>>     ntfs: report attribute record update and cleanup failures
>>>     ntfs: report export parent reconstruction errors
>>>     ntfs: report EA metadata and restoration errors
>>>     ntfs: report named stream metadata and recovery errors
>>>     ntfs: report reparse and object ID metadata errors
>>>     ntfs: report attribute move removal and cleanup failures
>>>
>>>    fs/ntfs/aops.c         |  20 +-
>>>    fs/ntfs/attrib.c       | 898 ++++++++++++++++++++++++++++++-----------
>>>    fs/ntfs/attrib.h       |   8 +-
>>>    fs/ntfs/attrlist.c     |  61 ++-
>>>    fs/ntfs/attrlist.h     |   4 +-
>>>    fs/ntfs/bitmap.c       |   2 +-
>>>    fs/ntfs/compress.c     |  35 +-
>>>    fs/ntfs/dir.c          | 115 ++++--
>>>    fs/ntfs/ea.c           | 173 +++++---
>>>    fs/ntfs/file.c         |  30 +-
>>>    fs/ntfs/index.c        | 370 +++++++++++------
>>>    fs/ntfs/inode.c        | 269 ++++++++----
>>>    fs/ntfs/inode.h        |  10 +-
>>>    fs/ntfs/iomap.c        |  66 ++-
>>>    fs/ntfs/lcnalloc.c     |  17 +-
>>>    fs/ntfs/logfile.c      |  58 +--
>>>    fs/ntfs/mft.c          | 353 ++++++++++------
>>>    fs/ntfs/named_stream.c |  61 ++-
>>>    fs/ntfs/namei.c        | 144 +++++--
>>>    fs/ntfs/object_id.c    |  50 ++-
>>>    fs/ntfs/reparse.c      | 109 ++++-
>>>    fs/ntfs/reparse.h      |   2 +-
>>>    fs/ntfs/runlist.c      |  23 +-
>>>    fs/ntfs/runlist.h      |   4 +-
>>>    fs/ntfs/stream.h       |   2 +-
>>>    fs/ntfs/super.c        | 310 ++++++++++----
>>>    fs/ntfs/volume.h       |   4 +
>>>    fs/ntfs/wof.c          |  49 ++-
>>>    28 files changed, 2311 insertions(+), 936 deletions(-)
>>>
>>>
>>> base-commit: b028412297e640db52195df2649368c1910e8e4b
>>
>> Hi Namjae and Hyunchul,
>> I've addressed your review comments on v5 in the v6 series.
>> Before sending the series, I also had my colleague Baolin review it.
>> I'd appreciate your review of the updated patches.
>>
>> Thank you for your time and feedback.
>>
>> Best regards,
>> Xuewen
> 

