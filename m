Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956473;
	b=QWFbH0GnoTLHb+shbIZO0xEZRUCuA92PLIBDO6ByqkywhA/v5J2QPfbPQvP5Bgvkm4QJ
	 LZICE1xEyydf/asIWW70DEcGPxfloBBBiXCmyv++QFwE/Fbi9IdwHYWFHqA1XqNLx338b
	 keB6aNCjsi7nYsq9pCXFo34SaCxeK/KmfdUoA1BSy5QZHP5vQG5/bZtz9fzgRJ06oohIo
	 1p4P0g0jw3FSLikAe733pZ2gi5ta37J6X3z3q3djWbVerV218rsAvoKL7PNlkqKwEVaGL
	 RFKqvm12WNgWudChPheKrEe0kcbP5COIpjWit5CPFn7ELR9pWwIyksuE4rf2clQcCVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hYxjyPXBHKTCAiV1LvERXcwFBgtg5JptbqNlrk95z/U=;
	b=ePsHK1Xxlg+vn8kmFviuvFqgZuptukfjsroM9Y4IsFCzpt9qUJSjeD8T0ly1QZaAcfY1
	 NyUAuuhim+DnHE5kufY9gVBF7SXaHQQHOwkHNMHM7LQPvG/L1iqAlv0+TVV1eQfTe69lE
	 6cWTOiDcX4cx6h3uVCEdqyrKU7uQKrYAaS4a93yyZRpZ/3Ysw0YYp4WmmQvsNj4ub4Faq
	 EmxJGExxOHYTBcbq3J4FKmyJk7cAotSNv46XyIzAbvTz8IFj46jEVSesauYE3W0Q0ypi0
	 7PKyRBB+y+ZMHL1iHzLdHi33q0IRY8FUjVmQf4ex6O+gY4mDpErJICI+oaq459BRq9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mHfsRgNa;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F2606A328
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 09:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943F2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mHfsRgNa
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so772166c88.0
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 01:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956472; x=1794561272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYxjyPXBHKTCAiV1LvERXcwFBgtg5JptbqNlrk95z/U=;
        b=mHfsRgNa+TVPbbifs04Vo2Ijy7fjmMAVqjkuSbmZL5T3e3Wstp0DxNmdX2TSR5Rxye
         Vv9BqwznOQ80BEpLCr4IXWDsWPEo8qNZiEoxq/TuD2zKD2HcAYf0F+alRhk0P5oBgc/h
         hXIPWN5hsDIbdeYFn8we9W5LwO96bo158Ndktv8/kIwNR1fr2Pv5gdt7N+46rK+hdXAB
         +Zw5eXhecbeEwLHoJZLvWCJY7Al40LSib3avKgdbaHMHqZ5yV7Facn+m19SR5WzhbpF3
         KHmSq09DRpYQPwCNzzeT31MGUpMQeWvtZif2E1BB6obh+f8OazXq7nX1HGX9UgxnoK0J
         D+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956472; x=1794561272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYxjyPXBHKTCAiV1LvERXcwFBgtg5JptbqNlrk95z/U=;
        b=IpmgE8jYAdrlG27tM/dXjaNdM5nAwSICsPai5D44+aHm2Y7DAItp1nXA+5FZfHe36o
         dJzk4LI8TnD4IiM1Sr0VicnxblUrPUclq9bRtpeECglTPYDCF2e6/Dp04UGO59t+biN5
         eQOBbkXy9x9gZG7Bw9tYxBt8I3i9lgmKiHvKH3OaOtV1vB1g4GnZq6+roByz8V5+i8nH
         eLP2Tx2TfOcStp/24Bz/ntH/965EOPqhsDmELtYtjFZaOcw6mIb1yxP8Ijjlv1WzVoj1
         rfOYaLLUm2grM6SlHn1AQ2mKuhGuS13uZXfBk4d3ZsZyUAzGUehd29G0OJqc49j48dop
         LkXQ==
