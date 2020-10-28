import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

String accessToken;

decodeJson(String data) {
  return json.decode(data);
}

final api = Dio(
  BaseOptions(
    baseUrl: "https://www.shofri.in/appinshofri/",
    connectTimeout: 15 * 1000,
    sendTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
    contentType: "application/json",
    receiveDataWhenStatusError: true,
    followRedirects: true,
  ),
)
  ..transformer = DefaultTransformer(jsonDecodeCallback: (s) {
    return compute(decodeJson, s);
  })
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options) async {
        SharedPreferences sp = await SharedPreferences.getInstance();
        if (sp.containsKey("access_token")) {
          accessToken = sp.getString("access_token");
          if (accessToken != null) {
            options.headers.addAll({
              "Authorization": "Bearer " + accessToken,
            });
          }
        }
      },
      onResponse: (e) async {
        if (e.statusCode == 200) {
          if (e.data is String && (e.data as String).isNotEmpty) {
            final String jsonString = e.data;
            e.data = await compute(decodeJson, jsonString);
          }
        }
      },
    ),
  );
