Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742113CF210
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 22:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808744; cv=none; b=saVbyxP5/1kTnE8+DG6TVpOEWfwvrDla9IhNp5Uc4qEXDbqW07Qj1StardBf2pYkbZ6Oozkx9mKxBumd8LBqw4sE5uAzG22PUtLCPkxoHY5SrW06LzlBJSI7QSZP22rcNa8TPBv9sf1iUFbnBU5/e2+dNiileXLO2y5qSkGQGzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808744; c=relaxed/simple;
	bh=MELZeuBmW3rify0LIQO8aGAeMbBQQwVmhdCmA+x0kHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/dMOxAwsP93wSyb2C9sUxeeAYww5XVxHiexDTQsn+bkH0pz1+Y3jXSA3Ir2tuY/5VEU33ttS5vKXJZfmaxbNHvo2uH8tKEatDvC0EN+E/B9iEQrwtNRc5Bw5PXVU96qYV/gRE70UdkHU9xTvu6vfW66Hse70lydC+5mvW8nacY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oclo6o3C; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oclo6o3C"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so43396215e9.1
        for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 15:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790808739; x=1791413539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+coA7ONvSb0kjsMGwQhJceXFIHQW3C59Fm4WJPGyAA=;
        b=oclo6o3CwhBzPCjw85xSnCYyfuxQ0O6wttd1IVwwHDFCBHv2MTTlMsFhH77E43pyI8
         E2chcJ77AdSXv56j5fqzSnfSMZMfahtdmNka/RyH0eW0XvnHyulpvLrwtgNe6+Oxl2yj
         Dh+xCpfYWVwhgnpjm3rGnxFZLtYIWi1GVZMJ3qzm+GVAKEUFts/51l5zdafYlqeudWsf
         LPUyn2zXF0hpGuKFQMZTYG7y4LQTWwzHpCByj8gdbgbNGas9gYiURh2tBwrlClbrqnA0
         2BDoRjN6SKo3VvDaVoCUdL/tdZdPwsmXDLELwrS6QtcuA9ouYQFbMZH4umr6QvRMsuy1
         663Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790808739; x=1791413539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x+coA7ONvSb0kjsMGwQhJceXFIHQW3C59Fm4WJPGyAA=;
        b=Y+jBrnCf/QJ2hb+WzBSfYKrBhhtf2RZ5JwawM2Hb6XClQqhDtrrLA+XTn0rjTvUOZr
         nxK/13SPNoQ/tJEdm+0Z1c5yp/1kslNKjzI22Yamn+Aru6rN7EcPi2iPy5BUb72OHwkt
         9CiwRKVO50zDZJVSgeuGJ0B4Tauss1B1LjUW7x5ZqtZrgRcoKFxIY+UBpzsqD5IpSr7x
         mQDNJLFfALzt9yUjDvCKhsGgoSu4A018uFbB2oxnbit8t2zwi78yMfMjjZLu303w6sDj
         l8JPQDt+8h5ps8xnJpeVKu0rrMDCfXp/qi6QypPh5rBDIcx1MZKXSh7MDYgu6H9e3po0
         74Nw==
X-Gm-Message-State: AFuF++nTbnPoXsQRYOZs+lmlw2Jrov+FNydECClqn0IAP74mxgtn5lLX
	NNyTx0l8s6icsN1OPMEOckutY7T3yZCnix0GKHI5JEEiiLCt4uhqo6PkS/onKJBN
X-Gm-Gg: AYBFou1tHkO1RPa//tdeyTz1pwOHpGu2v+oQd7GqflWFF+QM7yo7+XwCDNwCJG84iN4
	9stnRPJf4kpEo3Lo/xPF/4TnDEAeJNOC0xuuorZz0kISysCEAlzP1BGxNjfWoOklpICIThbS4KJ
	R3+T35kl5ZdUmhfxGYh0SLeLFwFsIbc5v/yi+U0VvOKYZNotpeUr0RJ8w5tTVVjGDPY+27rX928
	05mIJrjLHNMn4AzYo0uFj4lPCkQnnPVtp56yMVvmVAajmpCdNI5KuBLUPVJB1jrwZGV6n0yQz8m
	bCwdY2nRLCvAA4z/rQRMlV6hV7pX5uqZ7QBUqIXo/a0ZyfHCkMzpn63cmlh2/pSgxIdYUQmprvP
	S6wIqMUt0fGOOgLw/8NBdHIQMVzd3XzlMbmK9nVImNfI4j7QcFMqI0XrNcZpy70SlFXkQimeFzB
	rSJkaP6aUVj+SLxwhgLMPPHSCM/3BLIwPC1Jb/+9wEMglY/5jMeOVPORBNV/CUfVInKKhTzfNoT
	BS5jktj3Y+nDSZj1Lwi8lEd
