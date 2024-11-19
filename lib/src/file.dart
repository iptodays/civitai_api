/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-19 20:52:11
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-19 21:36:26
 * @FilePath: /civitai_api/lib/src/file.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */
import 'file_matedata.dart';
import 'hashes.dart';

class CivitaFile {
  /// The identifier for the file
  late final int id;

  /// The size of the model file
  late final String sizeKB;

  /// The name of the file
  late final String name;

  /// The type of the file
  late final String type;

  /// Status of the pickle scan ('Pending', 'Success', 'Danger', 'Error')
  late final String pickleScanResult;

  /// Message from the pickle scan
  late final String pickleScanMessage;

  /// Status of the virus scan ('Pending', 'Success', 'Danger', 'Error')
  late final String virusScanResult;

  /// Message from the virus scan
  late final String virusScanMessage;

  /// The date in which the file was scanned
  late final String scannedAt;

  /// metadata
  CivitaImageMatedata? metadata;

  /// hashes
  CivitaHashes? hashes;

  /// The url for the image
  late final String downloadUrl;

  /// If the file is the primary file for the model version
  bool? primary;

  CivitaFile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sizeKB = '${json['sizeKB']}';
    name = json['name'] ?? '';
    type = json['type'] ?? '';
    pickleScanResult = json['pickleScanResult'] ?? '';
    pickleScanMessage = json['pickleScanMessage'] ?? '';
    virusScanResult = json['virusScanResult'] ?? '';
    virusScanMessage = json['virusScanMessage'] ?? '';
    scannedAt = json['scannedAt'] ?? '';
    if (json['metadata'] != null) {
      metadata = CivitaImageMatedata.fromJson(json['metadata']);
    }
    if (json['hashes'] != null) {
      hashes = CivitaHashes.fromJson(json['hashes']);
    }
    downloadUrl = json['downloadUrl'] ?? '';
    primary = json['primary'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sizeKB': sizeKB,
      'name': name,
      'type': type,
      'pickleScanResult': pickleScanResult,
      'pickleScanMessage': pickleScanMessage,
      'virusScanResult': virusScanResult,
      'virusScanMessage': virusScanMessage,
      'scannedAt': scannedAt,
      'metadata': metadata?.toJson(),
      'hashes': hashes?.toJson(),
      'downloadUrl': downloadUrl,
      'primary': primary,
    };
  }
}
