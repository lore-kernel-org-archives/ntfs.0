Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794096142;
	b=eVZw51GiAGg40UfcJDXJCE8OBvcgcp9kT9sCxmTyFM79aVO9+gVFOBI1RSmSwunfykLf
	 AjnPRIpOujLznGbcJGSIHfrBUodIb0+hAjhrdkAbHxKvD6qcufAF91HNmcAQMOw31ZezO
	 yKd14xuJpw1VD090wQlbd2uWR0Z2aP/LT8Ff02AZpWQw2LkCXHNv0s1GfrjTyUMykhmrf
	 V7sb8h+w77u/ipZJF4O7G+BFv8jGAnu/OcOJTdQKmtlU5r6TRPQHdMt3C+LQYnlZsOish
	 ryfcpcAS6T/sBpwP5MQkkosO9d+e6y/cteDUiTAlWMSq8Dm83SZU0a+NIlDHXRTdIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096142;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=KBD9wlZPfxWAhIIS4aMPAXPKltaJw2QPOOhIhygrOcQ=;
	b=aa58cWRGxlEjDUz8oYy1T5lAIOMEKbb+M0j2VNFqstAjqPlMHaZZ5xt1fgKl3OiQ9JbR
	 wnE6lUdJw9Qpeptjuvp6UN8M66o2B5Yj3uU0yJ7H9ArhFONKAA2384q/JXxh+hs4FVx+s
	 RzRi7RyDm5Ty8R9AK3TmtWqa7J4k2C8+Hgwp4FNZbTaIc/il+oSMkcSdExbDrKITkm2QB
	 7PKxHTQTHcsWRTvdyq+N4IWsQ21IUf9p3ASQcZZLZ0OYz/P8s/0Uz7Out5P/+OaOmc8mv
	 RYZvJxNLyPQw/WRFmJt7yxf1EF8SaluD7izB6+MpeXamu1gY4CvIDeBUlGt3BolTLWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ATrKjT5x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE7606A326;
	Sun,  8 Nov 2026 00:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ATrKjT5x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30761F0089F;
	Sun,  8 Nov 2026 00:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794096141;
	bh=KBD9wlZPfxWAhIIS4aMPAXPKltaJw2QPOOhIhygrOcQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ATrKjT5xWkytFvrsuhump5ksR8Nb7Ob87DSes0Ph+qagSyZehF55Xq9O9h5UD5RFJ
	 abbgCzzcKt3EGDKrTbDWdgjOnlUUSHHhuoWQzh6+CO7OwrDBCcFDbeL7I0mwWXeJY+
	 W6JaEG9C6U9aGOwxWRFFh5f3PVFhbmEIarkDo3TcZ+BYg6r9ekjcrj3+t4qFsF8XDP
	 +atni8YdZLzLU+w5xebMidbsQU5UxthEbCI3rSHbZEJjxrqz1QwaN54HwhuhQ9bx8t
	 Vwg2XQmlM2BOMh0H0rw79ITmR1JhgQABQlIFQLBtdCvg8DrT8rPdSv/jVbKVbWzVPP
	 lRdGivcMI4SpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D849B380821F;
	Sun,  8 Nov 2026 00:02:21 +0000 (UTC)
Subject: Re: [GIT PULL] ntfs fixes for 7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd8+9m-FZuNU5Ahcco1reEac8u7b5KJ295ezA37rtcGjUQ@mail.gmail.com>
References: <CAKYAXd8+9m-FZuNU5Ahcco1reEac8u7b5KJ295ezA37rtcGjUQ@mail.gmail.com>
X-PR-Tracked-List-Id: <ntfs.lists.linux.dev>
X-PR-Tracked-Message-Id: <CAKYAXd8+9m-FZuNU5Ahcco1reEac8u7b5KJ295ezA37rtcGjUQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git tags/ntfs-for-7.4-rc2
X-PR-Tracked-Commit-Id: c77ab4eeeb3ed471bcc99a94673f0e0142c4b84a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12419f306c3ca34a38064d2b502966fa01650b49
Message-Id: <179409614051.1386903.4075997747066409340.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2026 00:02:20 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Hyunchul Lee <hyc.lee@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Sat, 7 Nov 2026 09:32:17 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git tags/ntfs-for-7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12419f306c3ca34a38064d2b502966fa01650b49

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
