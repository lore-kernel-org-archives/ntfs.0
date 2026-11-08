Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794125318;
	b=sBoj1ys0n79qqh/D2tQeagZnlxyo4I4GIKHfAbY3bKlsQbT1y7J4pcszjUkF4ZgXWOKb
	 nHmfrqYYPSdumK+CYgICtkYbAVY/7PK3ujI+8tzY8K8bkYp7CZAaDcOz1kpGkhLNrZHXz
	 gD2GsSkZXjb/q/VseIPL1hMg1Y7yQDyrRic7thiq7QGHozrn1s8ocaLpoMKSYPL3D1cuG
	 pKenj9hPGESc47TI49GyLNq44qEXJ0wJdheGmjKN6KrtEKvHO45/5rC818A5VjQVkBb9U
	 ffLmNAyFgbmn0twLZcnCX9ccEELxey+eMfkn5nuHyv67KB6om3aq4aLdJkLcNbQCFWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794125318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TsRttVjyd52nFqSKn2goHPGI41zRyopfMZ0qKg9Sa5g=;
	b=ZHPLAKgpCGU51LHaOzzpIP4zdtSaCllLWQ5wcfnGxj7wgIZUeZZlk8c2dLAxNbyiIsO5
	 bLnp1pr4N2/C2w3ZkNe28V+CxTL3bSrWg4fQdx7m9Vh2Cs1AWMzUxM1AcqwxdC5UY6Rob
	 GHcJXXnOPEz/eYDGKDSnq1w/xRLWKdyBxQmEozr6VGdR5mSqmh337nDxqeoobhHuzZzIK
	 1pnNJWZG/428zKSarrX+Vg2w07yZNitgWCkVwhYE3ALtnW4MbbDjZanTgRbg56wIS+Zz3
	 xA5QHGKHBUbDvNJN6ALN6HE/1QFa8gIamgg0+9VXVwo9C1JURp3hqb6HikZyyW9O7qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=maDPNC6W;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A61606A321
	for <ntfs@lists.linux.dev>; Sun,  8 Nov 2026 08:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=maDPNC6W
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1120042eec.0
        for <ntfs@lists.linux.dev>; Sun, 08 Nov 2026 00:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794125318; x=1794730118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsRttVjyd52nFqSKn2goHPGI41zRyopfMZ0qKg9Sa5g=;
        b=maDPNC6WqJxs/R6oFXXNyG6Y5A2nBZdRFjnyCE4PRBboK34RbLs8FqWCXXsMyhFTfX
         4+2mwckwoNuC8HhKE3rbo0IMP2qN5LhkhdQKhL/cgNv9Yt3iADGCfKB+WsyOdgKtTIEs
         RhhtvmYuIJgeFqt9rFbajVzWE6cNg47bq6JP1FY+qkv8bRE17qktZYToLadFKIrbsScQ
         tBm5dPelxR6hMRMSGrgdyIcXsZLV+R62ch+zcGy7ndMCvlM2Csi7UjuECnNWqwZ+YdT1
         auY74d0GeKpIY87bHrGVD7p1yFd0RB3WOIZ8uczrvEBE8BmlmpRWvBj4yZd9LPPGKJ9s
         o8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794125318; x=1794730118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TsRttVjyd52nFqSKn2goHPGI41zRyopfMZ0qKg9Sa5g=;
        b=WhmhVuq4iG/i8imJoww+JTLALssXTqaqdkWkqMj9ulvXh8BY+tKusuYUDCfF8LuE16
         PtlFRXxID1nTx0bkCRnKbvCPi4Dei1u0V07Kb/1cKp19mlXCtI6GQYF7Nq84MU2vgnwK
         B6erinvet14TgPAphbcHkPiIcgf552JV6qPVoWg4A5PL5Kv/nG6ZmnBrMzMwAQW4CGzn
         h5/9/2y/Ya55O7xJEZAoBH1mbeIAMDZP7qKirKcOs3i/NRwEppgyr9X6gghoS790J1uC
         OsN3f6hhp8xZkpkkJKWqaicvoIeS2IFL+TMoI9PtIzbbU64FTbLVrj6q+gKCcV71n0O+
         JXag==
