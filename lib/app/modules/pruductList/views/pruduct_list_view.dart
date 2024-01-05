import 'package:flutter/material.dart';
import 'package:flutter_xiaomi_mall/app/services/screenAdapter.dart';
import 'package:flutter_xiaomi_mall/app/widget/appBar.dart';

import 'package:get/get.dart';

import '../controllers/pruduct_list_controller.dart';

class PruductListView extends GetView<PruductListController> {
  const PruductListView({Key? key}) : super(key: key);

  //头部
  Widget condition() {
    return Positioned(
        child: Container(
      color: Colors.white,
      height: ScreenAdapter.heigth(150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            height: double.infinity,
            child: Center(
              child: Text(
                "综合",
                style: TextStyle(
                    color: Colors.red, fontSize: ScreenAdapter.fontSize(50)),
              ),
            ),
          )),
          Expanded(
              child: Container(
            height: double.infinity,
            child: Center(
              child: Text(
                "销量",
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenAdapter.fontSize(50)),
              ),
            ),
          )),
          Expanded(
              child: Container(
            height: double.infinity,
            child: Center(
              child: Text(
                "价格",
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenAdapter.fontSize(50)),
              ),
            ),
          )),
          Expanded(
              child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: Color.fromARGB(137, 204, 201, 201),
                        width: ScreenAdapter.width(1)))),
            child: Center(
              child: Text(
                "筛选",
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenAdapter.fontSize(50)),
              ),
            ),
          )),
        ],
      ),
    ));
  }

  //自定义组件
  Widget progressIndicator() {
    if (controller.hasData.value) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    } else {
      return const Center(
        child: Text("没有数据了哦，我是有底线的"),
      );
    }
  }

  //商品列表
  Widget productList() {
    return Container(
      color: Color.fromARGB(31, 158, 157, 157),
      margin: EdgeInsets.only(top: ScreenAdapter.heigth(150)),
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      child: Obx(() => controller.productList.isNotEmpty
          ? ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                var productItem = controller.productList[index];
                var pic = "https://xiaomi.itying.com/${productItem.pic}"
                    .replaceAll("\\", "/");
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0, 0, 0, ScreenAdapter.heigth(20)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(ScreenAdapter.heigth(20))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(ScreenAdapter.width(60)),
                            width: ScreenAdapter.width(400),
                            height: ScreenAdapter.heigth(460),
                            child: Image.network(pic, fit: BoxFit.fitHeight),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.fromLTRB(
                                ScreenAdapter.width(20),
                                ScreenAdapter.width(30),
                                ScreenAdapter.width(20),
                                ScreenAdapter.width(30)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${productItem.title}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenAdapter.fontSize(40)),
                                ),
                                SizedBox(
                                  height: ScreenAdapter.heigth(20),
                                ),
                                Text(
                                  "${productItem.subTitle}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenAdapter.fontSize(30)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: ScreenAdapter.heigth(20),
                                ),
                                Text(
                                  "价格¥${productItem.price}元",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    (controller.productList.length - 1 == index)
                        ? progressIndicator()
                        : const Text("")
                  ],
                );
              },
            )
          : progressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);

    return Scaffold(
      appBar: AppBarWidget(
        titleText: "222222222222222222222222222",
        action: [
          AppBarWidgetAction(
            title: "搜索",
            icon: Icons.search,
            callback: () => print("搜索点击"),
          )
        ],
      ),
      body: Stack(
        children: [
          condition(),
          RefreshIndicator(
            child: productList(),
            onRefresh: () => controller.onRefresh(),
          )
        ],
      ),
    );
  }
}
