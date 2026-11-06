Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971880;
	b=2NJtnXbp4LIg2/V81uWpUAEhGZoKgkpZLdO3Wq8i30tBobKBZ/tBIK8hs4ql/0h08DAj
	 dJefPFiyemLT1v4gONgr3RtMR68AHYd60FZu7c9iXNvHxD5SNPWCj+KIb7x9yaBp1/YEq
	 Aql6fghgBXkPXzpmGGCffQ8+GPeA7LXANst2XVAjwbWuNWHSqcmVklOX8czkFknwAFSaO
	 5YBx5kFfBmRvSvByz4eHIAt+exnlpb+vec4Ex/wJA2gAJ+p6wBcDiIU707E03FHGQ+Kla
	 R8g8tk1A1x/dMpBiGVuZJHOZz9EC50S55lLH1zUDF+sG/9xz2r/z7itoLzWL5j4hZfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G6DwXFsKVtS0DwVfDaHzAgdX+wZZI3a8OJ1eN4exF+E=;
	b=NkG1JovJfmHpIsD9UFcLwnzUihHVj//yUVxYvj0/+EHJvGXGEEdszMAH8/mki8X9tJFP
	 N3Hscri7nIRJiQ0XSUOBjFf7v7B7PVybfnsSqlqk/HsiiUzHh9obCD/GErPpqZfNXS4Cl
	 eXKo97rW+1+xXShSD2RVteNQoLBle4DkBOxmd0Yhtv4ANNd+ivvycsFTdb8EpgN4SrMEs
	 UCRaC+8Sm1CYefaqxuQWv+DokCJ9sW7dS97cQUaRTPusmxz/vG4Owq3Wr/JqxUGWHCe5T
	 b4YacC4rViJkqOVU0iI5XGMCj7ZR2E72moQgIdZPwF8pzUcEz+VmWHvXlox+7Ydwgqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AxB+LqFl;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A1F606A329
	for <ntfs@lists.linux.dev>; Fri,  6 Nov 2026 13:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A1F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AxB+LqFl
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so1181865eec.1
        for <ntfs@lists.linux.dev>; Fri, 06 Nov 2026 05:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971879; x=1794576679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6DwXFsKVtS0DwVfDaHzAgdX+wZZI3a8OJ1eN4exF+E=;
        b=AxB+LqFljdPE8NRNCoqZqfY9WwDKOVHx7OuwE0kB/6JMjhh20LI5DooddVO3VA0YgW
         F8LS1Lgob1GvReUe5vDfFNAn7wnzfKT5og9oQ37nyOfmFgYCo1y5OhFTo0tB1OdhBz5g
         CtRIFe4hPH2xqhp7y1QLt6e5YAWHww1ogvscSS0ok5wMisG019wr2zphgxh9U0jjaH1r
         FRoLGKdYGY2FbEpQOJXM953TRQjMGyWVALM+cf2NIiIh+ViiVCX7VMJ3vGcdfQQkaOPx
         9xbW88owTDHLoEGaZeQ5S+U2gCTNdrCoHpv2ZsLc+COL0zrU5M0Pif3NI5DIDw8oRrWP
         MEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971879; x=1794576679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6DwXFsKVtS0DwVfDaHzAgdX+wZZI3a8OJ1eN4exF+E=;
        b=udQR0BeROXJ7ZMpOJPCfWxRjkfH7+JHjic60PaMrjgXaEyx1/bvPmU0gLOgyy9CXZ1
         ozeISEXwpKenIsYPIT+zrNab8vsjBDgaZT6IWM7KxPqBJa+7DLy5/RHRjAY6R5eLL4KC
         rhZo2WRKfqmg6goLfpkoFHLiiR/crz1cjeXjzPebf5VqZYlUtBsMgRcMl5walSYa66DN
         GLF11zQn6R0z4IYwFKLZtAvBYjI5y+TG3kpjkQabm9ZITX9loZ7/9ITmuG+dak2uPy+A
         t71nZdpfJxidkdrMG07w5G4vdFeSQomLw9PX12Att9C/zBLfcnYqQJ1Y8CZZSFBFTsvk
         47fQ==
