import 'package:flutter_xiaomi_mall/app/modules/category/controllers/category_controller.dart';
import 'package:flutter_xiaomi_mall/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_xiaomi_mall/app/modules/mine/controllers/mine_controller.dart';
import 'package:flutter_xiaomi_mall/app/modules/service/controllers/service_controller.dart';
import 'package:flutter_xiaomi_mall/app/modules/shopcart/controllers/shopcart_controller.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<ServiceController>(
      () => ServiceController(),
    );
    Get.lazyPut<ShopcartController>(
      () => ShopcartController(),
    );
    Get.lazyPut<MineController>(() => MineController());
  }
}
