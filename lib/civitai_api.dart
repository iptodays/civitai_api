/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-13 23:52:09
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-12-05 13:52:22
 * @FilePath: /civitai_api/lib/civitai_api.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */
library civitai_api;

import 'dart:io';

import 'package:dio/dio.dart';

import 'creator.dart';
import 'image.dart';
import 'model.dart';
import 'model_version.dart';
import 'tag.dart';

extension CivitaResp on Response {
  bool get isOk => statusCode == HttpStatus.ok && data is Map;
}

extension ParamSetter on Map<String, dynamic> {
  void setIfNotNull(String key, dynamic value) {
    if (value != null) {
      this[key] = value;
    }
  }
}

enum NsfwState {
  yes,
  no,
  none,
  soft,
  mature,
  x,
}

enum ImageSortState {
  mostReactions,
  mostComments,
  newest,
}

enum ModelSortState {
  highestRated,
  mostDownloads,
  newest,
}

enum AllowCommercialUseState {
  none,
  image,
  rent,
  sell,
}

enum PeriodState {
  allTime,
  year,
  month,
  week,
  day,
}

enum TypesState {
  checkpoint,
  textualInversion,
  hypernetwork,
  aestheticGradient,
  lora,
  controlnet,
  poses,
}

class CivitaApi {
  /// Base url
  static const String _baseUrl = 'https://civitai.com/api/v1';

  late Dio _dio;

  static CivitaApi? _instance;

  Map<String, dynamic> get nsfwStateMap => {
        NsfwState.yes.name: true,
        NsfwState.no.name: false,
        NsfwState.none.name: 'None',
        NsfwState.soft.name: 'Soft',
        NsfwState.mature.name: 'Mature',
        NsfwState.x.name: 'X',
      };

  Map<String, String> get imageSortStateMap => {
        ImageSortState.mostReactions.name: 'Most Reactions',
        ImageSortState.mostComments.name: 'Most Comments',
        ImageSortState.newest.name: 'Newest',
      };

  Map<String, String> get modelSortStateMap => {
        ModelSortState.highestRated.name: 'Highest Rated',
        ModelSortState.mostDownloads.name: 'Most Downloaded',
        ModelSortState.newest.name: 'Newest',
      };

  Map<String, String> get typeStateMap => {
        TypesState.checkpoint.name: 'Checkpoint',
        TypesState.textualInversion.name: 'TextualInversion',
        TypesState.hypernetwork.name: 'Hypernetwork',
        TypesState.aestheticGradient.name: 'AestheticGradient',
        TypesState.lora.name: 'LORA',
        TypesState.controlnet.name: 'Controlnet',
        TypesState.poses.name: 'Poses',
      };

  Map<String, String> get periodStateMap => {
        PeriodState.allTime.name: 'All Time',
        PeriodState.year.name: 'Year',
        PeriodState.month.name: 'Month',
        PeriodState.week.name: 'Week',
        PeriodState.day.name: 'Day',
      };

  Map<String, String> get allowCommercialUseStateMap => {
        AllowCommercialUseState.none.name: 'None',
        AllowCommercialUseState.image.name: 'Image',
        AllowCommercialUseState.rent.name: 'Rent',
        AllowCommercialUseState.sell.name: 'Sell',
      };

