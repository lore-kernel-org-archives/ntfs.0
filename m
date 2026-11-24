Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489179;
	b=CrY+exVYkt8LcQREPNF9VQz3rp2OsXGXagEkJvyQrmyJFf7oG/rknwXDzmtyh0V2ez/G
	 1Zxdx5J7ux9aKClbxB46wwJ4g4+xEeren9l5obcoAxDsWbVrsvgiJL1Qoyhi7AYm+y3cN
	 qW2Njl/UIwQfjg2c4qJUNa9mcG+8+VGDodxFS7Vfj6KIHgc5iv3Co26zK3zem23CxEU57
	 bYzxmiksMHuF/egrJ85u3gVsGPFTcY9lRp2rQCLB5WNLD3eZ2Y4u62ka9Z/VSAnQPMeJP
	 K4NVOO7R+W+elEwjQ0v3Pw+3k7b4A4FwVHWo4vTv9d1ueHJRgsg0FZCLuE3/pDDj26w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6bBGwFBxyOT+JGYxPIsHtylrHVnj9iVYqWEcGELsS+k=;
	b=asb+mApAwcdOTW7xwnwGI7DxDatF6VvZKrI6SksfSgZzvrn7nRmNyenYwbIcbG6u3oNs
	 sz942rWFn/fsCaxo1ZELOdCo46u0XoKsXy1w8hFN7jjZKXTAfq6QCm2GU0ks0VCoVcvsi
	 IL1ePu2XBsX1hEIMyrsNRh2H/iZkmObWBtQ4SF9Ugc8Yg6eSzuxJ7nDlkC1/T1hpExRRw
	 /HElUvoZpky7Nka83lKSBkaaNICp/ycCe7DUmse668MjA+tO2oyC9AmcgwVPRVbPw5HLS
	 +MQJIfIoK89NAelpvuvGrCmp58L/l2LvMSkCJnQkQ3qaxaJIbG3VBgIzb+C38JKdAfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUQKF5Le;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66711606A322
	for <ntfs@lists.linux.dev>; Tue, 24 Nov 2026 02:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66711606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUQKF5Le
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so1936605a12.2
        for <ntfs@lists.linux.dev>; Mon, 23 Nov 2026 18:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795489179; x=1796093979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bBGwFBxyOT+JGYxPIsHtylrHVnj9iVYqWEcGELsS+k=;
        b=mUQKF5Le2d9+9s6bawt3sKKRcEqh8AvtDQywbc/DS6AJkTTIgLeBOtF0JNaVAe0z2A
         DqprRr/Vjpcla6ygpcEDAQnhDfvXyUvffxDnvQ4AW1W/RMTYaJqabx49RJKy5grahVVU
         WGTghprXNaNDxdDgxhEEmj4r5nIRhW/lDzONZESLBRBErwaJ4738wFpiDkeGx9gu91Lh
         pftVv6gGFsqUlGpY3kJiVHWuP9g5xpF3NHhkDfl0LrUU8cmkfDDjYeH09DyRjtO+vL8I
         YIEPyzcMwT7k83a2MGllxfdG5nkNYSmNi7iUCjuT1zlhzNqlkA/Xr02qPEEjVurU2EEc
         NnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489179; x=1796093979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bBGwFBxyOT+JGYxPIsHtylrHVnj9iVYqWEcGELsS+k=;
        b=yVBkJFzrsjzqxxWhCmpEhY0bRaCqnv0y0timyPYiqaNXDkVsOLBOpgZDH2WSZkvpkf
         y5lP10DdgqMv0uN9M3d8RnIRRxTi6p4EM/ktfnhQotcz/fWPZshLNc5N+LsYQORzen/4
         Zf1R+z/Tba4zh358Nvp0oH0HzNB7hGucaya2pEMmcKZbtubWbmzuSx9ePlpvb4/2ebQ+
         VGBX7o4mYO4W08NMdO0E266jX62pJTz/k7eQuQG2doXFhqlshiWQeQU38bTKjtnRv5bB
         wKLnRjKRx1Wmr8nKvvm7iiX3a09o1Kpp90kD9+2pEYb8PS1jQlWk1Gs3xkQK7onseddP
         bfCw==
