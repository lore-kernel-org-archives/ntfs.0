Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993698;
	b=DJ3MIoOH1aehk2xOCq3XM9N6RadI4pHGsGDf7b7I5yuZkOYpsR/lSJ38N+8hWw53jW9H
	 mryL/Y0f1zmGxGyC7gKQYgO+tMaULV/GE/KsKcSzscbeNXTT3wEHIEyCssXoNlIb+2Mhb
	 00/HtDqOznBS6UhBmV71WQKpbkf5o0sdNIzIuXJMzD7gJsv2v+Uu2mjDsTElC37Gsy8lK
	 mnJSIcfgT5qouZCKNxtP2qKy4baRqF266OdPaMChZroc2rgUp+6c5YHKNdQiyJAAxEhR/
	 6RbNDSUK7CZOyc/A/wsp0UW7UECnINDsQjfL4GH/BevtrqOWPi+xGoyiCRHiwNPzQdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993698;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/DetbUIYKXQzbk+oHdkqO3rhMAegxn9qQJCE6A4Iuek=;
	b=UnsR2D6bLIfymHiZmQBSjBe8Ah+JIdjaDNEUk1hjGAz8gpyg/gpIMDKDXvsQW+fSQEAK
	 TNnmz/nv04JlbCw0s2UJHLs424CoZTLQhwpURVO8At0rRJqMCnH+5EDkyRQDB9SuLVCdz
	 esTXvXgZHozFTUbL1wxpbgmcODZumFc+H4R6kcql+iOVbG67yorxAlqn5ueEAhKhzVJ18
	 J12q55ioLdotdB+C2rjakpIvhCR6pfA+OTfXTg5ABj976gW0QgKhnRDiApfQrD3IsV1B3
	 nnjrlXItjiXoYmu90tQZw8ufaiGlQ8J/4BQbM5c0ITmHm/MrKEdwJWxNZ0A2LYCaxHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CDC606A332
	for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 09:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8CDC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6f835ee2e33111f19a56ed5b684f684d-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:fda8c48f-be4a-4280-af24-cf37efaca219,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:7e59c3825b65cd6f6b0159e67896a815,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|865|898,TC:nil,Content:0|15|52
	|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6f835ee2e33111f19a56ed5b684f684d-20261118
X-User: wangxuewen@kylinos.cn
Received: from [172.30.70.102] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1325071727; Wed, 18 Nov 2026 17:21:28 +0800
Message-ID: <3a5764f4-2b8d-49d8-8e84-d500e1be3d8e@kylinos.cn>
Date: Wed, 18 Nov 2026 17:21:26 +0800
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
 hyc.lee@gmail.com, liubaolin12138@163.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
From: wangxuewen <wangxuewen@kylinos.cn>
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



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

Hi Namjae and Hyunchul,
I've addressed your review comments on v5 in the v6 series.
Before sending the series, I also had my colleague Baolin review it.
I'd appreciate your review of the updated patches.

Thank you for your time and feedback.

Best regards,
Xuewen
