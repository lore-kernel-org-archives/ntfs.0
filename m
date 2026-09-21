Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7334C24B28
	for <ntfs@lists.linux.dev>; Mon, 21 Sep 2026 00:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950039; cv=none; b=XZcpvHeyIU1c4hcB3IxYSMeRe6HXa8Er6GpLGoke996/4MBEpli2PLuD0aRFH5dFAqAbT1vWtlsIDkCkqoViu0FXNWo7C8vxZJEkWh8H9WFLYtQ3TKReVgtYfAOdH1CGqBqbZUCXyUlKVcGct73kauUuDBS7ce/dhfCaStD5EyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950039; c=relaxed/simple;
	bh=Y8aqOvxwysux/OqY+n9Oq5AbefWnqKe5itlF4eAnDrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FDSR3LD00jQ/tO/KmhIy3eZ6SWyNfMmvm5QHDsM/XsibhfNQGHEFfs3wOB+8+ArP4el/f/VfwkL6xNPJhMfBm3nWuPTAhgJDaR9hAoEZA0y/8EmBO6v5t/ykfKg/vGTa07qI8DtbVWiiGqr4ZtkZUd6v0vdfa+YB3BDtUWerMdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4QoOHj5; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4QoOHj5"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87ac7657a24so16997b3a.3
        for <ntfs@lists.linux.dev>; Sun, 20 Sep 2026 17:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950038; x=1790554838; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4Owxq5xFlksuYFwwNYWHIP/gBOk1flMgdq5mmTd6bc=;
        b=W4QoOHj5eEwQmOkW/M8ZUMWZYZO/V5qXh534CmJ5Qw5LA9IVT6Tc8Nsh3CD0MOo7v/
         TBpqkwh643XSQBPikCfWc0xH5jL3CnkQhJh88LEKJ/0+hioBOyVYeR6xBlsfQybGkdA4
         QrF+WyJyeJZpBKW86qh+ZaGg9A9hQpQ9JR4zuV0vlXsrNjvPhMnM9AslvP1/P8qhpk1U
         SK58/53IIVKXlqLM64FRZVAZc2GKF4g06Ds/aVHksS35mAru4dJm4nsqDcVjTKPbAr83
         +sVvvG66QhAoCfMNvh5zyvVdurtBSvJ8elkNw8RJEIyuagyuc8WI+GZKYibqpYqULn5P
         gA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950038; x=1790554838;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4Owxq5xFlksuYFwwNYWHIP/gBOk1flMgdq5mmTd6bc=;
        b=MhTKJzvJOIY+a0HjFlpSA7Je7h+sb1KguHcirhyjZVMbfa/GCvDD9ubsZmpmxv1xKd
         PHw2lCprOcHZXcmOWuLuh1tK9gVTQRKpZxUfn1fxyqwiWZwtVdtF6htczeAKP1+pbUS4
         FcUbATUAoPjpWsf3+jQoxXJqmyDo7tdNo+Re6yrSon5+ykGjDxpz0+XwvaWH2RZX2UqR
         BAQd36JkMkndgQU/ogJrEgoQxfmbwLAvwdqdWzCJjIxkd54Knk1c1yLHrZZ+k9sN2z9h
         JFoASVjFo9jAT1GeazA7fUCX89rv8Av/Mp9EFqYWfrl7Q4l4i++XePBeeKFlq06WaIGR
         H6bA==
X-Forwarded-Encrypted: i=1; AKwUvBxyFLrpV0qD3cMuK91rDDcxBS6x1IDd2yOR+Sqe8eUg7yP1LiT3bm4YWvRykw86a37HJt+C@lists.linux.dev
X-Gm-Message-State: AFuF++mjMzVqlOMQp3QwWPAGv5YkM1Oe/b5zvv5ZEwZueNsoAovAIgEO
	/mTgKOMIAusAh0IyAeVDdtPjer60RZ7d8ghDkKB1KkMQeI5hRewt4NSb