X-Forwarded-Encrypted: i=1; AL+hErFjUs9k1a6jLOp07zMK1UhZhJ6NWxT5IKiJkdA10GLguL9hG/AqGED8nKDcOFwrnYJ9sKyN@lists.linux.dev
X-Gm-Message-State: APuU4Z/RhVgVMlN8efng9+oD2Qu8B5/VRfkvzYgLDwLMRmfC9i7wcCf6
	Py4b8qLRVU7xaxK6oTdq/jSejEnLEzO1StEq9kt/xV8TGxLUvA8WkvrU
X-Gm-Gg: AZFdTZf/fDSjlmtOY41AzbleiSX2l141qy8s9FaM5T0yMvqlrn8G0C1UXBSxwIJ50F6
	DaJM4Jg/shpRLSmvP7pmriwZHpw8CDQvxeHNOMoSTYzrmBdA/p3o1MYloY9f/T0gJDcNNrUD8ZL
	2rf/PNJ5oZZbpn8rpRabZSd25402sQiiRp/7Q92+6D3yNQXMStWxU2q8Ikd9+jV//Gwfj5JXyTF
	4DFl/40YrHurJBL2TJQ4XRAG/xNFwOfavCc+87JpjmX6j8/d0I3QawBwkhKfDuMKVS7TdEI+AbA
	LH5S4NnGOiCvusj1vo+DQSzfy+b2rpjLY9OwgL0oUWRCxWGy2BNsViSXznVDQre9YmW/PXckKeR
	nG7eOX+g5UmCgSqaZl+KWsdkGUOotH7A7haOothfzFa+HwJltj7Cnzi5ZXa9OsCPoIwpCWhIUEN
	PesVyuBolp7m9tt8AlqsIZthsfHuStkI3wBmq7VhaY4iMpc/UfCLl5kQD4Ii+qnwvH041Q27YkP
	ckE5UfROaRPnpZmVIwky8AjPEDUyt97lL5CIoGBsPj3JzEEEiv7wMRvdbRc+uDLFhGOtA8sjMiG
	O/3NJQs249hd6ew4RY0XIg8pqe+hPxP1LUeymd3mSKUU/w==
X-Received: by 2002:a17:90b:268f:b0:3b0:d0c5:c110 with SMTP id 98e67ed59e1d1-3b41c95ce7fmr12327699a91.56.1795489178521;
        Mon, 23 Nov 2026 18:59:38 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm23558900a91.7.2026.11.23.18.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:59:37 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ernest.borowski.git@proton.me,
	liubaolin12138@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH v9] ntfs: trim the sizes after a short write
Date: Tue, 24 Nov 2026 10:59:32 +0800
Message-ID: <20261124025932.2360848-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_file_write_iter() moves the data size and, for a non-resident
uncompressed file, the initialized size to pos + count before the copy.
__ntfs_extend_initialized_size() only zeroes [old initialized size, pos),
so the range [pos, pos + count) is initialized only by the copy itself.
When iomap_file_buffered_write() copies less than count, it returns a
positive short count and the error rollback at out: does not run.  The
file keeps the size pos + count, and [pos + ret, pos + count) reads back
whatever the freed clusters held before, also after a remount.  A local
user can read the old contents of freed clusters this way.

