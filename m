Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351302;
	b=iPpmlKGMaSfrn6zTcf9LDZxJCtydhNNC3AKY/tbjZL5Eg6mV8ssRNXRdeQDbyJAL6Nzz
	 +r9Ckw+S+GX9ECcVFm58E0NsSb0lEu0QELwcJfv61yY+2kZFKF6pmX1OXl3/TZ0SkXYw/
	 mGMOI8Elwkfx5hSEff/I73qL92Yk/igL24WzhP19OUIVh8QpqefMW9MX6e8SVFQV2ftj8
	 aGfBxc6b+u0eG2mVcqsxr4AlsW3CuWs0IQvYIf+Lzl4FP+CesDIE4WKm3ill9nUgRqbdF
	 QoQr4c4dCDfY4oeuCTI7ZkS4656yme/5dcgOjNLhlsIn9hpHEEYlY6eO2WjvYwJUd7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NLay0fAaS8K8zpYlT5J4F/CgngIHcMA7Bk+zXI74j1E=;
	b=EvWeGbnA7t//oqYFalsidoHAzFz6kCfTCh/a3UG710RUdOiiqD1BrOq1Fs8equSYlVpL
	 RTi9arC7WKLrDIBCYAVyWgA43fU+A5oCYUKLmSAMTkgpJL6qvfcGgnKnlTtVN64IiLhBj
	 a5b4lvvb4UTiu04GCJN/OVNEDjVrHMI+MabLtjeWsVnLZNqFvdMZSq1EEYX4j5WkhaDoI
	 ekB4xoX76ZxQoDOENj3s0JsZRAs0u8oFQfpQtcqyy+N0YhATZiGx9MyVdfw1DrqY1gvkk
	 jHNk5K6qNsobMWrnupDQDl1L0IvePAJP9WkWUu6oUfzeg01cYI5NIacmUYB8GqCj3OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g7R74Cgc;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A903606A32D
	for <ntfs@lists.linux.dev>; Tue, 10 Nov 2026 22:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A903606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g7R74Cgc
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so21034865e9.2
        for <ntfs@lists.linux.dev>; Tue, 10 Nov 2026 14:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794351301; x=1794956101; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLay0fAaS8K8zpYlT5J4F/CgngIHcMA7Bk+zXI74j1E=;
        b=g7R74Cgcy6bpixSjialMQ/ODzALkTnFX3HTckC485DBLzT7tWxoJ6D/uYSsqikm79Y
         ac+JGj65Y73KsK6RFN/Yip8j3pyXlwJ4/4lWNQoP+FMaecS2NC6O3rYSvC4fccqmWwof
         3/OXAWiAHXY1GinmtIILuecFUY94JU392WX5Hz5cbfEU1QOCCjM8AZ4msfMYJ7TL4BoR
         hcsU6jvNdxBVO6O24mIS8Is/0peMBBju8zC47y2NQLnn6bZuiMc6yGndfrkNAPWcuH4o
         65IKveqOVPXJ+Fq45uJrrCHg32CYyVjaI67P3BTD0UcgsHyiS7trr3JprpaH5oYXcakr
         640g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351301; x=1794956101;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLay0fAaS8K8zpYlT5J4F/CgngIHcMA7Bk+zXI74j1E=;
        b=WCbQ3K18LW3I+w8QWPXyB4X6VOr7zr3RPeHx64lBJjww0EIx1+p0rKP8R5z86RjR7y
         Qtsrr6fBmzLfo+MkzrhAOZBTWHt1h0f2TmhjSOAeOtPd6M+Rt+PvNlZx0SsmmhC1DXGU
         XdKsRF2ZMjG1O49duL4xDlo83aL7jCvpSgorbh9pvWuvwLcPHU5jiWy7iKErYPsxrCXi
         STIho/6q5kHMrmjROMV/z2tgdH5P6WzwHJnQTmHeSXB0vpWEOxtpUpcohIAq28yxRlGd
         dfi7to2l2JDVEh+8mhWcCmFJvPKKcsxIcEy4ZuUoXgwDUdWZr6CFAvpUCaIwKY7/0gTj
         ieOQ==
