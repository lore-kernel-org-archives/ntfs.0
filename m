Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793479238;
	b=XEbYJ3kdSb9Ye5J3XKsZS22LkX2K3Czgo8+uK86RHx20kRCon0TJiiVhl3YPahBK/ygU
	 PTA9gcdl7AOqJlITXBG6pNyEymSl0iOeTDe/CwWcWyvHgSTSIJDP4TEb+ZDxEF4gkKDhl
	 eX4xqwbvPAUZ2IqXT6ot30YMGx0/Iq1myELj9LscK+RrpOO2NUfrl8llc4dONNkoGB+bs
	 3NCaZkGkaHFQZGilfxLNF0foXeIi0qwiuIfPR8MukZeeqZyl/jqjjOqGDjns02kMUOiHo
	 EXasyOOxUD5Z3Fpj+h5teB8Gsna9qJOkgupvBIpLYCwE067/TR6qYeZ7+ECgJjgzhFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793479238;
	h=DMARC-Filter:DKIM-Signature:Received:Received:To:cc:From:Reply-To:
	 Subject:Date:Message-ID;
	bh=AtLbwE1xAdj1WPpMga0h7LUVIHErN58xx/e7te9aEQU=;
	b=h2Dui5jwiGv+fQv6VM9RYI/JdxdOE1O634OXmIFyx1pzrb9Yn7CMmGhY3QfCMcDTEI5y
	 oL5K26iZhUVtd/6B8jZkat45FQ4A/JQT2SzNlBUoChWEgFdedZ0rT0zV2RAowwfT2EjEh
	 epzGeF0hHtIUqTBWpacaVe6UyW05+gLDCS2RNDx13VUbwso2PCCMuvOCTyVPTaTrPK//g
	 N+7P10xTOjPvZHzeG9RoWLTBBoJeiDSU2/QCUe0JxihqLUrU73Z1/2gfnNi0ra8H61TWn
	 sXf3bTPAynWiWHSn8ICqEcFhdrtbfbet4nVH65+AwSpIdauF1u0WQ1ibhpd9kzGwGdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b="o0Wgi/Ap";
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C74606A31A
	for <ntfs@lists.linux.dev>; Sat, 31 Oct 2026 20:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C74606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=o0Wgi/Ap
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:Subject:Reply-To:
	From:cc:To:Sender:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AtLbwE1xAdj1WPpMga0h7LUVIHErN58xx/e7te9aEQU=; t=1793479237; x=1794343237; 
	b=o0Wgi/ApuYcgqM6vjPJFbH3fHRzRaCf+D0UvRBwSJHzCIB9IxCnio1eU+QljqRktZYzTSRy2xgk
	xqSLx4BnGvEYNurf9ThdJzaVxRiBDk/PcCuNEgyrS4bmYBJxQzvaVBjerxcGL9exvbWpNLp/70pCe
	UvjUyzEBpk8U+t+7xQs+oBST3hwlJ4ifiTMnUwbHFKz9YfiKqjybXYiX3VCF7HR4SEoqzmr4nWPhr
	/Wqgn9I5ZA/HG919QXZTSLDI//LOwXV2tn79JPkNXTP3OrYcctuNVqThim21ytDJcyirVFtrCBFK0
	nnYD9gsy8jaMBiN1j++usxsULSVIK4bKzNVg==;
Received: from [24.147.175.133] (helo=crash.local)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1xNFsR-00Fbnf-3G;
	Sat, 31 Oct 2026 16:40:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by crash.local (Postfix) with ESMTP id 4F74F3EBBA0B;
	Sat, 31 Oct 2026 16:40:34 -0400 (EDT)
To: Namjae Jeon <linkinjeon@kernel.org>,
    Hyunchul Lee <hyc.lee@gmail.com>
cc: ntfs@lists.linux.dev
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: ntfs_resident_attr_value_resize() uses value_offset w/o check
Date: Sat, 31 Oct 2026 16:40:34 -0400
Message-ID: <72452.1793479234@localhost>
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list

In ntfs/attrib.c's ntfs_resident_attr_value_resize():

        old_size = le32_to_cpu(a->data.resident.value_length);
        if (new_size > old_size)
                memset((u8 *)a + le16_to_cpu(a->data.resident.value_offset) +
                                old_size, 0, new_size - old_size);

