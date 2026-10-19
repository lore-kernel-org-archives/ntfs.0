Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425302;
	b=1zBkeGi4OiVxcDA7sqRlV41xF7fRocd3OPxktD6+c8K/lbjraEyyKSqQrwnb/JoQccrG
	 Mix9p27odnsCYAxH5FhP1vR0mHMeK6rQ/IutiXmQE7BOUoDSuz+mmkLFAujWl3/RCP3D1
	 mjFmffHiXPruCoEeeqFabn3k3cxbSN7EnxiHSJxXctIo6WDHVkDwnb4/oOqLFqMomdXle
	 Ovh/VpHtbniASnKbMhmHE7NE9fV0I0zYrqfSoQ/TIf/bXkaR4vPW5LlqO07R7vepHLPW7
	 2FEpuf5tmB6ge90TgvReay7b6Agv1r3q+yNbGZqzkPuScbupbky/bWEMw/1DbiFCIbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425302;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Precedence:Date:X-OQ-MSGID:
	 X-Mailer;
	bh=NXn8GMUfGW6rd+Ir0mSOlDwVjdtJ6f5AYFqGwl8YK5A=;
	b=OwADBpGKjsy282dyo3cPQdnkZq+ag1DeFxICyGOYRdo19mQnSh4n9a4sFdYRdnmfYxtq
	 rGHh8dBYlYFyFb110JRyrUPTtkhWRF3Wt3FhIyW/OMvBnVILxpE4HKdobGkeH66JJpA/J
	 suwSl9jZjLhZ6lWZhHPMORgIjGaGeZ3U4QFtdUGGT4SUi77uYu0SlCOcU3SbBJaLxxSms
	 GidX1LdsYywzMBi5kGqSqBY6tHizFwKKphtOgEbw5KUdXT/U60VJqb2M3si55rOrjhL8H
	 5d/N3gOgpttNI4KDTeaaIzxlOaSp2vSPZ08s1qEmYkzKme+LS4AlnivGoJ3X56qJkqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=NVEcrb4G;
	arc=none smtp.remote-ip=203.205.221.192
Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF8606DA6E
	for <ntfs@lists.linux.dev>; Mon, 19 Oct 2026 15:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63AF8606DA6E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=NVEcrb4G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792425292; bh=NXn8GMUfGW6rd+Ir0mSOlDwVjdtJ6f5AYFqGwl8YK5A=;
	h=From:To:Cc:Subject:Date;
	b=NVEcrb4GjTO/ShcHmY4hVikDeQGw9vQgDL4IlAazQlA4s0kc5VXGV4BRNZ9PFb/QO
	 1tA/UBkQeM/O8XAiSfQdg04GbLkOB/fcFTojeBT3CBOXuS0E8Tg/vylxjtCfKwufbM
	 QmoflUlaTecL/j4STNxNxSy/XEHRGQPfACV0/MQY=