X-Gm-Message-State: APuU4Z/oThp5qKTnfqcLnflCOo2aSPPyUsnR7IRR0LI+Yn6UpZOAs5ma
	zgXCoJHuRTb9O3qHbxH/tJwhiJVm8iE1ApKOkChRx6p5sfvQbC0bJXbB
X-Gm-Gg: AYBFou1pZ5OafVe6RuYdbeyBSnzYwgXol6DMUKNkxadeMwghuD5F+wI2ipzsoaMeY3o
	EaP9KmnD7oMQqYntdaBw4cAxk6Gmy54eBrpF0giyNWXQYNMxw6unWSM+q8DnkEqggHik1ipK2u4
	0EDSV2Hu1rQDv1yWsrwtI2xVpz+u9Z2/tXJZBwon6xs9BcYWg4zBU0aVNWKo0t/e8ysz+TUq1Ny
	PA8NcPEJI0PgJsRAUAH8tKNjzI1NkVYLerivqc6k8cW1Gif2N2BHWq+Q0q2oX0HN9Z4Uzm9OuVB
	BqwVdxm0lz88lomk3RIVnsiv0HE2W+fytiIs29huhHZ4tqsaRGBZi1kcjKuheVb6a2pObJ7hVtq
	ckKNJ+uqQV2e+hHVgbsBuCrsRNF8GvCkoikhOqBko1iqogprCYT2kovHr4DjyUdCasLHeNSemdk
	dgm6IPSTrl8K0paop3GgIQ1p8kQPTJ/aeSYoxz0d9qKgYDU02n+s2J0grq2GpjyYZSBUaCVw9+9
	HskqyKbknWLtEw1lh2V7HRTZ0tzABAbb6XGAdvh9Y+pH0bYoi4g9nXeV68QU24lpNkh4lzQOblY
	m0RS0MWibc561GY5FzMX3oNeThNMhLCt7+wN0b4JKWyZpxXaEz5ptjxn62Wi0mhrDw==
X-Received: by 2002:a05:7022:1102:b0:14d:c7ae:85df with SMTP id a92af1059eb24-1b25d31ef97mr2084289c88.12.1793956471465;
        Fri, 06 Nov 2026 01:14:31 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm4200968c88.7.2026.11.06.01.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:14:30 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>
Subject: [PATCH 0/3] ntfs: three fixes for crafted images, found by fuzzing
Date: Fri,  6 Nov 2026 14:44:17 +0530
Message-ID: <20261106091420.2461683-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
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

I fuzz the new fs/ntfs driver with mutated images: an image from mkntfs
populated with ntfs-3g (directories, streams, sparse files, long names), a
few bytes changed, then mount, walk the tree and write, under KASAN.
Three problems from that are still present in ntfs-next (e62b384ca).
Each patch has its own trace and the reproduction steps.

1. ntfs: do not read an index block outside $INDEX_ALLOCATION
   A directory without a usable $INDEX_ALLOCATION hangs on its first
   lookup. The task waits for an mft record lock that it already holds.
   It needs one changed byte in a crafted image.

2. ntfs: open the index allocation before reading or writing an index block
   NULL pointer dereference in ntfs_ib_write() on link() when the lookup
   ended in the index root. This is not the path fixed by 9365c4a1357e.
   It needs one changed byte in a crafted image.

3. ntfs: open a named $DATA stream by name when making room in a record
   WARN_ON() in ntfs_attr_make_non_resident(). This one does not need a
   damaged volume: a file with an alternate data stream and a full mft
   record is enough.

All three need an image to be mounted, so a crafted image, not a remote
attacker. I can send the images (about 380 KB each, compressed) if they
are useful.


Wahid Khan (3):
  ntfs: do not read an index block outside $INDEX_ALLOCATION
  ntfs: open the index allocation before reading or writing an index
    block
  ntfs: open a named $DATA stream by name when making room in a record

 fs/ntfs/attrib.c |  2 +-
 fs/ntfs/dir.c    | 14 ++++++++++++++
 fs/ntfs/index.c  | 17 +++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

-- 
2.53.0

