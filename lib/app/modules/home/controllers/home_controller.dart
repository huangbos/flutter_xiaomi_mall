import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_xiaomi_mall/app/models/bannerModel.dart';
import 'package:flutter_xiaomi_mall/app/models/categoryModel.dart';
import 'package:flutter_xiaomi_mall/app/models/goodsList.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ScrollController scrollController = ScrollController();

  RxBool flag = false.obs;

  RxInt statusBarHeight = 0.obs;

  RxList<Result> bannerList = <Result>[].obs;

  RxList<CategoryItemMoel> categoryList = <CategoryItemMoel>[].obs;

  RxList<GoodsListItemModel> goodsList = <GoodsListItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      var scrollY = scrollController.position.pixels;

      //向上滑动,如果超过20 就 设置flag = true,否则 flag = false;
      if (scrollY > 20) {
        if (!flag.value) {
          flag.value = true;
        }
      } else {
        if (flag.value) {
          flag.value = false;
        }
      }
    });

    getBannerData();
    getCategoryData();
    getGoodsData();
  }

//获取banner数据
  getBannerData() async {
    //https://xiaomi.itying.com/api/focus
    var response = await Dio().get("https://xiaomi.itying.com/api/focus");
    print("${response}");
    var banner = BannerModel.fromJson(response.data);
    bannerList.value = banner.result!;
  }

  //获取分类数据
  getCategoryData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/bestCate");
    print(response);
    var category = CategoryMoel.fromJson(response.data);
    categoryList.value = category.result!;
  }

  //获取商品列表数据
  getGoodsData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/plist");
    var goodsListModel = GoodsListModel.fromJson(response.data);
    goodsList.value = goodsListModel.result!;

    var str = json.encode(goodsList.value);
    print("1111111====$str");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