X-Received: by 2002:a05:600c:4fc5:b0:4a0:ca3:15a2 with SMTP id 5b1f17b1804b1-4a01b00c138mr49383145e9.20.1790808738987;
        Wed, 30 Sep 2026 15:52:18 -0700 (PDT)
Received: from localhost.localdomain ([87.68.170.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9096e8sm18782615e9.3.2026.09.30.15.52.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 15:52:18 -0700 (PDT)
From: Mark Eiger <eigermark8@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	Mark Eiger <eigermark8@gmail.com>
Subject: [PATCH v2] ntfs: write a clean LogFile on unmount and remount read-only
Date: Thu,  1 Oct 2026 01:52:13 +0300
Message-ID: <20260930225213.53315-1-eigermark8@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <arzJaqJbyue5sjIO@hyunchul-PC02>
References: <arzJaqJbyue5sjIO@hyunchul-PC02>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a volume is mounted read-write, ntfs_empty_logfile() fills the
LogFile with 0xff bytes, and nothing writes a valid journal back later.
Windows treats such a LogFile as uninitialized and has to write a new
restart area before it can mount the volume.  On write protected media
that write fails, and Windows refuses the volume with "The media is
write protected".  This hits every NTFS drive that was last written by
Linux when it is examined behind a forensic hardware write blocker, or
with the Windows USB WriteProtect policy set.  Plugging the drive into an
unprotected Windows system once makes it work again, but modifies it.

Leave the LogFile the way Windows does after a clean dismount instead:
two identical LFS 1.1 restart pages with RESTART_VOLUME_IS_CLEAN set and
a single "NTFS" client whose restart record is an empty checkpoint, so
there is nothing to redo or undo.  The checkpoint follows a no-op record
in the first log record page, which is also stored in both tail copies.
The log record pages are written and flushed before the restart pages
that refer to them.

This is done on unmount, after the volume has been marked clean on disk,
and on remount read-only unless the remount is forced, as writers may
still be modifying metadata then.  Nothing is written if the volume has
errors or Windows is hibernated on it.

The sectors are written with bios rather than through the block device
page cache: with clusters smaller than a page, a cached page of the block
device can also hold $MFTMirr sectors updated since through the $MFTMirr
inode, and writing it back reverts them.  This was observed on a volume
with 512 byte clusters, where $LogFile directly follows $MFTMirr.

LSNs continue from the restart area found at mount time.  If the LogFile
was already empty then, they start at sequence number 2, as Windows does
itself when it finds an empty LogFile.  A few fields of the checkpoint
past the documented tables are filled in the way Windows fills them.

Assisted-by: LLM sparse
Signed-off-by: Mark Eiger <eigermark8@gmail.com>
---
Hi Hyunchul,

Thank you for the review.  v2 drops the scan, so unmount and remount
read-only no longer depend on the size of the mft.

Instead of a high LSN, I went with what Windows itself does when it
finds an empty LogFile: it starts over at sequence number 2 and doesn't
look at the LSNs in the metadata.  On my test stick, Windows had used
LSNs up to 0x2002ab0 before Linux emptied the LogFile, and afterwards
it restarted at 0x2000808, below them.  So without this patch, Windows
would pick the same LSNs on such a volume anyway, and v2 behaves no
differently from what Windows does today.  I preferred that to a high
value that Windows itself has never been seen to use, but if you'd
rather have a fixed high sequence number, I'm happy to change it.

Starting below LSNs that are already on disk felt a little wrong to me
at first, but it is what Windows itself does, so matching it seemed the
safest choice.  I retested it on the same hardware, and Windows still
mounts the stick with WriteProtect set.

Changes in v2:
- Drop the scan of all mft records for the highest LSN, as suggested by
  Hyunchul Lee.  When the LogFile was already empty at mount time, start
  at LSN sequence number 2 instead (CLEAN_LOG_FIRST_SEQ).  This is what
  Windows does itself when it finds an empty LogFile: it starts at
  sequence number 2 without looking at the LSNs in the metadata.  On the
  test stick, whose LogFile had been emptied by ntfs3, Windows' first log
  record after its reinitialization was at LSN 0x2000808; v2 writes its
  clean LogFile at the same LSN.
- Retested as below.

Tested:
- Real hardware: x86_64 laptop running v7.2.5 with this change backported,
  SanDisk USB stick (NTFS, 4 KiB clusters, no partition table).  With the
  stock driver, after a read-write mount and eject, Windows 11 25H2 (build
  26200.9457) with the USB WriteProtect policy refuses the stick with "The
  media is write protected"; with this change it mounts it, and the files
  written on Linux are there.
- ntfs-next with this patch in an arm64 VM, loop devices, volumes of
  300 MB to 2 TB with 512 byte, 4 KiB and 64 KiB clusters: the LogFile is
  clean after unmount and after remount read-only, emptied again by
  remount read-write, a read-only mount changes nothing, LSNs continue
  across mounts, and both this driver and ntfs3 accept the result.  The
  written pages match those Windows writes on a clean dismount, apart
  from LSNs, update sequence numbers and the open count.
- checkpatch.pl --strict, W=1 and sparse (C=2): no new warnings.

This patch was written with an AI coding assistant (Claude, by
Anthropic, in Claude Code), following my analysis of the problem: the
on-disk format was worked out by comparing $LogFile dumps from Windows
before and after a clean dismount and from this driver.  I have reviewed
it and tested it as described above.

Mark

 fs/ntfs/logfile.c | 318 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/ntfs/logfile.h |  92 ++++++++++++++
 fs/ntfs/super.c   |  27 +++-
 fs/ntfs/volume.h  |   5 +
 4 files changed, 438 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index 1404664da..2ccbd79d2 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -6,6 +6,8 @@
  */
 
 #include <linux/blkdev.h>
+#include <linux/log2.h>
+#include <linux/random.h>
 
 #include "attrib.h"
 #include "logfile.h"
@@ -778,3 +780,319 @@ bool ntfs_empty_logfile(struct inode *log_vi)
 			-err);
 	return false;
 }