Run the existing rollback for a short write as well, and roll the data
size back to the end of what was written, keeping the clusters that were
allocated on disk before the write, such as space reserved with
FALLOC_FL_KEEP_SIZE.  Keep the initialized size, as a page fault through
a shared mapping may rely on it while the write is stalled on its
source, and zero what the write did not reach, up to the end of the
block holding pos + count.  Only if that fails, take the initialized
size back to where the zeroing started, if it is above that.  A writer
killed during the copy also leaves a short write, but iomap_zero_range()
then fails with -EINTR, so zero from a worker when a fatal signal is
pending.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Co-developed-by: Ernest Borowski <ernest.borowski.git@proton.me>
Signed-off-by: Ernest Borowski <ernest.borowski.git@proton.me>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v9: for a writer killed during the copy, iomap_zero_range() fails with
-EINTR, and the fallback then took the initialized size back and lost
what was stored meanwhile through a shared mapping.  Zero from a worker
when a fatal signal is pending (Ernest).  Baolin's Reviewed-by on v8 is
not carried over, as this changes the code he reviewed.  After patch 6
of Ernest's delalloc series, ntfs_zero_range() makes the same call as
the new helper, so whichever of the two lands second can reuse the
other.
v8: when taking the data size back without truncating, mark the file
name dirty as ntfs_non_resident_attr_shrink() does.  If the inode was
written while the write waited on its source, the size in the directory
index otherwise stays at the extended value (Baolin).
v7: when taking the data size back, keep the clusters allocated on disk
before the write instead of truncating, which freed space reserved
with FALLOC_FL_KEEP_SIZE; a failed write already did so before this
patch (Hyunchul).  Holes and delayed allocations past the data size,
such as the preallocation of an earlier extending write, are freed as
before.  Baolin's Reviewed-by on v6 is not carried over, as this
changes the data size rollback he reviewed.
v6: cap that fallback at the current initialized size, which a failed
extension before the write can leave below pos (Baolin).
v5 (Baolin):
- start the zeroing at pos, not at the old initialized size, which
  overwrote data stored through a shared mapping below pos
- do the same for a direct write, instead of truncating the page cache
  and taking the initialized size back
- if the zeroing fails, take the initialized size back to where it
  started, instead of skipping both rollbacks
v4: for a buffered write, zero the unwritten range instead of
truncating the page cache and taking the initialized size back, which
dropped data stored through a shared mapping during the copy (Baolin).
v3: clear the cache up to EOF, not up to the extended initialized
size, which left the rest of the block holding pos + count (Baolin).
v2: also clear the cached tail of the last block, which v1 left in
place when the write stayed inside the old data size (Baolin).

v8: https://lore.kernel.org/all/20261120023504.4134966-1-zhanxusheng1024@gmail.com/
v7: https://lore.kernel.org/all/20261119022715.3636699-1-zhanxusheng1024@gmail.com/
v6: https://lore.kernel.org/all/20261117082021.2947603-1-zhanxusheng1024@gmail.com/
v5: https://lore.kernel.org/all/20261116091121.2547497-1-zhanxusheng1024@gmail.com/
v4: https://lore.kernel.org/all/20261113050148.1466682-1-zhanxusheng1024@gmail.com/
v3: https://lore.kernel.org/all/20261112093233.1118469-1-zhanxusheng1024@gmail.com/
v2: https://lore.kernel.org/all/20261112030815.982026-1-zhanxusheng1024@gmail.com/
v1: https://lore.kernel.org/all/20261111093459.660484-1-zhanxusheng1024@gmail.com/

v8 was tested in a VM on ntfs-next 4862a81576e3, with all free space
filled with a known pattern first.  Short buffered writes of 4M, old
data readable after drop_caches and after remount, 3 runs each:

                                    unfixed    v8
  fallocated, ends block-aligned    3137536    0
  fallocated, ends inside a block   3141332    0
  fallocated, unaligned start       3137536    0
  same, pos + count in that page    -          0
  append                            3137536    0

Marker stored through a shared mapping at 64K while pwritev() is
stalled on a userfaultfd source page, state after remount, with and
without fallocate():

                                          unfixed  v8
  buffered 4K at 128K, EFAULT             lost     kept
  O_DIRECT 12K at 0, EFAULT               lost     kept
  buffered 12K at 0, short 8192           kept     kept

1M reserved with FALLOC_FL_KEEP_SIZE, then a 12K write at 0, 512-byte
blocks after remount:

                                          unfixed  v8
  short, 8192 written                     2048     2048
  failed, EFAULT                          0        2048

