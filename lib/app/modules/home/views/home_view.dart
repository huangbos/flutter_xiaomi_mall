
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_xiaomi_mall/app/services/myFonts.dart';
import 'package:flutter_xiaomi_mall/app/services/screenAdapter.dart';
import 'package:flutter_xiaomi_mall/app/utils/appUtil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = AppUtil.getStatusBarHeight(context);

    Widget tab() {
      return Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Obx(() => AppBar(
                centerTitle: true,
                backgroundColor:
                    controller.flag.value ? Colors.white : Colors.transparent,
                title: Container(
                  width: ScreenAdapter.width(620),
                  height: ScreenAdapter.heigth(96),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: controller.flag.value
                        ? Color.fromARGB(221, 126, 125, 125)
                        : Color.fromARGB(96, 243, 239, 239),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      10,
                      0,
                      10,
                      0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: controller.flag.value
                                  ? Colors.white
                                  : Colors.black26,
                              size: ScreenAdapter.fontSize(50),
                            ),
                            Text(
                              "手机",
                              style: TextStyle(
                                  color: controller.flag.value
                                      ? Colors.white
                                      : Colors.black26,
                                  fontSize: ScreenAdapter.fontSize(36)),
                            )
                          ],
                        ),
                        Icon(Icons.scanner_sharp,
                            color: controller.flag.value
                                ? Colors.white
                                : Colors.black26,
                            size: ScreenAdapter.fontSize(50))
                      ],
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: IconButton(
                      icon: Icon(Icons.qr_code),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () {},
                    ),
                  )
                ],
                leading: Icon(
                  MyFonts.xiaomi,
                  color: const Color.fromARGB(255, 236, 121, 113),
                  size: ScreenAdapter.fontSize(80),
                ),
              )));
    }

    Widget loopBanner() {
      return Obx(() => SizedBox(
            width: double.infinity,
            height: ScreenAdapter.heigth(800),
            child: Swiper(
              itemCount: controller.bannerList.length,
              itemBuilder: (context, index) {
                var pic =
                    "https://xiaomi.itying.com/${controller.bannerList[index].pic!}"
                        .replaceAll("\\", "/");
                return Image.network(
                  pic,
                  height: ScreenAdapter.heigth(800),
                  fit: BoxFit.cover,
                );
              },
              loop: true, //无限循环
              autoplay: true, //自动播放
              // pagination: const SwiperPagination(
              //     builder: SwiperPagination.rect,

              //   ),
              pagination: SwiperPagination(
                  margin: const EdgeInsets.all(0.0),
                  builder: SwiperCustomPagination(builder:
                      (BuildContext context, SwiperPluginConfig config) {
                    return ConstrainedBox(
                      constraints: const BoxConstraints.expand(height: 50.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: const RectSwiperPaginationBuilder(
                                color: Colors.grey,
                                activeColor: Colors.blue,
                              ).build(context, config),
                            ),
                          )
                        ],
                      ),
                    );
                  })),

              // layout: SwiperLayout.TINDER,
            ),
          ));
    }

    Widget banner() {
      return SizedBox(
        width: double.infinity,
        height: ScreenAdapter.heigth(150),
        child: Image.asset("assets/images/xiaomiBanner.png"),
      );
    }

    //顶部滑动分类
    Widget category() {
      return Obx(() => SizedBox(
            width: double.infinity,
            height: ScreenAdapter.heigth(470),
            child: Swiper(
              itemCount: controller.categoryList.length ~/ 10, //取整
              itemBuilder: (context, index) {
                return GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: ScreenAdapter.width(20),
                      crossAxisSpacing: ScreenAdapter.width(20),
                    ),
                    itemBuilder: (context, i) {
                      String picUrl =
                          "https://xiaomi.itying.com/${controller.categoryList[index * 10 + i].pic}";
                      return Column(
                        children: [
                          Container(
                            color: Colors.green,
                            alignment: Alignment.center,
                            width: ScreenAdapter.width(140),
                            height: ScreenAdapter.heigth(140),
                            child: Image.network(picUrl.replaceAll("\\", "/"),
                                fit: BoxFit.fitHeight),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, ScreenAdapter.heigth(4), 0, 0),
                            child: Text(
                                "${controller.categoryList[index * 10 + i].title}",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34))),
                          )
                        ],
                      );
                    });
              },
              pagination: SwiperPagination(
                  margin: const EdgeInsets.all(0.0),
                  builder: SwiperCustomPagination(builder:
                      (BuildContext context, SwiperPluginConfig config) {
                    return ConstrainedBox(
                      constraints: BoxConstraints.expand(
                          height: ScreenAdapter.heigth(20)),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: const RectSwiperPaginationBuilder(
                                color: Colors.black12,
                                activeColor: Colors.black54,
                              ).build(context, config),
                            ),
                          )
                        ],
                      ),
                    );
                  })),
            ),
          ));
    }

    //商品列表瀑布流
    Widget goodsList() {
      return Obx(() => Container(
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            color: Colors.grey[200],
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemCount: controller.goodsList.length,
              physics: const NeverScrollableScrollPhysics(),//禁止滚动
              shrinkWrap: true, //收缩，让元素宽度自适应    必须加上,否则报错
              itemBuilder: (context, index) {
                var goodsItem = controller.goodsList[index];
                var pic = "https://xiaomi.itying.com/${goodsItem.pic}"
                    .replaceAll("\\", "/");
                return Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenAdapter.width(10)),
                      color: Colors.white
                     ),
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          pic,
                          fit: BoxFit.cover,
                        ),
                      ),
                     Column(
                      children: [
                                              SizedBox(height: ScreenAdapter.heigth(10),),

                       Container(
                        width: double.infinity,
                        child: Text(
                          "${goodsItem.title}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(42),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                                            SizedBox(height: ScreenAdapter.heigth(10),),

                      Container(
                        width: double.infinity,
                        child: Text(
                          "${goodsItem.subTitle}",
                          textAlign: TextAlign.start,
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                        ),
                      ),
                                            SizedBox(height: ScreenAdapter.heigth(10),),

                      Container(
                        width: double.infinity,
                        child: Text(
                          "¥${goodsItem.price}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(32),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                     ],),
                    ],
                  ),
                );
              },
            ),
          ));
    }

    Widget homePage() {
      return Positioned(
        top: -statusBarHeight,
        left: 0,
        right: 0,
        bottom: 0,
        child: ListView(
          controller: controller.scrollController,
          children: [loopBanner(), banner(), category(), goodsList()],
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [homePage(), tab()],
      ),
    );
  }
}
