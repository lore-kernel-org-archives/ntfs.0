Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583860;
	b=mGKnqU5Qdn7qkXCdmut9Ii9NU7bmUp82AD40XgrDRip4dRmPtyAnrhtEk7TQX/KzJVRz
	 YaADSaVmMSEBFrvy4iEEQMkPQj08SJsCJybZycdB0UCD3Gewg+6eXhPMqqKj7zW+Dxc59
	 t6JXqDtU26xQgOq1cBC8Ec+6faMB4AKJnkOz7shDWMDKmO7iDYOnkhckrIklInyHOCD8S
	 N+zasmg6WSZ5gId9ckpSwEu46seNKWbQVKZGJBy9WtI7IiyWaJ1DOFzXH0sXStaHyIrV2
	 HKE/N0mFBWzIXYXs70IxyC6CMHqGkywKnY+Az+5nTNWVzPPOLHollPJPCWKTGKgOs2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583860;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=TmSuTLVdygzdmnggAgAQOvBi82hefG7lzDP6C4C3QBo=;
	b=A/86qPOrb2Y8XTTlwNZv4nnKOAWHlB4VuEF0qMiAHDHF5pUcbwhtWds1o+/lIrQzglxQ
	 7n9DxbA0BbCdGwqeV6yxCxvVTWJxkwuKERANcY4xzB7/Or7FFkAcSaeFpNRtgf3237rlR
	 KmcW5ZvcpeCuZu+OH6x7QbNpcC7iK4MUDnCgm84MnxrfG4l19vXwKLUbw9Pc/1q90DW89
	 fw+LiHgMQ6r/+FXnYE197t9ZtdODlkQrAxN6DxxTXigQAIipBHk0gCIdwr78ix6qn/5xs
	 D/cehhwFBvxyR6SM+6OnBHIoBWxFHr0kt/ew2cv+UHaJXGtZCi/DSkKD8TGD3PamypQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NyAoondu;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF738606A321
	for <ntfs@lists.linux.dev>; Wed, 25 Nov 2026 05:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF738606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NyAoondu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=TmSuTLVdygzdmng
	gAgAQOvBi82hefG7lzDP6C4C3QBo=; b=NyAoonduE9aQJoYknuZkK0JCtFvDwGc
	fTjvWs3IhddmVdA7OrcjnT9uhSXeR/S4d4YrF3pYucx3l54oNVS8hL/UJaCsrytd
	oiX0oMqcCZACP2Zr6etiQ1jmfxoxTrCOa3tvrwC7mGv5iWwWdTmK5Hxve2U809wQ
	piUHLSy8yyU4=
From: shaos <shawnq1@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs: guard the final LZNT1 sub-block header read
Date: Wed, 25 Nov 2026 05:17:20 GMT
Message-ID: <179558384099.146091.12975349907127521352@163.com>
X-CM-TRANSID:PigvCgA36jZhbwZrJmR1IA--.43537S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gw43tFW3Jw4DZr1xtF18Krg_yoW7tF4Up3
	9Ik345trnYqa15JaykKF40v34Sgan3JayUu34DXrs7Can8tFn2gryrKryUWF47Xr97Wrn0
	vr4UXa4xXa45ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9TmgUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8gJQXmsGb2JlWQAA3i
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list

Hello,

The legacy NTFS LZNT1 decompressor reads a 16-bit sub-block header
before checking that two bytes remain in the compressed buffer.  If
one byte remains, the read crosses the end of the 64 KiB
compression buffer.  A crafted compressed file on an NTFS volume can
reproduce this as a kernel page fault while the file is read.

Check the remaining input length before dereferencing the header.  This
preserves the existing end-of-buffer handling while avoiding the read
when fewer than two bytes remain.

HEAD commit:    8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
git tree:       fe970b05333fb8e41da21e9e289f652abcc7cba7
source version: Linux 7.4.0-rc4
compiler:       gcc 11.4.0, GNU ld 2.38