+
+/*
+ * Layout of the clean LogFile written by ntfs_write_clean_logfile(), in
+ * DefaultLogPageSize pages: two restart pages, the two tail copies of the
+ * last log record page and the first log record page itself.  Offsets and
+ * the NTFS client's no-op record are laid out the way Windows writes them.
+ */
+#define CLEAN_LOG_RSTR_PAGES		2
+#define CLEAN_LOG_FIRST_RCRD_PAGE	4
+#define CLEAN_LOG_PAGES			5
+#define CLEAN_LOG_CLIENT_ARRAY_OFFSET	0x40
+#define CLEAN_LOG_DATA_OFFSET		0x40
+#define CLEAN_LOG_NOOP_DATA_LENGTH	0x38
+#define CLEAN_LOG_NOOP_TRANSACTION_ID	0x18
+#define CLEAN_LOG_USA_COUNT		(DefaultLogPageSize / NTFS_BLOCK_SIZE + 1)
+/*
+ * LSN sequence number to start at if the LogFile was already empty at mount
+ * time.  Windows starts at the same one when it finds an empty LogFile.
+ */
+#define CLEAN_LOG_FIRST_SEQ		2
+
+static_assert(sizeof(struct restart_page_header) == 0x1e);
+static_assert(sizeof(struct restart_area) == 0x30);
+static_assert(sizeof(struct log_client_record) == 0xa0);
+static_assert(sizeof(struct record_page_header) == 0x28);
+static_assert(sizeof(struct log_record_header) == 0x30);
+static_assert(sizeof(struct ntfs_restart_record) == 0x70);
+
+/*
+ * ntfs_write_logfile - write a buffer to the LogFile, bypassing the page cache
+ * @log_vi:	struct inode of the LogFile
+ * @buf:	data to write, not vmalloc()ed
+ * @pos:	sector aligned byte offset in the LogFile
+ * @len:	number of bytes to write, a multiple of the sector size
+ *
+ * Write the sectors directly with bios, one cluster at a time.  Going through
+ * the block device page cache like ntfs_empty_logfile() does is not safe once
+ * the volume has been in use: with clusters smaller than a page, a cached page
+ * of the block device can also hold $MFTMirr sectors that have since been
+ * updated through the $MFTMirr inode, and writing that page back would revert
+ * them.  Any cached copy of the written sectors is dropped afterwards.
+ *
+ * Return 0 on success and a negative error code on error.
+ */
+static int ntfs_write_logfile(struct inode *log_vi, const u8 *buf, s64 pos,
+		u32 len)
+{
+	struct ntfs_inode *log_ni = NTFS_I(log_vi);
+	struct ntfs_volume *vol = log_ni->vol;
+	struct block_device *bdev = vol->sb->s_bdev;
+	const s64 end = pos + len;
+	int err = 0;
+
+	down_read(&log_ni->runlist.lock);
+	while (pos < end) {
+		s64 lcn = ntfs_attr_vcn_to_lcn_nolock(log_ni,
+				pos >> vol->cluster_size_bits, false);
+		u32 ofs = pos & vol->cluster_size_mask;
+		u32 bytes = min_t(s64, end - pos, vol->cluster_size - ofs);
+		loff_t start, last;
+
+		/* The LogFile is never sparse, so a hole is an error, too. */
+		if (lcn < 0) {
+			err = lcn == LCN_ENOMEM ? -ENOMEM : -EIO;
+			break;
+		}
+		start = NTFS_CLU_TO_B(vol, lcn) + ofs;
+		last = start + bytes - 1;
+		/* Do not let dirty cached data overwrite ours later. */
+		err = filemap_write_and_wait_range(bdev->bd_mapping, start, last);
+		if (!err)
+			err = bdev_rw_virt(bdev, start >> SECTOR_SHIFT, (void *)buf,
+					bytes, REQ_OP_WRITE | REQ_META | REQ_SYNC);
+		if (err)
+			break;
+		invalidate_mapping_pages(bdev->bd_mapping, start >> PAGE_SHIFT,
+				last >> PAGE_SHIFT);
+		buf += bytes;
+		pos += bytes;
+	}
+	up_read(&log_ni->runlist.lock);
+	return err;
+}
+
+/* Set up the multi sector transfer protection header of a LogFile page. */
+static void ntfs_init_log_page(u8 *page, __le32 magic, u16 usa_ofs)
+{
+	struct ntfs_record *r = (struct ntfs_record *)page;
+
+	r->magic = magic;
+	r->usa_ofs = cpu_to_le16(usa_ofs);
+	r->usa_count = cpu_to_le16(CLEAN_LOG_USA_COUNT);
+	/* Initial update sequence number, pre_write_mst_fixup() bumps it. */
+	*(__le16 *)(page + usa_ofs) = cpu_to_le16(get_random_u16());
+}
+
+/* Fill in a restart page whose single client restarts at @restart_lsn. */
+static void ntfs_init_restart_page(u8 *page, u64 file_size, u32 seq_bits,
+		u64 oldest_lsn, u64 restart_lsn)
+{
+	struct restart_page_header *rph = (struct restart_page_header *)page;
+	u16 ra_ofs = ALIGN(sizeof(*rph) + 2 * CLEAN_LOG_USA_COUNT, 8);
+	struct restart_area *ra = (struct restart_area *)(page + ra_ofs);
+	struct log_client_record *cr = (struct log_client_record *)
+			((u8 *)ra + CLEAN_LOG_CLIENT_ARRAY_OFFSET);
+	static const char name[] = "NTFS";
+	int i;
+
+	ntfs_init_log_page(page, magic_RSTR, sizeof(*rph));
+	rph->system_page_size = cpu_to_le32(DefaultLogPageSize);
+	rph->log_page_size = cpu_to_le32(DefaultLogPageSize);
+	rph->restart_area_offset = cpu_to_le16(ra_ofs);
+	rph->minor_ver = cpu_to_le16(1);
+	rph->major_ver = cpu_to_le16(1);
+
+	ra->current_lsn = cpu_to_le64(restart_lsn);
+	ra->log_clients = cpu_to_le16(1);
+	ra->client_free_list = LOGFILE_NO_CLIENT;
+	ra->client_in_use_list = 0;
+	ra->flags = RESTART_VOLUME_IS_CLEAN;
+	ra->seq_number_bits = cpu_to_le32(seq_bits);
+	ra->restart_area_length = cpu_to_le16(CLEAN_LOG_CLIENT_ARRAY_OFFSET +
+			sizeof(*cr));
+	ra->client_array_offset = cpu_to_le16(CLEAN_LOG_CLIENT_ARRAY_OFFSET);
+	ra->file_size = cpu_to_le64(file_size);
+	ra->last_lsn_data_length =
+			cpu_to_le32(sizeof(struct ntfs_restart_record));
+	ra->log_record_header_length =
+			cpu_to_le16(sizeof(struct log_record_header));
+	ra->log_page_data_offset = cpu_to_le16(CLEAN_LOG_DATA_OFFSET);
+	ra->restart_log_open_count = cpu_to_le32(get_random_u32());
+
+	cr->oldest_lsn = cpu_to_le64(oldest_lsn);
+	cr->client_restart_lsn = cpu_to_le64(restart_lsn);
+	cr->prev_client = LOGFILE_NO_CLIENT;
+	cr->next_client = LOGFILE_NO_CLIENT;
+	cr->client_name_length = cpu_to_le32((sizeof(name) - 1) * sizeof(__le16));
+	for (i = 0; i < sizeof(name) - 1; i++)
+		cr->client_name[i] = cpu_to_le16(name[i]);
+}
+
+/* Append a log record to @p (zeroed memory) and return the end of it. */
+static u8 *ntfs_add_log_record(u8 *p, u64 lsn, __le32 type, u32 transaction_id,
+		const void *data, u32 data_len)
+{
+	struct log_record_header *lrh = (struct log_record_header *)p;
+
+	lrh->this_lsn = cpu_to_le64(lsn);
+	lrh->client_data_length = cpu_to_le32(data_len);
+	lrh->record_type = type;
+	lrh->transaction_id = cpu_to_le32(transaction_id);
+	if (data)
+		memcpy(p + sizeof(*lrh), data, data_len);
+	return p + sizeof(*lrh) + ALIGN(data_len, 8);
+}
+
+/*
+ * Fill in a log record page holding @records.  @copy is the LSN of the last
+ * record on the page, or for a tail copy the LogFile offset of the page.
+ */
+static void ntfs_init_record_page(u8 *page, u64 copy, u64 last_end_lsn,
+		const u8 *records, u32 records_len)
+{
+	struct record_page_header *rph = (struct record_page_header *)page;
+	u16 usa_end = sizeof(*rph) + 2 * CLEAN_LOG_USA_COUNT;
+
+	ntfs_init_log_page(page, magic_RCRD, sizeof(*rph));
+	rph->copy.last_lsn = cpu_to_le64(copy);
+	rph->flags = LOG_PAGE_LOG_RECORD_END;
+	rph->page_count = cpu_to_le16(1);
+	rph->page_position = cpu_to_le16(1);
+	rph->next_record_offset = cpu_to_le16(CLEAN_LOG_DATA_OFFSET +
+			records_len);
+	/* Windows fills the unused header bytes with 0xff. */
+	memset(rph->reserved, 0xff, sizeof(rph->reserved));
+	memset(page + usa_end, 0xff, CLEAN_LOG_DATA_OFFSET - usa_end);
+	rph->last_end_lsn = cpu_to_le64(last_end_lsn);
+	memcpy(page + CLEAN_LOG_DATA_OFFSET, records, records_len);
+}
+
+/*
+ * ntfs_write_clean_logfile - write a clean journal to an emptied LogFile
+ * @log_vi:	struct inode of the loaded journal LogFile
+ *
+ * ntfs_empty_logfile() fills the LogFile with 0xff bytes when the volume is
+ * mounted read-write.  Windows treats such a LogFile as uninitialized and
+ * has to write a new restart area before it can mount the volume.  On
+ * write protected media, e.g. behind a forensic write blocker, that write
+ * fails and Windows refuses the volume with "The media is write protected".
+ *
+ * Write what Windows itself leaves behind on a clean dismount instead: two
+ * identical LFS 1.1 restart pages with RESTART_VOLUME_IS_CLEAN set and one
+ * "NTFS" client whose restart record is an empty checkpoint, i.e. there is
+ * nothing to redo or undo.  The checkpoint follows a no-op record in the first
+ * log record page, which is also stored in both tail copies.  The log record
+ * pages are written before the restart pages that refer to them.
+ *
+ * Only call this once all metadata has been written, on umount or remount
+ * read-only.  Failing is not fatal: the volume stays consistent and Windows
+ * reinitializes the LogFile, as it had to before.
+ *
+ * Return 'true' on success or if the LogFile was not emptied, 'false' on error.
+ */
+bool ntfs_write_clean_logfile(struct inode *log_vi)
+{
+	struct ntfs_volume *vol = NTFS_I(log_vi)->vol;
+	struct block_device *bdev = vol->sb->s_bdev;
+	const u32 ps = DefaultLogPageSize;
+	u8 records[2 * sizeof(struct log_record_header) +
+		   CLEAN_LOG_NOOP_DATA_LENGTH +
+		   sizeof(struct ntfs_restart_record)] = {};
+	struct ntfs_restart_record rr = {};
+	u64 size, seq, noop_lsn, restart_lsn;
+	u32 seq_bits, file_bits, noop_len;
+	u8 *buf, *end;
+	int i, err;
+
+	/* Never write to a volume Windows is hibernated on. */
+	if (!NVolLogFileEmpty(vol) || NVolHibernated(vol))
+		return true;
+
+	size = min_t(u64, i_size_read(log_vi), MaxLogFileSize) & ~(u64)(ps - 1);
+	if (size < (u64)(CLEAN_LOG_RSTR_PAGES + MinLogRecordPages) * ps) {
+		err = -EINVAL;
+		goto err_out;
+	}
+
+	/*
+	 * An LSN is the sequence number shifted left by file_bits, or'ed with
+	 * the LogFile offset of the record divided by 8.  Continue the restart
+	 * area found at mount time.  Otherwise calculate the parameters as
+	 * described for struct restart_area: seq_number_bits is 67 minus the
+	 * number of bits needed to store the LogFile size.
+	 */
+	seq_bits = vol->logfile_seq_bits;
+	file_bits = 64 - seq_bits;
+	if (!vol->logfile_lsn || seq_bits < 16 || file_bits > 48 ||
+	    (size >> 3) > BIT_ULL(file_bits)) {
+		seq_bits = 67 - (ilog2(size) + 1);
+		file_bits = 64 - seq_bits;
+	}
+	if (vol->logfile_lsn)
+		seq = (vol->logfile_lsn >> file_bits) + 1;
+	else
+		seq = CLEAN_LOG_FIRST_SEQ;
+	/* LSNs are signed 64-bit numbers. */
+	if (seq >= BIT_ULL(seq_bits - 1))
+		seq = 1;
+
+	noop_len = sizeof(struct log_record_header) + CLEAN_LOG_NOOP_DATA_LENGTH;
+	noop_lsn = seq << file_bits |
+		   (CLEAN_LOG_FIRST_RCRD_PAGE * ps + CLEAN_LOG_DATA_OFFSET) >> 3;
+	restart_lsn = noop_lsn + (noop_len >> 3);
+
+	/*
+	 * The empty checkpoint.  The fields past the tables are not documented;
+	 * fill them in the way Windows does.
+	 */
+	rr.major_ver = cpu_to_le32(1);
+	rr.checkpoint_start_lsn = cpu_to_le64(noop_lsn);
+	rr.previous_seq_lsn = cpu_to_le64((seq - 1) << file_bits);
+	rr.bytes_per_cluster = cpu_to_le32(vol->cluster_size);
+	rr.last_lsn = cpu_to_le64(noop_lsn);
+	end = ntfs_add_log_record(records, noop_lsn, LOG_RECORD_CLIENT_RECORD,
+			CLEAN_LOG_NOOP_TRANSACTION_ID, NULL,
+			CLEAN_LOG_NOOP_DATA_LENGTH);
+	end = ntfs_add_log_record(end, restart_lsn, LOG_RECORD_CLIENT_RESTART, 0,
+			&rr, sizeof(rr));
+
+	buf = kzalloc(CLEAN_LOG_PAGES * ps, GFP_NOFS);
+	if (!buf) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+	ntfs_init_restart_page(buf, size, seq_bits, noop_lsn, restart_lsn);
+	memcpy(buf + ps, buf, ps);
+	/* Newer tail copy with both records, older one with the no-op only. */
+	ntfs_init_record_page(buf + 2 * ps, CLEAN_LOG_FIRST_RCRD_PAGE * ps,
+			restart_lsn, records, end - records);
+	ntfs_init_record_page(buf + 3 * ps, CLEAN_LOG_FIRST_RCRD_PAGE * ps,
+			noop_lsn, records, noop_len);
+	ntfs_init_record_page(buf + 4 * ps, restart_lsn, restart_lsn,
+			records, end - records);
+	for (i = 0; i < CLEAN_LOG_PAGES; i++) {
+		err = pre_write_mst_fixup((struct ntfs_record *)(buf + i * ps), ps);
+		if (err)
+			goto free_err_out;
+	}
+
+	err = ntfs_write_logfile(log_vi, buf + CLEAN_LOG_RSTR_PAGES * ps,
+			CLEAN_LOG_RSTR_PAGES * ps,
+			(CLEAN_LOG_PAGES - CLEAN_LOG_RSTR_PAGES) * ps);
+	if (!err)
+		err = blkdev_issue_flush(bdev);
+	if (!err)
+		err = ntfs_write_logfile(log_vi, buf, 0, CLEAN_LOG_RSTR_PAGES * ps);
+	if (!err)
+		err = blkdev_issue_flush(bdev);
+	if (err)
+		goto free_err_out;
+	kfree(buf);
+
+	vol->logfile_lsn = restart_lsn;
+	vol->logfile_seq_bits = seq_bits;
+	NVolClearLogFileEmpty(vol);
+	ntfs_debug("Done, restart LSN 0x%llx.", restart_lsn);
+	return true;
+
+free_err_out:
+	kfree(buf);
+err_out:
+	ntfs_warning(vol->sb,
+		"Failed to write a clean LogFile (error %d).  Windows may be unable to mount the volume read-only.",
+		err);
+	return false;
+}
diff --git a/fs/ntfs/logfile.h b/fs/ntfs/logfile.h
index dadb56fd0..960f6c383 100644
--- a/fs/ntfs/logfile.h
+++ b/fs/ntfs/logfile.h
@@ -239,7 +239,99 @@ struct log_client_record {
 	__le16 client_name[64];
 } __packed;
 
