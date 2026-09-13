Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B33C585C
	for <ntfs@lists.linux.dev>; Sun, 13 Sep 2026 06:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281868; cv=none; b=EFz4OUYUUmTtDmbCRthxyntMaYAIgycJq0CqjF6efWGCV03wNxSqf97hUugBaYw0xy9VSUkad4MEX2CCcyKoakCZIPWjspnWBv2k7WT8QLxrA585rGhEpMosOs+pJrSivfHGv0aOwUdFwu1D+nenMEbbxLsj8sPWeDqnfhlK3bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281868; c=relaxed/simple;
	bh=F71b0YXkH0orA176Jf84Hl12bHZNisAaLsX4N9ogBmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxb5ycXwN5GOP8N3l/4RKxxZjL8HEAhDFGdAMc6l87gCkroD1HHWLN7Qlpm9fTiFwAa3vfsEkg3VrIveh0V4wC0nTRnACy3v8FxA3K2rxe7ArkuEmHIrGOQwHP9Ya0MWo8PCkgTBQ390BQNkIy20ANdKB0SESJK5Gn99N7brreY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NzdtYejp; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NzdtYejp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=NhOir7VaKoIP/RMXm2rj5hE0nYOxBq0o4KeHp0NJ7eU=;
	b=NzdtYejpX5fQOkPZm2gyDVJUsbVAVQ4rKIrqtLo8gWc7LIUS4S7zxmbolz8amr
	jGks4XkwbGrRc/eILep1xTxFM+4CIXnxdYnH+ZGkul86IPJtcvwDIOZeDYnxIhIl
	4keG5mR8KfybpfmtWakTQyDfORdKCT1IGvm1KA6lIxIno=
Message-ID: <e2299a1b-0e32-4c0e-98c3-78ebd02a4825@163.com>
Date: Sun, 13 Sep 2026 14:43:58 +0800
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ntfs: fix lookup of POSIX names with Windows-invalid
 characters
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260913010236.17541-1-liubaolin12138@163.com>
 <6cdf40b3-1910-45f9-a3f0-2c41782ab267@163.com>
 <CAKYAXd9CoXPV3LrXwzhtdgjuBbyc8Y9K-eiv54_YZiNhW18Rhw@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd9CoXPV3LrXwzhtdgjuBbyc8Y9K-eiv54_YZiNhW18Rhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDn7wsuRqZqAIfCPw--.39294S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF48CF1DGr1kCF43Gr48WFg_yoW8Kr48pa
	yfG3ZIyFsrJr13tF92vr1IyrWSvrykXry3JFn5KrW3KwnYgw1fKrn29r4jga47Wrnagw12
	vw4xK3sIqr45uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR-yCAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwg-gq2qmRi8B-gAA3c



在 2026/9/13 10:53, Namjae Jeon 写道:
>> Hi Namjae and Hyunchul,
> Hi Baolin,
>>
>>     Hyunchul, I noticed that the patch you posted in GitHub issue #87 had
>> not yet been sent to the mailing list, so I assumed you might not have
>> had time to send it.
>>
>>     I am helping submit your patch. I preserved your authorship and
>> Signed-off-by line, and added only my Tested-by trailer:
>>
>>       Tested-by: Baolin Liu <liubaolin@kylinos.cn>
> Thanks for the test and sending the patch to the list instead of Hyunchul!
>>
>>     I applied the patch on top of commit 9a05b5715cfa("ntfs: remove
>> unreachable code in load_and_init_attrdef/upcase"),which was the latest
>> commit on the ntfs-next branch when I performed the tests.
>>
>>     After applying the patch, I successfully built a kernel with the
>> legacy NTFS driver built in. I then booted this kernel in QEMU and
>> tested it using an NTFS test image.
>>
>>     In a small directory, I tested the following filenames:
>>       1. The complete filename reported in issue #87
>>       2. question?mark
>>       3. asterisk*mark
>>       4. less<than
>>       5. greater>than
>>       6. double"quote
>>
>>     For each filename, I created the file, ran sync, dropped the
>> page,inode, and dentry caches, read the file again to verify lookup
>> after reload, deleted it, and confirmed that it no longer existed.
>>
>>     I also created 1000 filler files to exercise the large-directory
>> lookup path. In that directory, middle?entry was created, read
>> successfully after dropping the caches, and deleted successfully.
>>
>>     All the tests above passed. The kernel log contained
>> neither"Collation error" nor "Delete failed".
> Thanks, I will check it.
>>
>>     Namjae and Hyunchul, if you need any assistance with further work, I
>> would be very happy to help.
> Thank you very much for your active participation in NTFS development!
> 
> Can you work 64bit cluster support for ntfs if you have the room?
> Since this is not urgent, please feel free to work on it without
> feeling pressured.
> 
> Thanks!

Hi Namjae,

   Thank you for your kind words and for suggesting this work.

   Yes, I would be happy to work on 64-bit cluster support for NTFS. I 
will first investigate how to implement it, and then develop and test 
the changes based on the latest ntfs-next branch.

   I will keep you updated on my progress.

Best regards,
Baolin.

