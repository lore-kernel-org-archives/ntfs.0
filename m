Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5577F2874E6
	for <ntfs@lists.linux.dev>; Wed, 16 Sep 2026 01:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520629; cv=none; b=guo9QH1l0FlwfLGY9imaDWVDQQFTmLSS174cryZ+V+afrxKcMUZChlJaUrI/TgL59si/2kjOTK8cJGsiCrltz54lv/owqWswdZ08tOslZ2rxwMq211LgliFkz/uilhLoXRBAPRB/dYFbZX6FBh3XXC87dXn+6gxpEcDATacbN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520629; c=relaxed/simple;
	bh=lCYKiAZgOlE3Va/sxmA5SWy13jwbJZIuOec6uhkyZDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r7H7HSR3NLU17WtDBlYs8RRsFthzdj2u2e3cGyKQLHywqEkgcBsvShBdR4b7GMkSgH0MDUco51yLEFnzs/pQI5/ZQ552SwPLwfUeG34IsjKy6qOCFAfB8gl4HCzHwo6iuGCdXXnGxywO4qW8jZlF74fBGoV9gplv3l542OpVI+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5kvMOk0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5kvMOk0"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so3455735ad.1
        for <ntfs@lists.linux.dev>; Tue, 15 Sep 2026 18:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520628; x=1790125428; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9iPUBr1vEs76jcJu2/McyeLNxlTtVcgj8O4lQVlwvOk=;
        b=a5kvMOk0wqgdb90DDJRdIbsOjMb4GRAtp3AVvHvrGeD5QsN9h/UhUPzyxM+J3xKUAl
         zYC1wIkBV79q669suKO/WkL1W+l+tqh3oEsy1jy/HTTANf0BxchmHZcJzwzA8Y02iquH
         NBM8RjX8irWiXVvZ+giIQdmMHwDJF497G+pyTHew+Ilrd2kZUZQOFslBQ8hMWOVStRfe
         fkD0H5Fi4AaotsfHwI8ohD2hrAcfMzVDNp7UysfXH8RV7QEEe8byZjOSAQjgxcBIi0Il
         bemRep72XSKTTX7a4R4IhXPbmIIxq2W+/4JtqZtQHQEcv4HjzTOPf4om2yvkMyfkfohf
         2kVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520628; x=1790125428;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iPUBr1vEs76jcJu2/McyeLNxlTtVcgj8O4lQVlwvOk=;
        b=QiQRONorxPYTiCjmaIOpZ8XkEPwQ5mWvnWjebk3KwpiwZ9HnnRXwpRKWtw5xdsHGYO
         qBM2uF6jR6aOjcsl5kTJEcs+Wjbzond8ZWo7vuAOkTlatB2cwR53jwuc16bCm5BZUA1/
         dMz+jjlpvLAZkBo5N6TqUNlKMEIZig51xKj6gbTAWX7UEpZsW6gnJZKx4ZzTXWP/PAA0
         Afl70jbzXX2bbFgg31pL9GtuKD/wdw8wKcQTSOaVGSRNIfx7Zzdyz5klmXPsxMcV9spx
         43HB5W3DPsnaMk33NaleSiS5ldYFLy6ZGX05omzIpFMzi9r9dGpyV04StEDIE2JdnTiY
         XDbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEyKU1hJNOL6dhMQETt/GvwCDD0GX5RyF1g63p4dQ9WpMtDhkGdgkfadtqFZM4eJNNqkxp@lists.linux.dev
X-Gm-Message-State: AFuF++lEWVU/38/IiUJ8OfdfkoXRL7dtV3KMZgy7KufVztKfMjBGHfjx
	qHiI6cD7sQoDMutQfn8ZRwOyRfnzmmIwwDcMrjgh3pJLupcaplgk9OskJ0nWkA==
X-Gm-Gg: AYBFou3/9/IwpfXJCbq9/9Jic+GeaJ52eER/YWGQ0W419h06MEnd0PEZ12Pz/1mPiGI
	mLcF8bx39dvXv8/7LCPUyFRZdp+S4E/S7ErPRgjtF5LNrOSNALV1PbvXp/M7ncj6beq4COdn3fg
	fKRepMrbTe2GtYfHijlLY94VZnEcBVLbSNsmQHvVqJdEYuvu9X7PJkht71/j6LiDYEcboasgR+o
	gZXCVS5zwx2yBS0RmyaKPLzSEZE/+ZOOVWVitzX7POSQHok0LFIOoEZrPKn1P+J7zPxMdDn++A8
	4aKboDjCfQRwkGg4EbH5RaBnIZZ6vhTtjnMHVaC1KKBnTeUaI9TzvzROKX23Kx5iy55JrRK6icN
	rVTlNDcfrZuZ+YMK+8qOYM0UrP/fCopSlFJkOonHD706Jiblz/n6KIayXaKrZwH+2fjdtGXW1TO
	m28Q12zAdRY9d71g0P6FIXYLOujJ4UlIq4q72RLd2FJkz1fQnKUJzjo+hVtlR+4K0QAoi7brcN2
	6GyoQ==
