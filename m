Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504119;
	b=eN9+hfCa77YgRBN0ID3pGKcs6FwP71iYngAiU5UITR7QEXTresWfrjMr4YQGripjDaI/
	 ArwTGQAvf89T8/5+ZWL09Zg0gEhQpGgj7HMnZP3WAs5IPHjnX4Fl0WKapXAO4nPWPqJdR
	 e3POyqq3Qxl9b7oiYrkq9pqrouxbJxAsOKRI8G4RGkKGjCElDsUKx5nTdndTwVLx2BSkV
	 BU3DsU3KS0DoL6BO49j5aJVe8WL3xgi9zeA14symtad6cSWObtwV0qNXjslE3DVQsgFu6
	 gdNwxSnLUMvHn+hYq/+/92jOOdrv1mqcvZXDSfgivI17t5JfqWSPxI07RGnJ9/qveuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504119;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=KmWK89/yh+3U6N8ztRGk91ddCFgN9nj5EioDuKtujQA=;
	b=h30uLxCCKVIcBQABFe22qEdGRdid1dSIVBZ3ytAr++v+lyfYbBg39K9YOxbP84WXh7Md
	 LY2cdidSw7l2DZ9pNVzf5vubaBhrY2YDp46OGIdYpV0cuJcXsnzU0Zf0cniwWjWOMDZP1
	 JrZOnElDcPS+x3xb7X3Y5hWzE5aInxy0d1YdHsiVnIO0YE5h40WRGNhIbrFHE2bRIVWSS
	 w13xaOwy+AR+Dbn1P8c8VqjYvIFcr/zAMX0PgEN7eT+OUy3+n50UW3Y1DNhqKv2k3XAu3
	 E1e1Nj5xjqfdf5wdDAsERLxYA2z7I3G4d7pfkTbPFxqkmUiCwWoNsraanTiknTQ1NYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fuz4oIuf;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C36606A31E
	for <ntfs@lists.linux.dev>; Tue, 24 Nov 2026 07:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C36606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fuz4oIuf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=KmWK89/yh+3U6N8ztRGk91ddCFgN9nj5EioDuKtujQA=;
	b=fuz4oIuf6/1yHcSA4hJ/814zy0uFTvH3wWDcT83QsYBEXW3szQjjgX2WWnVABa
	LcCL3YtpYl3EO83fLtr5Cs7vTpvjt3Ms7RUT6sRPSmknhV6ytic38emSKkLhZqzF
	zUjEdI69YBoOEQIODztWdiXef8dlBT0fvEmQDgY06s7pw=
Received: from [IPV6:2409:8900:1fd6:2667:fa79:c486:b564:4e50] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3X3rbNwVrvxODJw--.9843S2;
	Tue, 24 Nov 2026 15:08:14 +0800 (CST)
Message-ID: <a2f75e81-b012-4bb1-8885-a2ed310fa988@163.com>
Date: Tue, 24 Nov 2026 15:08:11 +0800
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ntfs: deleting $Extend breaks subsequent mount
To: Namjae Jeon <linkinjeon@kernel.org>, theBIT5 x3zk <x3zk@outlook.com>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:NTFS FILESYSTEM" <ntfs@lists.linux.dev>,
 Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin@kylinos.cn>
References: <DM4PR15MB6276A5C442568B4C7E604AA386452@DM4PR15MB6276.namprd15.prod.outlook.com>
 <CAKYAXd-MHxzjvc20J-x4VYBnuk3sVpzmHo+zrHb8n3nx8Aav6g@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd-MHxzjvc20J-x4VYBnuk3sVpzmHo+zrHb8n3nx8Aav6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X3rbNwVrvxODJw--.9843S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF45Wr4xXr43uF1fAw13urg_yoW5WFyUpr
	9FgF9FgrykG3srK3s2vFs8ZF1Fqw1xtayUJF1rXF17AFyYgw1agr15KF1Fqry8Jrnak3y5
	Za1jg3yrua15A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTKZAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6R4h62sFN94eiAAA3s



在 2026/11/24 09:40, Namjae Jeon 写道:
> On Tue, Nov 24, 2026 at 5:01 AM theBIT5 x3zk <x3zk@outlook.com> wrote:
>>
>> Hi,
> Hi,
>>
>> Was messing around with the new ntfs driver (fs/ntfs) on 7.4.0-rc3-1-mainline
>> and noticed you can just rm -rf '$Extend' even without show_sys_files.
>> After umount, the filesystem fails to mount again.
>>
>> Steps:
>>
>> # mount -t ntfs /root/ntfs.img /mnt -o loop
>> # cd /mnt
>> # ls '$Extend'
>> '$ObjId'  '$Quota'  '$Reparse'
>> # rm -rf '$Extend'
>> # cd /
>> # umount /mnt
>> # mount -t ntfs /root/ntfs.img /mnt -o loop
>> mount: /mnt: wrong fs type, bad option, bad superblock on /dev/loop0,
>>         missing codepage or helper program, or other error.
>>
>> dmesg:
>> ntfs: volume version 3.1, dev loop0, cluster size 4096
>> ntfs: (device loop0): load_system_files(): Failed to load $Extend.
>> ntfs: (device loop0): ntfs_fill_super(): Failed to load system files (-22).
> Please check the attached patch.
> Thanks for the report.

Hi Namjae,
   I noticed that NInoSetExtendSys() is only reached when looking up the
unnamed $DATA attribute returns -ENOENT. A file directly under $Extend
that has an unnamed $DATA attribute skips this path and never gets
NI_ExtendSys set, leaving it mutable without sys_immutable.

   I reproduced this with your patch applied, using default mount options
and a synthetic NTFS image containing a SYSTEM-marked file with unnamed
$DATA directly under $Extend. After remounting, this write still succeeds:
     echo changed > '/mnt/$Extend/review-data'

   Could we move the direct-child classification into the common
inode-loading path, so that setting NI_ExtendSys does not depend on
whether the unnamed $DATA attribute exists?
   I tested the change below in QEMU. The write above is now rejected
with EPERM, and normal file, hard-link, symlink and remount checks pass.

Thanks,
Baolin

You may consider applying the following change on top of your attached 
patch:
**************************************************************************
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index e1c5a767e62b..c0e2535401bb 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -959,6 +959,15 @@ static int ntfs_read_locked_inode(struct inode *vi)
                 goto unm_err_out;
         }

+       /* Classify $Extend children regardless of their data/index 
layout. */
+       if (ni->mft_no >= FILE_first_user) {
+               err = ntfs_is_extended_system_file(ctx);
+               if (err < 0)
+                       goto unm_err_out;
+               if (err > 0)
+                       NInoSetExtendSys(ni);
+       }
+
         if (ni->flags & FILE_ATTR_REPARSE_POINT) {
                 unsigned int mode;

@@ -1163,7 +1172,6 @@ static int ntfs_read_locked_inode(struct inode *vi)
                          */
                         extend_sys = ntfs_is_extended_system_file(ctx);
                         if (extend_sys > 0) {
-                               NInoSetExtendSys(ni);
                                 if (m->flags & MFT_RECORD_IS_VIEW_INDEX) {
                                         if (extend_sys == 2) {
                                                 name = reparse_index_name;

