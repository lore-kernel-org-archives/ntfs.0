Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225386;
	b=HaU+G70V0KFRAdo5ZDDP8n3tSvJj4fF20HnN+btofFjym7NsoLcWBLN3qMQguDlILNxB
	 A1l5kHf0O53Wfw9jnlihfoS5Uxq6/wzQdifGYQSN19SMVXrfQFv9pLlMSSxcO6MOPJqTD
	 kmyP5o8oFtmM6S2PTyU+9dtGrdDeODUO1YLF4I1nXBHqQtQ6TN8cQH31jUwI7GGUJdHMA
	 byOlbxyToaGGQKQ8Nl8chAJCEt5VFC5sD8wgszyBPIXSZ63snCtZ+F40TMxIudKkdIehc
	 ZsjhiFDHyCX8GDONGGs0idXMHaZo012IAB46dPl0ZZ4pkQ82bEBKjXzdCd8ORyJznFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225386;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=j5xHrk121VJ6jsiOiBImMpaem11Ex15L22vqkzMRx+Y=;
	b=ptxVCj/o1pWVF4orCneIkV63R+AvAhEmSR0lQ673nbf+2w8XxkkmPYMqy8jvjKR5p86L
	 6W/CX0WtcotF+WJOk6eA/QI6KbTOAs6WyZIT9e6+QnqGXoScTqdwdGSPEDekj9p/4RxLa
	 b9u3IORlAnL7EeqmhP41TIz/Jq+LZvA5A5ojMCUBvF1ougvpF6UgxCWI018PvsbjKjYlQ
	 ThUhRk49VPBKea+XRSxN1mfcD90g+iuIMPPy5zxq11pbitqCoBE1XC+1FM1wfItaA0Fqb
	 090CxAvKxR26fNZvUU95qbppiSNtWQoE/FUhorxlzVksZBfR9EiNyiipUqtKc1nbalQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PNja0RrK;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CD8606A321
	for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 22:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6CD8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PNja0RrK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793225384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5xHrk121VJ6jsiOiBImMpaem11Ex15L22vqkzMRx+Y=;
	b=PNja0RrK+GAXFseGHRAPgDcQljq0pWRU5IrNz2yhBUldeqB5xObADIbjyjHyNHrutF7Pt+
	rJoNk3kv9NPLEvl8XKZoimFvycT999RKjoXG01AAR++Ak8kkM30MDhOQrx+KtOHBWo5kfK
	yRocWGrPgLWx6N9WURbn5mAhp5Y0UlA=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-HERV1dwfP2KvlP9mQnAZeQ-1; Wed, 28 Oct 2026 18:09:43 -0400
X-MC-Unique: HERV1dwfP2KvlP9mQnAZeQ-1
X-Mimecast-MFC-AGG-ID: HERV1dwfP2KvlP9mQnAZeQ_1793225383
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6795a39e53fso247619d50.0
        for <ntfs@lists.linux.dev>; Wed, 28 Oct 2026 15:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225383; x=1793830183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5xHrk121VJ6jsiOiBImMpaem11Ex15L22vqkzMRx+Y=;
        b=OItWQGRwXZvN47tV7GX0sQEH8vIcqMnYv0znHS/jSXI8p93ZmcPJNeOai6l9euRL9y
         1lkkQltSkLZbn5iDr2rzrWSEGxGFgLN60bfQQUrkb9SQ6alfkSCdTURR/ytLTEtLypbW
         Jx4m3IXA0MZBv9b8ES8Ac59QogDYxHrmE4fPSMcdXJlBglKDMvJUhMp3gGstIEIjEW9y
         NvqhUdaYDC/NEU+wE5Pt1c24WX/LKXe3RxszUDlZkPg01BtRMGd9VCBjTbEAyBnIXyXG
         TVuphEtFr3qQWF+pP4hysZK8pRpQgH2g48hTBBHmAofjcIOrl/vmy/0ee9+MVpjqdLoK
         q56g==