+/*
+ * Log record page header ("RCRD"), followed by the update sequence array.
+ * @copy.last_lsn: In a log record page, the LSN of the last log record
+ *   that starts on this page.
+ * @copy.file_offset: In a tail copy of a log record page (the two pages
+ *   following the restart pages), the LogFile offset of the page it is a
+ *   copy of.
+ * @flags: LOG_PAGE_LOG_RECORD_END if a log record ends on this page.
+ * @page_count: Number of pages written together with this one.
+ * @page_position: Position of this page in that group, starting at 1.
+ * @next_record_offset: Offset of the first free byte in this page.
+ * @last_end_lsn: LSN of the last log record that ends on this page.
+ */
+struct record_page_header {
+	__le32 magic;
+	__le16 usa_ofs;
+	__le16 usa_count;
+	union {
+		__le64 last_lsn;
+		__le64 file_offset;
+	} __packed copy;
+	__le32 flags;
+	__le16 page_count;
+	__le16 page_position;
+	__le16 next_record_offset;
+	u8 reserved[6];
+	__le64 last_end_lsn;
+} __packed;
+
+#define LOG_PAGE_LOG_RECORD_END	cpu_to_le32(0x00000001)
+
+/*
+ * Log record header.  The client data follows immediately.
+ * @this_lsn: LSN of this log record.
+ * @client_previous_lsn: Previous LSN of the same transaction, or 0.
+ * @client_undo_next_lsn: Next LSN to undo in the same transaction, or 0.
+ * @client_data_length: Length of the client data following this header.
+ * @client_seq_number: Sequence number of the client that wrote the record.
+ * @client_index: Index of that client in the restart area's client array.
+ * @record_type: LOG_RECORD_CLIENT_RECORD or LOG_RECORD_CLIENT_RESTART.
+ * @transaction_id: Transaction this record belongs to.
+ * @flags: Bit 0 set if the record continues on the next page.
+ */
+struct log_record_header {
+	__le64 this_lsn;
+	__le64 client_previous_lsn;
+	__le64 client_undo_next_lsn;
+	__le32 client_data_length;
+	__le16 client_seq_number;
+	__le16 client_index;
+	__le32 record_type;
+	__le32 transaction_id;
+	__le16 flags;
+	u8 reserved[6];
+} __packed;
+
+enum {
+	LOG_RECORD_CLIENT_RECORD	= cpu_to_le32(1),
+	LOG_RECORD_CLIENT_RESTART	= cpu_to_le32(2),
+};
+
+/*
+ * Client data of the NTFS client's restart record (the checkpoint).  The
+ * table LSN and length fields locate the open attribute, attribute name,
+ * dirty page and transaction tables written before the checkpoint.  All zero
+ * means that nothing needs to be redone or undone.
+ * @checkpoint_start_lsn: LSN where the checkpoint started.
+ * @previous_seq_lsn, @bytes_per_cluster, @last_lsn: Not documented; named
+ *   after the values Windows 10/11 was observed to write there on a clean
+ *   dismount (the first LSN of the previous sequence number, the cluster
+ *   size and @checkpoint_start_lsn again).
+ */
+struct ntfs_restart_record {
+	__le32 major_ver;
+	__le32 minor_ver;
+	__le64 checkpoint_start_lsn;
+	__le64 open_attr_table_lsn;
+	__le64 attr_names_lsn;
+	__le64 dirty_page_table_lsn;
+	__le64 transaction_table_lsn;
+	__le32 open_attr_table_length;
+	__le32 attr_names_length;
+	__le32 dirty_page_table_length;
+	__le32 transaction_table_length;
+	__le64 reserved1;
+	__le64 previous_seq_lsn;
+	__le32 bytes_per_cluster;
+	u8 reserved2[20];
+	__le64 last_lsn;
+} __packed;
+
 bool ntfs_check_logfile(struct inode *log_vi,
 		struct restart_page_header **rp);
 bool ntfs_empty_logfile(struct inode *log_vi);
