Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CEB3F44D3
	for <ntfs@lists.linux.dev>; Fri, 21 Aug 2026 05:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288523; cv=none; b=WSLG9H11aRtdSmg0mLoMBHqvEwPc8z04+8xcvIx6tF4Hhd2sozkHv4C9FG/TCTLasVuD1ZNwWgqfwrtIHdSv6fWv/hJjl6QCGW1Iupu4aPea8zJym4aE8CZhSUrfrvftC47otvHrXfM+MziuxkUDw3Am2Q+QTEXk/6vA+RizI5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288523; c=relaxed/simple;
	bh=b78FkYRwYbJZJ6ser+AskvrS003ZNbT4Cl7/EGMaT64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D70ueAbQKAjXmhpBgu0zOi7/xEBy8AFcwotyLWRS8JVYV7jK2oxICjgzq1H6yS2duf4Mzne7gxyFVB36exeeGQgVSHHkjyOOCg3bLi9Nz54qXnEtaX1Mrd1+RYoLl4Q4CIabMigmCdvJrIIKjYwutx3EDGFtjOeADDWc5plSAa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dk2dqK3b; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dk2dqK3b"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e04df8c46so618979b3a.2
        for <ntfs@lists.linux.dev>; Thu, 20 Aug 2026 22:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288522; x=1787893322; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLwV/tRsLL/xB1cZUioPTtagreugVKNJnWGXbe1Lo3s=;
        b=dk2dqK3ba2jzqgG4h+OUYsmYBfGHGbe2rodNgyKt9xhX6o97m3lqE5egqvW0A06d+C
         vQoIxHCULOb/t29s5zmUGDAMAfkpstH/uuoZIpF+6ujl0ILG79F6aFews8tDa0/bXN49
         x1HIqnJMgoYonblRpV3WoEjOhqOQP8bQpQ+0DsZeVgXNABO6i8FuuwWphBI9Zp3i1SAZ
         NkpoxSV3cQjg7+XCVFIYAJqPyzznIlYVzVmqyTGQPAV1k1I0Bx3rrR1zXLLlqRrYpdmP
         3/31vycL8YXVW6X7ry4TcvordTS2Rr6Kll5NBY/JlFOeIEJ2tLcKdLI/vLW2+lKL9ly/
         Zhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288522; x=1787893322;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLwV/tRsLL/xB1cZUioPTtagreugVKNJnWGXbe1Lo3s=;
        b=qA2M/QUk8HNSOLgKy7rRDefQaA7dTHRdzsF1M7V5UutGx2kPpRzY44Y7llBjLYp1mc
         RYzyCzpvNs8UIzBdSVlIqqXWQ71qaKumBOp/O+9MO3cLyHhR7LhEozkHNnHpFZKFdm+6
         Y0BvEGsOEk4cO4CGkCJiB+EqlFuYlKUeFywZIVWOpUm+uqyPAEuC3uh3Tsb5LP73Shk7
         3quRvcxJiT6Ah4/kiwQv3Vslgprqdsr6s1/N1MehnvnCRpkUmPIeZ4e69yC8IAxfj8OH
         vJfw6eyd/8fWTyiiI5Yv4YcafJjTLP4D3egNe2yu2tMs66FzoTteMdmyGGozxu3TKpQ3
         aFRQ==
X-Forwarded-Encrypted: i=1; AHgh+RowxEx+OBCSD5y7cGMA1k8bG/AUR4GJ/HrJdDZRopIzMtOQxn7Xhi+EevGgJeZ4yBJkjPqe@lists.linux.dev
X-Gm-Message-State: AFuF++kxc6J5GcxqAHiW6SnTk1/vuOsWPfsKZGznyA/ei8+NtLa0U5A0
	OLXe5qWgdKi5h+5X2PDsnrdfkUXRyNOiAY6tXk8p8OzgCqBP3qFDJnqr