X-Forwarded-Encrypted: i=1; AKwUvBzYzr0KBqx4r/5FB9c/NgI39+J3uElGJZttw7IO9CYTNkr36fqERvweU+DLSpp2cKCKEXmQ@lists.linux.dev
X-Gm-Message-State: AFq9FYJVzx+hGO9hedtU/7A+LrtSxeZtbYycfcHyA6JMOUUbnHdoU5wk
	PNo7/96KFoPJytdpoo6HdlQ6X52q3t4dqGhXXJ3H0BqnMzeHN0rAPzG7rSSp+oKUMgq9YG+X3QG
	Q6qvGUkLLvazqisSmX9Lsab6BRRwXepD5MrEi+xrAVfhRy1au4LSzyovTQ2KlcqQzTNkfwEPCyX
	ht50OXFAYBNi4hzd5V+p665FBpz1cLtw==
X-Gm-Gg: AYBFou1uVh99bsTz8VN/KXiBJzYMhN2G276XGPdPG+vQ5Zi33kzXQsE34qQiWe5+AEF
	BfITMVnJRvgFqoPntHF5rRSTcxplCP+uwrTkkmcXymyNPNif0rlwLeP+fXiNuh/O7hWgTdg5lbc
	Taa7tVon7G9ak+8uQHdek4YubBPxZbL1A/4U6fPtrRwUPIy+8GwzUxfE2FRS7MyJ3//Sk6CQ38Z
	+RgQ+AawWNMdysrl9SmgWoaVuWOj35m+9h+MCA+GmgGSg==
X-Received: by 2002:a05:690e:1918:b0:679:ad2f:3fbf with SMTP id 956f58d0204a3-67a8d0047a5mr704872d50.8.1793225382844;
        Wed, 28 Oct 2026 15:09:42 -0700 (PDT)
X-Received: by 2002:a05:690e:1918:b0:679:ad2f:3fbf with SMTP id
 956f58d0204a3-67a8d0047a5mr704846d50.8.1793225382297; Wed, 28 Oct 2026
 15:09:42 -0700 (PDT)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <20261012-work-fs-sb_rdonly-v1-21-60743a3dc326@kernel.org>
 <CAHc6FU6z4kX5R3Og8m0dYOHsjFcw+4Btvfe87AGPxy_EWs0E7A@mail.gmail.com> <20261028-zurschaustellen-okkupieren-inkompatibel-d11525ce88b8@brauner>
In-Reply-To: <20261028-zurschaustellen-okkupieren-inkompatibel-d11525ce88b8@brauner>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 28 Oct 2026 23:09:31 +0100
X-Gm-Features: AclHuK9MzobLdiG2EG9M5KT_ibZzYxdrTghiXff6ZlesOE7YSK8Ag_RtXekxyZI
Message-ID: <CAHc6FU6VSAWQ4RJTO_eLnpqN5qvrShbJeT+ADwiA6ohpq8dO4Q@mail.gmail.com>
Subject: Re: [PATCH RFC 21/28] gfs2: don't set SB_RDONLY on withdraw
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ntfs@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nR6TJJh7NAbmq9OtWAg5Fvt_-t4YJfvF8TpGvwhipGY_1793225383
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:02=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> On Fri, Oct 16, 2026 at 02:01:00AM +0200, Andreas Gruenbacher wrote:
> > According to commit d564053f0746 ("GFS2: Clean up freeze code"), the
> > idea of the freeze sysfs file was to make it behave like the FIFREEZE
> > / FITHAW ioctls. This isn't what the code is doing at all.
>
> That's a pre-existing and separate from this series. freeze_store() calls
> freeze_super() and thaw_super() directly with FREEZE_HOLDER_USERSPACE and=
 never
> goes through gfs2_freeze_super() and gfs2_thaw_super(). So it never takes=
 the
> freeze glock. I don't think that's for this series to fix.

I mainly wanted to point out that this behavior isn't intentional.

Thanks,
Andreas

