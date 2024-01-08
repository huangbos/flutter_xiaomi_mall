import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomi_mall/app/http/http.dart';

class HttpLogInterceptor extends  QueuedInterceptorsWrapper {
  //请求之前
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
    // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。

    debugPrint(
        "===========================发送请求===================================");

    debugPrint("请求路径====${options.method}---${options.path}");
    debugPrint("请求参数====${options.method == HttpUtil.GET ? options.queryParameters : options.data }");
    debugPrint("请求头====${options.headers}");
    debugPrint("请求类型====${options.contentType}");

    debugPrint(
        "===========================发送请求===================================");

   return handler.next(options);
  }

  //响应之前
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
    debugPrint(
        "===========================响应请求===================================");

    debugPrint("响应数据:${response.realUri}====${json.encode(response.data)}");
    debugPrint("响应状态码====${response.statusCode}");
    debugPrint("响应状态信息====${response.statusMessage}");

    debugPrint(
        "===========================响应请求===================================");
      return handler.next(response);
  }

  //发生错误之前
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
    debugPrint(
        "===========================响应报错===================================");
    debugPrint("响应报错====${err.error}");
    debugPrint("响应报错信息====${err.message}");
    debugPrint("响应报错类型====${err.type}");
    debugPrint(
        "===========================响应报错===================================");
    return handler.next(err);
  }
}
