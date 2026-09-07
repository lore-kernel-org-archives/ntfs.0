Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazolkn19010009.outbound.protection.outlook.com [52.103.73.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787C13B0586
	for <ntfs@lists.linux.dev>; Mon,  7 Sep 2026 20:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.73.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813692; cv=fail; b=LZNLXouE9VSoU0WUCiE9JHhP4wPtuVzQWiL4spaf9bYT9C0ki/AyMYcJ9lKlvL0HiSKdnX7NgZdeI+pKBCj2bPstAd8MnvWjJVWbo7aVG+ied+digClIRCm8Z9XQUyk7rRnaOdk3ZAyqUZjQJVwLNFDS6+dN5J9AE6+7SHBLnl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813692; c=relaxed/simple;
	bh=otsmvc/GhLLqErvtwh8t6+oC736+uHTOO8zLLw2jT3g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=beZqgE2MN/c02upM4cZMh+/ZBUvAl5o3xIb0MthybkyJyuqWPvUudxRf32+jInF05Rv0YwMgxNRtEvLV5C2ryYZ958LABEen4Z1bZTIGaPAMcnn2iz/aCRu895unk93NFdlif14zHYtZLfpYdQgkrHxfTRYHXINlErKywmh6w3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=tNGmQUHE; arc=fail smtp.client-ip=52.103.73.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="tNGmQUHE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTgfczxWECYT/h2t6pIvxSKFxPThp+Oiihidk+Uz5OHc+zU19OS2cwqtDMUcz1oDWQvp94Nwoq8xHWG03iXOvTe1hf3i91xDn8m6Yget2T3QaE90swtgTiwaJJkgGyRmw5RtL3wvjymWYA4n9NoUVZqUZuquVqZQR+oecdvWI5kq0dy9a+E/bojfIknK58IoKjh6elGt+4lJUwFQmZ8LvG50PKa5RaWfn4pon/P48LrQ418Dm38zFnPsuZBtEPfxy0tvtbRpPnOBaKURk36rOcKTFWrECF46SUT7V67DYC4YVUlVp1NyP1OTeZl3bqIQSuxupR8/yQ5PuaDV9mFwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otsmvc/GhLLqErvtwh8t6+oC736+uHTOO8zLLw2jT3g=;
 b=PGxXyIrqfVwWQfVHVqQCYKtZa1iQ1ingvY26hmuJt+dct08jvylSRzdMjo2iX5L4ESETHsyMeZog7EdFxPdX2VWBrGwqerYBDs3TbTtHVRNt6FdjIjv8ObW8T7F7SEa1RblwWvCw9l3khKHKkrTakateo41NPfrKAHjlDUSTxJsjBn///u+QQWZT2U1VQC4prbJT7c5QzF9a9WoYsN/yFzw6Bkwtkp21dXPrO+wCq5wkkAik0A/EdlQzT47b4fCeIHvFWu810TNh9iVcKCcYIidu0pMKPbwYJh51Y/oHZVCqTX5kMK4IrsvMp1cfH8RfRVUjtTz5JrJ+oggTfHflvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otsmvc/GhLLqErvtwh8t6+oC736+uHTOO8zLLw2jT3g=;
 b=tNGmQUHEqBxHFYNclp0h0AHcbbFAGH5FZHQbxltbH8yp5htfFDzYVRKbhE0c/AM2VGFESaco8uExRGXBa8A7a3YNUdZ945cSxHQnSj6QZeQaMsqokTuV5zcpiIDs1fSwUB46cwTljq6pT7MIDTb57bdXUjcpzuOtiOr6qaQ3HqwtFlrY1xO2ps8iznIg1bTznldImrlnhU/mzJQR0Z5nhc4nc4d85A6qxXce/bQgqLsWRihmBKUiEPs0n1lK0A0e1ROv8s+5Lvru2Fg6/RDJ3ffT14uPVPOdkqmUadB5hEU0RxJwuD27CKqg/S92VLnrw4nWSSNlkfCq+JNB/jBzUg==
Received: from SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:24c::11)
 by SY0P300MB0545.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 20:41:24 +0000
