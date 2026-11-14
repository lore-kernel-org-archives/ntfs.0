Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674976;
	b=Pxk0lDEhfWSi9tSKS3bL5ahx3zfT2kMbGz5YcDFtKfs/wnLWvoSxC54UnCdDXnAyfNSM
	 ZB6cNQFUn5FSUfNiaGfSGMKcW47XGtjTMvsTf8gHU0JNAQneh/aROZnz9AyBo3t8oaQqm
	 ng1zp0VrNiwF+QkiOiZU/Oz/RubeA4b/803Du/fu3EqIo8rpP1SNwhb4hSfXb3YuaDJN5
	 P/8A522us4TfNeoaSdbikawhPa1I6OJ9OhbU9d5ERvH+KE1grCb84xG3zTujznjnUZM5t
	 RdLYoyqCUR/pC60x7i4i16F40WGSHe1gG+0BAs9Ze9wm+xuvXN46xvkdIhPBzyXaMzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674976;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=pfm+ntGBhWHvVfg7YQlfmHjpmvF8BBY184iuUZlnt0E=;
	b=x138hemZ44qKq+lISB4u5Dx2u5L/g1bHpzTi72x8roIGCXPhxZ23ULTFmk2K0MIyJHpp
	 zCUJ/ficti4lYJJfmoX6S5664VibEmwrg5nA16USBiifaklhVermes3hRvQEELtcUJa5I
	 /5oF4Cpzk3n2TCyfiVAGQFPFp6NoKy2oLzDYaJMqUmeKGTNB6lPQnMyxTJUaDSmS50hJX
	 ZoKs+mtk6ZbhyyK+Zzf8JbuwFvpyQn7SacMyTKjlbFOuvo43bIcZt9BpQWoxCMfVi03oi
	 rkP/vKtnRLBkRzctlnvMbRYSqBgDBQG0VzLGnHe080kskZZ7/bcODgbe7iCvpIrBfeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pc+kCrXk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E008B606A88E;
	Sat, 14 Nov 2026 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pc+kCrXk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6571F000CA;
	Sat, 14 Nov 2026 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794674975;
	bh=pfm+ntGBhWHvVfg7YQlfmHjpmvF8BBY184iuUZlnt0E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Pc+kCrXkTgjUwjeRg21Zqz+6hnWPTHmMeOd9/dJh/8AzJSKVRalPMvgRx4pFl/J4D
	 q5pSROvjvcHt/bvfMqV2fKnzs4WGXi11P4ApiaGmdTMYSYTMeleT10pfdwNpxy4290
	 MhTWuBU55fO72Cwd6pMNU8l+av0cSBWH+FyHo7khh3SeEe1WFDW1KIKQQ9Ze3mfMdU
	 EB+rHM1I5DUvfG6u/256p6Yoc/qFWJmU61LCNnQ/uKYrGTe4z6isjEXTH6pYR3EGDW
	 /SIlN6Xmri31pe5TnERq429Au0NjRNTvzzo7Yu0CxJmlyfkzbUKE8XZ4NJR9ENvE5B
	 AydkW4qNdNOUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44C3380821F;
	Sat, 14 Nov 2026 16:49:35 +0000 (UTC)
Subject: Re: [GIT PULL] ntfs fixes for 7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd-4O90M9tdUv6LgoJc3CBmrLZnwhaLFvBkgbFpouJso0Q@mail.gmail.com>
References: <CAKYAXd-4O90M9tdUv6LgoJc3CBmrLZnwhaLFvBkgbFpouJso0Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAKYAXd-4O90M9tdUv6LgoJc3CBmrLZnwhaLFvBkgbFpouJso0Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git tags/ntfs-for-7.4-rc3
X-PR-Tracked-Commit-Id: bada7bbb11aaa6feba8904cf38ff833453f5b5d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 68271fbe7d14b6397e90df730c3967d3a481902b
Message-Id: <179467497424.2233204.2509266200367626347.pr-tracker-bot@kernel.org>
Date: Sat, 14 Nov 2026 16:49:34 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, "open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Sat, 14 Nov 2026 14:46:51 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git tags/ntfs-for-7.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/68271fbe7d14b6397e90df730c3967d3a481902b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
