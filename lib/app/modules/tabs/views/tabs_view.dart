import 'package:flutter/material.dart';
import 'package:flutter_xiaomi_mall/app/modules/mine/controllers/mine_controller.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: PageView(
          controller: controller.pageController,
          children: controller.tabsPage,
          onPageChanged: (index) => controller.currentIndex.value = index,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.currentIndex.value = index;
              controller.pageController.jumpToPage(index);
              //我的界面每次进入都要刷新数据
              if (index == 4) {
                Get.find<MineController>().onResumed();
              }
            },
            type: BottomNavigationBarType.fixed, //超过4个item需要设置
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black12,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: "分类"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.hearing_outlined), label: "服务"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.hearing_outlined), label: "购物车"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的")
            ])));
  }
}