A short write past 8K reserved this way frees what it allocated beyond
the 8K and keeps the 8K.  A store into [pos + ret, pos + count) itself
during the write is zeroed, as that range belongs to the write.  With
iomap_zero_range() failing (injected -ENOMEM), a 32K write to a 16K
file that returns 12288 leaves the size at 28K with no old data, also
after remount.

In the 8192 case above, with syncfs() while the write waits on its
source, the data size in the directory index after remount is 12288
with v7 and 8192 with v8.

fsx (buffered, no-mmap, O_DIRECT and mixed), compressed files,
fallocate, insert/collapse range and punch hole give the same results
with v8 as with v7.

A 32K pwritev() at 0 to a file with 1M fallocated, its copy stalled
on a userfaultfd source page after 16K.  A marker is stored at 512K
through a shared mapping, then the writer gets SIGKILL.  State after
remount:

                                         unfixed  v8     v9
  marker, 4K clusters                    kept     lost   kept
  marker, 64K clusters                   kept     lost   kept
  old data in [16K, 64K), 64K clusters   16384    0      0

The tests above give the same results with v9 as with v8, on
ntfs-next f674e4b6c315.  No lockdep or KASAN reports.
---
 fs/ntfs/attrib.c |  37 +++++++++++
 fs/ntfs/attrib.h |   1 +
 fs/ntfs/file.c   | 166 ++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 196 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 6ee6b6bcac1d..a941dd95dba6 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -2457,6 +2457,43 @@ int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size)
 	return err;
 }
 
