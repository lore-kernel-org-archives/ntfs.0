Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189586;
	b=d1NA9FbMopMmLHSZg0ezFMW/fBD8+Rp7wzYP7nKjyycqmOTTr59TWmOq7bpjzCGTdA5+
	 +bLyTrzPEY3r0Us5RYuXNgK8p/I8ts2yMH2T0bSznTtx6LBx0VzX7wK/3UR4BQnrcFzIj
	 GJ5+rw0NON+EuwOjKVifwDMwqphjkhdrOzhMOi60qoetIEEQ2LT3tJngG80ktlprNhA2m
	 6CQ7fVbzqS5thi0zKX1gHjWVerWG44Erqy83l1VcKNP3KNHRl6PuslmE715rCX5rKFoX+
	 GH44ldznKZ8Gyzn1TLMpDtIIecCmSyW24/dNqXu5C2iHi8k98rLe2HnYGX+ibp8rEJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189586;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=HdJJGJvLJfBXV+myjhoI101l0bLvmZStfb+qas1H65M=;
	b=b8CzRy8GHO8Bqm7ZRhzUNo9Ms5itcmjD7Re7mHNMGibK8b5iDQmmL70IkDubleNRKBqH
	 tw9HhHzCQZGaTRB5zb4FHo7dAKf2xiE6JWEkiVJqgaLK3xDsZrAQMFnjz06rVN9vD690I
	 Gb30CfkZxNGL+A1Q1iKonJo5Ma5r2nq55chmcXsj+pegq7NwTUa+8nvoNPVBMeuf0oWWd
	 tc6rTIHfxpTNy3iIC69u90OPj1qG6lVQ8dbLHuzzduBV1HtzVHzBgIH8GHiQ6EyboePdw
	 24cSNiJ1ZC2I/JXognyu2VbjT6L2BaInpXKQeAHWXcttBR+r+4Wr2PjIJG4/QuuQetg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="SotyYDm/";
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335FC606A320
	for <ntfs@lists.linux.dev>; Mon,  9 Nov 2026 01:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335FC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SotyYDm/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=HdJJGJvLJfBXV+myjhoI101l0bLvmZStfb+qas1H65M=;
	b=SotyYDm/hruw5R2SsojDiVa3MY+I3Zg8f0S6scoTLSKX7DJkkvOJEw5JASj++z
	pVQqfToLq+t7QG5QEMLHRIch06ta/ize8f/gpMVmHrjJS/DbSNdfhZrB2ySeGlsR
	iXgiyUwOptIt9JhHg/uXr5n+9A1oFqc8KW2WP/diJaUQ8=
Received: from [IPV6:2409:8900:1fc3:1c4:1334:395a:4176:707c] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3XyX5KPFqmwDTGA--.55471S2;
	Mon, 09 Nov 2026 09:59:23 +0800 (CST)
Message-ID: <90e94e53-08b5-4ca4-8dff-0ab92abdabf1@163.com>
Date: Mon, 9 Nov 2026 09:59:20 +0800
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
Subject: Re: [PATCH v3 0/5] ntfs: support O_TMPFILE
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20261106063059.2904988-1-liubaolin12138@163.com>
 <CAKYAXd8JHaJcs8j-Jbf3UecDD-SKEnhAsMd_7XJ1eh8HcC=UpA@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd8JHaJcs8j-Jbf3UecDD-SKEnhAsMd_7XJ1eh8HcC=UpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3XyX5KPFqmwDTGA--.55471S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFWfuF1UXw4DXF13AF48Xrb_yoW7Kr45pF
	Zaga98tw4DJr1xW392va1DXF10vayfJF47Jr15WrW7uwn8KFn7trWxKr4YvasrC393Gw4j
	qw4jq34xXF98ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR-o7iUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h1gK2rxKP1dkgAA39



