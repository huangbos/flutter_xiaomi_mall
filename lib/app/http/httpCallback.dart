import 'package:flutter_xiaomi_mall/app/http/baseResponse.dart';

abstract class HttpCallback {
  abstract Function(BaseEntity result) onSuccess;
  abstract Function(int code, String message) onError;
}
