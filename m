Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792980401;
	b=WLgHwzUCrBCGQpPQx8sJKfAUtrElSGl5sXA2QA0PFM3x8SBSlzOdooLtlTFntKUcO3w0
	 0JdyFN2+RABzdFTYWYvlkHMWPZy3Tqxz0bSNkp7+BmFVTFP9/fE00Jl0pHgE7Lib3NFfm
	 B0K772bOPF8E8kdg6LJ1xXhBXJnc2ZRKmpcmSFoTJ7JoFyRR4sZulLE1nMw/A/ZRKMOQM
	 pFkEbSJX4nSkYaESIM5wSkiB5rkAL5MgA58NMURVp1j/dHd61iq7G1nJaRdeFx/9LF5W8
	 K7yg4fffj6ckbiwbRN1xkYlosjagAZOo4kw0smFjilIxI81HJb5cZjgZUeWMpUi7LqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980401;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=AnDHsG8HhsU78Ys5ap9lEmWr61BHxskuK9fVEfdkXJc=;
	b=X9DiR+35Bo2AArvyrIFC1gCVxIADuT206CxUBNum1osWNwAddIoPG2njkDIiqVZ3bUa/
	 OLHI4UgXF2PUGmiQ9/Bc/oZccLibj/6UcWWs4HO0K74/Ar3KaJZCokdsBWKxQKyYwjoMO
	 R9onrgJjRD8NqBNRoo7AlSMd/pF1n5qHU/kNyQeDhCiIzCLNHwmTegjZsbGp3xZDQqBUF
	 lYUdFM2zI5GaCBQI4AnAJxryiA7iqUbU1NrYogtsC3+eA4G9BEzW5FPZlPwrRkqwTB555
	 gtqqDnRH0VmqV01fl+IPoEzSAhrZcchurMXXDqm0RnB0+2noInDHmeDrrj6DsUgZKqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFX2uDvw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F1E606A31F;
	Mon, 26 Oct 2026 02:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFX2uDvw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC7C1F01829;
	Mon, 26 Oct 2026 02:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792980400;
	bh=AnDHsG8HhsU78Ys5ap9lEmWr61BHxskuK9fVEfdkXJc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XFX2uDvwdUXhMCqRRV/f+/UHGui9ojPmrJdC6Q+jXZNY7mItJXZIfe5yiim4fP7GD
	 b+oQ3RY464CAdru0xWp8NdFWH9AyBp5ulucYXohoLiqziZI6cpuGqC9QX5CFaXT7SF
	 xUiH5y5cPM/Bg1eqF2pTqek1KNegG0GsuhXUVLD/XTc+xVjOZ9pAaAdewL2T0VQdJ6
	 JszMutKeSIfYG+rLg6FNhkmWbwqLhEKZzx2HUSgMn5GfjfBIOcLqXrhXpVONvqnjWw
	 gIg5R2f9xqCzkFKZjvZqcBM4jwFpswYddiMcgTmWF4kBmjLsQP5evkTcteJwVFf6Ip
	 csDaJ2sBTz4Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 815A339EA760;
	Mon, 26 Oct 2026 02:06:40 +0000 (UTC)
Subject: Re: [GIT PULL] ntfs update for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd-XG_n3ufHzayWZ0jEBR15-=khbRFRDuLD1nAu6JqRDOA@mail.gmail.com>
References: <CAKYAXd-XG_n3ufHzayWZ0jEBR15-=khbRFRDuLD1nAu6JqRDOA@mail.gmail.com>
X-PR-Tracked-List-Id: <ntfs.lists.linux.dev>
X-PR-Tracked-Message-Id: <CAKYAXd-XG_n3ufHzayWZ0jEBR15-=khbRFRDuLD1nAu6JqRDOA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git tags/ntfs-for-7.4-rc1
X-PR-Tracked-Commit-Id: 5dffb7307023d909277cb5f5f3f18f32afa31e2f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12392d40a3be2d79bc168bdb9ae6d7227b1dd17e
Message-Id: <179298039911.2358720.17561362333498518317.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 02:06:39 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Hyunchul Lee <hyc.lee@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ntfs@lists.linux.dev
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Sat, 24 Oct 2026 13:16:54 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git tags/ntfs-for-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12392d40a3be2d79bc168bdb9ae6d7227b1dd17e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
