/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-17 18:25:59
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-17 20:31:48
 * @FilePath: /civitai_api/lib/src/image.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */

import 'metadata.dart';
import 'stats.dart';

class CivitaImageResp {
  late final List<CivitaImage> items;

  late final CivitaMetadata metadata;

  CivitaImageResp.fromJson(Map<String, dynamic> json) {
    items = json['items']
        .map<CivitaImage>(
          (e) => CivitaImage.fromJson(e),
        )
        .toList();
    metadata = CivitaMetadata.fromJson(json['metadata']);
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'metadata': metadata.toJson(),
    };
  }
}

class CivitaImage {
  /// The id of the image
  late final int id;

  /// The url of the image at it's source resolution
  late final String url;

  /// The blurhash of the image
  late final String hash;

  /// The width of the image
  late final double width;

  /// The height of the image
  late final double height;

  /// If the image has any mature content labels
  late final bool nsfw;

  /// The NSFW level of the image
  late final String nsfwLevel;

  /// The date the image was posted
  late final String createdAt;

  /// The ID of the post the image belongs to
  late final int postId;

  /// stats
  late final CivitaStats stats;

  /// The username of the creator
  String? username;

  /// The generation parameters parsed or input for the image
  Map<String, dynamic>? meta;

  CivitaImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    hash = json['hash'];
    width = double.parse('${json['width']}');
    height = double.parse('${json['height']}');
    nsfw = json['nsfw'];
    nsfwLevel = json['nsfwLevel'];
    createdAt = json['createdAt'];
    postId = json['postId'];
    stats = CivitaStats.fromJson(json['stats']);
    meta = json['meta'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'hash': hash,
      'width': width,
      'height': height,
      'nsfw': nsfw,
      'nsfwLevel': nsfwLevel,
      'createdAt': createdAt,
      'postId': postId,
      'stats': stats.toJson(),
      'meta': meta,
    };
  }
}
