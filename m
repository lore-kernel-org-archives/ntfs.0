Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627492;
	b=GJf5bNOFv4ybuoDn58O7JYZpBuB117C0fo+R0NwBmnVya3WAgVeCVTiKOghjJikm+SAP
	 ViPD7in8U+ohLIZOXHnVe8KSwtPWZ0SyQltiTmV4oRLvJLnArJhvU0hmytEORAyAPadun
	 ccEeQal7RzA+Jkz9X/zaRRw1h9uKve7o3Uq5ue+Nx5bPKWqFU8aaQ3mwTU02Kg5Yq5HFy
	 61s7Y2GFY9lmiTHys8sGgaPhYY7Vd8TW/3E27WHuTHFoJAQSVDGxtSySqbYBqiF8qP1Dj
	 06ykdXMiOVkcnlhE975f5xtlfLKtUdYn8D4ZUdRLzs3/j3k/DPSIcnzd+kwlWeIolsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627492;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=0xJq0JAkeZ66pE5S83csE5P1tHue1xGRyv2L5UwgFq4=;
	b=VAUoD3sYSUo2xHzpz402CIpja4alM2zAu8tAORWhs+sWTWe6fUJnIrPOMDjMgcDamPkX
	 KnzdUMUnqfuf8EhrIIBmGFwATRPteeVnEaWnNifPwEziT2WzJLkUZMNVLhFz7mfrxcDZD
	 R2b8WJTx8XWVG8JCzd8znANvvoga3aKrUS+Ou3AySf/DawSuHyuFcFN5CY7/08kYgF+mA
	 aYpUNyUSEYe9twnn/gITRhhnE4hABfmXYaT+Fp/TGhFWyT8JWcmIR7L27Sfqg9WPTlYsQ
	 D8se5TCRgkoa1ghzjwH9ES/iOf37OVDP8yCb71oYA/FIqZtDA5EokfsmW6YbDnLDdVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5ppDITz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCECD60A6F53
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5ppDITz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D9B1F00A23
	for <ntfs@lists.linux.dev>; Mon,  2 Nov 2026 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627491;
	bh=0xJq0JAkeZ66pE5S83csE5P1tHue1xGRyv2L5UwgFq4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K5ppDITz+rlrCNv+IFHk+54AytkiARE+E+tcC37cMpnYZWz3+8nSSifyiM4T7IJQX
	 e4fPy65jH2oApIM94GqTznVQEZ1S9Mk4nURunBQqJE6LfsiOAlnesuD7drOxR4+DvF
	 Ts5aDjTaz1tHQqEYv/StaGghuga5aMf1gsQkTAJJY4LBhVnDAeh63joSU+MlfTF2gk
	 PaoDpx2XVr/SxWW9zJo+HNYcgatFiBcxJ74yvQO9OecJ0iD+tgMqEXxU3PaHrqbsBi
	 QV52GN64Vqnw3ZJr2eBtUirAjhSbVqC2jLd3x1vTxM+6Bnj5Nfe2bDBKbvkTL32o4Z
	 SxxzyKYAAauUg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c445c95d553so406524066b.1
        for <ntfs@lists.linux.dev>; Mon, 02 Nov 2026 05:51:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwiWRtPqQp3uS7SttSMzps5XYmndhhCxNvKkvcB8gy0o1hE7dCc8wZ99LFmG0azrsbnyzjz@lists.linux.dev
X-Gm-Message-State: APuU4Z+z6g2T9PxE2KFJre6W1m8psWtcLlmptNjrVoc261QYwxPicD8n
	CQjWkTMh1EkO0sxO1PaN0ALzpje4dySdJHxvM19ypOidnFQpQcrSOiWXC0zj8jSgbzAhurwuz07
	fNLPFlaqzCz9eIFbJ8JxuEywLMOnpbUA=
