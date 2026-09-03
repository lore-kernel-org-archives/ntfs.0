Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazolkn19010002.outbound.protection.outlook.com [52.103.73.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26D4A841F
	for <ntfs@lists.linux.dev>; Thu,  3 Sep 2026 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.73.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439463; cv=fail; b=BRJwiE1rO7FksZHGiUDWCE1N7Z4O0Ra1DO3z2pzqushAYL9Z4KaVImIt6IdJ33p8dLV4D2KSMoYb73ITW0EQK+3GtKOooKxtFPJMLFyagpIjKiZ7rotkffCCtygWt+kFnySudJkxCCENrALilNRQ6/NqHW2hIXVPllIMRhmYAtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439463; c=relaxed/simple;
	bh=eA2SL0BcKUmOrHrAWWTa3PCs4AL+FZZCcwJC3YHUUkA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RIh0UD/51y5O3J5dqEyfNp/b7qfGcPICWwr/xDfkue3+js6/ynyvxEBtFGi/ME8QBzoqG5MuST/u9+JhgWKVqgcCaaODyYxKnTaPcDOZD2GinhQi7vlO8JCHX/YiLyCdU+DfFZmfECLITkub2hlASsz4pJ2OX3L/0ZhIr/rorQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=hXdxXAGR; arc=fail smtp.client-ip=52.103.73.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="hXdxXAGR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyi4ZkQ4cYx8cCLoy3z6ztlx8j9kg7ZTzn63+19OBQaU7ZLxLw1u0HyIEDZ5SOjBLRcBqYvZbwmsJiNmyIgx9b/oo45kJTAETu9jBPBVcKYFaTLatCIoOoBerUJK+7NaLOuLnUxaFP2Y4qmS/BWN1ydlbc89YxVfkbgpSN4lCUaXAWS0lU4WZeaT4/RKTCSeAwb6fi67mQpIr/5ARP1l42haCOT8NYHtfoNRcMo/z4V/N62wKfyVfZPHQIgtv+1Z9uP5WVkvwUawrv0W3IIaz17X4Ugel5HFWtc8DMep9K3kMoyv/B/8/ky5q8BpcgtnES2iQrKqtX0N5nnP1iahKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eA2SL0BcKUmOrHrAWWTa3PCs4AL+FZZCcwJC3YHUUkA=;
 b=n6WGKms8XngPGqtTHDa/yFLm94VXrxfFZXL+y92TqvtrvePMQfUufQXwx+xOPEAt6xLsZT33nd6dFvLtMnJ9YtS6oxEyCyqS18ZrpxQZdWeX51RMpy3w57gw+/fMqf5DN864mQZDp+Mu3ES9TBFL63iWtoXcgTDlyQn1HU0JAmwwusXo51WdY1Sf5uvKQ3GQNSHcGsIR5wN0mr9E1291ZLCtEah/wlWoEKRmjQ/TLw2B64T8gz7qld4xIMIXhV9nWKkS1fmOq7bNjpzS2fbw7iCe3/1Phj105k3fCTcssfNDQ3AusxjVUJogdHN/NWdcTO3j4WUNfkivV5zJhku2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eA2SL0BcKUmOrHrAWWTa3PCs4AL+FZZCcwJC3YHUUkA=;
 b=hXdxXAGRDYL7oDvQm1Og7CkyFSxKTB8wTbDJnWRXwHBILZ7Z6jDKb4Ov3XrAMBMGLQj6HiY+5pPCXP5MzQw9p0O17VFjTCExOJL/iSLa/k6p6unfbMDiv8NQg2O9Cvhhi0UM1D5tgyq39p1R8iT5jScrLA+W5RhvngMpFf7SzTBHkEHCxRFot1+Fhky7nfBBKE+imH0LS5zMdAuESme0dpwxTQgFIr16HQLoNqFeVVq+o9+A47g59tkUzioXqA2r8jS4mBo//uYEnygwhFxziuKpvz2TtrG6Z75jafZz8h1a/0bRPftbn6Wzr1OVGsVBGF8GofqkchNT06i2fNMXdg==
Received: from SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:24c::11)
 by SY7P300MB0055.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 12:44:16 +0000