Received: from [127.0.0.1] ([2409:8d5c:c30:3b3:b0a0:db46:6df2:867d])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id DB236845; Mon, 19 Oct 2026 23:54:50 +0800
X-QQ-mid: xmsmtpt1792425290to0r6hza4
Message-ID: <tencent_3682D61E92D8E6C91449FB8B33FDAB6CEC05@qq.com>
X-QQ-XMAILINFO: NAuAIaytDrXpZELMP7+bSpmy2i7n1COLbb5SYkDSQN5lcSRgOFPKozSuxxA2SG
	 9T81c0FMwww6khuL+O5EuNoqSUouHPMxPUmic6MDzdRb/GrD93XmVZp5XtVBavUzxlnA3Nw3KVQy
	 dtno8IJ81Acx2PB6gKFg+bALnbRY8dYHLfsvEMKMKTwlM0fQc6g/ARX2EM4hsrcix2Os7dKwbn75
	 36bnjNmsZThRCUe74NzbtWRgfgS+Ld8r3y3kV8KTJN3wJLOXrw9jgessyMnZa+fsl5CIGbpee+nJ
	 2Od2E7MuCVsSGXpUHW/pIgi1yvwzOBUZgpFHihkOPpb/N3fXUun/uQNxoKFRsxlc4J11Q5WtisFs
	 avHhKHfRlus1apGqFlDrAG5tgeSJv6cdw3iW0bFGr83qA8l3cV2VG1Sco9vhLZO0vUtQspFIKjc0
	 MWwNIV/ik57+ofuDkQnKIqTa6EdEkuIRGWNafuHSaJ88kYSdLta9QEQ7NOSdC8+/G6B5VsjVX1+C
	 B2475CIAlc6n4t5IcQ5NEEfeu7CqsOCyAL5X5peUrkFhBRlmubzZKu071u7mWlLDdB6pc6y5/luo
	 z2S+AlFE7gl84x10RE/HV5kcieQ8+ve828o5/VBqbQBzks3mOCo8cxciQ/YRhjD+nv5U+78HKhOZ
	 0RdurmGnwJMNTKLHOIuYDwW2qban1ceFzFblLYlDCeJwFv8DuQqq2No+gZX+aUyouCMQZnp8QvGj
	 zpdEOx5W0d51wSVk26KPZNvgF5HwMIsD1fsIh/Lfo1s9jw867DytIHKOK/FxjugzUo3lAxCCp8tb
	 3x+dwDlrjq8apyFRY2g/8djlGO1vsrTIl609A13Wg/x++aqaZaZE3aPKmtSRi6QmDp+zoByg+Fho
	 q/6MMO3BhtiJ+p88SnSI5XamgNY7+HyKSPrMbrlqwSQ4aD4VMBSjqtlV6XwqD97akO3LpqypZc1N
	 wBO7dzO1/Fij14i5TfxZkwv0ZROe5IrBt3BgtJ0plmsVbBmt2B+8gjzrnVpzDIMRtwApdcnbCHba
	 /6trOST5mI0TI/Ja/vp0Bk7B1Q1ZI/uCKxjNHaMxxqrLXkqTmx
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Hang Nan <2122295973@qq.com>
To: hyc.lee@gmail.com
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev
Subject:
 Re: [PATCH v3] ntfs: check index block capacity in ntfs_ib_copy_tail()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Precedence: bulk
Date: Mon, 19 Oct 2026 15:54:49 +0000
X-OQ-MSGID: <853cfac76d144ef4bff0fe763de8a272@qq.com>
X-Mailer: git send-email style plain-text report

Hi Hyunchul,

Agreed, and v4 does it that way.  ntfs_index_block_inconsistent() now
rejects a block whose entries_offset is below the canonical offset for the
block size, instead of checking the capacity at the copy site:

    static u32 ntfs_ib_canonical_entries_offset(u32 block_size)
    {
            u32 usa_count = block_size / NTFS_BLOCK_SIZE + 1;

            return (sizeof(struct index_header) + usa_count * 2 + 7) & ~7;
    }

One detail worth pointing out: the USA count is derived from block_size,
not taken from the block's own usa_count.  post_read_mst_fixup() treats a
usa_count that does not match the block size as "not protected" and
returns success without fixing anything up, so a corrupt image can keep a
small value there and make a bound derived from it small again.  With the
count derived from block_size, a 4096-byte block always needs offset 40,
which is exactly what ntfs_ib_alloc() computes; ntfs_ib_alloc() now uses
the same helper so a block we create always passes the check.

With the validation at read time the copy is bounded: index_length <=
allocated_size and entries_offset >= canonical imply that
index_length - entries_offset - median_size cannot exceed
allocated_size - canonical, so the check in ntfs_ib_copy_tail() is gone.
ntfs_ir_to_ib() keeps its own check, since the index root has no update
sequence array and is validated by ntfs_index_root_inconsistent() instead.

Retested with the same crafted image (4096-byte block, entries_offset 16)
and slub_debug=zf: the block is now rejected when it is read,

    ntfs: (device vda): ntfs_index_block_inconsistent(): Index block:
    entries offset 16 is below the minimum for a 4096-byte block:
    vcn 18 inode 64
    creat -> -1, errno=5 (EIO)

and no redzone report appears.  An unmodified image of the same volume
still mounts, and creating files in it still works.

v4 is posted as a standalone patch email, with Baolin's Reviewed-by
carried.

Thanks,
Hang

