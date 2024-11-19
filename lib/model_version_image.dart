/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-19 21:05:32
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-19 21:47:39
 * @FilePath: /civitai_api/lib/src/model_version_image.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */
class CivitaModelVersionImage {
  /// The id of the image
  int? id;

  /// The url of the image at it's source resolution
  late final String url;

  /// The NSFW level of the image
  late final int nsfwLevel;

  /// The width of the image
  late final int width;

  /// The height of the image
  late final int height;

  /// The blurhash of the image
  late final String hash;

  /// The type of image
  late final String type;

  /// Whether or not the image has metadata
  late final bool hasMeta;

  /// Whether or not the image is on civitai
  late final bool onSite;

  CivitaModelVersionImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    nsfwLevel = json['nsfwLevel'] ?? -1;
    width = json['width'];
    height = json['height'];
    hash = json['hash'];
    type = json['type'];
    hasMeta = json['hasMeta'];
    onSite = json['onSite'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'nsfwLevel': nsfwLevel,
      'width': width,
      'height': height,
      'hash': hash,
      'type': type,
      'hasMeta': hasMeta,
      'onSite': onSite,
    };
  }
}
