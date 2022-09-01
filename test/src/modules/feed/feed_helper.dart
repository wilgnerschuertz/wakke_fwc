import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:wakke_fwc/src/modules/feed/infra/models/feed_model.dart';

Future<List<Map<String, dynamic>>> getFeedResponseMock() async {
  final json = await getResponseMock(nameFile: "feeds");
  return json.data;
}

Future<List<FeedModel>> getFeedsMock() async {
  var response = await getFeedResponseMock();
  return (response).map((e) => FeedModel.fromMap(e)).toList();
}

Future<String> loadJson({
  required String nameFile,
  String path = 'assets/',
}) async {
  return await rootBundle.loadString('$path/$nameFile.json');
}

dynamic loadMockFromAssets({
  bool success = true,
  String? nameFile,
}) async {
  String response = await loadJson(
      path: 'assets/mocks/${success ? 'success' : 'error'}',
      nameFile: nameFile!);
  return json.decode(response);
}

Future<Response> getResponseMock({
  bool success = true,
  int statusCode = 200,
  String? nameFile,
}) async {
  dynamic response = await loadMockFromAssets(
    nameFile: nameFile,
    success: success && statusCode == 200,
  );
  return Response(
    data: response,
    statusCode: statusCode,
    requestOptions: RequestOptions(path: '/mock'),
  );
}
