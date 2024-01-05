import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpExceptions {
  static handleHttpError(DioException e) {
    debugPrint("处理请求出错===${e.toString()}");
    if (e.type == DioExceptionType.connectionError) {
      debugPrint("连接超时");
    } else if (e.type == DioExceptionType.sendTimeout) {
      debugPrint("请求超时");
    } else if (e.type == DioExceptionType.receiveTimeout) {
      debugPrint("响应超时");
    } else if (e.type == DioExceptionType.badResponse) {
      debugPrint("出现异常");
    } else if (e.type == DioExceptionType.cancel) {
      debugPrint("请求取消");
    } else {
      debugPrint("未知错误");
    }
  }
}
