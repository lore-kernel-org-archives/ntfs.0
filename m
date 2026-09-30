Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0570133A6F1
	for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757239; cv=none; b=ZiQKUjUxPei4HrLoYvmAkdgO/tI1C2FPqrZFjr8/NfEWeKykcMp9ykhA7QB+CH1Cxo1lWexXaTxMPDUB++YCs4ZR39PdKt4OcffZ2H7f0EIBm8JEuLASjvEicmjUOzcZ/1MxmIik47HM38RlKHcb3VHF/wjLTCrLUIXBvcK4+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757239; c=relaxed/simple;
	bh=bIK2Ym1ross0dDJTJL0kvEuSBFX0USwT+58dDIl7tUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJcJ5tDXDHTdBxrziv3UCNimooJOvJ+C8jBNbmNXngWjojFuve5GRIxc3tEGKZFbHnl37eHzADVS12mUAK07pGLNGNsK7zfng8YcNXvQsYTQQVC8e6isGw7J8FlpXSQMx9VW/r6Jt/yGQv/1j2v2JlyamQwwLLH9DUEfPfJ0e9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRLLQufF; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRLLQufF"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so42849005ad.3
        for <ntfs@lists.linux.dev>; Wed, 30 Sep 2026 01:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757230; x=1791362030; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XZJIeRxhdvM6bRczG9fx2c3/2MJUqdPpFROdk3MVdY=;
        b=mRLLQufFEgkS2sl1UmdBBKPW95JJ+ogk6KodkfsMRyV2NlPzc1Nwq8cKPN0qaGy+Bu
         1fdvWci1greIojvzJZ3f2RYZO13WsyPEziGA94vpN9nHlc87PGNqPWLwy4HwbyX4RGzR
         Pg0g/vbDyKa0u9uWqy4MGge9rUUqaiQVWJ7E4ITNuqb5e+1hVjXvir54kvuGgM3E70R+
         ZVh8vREh2qQUgYmR9aK19nqNlSniTsX1wiGiz7ZSuwMkFSNFyF1jVdb49MqhADpVfnpA
         R6GbwGSQeuzTONcZzcx99kANhrygkT8JD/nG5Cc5p2g5oCSqIFmNL505WcXm9m2WHqyN
         XTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757230; x=1791362030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XZJIeRxhdvM6bRczG9fx2c3/2MJUqdPpFROdk3MVdY=;
        b=2ohdNOTNqf6Urdt4U2t1oc+Xm0NrL+jbwaL0qAyND0CAX1SqNlTzTIPYPA5TMsqNlt
         TDTvmrBu/EIaM0S8FR4+sKVNAkRUN0XiBXFZTsGpobeGIEmNI0srXhhu9Oj07jjPRfq+
         I72HSfshytg1phYKmgu5vUP4Got+5jC+zFbmKjsH1EkY86x4eTMZ89c7bVgDeIBaD0gJ
         iEYFOZJ26F3KqK8OgW2XKoElQRs6JPygS4I05XJA63apJsy4BOrxt2Ustya+EXMsvxuG
         z/jQASmynBWro5OkLgCu3ucIoE7yIZqorj5SSnVTEFqi7OUVtIo2sjCGDPcewP083RpU
         KWMw==
X-Forwarded-Encrypted: i=1; AKwUvByrqXwUdjSrMjh7IAbKI5iH+AsVa7yyd6PBojq1e/sdzZsfnI8jhd2X4Ek4W2IuYTVjzQs2@lists.linux.dev
X-Gm-Message-State: AFq9FYIDQXPQdoaGeQ5cOVYOf4EQbNEVRd8Af+U8ff/U+yrOAgJb41yr
	L8IGKWSGgceBdY5+cvVbsVFLY2TDROzIcF9dCddBUC9g7koYx/319XUs