X-Forwarded-Encrypted: i=1; AL+hErHhKmhxBz45iKV8W5Xzd8AcgMYBwq0LQ2yPoQvY7aflrcEZczCPV1gpsLg9T0Pk0Gg+vHsC@lists.linux.dev
X-Gm-Message-State: APuU4Z/e2aqaJlv9YL7y1I4V+FqKc3EdOpkYTW7qgy9Wb9+oYKSj+Pve
	XYcbkUsv4OaSE3SdFo0coH/ldgddDYgnj9Jl6Banhm2imcNMzVZg5TpT
X-Gm-Gg: AYBFou3usgS1ceQehVCaXrTgu5edL4/mrlxGJ82IRxiiKJ9PlmmSqmbToUtrPw+hlz3
	zWtvnubg2GizXirpeHyR1VGNq1j1sTCI7xq3BcmFgpGt4pWf3jCHaUoQlLFy72eDDeUU+70iv//
	AL1fYC7dT+QtJznd3k5VH3QE1xO7a7QfplpcZZoL2UEBV9Fvw+getcSmuVnBdEqof/MQMvWi7DN
	9MQ5DrIJtSYaSh6LUp+WghOlEEQP+Cl6fEtnoW60hMHRwHtgJdL+HsEK7X5IcbKny1akHi4/RMm
	N/6ksM/HOjknCggL/cnnGI9LfPfK8p7UPQTNYsI9EE128yf8OhvDqOMdkx34V+r5vf3owRiEdVO
	vh/dBRSc1FVBujfL4VPCo0RKk9Zxudy8dNAhfkN5eGEDRfkKdWSsZMMMe+H0VftSPgrgfbMX32V
	Y9lJP1ZyWsOtxmBhXhlfLkLUfgAAZ6fiXv6iyoYw+xIIGxuuUuT7/P+vlKnhU2KSGncJLitPtG4
	zD51UmXrrBQP/ORsKFciGAdT5supkl3wAfRPgWI3Af/0O8BroZTpZQ59EpyEerPxJGa8WGO7TTa
	+Bc7fOYAN95/362d5K3lLzNTVlUkrGnjJk2L+5Ogu8TcnZexf8sk0lnCrAepIgvL8S3RnehQEv9
	tJmFgjxoykYY=
X-Received: by 2002:a05:7301:4701:b0:369:f0de:259f with SMTP id 5a478bee46e88-36f76c170e7mr2928285eec.35.1793971879318;
        Fri, 06 Nov 2026 05:31:19 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm15269305eec.3.2026.11.06.05.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:31:18 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ntfs: do not convert a named $DATA stream when making room in a record
Date: Fri,  6 Nov 2026 19:01:10 +0530
Message-ID: <20261106133110.2659482-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106124553.2617026-4-wahidzk0091@gmail.com>
References: <20261106124553.2617026-4-wahidzk0091@gmail.com>
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

Hi Namjae,

The Sashiko review of 3/3 also suggests skipping every AT_DATA
attribute in this loop, not only the named ones. I'd keep the unnamed
case as it is, for three reasons:

- Converting the unnamed $DATA from this loop is what the loop already
  did before the patch. The patch only stops it from pairing the length
  of a named stream with the unnamed inode.

- The lock order the review points at (mrec_lock held while
  ntfs_attr_make_non_resident() locks folio 0) is the same one used by
  the direct conversion near the top of ntfs_resident_attr_resize(),
  before the loop. So it is not specific to the loop.

- When an EA or a stream grows in a full record, converting the unnamed
  $DATA is what frees the space. Skipping all of $DATA would turn those
  writes into failures.

If you'd rather drop the unnamed case from the loop too, I can send
that as a separate patch so the two changes can be judged on their own.

Thanks,
Wahid
