/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-19 20:57:12
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-19 20:57:48
 * @FilePath: /civitai_api/lib/src/hashes.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */
class CivitaHashes {
  String? autoV1;

  String? autoV2;

  String? sHA256;

  String? cRC32;

  String? bLAKE3;

  CivitaHashes.fromJson(Map<String, dynamic> json) {
    autoV1 = json['AutoV1'];
    autoV2 = json['AutoV2'];
    sHA256 = json['SHA256'];
    cRC32 = json['CRC32'];
    bLAKE3 = json['BLAKE3'];
  }

  Map<String, dynamic> toJson() {
    return {
      'AutoV1': autoV1,
      'AutoV2': autoV2,
      'SHA256': sHA256,
      'CRC32': cRC32,
      'BLAKE3': bLAKE3,
    };
  }
}