A corrupt NTFS image could have value_offset greater than the
attribute length, so that memset() zeros outside of the allocated
memory.

A demo:

# wget http://www.rtmrtm.org/rtm/ntfs40e.img.gz
# gunzip ntfs40e.img.gz
# cp ntfs40e.img junk
# mount -t ntfs -o loop,rw junk /mnt
# echo b >> /mnt/a

You'll need to add a printk to ntfs_resident_attr_value_resize() to
see the problem (unless you get lucky and the memset() disturbs some
critical kernel data).

(gdb) where
#0  ntfs_resident_attr_value_resize (m=<optimized out>, a=0xffffffd6059ce548, 
    new_size=new_size@entry=4) at fs/ntfs/attrib.c:1982
#1  0xffffffff804c0ab0 in ntfs_resident_attr_resize (
    attr_ni=attr_ni@entry=0xffffffd603ded000, newsize=newsize@entry=4, 
    prealloc_size=prealloc_size@entry=0, holes=1) at fs/ntfs/attrib.c:4918
#2  0xffffffff804c1814 in ntfs_attr_expand_locked (
    ni=ni@entry=0xffffffd603ded000, newsize=newsize@entry=4, 
    prealloc_size=prealloc_size@entry=0, locked_ni=locked_ni@entry=0x0)
    at fs/ntfs/attrib.c:5207
#3  0xffffffff804c18c0 in ntfs_attr_expand (ni=ni@entry=0xffffffd603ded000, 
    newsize=newsize@entry=4, prealloc_size=prealloc_size@entry=0)
    at fs/ntfs/attrib.c:5224
#4  0xffffffff804c786a in ntfs_expand_for_write (end=4, ni=0xffffffd603ded000)
    at fs/ntfs/file.c:850
#5  ntfs_file_write_iter (iocb=0xffffffc600253dc8, from=0xffffffc600253da0)
    at fs/ntfs/file.c:923
#6  0xffffffff803031d2 in new_sync_write (ppos=0xffffffc600253e40, len=2, 
    buf=0x2aaaae3620 <error: Cannot access memory at address 0x2aaaae3620>, 
    filp=0xffffffd6049351c0) at fs/read_write.c:595
#7  vfs_write (file=file@entry=0xffffffd6049351c0, 
    buf=buf@entry=0x2aaaae3620 <error: Cannot access memory at address 0x2aaaae3620>, count=count@entry=2, pos=pos@entry=0xffffffc600253e40)
    at fs/read_write.c:687
#8  0xffffffff803035fa in ksys_write (fd=<optimized out>, 
    buf=0x2aaaae3620 <error: Cannot access memory at address 0x2aaaae3620>, 
    count=2) at fs/read_write.c:739
#9  0xffffffff80303678 in __do_sys_write (count=<optimized out>, 
    buf=<optimized out>, fd=<optimized out>) at fs/read_write.c:750
#10 __se_sys_write (count=<optimized out>, buf=<optimized out>, 
    fd=<optimized out>) at fs/read_write.c:747
#11 __riscv_sys_write (regs=<optimized out>) at fs/read_write.c:747
#12 0xffffffff80ebc0ce in syscall_handler (syscall=<optimized out>, 
    regs=0xffffffc600253ee0) at ./arch/riscv/include/asm/syscall.h:112
(gdb) print old_size
$1 = 3
(gdb) print new_size
$2 = 4
(gdb) print *a
$3 = {type = 128, length = 8, non_resident = 255 '\377', 
  name_length = 255 '\377', name_offset = 65535, flags = 0, instance = 0, 
  data = {resident = {value_length = 3, value_offset = 48925, 
      flags = 0 '\000', reserved = 0 '\000'}, non_resident = {
      lowest_vcn = 210131274956803, highest_vcn = 4294904417, 
      mapping_pairs_offset = 65535, compression_unit = 255 '\377', 
      reserved = "\377\000\000\000", allocated_size = 210131274956803, 
      data_size = 0, initialized_size = 0, compressed_size = 0}}}

Robert Morris
rtm@mit.edu