Related work: ntfs-3g has a separate userspace LZNT1 bounds fix that
checks for two remaining input bytes before reading a sub-block header:
https://github.com/tuxera/ntfs-3g/commit/6aa66d98980ac1d966d7977c7b079f4fe380eb42
This report concerns the in-kernel fs/ntfs implementation and is backed
by a kernel reproducer against the revision above.

Console output:
https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/console-output.txt
Kernel config:
https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/kernel-config.txt
PoC:
https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/poc.c
One-byte image control:
https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/one-byte-control-console-output.txt
Fixed-kernel control:
https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/fixed-kernel-console-output.txt
Image builder:
https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/build_image.py
Initramfs builder:
https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/build_initramfs.sh
QEMU runner:
https://gist.githubusercontent.com/shaos26/acbe634bf90826a626ed95d0f32b5ab4/raw/ada97c11fe984e4bf47b9c93a0d90d30766ca3c4/run_qemu.sh

Build the test kernel from the specified commit and config.  Required
tools are gcc, make, cpio, gzip, QEMU, and the ntfs-3g tools mkntfs and
ntfscp.  Run these commands to download the Gist files and build the
kernel, create the images, and run the positive and control cases:

    work=$(mktemp -d /tmp/ntfs-lznt.XXXXXX)
    cd "$work"
    gist_id=acbe634bf90826a626ed95d0f32b5ab4
    gist_revision=ada97c11fe984e4bf47b9c93a0d90d30766ca3c4
    gist_base=https://gist.githubusercontent.com/shaos26
    gist=$gist_base/$gist_id/raw/$gist_revision
    for file in poc.c build_image.py build_initramfs.sh run_qemu.sh; do
        curl -fL "$gist/$file" -o "$file"
    done
    git clone \
        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    cd linux
    git checkout 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
    mkdir build
    curl -fL "$gist/kernel-config.txt" -o build/.config
    make O=build olddefconfig
    make O=build -j"$(nproc)" bzImage
    cd ..
    python3 build_image.py images
    ./build_initramfs.sh poc-init initramfs.cpio.gz
    ./run_qemu.sh linux/build/arch/x86/boot/bzImage \
        initramfs.cpio.gz images/positive.img positive.log
    ./run_qemu.sh linux/build/arch/x86/boot/bzImage \
        initramfs.cpio.gz images/control.img control.log

The image builder creates a positive image and a one-byte control.  The
initramfs builder compiles poc.c statically.  The PoC mounts
the positive read-only NTFS image as /dev/vda and seeds the shared
buffer by reading offset 0, then reads offset 65536 to trigger the
fault.

The positive image faults in ntfs_decompress() at the end of the 64 KiB
vmalloc buffer.  In the preserved run, CR2 is the first byte after the
allocation and RDX is CR2 - 1; the faulting instruction loads a 16-bit
value from RDX.  The one-byte image control completes without a fault.
The proposed patch was built and tested against the same positive image;
the fixed kernel completes and returns byte 'A'.

The trigger requires mounting a crafted legacy NTFS volume and reading a
compressed file.  It can crash the kernel on the tested x86-64 layout.
This is a local denial of service; no information disclosure or code
execution is demonstrated.

The range check uses the remaining length rather than forming a pointer
beyond cb_end.  The Gist includes the positive, one-byte control, and
fixed-kernel console logs.

Fixes: 1e9ea7e04472 ("Revert \"fs: Remove NTFS classic\"")
Signed-off-by: shaos <shawnq1@163.com>
---
 fs/ntfs/compress.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -201,10 +201,11 @@ do_next_sb:
 	/*
 	 * Have we reached the end of the compression block or the end of the
 	 * decompressed data?  The latter can happen for example if the current
-	 * position in the compression block is one byte before its end so the
-	 * first two checks do not detect it.
+	 * position in the compression block is fewer than two bytes before its
+	 * end, so a complete sub-block header is no longer available.
 	 */
-	if (cb == cb_end || !le16_to_cpup((__le16 *)cb) ||
+	if (cb_end - cb < sizeof(__le16) ||
+	    !le16_to_cpup((__le16 *)cb) ||
 			(*dest_index == dest_max_index &&
 			*dest_ofs == dest_max_ofs)) {
 		int i;
-- 
2.43.0

