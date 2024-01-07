import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomi_mall/app/http/baseResponse.dart';
import 'package:flutter_xiaomi_mall/app/http/httpException.dart';
import 'package:flutter_xiaomi_mall/app/http/httpInterceptor.dart';
import 'package:flutter_xiaomi_mall/app/http/logInterceptor.dart';
import 'package:flutter_xiaomi_mall/app/models/productListModel.dart';

class HttpUtil {
  static const String _baseUrl = "https://xiaomi.itying.com/";

  static final Dio _dio = Dio();

  static const String GET = "GET"; //get请求
  static const String POST = "POST"; //post请求

  //私有命名构造函数
  static final HttpUtil _instance = HttpUtil._interval();

  static HttpUtil get instance {
    return _instance;
  }

  factory HttpUtil.create() {
    return _instance;
  }

  HttpUtil._interval() {
    _dio.options = BaseOptions(
        baseUrl: _baseUrl,
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
        headers: {"source": "android"},
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json);

    //设置Cookie
    // _dio.interceptors.add(CookieManager(CookieJar()));

    //添加请求/响应拦截器
    _dio.interceptors.add(HttpInterceptor());
    _dio.interceptors.add(HttpLogInterceptor());
  }

  //get请求方法

  Future<BaseEntity<T>> _get<T>(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);

      return BaseEntity<T>.fromMap(response.data);
    } on DioException catch (e) {
      // handleHttpError(e);
      HttpExceptions.handleHttpError(e);
      return BaseEntity(data: null, code: 0, message: "");
    }
  }

  //post请求方法

  Future<BaseEntity<T>> _post<T>(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.post(url,
          data: data, options: options, cancelToken: cancelToken);

      return BaseEntity<T>.fromMap(response.data);
    } on DioException catch (e) {
      // handleHttpError(e);
      HttpExceptions.handleHttpError(e);
      return BaseEntity(data: null, code: 0, message: "");
    }
  }

  Future<BaseEntity<T>> request<T>(url,
      {method = HttpUtil.GET, data, options, cancelToken}) async {
    debugPrint("请求开始");
    BaseEntity<T> response;

    if (method == HttpUtil.GET) {
      response = await _get(url,
          data: data, options: options, cancelToken: cancelToken);
    } else {
      response = await _post(url,
          data: data, options: options, cancelToken: cancelToken);
    }

    return response;
  }

  get2<T>(String url,
      {Map<String, dynamic>? data,
      Options? options,
      CancelToken? cancelToken,
      required Function(BaseEntity result) onSuccess,
      required Function(int code, String message) onError}) async {
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);

      BaseEntity baseEntity = BaseEntity.fromMap(response.data);

      switch (baseEntity.code) {
        case 0: //成功

          onSuccess(baseEntity);
          break;
        case 401: //没有token
          onError(401, "没有token");
          break;
        case 405: //被挤掉了
          onError(405, "被挤掉了");
          break;
        default:
          onError(500, "服务异常");
          break;
      }
    } on DioException catch (e) {
      // handleHttpError(e);
      HttpExceptions.handleHttpError(e);
      onError(500, "服务异常");
    }
  }
}
