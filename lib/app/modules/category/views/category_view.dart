import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_xiaomi_mall/app/services/screenAdapter.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('分类'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: 100,
              height: double.infinity,
              child: Obx(() => ListView.builder(
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          debugPrint("index ==== $index");
                          controller.selectIndex.value = index;
                          controller.getRightCategoryData(
                              controller.categoryLeftList[index].id);
                        },
                        child: Obx(() => Row(
                              children: [
                                Container(
                                  width: ScreenAdapter.width(10),
                                  height: ScreenAdapter.heigth(150),
                                  color: controller.selectIndex.value == index
                                      ? Colors.red
                                      : Colors.white,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                        "${controller.categoryLeftList[index].title}"),
                                  ),
                                )
                              ],
                            )),
                      );
                    }),
                    itemCount: controller.categoryLeftList.length,
                  )),
            ),
            Expanded(
                child: Obx(() => GridView.builder(
                    itemCount: controller.categoryRightList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisCount: 2,
                        mainAxisSpacing: ScreenAdapter.width(60),
                        crossAxisSpacing: ScreenAdapter.heigth(10)),
                    itemBuilder: ((context, index) {
                      var categoryRightItem =
                          controller.categoryRightList[index];
                      var pic =
                          "https://xiaomi.itying.com/${categoryRightItem.pic}"
                              .replaceAll("\\", "/");
                      print("pic=====$pic");
                      return Column(
                        children: [
                          Image.network(
                            pic,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: ScreenAdapter.heigth(20),
                          ),
                          Text("${categoryRightItem.title}"),
                        ],
                      );
                    }))))
          ],
        ),
      ),
    );
  }
}