X-Received: by 2002:a17:902:c94a:b0:2d8:d4cc:be68 with SMTP id d9443c01a7336-2dd8e7b5ca2mr11806615ad.21.1789520627591;
        Tue, 15 Sep 2026 18:03:47 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm2880995ad.8.2026.09.15.18.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:03:46 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v4 01/10] ntfs: read MFT writeback bounds under size_lock
Date: Wed, 16 Sep 2026 10:03:13 +0900
Message-ID: <20260916-topic-4kn-lkml-v4-1-4f8a574ba3fb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
References: <20260916-topic-4kn-lkml-v4-0-4f8a574ba3fb@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=hyc.lee@gmail.com; h=from:subject:message-id; bh=lCYKiAZgOlE3Va/sxmA5SWy13jwbJZIuOec6uhkyZDM=; b=kA0DAAoBNPIw+veOSNMByyZiAGqp6rWiIUPTkuvXqbh3ydgoUTo/v0Yw8M5CGiVde4JtYc3sc YkCMwQAAQoAHRYhBNWFKcxTduNtbh5vYjTyMPr3jkjTBQJqqeq1AAoJEDTyMPr3jkjT2b4QAKKI hdPMhXyvclHxHXWL12nNiS9locpE47E9hx9at0s+GIebYnG9fefn5gm29KTS3091XolRHq7OntH CvLaqqdrBhiLGV6DWv7gkXQB8ydX7FHQn8Xy/5wU67w1z6AFhwGNdhXFKjWs3xyerNSipU2m/oO veaGtXFybipqIDf4FMwDD6rO2WPommDls8wyNg50l1aNSMjS9pwkvdGEyJvy4gU6suAf25zWzMc m3RZPrq2U3FAdSfxR5oFl7QD62YiCDVuBICSKXJWidQ8QL+TQ/nmZB6PxweHBHZRfE7/2CzV/9e sgSQTmeARFeLccjtTnAFsPMjAXp4nZudsOhocFmt+2nZ5malxQONK2mmjtjop9P+aHcViCzRcL8 nkraUXsOtATosBBO3eGBr7tPA3AqqtrDMyJePX5JFAHidMpgbflxB1cg9CxOxrTGxQeLj0iUfKy +Xk07B3d6DFy+wrjpGMBwQGXomt/rEuxz1+uNbB2Y80e4nIM4bnfET5Kzl3FsKXRwpSKW18F962 h9g7cbQdAgDmGx6IESRkaUcDFf0JB/9tdL/hwsq6o1pjkXAQ4ZHxNpG4tJWvc5gC9quhQ7/drCQ oJQCuIf0261fj+hIpH+ol/r6KHjZFKYAtcnZuFs45PdCSe4xadYdYULq2b5lpj2WpFVa5pUi7O9 ZNESD
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Read the MFT inode size and allocated size under the size_lock critical
section before deriving the folio writeback limits. This prevents
writeback from combining an old allocation boundary with a concurrently
updated file size while the MFT is extended.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/mft.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index a09496622c7a..19e042474df6 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2899,9 +2899,17 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	struct ntfs_inode *tni;
 	s64 lcn;
 	s64 vcn = ntfs_pidx_to_cluster(vol, folio->index);
-	s64 end_vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
+	s64 end_vcn;
 	unsigned int folio_sz;
-	loff_t i_size = i_size_read(vi);
+	loff_t i_size;
+	s64 allocated_size;
+	unsigned long flags;
+
+	read_lock_irqsave(&ni->size_lock, flags);
+	i_size = i_size_read(vi);
+	allocated_size = ni->allocated_size;
+	read_unlock_irqrestore(&ni->size_lock, flags);
+	end_vcn = ntfs_bytes_to_cluster(vol, allocated_size);
 
 	ntfs_debug("Entering for inode 0x%llx, attribute type 0x%x, folio index 0x%lx.",
 			ni->mft_no, ni->type, folio->index);

-- 
2.43.0