X-Received: by 2002:a17:906:1b0d:b0:c4c:bff4:202a with SMTP id
 a640c23a62f3a-c4cbff4325dmr312219166b.49.1793627490108; Mon, 02 Nov 2026
 05:51:30 -0800 (PST)
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Post: <mailto:ntfs@lists.linux.dev>
List-Help: <mailto:ntfs+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <72452.1793479234@localhost>
In-Reply-To: <72452.1793479234@localhost>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 2 Nov 2026 22:51:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_bgSCP0SvZrXJ1c1V1Mt9xQ443sgxaRSu1-iDxZrCYrg@mail.gmail.com>
X-Gm-Features: AclHuK8Nn9NAWb-zHdm7GjSTuT2iwoIOyX3FnBUuW2RzzsONISxWnBjFHm8YZiM
Message-ID: <CAKYAXd_bgSCP0SvZrXJ1c1V1Mt9xQ443sgxaRSu1-iDxZrCYrg@mail.gmail.com>
Subject: Re: ntfs_resident_attr_value_resize() uses value_offset w/o check
To: rtm@csail.mit.edu
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000688fd6065f4b712f"

--000000000000688fd6065f4b712f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 5:40=E2=80=AFAM <rtm@csail.mit.edu> wrote:
>
> In ntfs/attrib.c's ntfs_resident_attr_value_resize():
>
>         old_size =3D le32_to_cpu(a->data.resident.value_length);
>         if (new_size > old_size)
>                 memset((u8 *)a + le16_to_cpu(a->data.resident.value_offse=
t) +
>                                 old_size, 0, new_size - old_size);
>
> A corrupt NTFS image could have value_offset greater than the
> attribute length, so that memset() zeros outside of the allocated
> memory.
Please check the attached patch.
Thanks for the report!

--000000000000688fd6065f4b712f
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-ntfs-don-t-allow-resident-values-to-overlap-the-attr.patch"
Content-Disposition: attachment; 
	filename="0001-ntfs-don-t-allow-resident-values-to-overlap-the-attr.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvzbf75s0>
X-Attachment-Id: f_mvzbf75s0

