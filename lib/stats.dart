/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-17 18:42:06
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-19 20:44:02
 * @FilePath: /civitai_api/lib/src/stats.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */
class CivitaStats {
  /// The number of cry reactions
  late final int cryCount;

  /// The number of laugh reactions
  late final int laughCount;

  /// The number of like reactions
  late final int likeCount;

  /// The number of heart reactions
  late final int heartCount;

  /// The number of comment reactions
  late final int commentCount;

  /// The number of downloads the model has
  late final int downloadCount;

  /// The number of favorites the model has
  late final int favoriteCount;

  /// The number of ratings the model has
  late final int ratingCount;

  /// The average rating of the model
  late final double rating;

  /// The number of thumbs up
  late final int thumbsUpCount;

  /// The number of thumbs down
  late final int thumbsDownCount;

  /// The amount of money tipped
  late final int tippedAmountCount;

  CivitaStats.fromJson(Map<String, dynamic> json) {
    cryCount = json['cryCount'] ?? 0;
    laughCount = json['laughCount'] ?? 0;
    likeCount = json['likeCount'] ?? 0;
    heartCount = json['heartCount'] ?? 0;
    commentCount = json['commentCount'] ?? 0;
    downloadCount = json['downloadCount'] ?? 0;
    favoriteCount = json['favoriteCount'] ?? 0;
    ratingCount = json['ratingCount'] ?? 0;
    rating = double.parse('${json['rating'] ?? 0}');
    thumbsUpCount = json['thumbsUpCount'] ?? 0;
    thumbsDownCount = json['thumbsDownCount'] ?? 0;
    tippedAmountCount = json['tippedAmountCount'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'cryCount': cryCount,
      'laughCount': laughCount,
      'likeCount': likeCount,
      'heartCount': heartCount,
      'commentCount': commentCount,
      'downloadCount': downloadCount,
      'favoriteCount': favoriteCount,
      'ratingCount': ratingCount,
      'rating': rating,
      'tippedAmountCount': tippedAmountCount,
      'thumbsUpCount': thumbsUpCount,
      'thumbsDownCount': thumbsDownCount,
    };
  }
}
