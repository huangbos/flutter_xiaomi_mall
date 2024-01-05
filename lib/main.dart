import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xiaomi_mall/app/translations/translations.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  //flutter 修改状态栏的颜色
  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  runApp(ScreenUtilInit(
      designSize: const Size(1080, 2400), //设计稿尺寸
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false, //去除debug
          title: "Application",
          theme: ThemeData(primarySwatch: Colors.grey), //配置主题颜色
          initialRoute: AppPages.INITIAL,//初始化路由
          defaultTransition: Transition.rightToLeft,//默认界面跳转动画
          getPages: AppPages.routes,
          translations: Translation(), // 翻译文件
          locale: Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
          fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
        );
      }));
}
