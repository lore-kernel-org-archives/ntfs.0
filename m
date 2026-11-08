Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175893;
	b=rGbhH39fl9sNHVLMwNZp7dXco3EpKvQgQpgdPy/gc7x2BjLATH1PylkQOiIV1l9gOstm
	 Cd8qdj1gr0NqRzs18SXbVxeJFzWAIQt4lVMsk/lqQPNYt4G4n69YunSnaTnDrB0VLHJh/
	 ubhEvQhzL/qNz6urK2qBmTsgM3XfSlLBSOlYWvzDChWryAwLl4S7N+QZdickCM5knUIHM
	 CkZzipvxfVLfxrjmAjuobmXqexP161v975QlxA1RWBf2wJiw79a9L+sV0vrSZAel1FayE
	 iJAtiwiEcM3a1VSLHS2d7VdZSYmq0ak+uPO5kmCODtf+baBHvxHvy5SfKR58Mt3wgbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AtwP5j20gn7E2EyXET3bhOC0Urzo30JN8vyaQdZ3DMA=;
	b=ucKQecFIBX8fkWngtBKrC705AvrG3cvRLFDu7I2zEp1V9Rx0lkPnZ7Z0oWgU6mKHJoxG
	 IzaugOJW9weWBfnwFSpOHVzFFG+3cc82lp2cuKyjD35LQ59+IGpVR+VTFlpyD97+i3hP+
	 XbsGaM8YlxMWelpLxcpoPVyn8e9OxFPJmLEQ8KoqdPdxID34yAVxzTy/j1YOrGGEiNaLF
	 OFTi6yL9S9+wx1xIfDID+we9pxmIbP/fvzHw+V+ZdET+oOhRZJI27hdRKdRw/PCZVTgsW
	 3QPdfDE5pxl9RaMoNpXBgtGlOERMElD9UtQwE3gY1AehFLwTTg2BTAaUwvPgu19z9iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5Kkcino;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1300606A321
	for <ntfs@lists.linux.dev>; Sun,  8 Nov 2026 22:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1300606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5Kkcino
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so581317c88.0
        for <ntfs@lists.linux.dev>; Sun, 08 Nov 2026 14:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175892; x=1794780692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtwP5j20gn7E2EyXET3bhOC0Urzo30JN8vyaQdZ3DMA=;
        b=t5KkcinothwLZ76HaAqEJ4a5wZd06/nPPDGPmgdki0xUY0UhvQ5jdh8NNKQoGqy0N1
         Geh1T5wITpWluNGSncFEBR6PCG+s1wJCuWecPqX4vVM2Y3ZOm+eSvC/UIS3utGLFDCFJ
         bFBViBQiE5wsgDIIqLSMvZVfMZpR+YF9rVl4eGfnYcUc+zU44s6Uo/iRXdDrbfRtNoZL
         6Qfr749eH7tN2PYINME87o3LGqWsJj17ZKRz6dvvlAAnMtrMU4jtFOdX1PwhAw9WSUUb
         gW2k9oKTlX2tjnFY4btyajCyLmav75O9GhO1P+ns3BbtvqdT2MEJpePp7FBkD1i1bkD7
         XTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175892; x=1794780692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtwP5j20gn7E2EyXET3bhOC0Urzo30JN8vyaQdZ3DMA=;
        b=fFKifxi9TImAC/CjUiX+Sz+8DCkQcf05wo6kqfNBihr+tCtXLO38DuEEDi2bAthxc2
         Db+KJE/pkb6Vekza7xukOv0GxCGK3ML3Fi5heEmzI1D1eqkOtFQWDvHgzuDhX0Fkh99R
         35x9Bf7jlzquMitkOtHljcuu8/75IUyd64dhp9mAFmsDcnEhMRcVrabO+8arj5AdKJqn
         cm3RHoTU8WNxruCbjCOVpz4UVlwu5EHF2VIQDMaHa18Nzu/9uzVfKAd0ZbcLEwnBWCB9
         6lzlDfOwnQOHIygnhq9NyuWN2/0JKrm3az3efWD17LLTp82v7BTdOceYM9R8TZMegyZO
         4u6w==
X-Forwarded-Encrypted: i=1; AL+hErFxofiarQFnXZvAvZNol7RGvQyPth6o1HT2guhxSZce04JYvK95tshiQo3c6nDZ340Z7t4L@lists.linux.dev
X-Gm-Message-State: APuU4Z/HCs9+bdhLd4t01+wPno+ft56VCZy52ZgkEG49Z1J9zAuvk7/H
	+wqo1ZmEFlQeoxOQLewp3RUS6lNfWLVerZKUwKKQB6giqiKxruhpYmp6
