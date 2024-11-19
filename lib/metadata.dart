/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-14 23:24:42
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-17 20:34:29
 * @FilePath: /civitai_api/lib/src/metadata.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */

class CivitaMetadata {
  /// The total number of items available
  late final int totalItems;

  /// The the current page you are at
  late final int currentPage;

  /// The the size of the batch
  late final int pageSize;

  /// The total number of pages
  late final int totalPages;

  /// The id of the first image in the next batch
  String? nextCursor;

  /// The url to get the next batch of items
  String? nextPage;

  /// The url to get the previous batch of items
  String? prevPage;

  CivitaMetadata.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'] ?? 0;
    currentPage = json['currentPage'] ?? 0;
    pageSize = json['pageSize'] ?? 0;
    totalPages = json['totalPages'] ?? 0;
    nextPage = json['nextPage'];
    prevPage = json['prevPage'];
    nextCursor = json['nextCursor'];
  }

  Map<String, dynamic> toJson() {
    return {
      'totalItems': totalItems,
      'currentPage': currentPage,
      'pageSize': pageSize,
      'totalPages': totalPages,
      'nextPage': nextPage,
      'prevPage': prevPage,
      'nextCursor': nextCursor,
    };
  }
}
