import 'package:flutter_xiaomi_mall/app/translations/en_US.dart';
import 'package:flutter_xiaomi_mall/app/translations/zh_cn.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zhCn,
        'en_US': enUs
      };
}