/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-19 20:45:42
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-19 21:56:09
 * @FilePath: /civitai_api/lib/src/model_version.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */

import 'file.dart';
import 'model_version_image.dart';

class CivitaModelVersion {
  /// The identifier for the model version
  late final int id;

  /// The index of the model version
  int? index;

  /// The name of the model version
  late final String name;

  /// The base model used to train the model
  late final String baseModel;

  /// The description of the model version (usually a changelog)
  late final String description;

  /// The type of base model
  late final String baseModelType;

  /// The date the model was published
  late final String publishedAt;

  /// The availability of the model version
  late final String availability;

  /// The NSFW level of the model version
  late final int nsfwLevel;

  /// The download url to get the model file for this specific version
  late final String downloadUrl;

  /// The date in which the version was created
  late final String createdAt;

  /// The words used to trigger the model
  late final List<String> trainedWords;

  /// The files associated with this model version
  late final List<CivitaFile> files;

  /// The images associated with this model version
  late final List<CivitaModelVersionImage> images;

  CivitaModelVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    name = json['name'] ?? '';
    baseModel = json['baseModel'] ?? '';
    description = json['description'] ?? '';
    baseModelType = json['baseModelType'] ?? '';
    publishedAt = json['publishedAt'] ?? '';
    availability = json['availability'] ?? '';
    nsfwLevel = json['nsfwLevel'] ?? 0;
    downloadUrl = json['downloadUrl'] ?? '';
    createdAt = json['createdAt'] ?? '';
    if (json['trainedWords'] != null) {
      trainedWords = json['trainedWords'].cast<String>();
    } else {
      trainedWords = [];
    }
    if (json['files'] != null) {
      files =
          json['files'].map<CivitaFile>((e) => CivitaFile.fromJson(e)).toList();
    } else {
      files = [];
    }
    if (json['images'] != null) {
      images = json['images']
          .map<CivitaModelVersionImage>(
              (e) => CivitaModelVersionImage.fromJson(e))
          .toList();
    } else {
      images = [];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'index': index,
      'name': name,
      'baseModel': baseModel,
      'description': description,
      'baseModelType': baseModelType,
      'publishedAt': publishedAt,
      'availability': availability,
      'nsfwLevel': nsfwLevel,
      'downloadUrl': downloadUrl,
      'createdAt': createdAt,
      'trainedWords': trainedWords,
      'files': files.map((e) => e.toJson()).toList(),
      'images': images.map((e) => e.toJson()).toList(),
    };
  }
}