Received: from SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM
 ([fe80::1c6a:c02f:24a4:eec0]) by SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM
 ([fe80::1c6a:c02f:24a4:eec0%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 20:41:23 +0000
From: =?gb2312?B?1uwgzOy6xg==?= <zhutianhao75@hotmail.com>
To: Hyunchul Lee <hyc.lee@gmail.com>
CC: "linkinjeon@kernel.org" <linkinjeon@kernel.org>, "ntfs@lists.linux.dev"
	<ntfs@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] ntfs: fix $MFTMirr write offset when it spans multiple
 folios
Thread-Topic: [PATCH v2] ntfs: fix $MFTMirr write offset when it spans
 multiple folios
Thread-Index: AQHdPwk/BvVdPtFEbU6GgtmLJ20fug==
Date: Mon, 7 Sep 2026 20:41:23 +0000
Message-ID:
 <SY0P300MB0312DC95FDD1B45AF364267EDEB22@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
References:
 <SY0P300MB031263862D7FD47834F1E87FDEB42@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
 <CANFS6baT-+_u+c99qThd7jekqXZ3BW5utLPERLa_X3FE7XiBNw@mail.gmail.com>
In-Reply-To:
 <CANFS6baT-+_u+c99qThd7jekqXZ3BW5utLPERLa_X3FE7XiBNw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY0P300MB0312:EE_|SY0P300MB0545:EE_
x-ms-office365-filtering-correlation-id: 02f56855-ecba-44f4-e806-08df0d20619a
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|41001999006|22091999003|51005399006|8062599012|8060799015|24121999003|12121999013|31061999003|15080799012|15030799006|19110799012|25010399006|40105399003|26121999007|2607281247196008|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?gb2312?B?bTQvcjIrVlZES1FEc2VLazNJRUxqc1FnMWFjaEJrU3BkM3pjdVF2M29kMjlq?=
 =?gb2312?B?RHU3ZzFueFluZXl0aGQzWGtqVDExVzlkV2ZyUWhjUkZtTGJLY3l2WmZFakZT?=
 =?gb2312?B?dWRpVm9Qc1dRV0lXd1dMSkdSN2NmMG5EYXFTZTk0eWo5MzkySkhoSVdEZjJI?=
 =?gb2312?B?L1Fxd3pGWnlFSVFzdStpYXlSQnc2ZXp1dzA1dXdLWnBZZkxUWEF4OEJNeFA1?=
 =?gb2312?B?MlZoYlg4UFh4N1NNeFRqRmc2RmtFbm5jMmVZVmZSNlVjUm9vSXdubW45S201?=
 =?gb2312?B?Rkc5K1RLVjlXMTBjWXFWWm93b0VoYzAyVVh2Ukw4OWpMb1NaUWtXNWNUT3VL?=
 =?gb2312?B?d0hPZzVqTGF5VkRMM2Y4NjJhdWRMME5RRFVDMGpyeDBnM3RKWHFrQ1RoVHhp?=
 =?gb2312?B?ejZ6aEhuN0VySjZiMHQ2clZQT1BMQ05uRERXWXEzY3NEcGE5bStBVEFVMmFw?=
 =?gb2312?B?K1p3elVRZDdrMjl0VzNqamFsc0FBclNVcGtVeC9ieDk2NnYyNklKUFpVMDZn?=
 =?gb2312?B?akRPWUt1Znd1cy9SREdMNktqak83Rk05aEZmR000NXNvT05pazA3cjlFQWg0?=
 =?gb2312?B?blB2bDRLeFVGS0dmTU5QU1JoM1FiOUJCcCt1T0Q0R0tGYkRZcUpXTmVWUHgr?=
 =?gb2312?B?bVJId0s1eWxEWGd5SGlwamFjaFJ1QXpIMG04ZTBUcDZRU1FuUTUrWEJlV2hw?=
 =?gb2312?B?QlNvUWNjSDJXTnhqWE1BOTVhSHVraksrOXJydGZ5bExPZnhLRTdUVFJoV1VG?=
 =?gb2312?B?R1l4aS9BMDlja0dHVG5Ja0x2bE9TYk5yK0dEaUNBYWE1Y1pNVTlXSjcvcFNo?=
 =?gb2312?B?MjN5azBhangyb3ZDcXBGUXRNQlJnNml3eG9ZOFFldllIVUhKa2s0UUtBVWdW?=
 =?gb2312?B?aGtPUk9YRUNCN1JLR0ZBRXN4Q0o0UzI3YlY2OUhCbE4xUStQM09GRTVqU1Zq?=
 =?gb2312?B?NGZHaFFoSHBmNkI2SjVHOXdlSTBDc3ZoSk40Z1cyR2hJNC9GUUllV0pNYndm?=
 =?gb2312?B?aCtrVDk5aFNJR2sycStqL04wWHJmVzNDMlladno2NmkrZ2dxSUYvSW9DWUlB?=
 =?gb2312?B?NVBhSXlDd083T3JVVE9ZYkpIQXRLZ0FidWV0SWF1NzBhRnlTaTFFLzRJem5T?=
 =?gb2312?B?ZW03Q1VRaEhMdHZBT0RrdjVsZDJ2YlZvUVY2UlNSUk0yNGxoYXZ4bzgxeTI3?=
 =?gb2312?B?U1NmaWk1K1A3U3RwTWIvb01CMWpHVHUzOVJyVSswZ1ZvdzgwK0VBcnF0M3lD?=
 =?gb2312?B?b2lBQ2RhTFpoZ3g4L2g3MlFOcVNScEhnc052d3hzWEVpT3Q1bktvMEViWlE4?=
 =?gb2312?B?T3IzcGRiak9OZVhvS1BweXhrMW5wTGRzcmZ5Q3ZEL3AwVGNheEI2dytYN0Nj?=
 =?gb2312?B?UDhCNnhmSEJqb0E1eENUeEtlbzJzUzY1NUdnd0hIcXpvZGdCNmtJOWtIbE9B?=
 =?gb2312?B?UHp2UWJWQzhIbzM3RVZHalkzUTNtTkROek0rZVFJVGtpUW0xVVh4b1BnY0tZ?=
 =?gb2312?Q?7UJOTMqQ0prS2Eh0WzLLSLx6hbY?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MWUySmhCSTlBRllya3AxTjF6VWliUVpvbjA5N05FUzlNSzI0RDNpTldtWnN2?=
 =?gb2312?B?T1NBYlg2d0RHVEdVNUpTeFhoSmZEL3RXb1lYaUJyL2pOc2o4Y1k4bE5WMHQr?=
 =?gb2312?B?anhZYWp5RUg2RFdscUV1RVUwZytHTndCck9wKzNjM2IzU0U0ZlVEVWJSWlkr?=
 =?gb2312?B?N25JQ0NnVVcyZHFYampBcDN3dWF6UC9raVVuMkN2a29FRXRzUkMyR3NwOXk0?=
 =?gb2312?B?S1FacUJSK1VGYUkzOVFIT1JQTXZFOFZMa1RvRkl6all4UUoyN2Juc3hVVmhn?=
 =?gb2312?B?VmxBM2pBUzZPS3VncXorNVdRNENCOG8zbEhhaDVsdTcxSUdwUjRkNVd6Y2po?=
 =?gb2312?B?RGgzVVB4SzhjUThaR2w3TUV5eDcrMzMreHVQMFc2Y0RyTmMwOGd4ZkFCeGV5?=
 =?gb2312?B?dDZ4ZGxBOW1Ma1c3a1dGMjNnNDRPRjB0OEUzZStIOENOanJ0WkpXSzgwcGZN?=
 =?gb2312?B?cW0vZFkzNGxwSzdNUCsxamVMQi9HVm12Qjg2N3llNWRaUXh4WTFLTzFUNk1r?=
 =?gb2312?B?ZXg3YXNYTUo4cWtUc21qR0NhSFEzenBacDh0M3VMUGVPVXFVN0dIOXJyQ3lT?=
 =?gb2312?B?U0owSE5Cd2ZVR2lwRjNJZzd1TE1rZWJUM3ByZlR0dm5qRi93bS9hR2FhTXU4?=
 =?gb2312?B?ZkNEYnlNSDJuVXBhZWlUbnNLTjNVTzZvcU5ZOGVRZVlyM1JyREhsZUZNZVJR?=
 =?gb2312?B?Nm9lL1BKYTUxd1lJQ0pJSjJ3S3VWdit2MGFpaEFFQU83UFZ3OTBHUWt1QllH?=
 =?gb2312?B?WXRpamFORFdBSS9sei9wcmxUWTIvRW42ZFJDbWZ4SEZ5TnBQRWw3cjNTdmhK?=
 =?gb2312?B?WHhjS093ZDVZaVk3S21hQUx0Y3N2WDU0dXR6WWdrTUsvUjNpK05lak9sWXN1?=
 =?gb2312?B?dVVnaElVWTZCMzVLLzFLVnVPT3AvazRWVmVKdkpsbStFYkRXTXV2WGkwZzYv?=
 =?gb2312?B?Vm0vMVdiUlY4bkVOTUh0NEV2TlZWVGk1UHVDdFFsNzJobGYzL2NobkJ1NlFI?=
 =?gb2312?B?L0U0TVo3YytPdmVQUmZNMFRnTDgxdk5zOTJvVWd4ejFFcm5TNDVrM1Z5RW9G?=
 =?gb2312?B?S2Z4eXlZRVdhWTlmMkUvc20vTjNJQUtLaGRUM3VJY01KTExEMEFWbjV1MTFB?=
 =?gb2312?B?ZngzOG5PSERMTTd3dDc3eU5wNTdlblV2WmlnWnE1NldhVE1PS2h5VDA1SXNa?=
 =?gb2312?B?MGxQY2ZUZFZWSzkwVTIxbG1oOE1Dd2ZzK0tYMy9HZS80WVlvOFBwOWJwV0My?=
 =?gb2312?B?ZXZXNzBWVnUxcFdlQi9ETmZkVlNqcTYvNkh1VEtxRzNibGRObUtwQWsyOGlW?=
 =?gb2312?B?MjVLaStJajVSWHFjWkJjWHNGcTVDR2RQN3NOMjRtWkVXWUVxR0s5cmZrVEZ6?=
 =?gb2312?B?SktGc2Z3RHB5cTRjamE4NGZxTHRrK0xWcXF0a1JIZ0RHOEZUWE5lQ2U1SnZ3?=
 =?gb2312?B?L0x5ZmtFMHNWS3RkS1d0ZTc1OTM1Und1NHdvbER3MllNZXYxVXhUSVU1Z2xG?=
 =?gb2312?B?TmpIVzJ2cW8wdDNvQ3JNeDZIczlVelNJbnRWclBrRDNHMjhlTCs5aWhIWTYy?=
 =?gb2312?B?NDdKN0VrdTk3ZXdpY1p0bVVVOVpkdUxHbGhiUFBEZTNmYzdDSjVBSmt6Y01r?=
 =?gb2312?B?Tlo0V3pCN0NVbEVKZlZEVG82L0N0YWk2Y1NMRjZnVk5RK0ZEQlZMZWFockRZ?=
 =?gb2312?B?NnNWYStncjdmMGkxaE9lNkl6Ykd3T3VXUDdwdk9ndEVyVlc3RGl6N0dmR1VO?=
 =?gb2312?B?Z2hPMTcrUjlDWjZKaVhtVWtqMmNJaVdseEE3Nm5NWENseCtjQmxQbjdjcGpq?=
 =?gb2312?B?RWo0RTkzejRsaytEc1lGS0UyYkkvM3ZJM2J5QzlCWjNZMjQvSGgrVGtPaW9J?=
 =?gb2312?B?S2xLNkdGVVNlMnZEU0Rta2ZtaFQrbzJlMW5Odk0ybWU2SGg1TkJoNU9ldGMy?=
 =?gb2312?Q?ylaZAT9Ps8p9g0H7ocOlpE18Vj4QmB9d?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ntfs@lists.linux.dev
List-Id: <ntfs.lists.linux.dev>
List-Subscribe: <mailto:ntfs+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-4606f.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f56855-ecba-44f4-e806-08df0d20619a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 20:41:23.7165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0545

V2hlbiBjb21taXQgMTE1MzgwZjlhMmY5ICgibnRmczogdXBkYXRlIG1mdCBvcGVyYXRpb25zIikg
cmVmYWN0b3JlZCB0aGUKTUZUIGNvZGUgdG8gdXNlIGZvbGlvcywgaXQgYXNzdW1lZCAkTUZUTWly
ciBpcyBhbGxvY2F0ZWQgY29udGlndW91c2x5LAp3aGljaCBpcyBpbmRlZWQgd2hhdCBta2ZzIGFy
cmFuZ2VzLiAgSG93ZXZlciwgdGhlIGZvbGlvIHJld3JpdGUga2VwdCBhCmxlZnRvdmVyIGZyb20g
dGhlIG9sZCBidWZmZXItaGVhZC9ydW5saXN0IGJhc2VkIGltcGxlbWVudGF0aW9uOgp2b2wtPmNs
dXN0ZXJfc2l6ZV9tYXNrIGlzIHN0aWxsIGFwcGxpZWQgdG8gdGhlIG1pcnJvciB3cml0ZSBvZmZz
ZXQuCkluIGZhY3QgaXQgaXMgbm8gbG9uZ2VyIG5lZWRlZCAtLSBhbmQgaW4gc29tZSBjb25maWd1
cmF0aW9ucyBpdCBpcwphY3RpdmVseSB3cm9uZy4KClRoZSBidWcgdHJpZ2dlcnMgd2hlbmV2ZXIg
dGhlIGZvdXIgbWlycm9yIHJlY29yZHMgZG8gbm90IGZpdCBpbiBhCnNpbmdsZSBmb2xpbywgaS5l
LiB3aGVuIG1mdF9yZWNvcmRfc2l6ZSBleGNlZWRzIFBBR0VfU0laRSAvIDQgKGZvcgpleGFtcGxl
IG1mdF9yZWNvcmRfc2l6ZSA+IDFLaUIgb24gNEtpQiBwYWdlcykuCgpGb3IgZXhhbXBsZSwgb24g
dGhlIGJ1aWx0LWluIDRLbiBTU0QgKEFwcGxlIFNTRCBBUDAyNTZKKSBvZiBhCk1hY0Jvb2tQcm8x
NCwxIHdpdGggNDA5Ni1ieXRlIE1GVCByZWNvcmRzLCBtaXJyb3IgcmVjb3JkIDMgaXMgc3RpbGwK
d3JpdHRlbiB0byB0aGUgbG9jYXRpb24gb2YgcmVjb3JkIDAuICAkTUZUTWlyciB0aGVyZWZvcmUg
Z2V0cyBvdXQgb2YKc3luYyB3aXRoICRNRlQgYW5kIHRoZSBmb2xsb3dpbmcgd2FybmluZyBpcyBw
cmludGVkIG9uIHJlbW91bnQ6CgoJbnRmczogKGRldmljZSBudm1lMG4xcDMpOiBjaGVja19tZnRf
bWlycm9yKCk6ICRNRlQgYW5kICRNRlRNaXJyCgkgICAgICByZWNvcmQgMCBkbyBub3QgbWF0Y2gu
ICBSdW4gY2hrZHNrLgoKRml4IGl0IGJ5IGFsd2F5cyBhZGRpbmcgdGhlIGZvbGlvIG9mZnNldCAo
Zm9saW8tPmluZGV4IDw8IFBBR0VfU0hJRlQpCnRvIHRoZSBiYXNlIExDTiBhZGRyZXNzIGluc3Rl
YWQgb2YgYXBwbHlpbmcgdGhlIGNsdXN0ZXJfc2l6ZV9tYXNrCnRydW5jYXRpb24uICBUaGlzIGlz
IHRoZSBzdGFuZGFyZCBmaWxlLW9mZnNldCBjYWxjdWxhdGlvbiBhbmQgaXMKY29ycmVjdCBmb3Ig
ZXZlcnkgY29tYmluYXRpb24gb2YgY2x1c3RlciBzaXplLCBwYWdlIHNpemUgYW5kIE1GVApyZWNv
cmQgc2l6ZSwgcHJvdmlkZWQgJE1GVE1pcnIgZGF0YSBpcyBjb250aWd1b3VzIGZyb20gbWZ0bWly
cl9sY24KKHdoaWNoIG1rZnMgYWx3YXlzIGFycmFuZ2VzKS4KClRlc3RlZCBvbiB0aGUgdm9sdW1l
IGFib3ZlOiBiZWZvcmUgdGhlIGNoYW5nZSBtaXJyb3IgcmVjb3JkcyAxLTMgYXJlCmFsbCB3cml0
dGVuIHRvIHJlY29yZCAwJ3Mgc2VjdG9yOyBhZnRlciB0aGUgY2hhbmdlIHRoZSB3cml0ZS1iYWNr
CnByb2JlIHJlcG9ydHM6CgoJbnRmczogTlRGU0RCRyBwcmUgbWZ0X25vPTB4MyBmb2xpb19pZHg9
MHgzIG9mcz0weDAgbWZ0bWlycl9sY249MHgyNTQwYzUgY2x1X2JpdHM9MTIgcmVjX2JpdHM9MTIg
UEFHRV9TSElGVD0xMiBzZWN0PTB4MTJhMDY0MAoJbnRmczogTlRGU0RCRyBwcmUgbWZ0X25vPTB4
MCBmb2xpb19pZHg9MHgwIG9mcz0weDAgbWZ0bWlycl9sY249MHgyNTQwYzUgY2x1X2JpdHM9MTIg
cmVjX2JpdHM9MTIgUEFHRV9TSElGVD0xMiBzZWN0PTB4MTJhMDYyOAoKd2hpY2ggbWF0Y2hlcyB0
aGUgZXhwZWN0ZWQgc2VjdG9ycyBjb21wdXRlZCBhczoKCgkoTlRGU19DTFVfVE9fQihtZnRtaXJy
X2xjbikgKyAoZm9saW8tPmluZGV4IDw8IFBBR0VfU0hJRlQpKSA+PiBTRUNUT1JfU0hJRlQKCgly
ZWNvcmQgMDogKDB4MjU0MGM1IDw8IDEyKSArIDB4MDAwMCA9IDB4MjU0MGM1MDAwID4+IDkgPSAw
eDEyYTA2MjgKCXJlY29yZCAzOiAoMHgyNTQwYzUgPDwgMTIpICsgMHgzMDAwID0gMHgyNTQwYzgw
MDAgPj4gOSA9IDB4MTJhMDY0MAoKQSAxMyBNQiBmaWxlIHdyaXRlIHN1Y2NlZWRzIG9uIHRoaXMg
dm9sdW1lIGFuZCB0aGUgZmlsZSBpcyBieXRlLWZvci1ieXRlCmlkZW50aWNhbCBhZnRlciBhIHVt
b3VudC9tb3VudCBjeWNsZS4KCkZpeGVzOiAxMTUzODBmOWEyZjkgKCJudGZzOiB1cGRhdGUgbWZ0
IG9wZXJhdGlvbnMiKQpBc3Npc3RlZC1ieTogVU9TLUFJCkFzc2lzdGVkLWJ5OiBDb2RlQnVkZHk6
SHk0IHByZXZpZXcKU2lnbmVkLW9mZi1ieTogWmh1IFRpYW5oYW8gPHpodXRpYW5oYW83NUBob3Rt
YWlsLmNvbT4KLS0tCnYyOgotIFJlbW92ZWQgdGhlIHVucmVhY2hhYmxlIGZvbGlvLXNpemUgZ3Vh
cmQgKHRoYW5rcyBIeXVuY2h1bCBmb3IgdGhlIHJldmlldykKLSBEcm9wcGVkIHRoZSAiV2hpbGUg
aGVyZSIgcGFyYWdyYXBoIGZyb20gdGhlIGNvbW1pdCBtZXNzYWdlCi0gQ2xhcmlmaWVkIHRoZSB0
cmlnZ2VyIGNvbmRpdGlvbiBhbmQgcmV0aXRsZWQgdGhlIHN1YmplY3QKCmZzL250ZnMvbWZ0LmMg
fCAxMCArKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL250ZnMvbWZ0LmMgYi9mcy9udGZzL21mdC5jCmluZGV4
IDdlNThjOTlmMTcyOC4uODM5OWYwN2Q0NWQ2IDEwMDY0NAotLS0gYS9mcy9udGZzL21mdC5jCisr
KyBiL2ZzL250ZnMvbWZ0LmMKQEAgLTQ2Miw3ICs0NjIsNyBAQCBpbnQgbnRmc19zeW5jX21mdF9t
aXJyb3Ioc3RydWN0IG50ZnNfdm9sdW1lICp2b2wsIGNvbnN0IHU2NCBtZnRfbm8sCiB7CiAJdTgg
KmttaXJyOwogCXN0cnVjdCBmb2xpbyAqZm9saW87Ci0JdW5zaWduZWQgaW50IGZvbGlvX29mcywg
bGNuX2ZvbGlvX29mZiA9IDA7CisJdW5zaWduZWQgaW50IGZvbGlvX29mczsKIAlpbnQgZXJyID0g
MDsKIAlzdHJ1Y3QgYmlvICpiaW87CiAKQEAgLTQ5MiwxNSArNDkyLDExIEBAIGludCBudGZzX3N5
bmNfbWZ0X21pcnJvcihzdHJ1Y3QgbnRmc192b2x1bWUgKnZvbCwgY29uc3QgdTY0IG1mdF9ubywK
IAltZW1jcHkoa21pcnIsIG0sIHZvbC0+bWZ0X3JlY29yZF9zaXplKTsKIAlrdW5tYXBfbG9jYWwo
a21pcnIpOwogCi0JaWYgKHZvbC0+Y2x1c3Rlcl9zaXplX2JpdHMgPiBQQUdFX1NISUZUKSB7Ci0J
CWxjbl9mb2xpb19vZmYgPSBmb2xpby0+aW5kZXggPDwgUEFHRV9TSElGVDsKLQkJbGNuX2ZvbGlv
X29mZiAmPSB2b2wtPmNsdXN0ZXJfc2l6ZV9tYXNrOwotCX0KLQogCWJpbyA9IGJpb19hbGxvYyh2
b2wtPnNiLT5zX2JkZXYsIDEsIFJFUV9PUF9XUklURSwgR0ZQX05PSU8pOwogCWJpby0+YmlfaXRl
ci5iaV9zZWN0b3IgPQogCQludGZzX2J5dGVzX3RvX2Jpb19zZWN0b3IoTlRGU19DTFVfVE9fQih2
b2wsIHZvbC0+bWZ0bWlycl9sY24pICsKLQkJCQkJIGxjbl9mb2xpb19vZmYgKyBmb2xpb19vZnMp
OworCQkJCQkgKCh1NjQpZm9saW8tPmluZGV4IDw8IFBBR0VfU0hJRlQpICsKKwkJCQkJIGZvbGlv
X29mcyk7CiAKIAlpZiAoYmlvX2FkZF9mb2xpbyhiaW8sIGZvbGlvLCB2b2wtPm1mdF9yZWNvcmRf
c2l6ZSwgZm9saW9fb2ZzKSkKIAkJZXJyID0gc3VibWl0X2Jpb193YWl0KGJpbyk7Ci0tIAoyLjUx
LjAK