X-Gm-Gg: AYBFou2MXGuyeBLlSkwgjsDPWpAkvTeRs4z/8duvfn5xjPtwKzbWbbJm5MCkAUEIryd
	kgK20kUkPlsYT545uf15J/yZsx5FHoQdZx/qbKMEgaKYa4+tFTRaN3BTAy908fseY73NuXeuwV4
	VbKHISwUqsnmS/CvntKkWdDZ/g4tmtXUQ5qQmzrTeaY77IX4TMnaSetoy6vC3VOgz5sIaqIcVhc
	CAXL8qjNtkmDhLpsWTId66ff0SyXRFiHywvJy29jrUfVrYfWCKXLnZBLHt87O20h/RI780MvZgX
	S+6WvvSafQ4a63KFV7oGQp8Zr0H+DdfnVtT1+URTg23zlr6STeund2fBrOW8BTSz3+QrmdyGIeX
	7jWRmCwcSpvYqvZZ3j/3379emxQSYqRGd/XJPhREDVnbkxZlJ06s+ua81zdHIhWDmsX9UKDn+CU
	2q5SVeiyqZbU+AtMClWfyp2H8dYouC8XJa5cQ2Jqinjs4+9Moqk+EuMdXJ/nmFQAQY1PDpQSjHt
	7PH3A==
X-Received: by 2002:a05:6a00:b4c:b0:874:706d:9631 with SMTP id d2e1a72fcca58-874de60c4a8mr13138951b3a.35.1789950037672;
        Sun, 20 Sep 2026 17:20:37 -0700 (PDT)
Received: from hyunchul-PC02.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2289557b3a.21.2026.09.20.17.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:20:36 -0700 (PDT)
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev
Subject: [PATCH v5 10/10] ntfs: wait for attribute folio writeback before update
Date: Mon, 21 Sep 2026 09:19:49 +0900
Message-ID: <20260921-topic-4kn-lkml-v5-10-938afe402cd0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
References: <20260921-topic-4kn-lkml-v5-0-938afe402cd0@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=hyc.lee@gmail.com;
 h=from:subject:message-id; bh=Y8aqOvxwysux/OqY+n9Oq5AbefWnqKe5itlF4eAnDrY=;
 b=owEBbQKS/ZANAwAKATTyMPr3jkjTAcsmYgBqsHf1eyVmoco6emsLxH0YvewnY4psQnSfIAR3r
 KQ59Hm4GLSJAjMEAAEKAB0WIQTVhSnMU3bjbW4eb2I08jD6945I0wUCarB39QAKCRA08jD6945I
 0+ZtEACAFviYP6RwfeO6cOSPytNS1wjQmdc2txVD43vRpl67nJMDOY7mcbZVvmrhyC4CxBlYOc+
 1ebv3Yd6YWSl/L7EsWOyBBFiUHfNJ0RjQEGBtW+Xt5Q+sur5L4LSJ47iuZDYL6+d3f7KIvP1fnu
 d67eZTbH4z90fnc1T1Eq5BejoZdswYeOdsvVE9Q7Fvv00Gwqv2bwaRYN7YqEDrMVcBnRjSAu50q
 38bu9PCHUCiE7ZUnUFNhJFQnYuf3L3DtZXqD47Ec/Rlh7jUCSD3WITsNRhUV4bq4RusAqrceQZF
 rVrIoIQE406sHjT5Vt2gVmZLF+nfzyzxLwXdgK0TRH4mucpwEgMaMVKAr/4a22VSBDx+tkPjFYq
 kAL+8IFsmyGll/FP4SbQR0ywPkQMBS0hBUQ0HJaTWIwgQtnAsZX5MREUwaTaWK0kECzlVSNcHtW
 Zath9yS05vk75ns47mSJ2EH1Mc0xphG0c6a/VOSAvMdN1QyyLelsvRs5Rs0QZQsLSK02hQ6yQqK
 t/T+Itz1w4blKdhWZNKfMKDWUky5qOnS1AI0DAhJXvu0eRpb57RLj8Zcbj1VBImSeCUTALuOPSf
 Gmg90gDrNWWvRk1VACe12uJ+9U1hyjD9oeRjzsNtiz0MAtHfnnYOqFuvSUbQOiEFAYyPP3Kl+3R Zezk/zl5HrkiD1g==
X-Developer-Key: i=hyc.lee@gmail.com; a=openpgp; fpr=D58529CC5376E36D6E1E6F6234F230FAF78E48D3
Content-Transfer-Encoding: 8bit

ntfs_inode_attr_pwrite() locks an attribute folio before copying a new
attribute image into it, but taking the folio lock does not wait for an
already-running writeback BIO to complete. The writeback path can unlock
the folio while PG_writeback remains set and the BIO still references the
folio memory.

Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 4375ad477809..d5e526d3612a 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3740,6 +3740,8 @@ static s64 __ntfs_inode_non_resident_attr_pwrite(struct inode *vi,
 			folio_lock(folio);
 		}
 
+		folio_wait_writeback(folio);
+
 		if (count == PAGE_SIZE) {
 			offset = 0;
 			attr_len = count;

-- 
2.43.0

