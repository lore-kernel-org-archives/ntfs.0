Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB861374192
	for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124357; cv=none; b=IbSvc6FGJHIeqkAuOJOTQaPa0cYjQGxHA1UEVeJP/03jIrdHt2NKoJjIjEyEm59RbGWycWGt6yd6J/eYLCtLyCKKG42X6eYYb5nmlkdzDCnrmQpncGuQE/LS4+lzJ9251FM6k+QHZ0YFkFNlui9dlr5lVVOOecqHJtlBeJpr11U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124357; c=relaxed/simple;
	bh=1SKvNuodvM4OwhBJC4Z48L6XzJ6g65MSRP432dByJY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UwKivyFmufFqoJY/BP4ge9rxGhJiPYTGp+7AUtjls2UbdkuhPVgaFNH4j6OjGQ/E1XFLgtSpbieaVUkS+CNehOkW2YaGu9ZnBXzal3KCXLts8Bv+5vi1WS3bDuqRumkiY7QATP8yB+GrU2GZE7Cx9N6KwzKTEVpK/LysUNTX+Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLe+Jq91; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLe+Jq91"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf452def93so16334845ad.1
        for <ntfs@lists.linux.dev>; Wed, 19 Aug 2026 00:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787124354; x=1787729154; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Mm+hNQIKG/+cPvkkWvrNkKfzoHrRz74IsCNnWp5RgY=;
        b=VLe+Jq91b1LjNyg8YV/WkrgU9enjh1KPiYZnzdEnoARmalPyG03B3GywWVtcRDSxWM
         tK/QiTP4Tr9+4Iz+TK7xhs71aJ9c0IJlVa5zUpVYPZuEjWaSqG2IPhpmgp9fE/ed7kH7
         9Eu2KbdEjN/aEsAdyXbMK2M0Hv2QqzHkud1W/TdQ9XuV1Ck8u6tRZD8ECteJCA5Nzi1n
         2pxLhbPR/oRff/gNqgwsJb6Nem/NFl7ODL6Kb8dYOeukkLGUpv2niDBFq0eecvtebV/h
         Ef5jovIHdBZsV+hKa79sFzYCepH5rKVTTrxGg0oBYkGIzYwkZGz2SLp/9Rkd5d5xAjXy
         6STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787124354; x=1787729154;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Mm+hNQIKG/+cPvkkWvrNkKfzoHrRz74IsCNnWp5RgY=;
        b=SQUss8LobplqUyB3NLnbba2170vLBSB3pP3nlOOSBhpfb/MdXS1IKXxETlg5xTIH3t
         A0BeOnhspq70lZO7BgiqsxbD0tWt5cEfzQsCLxlhNUd0YXf02ZIEF5QYlV4REKoQvuHe
         B2nrWEHbeRel7hftuMrVDAMLrmlysXNQ0aakQ2RBzK2e/NjA6ipNNILuaoiSIesb7M+o
         6jFvx0dKphiKD6lNrgCZjTjt7TEQQB+rKbXbBAsI6drCVeQFC9zi+FGI1z9cRuVZ3MQ0
         BKFIYdCUpIZuADkLtEhwrynfTdBkR1fNy+NkOuimIk409QD0tgP9EMz+qBc1jmFtJBKm
         TYZw==
X-Forwarded-Encrypted: i=1; AHgh+RpTTExgJ+CZ9r8qgbKW0UJUxPuGAkIqeAwQjJSf/W4tvIhzJa2rFT6aOqieqBClikCEtkLu@lists.linux.dev
X-Gm-Message-State: AOJu0YwvnF9LGhHX3KKNrjOMQ1TbjTchh/Nplc6YSe/xxVe0xjG1gtxB
	mFl2X3l4C9IXvnS9RHhKKOfiNjht6GFQIBqFt/6v0BKe9Hn17ODmziqr
X-Gm-Gg: AR+sD13T8ZK7jKDSK53MlyTZcGxKABNDJr0OI7dJiqpb0w6ItREkN54RWlkJwC+Qjs/
	C6jE+hfSfmz1VCO+wxSxwY2layYIqGDXcNI2e33TkOHyoanOIjzbUNCLqbCR+QtREdA2uh1veLN
	e4rxT7vs5gVOELA3rU3KOpoQE1ngrflaEEme+FR8srSnVceHFtLNFp6B/7Cn2JYRtaV4g9QKe4r
	lh1ooIJ1ZqpzP/qc1QPOeYPlut0ND16LQUGzSkvUh3G5Kk4MmNncRusossh5Uu5mGD8LaRDnMhn
	vqFTAHMhp1cyLT9KYuFW0lI1tvm8hzIEXCdyTNQUuoSKwFZrnnVdd48PDtV/4R04rlfAFbMB09S
	HXdW8zPQDeqv32j5UlFHdawZ4N7TwBj5GX6ITKxgONb5JuCEWoXP3XXywHJ62OgNmFmHpeyUufw
	uQe5AJdLwzgyyKd4LJ4QTCwVFX4eEPKxjk0p0BeFdW5z8xFf+tZ9NccjZuP9gHrRsxej4LNiMvH
	ntTjw==