X-Forwarded-Encrypted: i=1; AL+hErHJ+D3+k7/KD7xJgJ2vMjq/imOqO3CUoqU+/mBBF6v/h08xkXgc1R3qlXEMS8drSLbnDcBK@lists.linux.dev
X-Gm-Message-State: APuU4Z/Tb2lfph0Up1xPqugebCgoerd2p3Tf6oGEVDopNIxhUVS+25FK
	9g8/TypoG7+Im3REK36Nv8ljpBPaqAs3506hmiJYK6I0Jo2vsz1Gbobn
X-Gm-Gg: AYBFou32s4k0lkCu4fLpSAM+LkIuUWxtAE/N2dD2Nj2Mv3oi9e0WjgGyDEJ/QiMoqzq
	3lEK0UGlCnOwcSAtcy7eNkZenGm6pPZRqhG6+zbaE0SPOAooawOwD+vWSrbNX4nAguBmHUznJaW
	1wz8qbmOAGo0B4VKyS5K8v9hIzkkOerW/d0K0uWDfYEt92+o5RtaOwR8YFg/yuKn6FC1gs0N2JF
	aRgUJP6rdhxNWqs7EIAPkav8ZrfvhSiTrgWE60FPD936T7XeFFTxBLhvOijDA+SJURQzl56A/gd
	yAhf3jbp1OnIomKw1zhLnD0qGc7j1+pbTcQM/00GY1nxwwDqZJ7o6VVoBZbCKOMS5DuwpmVj64P
	tx4zW+VEzRHO0fDEz2psyHZ947siyoedNGsfscb2qyfNoSmXlFXfWqK6NYsWpGLnsWb5zxNHveW
	ueInLc8FOnIQHGGb9z9MWXT39LpG1NESEAjiWnRbEzFECOXXttqTqxGpJrTX7BLV+mxXqIryzhI
	uvGOpieBisup8Zqf7isYr80M0HNUFQJVMS71y83/PSATTOJHHL95fPRabKIkk5igl+RDqBrjNEb
	Xoa2BQWR4UsAX5IQkonO71fiiC1Gi1R6ojMDYKgJpmct7HhGBF0G0zt9kqGUT81ANA==
X-Received: by 2002:a05:701b:220d:b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b39ff068c2mr1346405c88.31.1794125317382;
        Sun, 08 Nov 2026 00:08:37 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8a27sm3898586c88.7.2026.11.08.00.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:08:36 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ntfs: do not convert a named $DATA stream when making room in a record
Date: Sun,  8 Nov 2026 13:38:23 +0530
Message-ID: <20261108080823.473369-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
References: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
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

You were right, v3 deadlocks. I reproduced your diagram: with a debug
delay before the folio lock in ntfs_attr_make_non_resident(), a reader
of the stream and the make-room loop hang the kernel (hung task, lockdep
shows the writer holding the unnamed inode's i_rwsem and mrec_lock and
waiting for folio 0, the reader holding the stream's folio 0 and waiting
for mrec_lock). The same direct conversion of the inode being written
is safe because the reader of that inode waits on its i_rwsem first.

An automated review of v3 also listed other problems with converting a
stream from this loop. I could reproduce most of them, with a forced
make-room pass and debug delays:

- a write to the stream that passed its residency check before the
  conversion carries on with a non-resident attribute (iomap_iter
  WARNINGs, "possible recursive locking", hang)
- an unlinked file with an open stream: "mft 0x1b, type 0x80 is
  corrupt. Run chkdsk." and the next write to the stream fails
- a stream that is being removed is converted under
  ntfs_stream_finish_remove() (unlink returned 1)
- two streams whose names differ only in case: WARN in
  ntfs_attr_make_non_resident(), the lookup ignores case

v4 keeps ntfs_attr_iget() for the named stream and adds what is needed:
FGP_NOWAIT for the folio in this loop (skip when busy), convert a
stream only if it is not in the inode cache and its file is not being
deleted or unlinked, and compare the stream name exactly. All of the
cases above fail on v3 and pass with v4. The WARN from the original
image is fixed.

I could not show data loss on unlink, only that the unsafe state is
reached. The debug delays are mine, so these windows are narrow without
them. If you think this is more than the loop should
carry, the one-line v2 (skip named streams) also fixes the WARN.

Thanks,
Wahid