+bool ntfs_write_clean_logfile(struct inode *log_vi);
 #endif /* _LINUX_NTFS_LOGFILE_H */
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 716ba775f..02e1c001e 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -381,6 +381,14 @@ static int ntfs_reconfigure(struct fs_context *fc)
 				return err;
 			}
 		}
+		/*
+		 * Leave a clean LogFile behind, so that Windows can mount the
+		 * volume without writing to it.  Not after a forced remount:
+		 * writers in progress may still be modifying metadata.
+		 */
+		if (!(fc->sb_flags & SB_FORCE) && !NVolErrors(vol) &&
+		    vol->logfile_ino)
+			ntfs_write_clean_logfile(vol->logfile_ino);
 	}
 
 	ntfs_debug("Done.");
@@ -1729,6 +1737,13 @@ static bool load_system_files(struct ntfs_volume *vol)
 			ntfs_error(sb, "Failed to load LogFile. Mounting read-only.");
 		}
 		NVolSetErrors(vol);
+	} else if (rp) {
+		struct restart_area *ra = (struct restart_area *)((u8 *)rp +
+				le16_to_cpu(rp->restart_area_offset));
+
+		/* Continue its LSNs when writing a clean LogFile later. */
+		vol->logfile_lsn = le64_to_cpu(ra->current_lsn);
+		vol->logfile_seq_bits = le32_to_cpu(ra->seq_number_bits);
 	}
 
 	kvfree(rp);