X-Gm-Gg: AYBFou1AhNi1HkE8CKEHLfZ1LF4BfNdJnxBxvURZxdkp7FvJkeNQrO+lSFQcP138Spw
	ZgAmZgPDWfZsOjCv3kZg3c/A5kuGRpRTP76RIRPxz4yo51M92idyNFkys/ll2ixEWGIR5ygoa31
	PBy8oBuPlEgEZ5Rz4GWG0uXZDaiH9UqWVTUsrTuWENYATjBzQ8X3KOp5PwQcMGqvQEku8EfzJ9d
	xdqMcNs5H18efgszUoD8rKWzt6dSzzCEiT++FfKKYndtOxm0pdGkkS8SISUnPePzOrfziJnriqF
	pSEGf4RpNz15Nl7bjiuDict1S5Gtmuw49oS0F7+ZhfV0ZTZ42JgjkL6ft0s5BH8dM49mFXmonRp
	vT420DUy56zgAJokgy9qfIA0U+camR839AkvJC/a/p7hSRhF/mD5iEls3U01ghBi7yIwhaVe3Mc
	V8scN48QG6rcFk8RMN6Nao8QjQs8vdBWFWkAdTFIY0PohDrTGGmQocRqyrpkNti7ekiYEOl8Lw2
	K+MZJnBhw+TL/r5caDQx7Auj9ASTyWex32I5os0vrGupuftlXqwXF1GmSlpPCtvWvlrskkAMwRV
	6/mo296A7lWeUHQeedgP7ogxiEVBxk0A8Co/Rl5U7Vbot6ULhsuw7338ePOp/aUM6A==
X-Received: by 2002:a05:7022:b0c6:b0:183:e993:7901 with SMTP id a92af1059eb24-1b39fe9485dmr3817898c88.17.1794175891567;
        Sun, 08 Nov 2026 14:11:31 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771f833esm7912691c88.21.2026.11.08.14.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:11:30 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: linkinjeon@kernel.org
Cc: hyc.lee@gmail.com,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ntfs: convert a named $DATA stream safely when making room in a record
Date: Mon,  9 Nov 2026 03:41:04 +0530
Message-ID: <20261108221104.1081384-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd9=crUmmGbO1vcPsdz-GmWoHxD_W_bRv2PQ_Db3Q+EkCQ@mail.gmail.com>
References: <CAKYAXd9=crUmmGbO1vcPsdz-GmWoHxD_W_bRv2PQ_Db3Q+EkCQ@mail.gmail.com>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I went through Sashiko's review of v4. The WOF finding is right, and
checking the rest of its report turned up three more problems in the
same loop. I reproduced all four with a forced make-room pass and debug
delays; each fails on v4 and passes on v5, which I am sending as a
reply to this mail:

- WofCompressedData: the stream of a WOF file was converted, but
  ntfs_read_wof_chunk() reads a non-resident stream from the device, so
  the file read stale clusters until writeback (249 of 250 bytes wrong,
  correct after sync). v5 leaves the streams of a WOF file alone.

- An attribute converted in a file with no links left is evicted on the
  last iput() with its dirty folio, so an open file reads its extended
  attribute back as missing. This is older than my patch, the check
  covered only $DATA. v5 converts nothing in such a file.

- A resize of a stream or an EA converted the unnamed data of the file
  under a writer of that file (iomap_iter warnings, recursive
  mrec_lock), because only the resize of the unnamed data itself holds
  its i_rwsem. v5 converts the unnamed data only when it is the
  attribute being resized.

- The conversion of the attribute being resized waited for folio 0 with
  mrec_lock held and hangs against an mmap fault or a splice reader
  (hung task). I wrote in the mail to the v2 thread that this direct
  conversion is safe because the reader waits on i_rwsem first. That
  holds for read(), not for mmap and splice, so it was wrong. v5 uses
  FGP_NOWAIT there too. While such a reader is stuck on the lock the
  resize now fails with -ENOSPC instead of hanging, which I think is the
  better of the two, but tell me if you would rather handle it
  differently.

The six scenarios from the v4 mail still pass, and so does a WOF file
read before and after the conversion. I also ran a mutated-image fuzzer
(about 800 images, KASAN and lockdep) and the resident/non-resident
reader stress test on v5: no crash involves this code. Two things the
fuzzer hit exist without this patch as well, a WARN in iomap_iter() on
the read path of a crafted image and a lockdep report between extent_lock
and the mft runlist lock. I will look at those separately.

Thanks,
Wahid
