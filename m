Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657573;
	b=1Us+Mtm2K+k8b38wjbsH61GJwlR3oJ09edzpOFs2wajrz8d+/1C0Y2ZHsVUfcx6tCyzZ
	 GCJ18ZQOyLDGACDrafWwleig8oTwAYxQdQYk3/s9IVZDZ2ZEONL5yjbXSPgIRGfoS1/aE
	 h20/m4ReoDXUvGGqcOzjPOitEN6vmFhCOoMxAVyApMLiCUhH+LmiJtfkqwq/WJMn8Y8eK
	 4Ql/OF7BlT1BQk1Ys+pub8NDIVg0bp+kGJ5StJxmAgtBObCo7aIZ0r6U54lmjXRAsRgW0
	 0bM2jJPhZ/rXlBcraTfPr29nu7IquxSbWce4RkhtX+nacofrOmdV6pVIceXsdITBJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N3rF56mN2BXOSxSUx9gHKtG6JzkuGpKqR77BvF5Wa5M=;
	b=acCeuulx91LJrieniv3z+kktB+mzl6NFEExxGrIA+SntDGdRQNuTiX86tyh+Z+bFdxQU
	 MnV6Fg7sXV4sLLG6VVXJTbOyegV4i8bazndeWSiiBhzNm6+Am0fjb0CGTmMDVUxtocuK4
	 4wrDpc8dKR/qXWdG57nz+qPAVtHe0nr7vbmXMNOpLc7B5+vBt1+KBW0sVeXKuxHBL8U7B
	 6Phk2dAK07zSrsrG/OcB7PNvTKqrxs9qXLIomoKwGvWB92FdQ0xU1CedvVHdJswq8D5Vg
	 p3pl+HDbKjyj6/md25jEqJHjPjQ3ERr7qsRr5YlC0FazdZT4acJ/CgFbXp9rgljq3Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XC5q3SEm;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93492606A31E
	for <ntfs@lists.linux.dev>; Thu, 26 Nov 2026 01:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93492606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XC5q3SEm
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f045b921caso37990695ad.3
        for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 17:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795657572; x=1796262372; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N3rF56mN2BXOSxSUx9gHKtG6JzkuGpKqR77BvF5Wa5M=;
        b=XC5q3SEmjPWVBpNzF70gDaP0WP0+DRcIp43xmB0zV83mElZHMYMOarrBNOWgwZCuEc
         ZtqJcmFEtpbBTlLKVGNGoYZnSERcjJFxcYQd17V4S4quavsGHsF9d5qTKtldFx6h1cdZ
         0bsfZDRzoNBiYPNwNrTjeqMaH9r12wRFrggAtgT4FtorF4LiLxQ1QOfb3TtNuQexcBdM
         9cXI0XI42mHatspRz2j4+aELIrAi/KQ/kwYd3D/tZusaWY3uWXracJuOIeknQOCJLhBc
         I8cZBL1uFWcirf6cofUbZg6sP17dbWFK39D++MHNLr3kKvgb8SyKeo4I0qzv8+m0u1FV
         Kvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657572; x=1796262372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3rF56mN2BXOSxSUx9gHKtG6JzkuGpKqR77BvF5Wa5M=;
        b=HqkjhyCWXo+SGcJfT12ZWwLyL2T/WRQowPHsAmI8Ihf0UAwvW2mqW1tWNOvgqKxSOb
         OAIQCgweeocXKbU2G1JFp1JdGnOBnRa8ZnyLD0fCiDmW4baU7ryPpQ82gxf9cg3X0RmZ
         AFwvlEJiVDEVzMXjX6jN2WsfrRs90mS0LhacJT/0H4z4Ykr4g7EQudbtpiTb0BBcBaEL
         iTDRbCdz/c+I8rWlOa7Fo861l90NX/ENSiCq5o4fE/xgMWw7NneFBueVwhdtEGx6lvdP
         ivaFQySNWPdMQDlzEmA639h10Ant3yPP99nk33SVAWjM/5oEx5zppk8XE7rKfWIhqTGB
         WIIQ==
X-Forwarded-Encrypted: i=1; AL+hErGm+rq92MMnROJR7AAyoCtJ49YsJniI3N7ngYarHs8qsIBHx4OEbCbO269v/yJfybnQEvBN@lists.linux.dev
X-Gm-Message-State: APuU4Z8RMvz3ko5asKDXuyiDKW+iFilvCPGtBCs11sk0F/5ww40wvbvG
	aYvobG8/4Ftd/M2PrTdz9lccNO8fuio324KvtowbuuYDE/v6WT9ljPfI
X-Gm-Gg: AZFdTZesrV2yoaCihIilpUMR1WuYqhdTJR3SL3Frib/Pxs3KmSh/7HvE9/JQQKXdhzC
	6tGcmhTmq2XRTDuyhyTgPBrHVv3EBc//L7nsVxv2uzdxwxv5G4ijqSwox1COkGYoKj9wwAQ55VS
	OrSEQhXAnjz8MhTpqG0HeIFwLT8ZJTypedDJ0u4SoxiQme45kxmZlpN+s9sSCFIgBRXLGDYBueP
	kzqI1DSeQqlpiAH11GFX6enpU5LZ9xZQG2rpdEMdVh3crTQktTMWlrLwfgfN+DUvQDXMLAdxCpV
	Kc1bnVOumhHFjBBZiQ6cSossefgCPUnTzUTmjI15lPYZ6WnXib9V7D/R7QjFvWk0PVAo3f/PYgO
	XXKWq+J1vz/iRra3Q6myn78wNjl0BfaqcUrHNlIeFAwth0iakt/TvEzR+7v/Qqk1ybvBjaz1HXO
	pKysYtZGOCb6bAjTv1a89p2u4tBVuDyldAetociXZT0P2+NqgPrq25yfkW5CBaWj2XfzOu11NeB
	nEucmUYM237ZShadAkTKalknShDh/gcawLOKfEUZzZ9Pswq9Aq3DuVk1C8jA4FKnyZJ+pvI7QCH
	DRf4wPqSXoq8Jhiw5Mw=
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr182916555ad.7.1795657571753;
        Wed, 25 Nov 2026 17:46:11 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f15663fsm93505385ad.76.2026.11.25.17.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:46:11 -0800 (PST)
Date: Thu, 26 Nov 2026 10:46:06 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: shaos <shawnq1@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ntfs: guard the final LZNT1 sub-block header read
Message-ID: <awePXnz3-KU0hCh-@hyunchul-PC02>
References: <179558384099.146091.12975349907127521352@163.com>
 <20261125085004.1816027-1-shawnq1@163.com>
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
In-Reply-To: <20261125085004.1816027-1-shawnq1@163.com>

On Wed, Nov 25, 2026 at 08:50:04AM +0000, shaos wrote:
> The legacy NTFS LZNT1 decompressor reads a 16-bit sub-block header
> before checking that the full header remains in the compression
> buffer. If only one byte remains, the read crosses the end of the
> 64 KiB buffer.
> 
> Return -EOVERFLOW for an incomplete header while preserving successful
> termination when the buffer is exactly exhausted. Validate phrase-token
> length against the sub-block boundary before reading it.
> 
> Tested on x86-64 with QEMU. The original header-boundary reproducer
> and a phrase-token boundary reproducer no longer fault; both malformed
> streams are rejected with -EOVERFLOW. The one-byte control still
> returns byte 'A'.
> 
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
> Signed-off-by: shaos <shawnq1@163.com>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
