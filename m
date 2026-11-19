Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052987;
	b=tN8nk9RnwMTJcMQ0GvEH4khKRjyrJY0UuiPRLcU/p4OdzS+s3q6ty5iinL1b+Cimt+s6
	 M0ezdyPiZ2erpbgi6acJylfKu6rne6ZiZaB95IJSqDSbSv6qHIpLPVSCfpWCIosdTGOgz
	 MTpD++i8Z8g45fRhA8GS7+DXxTMp9EBryNTEGyFGLiaMZANvhn0dB+YmwfW8qcfRZ5BKK
	 /rD0eOjEoSPadeX7oa4/xfJbcvQ1OyAuOH+lJUfB6OXWBksmdy7VKEdCOtC7cgszQAERG
	 M0ZoUkbCzPi1n3cH/5mHyD0zpwS1gu5r1WMFRJ8Caqq4Mr4uaVCz/scFrB9YVUeKDRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=8ij9H9j3KfrDHC8OuBt0kwpzOFzSUfNEJ4qM3OIuFi8=;
	b=K05qr+dJy/AhFfUoS5ZNHeIcYEygFbdabsHFRLdSSbL/26drqVHGyQZ+CgmWP5UQWF5/
	 YAg8yHcJ8iDq5BWwF2SqIZuT8dPmGKcFoE+HLnWjmUSKERUgaWFR8qiYPecOtUs0+17Zv
	 qe9Bi9RvTKLJpGRJlNol8fXQOwhPPFG6LGKn6SmuE0U8cf83ybRPJTNfiRSBDRu1V50CW
	 ODKHn1luQkED4yBotorx1PDtBUtTJIKm2m7G0BGKJwtDWCMbyWqnu3imcSGwmxxRZbe7a
	 Jgmsi/TEr6qG5Q709Q8FdY/RvXjCxyWzH6LERs2aP8DcOcd3cbdR7psH/cArd18xlDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzIkPAgo;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A8606A336
	for <ntfs@lists.linux.dev>; Thu, 19 Nov 2026 01:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D6A8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzIkPAgo
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-381f65e4e4bso2714724eec.0
        for <ntfs@lists.linux.dev>; Wed, 18 Nov 2026 17:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052985; x=1795657785; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ij9H9j3KfrDHC8OuBt0kwpzOFzSUfNEJ4qM3OIuFi8=;
        b=zzIkPAgoqP1uxfF+Cn5kHjBOC1pZlwKZIN4AJiJWjYFMszGdnuwIYj/nL2o69sl7x3
         vgaGRVjSJ3cAhBYqS87SmxaKr6o7E9/4IdN7WdG/0tP274sGK3WCu8QLFTe+V2GKB6iZ
         Chm1eWWZ8PEqVurkkdEs3EL+LGndnoL5YPYmehcrzcU+KsFJJ2Ch6DGnt3dMNXXRX/tI
         D9EXmSkY8kaBbedK8FY9P7+q6MSAIYHm7dLUjmWMMy7njKOuc9OPI57+4ANtb9SYxmii
         x5LTGaB5BZqUYgwO2QmhZ4QvcoOlhuoo/1wNN1yOKCHJJr4E+3EOQUc1aRV527CaKkcm
         C8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052985; x=1795657785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8ij9H9j3KfrDHC8OuBt0kwpzOFzSUfNEJ4qM3OIuFi8=;
        b=uTsnJHPCQtM9M6JmIZIJdQ3WpMYPIEJNtlcoNbQy2XZkNCwFps04wr8D8QfWri+hHj
         oetrncVH9Oym+1Uk6q+jK0eFtu5u+wIT3hONUmYVCGTs+KzpNdS64wIfMSTu7eJDqpFW
         9kJjFg/DwNSqxa5cReE60EFhEvr5qZT7EIVzPdL390c2SDpDTH1waLb4kTtZX2RV1rT/
         AvRhYauLcsfe8PCc354ldu2bGJxfKjbvr3Jrc86+Ph4OCXli6zjLK+Jglt/dtafi50YU
         Gwslhwz8F/6gSsiJGsbgUl8kU/B+cpGVnG3CXAJbIZzBZZCZauOa+SAyt7gIo+TZikZR
         ra/w==
