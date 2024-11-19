/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-19 10:10:35
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-19 21:46:02
 * @FilePath: /civitai_api/lib/src/model.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */
import 'creator.dart';
import 'metadata.dart';
import 'model_version.dart';
import 'stats.dart';

class CivitaModelResp {
  late final List<CivitaModel> items;

  late final CivitaMetadata metadata;

  CivitaModelResp.fromJson(Map<String, dynamic> json) {
    items =
        json['items'].map<CivitaModel>((e) => CivitaModel.fromJson(e)).toList();
    metadata = CivitaMetadata.fromJson(json['metadata']);
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'metadata': metadata.toJson(),
    };
  }
}

class CivitaModel {
  /// The identifier for the model
  late final int id;

  /// The name of the model
  late final String name;

  /// The description of the model (HTML)
  late final String description;

  /// Whether or not to allow no credit
  late final bool allowNoCredit;

  /// The allowed commercial use
  late final List<String> allowCommercialUse;

  /// Whether or not to allow derivatives
  late final bool allowDerivatives;

  /// Whether or not to allow different license
  late final bool allowDifferentLicense;

  /// The model type
  late final String type;

  /// Whether the model is minor or not
  late final bool minor;

  /// Whether the model is a POI or not
  late final bool poi;

  /// Whether the model is NSFW or not
  late final bool nsfw;

  /// The NSFW level of the model
  late final int nsfwLevel;

  /// The tags associated with the model
  late final List<String> tags;

  /// The mode in which the model is currently on. If Archived, files field will be empty. If TakenDown, images field will be empty
  late final String mode;

  /// creator
  CivitaCreator? creator;

  /// stats
  CivitaStats? stats;

  /// modelVersions
  late final List<CivitaModelVersion> modelVersions;

  CivitaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    description = json['description'] ?? '';
    allowNoCredit = json['allowNoCredit'] ?? false;
    if (json['allowCommercialUse'] != null) {
      allowCommercialUse = json['allowCommercialUse'].cast<String>();
    } else {
      allowCommercialUse = [];
    }
    allowDerivatives = json['allowDerivatives'] ?? false;
    allowDifferentLicense = json['allowDifferentLicense'] ?? false;
    type = json['type'] ?? '';
    minor = json['minor'] ?? false;
    poi = json['poi'] ?? false;
    nsfw = json['nsfw'] ?? false;
    nsfwLevel = json['nsfwLevel'] ?? 0;
    if (json['tags'] != null) {
      tags = json['tags'].cast<String>();
    } else {
      tags = [];
    }
    mode = json['mode'] ?? '';
    if (json['creator'] != null) {
      creator = CivitaCreator.fromJson(json['creator']);
    }
    if (json['stats'] != null) {
      stats = CivitaStats.fromJson(json['stats']);
    }

    modelVersions = json['modelVersions']
        .map<CivitaModelVersion>((e) => CivitaModelVersion.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'allowNoCredit': allowNoCredit,
      'allowCommercialUse': allowCommercialUse,
      'allowDerivatives': allowDerivatives,
      'allowDifferentLicense': allowDifferentLicense,
      'type': type,
      'minor': minor,
      'poi': poi,
      'nsfw': nsfw,
      'nsfwLevel': nsfwLevel,
      'tags': tags,
      'mode': mode,
      'creator': creator?.toJson(),
      'stats': stats?.toJson(),
      'modelVersions': modelVersions.map((e) => e.toJson()).toList(),
    };
  }
}
