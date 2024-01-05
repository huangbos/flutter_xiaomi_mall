import 'package:get/get.dart';

import '../modules/pruductList/bindings/pruduct_list_binding.dart';
import '../modules/pruductList/views/pruduct_list_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.PRUDUCT_LIST,
      page: () => const PruductListView(),
      binding: PruductListBinding(),
    ),
  ];
}