X-Received: by 2002:a17:902:da92:b0:2cf:b9f9:18bb with SMTP id d9443c01a7336-2d5fc8fa30cmr34329735ad.4.1787124353840;
        Wed, 19 Aug 2026 00:25:53 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb519531sm24347575ad.30.2026.08.19.00.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:25:53 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	Robert Morris <rtm@csail.mit.edu>,
	stable@vger.kernel.org
Subject: [PATCH] ntfs: reject invalid empty mapping pairs
Date: Wed, 19 Aug 2026 16:25:34 +0900
Message-ID: <20260819-fix-empty-mp-v1-1-fb60b2eeca51@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2417; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=1SKvNuodvM4OwhBJC4Z48L6XzJ6g65MSRP432dByJY4=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqhVpE8b8Ph78bUuUwJSYZ4K3GsmASzykzzSYnp
 U5eJ3+UOneJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCaoVaRAAKCRA08jD6945I
 03F0D/9goMM/ibv2hPXpkM/r1IjoJXqESVButGhXi2x01EGzuvo0LqCE9x8TSZWbH8jq0Mr7qxR
 knZuwMoZl6xPAS3A0SPqB7b1Av1i7dJqEbT8ZexV+IgWy1LGFCnKu+LhC6j1shFP3ZE2MJplC+j
 ajDvXYZWMe2r01MLXGyxPmM9yAbaAKQ+omTQdSTk7FXgT01kAm7bjho9U5PGSl2QbaT7EJ7jENp
 kmcNC9sqgvAfwLyx+QnRkb9waw9ZWNKtTo2jF7xwFeAgH0mzBeRQniUiGttYG197Mgb+lK7JVM7
 b4JBOaEWPNSqvnAJdokTTty7S3XSGvluQzC1jho+XObcehITp8ejZ2TML3F5e28cGThOIZo6JWU
 pLZRzwMyF7vJuGoX8lWTr7Z5vOXqEkKv6Shhv50bxDPU/KTQI8vqRshxv2j0oh56Ez3myEu4JG/
 rF0889RCSc+5WiPbdhPPu5OajZsjw6hja7E9g2bxRaA62XDTNAJwPKIK93DEIJjVmnqFb4a+nHO
 skbgopUe9tt1OFLhwZMEAeVzGGmqazdyQg+yGP5syDT6aY8qvMXwJn8soTyM8ouMQvmrTxivxEx
 9k3hijZduhHFym0hV237a9bDDAqN5mcUIaDjIsZ7HdyBilqO5LKVbm4+63YOW8hdzYWJaq9O0CL JAUbuMZBFa9RS0g==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

Reject an attribute with empty mapping pairs if it has inconsistent
highest VCN and size.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Reported-by: Robert Morris <rtm@csail.mit.edu>
Closes: https://lore.kernel.org/all/9519.1786907182@localhost/
Cc: stable@vger.kernel.org
Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/runlist.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/runlist.c b/fs/ntfs/runlist.c
index 9eaadbc0ef47..c775b7df074f 100644
--- a/fs/ntfs/runlist.c
+++ b/fs/ntfs/runlist.c
@@ -763,6 +763,7 @@ struct runlist_element *ntfs_mapping_pairs_decompress(const struct ntfs_volume *
 	/* Start at vcn = lowest_vcn and lcn 0. */
 	vcn = lowest_vcn;
 	lcn = 0;
+	deltaxcn = le64_to_cpu(attr->data.non_resident.highest_vcn);
 	/* Get start of the mapping pairs array. */
 	buf = (u8 *)attr +
 		le16_to_cpu(attr->data.non_resident.mapping_pairs_offset);
@@ -772,6 +773,23 @@ struct runlist_element *ntfs_mapping_pairs_decompress(const struct ntfs_volume *
 		return ERR_PTR(-EIO);
 	}
 
+	/*
+	 * An empty mapping-pairs array is valid only for a zero-length
+	 * attribute.
+	 */
+	if (!vcn && !*buf &&
+	    (deltaxcn != -1 ||
+	     le64_to_cpu(attr->data.non_resident.allocated_size) ||
+	     le64_to_cpu(attr->data.non_resident.data_size) ||
+	     le64_to_cpu(attr->data.non_resident.initialized_size))) {
+		ntfs_error(vol->sb, "Invalid empty mapping pairs array.");
+		return ERR_PTR(-EIO);
+	}
+	if (!vcn && !*buf && old_runlist && old_runlist->rl) {
+		*new_rl_count = old_runlist->count;
+		return old_runlist->rl;
+	}
+
 	/* Current position in runlist array. */
 	rlpos = 0;
 	/* Allocate first page and set current runlist size to one page. */
@@ -942,7 +960,6 @@ struct runlist_element *ntfs_mapping_pairs_decompress(const struct ntfs_volume *
 	 * If there is a highest_vcn specified, it must be equal to the final
 	 * vcn in the runlist - 1, or something has gone badly wrong.
 	 */
-	deltaxcn = le64_to_cpu(attr->data.non_resident.highest_vcn);
 	if (unlikely(deltaxcn && vcn - 1 != deltaxcn)) {
 mpa_err:
 		ntfs_error(vol->sb, "Corrupt mapping pairs array in non-resident attribute.");

---
base-commit: df7dce2090342170b7643d36f694204cae7792a9
change-id: 20260819-fix-empty-mp-3f32eb769112

Best regards,
-- 
Thanks,
Hyunchul

