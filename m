Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680544;
	b=hUsWKWp7qPMfOX+Ojp0DbXmdwAqXlkBhp7uTNoGo3E6mMcB60BpFxl+IOyQC8Ydyk6Sc
	 3eVRrZ5C1oULem1otHbwlHrbD9dZwX9RJU3V/9dvyQjV/E7IiWnebAUaCZ8TiX3kt8hAd
	 dBbsiNDu+rMUcRavM5Ml1TJA3JAP6w5ds+9DjgIjVQyyfd0yVik0uclLFduuUE50a/68j
	 Gpt5z2OVcVqFCnzz7LqtMaa256MdY9PEMJhQKzUxGVBM95/p7UXxUtSrO60N88rCiKC8Q
	 aCcLfoIMbANv9ViYe8S9UBTUSWXDkWx8//ao1J+NaGOpkEXykApbMbqk3XBG854CQZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680544;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=2RH58x6Y/sAtUM15JCHy1C2bqdC3scU/oBdWNKPRLIQ=;
	b=S5GQ4+SYEstVyAVYcaV23hP+48dh2Kn0CucuT+mSHWtSt2apZ6XUQVegef1jC2HNmFrc
	 PHktDr28GR+wzuC3P2QJmq6AcZTOuQyBMt8oTlv8HV+WLtSkvW2STe3Eergd/k3ebNyPT
	 IZ1/PAKtNg+sehnsNYi5PQ361q4loXLBYCMDa5Y43Ixk7kdHxhz85Tg22MjhmqV3C/w56
	 U3SySTrOVjw8uhaN1NV/GZXCONgvlFjm/nCXYL4C17zI/ceWNETlMOLzHvUF68YeJEEkt
	 xVnHQqqkQig74679WAGxNWwvTB4THIrWL9J2iG9VFdSFCSCTXwCswggEWUS3RHajn+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=R4G4S6lH;
	arc=none smtp.remote-ip=203.205.221.245
Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8761560A6F69
	for <ntfs@lists.linux.dev>; Thu, 22 Oct 2026 14:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8761560A6F69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=R4G4S6lH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792680534; bh=2RH58x6Y/sAtUM15JCHy1C2bqdC3scU/oBdWNKPRLIQ=;
	h=From:To:Cc:Subject:Date;
	b=R4G4S6lHZmrP1KL6q2PIcCmy07Xc/RlNQwulVMjFtaf8icFSi0FWbMHHmPmSjsQmc
	 G6+TMxTVvRy58a70O9Jan+AFhkcR+kZAEustbqV2HAPbxYuB+0R06WB4Mxh41uogLy
	 RsMTCbWkSNXWXJkElbhDwuo3WqdWWxE7KHcMJGPI=
Received: from smtp.qq.com ([2409:8d5c:c30:3b3:a047:429d:4de8:cc50])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C340FAB9; Thu, 22 Oct 2026 22:48:52 +0800
X-QQ-mid: xmsmtpt1792680532tu7w63qo0
Message-ID: <tencent_5C530912FB57647A7259DF4581FD11F1F806@qq.com>
X-QQ-XMAILINFO: Nk/C+eM/eBrifacTzzHjxcqwszihW4NWdo6q5LPeMfr1rR38C6AhVrVj77b30u
	 vBROPDmo53cOMjbx1sd5eOlMjptzoF6EIpFrixqabAsowUXQv9OXzCPgNCHkO7cwuCzoM8rag4Ed
	 z0AR09s+qf2kEbCcrt5n89fgrYV1zAi1D19XEEl7uey3jMPDErIghH9UXycJvZyxLVWWIJ7yvVFC
	 5Wmk+UzBAP7fQg4A2tBzYjNCygVsdu1jx+CcInXgg9jbVbRo85U6DNUv0N8MaWjt7P+Q5CHvwz2A
	 PPmK4rJ5/8Ilh/qTstTteDAb5YX4WYzjUsOOk29wSeI5wDLHNEzy540nbL1RsaiEP6mXEpZbt31q
	 4JJz1cSjVFrcJS1Qzgx5/1p0aJnF70odLHecgMO3Qi0Ziqr/s5mYK+rm6Oyxh+U6QcfSTTTT4sXU
	 DDjSAntyeJXFD8Sh7IdU/yQQCD5BfoRt/DhtZsw4jCj0EWCodoa2Bn/A4toZLiR6SUS5js1nfBSm
	 RQKHj43tK7IzXPZlutWT9UbBqzGJcfi6bAYQqX8vi6ZmnxjVWM2j1kQXkJYwnRMufVjnEDeTlw4w
	 dlhPkrlLbH/X/AmMaPgy4l9IxP/0HrWXMytV9Ac6Yin6Oe3vqp0/i/DCoy7G50aml2L9weJdqFzq
	 xVmDYRIqIMks7gWrJ/Iwnp2k0Kjg2XOGNFyiRbBkAk0Pn9AejjFRZJCeTGqCFDNYflhqo2EOsONC
	 aO5w10OHE3Z41eu0pytZIRfBHy3PgeMXLR0cNfxSbang35gIL5ZJzZfjzcBHHoh7zNvUEEk5GKyu
	 9OG1Oa+750EOo/Ss3+qiM7mwfJh7s+YYxz7Hjn1NryFiEcy1X1+lUXiTdWdAI6QateODF9gZdfqL
	 6DO88EYZOiiqp2Gz7dOCgtvDdgA41QXNYP52m8qAwp9rPh9lRaAqKim0qcV370qVATi4KfkPPxkh
	 heciVWDC0N0ZBrITD/G/D8CZXvV1BUCA63tHL+LEtvj3/Q3whNLCirhfziQTiWVj8CTjRWpDTinY
	 LyZi+W0NdccYrpIoe4FZPFoPXFaEGhK1ZzbQBX5ptrucYqMw/TIDQDc0VPjDQcZfMLNUjmtkEjtO
	 sxsMqtM+ux5BUlmg8=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Hang Nan <2122295973@qq.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, liubaolin12138@163.com,
 ntfs@lists.linux.dev
Subject:
 Re: [PATCH v5] ntfs: reject index blocks with a too small entries offset
Date: Thu, 22 Oct 2026 22:48:51 +0800
X-OQ-MSGID:
 <179268053167.16668.10973005603990129571.20261020ntfsv5stable@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Namjae,

Thanks for picking it up.

One thing I should have put in the patch and did not: would you like to
add

  Cc: stable@vger.kernel.org

The missing entries_offset check comes from 0a8ac0c1fa0b, which is in
v7.1-rc1, so v7.1 and v7.2 carry it as well.  The bug is an 8-byte
out-of-bounds heap write past the destination of ntfs_ib_copy_tail(),
with the contents coming from the mounted image, so the stable trees
would want it if they are still maintained.

Happy to resend the patch with the tag if that is easier; otherwise
ignore this and I will only follow linux-next.

Thanks,
Hang

