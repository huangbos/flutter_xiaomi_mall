import 'package:get/get.dart';

import '../controllers/pruduct_list_controller.dart';

class PruductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PruductListController>(
      () => PruductListController(),
    );
  }
}
