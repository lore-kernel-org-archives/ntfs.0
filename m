Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC3141A54B
	for <ntfs@lists.linux.dev>; Fri, 24 Jul 2026 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908157; cv=none; b=LdULSjFuab7Jua4eSBTu/T4ZcC15W9a2daanb579sCTnWQTnP/iZ0LNkCkmZsBXiX4A1D2OITlnLghsYbN+/K+W5HS6sD7+nwNJpBYLvjugwUyEctpYT4nhrQLK/mbTo/8e7qxxELEm/yeMB7jRTNi/1FYa6Jw4z3Mry4I+ojuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908157; c=relaxed/simple;
	bh=1hOveROcB/csluE92qYYiERBH1rL/ddqqsTqkHRb1NY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WilvbO3MnRhDIlGJdUEkIG071+cWWzVOHwgjbFe4Vz5LY4XYoVj5ziAM5V+jeAlKBBRJCQnGxtZC0h6I2X9gpLpNIaGDR8TmfGmJkpR1N5Y1gs39EMAAnrF1H3B61UNq3ayY5Nh/6z8CxJ62XQRrgn8oCXzQ4BRNQwcTHlG37BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxady536; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxady536"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2031F000E9;
	Fri, 24 Jul 2026 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784908153;
	bh=8seR6Y2+vK6ekxGuLhhNYM5lDr9I2EmV0tmEEaIOoWw=;
	h=From:To:Cc:Subject:Date;
	b=fxady536WWdyGL/6LIscCSf6ercJTufw2aNHbUW2rZb5YO5YJ1ssCQje2ymIDmOdI
	 90XUp4tl+SXojQhtBGMLe1lriQaEu2xyhbOySXGJGc4XSEn9Qrs1ChXShe05bG5cKI
	 NMSZSx+9xE3rfQ0Wrfs6m5Tztk1XKuWXw7bANMEnBfHLabSyUkyKio8lslrk9x+xG7
	 cOCYLMTZmuaHhRcOYjabcXmkUmaeZM7slsWtWAp+7Jl4pD6UOhIPPyFVpDHwyGEjxt
	 nRrNi1Pm/ViYM6Bmoh9IMfTNs0VTBZVGTpE7YT830aQBqKATQrxQh3pYAK0LOMNLxM
	 rLPEHGDPj7/AQ==
From: Namjae Jeon <linkinjeon@kernel.org>
To: hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH 1/2] ntfs: apply Windows name checks only with windows_names
Date: Sat, 25 Jul 2026 00:48:59 +0900
Message-Id: <20260724154900.21524-1-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The windows_names mount option is documented to reject names containing
characters forbidden by Windows. However, ntfs_check_bad_windows_name()
unconditionally rejects those characters before checking the mount option.

Move the character validation after the option check so a default NTFS
mount accepts POSIX names such as names containing ':'. Mounts using
windows_names retain the existing Windows-compatible validation, including
reserved device names and trailing spaces or dots.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs/namei.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index cd403b1d99ee..aee7aabaf059 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -61,12 +61,12 @@ static int ntfs_check_bad_windows_name(struct ntfs_volume *vol,
 				       const __le16 *wc,
 				       unsigned int wc_len)
 {
-	if (ntfs_check_bad_char(wc, wc_len))
-		return -EINVAL;
-
 	if (!NVolCheckWindowsNames(vol))
 		return 0;
 
+	if (ntfs_check_bad_char(wc, wc_len))
+		return -EINVAL;
+
 	/* Check for trailing space or dot. */
 	if (wc_len > 0 &&
 	    (wc[wc_len - 1] == cpu_to_le16(' ') ||
-- 
2.25.1

