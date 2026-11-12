Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469286;
	b=Ai5lUp+LrFtU5UmLTD+n3jf+ZKtwYMvVEcHdkroURol9z7VDEAzIlPZ06+bzACHEFdDM
	 +Ay7sBNn8RveWQhz7juAs1hWaPciytUd5lyZDShqa/1glN/WcY/YLXHppzrYck1HS+MBG
	 a2HkFXkubqILEaPXPofftLzeYVJGPuC5+olvTItxqCNtRyV4RFDN249uCZ1X6MeP9bDP4
	 qJ34lUdEnFGq1CC62g/3Av7Ia1fueEmBuOSRB/ku9qgYwkRqXS5hRtDx0j09P2y3wKJdM
	 QgxUYv+/AEteD0ljP740gctnNTPGEgeT+DjUZ8B/DPtywbK0oXSbpUyQrOF3P0PlkIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bj8oIOvi/lnWkTPHPdsw8/wbnTz5MyWHkyXyWXbRMxc=;
	b=WGYbweDwmbmSf6ZY4OKvu/wugOG8Pv3t0wtPg4m9FIxBAUmFHJ4PKFEAfDD29beN7/Dw
	 NvA7Jw3kQeCwlWL/97hePRFegJGZzIr8Dc1pngR4y8VqFOeVH6yyCVPKdLX7zARfnKD1/
	 LPjQPwrQeS5MLe9F/XNs4Qre7HiglSiAyDgp+finbN8JYyX1rTMHR55tHr/cMaSrmqcDl
	 w5ccl0GueNk+lCSbrmkmGDnDz9SfyAsXWLmbiD2vokqaqXaKCMHc7wZKJxO6hzfgaRSRn
	 Yv8ZD6OgUSkI5P5o/rF4AxY9wJJsWmO4MLeuM4MX1qnNVDFIlIBb70LAkc97CmK+78Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1NBKORg;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886F8606A32A
	for <ntfs@lists.linux.dev>; Thu, 12 Nov 2026 07:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886F8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1NBKORg
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3341885eec.0
        for <ntfs@lists.linux.dev>; Wed, 11 Nov 2026 23:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794469286; x=1795074086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bj8oIOvi/lnWkTPHPdsw8/wbnTz5MyWHkyXyWXbRMxc=;
        b=S1NBKORgIeJp+sOZCYN4dC6/6SdqsQIooPwH0smI5LyMrEsVmf/7DEtcG94j/mxLS3
         G40e7xhOVt5hi8b4h2qsnxOZ0LdiX9+gwzXc8w79PU/z//Gp63uea4FKW23MaoM3NL74
         YM//P1kJ12S6KjBr9vitsrp3xuQ5ELFK7aapoiN+JZB6ekUZYs+gogp8ry1KjKhqcfES
         afLmbCb7k7k7He+JYzVro8+BprdqjpNUrLFoSh3fNhl2Ed0HKjlaJDOCjrVOnPX+pWhK
         LmZ9LhJB8jEFnUCv0w+SrXWDldmJXwGZKSzbsKhjJ4aNVPzSPcs4CMZwuAsX7zE7/Wp9
         XNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469286; x=1795074086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bj8oIOvi/lnWkTPHPdsw8/wbnTz5MyWHkyXyWXbRMxc=;
        b=t5bO84rWcVrcc9mAMKGbci0KNAXjq1MNv+IRwi9Uc+WGqtozcRNfyO69k1tTtV9JHD
         msIMPAO6tuuWkku7AQDwtJdvT+VujYEW2TfP5+eMJAc3EH8yJzgnzqYL/saI8t4tb1lp
         V6aHZZ0yg87KVu9R1oEGwWWL9bRxxE+BzophjjAskybzjcx4v3icIBziRrGZ/3vO2NwU
         oMMLRhoP+mfe3PHBC+gBzOT5pj3FhvMY2FzyeypUfbjTyMeT4gWHDaaQmvRlW/rBbc2x
         5kdUiQJtdD0cfmWfeS1bCOKEIDoWgNvw02BhR8E4QaVBMwWemJk700zRrLvRpF1g0cSz
         1eZw==