X-Forwarded-Encrypted: i=1; AL+hErH3wdrQ0pXn9a/phTvl0rrdSv6WR0DbLoXzYwsvbO2HfrHY4LrNx/a4exXbVrmi2jWj1xBG@lists.linux.dev
X-Gm-Message-State: APuU4Z92jKPo7vVi7TV2T3r2KFofKLvjVC6/MDyoS1W70yjXNR+kIyz7
	WZARAC6kWsp7s+v3m1q9EKZI5inTUyWITR1dEoZ8RbfR2Dj/6ksXeCwy0/2wlfCdgGQ=
X-Gm-Gg: AYBFou3FH/Gmh+6GJMAA0rDpbNza9dQrN0iFj25EQ388glsMUlny9H2DCB04KxB36Ds
	34WAPrygtt7wBF/z1sXVWujlgz6XRe8PbM+XBiewwQWI38fF2ycAyYS0NPCmSJ8h3tqK3QDqvAc
	wu+aAk3qdTQpUw48btXsytgTh4r1f7Hc/ICSLLj31QnxvsuSgjfVIYUyKn9EKUn2Tq+K0FsX38q
	8MwGgo7zZr08Zv5WjfG3Z4CXkZ1etMLs7FnRFaybwAQBHgbZIRzdOsFvZuIsAn6Mc8bucwIQNSj
	oJYcrPsyIi4mW8IYDLKnrzIiA5YtgFJ5cjNAclu9rgGhAcXkQWNatLOF76YV4wsMajLNyuubvkD
	MsuV5OcMLPhQLkWyRZxBoVZbXCmLXl4YCLIVs7opxvF4xZo1dkVna5DsC/EIjgQsXXRAxS4uqNg
	x/OOUADrqnLMWCOOgJm5f+i0f6Ze9PdWefmv0eQQntX2CeOIwX8b/cCT0VkJkTIk/Eq//ELDyhn
	nOAnHvEN0802HzaQHF5Q0EqQd/lOt6vf13cGkP/C3f0OZWJswMHq5ol23XsUgzgNsd2q1087noi
	fGlVe86t+PMzdfNr3ESq6w==
X-Received: by 2002:a05:600c:3c87:b0:4b8:fdd8:f2c9 with SMTP id 5b1f17b1804b1-4ba093c1c0bmr7546615e9.35.1794351300895;
        Tue, 10 Nov 2026 14:55:00 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e582sm1412409b3a.39.2026.11.10.14.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 14:54:59 -0800 (PST)
Message-ID: <c5c47eed-c927-4ee5-9841-7631674bf6a8@suse.com>
Date: Wed, 11 Nov 2026 09:24:52 +1030
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
Subject: Re: [PATCH v2 23/34] btrfs: check BTRFS_FS_STATE_RO instead of
 SB_RDONLY at runtime
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org,
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-xfs@vger.kernel.org
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-23-2f44f64f0b66@kernel.org>
 <c88e4e9c-6b86-4fbb-94bf-909522badf83@suse.com>
 <20261110-kursniveau-zeltlager-quintessenz-36b26debabe3@brauner>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261110-kursniveau-zeltlager-quintessenz-36b26debabe3@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/11 08:24, Christian Brauner 写道:
> On Sun, Nov 01, 2026 at 01:26:22PM +1030, Qu Wenruo wrote:
>> I love the idea. This reminds me exactly why for btrfs_force_shutdown(),
>> we have to manually set the fs error without marking the fs RO, to avoid
>> exactly the same problem.
>>
>> With that said, can you also a set_bit() call in btrfs_force_shutdown()
>> to also set that flag instead of the exsting setting fs_info->fs_error?
> 
> I think so. I'd set BTRFS_FS_STATE_RO in addition to fs_error though.
> start_transaction(), join_transaction() and btrfs_remount_rw() key off
> BTRFS_FS_ERROR().
> 
> Note that this changes some error codes after a shutdown.
> btrfs_permission() returns EROFS for MAY_WRITE once btrfs_fs_rdonly() is
> true so opening a file for writing fails with EROFS instead of the EIO
> from btrfs_file_open().

That should be fine. A lot of other call sites also return EROFS instead 
of EIO on a fs with aborted transaction.

And I think for fs shut down, EROFS or EIO is really the last time end 
users should care.

Thanks,
Qu

