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

Future<BaseEntity<T>>  get<T>(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);

      print("response====$response");

      if (response.data is Map) {
        print("response====Map");
      }

      if (response.data is String) {
        print("response====String");
      }

      // 解析 JSON 数据为 Dart 对象
      // BaseEntity<T> baseEntity = BaseEntity<T>.fromJson(response.data);

       return BaseEntity<T>.fromMap(response.data);


      // return baseEntity;
    } on DioException catch (e) {
      // handleHttpError(e);
      HttpExceptions.handleHttpError(e);
      return BaseEntity(data: null, errorCode: 0, errorMsg: "");
    }
  }

  //post请求方法

  // Future<BaseResponse> _post(url, {data, options, cancelToken}) async {
  //   Response response;
  //   try {
  //     response = await _dio.post(url, data: data, options: options, cancelToken: cancelToken);

  //     return json.decode(response.data);
  //   } on DioException catch (e) {
  //     // handleHttpError(e);
  //     HttpExceptions.handleHttpError(e);
  //     return BaseResponse();
  //   }
  // }

  // Future<Response> request(url, {method = HttpUtil.GET,data, options, cancelToken}) async {
  //   debugPrint("请求开始");
  //   Response response;

  //   if (method == HttpUtil.GET) {
  //      response =  await _get(url,data: data,options: options,cancelToken: cancelToken);
  //   }

  //   else{
  //      response = await _post(url,data: data,options: options,cancelToken: cancelToken);
  //   }

  //   return response;
  // }
}
