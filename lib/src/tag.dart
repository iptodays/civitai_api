/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-19 20:22:47
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-19 20:25:57
 * @FilePath: /civitai_api/lib/src/tag.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */
import 'metadata.dart';

class CivitaTagResp {
  late final List<CivitaTag> items;

  late final CivitaMetadata metadata;

  CivitaTagResp.fromJson(Map<String, dynamic> json) {
    items = json['items'].map<CivitaTag>((e) => CivitaTag.fromJson(e)).toList();
    metadata = CivitaMetadata.fromJson(json['metadata']);
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'metadata': metadata.toJson(),
    };
  }
}

class CivitaTag {
  /// The name of the tag
  late final String name;

  /// Url to get all models from this tag
  late final String link;

  /// The amount of models linked to this tag
  late final int modelCount;

  CivitaTag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
    modelCount = json['modelCount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'link': link,
      'modelCount': modelCount,
    };
  }
}