@@ -1974,10 +1989,6 @@ static void ntfs_put_super(struct super_block *sb)
 	iput(vol->mftbmp_ino);
 	vol->mftbmp_ino = NULL;
 
-	if (vol->logfile_ino) {
-		iput(vol->logfile_ino);
-		vol->logfile_ino = NULL;
-	}
 	if (vol->mftmirr_ino) {
 		/* Re-commit the mft mirror and mft just in case. */
 		ntfs_commit_inode(vol->mftmirr_ino);
@@ -2025,10 +2036,18 @@ static void ntfs_put_super(struct super_block *sb)
 				 */
 				ntfs_warning(sb,
 					"Volume has errors.  Leaving volume marked dirty.  Run chkdsk.");
+			} else if (vol->logfile_ino) {
+				/* The volume is clean on disk, so is the LogFile. */
+				ntfs_write_clean_logfile(vol->logfile_ino);
 			}
 		}
 	}
 
+	if (vol->logfile_ino) {
+		iput(vol->logfile_ino);
+		vol->logfile_ino = NULL;
+	}
+
 	/*
 	 * Release $Volume while the mft inode is still available: if the
 	 * commit above failed before it could clear the dirty flag,
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index fdb57279d..1e6696b60 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -71,6 +71,9 @@
  * @mftmirr_ino: The VFS inode of $MFTMirr.
  * @mftmirr_size: Size of mft mirror in mft records.
  * @logfile_ino: The VFS inode of LogFile.
+ * @logfile_lsn: current_lsn of the LogFile restart area found at mount
+ *	time, or of the clean restart area we last wrote, 0 if unknown.
+ * @logfile_seq_bits: seq_number_bits belonging to @logfile_lsn.
  * @lcnbmp_ino: The VFS inode of $Bitmap.
  * @lcnbmp_lock: Lock for serializing accesses to the cluster bitmap
  * @vol_ino: The VFS inode of $Volume.
@@ -144,6 +147,8 @@ struct ntfs_volume {
 	struct inode *mftmirr_ino;
 	int mftmirr_size;
 	struct inode *logfile_ino;
+	u64 logfile_lsn;
+	u32 logfile_seq_bits;
 	struct inode *lcnbmp_ino;
 	struct rw_semaphore lcnbmp_lock;
 	struct mutex volume_label_lock;
-- 
2.54.0 (Apple Git-157)