Received: from SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM
 ([fe80::1c6a:c02f:24a4:eec0]) by SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM
 ([fe80::1c6a:c02f:24a4:eec0%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 12:44:16 +0000
From: =?gb2312?B?1uwgzOy6xg==?= <zhutianhao75@hotmail.com>
To: "linkinjeon@kernel.org" <linkinjeon@kernel.org>, "hyc.lee@gmail.com"
	<hyc.lee@gmail.com>
CC: "ntfs@lists.linux.dev" <ntfs@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?1uwgzOy6xg==?= <zhutianhao75@hotmail.com>
Subject: [PATCH] ntfs: fix sector conversion on 4Kn devices
Thread-Topic: [PATCH] ntfs: fix sector conversion on 4Kn devices
Thread-Index: AQHdO56ejJyAklp2tUCGikkzN+n1yw==
Date: Thu, 3 Sep 2026 12:44:15 +0000
Message-ID:
 <SY0P300MB0312121B2DA3A618B0632D3BDEB62@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY0P300MB0312:EE_|SY7P300MB0055:EE_
x-ms-office365-filtering-correlation-id: 30fe29a5-10a9-487b-c7ae-08df09b9107f
x-ms-exchange-slblob-mailprops:
 7qh87CJt6y1mqZO6407WRLxlypE3k+ejQwbSTxP0P7pJmOt8ytz7iGkHdm1rtl9D+1bsus7VhYwbkizWKWL9zur8qHHAySedsyh9BSncYOlJH6D4UHXOVvjRDkt+lzoK0emOpInuAMper2YV/VfSDIBKSvhVmaaGSYfJ4AsJaTN+kolwwaH2mHPAJ+EMVP24mx6p2t106BwJUqp3Hwq5+aInnIoOAsdmj6w4kqUo9hF1TS+3Lg8crm8l476h39vVWIr4r3HrKAqG8FzNQJp/Ohc5c542TbW7KG6jxj3lIxTBfMPeYIN9ugb/hHqMRA1UUdGgSqsstbdZiQ10cN5LPmhD7YVM+O+ERnY8n3MNN0wktwIR0eX3EigfXEWCjOmu1ZZP2yjUrzsiCXgltrMmS1FX6DMWjFwnuTdZUVeDQqq6dcv2TqUtHN0vXIbvf2nEStK2qEkwTWlRy6prQLvjEE36GMlyA0i4fLlhPZAErn91wn2fPOp0cEhF1FBdkKFAT9BGUPx5nokjKIHytz/ZB1dvKKQSZl0maC6DfaIDHErZOeEKwH6Ox1fjYXK2Am4MZpSGUxe8N7OEE10HAzXqBNhqEWpwXX2kCiRbc/gdrjB1AExH175ay+KlS5GZfNSnrIf/qH19fWIVlGIdb/IILGgSOod+BODVToNDZqbaSrW8v78IQNeOVkv76zhVUCxfC5zvn8Ka39Zfg8enCz4gt471hCEXPqdcjDeFay44v3Esg1ytoKtw7846kePGpuQ3
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|22091999003|41001999006|24121999003|22141099003|8062599012|15030799006|8060799015|19110799012|31061999003|39105399006|15080799012|4140399003|6050399003|40105399003|26121999007|2607281247196008|3430499035|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?gb2312?B?eEFOZW5IbGpzTUd3dUVnUWZTbmZ5L3Z4R1p2YUc1RlFoQ3ZIOG9KVTlQbldC?=
 =?gb2312?B?ZC81c2J2djJQTnFGMU5qcHVucTF0NE5zVmkweDlUQ2hXQnB3dkJha1hxaUxX?=
 =?gb2312?B?RU94VS9tUVJSbFVEb0JrdFV1OXAwMWlzMVBURkJVc0JFOEllS1ZnY2FkU3Bl?=
 =?gb2312?B?ZTBMNE1SYzIvR2lJU01PYmxZY2lIalF1M3c0N1huQTIyZVRhSFh4eTMyZlRy?=
 =?gb2312?B?ckZ4elhUMjE5WHRIYVoyY0l1MjF5OW9HOUR2QTB0VzFTdFE2Yk5yRngrQmFx?=
 =?gb2312?B?Q2lodDZjTGZQZnRudUduOHJuL2RMekRxa0JPVmliS0VQZ3pybmY5WEF2WHI0?=
 =?gb2312?B?bWI3c2k3ZWdzWGJTYmpTMGhRemlYeXNpckF1cjdvSlUrQkVHK3VKTW1wb2JX?=
 =?gb2312?B?cG4wWVUzdVliUUxnSWtVWHdMYWdUQ1RFZ09hK2hnSHlqcUJsTHpkZWNLa1h1?=
 =?gb2312?B?NGdCek1SelN5MGJ3Z0hCQXROTHQvdVJENUdJOEpnYnMySFFJclNuajNoQk1O?=
 =?gb2312?B?emkwN0ZFZGJrR2ZGREF2aDJJSGRmZjRBbXp6WXpkSGkrWVQzSmJaZ1FWVkhu?=
 =?gb2312?B?QWk3OWVWYm9SOFlPekJncmcxZzJZMEhnMFQ0RS9la3FFMWh5cVp5SXBpdVhE?=
 =?gb2312?B?VGVWdjRNL1UzT0pDRFlidHFDQkZLSkk2R3VXWVc3OVovVGNQazZkYlkwTFow?=
 =?gb2312?B?Z0RyM1lFNnBjY2ZZWDk2RDZaaGo0VFBuUnZEZDNPcnNET1F6Z2dzTWVySUl3?=
 =?gb2312?B?dUxQMUdTUUwyTDhGQU1kMFBQNVNhTW5ZRlNUVVVUWFBQdnp2ZEdYSUhibGw4?=
 =?gb2312?B?RGZTQ01YcWQ2VjBPai9IRU1OZGxTNmJNRFhRaXlqek5TaytEYnM3ekVXbW1K?=
 =?gb2312?B?cnFMYUpQMy9JcEljRUtCcE91MVpZa0xkVjQ2NzVoc2MrNlp3eW44Y0tFUzNG?=
 =?gb2312?B?ajVKNGt1RG1LNXpZZUo1QXQzSVVYajlDK2dOYWZqbTZFaVljWlRnZ3ZwT0pn?=
 =?gb2312?B?SHJRbFFpMmxMcXJ6S0ZyRVhVQ0VqaUtneGppOHBldmJnWnhDN29nZnM5OTVT?=
 =?gb2312?B?SjZ1a29lWjJEUFlGTFZGOG9HQ1JxZERvMUcyejBGRHlRall6OW9TRmJZWStE?=
 =?gb2312?B?bktmSEJOTzlpTXB5QXp4Q3FIenE3bSticXZ1OWs1SzF2WVBQeEVGWmt0Tk9p?=
 =?gb2312?B?dFFEcGlnZGVmZ2QwVlFnVFIwazRmZzFZNkJhdlhYUUFmL0w4a1Izb3Z4WE9H?=
 =?gb2312?B?SnNtczl6Q2lNTEQ1M0VIZ3NLZWQ0N0Q5OHVpVDFibGc3SmpudGtHMlBnaW13?=
 =?gb2312?B?ZlVxUE54RVZHaXFhTURIRkFtMktQN1N2KzdmbG9laTJRYm45YVZGWmt5czNB?=
 =?gb2312?B?U0ZqQ0I1S1JmeEU0aVB3aDF5NkJTN3dVajQ5STdwa2Q2VFJ0MGF3SENHTGFm?=
 =?gb2312?B?YnNudDZyTndVL3l1QzFLTnZ6TmZPdllwQkY3SUVvS0piWWpzRUFLT0V0M1ZZ?=
 =?gb2312?B?VlgrYi82MEhUZzhIVE9ML1hyU2dpZzlydXFBSjI3dDlBaElzeHczNkxuZEw4?=
 =?gb2312?B?ekp3UT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?S3JMU1hZUTFQMDJUUGFOdXJRQm1rUHVMT3JVMFV0emlaakxCNHRtRDVFQ3l4?=
 =?gb2312?B?cXNzellPWjltSko3b1pTTkFOczltSmdCVVBmclBLMGNDVGd4UEJQQmJ1andk?=
 =?gb2312?B?UWk3N2xtUXJiWDZ3ZnU3T0pkZjZpTU8zN2pKR2cwb0gzcUJZVFJtSDNuamNl?=
 =?gb2312?B?U1hEaDhBSC9YdEhUY0VmMjdnN0FTOXMxejgxREVEencxaUp4ZGFFdjYrdkVz?=
 =?gb2312?B?UW9jNFFtZWYwUm05MHdFNFB3UG5oNmFvWmpUaXl6TG5qcFRVQnNPTWpYc3ZO?=
 =?gb2312?B?T1R6Z09tL0ZQV0RjQVo0Mk1IdXNiTU9RTHBoY0J1QytOYjFKT0lPSFIxU0lC?=
 =?gb2312?B?TVRnTGZWTnIxamphTWhMS0dJT05qSm4xbnltZk93YWJYaUFkeHlYZ1lFZ0l6?=
 =?gb2312?B?NWptZWpqNVRIbDQwOU8yZHFQaU1tUENVMkIweFd6bGgvbXd2V1NpN1RWMzl2?=
 =?gb2312?B?c1FOQXpqYW9TeElyK0c5cE5WeVZxMlZOaGdnaEtMaklzRHlzYVJIQkh2L1kz?=
 =?gb2312?B?QWlVOGt4bjc4VGVhbjl1c2NpbDN6QjR0WHJpTW4wZzhVL2xBWSthYjdBUlVG?=
 =?gb2312?B?bWZyeDd5ZzN1UjB5Zm1DUDFSR2ZhQUJRZUF5K1pGZGlIZVppWjdHejdnT3Jv?=
 =?gb2312?B?Tk1uem1TWE1CbTVBOWJEbUlqOGRpaDRJVGkxOEd4emtwVGxhQmN5dGpBdnFS?=
 =?gb2312?B?SzhpenhnQ3ZkM0hpekQ1Q1VsN3BMVVlpNzY3SHJFWW9vZVN5TkxDOTBNaGtS?=
 =?gb2312?B?RExSMkRqU3NBWjRjT1VBYmpOZzJCbE1jUkRrRUZ5bzBvT2JHeGNjTWowR3JM?=
 =?gb2312?B?bWhodVE3ejBNNFNvczA5STZrdFNLZnBQV0JwK3J5RnQ2dkNXcmN2cFY4N3BS?=
 =?gb2312?B?MHRyNjN2SjFBN2VLNEo5djNCaTI5blVlclNlNXYwMHhiZVlHRUZTc0VMTVB5?=
 =?gb2312?B?aUIvMC9CYkwvbUJ3cUlUMTczUVVJSnBXVXVabWp0djdjZVpjQWEySnFnbnhQ?=
 =?gb2312?B?SVZUak94bEsydHJNQ3hoZ05Ed2RLbG5wYi9xZXdvMGRwVHhqVy9BbEZLb0ZP?=
 =?gb2312?B?dUN5YlM0N3A3NmMxMmZRa1dsSU9taGZUQ2xoVDhNYjZIejZTUWhwcFdocURw?=
 =?gb2312?B?a1Zxb1hmd25iSTBlYXpsR2w5MTBpdExOUmZjNkc2clU2K3hKRDVMZkxkM25a?=
 =?gb2312?B?YzM4VkV4RGFDS1VMVW1Ja3pWV2NxOHorL1dPWElHY2FGY3FaUXJSSy9kdjBG?=
 =?gb2312?B?RTFreVpvdkpncHBHSnROaThkTHl5RHR6YnRtcWwxZFYyc0xBSzQyclNIQURL?=
 =?gb2312?B?STlDTGZOdkkwM3hya25PNWl4ZkRBeDlmRDBqbVRIQ0lvVW9pRUlxSmZ2VDhR?=
 =?gb2312?B?Rkdka3BIc2FoZTdJQ0tYZFErWFRKUnpLR3RqWGc4RlJoSW9mNUVqQTdUdTVT?=
 =?gb2312?B?T0JxN2ZtQ2w5K2VyaWhDcVQwRmJNdTVsTkkrMjJ2aUIwa0VUOU1WMWFKVHN5?=
 =?gb2312?B?ZXVPTWpkdS9pMEI0SGNzb003MU12UWE3VmRzbDhhRytMVkNsRmdGUFVkMXo5?=
 =?gb2312?B?RXBUTWJMZGpQdElYY2V5ZG42VkxEMHp1WUl1U3c2b3pOSGtEOGppa0JzTTJy?=
 =?gb2312?B?S2xlamNFMGpGa2FRbkFnemRaRU5TVkpnTGZ6cDNyMzNpcXhrZEZFZkJOMVU1?=
 =?gb2312?B?WldjS2VDMGI3bWd3UW9MdGZlazJ0Q2FWRTUwamg4Tnl4N2xlakxLM2FHTDRi?=
 =?gb2312?B?TitLVTdoeENLVmdyNnlnQjhRRnJ2TnRiRWVrUGFMSXBwR2JkRUVwQ04rRnZq?=
 =?gb2312?B?V0VZZEs2NWIrYUhHeFNSS0tHSUlsYkNjbTBFTDk5Sm1kR0Q4RHFTM1RFYTUw?=
 =?gb2312?B?dmU0cVJ4NHd0Q291cFNRakhXeFZ0ZWQ4L1dYUmo2bHRFZlVGS2MvcHRqT0pn?=
 =?gb2312?Q?bOL7lk61s3GJynpEyaGvQA2uMPDBDzws?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fe29a5-10a9-487b-c7ae-08df09b9107f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 12:44:16.0074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0055

VGhlIE5URlMgZHJpdmVyIHdhcyBjb252ZXJ0aW5nIGJ5dGUgb2Zmc2V0cyB0byBiaW8gc2VjdG9y
IG51bWJlcnMgdXNpbmcKdGhlIGZpbGVzeXN0ZW0gYmxvY2sgc2l6ZSAoc2ItPnNfYmxvY2tzaXpl
X2JpdHMpLiAgSG93ZXZlciwgYmxvY2sgbGF5ZXIKc2VjdG9yIG51bWJlcnMgLSBiaW8tPmJpX2l0
ZXIuYmlfc2VjdG9yIGFuZCBzZWN0b3JfdCAtIGFyZSBhbHdheXMgaW4KdW5pdHMgb2YgNTEyIGJ5
dGVzLCBpbmRlcGVuZGVudCBvZiB0aGUgZmlsZXN5c3RlbSBibG9jayBzaXplLgoKT24gYSBkZXZp
Y2Ugd2l0aCBhIDQwOTYgYnl0ZSBsb2dpY2FsIGJsb2NrIHNpemUgKDRLbiksIHNiX21pbl9ibG9j
a3NpemUoKQpsaWZ0cyBzX2Jsb2Nrc2l6ZSB0byA0MDk2LCBzbyBldmVyeSBNRlQgd3JpdGViYWNr
IGJpbyBidWlsdCBieQpudGZzX3N5bmNfbWZ0X21pcnJvcigpLCB3cml0ZV9tZnRfcmVjb3JkX25v
bG9jaygpIGFuZApudGZzX21mdF93cml0ZXBhZ2VzKCkgZW5kZWQgdXAgd2l0aCBhIHNlY3RvciBu
dW1iZXIgZWlnaHQgdGltZXMgdG9vCnNtYWxsLiAgVGhlIHJlc3VsdGluZyBMQkEgaXMgbm90IG9u
bHkgd3JvbmcsIGl0IGlzIHVzdWFsbHkgbm90IGEKbXVsdGlwbGUgb2YgdGhlIGxvZ2ljYWwgYmxv
Y2sgc2l6ZSBlaXRoZXIsIGFuZCBzb21lIGNvbnRyb2xsZXJzIHJlamVjdAp0aGUgd3JpdGUgb3V0
cmlnaHQsIGUuZy46CgogIG50ZnM6IChkZXZpY2UgbnZtZTBuMXAzKTogbnRmc19zeW5jX21mdF9t
aXJyb3IoKTogSS9PIGVycm9yIHdoaWxlCiAgd3JpdGluZyBtZnQgbWlycm9yIHJlY29yZCAweDMh
CiAgbnRmczogKGRldmljZSBudm1lMG4xcDMpOiB3cml0ZV9tZnRfcmVjb3JkX25vbG9jaygpOiBJ
L08gZXJyb3Igd2hpbGUKICB3cml0aW5nIG1mdCByZWNvcmQgMHgzISAgTWFya2luZyBiYXNlIGlu
b2RlIGFzIGJhZC4KClJlcHJvZHVjZWQgb24gYW4gQXBwbGUgU1NEIEFQMDI1NkogKDRLbikgd2l0
aCBhIHZvbHVtZSB1c2luZyA0MDk2IGJ5dGUKc2VjdG9ycywgNDA5NiBieXRlIGNsdXN0ZXJzIGFu
ZCBjbHVzdGVyc19wZXJfbWZ0X3JlY29yZCA9IDE7IGFmdGVyIHRoZQpmaXggYSAxMyBNQiBmaWxl
IHdyaXR0ZW4gdG8gdGhlIHZvbHVtZSBpcyBieXRlLWZvci1ieXRlIGlkZW50aWNhbAphZnRlciBh
IHVtb3VudC9tb3VudCBjeWNsZS4KCkZpeGVzOiA0MDc5NjA1MTk5MWQgKCJudGZzOiB1cGRhdGUg
aW4tbWVtb3J5LCBvbi1kaXNrIHN0cnVjdHVyZXMgYW5kIGhlYWRlcnMiKQpTaWduZWQtb2ZmLWJ5
OiBaaHUgVGlhbmhhbyA8emh1dGlhbmhhbzc1QGhvdG1haWwuY29tPgotLS0KIGZzL250ZnMvbnRm
cy5oIHwgMTUgKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9udGZzL250ZnMuaCBiL2ZzL250ZnMv
bnRmcy5oCmluZGV4IGRmNWE3NWQ1MDZmNi4uYjY2Y2U2MmY2N2M5IDEwMDY0NAotLS0gYS9mcy9u
dGZzL250ZnMuaAorKysgYi9mcy9udGZzL250ZnMuaApAQCAtMjAsNiArMjAsNyBAQAogI2luY2x1
ZGUgPGxpbnV4L3NtcC5oPgogI2luY2x1ZGUgPGxpbnV4L3BhZ2VtYXAuaD4KICNpbmNsdWRlIDxs
aW51eC91aWRnaWQuaD4KKyNpbmNsdWRlIDxsaW51eC9ibGtkZXYuaD4gICAgICAvKiBGb3IgU0VD
VE9SX1NISUZULiAqLwogCiAjaW5jbHVkZSAidm9sdW1lLmgiCiAjaW5jbHVkZSAibGF5b3V0Lmgi
CkBAIC03MSw3ICs3MiwxMSBAQAogI2RlZmluZSBOVEZTX0NMVV9UT19QT0ZTKHZvbCwgY2x1KSAo
KCh1NjQpKGNsdSkgPDwgKHZvbCktPmNsdXN0ZXJfc2l6ZV9iaXRzKSAmIFwKIAkJCQkgICAgflBB
R0VfTUFTSykKIAotI2RlZmluZSBOVEZTX0JfVE9fU0VDVE9SKHZvbCwgYikgKChiKSA+PiAoKHZv
bCktPnNiKS0+c19ibG9ja3NpemVfYml0cykKKy8qCisgKiBiaW8tPmJpX2l0ZXIuYmlfc2VjdG9y
IGFuZCBzZWN0b3JfdCBhcmUgYWx3YXlzIGluIDUxMi1ieXRlIHNlY3RvcnMsIGV2ZW4KKyAqIHdo
ZW4gdGhlIGZpbGVzeXN0ZW0gYmxvY2sgc2l6ZSBpcyBsYXJnZXIgKGZvciBleGFtcGxlIDRLaUIp
LgorICovCisjZGVmaW5lIE5URlNfQl9UT19TRUNUT1Iodm9sLCBiKSBudGZzX2J5dGVzX3RvX3Nl
Y3Rvcih2b2wsIGIpCiAKIGVudW0gewogCU5URlNfQkxPQ0tfU0laRQkJPSA1MTIsCkBAIC0xNTQs
MTEgKzE1OSwxNSBAQCBzdGF0aWMgaW5saW5lIHU2NCBudGZzX2NsdXN0ZXJfdG9fcG9mZihjb25z
dCBzdHJ1Y3QgbnRmc192b2x1bWUgKnZvbCwKIAlyZXR1cm4gKGNsdSA8PCB2b2wtPmNsdXN0ZXJf
c2l6ZV9iaXRzKSAmIH5QQUdFX01BU0s7CiB9CiAKLS8qIENvbnZlcnQgYnl0ZSBvZmZzZXQgdG8g
c2VjdG9yIChibG9jaykgbnVtYmVyLiAqLworLyogQ29udmVydCBieXRlIG9mZnNldCB0byBhIGJs
b2NrIGxheWVyIHNlY3RvciBudW1iZXIuICBUaG9zZSBhcmUgYWx3YXlzIGluCisgKiB1bml0cyBv
ZiA1MTIgYnl0ZXMsIG5ldmVyIGluIHVuaXRzIG9mIHNiLT5zX2Jsb2Nrc2l6ZSwgd2hpY2ggaXMg
cmFpc2VkIHRvCisgKiB0aGUgZGV2aWNlIGxvZ2ljYWwgYmxvY2sgc2l6ZSBvbiA0S24gZGV2aWNl
cy4KKyAqLwogc3RhdGljIGlubGluZSBzZWN0b3JfdCBudGZzX2J5dGVzX3RvX3NlY3Rvcihjb25z
dCBzdHJ1Y3QgbnRmc192b2x1bWUgKnZvbCwKIAkJdTY0IGJ5dGVzKQogewotCXJldHVybiBieXRl
cyA+PiB2b2wtPnNiLT5zX2Jsb2Nrc2l6ZV9iaXRzOworCSh2b2lkKXZvbDsKKwlyZXR1cm4gYnl0
ZXMgPj4gU0VDVE9SX1NISUZUOwogfQogCiAvKiBHbG9iYWwgdmFyaWFibGVzLiAqLwotLSAKMi41
MS4wCg==