+/*
+ * ntfs_attr_set_data_size - set the data size of a non-resident attribute
+ * without changing its allocation
+ *
+ * The caller holds mrec_lock.  @new_size must not be below the initialized
+ * size or above the allocated size.
+ */
+int ntfs_attr_set_data_size(struct ntfs_inode *ni, loff_t new_size)
+{
+	struct ntfs_attr_search_ctx *ctx;
+	struct ntfs_inode *base_ni = ntfs_base_inode(ni);
+	int err = 0;
+
+	if (!NInoNonResident(ni) || new_size < ni->initialized_size ||
+	    new_size > ni->allocated_size)
+		return -EINVAL;
+
+	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
+	if (!ctx)
+		return -ENOMEM;
+
+	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
+			       CASE_SENSITIVE, 0, NULL, 0, ctx);
+	if (err)
+		goto out_ctx;
+
+	ctx->attr->data.non_resident.data_size = cpu_to_le64(new_size);
+	ni->data_size = new_size;
+	/* Update data size in the index. */
+	if (ni->type == AT_DATA && ni->name == AT_UNNAMED)
+		NInoSetFileNameDirty(ni);
+	mark_mft_record_dirty(ctx->ntfs_ino);
+out_ctx:
+	ntfs_attr_put_search_ctx(ctx);
+	return err;
+}
+
 /*
  * ntfs_make_room_for_attr - make room for an attribute inside an mft record
  * @m:		mft record
diff --git a/fs/ntfs/attrib.h b/fs/ntfs/attrib.h
index 9d6bf0320219..0415f817dcf5 100644
--- a/fs/ntfs/attrib.h
+++ b/fs/ntfs/attrib.h
@@ -102,6 +102,7 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size);
 int ntfs_attr_set(struct ntfs_inode *ni, const s64 ofs, const s64 cnt,
 		const u8 val);
 int ntfs_attr_set_initialized_size(struct ntfs_inode *ni, loff_t new_size);
+int ntfs_attr_set_data_size(struct ntfs_inode *ni, loff_t new_size);
 int ntfs_attr_open(struct ntfs_inode *ni, const __le32 type,
 		__le16 *name, u32 name_len);
 void ntfs_attr_close(struct ntfs_inode *n);
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 7d93a520566e..f3bdc545951b 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -22,6 +22,7 @@
 #include <linux/overflow.h>
 #include <linux/security.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 #include <uapi/linux/ntfs.h>
 
 #include "lcnalloc.h"
@@ -843,6 +844,80 @@ static int ntfs_expand_for_write(struct ntfs_inode *ni, loff_t end)
 	return err;
 }
 
+/*
+ * End of the last run of clusters allocated on disk.  Holes and delayed
+ * allocations past it, such as the preallocation of an extending write,
+ * do not count.  Falls back to the allocated size if the runlist is not
+ * fully mapped.
+ */
+static loff_t ntfs_allocated_end_on_disk(struct ntfs_inode *ni)
+{
+	loff_t end = ni->allocated_size;
+	ssize_t i;
+
+	down_read(&ni->runlist.lock);
+	if (NInoFullyMapped(ni) && ni->runlist.rl) {
+		end = 0;
+		for (i = ni->runlist.count - 1; i >= 0; i--) {
+			struct runlist_element *rl = &ni->runlist.rl[i];
+
+			if (rl->length && rl->lcn >= 0) {
+				end = ntfs_cluster_to_bytes(ni->vol,
+						rl->vcn + rl->length);
+				break;
+			}
+		}
+	}
+	up_read(&ni->runlist.lock);
+	return end;
+}
+
+struct ntfs_zero_work {
+	struct work_struct work;
+	struct inode *inode;
+	loff_t pos;
+	loff_t len;
+	int err;
+};
+
+static void ntfs_zero_workfn(struct work_struct *work)
+{
+	struct ntfs_zero_work *zw = container_of(work, struct ntfs_zero_work,
+						 work);
+
+	zw->err = iomap_zero_range(zw->inode, zw->pos, zw->len, NULL,
+				   ntfs_seek_iomap_next, &ntfs_iomap_folio_ops,
+				   NULL);
+}
+
+/*
+ * iomap_zero_range() gives up with -EINTR when the caller has a fatal signal
+ * pending, and a writer killed during its copy is one whose short write must
+ * still be zeroed: zero from a worker then, which has no signal to see.  The
+ * caller holds the invalidate lock, which keeps page faults out meanwhile.
+ */
+static int ntfs_zero_range_unkillable(struct inode *inode, loff_t pos,
+				      loff_t len)
+{
+	struct ntfs_zero_work zw = { .inode = inode, .pos = pos, .len = len };
+	int err;
+
+	if (!fatal_signal_pending(current)) {
+		err = iomap_zero_range(inode, pos, len, NULL,
+				       ntfs_seek_iomap_next,
+				       &ntfs_iomap_folio_ops, NULL);
+		/* the signal may also come while it zeroes */
+		if (err != -EINTR || !fatal_signal_pending(current))
+			return err;
+	}
+
+	INIT_WORK_ONSTACK(&zw.work, ntfs_zero_workfn);
+	queue_work(system_unbound_wq, &zw.work);
+	flush_work(&zw.work);
+	destroy_work_on_stack(&zw.work);
+	return zw.err;
+}
+
 ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
@@ -853,7 +928,7 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	ssize_t count;
 	loff_t pos, end;
 	int err;
-	loff_t old_data_size, old_init_size;
+	loff_t old_data_size, old_init_size, old_alloc_size;
 
 	if (NVolShutdown(vol))
 		return -EIO;
@@ -901,6 +976,10 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
 	old_data_size = ni->data_size;
 	old_init_size = ni->initialized_size;
