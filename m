Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657633;
	b=rO91ME/S3ANicHmwIotPpmavv/VvySPlKKdXfLEkMcYF8DVm1tbD8hpEsFeN3ynhtLPu
	 ZOErTVm2cn+6VzmbVbW479AiYG3VgxxRpYD9UquGFxEbv4BL7bGbosIike2+pVrd1Tx9B
	 8qb2/ZKH0QBL2YnXpirVOARCqawVww4SeMqt/KJDofUKY1R89NYs5MiWDX8Od9HB4t4Xh
	 y16H10dPfl69wm64cMewCqp/Ori3eQF05jUtvPpeWRjnR27MuJF93wkjAoErHEe2FRcXP
	 VdfBrlELpvzDLhJ5jwYmCF8zzxEaYc8L/mweqlD9ToSUpBQ5zsEBR+xCh78kG9CACrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=C90z5eRMPRz7rm9tSvRsEhi09vVmUDZ/4/9fcRwxuPA=;
	b=ODjRzUxtylNJYZy16Nhj5q5LzpRlC3iDc3AZEChw1di4sS/+zuYupVdewkL+8U2be8wg
	 /L0Qm0GYKsTpi+yQhq1GwxMoS0ouUnuQWF7hbPr2GYrSqsP+JWc5wA6M2REAK0e0m3Any
	 y2+IiDf9nvR6soFwGmsHiGHHyUzxxt9yvKsYR+pMLNT+TPngTavQNiLv64b10kiCTdTvC
	 R9ZsjsQXlKkn8ios3XPcH6ykNgJZulOO14KhFuzfMWWSG42JdGPIekwW+9J1bsQNwTzr3
	 Ae2rm0KVGDqkQK4sMf8Phn/E5mku25cvE1t3jzSitXS03jttbA4UveMLZj0ub4TcadQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MBzxLPCe;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A99606A327
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 01:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A99606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MBzxLPCe
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b402824d07so4370026a91.1
        for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 17:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795657632; x=1796262432; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C90z5eRMPRz7rm9tSvRsEhi09vVmUDZ/4/9fcRwxuPA=;
        b=MBzxLPCemZjuFziHKPG2O4jS8D010Ng2RnG7+DinweEh49V4ZTptBm+knr8S/t/yAQ
         qgTTmh0b1OEAdEsw0h0JpMdqSbqsQru0cvJQryuvxF6sr4phSPbZutV6DTGyO5KwbMuI
         OS35lf08SWZ1UsK+fPjUwnDR9GBp59Ev8E6QyxXbETpOtZfLrCUBvBHW2kDZ8MIZLh8j
         WPwMCU5+Y20hkffX6mh/MV+KIIR41ijY1DqLTE82anfJE/hrPuyNaeU3SynViQ1t0yBU
         ZTM79O1yq6wzm+2nF4LQqfgE2yhyWeXf9e+sRM25RYHrMJIVo6snfYkS/oz5g7YDL+gb
         /qLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657632; x=1796262432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C90z5eRMPRz7rm9tSvRsEhi09vVmUDZ/4/9fcRwxuPA=;
        b=rBFbb53VQZeFvSmEx35uP+WbSZEqc37489JsfceN1MppfgzlZawTR2zbERB+hyTBXc
         IZttWFSZvXczuvlFBv3MdQAibg78MSbGSYFAa1txvblX0NLsCK/Yi5hJUejOCACt/NMV
         goyd8M/OqDkHXOGoVOpzUgoxDJr/Hvz09lLWp1V+6GKT6ENrM1sH1zunEzuOg8ASq600
         7MFLgH88cOtolRrynbNXywCoZAD6Ll3cmAB2U/WPIywrOK7i6k8yRXpOTYZyPqTu4Ttx
         LvenCoRpe9J12Xm+IIdaNm6o+JjT3eh6zvMF6irEsukY1gcRBt9LgGV0Td8xhjrUKUtm
         jhSQ==
X-Forwarded-Encrypted: i=1; AL+hErHbNZMNhtxkd7UkCi2DN/Za94XHnsK3RWh0Vp68ZaOWenQr2wDbAuzN3P6qXSCR89gRHw2T@lists.linux.dev
X-Gm-Message-State: APuU4Z9SVbOs6xG1A+P7zkkTH4izRMXjxZmeK7uEmG37XlKYH8V5TWJU
	z+oF0BPqHLxaR6ZaZc0VG6hu8UL8rrhiEx4SUsUAejmMZr3kh9XQKHOX
X-Gm-Gg: AZFdTZcVvQGaKJxXzwAeIP1TGKMDcWKesmvWll6QwjwMtGKpbh58Hniu6FVU9vrtE/I
	1UtBnvlKRrTYqRvNF6qA9SUPGuUniCYJOg+ojK8ubo2zrmKy1E2+Sg5G0J5OUbkzCPoIeCqk2V2
	cQLD+vMP/u/8IYT+3Rqi6euPOravDBpbRUXU23YAUgkZHoCJzmb8MoES+8UMVlrrjet3a4yNVPG
	1mpiwRpsWOATWHG52JXDs9SlWwCq1wKi/wAlVAYyxJr9epnFDMyRj4VE0kuVQwBNr6j0YgLjdKD
	pHD8JCnMmDKGGWjbSRRJrSckp1bmpRxarnu6vm4YQQMs0wJLCAumnjVYF2lZPwtj+MpxP/qi5fo
	c3K1LZaHhoqB7/Ek620Jy5qSc5wamwZT1YSjBCw4sBQub8PnOTidY4P36PR2q/Uc/5N/kFNJQyI
	kKjA4BERkXSzziQlXU8drIOfXi+IZ+6P0bwuvXDqfxBElwnSqvCsaPTzg5lryybW9GpmGjwNiX1
	ADZTEaB/FGCA+/eVZHW9y+DBD5r/BCte9wbAkl2sh33DYWifSDOWMp0HDgRXZVYethD/2qgvUU0
	FWQtDy2FXoX8ygeWh8awXPEQ7XhXSt4xiLxiaw4Z
X-Received: by 2002:a17:90b:2c86:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b41c8d9179mr18731494a91.12.1795657632334;
        Wed, 25 Nov 2026 17:47:12 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc6130sm10007818a12.7.2026.11.25.17.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:47:11 -0800 (PST)
Date: Thu, 26 Nov 2026 10:47:09 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Showta Ishizaki <zakinko@snowrabbit.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: keep i_size of a directory equal to its index root
Message-ID: <awePnaRhBQLahPpz@hyunchul-PC02>
References: <20261125-ntfs-01-v1@snowrabbit.org>
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
In-Reply-To: <20261125-ntfs-01-v1@snowrabbit.org>

On Wed, Nov 25, 2026 at 11:18:20PM +0900, Showta Ishizaki wrote:
> After mkdir, stat() gives a size of 0 for the directory until it is read
> back from disk, where it gives the length of $INDEX_ROOT.
> __ntfs_create() opens the index root but does not set i_size from it.
> 
> When the index root is moved out to an index block,
> ntfs_ir_reparent() updates data_size but not i_size, which keeps the
> length the root had before.
> 
> Set i_size in both, as ntfs_ir_truncate() does.
> 
> Without the patch a new directory was 0 bytes and became 48 after a
> remount, and one with 300 files was 248 and became 56.  With it the sizes
> are the same before and after.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Showta Ishizaki <zakinko@snowrabbit.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
