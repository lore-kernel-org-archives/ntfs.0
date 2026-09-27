Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD90A3D524E
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 10:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506644; cv=none; b=oevkFcxQLvFHwFD6f+4HMqptyb8CPUCXvIiUuSrx7jv9KOdiMIDFUkx/OxtytUfj1Y9WS2qMg5I1DBixgETUmur5+XI5OsTe8+yLDVIOGOSzzwKs/BYoK0snX6xiX5iGgMW5bBM6u/1RZirA2YSNMFM2gu2bUPAlmUYRtvzkWdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506644; c=relaxed/simple;
	bh=DsQkDRygvNose/dVmRGPOcE9DsBWB+hc9M+JrQpVR8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MuOYIWOx++buRIuT5+ZHZJMnVymKf0+aOjmP3kFUrLhHWbXOwRFd+WzFHmv8puXq934MnqufxgpCO9diY18pIg5tzN7OMAdE6P5XDJBGVRUROsIrCzjMCzE7xYgTmmnAB0kzyXFQpgo3kd4ZLsBp+GOnLbG4qhirHkw6iJVXDlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFDnI2w0; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFDnI2w0"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e5eso888977a12.3
        for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 03:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506638; x=1791111438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hdn6ZIYyqC193Cf5yEWH5VZfboJGstvpfi9see9V8c=;
        b=ZFDnI2w0tFSpYy1Xfr7gaX+sdQSp3PqrWBg+bg2XKxnvWosaKQZAtWK2LonBTI6xnz
         dNwyCwrfqrU88xEPOTYGv+4N6+ny/BeSSdsSEMCl5ZJdWaewkNR1UDPmIDoxhq91dRIa
         R+cqxlkE4G3oOy+Qp2MDl+wBUqn1B8yKyaQVf74wbYTLrSTPjP6LjnpP56e0/HcT2zhW
         d+4WwR7emeyEr+NkDbLFpgYF4NSdx93NMM0+ELGhfv6ZBsjqr7Ys6JoeyPpKXwkXTWhY
         hpHdncOcxM+Eb2fargk3AwJnMNHoDGrf93qaLp+V0pdwbmHQl5uIiv3iA07p3nrYeYmG
         esLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506638; x=1791111438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hdn6ZIYyqC193Cf5yEWH5VZfboJGstvpfi9see9V8c=;
        b=RyGb9lhK0+AgLX2lL9WLeGVVUoJsSXdG2UCiXSHEN64RCwDfIbVRQgG4e2l4OWB+dp
         00fZYYCitzPo6pEafXHyvRM5LhgskeKKk5cph0JGZqrFvF6fO1vOnEVRmOMy8JSFjYZ4
         rEeab9mFa3wgOQdTv/x0Z0UhPtOrvBNzM9sA5RgatvdD+17Ged/+XJLzex/AZUBkrQSp
         NAOG7bIux0JoXpOjxYmjTRFD1IAr84p2n+iven8LfJEZPpK32ToP6Gjci7P0WxTEahLq
         7yM8pcEBfEhn7kqz9RmtdcND3pds+vNLutBVvQfYdAaM5ecxzOzEHKupCnpjJ6S6OsAk
         yUCg==
X-Gm-Message-State: AFq9FYK29xmISw26HFg9TioR8Qf0GZPy4XWUlpAOgRJifkPgKM4+6CEh
	lOAGOZ1cf60ICQVJNpuTV6fHojV+q6Ui/vzGBK73VslumZLNd1mG8LI8AFWXytVG80R/ag==
X-Gm-Gg: AYBFou1MvtBgS++FcZzbgCX7+VVmPP+5hxPt23bIljmWlIdrMro8e4r8NdiUwsQEIiL
	Rs+mtuTTJ7awNjPsJ7dUcDgu+cG/hleLKfPzBV+Fy3Hq65DbkMNDBTix/F19UHNnTrcUBw/SLgj
	meI+auPWF5sQsyezzzTQhk3f2VT1Igxo0iyTa2IG/NlS2I/pCrnULvFLzZT+1svtBW16kmf2/lv
	0X92YtLllqBrxhcKZWxfuRD8SBJT+HBD4s8XNBNNGKHdNUil8NPigV22yOHoU45kG5fa17bwnRr
	wQ1ms5alquT8zdVXesV2rlZrRoKANm6I29J6k8U1HHSAtav7bQO9H8GsVDMgXK45E4ABLiMJ+dF
	PFenyv+IfTPKsVWZoiYkqwHoFg+ENVWjPD592WcpMroUO1wzvYW77b+xknFeOGZaaJybVFXmZQ5
	ZiD4RmLzzrm0y7DdWVDVg5+tc9yfDbmRSlkVumIt3eN9yJnyMFejdDi3wr9VmifE46mmqbcVg+X
	/RussyEXFc56OjJ0CKk/hhcnpkZuTGlDYl5NiizjTH7mLqYLWPZttI7oeyEGpSJtMMuWn6xcnCr
	vYvO/Y2IwfcaLaUTK54UeNRQ6I+3neGMnbUy2W+AWEPO06q0/67dmAEGO8g=
X-Received: by 2002:a17:90b:4acf:b0:3a0:f2c8:9ad6 with SMTP id 98e67ed59e1d1-3a0f2c89d98mr2256325a91.64.1790506637645;
        Sun, 27 Sep 2026 03:57:17 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5220sm14419192a91.16.2026.09.27.03.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:17 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ntfs: fix spurious EIO and ENOSPC on nearly full volumes
Date: Sun, 27 Sep 2026 18:57:11 +0800
Message-ID: <cover.1790503811.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix three errors returned while free space is left.  Patch 1
fixes file creation failing with EIO on a nearly full volume; it now
goes on until the volume is full and then fails with ENOSPC.  Patch 2
fixes the cluster allocator missing free clusters when its start hint
lies at or past the end of the volume, which empties the MFT zone, and
patch 3 removes the fallocate() check that then fails every later call.
Together the two bugs make fallocate() refuse space that is free until
the next mount.  Reproducers, run with KASAN and lockdep:
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-27-ntfs-nearfull

Matthias Goergens (3):
  ntfs: set the attribute list size before reserving space for it
  ntfs: restart the zone search when the allocation hint fails
  ntfs: do not refuse fallocate() when the MFT zone is empty

 fs/ntfs/attrlist.c |  5 +++--
 fs/ntfs/file.c     |  3 ---
 fs/ntfs/lcnalloc.c | 18 +++++++++++++++---
 3 files changed, 18 insertions(+), 8 deletions(-)

base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d

-- 
2.55.0

