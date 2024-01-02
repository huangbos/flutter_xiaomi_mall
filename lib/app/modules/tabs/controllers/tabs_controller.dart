import 'package:flutter/cupertino.dart';
import 'package:flutter_xiaomi_mall/app/modules/category/views/category_view.dart';
import 'package:flutter_xiaomi_mall/app/modules/home/views/home_view.dart';
import 'package:flutter_xiaomi_mall/app/modules/mine/views/mine_view.dart';
import 'package:flutter_xiaomi_mall/app/modules/service/views/service_view.dart';
import 'package:flutter_xiaomi_mall/app/modules/shopcart/views/shopcart_view.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController

  final count = 0.obs;
  var currentIndex = 0.obs;
  final List<Widget> tabsPage = [
    const HomeView(),
    const CategoryView(),
    const ServiceView(),
    const ShopcartView(),
    const MineView()
  ];
  PageController pageController = PageController(initialPage: 0); // PageController 默认第一个界面
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