X-Gm-Gg: AYBFou1bvwIKIXoL/aUiuvkrYyrDiEw4GrsLlPRP9+/A0Hd1zAu5UmNePrapN2hvyy7
	kG8xJIxw9v4K6D1Y4JwjbDLZGRroeN++np/nOxEPFJtUXd7+1ebyKjXaaAJuMbmmZ0hdDfTAm11
	e3yU+dgH1yENI4JWF3wNUN/783iEaD/pH6capMcQ+ekID7RfXXtrhsM5AU4jY+ehXasCrqK9dFl
	0RYi7SwD1ELvxNmwtkR7wMlLtoNDqfzVQpg72lE/iDbio+jIALlpBuzv8Fpy+XiUtE+8i/LG6PF
	r+r5cHfzn3tGwOi1JvKVwl6d1u8X4hkgBxCpNDoF34OxA4rETvDxW7EnRHAd/g83ZOr8EeOSt9s
	zZeNk9vN6Xp1qLF1W5b9SXQXpQJCzaPemx68XsoHnJPdC/s2JpUnWR+BoYTFAyE+zY8sk+2MB2i
	KkyRvjPNE+0VmOwI+YL00YztCg/V/CBJBt2UxUoHA8qC47AXs0NPewLiuksCeV
X-Received: by 2002:a17:903:4b28:b0:2dd:c100:9438 with SMTP id d9443c01a7336-2e2e4a26d5amr5481225ad.54.1790757229559;
        Wed, 30 Sep 2026 01:33:49 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5b89c89sm3532185ad.15.2026.09.30.01.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:33:48 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:33:46 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Mark Eiger <eigermark8@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev
Subject: Re: [PATCH] ntfs: write a clean LogFile on unmount and remount
 read-only
Message-ID: <arzJaqJbyue5sjIO@hyunchul-PC02>
References: <20260929064534.31116-1-eigermark8@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929064534.31116-1-eigermark8@gmail.com>

Hi Mark,

> +static u64 ntfs_mft_max_lsn(struct ntfs_volume *vol)
> +{
> +	struct inode *mft_vi = vol->mft_ino;
> +	const s64 size = i_size_read(mft_vi);
> +	struct folio *folio = NULL;
> +	u64 max_lsn = 0;
> +	s64 pos;
> +
> +	for (pos = 0; pos + vol->mft_record_size <= size;
> +	     pos += vol->mft_record_size) {
> +		pgoff_t idx = pos >> PAGE_SHIFT;
> +		struct mft_record *m;
> +
> +		if (!folio || idx >= folio_next_index(folio)) {
> +			if (folio)
> +				folio_put(folio);
> +			folio = read_mapping_folio(mft_vi->i_mapping, idx, NULL);
> +			if (IS_ERR(folio)) {
> +				folio = NULL;
> +				break;
> +			}
> +		}
> +		m = kmap_local_folio(folio, offset_in_folio(folio, pos));
> +		if (ntfs_is_file_record(m->magic))
> +			max_lsn = max(max_lsn, le64_to_cpu(m->lsn));
> +		kunmap_local(m);
> +		cond_resched();
> +	}
> +	if (folio)
> +		folio_put(folio);
> +	return max_lsn;
> +}
> +

I am concerned about the performace impact when a partition previously
mounted with the ntfs or ntfs-3g is later unmounted or remounted. If
$LogFile has been reset, this function scan every MFT record, which
could make these too slow. 

I understand that the scan is conditional, but could we avoid it
by creating a valid clean restart area with a sufficiently high
$LogFile LSN or  something else?

