/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-14 23:28:11
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-19 20:34:02
 * @FilePath: /civitai_api/lib/src/creator.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */

import 'metadata.dart';

class CivitaCreatorResp {
  late final List<CivitaCreator> items;

  late final CivitaMetadata metadata;

  @override
  CivitaCreatorResp.fromJson(Map<String, dynamic> json) {
    items = json['items']
        .map<CivitaCreator>(
          (e) => CivitaCreator.fromJson(e),
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

class CivitaCreator {
  /// The username of the creator
  late final String username;

  /// The amount of models linked to this user
  late final int modelCount;

  /// Url to get all models from this user
  String? link;

  /// The image of the creator | The url of the creators avatar
  String? image;

  CivitaCreator.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    modelCount = json['modelCount'] ?? 0;
    link = json['link'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'modelCount': modelCount,
      'link': link,
      'image': image,
    };
  }
}