+	old_alloc_size = ni->allocated_size;
+	if (NInoNonResident(ni) && !NInoCompressed(ni) &&
+	    old_alloc_size > round_up(old_data_size, vol->cluster_size))
+		old_alloc_size = ntfs_allocated_end_on_disk(ni);
 
 	if (end > old_data_size) {
 		ret = ntfs_expand_for_write(ni, end);
@@ -928,10 +1007,21 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ret = iomap_file_buffered_write(iocb, from, ntfs_write_iomap_next,
 				&ntfs_iomap_folio_ops, NULL);
 out:
-	if (ret < 0 && ret != -EIOCBQUEUED) {
+	/*
+	 * Both sizes were moved to end before the copy, so a short write,
+	 * like a failed one, must take back what it did not write.
+	 */
+	if (ret < count && ret != -EIOCBQUEUED) {
+		loff_t new_init_size = old_init_size;
+		loff_t new_data_size = old_data_size;
 		int init_err = 0;
 		int data_err = 0;
 
+		if (ret > 0) {
+			new_init_size = max(old_init_size, pos + ret);
+			new_data_size = max(old_data_size, pos + ret);
+		}
+
 		/*
 		 * Like ntfs_setattr_size(): __ntfs_attr_truncate_vfs()
 		 * expects the invalidate lock held across the size
@@ -939,14 +1029,57 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 */
 		filemap_invalidate_lock(vi->i_mapping);
 
+		/*
+		 * A page fault through a shared mapping may have used the
+		 * extended initialized size while the write was stalled on
+		 * its source, so keep that size and zero what the write did
+		 * not reach instead.  [old_init_size, pos) was zeroed before
+		 * the write.  Past end, zero the rest of the block that a
+		 * buffered copy may have read from disk, unless such a fault
+		 * already moved the initialized size past end and zeroed it.
+		 */
+		if (NInoNonResident(ni) && !NInoCompressed(ni) &&
+		    ni->initialized_size > new_init_size) {
+			loff_t zstart = max(pos, new_init_size);
+			loff_t zend = ni->initialized_size > end ? end :
+				      round_up(end, i_blocksize(vi));
+			int err = 0;
+
+			zend = min(zend, new_data_size);
+			if (zend > zstart) {
+				err = ntfs_zero_range_unkillable(vi, zstart,
+								 zend - zstart);
+				/* A direct read must not see the old blocks. */
+				if (!err && iocb->ki_flags & IOCB_DIRECT)
+					err = filemap_write_and_wait_range(
+						vi->i_mapping, zstart, zend - 1);
+			}
+			if (!err)
+				new_init_size = min(ni->initialized_size,
+						    new_data_size);
+			else
+				new_init_size = min3(ni->initialized_size,
+						     zstart, new_data_size);
+		}
+
 		/* ntfs_attr_set_initialized_size() rejects a resident one. */
-		if (ni->initialized_size != old_init_size &&
+		if (ni->initialized_size != new_init_size &&
 		    NInoNonResident(ni)) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
+			/*
+			 * Only reached when the zeroing above failed or did
+			 * not apply.  Drop what was cached past the new
+			 * initialized size, as __ntfs_extend_initialized_size()
+			 * does.
+			 */
+			if (ni->initialized_size > new_init_size)
+				truncate_pagecache_range(vi, new_init_size,
+						max_t(loff_t, i_size_read(vi),
+						      ni->initialized_size) - 1);
 			mutex_lock(&mrec_ni->mrec_lock);
 			init_err = ntfs_attr_set_initialized_size(ni,
-					old_init_size);
+					new_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 		/*
@@ -955,13 +1088,30 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 * the uninitialized tail, so skip it unless the rollback
 		 * above restored that size.
 		 */
-		if (ni->data_size != old_data_size && !init_err) {
+		if (ni->data_size != new_data_size && !init_err) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
-			truncate_setsize(vi, old_data_size);
+			truncate_setsize(vi, new_data_size);
 			mutex_lock(&mrec_ni->mrec_lock);
-			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
-					old_data_size);
+			if (NInoNonResident(ni) && !NInoCompressed(ni)) {
+				/*
+				 * Only free what the write allocated, not
+				 * clusters that were there before, such as
+				 * space reserved with FALLOC_FL_KEEP_SIZE.
+				 */
+				loff_t keep = max(new_data_size,
+						  old_alloc_size);
+
+				if (ni->allocated_size > keep)
+					data_err = __ntfs_attr_truncate_vfs(ni,
+							keep, keep);
+				if (!data_err && ni->data_size != new_data_size)
+					data_err = ntfs_attr_set_data_size(ni,
+							new_data_size);
+			} else {
+				data_err = __ntfs_attr_truncate_vfs(ni,
+						new_data_size, new_data_size);
+			}
 			mutex_unlock(&mrec_ni->mrec_lock);
 			/* Like ntfs_setattr_size(): stay on the durable size. */
 			if (data_err)
-- 
2.43.0