X-Gm-Gg: AR+sD11ax3sDIoyDATDIik3etCcKqscVIi2mI+Mrz1oIzlycxZygsHuKpJArIJ9G7wS
	LNYQuFCelge+WnlNjeT+m3kjAN3fsfudVx/M+SkqMvqSExmv9nRBqAstMpLkqpEZeZPfDh28En6
	WdeO+GdLQJsohg1vx/KuWlMEXDCO1xLalN+OT4Upk3MgnLR+jH74ALk8ufDPaHMk/10Q/F3qkVf
	IvVlCchLiWSoaIRXO7yBFGIvuIuAMRpIoL76/OmRj9a7I9hkiRD4I4xC/2Aaxd0QpqKOzJWjA+U
	VTFk7YXlXoZLiFj8fO2IWNCBmA3OPknwkXoUVOqkkGCEfPYjongS015Jx6AZ0VtUdD+iOxV/f33
	cEKSrvbAi13tBjEJV5jEvIQLLQn5AbOw4BCi0YghSGfMtxmlB4WEWXr4PfbS2mA2lLMrTxg9oo3
	0+NhTs7MOGtSs5eAtYti5RVDXEUrb7WdQJa0H+Y4xBudMHFT+GG0tNYkZpKmN6ZfDl1KNXV9V1k
	wx/D8Q=
X-Received: by 2002:a05:6a00:988:b0:848:6f5c:a327 with SMTP id d2e1a72fcca58-851fa04cd54mr4769585b3a.15.1787288521620;
        Thu, 20 Aug 2026 22:02:01 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a19sm2319545b3a.43.2026.08.20.22.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:02:00 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 06/10] ntfs: return errors from inode initialization
Date: Fri, 21 Aug 2026 14:00:55 +0900
Message-ID: <20260821-topic-wof-v2-v4-6-7a6fa10743b8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
References: <20260821-topic-wof-v2-v4-0-7a6fa10743b8@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=b78FkYRwYbJZJ6ser+AskvrS003ZNbT4Cl7/EGMaT64=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqh9tO2NVEjkzglt0UW5m+aTgDkInjvU4Rww+ff
 0Fylz+Fx+OJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaofbTgAKCRA08jD6945I
 0xZbD/96AtMJ+hf2WjHzUOGon5rFXdsRm6qyOMLKBCHL3UiDMHLd2q9rFxsYdR5WH/or/fLD/IG
 hOBdthIN+pmvPMX3m0yhP6ui4k04wOV0hXk9yw1RFUAp9C1YSStg5lnsOCT6Fb/Un4VMtDKfKZn
 zreXP/awX2sTzFnkBuNcot+N8DrfKuY7hvhP//6eIu7CiM8rFRQ22JA+/Lm/xbO5ABo+GPjDBnB
 JoJ+rSXFkkTtG5PN9U5RQ60GlPx9rM0/TXfjkTNS5Mjafxsna2XgEojUjtw3gskR+uBDqnda/23
 7g33K8WGJD7uolZxJL9RKH4+TbQC3IXl/0UouVQb35CJGf5zdasEEMSnu5LdYPuFNLior5YmQuJ
 z9sDmFPevjwlHuaUTJDgpximFWckvPtL9Zh2e7wFAP/qhYMnBp9Xm9lfAosCP9w+4v5os1V5Qts
 1HK5q5mgCX+3b8DpcEOfVBTjVr0J+St8YLoI0r3lVa8su2GIq8rdqV+ZB1mDYxPFAiw/qstLIQY
 s+cGYKdgMReY3J5q1qwUcZ3DAfyQOnx3+1QN8OyS7gkVniKAiO+uo7/qeMFMC8igEfIPIEFP4Sr
 m/UJZJO/tp7sI9yBZA3J9DfCApJemKRMDNzMFUDdFtXviu7CKxqazQ4MkpHpLPFoOxZ/VsJ3OlY hUDQ5/0NdY3pQnA==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

ntfs_iget() previously converted only -ENOMEM from
ntfs_read_locked_inode() into an ERR_PTR(). Other initialization errors
left the inode on the normal return path after it had been unlocked.

Return every non-zero initialization error after releasing the inode
reference.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 45e013eb3541..ea97a6d028a3 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -173,10 +173,11 @@ struct inode *ntfs_iget(struct super_block *sb, u64 mft_no)
 		unlock_new_inode(vi);
 	}
 	/*
-	 * There is no point in keeping bad inodes around if the failure was
-	 * due to ENOMEM. We want to be able to retry again later.
+	 * There is no point in keeping bad inodes around. This also
+	 * simplifies things in that we never need to check for bad inodes
+	 * elsewhere.
 	 */
-	if (unlikely(err == -ENOMEM)) {
+	if (unlikely(err)) {
 		iput(vi);
 		vi = ERR_PTR(err);
 	}

-- 
2.43.0