X-Forwarded-Encrypted: i=1; AL+hErH6I2lV2QB+sPGKJxttcZlke6p2eF5l9krdiHXvlK+0eUsrH6QXfxULWMY2CXZ09zvmYlOm@lists.linux.dev
X-Gm-Message-State: APuU4Z/93gstU+sTC73yDTNKOfD3nP74GKrbQdFS3S0JCSQZ15Hii+Kc
	UEDxa/v39C9EkhuerKoGadokzcLQeI4NFsoug4XFl7uVbdEoyO/zt8D6
X-Gm-Gg: AZFdTZeoII5PQuUZFV4Qu4eqdby1D7ON6CXwAQ+Gto51B1IbBbNwY+YlK0PwJF5Bs8A
	QhncBpDlDTxnQz73UaeBLvQ88V6xSYxTtgJkzfbPUGTwzGdObvcCYXrsC04TPmh2xD8Sn2kHulw
	aAWkUhPZ3m3Y4cVfFVYKOOpmmZ7SRrEIPozHZlFn17rh8BpJcvAV/mRCeZfDVWquzrkFimYyB/5
	rszbdeg6Hbl72OgIsBDL5T8ejygqjBkZB4vma9cuYz6L7zGU40pCoB1TRVF9PO2MmYTsRZ60MRY
	kFd2lYQq1nGB6MmwE+FeQRjU+RwR3EjEo5bhZr+dnCuKqYUL6fjWl30T206XZpP76uEULxQiDIf
	h6a3J5aTbnqjekbaza2Ob0q7m6mL28dHu2jFJsvzH3OUxUG1n4ExJxj0zhrxfDZUoqn6nUc/EJx
	DNBlILHgKj09nPRn/14HFHZxDZ4dsN0GZ/OAyyvW6P/lKxgQ00NGjnOqOpZeaH+JsvWin9CwJBd
	0g1Zo8hKv9Y7KpTuwWjrJ4A3m0vnJFcUBhDxiZVWI0BCVHstT+laXk0GRBMciQF921dyGpQfCVi
	YBVltVTXLcjYX90qU5g=
X-Received: by 2002:a05:7300:8342:b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38350b7232amr2428542eec.40.1795052985128;
        Wed, 18 Nov 2026 17:49:45 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800366sm11676421eec.12.2026.11.18.17.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:49:44 -0800 (PST)
Date: Thu, 19 Nov 2026 10:49:41 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: wangxuewen <wangxuewen@kylinos.cn>
Cc: Xuewen Wang <wangxuewen_ky@163.com>, linkinjeon@kernel.org,
	liubaolin12138@163.com, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/37] Report NTFS metadata errors and shutdown
 through FAN_FS_ERROR
Message-ID: <av5VtYFk9MQE7kw-@hyunchul-PC02>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
 <3a5764f4-2b8d-49d8-8e84-d500e1be3d8e@kylinos.cn>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a5764f4-2b8d-49d8-8e84-d500e1be3d8e@kylinos.cn>

Hi Xuewen,

This series looks good to me.
Could you check whether EINTR related code is still needed now that
the following commit has been merged?

https://lore.kernel.org/ntfs/tencent_BED06C76C024128D13E6854C2FC31BF48A06@qq.com/