X-Forwarded-Encrypted: i=1; AL+hErEeYCdFxAoGZ1Om4w6sJEYjw7kH1wmUNr44Xx+1xb0FSmt6F6ikX7aKLpAW/9tImzt0TQZh@lists.linux.dev
X-Gm-Message-State: APuU4Z+kwHFPbaPG4Wc7Wa9+NEzeHoUJNzBsb/ePF2nRxULTjgij2tZU
	e//964Ub9QAuiF7UQ3oVdKzbxShtrY3Z9g6eRzkblgbuWJFohumdZ3OI
X-Gm-Gg: AYBFou0zga64yKp+eqhEfdNCBFamKZdro+NDw/g/fAyixpnLm2QdkjEyb2K2k/hUAfE
	uxKFkWnZuDYmURjoSNzviIMdZ90MmnJtKWI7z9i1olNDth9ibkyIQTXhWoVB87KdY34k8z08vI7
	PU8fuT3AuMuM5c7Z89WAznraZRo+gkmXSS1W68/eF/tmjYuFNNd7sTs5fF5qwgjLxzamMu9ZSkd
	KtF9wd0J2v/0zrmtiWTP2pXDg1pUTSOgEkU8hzg9Iwt+hCP6D9bN7agJWATNm9Kq3S9o+j+lvRK
	1UoKFRtqcMH6o7fh8KYPCgFWNfUXMtHHcXvBu12pSveuNoijNCcU8q1APXj4mM476BA0fbAp1cO
	eGQ4E5A2IANFE9/VDBqwcBALFF5yZeZ4Rl7BdiCe9uLUmd0dml4ldos87gOtJV3QIXpmOy3vCds
	uVIo5xU2ikx6w3UII0mx9Skdh6sjvhvLFEMpROWS6MNRCa2GvchSIdWh3hN5rsXNJAxweKwQppZ
	QI/f8gtgiJrwFDJo6hlSeIk0nORvXxjqd5fT0xo+G9SB83TJBkGhQfqRNIbkE7wH4E2uPwJvmb7
	alsZz14fNcsmLH7UUnWcQmKOs9zmYbZ5VuXhE1hLEqSotb3T/XNZMVdJ8KD2N/wXxg==
X-Received: by 2002:a05:693c:2582:b0:378:314:4042 with SMTP id 5a478bee46e88-37803144bbdmr1486709eec.14.1794469285344;
        Wed, 11 Nov 2026 23:41:25 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm25594848eec.25.2026.11.11.23.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:41:24 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: linkinjeon@kernel.org
Cc: hyc.lee@gmail.com,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] ntfs: convert a named $DATA stream safely when making room in a record
Date: Thu, 12 Nov 2026 13:10:55 +0530
Message-ID: <20261112074055.1876311-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-n+zGBq4i7rfLyX+_Y6zEMLTCCqb2vAgcnmavqKxtiHA@mail.gmail.com>
References: <CAKYAXd-n+zGBq4i7rfLyX+_Y6zEMLTCCqb2vAgcnmavqKxtiHA@mail.gmail.com>
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

-EAGAIN must not leave ntfs_resident_attr_resize(). The callers return
it as is, so a normal blocking write() or setxattr() would get EAGAIN
for a "would block" that never was, and index.c already uses -EAGAIN
internally as its "redo the insert" code (ntfs_ib_insert() ->
resplit), so a stray one from ntfs_attr_truncate() could be taken for
that.

-ENOSPC is what this function already returns when the attribute does
not fit and cannot be made non-resident, so callers already pass it up
as a normal error.
It is not exactly true here, it is a short lived "busy" and not a full
record, but there is no way to wait for folio 0 at that point without
the deadlock (the reader holds it and waits for mrec_lock), and no
errno fits better. I can use -EBUSY or add a comment saying so if you
prefer.

Thanks,
Wahid