> +/* Set up the multi sector transfer protection header of a LogFile page. */
> +static void ntfs_init_log_page(u8 *page, __le32 magic, u16 usa_ofs)
> +{
> +	struct ntfs_record *r = (struct ntfs_record *)page;
> +
> +	r->magic = magic;
> +	r->usa_ofs = cpu_to_le16(usa_ofs);
> +	r->usa_count = cpu_to_le16(CLEAN_LOG_USA_COUNT);
> +	/* Initial update sequence number, pre_write_mst_fixup() bumps it. */
> +	*(__le16 *)(page + usa_ofs) = cpu_to_le16(get_random_u16());
> +}
> +
> +/* Fill in a restart page whose single client restarts at @restart_lsn. */
> +static void ntfs_init_restart_page(u8 *page, u64 file_size, u32 seq_bits,
> +		u64 oldest_lsn, u64 restart_lsn)
> +{
> +	struct restart_page_header *rph = (struct restart_page_header *)page;
> +	u16 ra_ofs = ALIGN(sizeof(*rph) + 2 * CLEAN_LOG_USA_COUNT, 8);
> +	struct restart_area *ra = (struct restart_area *)(page + ra_ofs);
> +	struct log_client_record *cr = (struct log_client_record *)
> +			((u8 *)ra + CLEAN_LOG_CLIENT_ARRAY_OFFSET);
> +	static const char name[] = "NTFS";
> +	int i;
> +
> +	ntfs_init_log_page(page, magic_RSTR, sizeof(*rph));
> +	rph->system_page_size = cpu_to_le32(DefaultLogPageSize);
> +	rph->log_page_size = cpu_to_le32(DefaultLogPageSize);
> +	rph->restart_area_offset = cpu_to_le16(ra_ofs);
> +	rph->minor_ver = cpu_to_le16(1);
> +	rph->major_ver = cpu_to_le16(1);
> +
> +	ra->current_lsn = cpu_to_le64(restart_lsn);
> +	ra->log_clients = cpu_to_le16(1);
> +	ra->client_free_list = LOGFILE_NO_CLIENT;
> +	ra->client_in_use_list = 0;
> +	ra->flags = RESTART_VOLUME_IS_CLEAN;
> +	ra->seq_number_bits = cpu_to_le32(seq_bits);
> +	ra->restart_area_length = cpu_to_le16(CLEAN_LOG_CLIENT_ARRAY_OFFSET +
> +			sizeof(*cr));
> +	ra->client_array_offset = cpu_to_le16(CLEAN_LOG_CLIENT_ARRAY_OFFSET);
> +	ra->file_size = cpu_to_le64(file_size);
> +	ra->last_lsn_data_length =
> +			cpu_to_le32(sizeof(struct ntfs_restart_record));
> +	ra->log_record_header_length =
> +			cpu_to_le16(sizeof(struct log_record_header));
> +	ra->log_page_data_offset = cpu_to_le16(CLEAN_LOG_DATA_OFFSET);
> +	ra->restart_log_open_count = cpu_to_le32(get_random_u32());
> +
> +	cr->oldest_lsn = cpu_to_le64(oldest_lsn);
> +	cr->client_restart_lsn = cpu_to_le64(restart_lsn);
> +	cr->prev_client = LOGFILE_NO_CLIENT;
> +	cr->next_client = LOGFILE_NO_CLIENT;
> +	cr->client_name_length = cpu_to_le32((sizeof(name) - 1) * sizeof(__le16));
> +	for (i = 0; i < sizeof(name) - 1; i++)
> +		cr->client_name[i] = cpu_to_le16(name[i]);
> +}
> +
> +/* Append a log record to @p (zeroed memory) and return the end of it. */
> +static u8 *ntfs_add_log_record(u8 *p, u64 lsn, __le32 type, u32 transaction_id,
> +		const void *data, u32 data_len)
> +{
> +	struct log_record_header *lrh = (struct log_record_header *)p;
> +
> +	lrh->this_lsn = cpu_to_le64(lsn);
> +	lrh->client_data_length = cpu_to_le32(data_len);
> +	lrh->record_type = type;
> +	lrh->transaction_id = cpu_to_le32(transaction_id);
> +	if (data)
> +		memcpy(p + sizeof(*lrh), data, data_len);
> +	return p + sizeof(*lrh) + ALIGN(data_len, 8);
> +}
> +
> +/*
> + * Fill in a log record page holding @records.  @copy is the LSN of the last
> + * record on the page, or for a tail copy the LogFile offset of the page.
> + */
> +static void ntfs_init_record_page(u8 *page, u64 copy, u64 last_end_lsn,
> +		const u8 *records, u32 records_len)
> +{
> +	struct record_page_header *rph = (struct record_page_header *)page;
> +	u16 usa_end = sizeof(*rph) + 2 * CLEAN_LOG_USA_COUNT;
> +
> +	ntfs_init_log_page(page, magic_RCRD, sizeof(*rph));
> +	rph->copy.last_lsn = cpu_to_le64(copy);
> +	rph->flags = LOG_PAGE_LOG_RECORD_END;
> +	rph->page_count = cpu_to_le16(1);
> +	rph->page_position = cpu_to_le16(1);
> +	rph->next_record_offset = cpu_to_le16(CLEAN_LOG_DATA_OFFSET +
> +			records_len);
> +	/* Windows fills the unused header bytes with 0xff. */
> +	memset(rph->reserved, 0xff, sizeof(rph->reserved));
> +	memset(page + usa_end, 0xff, CLEAN_LOG_DATA_OFFSET - usa_end);
> +	rph->last_end_lsn = cpu_to_le64(last_end_lsn);
> +	memcpy(page + CLEAN_LOG_DATA_OFFSET, records, records_len);
> +}
> +
> +/*
> + * ntfs_write_clean_logfile - write a clean journal to an emptied LogFile
> + * @log_vi:	struct inode of the loaded journal LogFile
> + *
> + * ntfs_empty_logfile() fills the LogFile with 0xff bytes when the volume is
> + * mounted read-write.  Windows treats such a LogFile as uninitialized and
> + * has to write a new restart area before it can mount the volume.  On
> + * write protected media, e.g. behind a forensic write blocker, that write
> + * fails and Windows refuses the volume with "The media is write protected".
> + *
> + * Write what Windows itself leaves behind on a clean dismount instead: two
> + * identical LFS 1.1 restart pages with RESTART_VOLUME_IS_CLEAN set and one
> + * "NTFS" client whose restart record is an empty checkpoint, i.e. there is
> + * nothing to redo or undo.  The checkpoint follows a no-op record in the first
> + * log record page, which is also stored in both tail copies.  The log record
> + * pages are written before the restart pages that refer to them.
> + *
> + * Only call this once all metadata has been written, on umount or remount
> + * read-only.  Failing is not fatal: the volume stays consistent and Windows
> + * reinitializes the LogFile, as it had to before.
> + *
> + * Return 'true' on success or if the LogFile was not emptied, 'false' on error.
> + */
> +bool ntfs_write_clean_logfile(struct inode *log_vi)
> +{
> +	struct ntfs_volume *vol = NTFS_I(log_vi)->vol;
> +	struct block_device *bdev = vol->sb->s_bdev;
> +	const u32 ps = DefaultLogPageSize;
> +	u8 records[2 * sizeof(struct log_record_header) +
> +		   CLEAN_LOG_NOOP_DATA_LENGTH +
> +		   sizeof(struct ntfs_restart_record)] = {};
> +	struct ntfs_restart_record rr = {};
> +	u64 size, seq, noop_lsn, restart_lsn;
> +	u32 seq_bits, file_bits, noop_len;
> +	u8 *buf, *end;
> +	int i, err;
> +
> +	/* Never write to a volume Windows is hibernated on. */
> +	if (!NVolLogFileEmpty(vol) || NVolHibernated(vol))
> +		return true;
> +
> +	size = min_t(u64, i_size_read(log_vi), MaxLogFileSize) & ~(u64)(ps - 1);
> +	if (size < (u64)(CLEAN_LOG_RSTR_PAGES + MinLogRecordPages) * ps) {
> +		err = -EINVAL;
> +		goto err_out;
> +	}
> +
> +	/*
> +	 * An LSN is the sequence number shifted left by file_bits, or'ed with
> +	 * the LogFile offset of the record divided by 8.  Continue the restart
> +	 * area found at mount time.  Otherwise calculate the parameters as
> +	 * described for struct restart_area: seq_number_bits is 67 minus the
> +	 * number of bits needed to store the LogFile size.
> +	 */
> +	seq_bits = vol->logfile_seq_bits;
> +	file_bits = 64 - seq_bits;
> +	if (!vol->logfile_lsn || seq_bits < 16 || file_bits > 48 ||
> +	    (size >> 3) > BIT_ULL(file_bits)) {
> +		seq_bits = 67 - (ilog2(size) + 1);
> +		file_bits = 64 - seq_bits;
> +	}
> +	if (vol->logfile_lsn)
> +		seq = (vol->logfile_lsn >> file_bits) + 1;
> +	else
> +		seq = (ntfs_mft_max_lsn(vol) >> file_bits) + 2;
> +	/* LSNs are signed 64-bit numbers. */
> +	if (seq >= BIT_ULL(seq_bits - 1))
> +		seq = 1;
> +
> +	noop_len = sizeof(struct log_record_header) + CLEAN_LOG_NOOP_DATA_LENGTH;
> +	noop_lsn = seq << file_bits |
> +		   (CLEAN_LOG_FIRST_RCRD_PAGE * ps + CLEAN_LOG_DATA_OFFSET) >> 3;
> +	restart_lsn = noop_lsn + (noop_len >> 3);
> +
> +	/*
> +	 * The empty checkpoint.  The fields past the tables are not documented;
> +	 * fill them in the way Windows does.
> +	 */
> +	rr.major_ver = cpu_to_le32(1);
> +	rr.checkpoint_start_lsn = cpu_to_le64(noop_lsn);
> +	rr.previous_seq_lsn = cpu_to_le64((seq - 1) << file_bits);
> +	rr.bytes_per_cluster = cpu_to_le32(vol->cluster_size);
> +	rr.last_lsn = cpu_to_le64(noop_lsn);
> +	end = ntfs_add_log_record(records, noop_lsn, LOG_RECORD_CLIENT_RECORD,
> +			CLEAN_LOG_NOOP_TRANSACTION_ID, NULL,
> +			CLEAN_LOG_NOOP_DATA_LENGTH);
> +	end = ntfs_add_log_record(end, restart_lsn, LOG_RECORD_CLIENT_RESTART, 0,
> +			&rr, sizeof(rr));
> +
> +	buf = kzalloc(CLEAN_LOG_PAGES * ps, GFP_NOFS);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	ntfs_init_restart_page(buf, size, seq_bits, noop_lsn, restart_lsn);
> +	memcpy(buf + ps, buf, ps);
> +	/* Newer tail copy with both records, older one with the no-op only. */
> +	ntfs_init_record_page(buf + 2 * ps, CLEAN_LOG_FIRST_RCRD_PAGE * ps,
> +			restart_lsn, records, end - records);
> +	ntfs_init_record_page(buf + 3 * ps, CLEAN_LOG_FIRST_RCRD_PAGE * ps,
> +			noop_lsn, records, noop_len);
> +	ntfs_init_record_page(buf + 4 * ps, restart_lsn, restart_lsn,
> +			records, end - records);
> +	for (i = 0; i < CLEAN_LOG_PAGES; i++) {
> +		err = pre_write_mst_fixup((struct ntfs_record *)(buf + i * ps), ps);
> +		if (err)
> +			goto free_err_out;
> +	}
> +
> +	err = ntfs_write_logfile(log_vi, buf + CLEAN_LOG_RSTR_PAGES * ps,
> +			CLEAN_LOG_RSTR_PAGES * ps,
> +			(CLEAN_LOG_PAGES - CLEAN_LOG_RSTR_PAGES) * ps);
> +	if (!err)
> +		err = blkdev_issue_flush(bdev);
> +	if (!err)
> +		err = ntfs_write_logfile(log_vi, buf, 0, CLEAN_LOG_RSTR_PAGES * ps);
> +	if (!err)
> +		err = blkdev_issue_flush(bdev);
> +	if (err)
> +		goto free_err_out;
> +	kfree(buf);
> +
> +	vol->logfile_lsn = restart_lsn;
> +	vol->logfile_seq_bits = seq_bits;
> +	NVolClearLogFileEmpty(vol);
> +	ntfs_debug("Done, restart LSN 0x%llx.", restart_lsn);
> +	return true;
> +
> +free_err_out:
> +	kfree(buf);
> +err_out:
> +	ntfs_warning(vol->sb,
> +		"Failed to write a clean LogFile (error %d).  Windows may be unable to mount the volume read-only.",
> +		err);
> +	return false;
> +}
> diff --git a/fs/ntfs/logfile.h b/fs/ntfs/logfile.h
> index dadb56fd0..960f6c383 100644
> --- a/fs/ntfs/logfile.h
> +++ b/fs/ntfs/logfile.h
> @@ -239,7 +239,99 @@ struct log_client_record {
>  	__le16 client_name[64];
>  } __packed;
>  
> +/*
> + * Log record page header ("RCRD"), followed by the update sequence array.
> + * @copy.last_lsn: In a log record page, the LSN of the last log record
> + *   that starts on this page.
> + * @copy.file_offset: In a tail copy of a log record page (the two pages
> + *   following the restart pages), the LogFile offset of the page it is a
> + *   copy of.
> + * @flags: LOG_PAGE_LOG_RECORD_END if a log record ends on this page.
> + * @page_count: Number of pages written together with this one.
> + * @page_position: Position of this page in that group, starting at 1.
> + * @next_record_offset: Offset of the first free byte in this page.
> + * @last_end_lsn: LSN of the last log record that ends on this page.
> + */
> +struct record_page_header {
> +	__le32 magic;
> +	__le16 usa_ofs;
> +	__le16 usa_count;
> +	union {
> +		__le64 last_lsn;
> +		__le64 file_offset;
> +	} __packed copy;
> +	__le32 flags;
> +	__le16 page_count;
> +	__le16 page_position;
> +	__le16 next_record_offset;
> +	u8 reserved[6];
> +	__le64 last_end_lsn;
> +} __packed;
> +
> +#define LOG_PAGE_LOG_RECORD_END	cpu_to_le32(0x00000001)
> +
> +/*
> + * Log record header.  The client data follows immediately.
> + * @this_lsn: LSN of this log record.
> + * @client_previous_lsn: Previous LSN of the same transaction, or 0.
> + * @client_undo_next_lsn: Next LSN to undo in the same transaction, or 0.
> + * @client_data_length: Length of the client data following this header.
> + * @client_seq_number: Sequence number of the client that wrote the record.
> + * @client_index: Index of that client in the restart area's client array.
> + * @record_type: LOG_RECORD_CLIENT_RECORD or LOG_RECORD_CLIENT_RESTART.
> + * @transaction_id: Transaction this record belongs to.
> + * @flags: Bit 0 set if the record continues on the next page.
> + */
> +struct log_record_header {
> +	__le64 this_lsn;
> +	__le64 client_previous_lsn;
> +	__le64 client_undo_next_lsn;
> +	__le32 client_data_length;
> +	__le16 client_seq_number;
> +	__le16 client_index;
> +	__le32 record_type;
> +	__le32 transaction_id;
> +	__le16 flags;
> +	u8 reserved[6];
> +} __packed;
> +
> +enum {
> +	LOG_RECORD_CLIENT_RECORD	= cpu_to_le32(1),
> +	LOG_RECORD_CLIENT_RESTART	= cpu_to_le32(2),
> +};
> +
> +/*
> + * Client data of the NTFS client's restart record (the checkpoint).  The
> + * table LSN and length fields locate the open attribute, attribute name,
> + * dirty page and transaction tables written before the checkpoint.  All zero
> + * means that nothing needs to be redone or undone.
> + * @checkpoint_start_lsn: LSN where the checkpoint started.
> + * @previous_seq_lsn, @bytes_per_cluster, @last_lsn: Not documented; named
> + *   after the values Windows 10/11 was observed to write there on a clean
> + *   dismount (the first LSN of the previous sequence number, the cluster
> + *   size and @checkpoint_start_lsn again).
> + */
> +struct ntfs_restart_record {
> +	__le32 major_ver;
> +	__le32 minor_ver;
> +	__le64 checkpoint_start_lsn;
> +	__le64 open_attr_table_lsn;
> +	__le64 attr_names_lsn;
> +	__le64 dirty_page_table_lsn;
> +	__le64 transaction_table_lsn;
> +	__le32 open_attr_table_length;
> +	__le32 attr_names_length;
> +	__le32 dirty_page_table_length;
> +	__le32 transaction_table_length;
> +	__le64 reserved1;
> +	__le64 previous_seq_lsn;
> +	__le32 bytes_per_cluster;
> +	u8 reserved2[20];
> +	__le64 last_lsn;
> +} __packed;
> +
>  bool ntfs_check_logfile(struct inode *log_vi,
>  		struct restart_page_header **rp);
>  bool ntfs_empty_logfile(struct inode *log_vi);
> +bool ntfs_write_clean_logfile(struct inode *log_vi);
>  #endif /* _LINUX_NTFS_LOGFILE_H */
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 716ba775f..02e1c001e 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -381,6 +381,14 @@ static int ntfs_reconfigure(struct fs_context *fc)
>  				return err;
>  			}
>  		}
> +		/*
> +		 * Leave a clean LogFile behind, so that Windows can mount the
> +		 * volume without writing to it.  Not after a forced remount:
> +		 * writers in progress may still be modifying metadata.
> +		 */
> +		if (!(fc->sb_flags & SB_FORCE) && !NVolErrors(vol) &&
> +		    vol->logfile_ino)
> +			ntfs_write_clean_logfile(vol->logfile_ino);
>  	}
>  
>  	ntfs_debug("Done.");
> @@ -1729,6 +1737,13 @@ static bool load_system_files(struct ntfs_volume *vol)
>  			ntfs_error(sb, "Failed to load LogFile. Mounting read-only.");
>  		}
>  		NVolSetErrors(vol);
> +	} else if (rp) {
> +		struct restart_area *ra = (struct restart_area *)((u8 *)rp +
> +				le16_to_cpu(rp->restart_area_offset));
> +
> +		/* Continue its LSNs when writing a clean LogFile later. */
> +		vol->logfile_lsn = le64_to_cpu(ra->current_lsn);
> +		vol->logfile_seq_bits = le32_to_cpu(ra->seq_number_bits);
>  	}
>  
>  	kvfree(rp);
> @@ -1974,10 +1989,6 @@ static void ntfs_put_super(struct super_block *sb)
>  	iput(vol->mftbmp_ino);
>  	vol->mftbmp_ino = NULL;
>  
> -	if (vol->logfile_ino) {
> -		iput(vol->logfile_ino);
> -		vol->logfile_ino = NULL;
> -	}
>  	if (vol->mftmirr_ino) {
>  		/* Re-commit the mft mirror and mft just in case. */
>  		ntfs_commit_inode(vol->mftmirr_ino);
> @@ -2025,10 +2036,18 @@ static void ntfs_put_super(struct super_block *sb)
>  				 */
>  				ntfs_warning(sb,
>  					"Volume has errors.  Leaving volume marked dirty.  Run chkdsk.");
> +			} else if (vol->logfile_ino) {
> +				/* The volume is clean on disk, so is the LogFile. */
> +				ntfs_write_clean_logfile(vol->logfile_ino);
>  			}
>  		}
>  	}
>  
> +	if (vol->logfile_ino) {
> +		iput(vol->logfile_ino);
> +		vol->logfile_ino = NULL;
> +	}
> +
>  	/*
>  	 * Release $Volume while the mft inode is still available: if the
>  	 * commit above failed before it could clear the dirty flag,
> diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
> index fdb57279d..1e6696b60 100644
> --- a/fs/ntfs/volume.h
> +++ b/fs/ntfs/volume.h
> @@ -71,6 +71,9 @@
>   * @mftmirr_ino: The VFS inode of $MFTMirr.
>   * @mftmirr_size: Size of mft mirror in mft records.
>   * @logfile_ino: The VFS inode of LogFile.
> + * @logfile_lsn: current_lsn of the LogFile restart area found at mount
> + *	time, or of the clean restart area we last wrote, 0 if unknown.
> + * @logfile_seq_bits: seq_number_bits belonging to @logfile_lsn.
>   * @lcnbmp_ino: The VFS inode of $Bitmap.
>   * @lcnbmp_lock: Lock for serializing accesses to the cluster bitmap
>   * @vol_ino: The VFS inode of $Volume.
> @@ -144,6 +147,8 @@ struct ntfs_volume {
>  	struct inode *mftmirr_ino;
>  	int mftmirr_size;
>  	struct inode *logfile_ino;
> +	u64 logfile_lsn;
> +	u32 logfile_seq_bits;
>  	struct inode *lcnbmp_ino;
>  	struct rw_semaphore lcnbmp_lock;
>  	struct mutex volume_label_lock;
> -- 
> 2.54.0 (Apple Git-157)
> 

-- 
Thanks,
Hyunchul
