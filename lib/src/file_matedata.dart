/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-19 20:53:35
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-19 20:56:51
 * @FilePath: /civitai_api/lib/src/file_matedata.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */
class CivitaImageMatedata {
  /// The specified model format for the file
  String? format;

  /// The specified model size for the file
  String? size;

  /// The specified floating point for the file
  String? fp;

  CivitaImageMatedata.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    size = json['size'];
    fp = json['fp'];
  }

  Map<String, dynamic> toJson() {
    return {
      'format': format,
      'size': size,
      'fp': fp,
    };
  }
}
