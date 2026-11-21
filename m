Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795224048;
	b=FYJpKJaOiX59PaHgDCVzHxUC1PZ+6YA7dfoVe07q20lKmujA3YhnpcowQiBgVy5SlH59
	 Pkl6e3tG2VZ6HLpBbymm2Zs4wzUQ/e0aEfZXmrwqiyf9ZDOzMmXwPg4iq7IgHSs+DDQwb
	 yV5JrHa5EkX2hHleh71oLVWrzGlRIEoqJF2YnUhByd2TU34I8l8h8bHYmQbJwePnS76iK
	 4Szu+6l8q0GShUa8SSTHXktToK18ie48ueYuQ4Lx6DE7QAI0g3fuMQsnFm/pu00ttZapU
	 Ds3u8CZGmyi8MllGJ9Pg8kLwrtduTaxyADdhUoqajIHdmCQDMPaj/bGUtTPZfKnqL6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795224048;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=w9TtPue74KWHmOLF2RuPzJGcJy4BtzGwLEVGiqoELVo=;
	b=Ds6l0Skoi2usHxXhS8lSl/2GL5dIEhTcr49ZsvqH7rmqoVwnLqraTy6JVPxCDyoSVHLH
	 26wJT7ce2e6WZbepMK5fevaBi3l9bMCu6H+VrQYXRnm3WzYx/JJwsMTqYVkk/tU4ZjWLQ
	 akuGQfa4GX/ae+sMsgtnGi+jRSvTwN05H84sCSTX1obkD1nNuCXol/eNUfDAkhwt1eNI0
	 lvNln62X/i1bXkzlsvAqXelyYN/0mMw8e3RZ4QD9xghq4UTLp5l+Jr8LlSSBDlin7Asl+
	 1ZbnyTBc9j8tvoSck+696u0wNfmcF1Zz1XJ5ABU7k0YexNfNMzGT+ZdFCklWZoj3lgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gJcnaciq;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92165606A339;
	Sat, 21 Nov 2026 01:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92165606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gJcnaciq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=w9TtPue74KWHmOLF2RuPzJGcJy4BtzGwLEVGiqoELVo=;
	b=gJcnaciqAnAXCO6NXoAUtUykMLf2Uw6r9ij1LFSiHp40NbXXI9ZGFJaOXawMdI
	cYYiilskXVzTl0cek84r8t/UPjCUWrQLPbbTajHFhSCEqVrJoN/L4K7q8xdiSJEE
	nRDz4FYxCLsG/PMMtL2RjygL3YyqFOGCEx2wvIRTE1Soc=
Received: from [IPV6:2409:8900:1e87:c681:d9ee:4226:bb71:f1a1] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3PyLN8QBrWCQOGw--.3435S2;
	Sat, 21 Nov 2026 09:20:15 +0800 (CST)
Message-ID: <2a3b2050-76c0-44d2-a5a4-236003247f74@163.com>
Date: Sat, 21 Nov 2026 09:20:13 +0800
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
Subject: Re: [REGRESSION][NTFS] Linux 7.3.4 mounts 64K-cluster NTFS read-only
 after $MFTMirr record 24 mismatch
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: "d3nchk@outlook.com" <d3nchk@outlook.com>,
 "ntfs@lists.linux.dev" <ntfs@lists.linux.dev>,
 "hyc.lee@gmail.com" <hyc.lee@gmail.com>,
 "zenghongling@kylinos.cn" <zenghongling@kylinos.cn>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <VE1P190MB0877D026E2C3905F0324B46F85782@VE1P190MB0877.EURP190.PROD.OUTLOOK.COM>
 <ee94181c-784f-4f9b-8697-cca5abec6b07@163.com>
 <CAKYAXd8VV8hjeEqRLJ-HBDA3Dzw9bX45e6dWpie4soeZ8TBvDQ@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd8VV8hjeEqRLJ-HBDA3Dzw9bX45e6dWpie4soeZ8TBvDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3PyLN8QBrWCQOGw--.3435S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1xur4xGw4xKF4xGFW8tFb_yoWrZFWDpr
	Z0y3ZxtF4kJryDC3s7tFWxJa4Yy34ftF4Yq3s5Jry8Krn0vFyIqrWaqr1a9a95AryrKw4q
	qF1jg34agFyDuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRpHqsUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hCLVmsA8dD8YAAA3x



