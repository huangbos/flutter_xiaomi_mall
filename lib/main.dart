import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xiaomi_mall/app/translations/translations.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

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
        // 全局配置子树下的SmartRefresher,下面列举几个特别重要的属性
        return RefreshConfiguration(
            headerBuilder: () =>
                const MaterialClassicHeader(
                  color: Colors.red,
                  backgroundColor: Colors.yellow,
                  
                ), // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
            footerBuilder: () =>  ClassicFooter(
              noDataText: "- . -",
              idleText: "idleText=====${"hello".tr}",
              loadingText: "loadingText=====${"hello".tr}",
              canLoadingText: "canLoadingText=====${"hello".tr}",
            ), // 配置默认底部指示器
            headerTriggerDistance: 80.0, // 头部触发刷新的越界距离
          
            springDescription: const SpringDescription(
                stiffness: 170,
                damping: 16,
                mass: 1.9), // 自定义回弹动画,三个属性值意义请查询flutter api
            maxOverScrollExtent: 100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
            maxUnderScrollExtent: 0, // 底部最大可以拖动的范围
            enableScrollWhenRefreshCompleted:
                true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
            enableLoadingWhenFailed: true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
            hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
            enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false, //去除debug
              title: "Application",
              theme: ThemeData(primarySwatch: Colors.grey), //配置主题颜色
              initialRoute: AppPages.INITIAL, //初始化路由
              defaultTransition: Transition.rightToLeft, //默认界面跳转动画
              getPages: AppPages.routes,
              translations: Translation(), // 翻译文件
              locale: Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
              fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
            
           
            )
            );
      }));
}
