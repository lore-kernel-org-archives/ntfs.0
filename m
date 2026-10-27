Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082084;
	b=rvde8NVChocY7m35zhRwXa7HIJpXKvILp1TaHvUkW6E/EZwaeHUwACQxUH1b+Y2EuDKy
	 b6i38pOtKx8Dvx+i8lLNN3mXIx2+E+RTGRzbIZ1eDD0/OAyi/KZJNMUrHh/xGIXuUwClY
	 RAXQS9oNpxMRMfDpkVPqTkJbURwSGGbQBqhTATKOlNwdFsdlLYpaBN44z0IfulUkCfO8h
	 ioIakvcf+yHWnaR/ntm6QV03pRIxuOlCwK/Stm6appCqU0lq1L630+irg321P3zJT8bhN
	 e4w/H/rtBtkFnliTNni6gIB4y0z20rZ2++sKymmTiYyX7rC/4yut5bRPBJKmEws3ecg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082084;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=l9ItIO3RAqtM9QI15WCRAxxgeyUZsdZcJ6WEzUfQrXA=;
	b=2vEpIGwdjllSyobyMdfPTnrqA+Qz0aQHl0ScfTaYdyxmaGgFKEm5L1cpE9iYsEGmwvtO
	 iy+X8s+Ss5zYTkWpYm7xCGFMYK63n91lLHemL3XNM2lNP8dYAz8gHMzZIBRgt4Gt6l0r+
	 HOr1wSh0yVVMSVcPMqIB2iNC2Mn2pMkdOkcNgtuaEHg+sYIR0wnVR1xGXS0n1aywUg5kT
	 9/UaQA+V/bAKG453Jn7GtSKZznPaom7m17NAY65VnmJhoJ1wQfPFfQnqqjEDbNCBgqK9p
	 RPY2ZcUS4GwswEvr9ttc0/et7N86NTHRrIiJAnmTGxWyYcGGTz7gWd5ot/zLZPg6PRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bEF8MrZP;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B90E606A332
	for <ntfs@lists.linux.dev>; Tue, 27 Oct 2026 06:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B90E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bEF8MrZP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=l9ItIO3RAqtM9QI15WCRAxxgeyUZsdZcJ6WEzUfQrXA=;
	b=bEF8MrZP/kd60zSJA8VDG3qeInKhYMvsoDCd27xqMRDzZwnmtQ3MfyU4R1HoPH
	LEJpEkOIRdojfPyWPeC4PEKyhY/VunLgpQ87gNSqE87zP+L4YjE1fBzScaOwjxG2
	OT8dfzKVzYUSqInCWtHRZtKzjnGvvcA13yXpvWVp/gMHQ=
Message-ID: <fbf185b3-e546-4d37-afc9-9fb509fcbe34@163.com>
Date: Tue, 27 Oct 2026 14:20:49 +0800
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
Subject: Re: [PATCH v4 28/31] ntfs: report EA metadata and restoration errors
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn, wudandan@kylinos.cn
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-29-liubaolin12138@163.com>
 <auA734yJUBRQPQD_@hyunchul-PC02>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <auA734yJUBRQPQD_@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3h6LBQuBq72NfCQ--.28847S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RNEfoUUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QKTXmrgQsJKWQAA3-



在 2026/10/27 13:51, Hyunchul Lee 写道:
>> @@ -605,6 +621,8 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>>   	} while (next > 0 && offset < ea_info_qsize);
>>   
>>   out:
>> +	if (err == -EUCLEAN)
>> +		ntfs_report_file_metadata_error(inode, err);
> 
> this function appears to reache here with -EIO or -ENOENT.
> 
Hi Hyunchul

    You're right. I'll check the -EIO and -ENOENT paths and fix missing 
reporting in v5, while keeping normal absence distinct from corruption.

Thanks,
Baolin.