在 2026/11/21 08:57, Namjae Jeon 写道:
> On Fri, Nov 20, 2026 at 11:26 PM liubaolin <liubaolin12138@163.com> wrote:
>>
>>
>>
>> 在 2026/11/20 20:49, d3nchk@outlook.com 写道:
>>> Hello,
>>>
>>> Resending in plain text because the previous HTML-formatted message was rejected by the regressions mailing list. Apologies if this creates duplicates for other recipients.
>>>
>>> I am reporting a regression in the in-kernel fs/ntfs driver (NOT ntfs3).
>>>
>>> Environment:
>>> - Distribution: Debian 13, backports kernel
>>> - Working kernel: 7.2.12
>>> - Broken kernel: 7.3.4+deb13-amd64
>>> - Device: /dev/nvme0n1p1
>>> - Filesystem: NTFS 3.1
>>> - Cluster size: 65536 bytes
>>> - Mount options: defaults (including errors=continue)
>>> - Driver: fs/ntfs/ntfs.ko.xz
>>>
>>> Kernel log:
>>>
>>> ntfs: (device nvme0n1p1): check_mft_mirror(): $MFT and $MFTMirr record 24 do not match. Run chkdsk.
>>> ntfs: volume version 3.1, dev nvme0n1p1, cluster size 65536
>>> ntfs: (device nvme0n1p1): load_system_files(): Errors were recorded during mount. Mounting read-only. Run chkdsk.
>>>
>>> This volume worked read-write with kernel 7.2.12. After upgrading to 7.3.4, it is forcibly mounted read-only, making normal file operations impossible.
>>>
>>> Windows chkdsk has been run repeatedly, both through the GUI and command line, including dismounted-volume checks. The issue persists after rebooting into Linux.
>>>
>>> I suspect commit 749357bd48c16c4cdc09093450deca609492f012 introduced the new read-only behavior for this case.
>>>
>>> There is also a potentially relevant NTFS compatibility issue: modern Windows may not keep all $MFTMirr records synchronized on volumes with large clusters. Here the mismatch is reported at record 24, beyond the first 16 records.
>>>
>>> Please investigate:
>>>
>>> 1. Whether the comparison of MFT mirror record 24 is valid for modern Windows-created NTFS volumes with 64K clusters.
>>> 2. Whether this is a false-positive filesystem corruption report.
>>> 3. Whether errors=continue can be honored for noncritical MFT mirror mismatches, while retaining mandatory read-only protection for Windows hibernation and genuinely unsafe filesystem states.
>>> 4. Whether a fix can be backported to the Linux 7.3 stable series.
>>>
>>> This regression prevents normal read-write access to this volume.
>>>
>>> Thank you.
>>
>> Hi,
>>      Thanks for the report and the detailed logs.
>>
>>      I checked 749357bd48c1. It didn't introduce the mirror comparison,
>> but it did make errors recorded during mount force a read-only mount,
>> even with errors=continue. That explains the change in behaviour you're
>> seeing.
>>      There is a known compatibility issue with the comparison itself.
>> On volumes with large clusters, Windows 10 can leave later records
>> in $MFTMirr out of date.
>>
>>      ntfs-3g already handles this by comparing only the first 16 records,
>> or fewer if the mirror is smaller. See commit 85e208176ffd ("Stopped
>> checking matches of MFTMirr against MFT at record 16").
>>     fs/ntfs still compares the whole mirror. With 64 KiB clusters and
>> 1 KiB MFT records, that means records 0 through 63. A difference
>> at record 24 could therefore just be a stale mirror copy, rather
>> than filesystem corruption. Your report looks consistent with
>> this case.
>>
>>      I'll follow the ntfs-3g approach and limit the record checks and
>> comparison to the first 16 records within the mirror. We'll still
>> read the full mirror and check its location, and leave the mirror
>> writeback range unchanged.
>>
>>      This should allow read-write mounting in this case, provided
>> there are no other errors. We shouldn't need to relax the general
>> errors= handling or change the read-only protection for hibernated
>> volumes and other unsafe states.
>>
>>      I'll include a Fixes tag and Cc stable so the patch can be
>> considered for the 7.3 stable series after upstream acceptance.
>>
>>      I'll send the patch shortly and CC you. You can then give it a
>> try and let us know whether it resolves the issue.
> Okay, Looks reasonable to me.
> Thanks for checking this!

Hi Namjae and Hyunchul,
    Thanks for taking a look. I sent the fix last night:
    [PATCH v1] ntfs: limit MFT mirror comparisons to system records
  
https://lore.kernel.org/all/20261120155021.1618964-1-liubaolin12138@163.com/

    I'd appreciate your review when you have a chance.

Thanks,
Baolin.

