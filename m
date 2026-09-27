Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC55195B1A
	for <ntfs@lists.linux.dev>; Sun, 27 Sep 2026 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485713; cv=none; b=cPHNjP0AdjcLgvg1RSNVi4DeUZq0x1lygEIHiW0erwpmUVkSZIee2inWVb59/FYfnyzXVuv1nCuROZahtHyIQmg23OlGonrPIjZcMkxEI8VuFIQjbYMmvj+FcOj3ZH+KPFF9shXuJbbpdczU/VLvn3lMsTDfxWbJ8qC19uPD76w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485713; c=relaxed/simple;
	bh=CmbrNXVAYqa3pMRQjrJm0NpRq56JoeKYm+SK3RhWRdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jX8lkNHq3pem67+p9uu/r/2VrP6gZDSkmsvddHF/2RpyHydnCU43MGoDHT/X391m+NuBbY9UL6j6DtMx6vYpbmms+kuLm0PoEEkKrHua+SSh336rpIlfn+qPoNQM5Z8d2OtbVzRxiwJ0jNwHWH1zlmT3V9cwKTDryWqaOwwFc+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HL/DA6ho; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HL/DA6ho"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0b25dso13009595ad.2
        for <ntfs@lists.linux.dev>; Sat, 26 Sep 2026 22:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485711; x=1791090511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MKaxGmfWE+Dz0aKj31pB/k7Jyep9gZ6ZS/k+y564DE=;
        b=HL/DA6hofEpDI9+UqkX3XnNUyWePEuS9sQUQJwOz88yjdIAVpTebPNN1/clvmE+Qsp
         bAb0Totlcf4KcWP/3PvbksdVsR6/T9/uBhKVtIo4IODaFe1NHazvd8tFuaRx/jZIRCui
         MXNGYbYVqB9zxs8Mfa2c4xtBXScf0MjGc7TfTmg1JBHNL0n5Lyzx6XlAfA9tzjVLXo3S
         TQfHw0jAWpPscdGH6bI+PdGYK0THtW9jX81FSvBQU2D5EiKxjUlAarf2ozTlc4XatALX
         MnadcIZbYQjImvp1MFp/L9xyJq1unSLrmzGkqnEPZ9saz4ZorO5x2Dv6IlKQ8k5jc1O3
         D/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485711; x=1791090511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MKaxGmfWE+Dz0aKj31pB/k7Jyep9gZ6ZS/k+y564DE=;
        b=gjdX5Vd2Z5OV8XorDNzXZDZoOBjozDYH2EhueBqlI0yvl7RjTqP1luE714nKHHKtVA
         9gV2RoSD0nG4+Vpg4wYTR0AMDqiS4K8yZJswpTdSvIngJAUOO02OOF0thBDi+Ua6Lu7u
         /2MkLrGwcg//0wlkmkcF/NMdyG3NQORG3iRmI1ExAfDxOZTAczrsPocDvyKf5awl36To
         uZTR7uzDgjXL22/yWpJEdH0x27H2znznfbP+qx3CPG8oeCjRziNwPvUL//PZycBVNDAz
         8xch0pBvNC7Heuf/vSlFKZHOHgWlo9pB6M77rSR7xGS6vmLJJvQInNg9ytwC3tiKC0OD
         y0mA==
X-Gm-Message-State: AFq9FYLb8vkYMTdO3Gord0yFI8DtqcnIOLOCOUJ0oMnMGkYYgarptFT5
	8hf0Qie4pkLqMF5s3+x58duWgEHaeMB2j+tYWMZtOlJa+aqbzB303rB5