  factory CivitaApi(String authorization) {
    if (_instance == null) {
      _instance = CivitaApi._internal(authorization);
    }
    return _instance!;
  }

// 私有构造函数接收 authorization 参数并进行初始化
  CivitaApi._internal(String authorization) {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authorization',
        },
      ),
    );
  }

  /// https://github.com/civitai/civitai/wiki/REST-API-Reference#get-apiv1creators
  Future<CivitaCreatorResp?> getCreators({
    int? limit,
    int? page,
    String? query,
  }) async {
    Map<String, dynamic>? params = {};
    params
      ..setIfNotNull('limit', limit)
      ..setIfNotNull('page', page)
      ..setIfNotNull('query', query);
    Response response = await _get(
      '/creators',
      query: params,
    );
    if (response.isOk) {
      return CivitaCreatorResp.fromJson(response.data);
    }
    return null;
  }

  /// https://github.com/civitai/civitai/wiki/REST-API-Reference#get-apiv1images
  Future<CivitaImageResp?> getImages({
    int? limit,
    int? postId,
    int? modelId,
    int? modelVersionId,
    String? nextCursor,
    String? username,
    NsfwState? nsfw,
    ImageSortState? sort,
    PeriodState? period,
    int? page,
  }) async {
    Map<String, dynamic> params = {};
    params
      ..setIfNotNull('limit', limit)
      ..setIfNotNull('postId', postId)
      ..setIfNotNull('modelId', modelId)
      ..setIfNotNull('modelVersionId', modelVersionId)
      ..setIfNotNull('username', username)
      ..setIfNotNull('nsfw', nsfwStateMap[nsfw?.name])
      ..setIfNotNull('sort', imageSortStateMap[sort?.name])
      ..setIfNotNull('period', periodStateMap[period?.name])
      ..setIfNotNull('page', page)
      ..setIfNotNull('cursor', nextCursor);
    Response response = await _get(
      '/images',
      query: params,
    );
    if (response.isOk) {
      return CivitaImageResp.fromJson(response.data);
    }
    return null;
  }

  /// https://github.com/civitai/civitai/wiki/REST-API-Reference#get-apiv1models
  Future<CivitaModelResp?> getModels({
    int? limit,
    int? page,
    String? query,
    String? tag,
    String? username,
    TypesState? types,
    ModelSortState? sort,
    PeriodState? period,
    bool? favorites,
    bool? hidden,
    bool? primaryFileOnly,
    bool? allowNoCredit,
    bool? allowDerivatives,
    bool? allowDifferentLicenses,
    AllowCommercialUseState? allowCommercialUse,
    bool? nsfw,
    bool? supportsGeneration,
  }) async {
    Map<String, dynamic> params = {};
    params
      ..setIfNotNull('limit', limit)
      ..setIfNotNull('page', page)
      ..setIfNotNull('query', query)
      ..setIfNotNull('tag', tag)
      ..setIfNotNull('username', username)
      ..setIfNotNull('types', typeStateMap[types?.name])
      ..setIfNotNull('sort', modelSortStateMap[sort?.name])
      ..setIfNotNull('period', periodStateMap[period?.name])
      ..setIfNotNull('favorites', favorites)
      ..setIfNotNull('hidden', hidden)
      ..setIfNotNull('primaryFileOnly', primaryFileOnly)
      ..setIfNotNull('allowNoCredit', allowNoCredit)
      ..setIfNotNull('allowDerivatives', allowDerivatives)
      ..setIfNotNull('allowDifferentLicenses', allowDifferentLicenses)
      ..setIfNotNull('allowCommercialUse',
          allowCommercialUseStateMap[allowCommercialUse?.name])
      ..setIfNotNull('nsfw', nsfw)
      ..setIfNotNull('supportsGeneration', supportsGeneration);
    Response response = await _get(
      '/models',
      query: params,
    );
    print(response.data);
    if (response.isOk) {
      return CivitaModelResp.fromJson(response.data);
    }
    return null;
  }

  /// https://github.com/civitai/civitai/wiki/REST-API-Reference#get-apiv1modelsmodelid
  Future<CivitaModel?> getModelById(int id) async {
    Response response = await _get('/models/$id');
    if (response.isOk) {
      return CivitaModel.fromJson(response.data);
    }
    return null;
  }

  /// https://github.com/civitai/civitai/wiki/REST-API-Reference#get-apiv1models-versionsmodelversionid
  Future<CivitaModelVersion?> getModelVersionById(int id) async {
    Response response = await _get('/model-versions/$id');
    if (response.isOk) {
      return CivitaModelVersion.fromJson(response.data);
    }
    return null;
  }

  /// https://github.com/civitai/civitai/wiki/REST-API-Reference#get-apiv1tags
  Future<CivitaTagResp?> getTags({
    int? limit,
    int? page,
    String? query,
  }) async {
    Map<String, dynamic> params = {};
    params
      ..setIfNotNull('limit', limit)
      ..setIfNotNull('page', page)
      ..setIfNotNull('query', query);
    Response response = await _get(
      '/tags',
      query: params,
    );
    if (response.isOk) {
      return CivitaTagResp.fromJson(response.data);
    }
    return null;
  }

  Future<Response> _get(
    String url, {
    Map<String, dynamic>? query,
  }) async {
    try {
      Response response = await _dio.get(
        url,
        queryParameters: query,
      );
      return response;
    } catch (e) {
      return Response(
        data: e,
        statusCode: -1,
        requestOptions: RequestOptions(
          path: url,
          queryParameters: query,
        ),
      );
    }
  }
}
