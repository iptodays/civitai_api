/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-14 23:24:42
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-14 23:30:08
 * @FilePath: /civitai_api/lib/src/metadata.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */

class Metadata {
  /// The total number of items available
  late final int totalItems;

  /// The the current page you are at
  late final int currentPage;

  /// The the size of the batch
  late final int pageSize;

  /// The total number of pages
  late final int totalPages;

  /// The url to get the next batch of items
  String? nextPage;

  /// The url to get the previous batch of items
  String? prevPage;

  Metadata.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    currentPage = json['currentPage'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    nextPage = json['nextPage'];
    prevPage = json['prevPage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'totalItems': totalItems,
      'currentPage': currentPage,
      'pageSize': pageSize,
      'totalPages': totalPages,
      'nextPage': nextPage,
      'prevPage': prevPage,
    };
  }
}
