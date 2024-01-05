import 'package:dio/dio.dart';

class HttpInterceptor extends QueuedInterceptorsWrapper {
  //请求之前
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
    // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
    var token = "token11111";
    if(token.isNotEmpty){
      options.headers["token"] = token;
    }
    handler.next(options);
  }

  //响应之前
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
        handler.next(response);

  }

  //发生错误之前
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
    return handler.next(err);
  }
}