在 2026/11/6 19:37, Namjae Jeon 写道:
> On Fri, Nov 6, 2026 at 3:31 PM Baolin Liu <liubaolin12138@163.com> wrote:
>>
>> From: Baolin Liu <liubaolin@kylinos.cn>
> Hi Baolin,
>>
>> This series adds O_TMPFILE support to fs/ntfs. Applications can prepare a
>> regular file's contents and metadata before publishing it with linkat().
>> Unpublished files are reclaimed when their last reference is released.
>> O_EXCL prevents publication.
>>
>> The series keeps the same five changes and ordering as v1 and v2:
>>
>>    1. Initialize inherited ACLs after allocating the new MFT record.
>>       Anonymous creation needs its inherited ACL stored before returning.
>>    2. Preserve prepared atime and mtime when publishing the inode through
>>       the hard-link path.
>>    3. Initialize the new FILE_NAME's packed EA size, since a temporary
>>       file may already have EAs when it is published.
>>    4. Complete unlinked-file attribute writes before dropping the cache,
>>       including EAs and data copied during resident-to-nonresident
>>       conversion before publication.
>>    5. Add O_TMPFILE creation and publication support.
>>
>> As requested in review, patch 2 gives the new FILE_NAME and directory
>> index entry the same ctime as the inode. The inode ctime is updated only
>> after the link succeeds. Patch 1 also initializes a newly created
>> FILE_NAME's ctime after inherited ACL setup, fixing a timestamp mismatch
>> caused by moving ACL initialization later in v1.
>>
>> In v3, patch 4 also preserves data copied by
>> ntfs_attr_make_non_resident(). As reported in review, growing DATA in a
>> nearly full MFT record can convert SECURITY_DESCRIPTOR and leave its
>> contents only in a dirty folio. Evicting the zero-link attribute inode
>> then discards those contents.
>>
>> Write the resident value to the newly allocated clusters before
>> committing the conversion. If that write fails, release the new clusters
>> and retain the original resident value. Propagate the error to the caller
>> instead of continuing with another attribute. Patches 1-3 and 5 are
>> unchanged in code from v2.
>>
>> While implementing and testing O_TMPFILE, we also found pre-existing
>> NTFS bugs in attribute rollback and ACL lookup. These include stale
>> attribute inodes left cached after failed creation, which can cause
>> subsequent creation to return EIO even after space is freed, incorrect
>> ACL inheritance when the default ACL is not cached, and a fixed-size
>> read buffer that cannot handle larger ACL values. The underlying bugs
>> predate this series.
>>
>> To keep this series focused on O_TMPFILE support and review
>> feedback, we are leaving these existing bugs to a separate bug-fix
>> series. We plan to submit those fixes after this series is accepted and
>> merged. These issues remain present with this series applied.
>>
>> Tested this five-patch series in QEMU with four CPUs, NTFS debug and
>> lockdep enabled. The requested unchanged xfstests generic/004 and
>> generic/389 passed. Tests covered creation, publication, last-reference
>> cleanup, O_EXCL, normal idmapped ownership, named streams, nonresident
>> EAs, direct I/O, mmap, allocation and concurrent publication. Published
>> data and metadata were checked after cache eviction, remount and reboot.
>> Offline inspection compared hard-link ctime in STANDARD_INFORMATION,
>> the new FILE_NAME and the directory index.
>>
>> The conversion regression uses 1 KiB MFT records and varies EA sizes
>> before writing 4 KiB to anonymous and ordinary files. Offline inspection
>> compares SECURITY_DESCRIPTOR contents with the original resident value.
>> The v2 kernel loses converted security descriptors and some EAs; v3
>> preserves them with 512-byte, 4 KiB and 8 KiB clusters, including after a
>> fresh boot. An injected block write error returns EIO and leaves the
>> resident security descriptor and EA intact. Free space is unchanged after
>> that failure, and retrying the write succeeds.
>>
>> Changes in v3:
>> - Extend patch 4 to write converted attribute data before switching the
>>    record to nonresident form, addressing the v2 review.
>> - Preserve the resident value on conversion write failure and propagate
>>    conversion errors.
>> - Add conversion and I/O-error regression tests and rerun generic/004
>>    and generic/389.
>> - No code changes to patches 1-3 and 5; add Hyunchul Lee's Reviewed-by.
>>
>> Changes in v2:
>> - Update FILE_NAME and index ctime as requested in review.
>> - Set the source inode ctime only after successful hard-link creation.
>> - Initialize creation FILE_NAME ctime after inherited ACL setup.
>> - Run generic/004 and generic/389 on the standalone five-patch series.
>> - Rebase onto ntfs-next commit
>>    564c7753647731d19170914c1c637d3b33d88d3b, including the const mnt_idmap
>>    tmpfile callback signature and documentation context.
>> - Resolve patch 1 against the updated early ACL error handling in
>>    __ntfs_create(); the relocated ACL failure still uses MFT/EA rollback.
>> - Keep the original five-patch scope; submit fixes for the pre-existing
>>    attribute rollback and ACL lookup bugs separately after this series
>>    is merged.
>> - No functional changes to patches 3 and 4.
>>
>> Baolin Liu (2):
>>    ntfs: initialize inherited ACLs after allocating the MFT record
>>    ntfs: support O_TMPFILE
>>
>> Xuewen Wang (3):
>>    ntfs: preserve timestamps when creating hard links
>>    ntfs: initialize packed EA size when creating hard links
>>    ntfs: write unlinked file attributes before dropping their cache
> 
> Can you check Sashiko's review comments? I think some of the points
> raised in Sashiko’s review are worth looking into.
> 
> https://sashiko.dev/#/patchset/20261106063059.2904988-1-liubaolin12138%40163.com
> 
> Thanks.

Hi Namjae,
    Thanks for pointing this out. I'll address the review comments and 
send v4 as soon as possible.

Thanks,
Baolin.