On Wed, Nov 18, 2026 at 05:21:26PM +0800, wangxuewen wrote:
> 
> 
> 在 2026/11/18 17:06, Xuewen Wang 写道:
> > From: Xuewen Wang <wangxuewen@kylinos.cn>
> > 
> > Report NTFS metadata corruption, failed recovery and shutdown through
> > FAN_FS_ERROR. File events identify the affected base file; volume events
> > cover errors without a safe file reference. Preserve the volume error bit
> > and errors= policy. Before SB_ACTIVE, metadata reporting helpers record
> > the volume error state without queuing an event.
> > 
> > Use -EFSCORRUPTED (-EUCLEAN) for confirmed corruption in the updated error
> > paths, both in reports and in failing NTFS operations. Preserve genuine
> > I/O, allocation and unsupported-format errors. Ordinary EOF and missing
> > names or streams are not corruption. Partial-I/O and best-effort
> > operations retain their return semantics; an independent recovery failure
> > can report a different errno from the initiating operation.
> > 
> > Based on ntfs-next commit b028412297e6
> > ("ntfs: convert a named $DATA stream safely when making room in a record").
> > 
> > Changes in v6:
> > - Address the v5 review of the Fixes-tagged attribute-move patch. Put the
> >    source-removal fix before the reporting infrastructure, using the
> >    existing NVolSetErrors() and diagnostics. Add FAN_FS_ERROR reporting at
> >    those sites in the final patch. The fix no longer depends on the new
> >    reporting helpers.
> > - Check the other fixes for the same dependency. Keep mapping-pairs
> >    writeback and cluster-count fixes first, and move search-context error
> >    propagation before the helpers. Separate buffered-read and compressed
> >    I/O errno propagation, readdir retry state, buffered fallback writeback
> >    errors and export-parent locking from the reporting changes.
> > - Rebase onto the updated ntfs-next. Retain its uninterruptible metadata
> >    reads, current iomap callback interface, named-stream conversion
> >    safeguards and index validation.
> > - Adapt the new ntfs_icx_ia_ensure() caller to error-pointer returns from
> >    ntfs_ia_open(). Clear the failed pointer before cleanup and preserve the
> >    original errno. Report a missing required INDEX_ALLOCATION attribute as
> >    corruption without repeating errors already reported while opening it.
> > - Classify the new index-entry VCN validation failures as EFSCORRUPTED.
> >    Report the new directory child-VCN bounds failure through the common
> >    cleanup exit, with the same errno returned to the caller.
> > - Report attribute-move source-removal and destination-cleanup failures
> >    after releasing the destination search context. Keep an independent
> >    cleanup failure distinct from the original removal failure.
> > - Avoid counting a propagated MFT mapping corruption again in the inode
> >    loader. Keep the report from MFT/runlist validation and preserve
> >    reports for unreported I/O errors and inode-local corruption.
> > 
> > The earlier review fixes remain:
> > - Cover the directory lookup, index-block read and nonresident iomap
> >    corruption paths identified in v3. Use ntfs_inode_base() for base-file
> >    attribution and test_and_set_bit() for one shutdown report per
> >    clear-to-set transition.
> > - Preserve search-context failures in ntfs_attr_exist() and its callers;
> >    preserve the inner ntfs_read_inode_mount() error instead of returning -1.
> > - Consolidate local reports at cleanup exits in the affected paths and
> >    avoid repeating propagated reports, while retaining independent
> >    recovery failures.
> > - Distinguish malformed or missing required EA metadata from lower-level
> >    read failures, and recheck HasEA under mrec_lock in listxattr().
> > 
> > The series now has 37 patches. The extra patches separate existing fixes
> > from reporting, so they can be reviewed and backported without pulling in
> > the new helpers.
> > 
> > Series organization:
> > - 1-9: fixes and error propagation without the new reporting helpers.
> > - 10: file and volume metadata reporting helpers.
> > - 11-16: boot/system metadata, logfile, runlists, iomap and compression.
> > - 17-23: attribute metadata, failed updates and inode cleanup.
> > - 24-29: index/directory operations, namespace recovery and exportfs.
> > - 30-35: MFT, EA/ACL, named-stream and reparse/ObjectID reporting.
> > - 36: atomic shutdown reporting.
> > - 37: reporting integration for the standalone attribute-move fix.
> > 
> > Validation:
> > - Built NTFS with W=1 and checked all 31 NTFS translation units with
> >    Sparse C=2, with no NTFS compiler or Sparse diagnostics.
> > - Passed 15 QEMU guest runs with NTFS built in. These cover normal file
> >    and namespace operations, named streams, inode/index/runlist/EA
> >    corruption, readdir, shutdown, filesystem ustat selftests and
> >    fsync/remount/data verification.
> > - The index cases include invalid INDX entries_offset and child VCNs
> >    outside INDEX_ALLOCATION. Lookup and readdir returned EUCLEAN and
> >    generated EUCLEAN events after the listener was ready.
> > - Passed 403 controlled scenarios using extracted functions with
> >    controlled dependencies and ASan/UBSan. These include the existing
> >    error-path regressions, the new index-allocation guard and VCN checks,
> >    and source-removal/destination-cleanup failures both before and after
> >    reporting integration.
> > - Added two exact-count QEMU checks: an invalid MFT FILE magic and an
> >    inode-local zero link count each return EUCLEAN and report one error.
> >    The old kernel fails the same MFT check with error_count=2.
> > - The guest runs enabled non-strict KCSAN and lockdep. All three KCSAN
> >    selftests passed, with no KCSAN or lockdep diagnostics in the test logs.
> > 
> > Thanks to Hyunchul and Namjae for reviewing the earlier versions.
> > 
> > Baolin Liu (11):
> >    ntfs: preserve cluster-free counts in attribute cleanup
> >    ntfs: add filesystem metadata error reporting helpers
> >    ntfs: report runlist and cluster allocation metadata errors
> >    ntfs: report attribute lookup and validation errors
> >    ntfs: report attribute list update and recovery failures
> >    ntfs: report attribute conversion and mapping update failures
> >    ntfs: report inode metadata and eviction cleanup errors
> >    ntfs: report MFT record validation and lifecycle errors
> >    ntfs: report MFT bitmap and data growth recovery failures
> >    ntfs: report MFT writeback errors to fsnotify
> >    ntfs: report each shutdown transition once
> > 
> > Dandan Wu (11):
> >    ntfs: report required system file and volume metadata errors
> >    ntfs: report logfile metadata and emptying errors
> >    ntfs: report iomap metadata corruption
> >    ntfs: report LZNT1 and WOF compressed stream errors
> >    ntfs: report attribute resize and relocation recovery failures
> >    ntfs: report incomplete attribute range updates
> >    ntfs: report index validation and block I/O errors
> >    ntfs: preserve and report index traversal errors
> >    ntfs: report directory lookup and metadata corruption
> >    ntfs: report index update and recovery failures
> >    ntfs: report namespace and file recovery errors
> > 
> > Xuewen Wang (15):
> >    ntfs: propagate mapping-pairs update errors from inode writeback
> >    ntfs: handle source record removal failure during attribute moves
> >    ntfs: preserve attribute search context initialization errors
> >    ntfs: preserve synchronous buffered read errors
> >    ntfs: preserve compressed I/O preparation errors
> >    ntfs: retain directory iteration state after errors
> >    ntfs: preserve buffered fallback writeback errors
> >    ntfs: serialize export parent reconstruction
> >    ntfs: report boot geometry and MFT bootstrap errors
> >    ntfs: report attribute record update and cleanup failures
> >    ntfs: report export parent reconstruction errors
> >    ntfs: report EA metadata and restoration errors
> >    ntfs: report named stream metadata and recovery errors
> >    ntfs: report reparse and object ID metadata errors
> >    ntfs: report attribute move removal and cleanup failures
> > 
> >   fs/ntfs/aops.c         |  20 +-
> >   fs/ntfs/attrib.c       | 898 ++++++++++++++++++++++++++++++-----------
> >   fs/ntfs/attrib.h       |   8 +-
> >   fs/ntfs/attrlist.c     |  61 ++-
> >   fs/ntfs/attrlist.h     |   4 +-
> >   fs/ntfs/bitmap.c       |   2 +-
> >   fs/ntfs/compress.c     |  35 +-
> >   fs/ntfs/dir.c          | 115 ++++--
> >   fs/ntfs/ea.c           | 173 +++++---
> >   fs/ntfs/file.c         |  30 +-
> >   fs/ntfs/index.c        | 370 +++++++++++------
> >   fs/ntfs/inode.c        | 269 ++++++++----
> >   fs/ntfs/inode.h        |  10 +-
> >   fs/ntfs/iomap.c        |  66 ++-
> >   fs/ntfs/lcnalloc.c     |  17 +-
> >   fs/ntfs/logfile.c      |  58 +--
> >   fs/ntfs/mft.c          | 353 ++++++++++------
> >   fs/ntfs/named_stream.c |  61 ++-
> >   fs/ntfs/namei.c        | 144 +++++--
> >   fs/ntfs/object_id.c    |  50 ++-
> >   fs/ntfs/reparse.c      | 109 ++++-
> >   fs/ntfs/reparse.h      |   2 +-
> >   fs/ntfs/runlist.c      |  23 +-
> >   fs/ntfs/runlist.h      |   4 +-
> >   fs/ntfs/stream.h       |   2 +-
> >   fs/ntfs/super.c        | 310 ++++++++++----
> >   fs/ntfs/volume.h       |   4 +
> >   fs/ntfs/wof.c          |  49 ++-
> >   28 files changed, 2311 insertions(+), 936 deletions(-)
> > 
> > 
> > base-commit: b028412297e640db52195df2649368c1910e8e4b
> 
> Hi Namjae and Hyunchul,
> I've addressed your review comments on v5 in the v6 series.
> Before sending the series, I also had my colleague Baolin review it.
> I'd appreciate your review of the updated patches.
> 
> Thank you for your time and feedback.
> 
> Best regards,
> Xuewen

-- 
Thanks,
Hyunchul
