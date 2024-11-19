/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2024-11-13 23:52:09
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2024-11-19 22:01:59
 * @FilePath: /civitai_api/test/civitai_api_test.dart
 * 
 * Copyright (c) 2024 by A kingiswinter@gmail.com, All Rights Reserved.
 */

import 'package:civitai_api/civitai_api.dart';

void main() {
  final CivitaApi api = CivitaApi('api_key');
  api.getModelVersionById(128713).then((resp) {
    print(resp?.toJson());
  });
}
