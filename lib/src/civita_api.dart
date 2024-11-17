/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-14 22:58:23
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-17 16:49:47
 * @FilePath: /civitai_api/lib/src/civita_api.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */
import 'dart:io';

import 'package:civitai_api/src/creator.dart';
import 'package:dio/dio.dart';

extension CivitaResp on Response {
  bool get isOk => statusCode == HttpStatus.ok;
}

enum NsfwState {
  yes,
  no,
  none,
  soft,
  mature,
  x,
}

enum SortState {
  mostReactions,
  mostComments,
  newest,
}

enum PeriodState {
  allTime,
  year,
  month,
  week,
  day,
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

  Map<String, String> get sortStateMap => {
        SortState.mostReactions.name: 'Most Reactions',
        SortState.mostComments.name: 'Most Comments',
        SortState.newest.name: 'Newest',
      };

  Map<String, String> get periodStateMap => {
        PeriodState.allTime.name: 'All Time',
        PeriodState.year.name: 'Year',
        PeriodState.month.name: 'Month',
        PeriodState.week.name: 'Week',
        PeriodState.day.name: 'Day',
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
  Future<CreatorResp?> getCreators({
    int? limit,
    int? page,
    String? query,
  }) async {
    Map<String, dynamic>? params = {};
    if (limit != null) {
      params['limit'] = limit;
    }
    if (page != null) {
      params['page'] = page;
    }
    if (query != null) {
      params['query'] = query;
    }
    Response response = await _get(
      '/creators',
      params,
    );
    if (response.isOk) {
      return CreatorResp.fromJson(response.data);
    }
    return null;
  }

  /// https://github.com/civitai/civitai/wiki/REST-API-Reference#get-apiv1images
  Future<void> getImages({
    int? limit,
    int? postId,
    int? modelId,
    int? modelVersionId,
    String? username,
    NsfwState? nsfw,
    SortState? sort,
    PeriodState? period,
    int? page,
  }) async {
    Map<String, dynamic> params = {};
    if (limit != null) {
      params['limit'] = limit;
    }
    if (postId != null) {
      params['postId'] = postId;
    }
    if (modelId != null) {
      params['modelId'] = modelId;
    }
    if (modelVersionId != null) {
      params['modelVersionId'] = modelVersionId;
    }
    if (username != null) {
      params['username'] = username;
    }
    if (nsfw != null) {
      params['nsfw'] = nsfwStateMap[nsfw.name];
    }
    if (sort != null) {
      params['sort'] = sortStateMap[sort.name];
    }
    if (period != null) {
      params['period'] = periodStateMap[period.name];
    }
    Response response = await _get(
      '/images',
      params,
    );
    if (response.isOk) {
      print(response.data);
    }
    return null;
  }

  Future<Response> _get(
    String url,
    Map<String, dynamic>? query,
  ) async {
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