X-Gm-Gg: AYBFou2PVZJE8Qu4WkQiv1sOv+gWEmpjtjnKFTuUxgVuJPbmdVbbR4ov+GTobXT/50a
	QBKAOU6QdBObx5HrtmphtCmmHISakVEa9zk7gn4V2GXFS0XdVN01nehns3Hk0biqJ0x7dYsdLh5
	TSB3OqXW8bGebkwH5UaD2jPcIHTNRSFH4mZQNZ91DrXE75HboI7t8ub1E/uh5CFz8TPtGb/DG90
	h0LRlOsEzy/qn3VNX4J/HeN2veDMJ0naPCunhRZu5zdNYQW500sDL2n5nbTZbmQgCLZZ7v0aBA7
	qyzopTAgmxbxLQfw37cFXCPjOZHcReMSf5PeRGbNBHnhcqeEYwGTcXLHJov8o11Zf8c+HZEhjGX
	pZ60bLzxQ92tCg7x6PKV27/GQt+1eIYnMrAvo8zm8G4xjQrljYpgPfYHFusljTmvgKg1HOjDAb4
	IN3Pa14IvOu2cbHHSFatDaR5/tfn53c+OoFfiGb0sztSGLTU9iDwxX4oVzq6wNYo27IaAwNno81
	H2ys1tb+fIcArBNg3XtIViibWtZOKPA0WjkOhN5d0I6sl9QSK1I5p16bcUNaA6DJLkIAFg/tD2/
	nzN9RVm3LBkwk4kWpBBjIAeZjox+owO1KGjoqP9lxavz3SX55eduwcyvf8l8
X-Received: by 2002:a17:902:e88d:b0:2df:a00a:2e3 with SMTP id d9443c01a7336-2dfa00a0543mr38304855ad.14.1790485710858;
        Sat, 26 Sep 2026 22:08:30 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:30 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] ntfs: fix the $MFT bootstrap hang and reads of unmapped runlist ranges
Date: Sun, 27 Sep 2026 13:08:19 +0800
Message-ID: <cover.1790417653.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arMoap0ZgeORuktT@hyunchul-PC02>
References: <20260922153931.1976405-1-matthias.goergens@gmail.com> <arMoap0ZgeORuktT@hyunchul-PC02>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hyunchul,

This is v2 of "ntfs: fail the mount when $MFT needs its own extent
records", now patch 3.  As you suggested, the mark now stays set for the
whole $DATA enumeration in ntfs_read_inode_mount().  A crafted image
that puts $MFT's second $DATA extent in an extent record the first
extent does not cover hung v1 in that loop; with v2 the mount fails.
One correction to v1: lockdep stayed silent not because of the folio
lock, but because ntfs_fill_super() turns it off for the whole mount.

Patch 3 needs patch 1.  With clusters smaller than a page, patch 3 can
refuse the tail of a folio holding an $MFT record, and without patch 1
the refused range is mapped as a hole and the mount carries on with an
all-zero mft record.

That hole is not specific to $MFT.  Patches 1 and 2 fix it for any file
whose runlist is partly in an extent record that cannot be read: reads
of that range return zeros with no error, and buffered writes into it
report success and are lost.  Patch 4 does the same for a runlist that
ends before allocated_size, which a crafted $MFT used to get past patch
3.  Patch 5 refuses a $MFT whose data_size exceeds its allocation, and
patch 6 requires initialized_size <= data_size <= allocated_size, with
allocated_size a multiple of the cluster size, for every non-resident
attribute, as fs/ntfs3 does.

Tested under qemu with KASAN and the hung-task detector on ntfs-next,
with and without the series.  Nine crafted images that hang or crash the
mount without it fail to mount with it, and six that read zeros that are
not on disk return errors instead.  Eighteen images that mount without
the series, among them eight public test volumes written by Windows or
mkntfs, read every file the same with it, and six small mkntfs images
still mount.  The images and the scripts that generate them are at

  https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-mft-runlist

and, for the ordinary file of patch 4, the unaligned allocated_size of
patch 6 and three of the volumes that mount, at

  https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-v2-extra

v1: https://lore.kernel.org/all/20260922153931.1976405-1-matthias.goergens@gmail.com/

Thanks,
Matthias

Matthias Goergens (6):
  ntfs: do not map an unmappable runlist fragment as a hole
  ntfs: do not turn an unmappable runlist fragment into delalloc on
    write
  ntfs: fail the mount when $MFT needs its own extent records
  ntfs: do not map a vcn as a hole when its runlist lookup failed
  ntfs: fail the mount when $MFT's data size exceeds its allocation
  ntfs: reject non-resident attributes whose sizes exceed their
    allocation

 fs/ntfs/attrib.c   | 54 +++++++++++++++++++++++++++++++++++++++----
 fs/ntfs/attrlist.c |  8 +++++--
 fs/ntfs/inode.c    | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/ntfs/iomap.c    | 16 +++++++++++--
 fs/ntfs/layout.h   | 13 +++++++----
 fs/ntfs/volume.h   |  3 +++
 6 files changed, 137 insertions(+), 14 deletions(-)


base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
-- 
2.55.0