RnJvbSA1YjhlMzE2YTZkZmViMWYxZmEyMjBjMDAyYWUyN2RiYjhlNjg0NWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOYW1qYWUgSmVvbiA8bGlua2luamVvbkBrZXJuZWwub3JnPgpE
YXRlOiBNb24sIDIgTm92IDIwMjYgMjA6NDc6NTEgKzA5MDAKU3ViamVjdDogW1BBVENIXSBudGZz
OiBkb24ndCBhbGxvdyByZXNpZGVudCB2YWx1ZXMgdG8gb3ZlcmxhcCB0aGUgYXR0cmlidXRlCiBo
ZWFkZXIKClRoZSByZXNpZGVudCB2YWx1ZSBib3VuZHMgY2hlY2sgYWxsb3dzIHZhbHVlX29mZnNl
dCB0byBwb2ludCBpbnNpZGUgdGhlCmF0dHJpYnV0ZSBoZWFkZXIuIFRoZSByZXBvcnRlZCBpbWFn
ZSBoYXMgYW4gdW5uYW1lZCAkREFUQSBhdHRyaWJ1dGUgd2l0aAphIHZhbHVlX29mZnNldCBvZiB6
ZXJvIGFuZCBhIHZhbHVlX2xlbmd0aCBvZiB0d28sIHdoaWNoIHBhc3NlcyBsb29rdXAuCgpBcHBl
bmRpbmcgdG8gdGhpcyBmaWxlIG1ha2VzIG50ZnNfcmVzaWRlbnRfYXR0cl92YWx1ZV9yZXNpemUo
KSBzaHJpbmsgdGhlCmF0dHJpYnV0ZSByZWNvcmQgdG8gZWlnaHQgYnl0ZXMuIE1vdmluZyB0aGUg
Zm9sbG93aW5nIGF0dHJpYnV0ZXMgdGhlbgpvdmVyd3JpdGVzIHRoZSByZXNpZGVudCBoZWFkZXIg
ZmllbGRzLCBzbyB0aGUgc3Vic2VxdWVudCBtZW1zZXQoKSB1c2VzIGEKY29ycnVwdGVkIHZhbHVl
X29mZnNldCBhbmQgd3JpdGVzIG91dHNpZGUgdGhlIE1GVCByZWNvcmQgYnVmZmVyLgoKUmVxdWly
ZSB0aGUgcmVzaWRlbnQgdmFsdWUgdG8gc3RhcnQgYWZ0ZXIgdGhlIGNvbXBsZXRlIHJlc2lkZW50
IGhlYWRlci4KQm90aCBsb29rdXAgcGF0aHMgdGhlbiByZXR1cm4gLUVJTyBmb3IgdGhlIGNvcnJ1
cHQgcmVjb3JkLCBiZWZvcmUgY2FsbGVycwpjYW4gcmVzaXplIG9yIGFjY2VzcyBpdHMgdmFsdWUu
CgpGaXhlczogNDk1ZTkwZmEzMzQ4ICgibnRmczogdXBkYXRlIGF0dHJpYiBvcGVyYXRpb25zIikK
UmVwb3J0ZWQtYnk6IFJvYmVydCBNb3JyaXMgPHJ0bUBtaXQuZWR1PgpTaWduZWQtb2ZmLWJ5OiBO
YW1qYWUgSmVvbiA8bGlua2luamVvbkBrZXJuZWwub3JnPgotLS0KIGZzL250ZnMvYXR0cmliLmMg
fCA5ICsrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9mcy9udGZzL2F0dHJpYi5jIGIvZnMvbnRmcy9hdHRyaWIuYwpp
bmRleCBmY2U3MTQ0ZDdiZWYuLmNlN2MxYjUyNDE4MCAxMDA2NDQKLS0tIGEvZnMvbnRmcy9hdHRy
aWIuYworKysgYi9mcy9udGZzL2F0dHJpYi5jCkBAIC03MDQsMTcgKzcwNCwyMCBAQCBzdGF0aWMg
Ym9vbCBudGZzX3Jlc2lkZW50X2F0dHJfdmFsdWVfZ2V0KGNvbnN0IHN0cnVjdCBhdHRyX3JlY29y
ZCAqYSwKIAkJCQkJIHN0cnVjdCBudGZzX3Jlc2lkZW50X2F0dHJfdmFsdWUgKnZhbHVlKQogewog
CXUzMiBhdHRyX2xlbjsKKwl1MzIgbWluX2xlbjsKIAl1MTYgdmFsdWVfb2Zmc2V0OwogCiAJYXR0
cl9sZW4gPSBsZTMyX3RvX2NwdShhLT5sZW5ndGgpOwotCWlmIChhdHRyX2xlbiA8IG9mZnNldG9m
KHN0cnVjdCBhdHRyX3JlY29yZCwgZGF0YS5yZXNpZGVudC5yZXNlcnZlZCkgKwotCQkJc2l6ZW9m
KGEtPmRhdGEucmVzaWRlbnQucmVzZXJ2ZWQpKQorCW1pbl9sZW4gPSBvZmZzZXRvZihzdHJ1Y3Qg
YXR0cl9yZWNvcmQsIGRhdGEucmVzaWRlbnQucmVzZXJ2ZWQpICsKKwkJICBzaXplb2YoYS0+ZGF0
YS5yZXNpZGVudC5yZXNlcnZlZCk7CisJaWYgKGF0dHJfbGVuIDwgbWluX2xlbikKIAkJcmV0dXJu
IGZhbHNlOwogCiAJdmFsdWUtPmxlbiA9IGxlMzJfdG9fY3B1KGEtPmRhdGEucmVzaWRlbnQudmFs
dWVfbGVuZ3RoKTsKIAl2YWx1ZV9vZmZzZXQgPSBsZTE2X3RvX2NwdShhLT5kYXRhLnJlc2lkZW50
LnZhbHVlX29mZnNldCk7CiAKLQlpZiAodmFsdWUtPmxlbiA+IGF0dHJfbGVuIHx8IHZhbHVlX29m
ZnNldCA+IGF0dHJfbGVuIC0gdmFsdWUtPmxlbikKKwlpZiAodmFsdWVfb2Zmc2V0IDwgbWluX2xl
biB8fCB2YWx1ZS0+bGVuID4gYXR0cl9sZW4gfHwKKwkgICAgdmFsdWVfb2Zmc2V0ID4gYXR0cl9s
ZW4gLSB2YWx1ZS0+bGVuKQogCQlyZXR1cm4gZmFsc2U7CiAKIAl2YWx1ZS0+ZGF0YSA9IChjb25z
dCB1OCAqKWEgKyB2YWx1ZV9vZmZzZXQ7Ci0tIAoyLjI1LjEKCg==
--000000000000688fd6065f4b712f--
