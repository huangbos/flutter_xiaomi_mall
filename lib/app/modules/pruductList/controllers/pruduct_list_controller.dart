import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomi_mall/app/models/productListModel.dart';
import 'package:get/get.dart';

class PruductListController extends GetxController {
  ScrollController scrollController = ScrollController();

  RxList<ProductListItemModel> productList = <ProductListItemModel>[].obs;

  int page = 0;
  int pageSize = 10;
  bool flag = true;
  RxBool hasData = true.obs;
  bool isRefresh = false;
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      var scrollY = scrollController.position.pixels;
      var maxScroll = scrollController.position.maxScrollExtent;
      if (scrollY > (maxScroll - 30)) {
        //加载更多
        isRefresh = false;
        getProductList();
      }
    });

    getProductList();
  }

  getProductList() async {
    if (flag && hasData.value) {
      flag = false;
      print("page====${page}");
      final cid = Get.arguments["cid"];
      print("cid=====$cid");
      final response = await Dio().get(
          "https://xiaomi.itying.com/api/plist?cid=${cid}&${page}=1&pageSize=${pageSize}");


      print("response===$response");

      final productListModel = ProductListModel.fromJson(response.data);

      final tempList = productListModel.result!;

      if(isRefresh){
        productList.clear();
      }

      productList.addAll(tempList);

      page++;

      flag = true;

      if (tempList.length < pageSize) {
        hasData.value = false;
      }

   
    }
  }

 Future onRefresh() async {
    isRefresh = true ;
    page = 1;
    getProductList();

 
  }

  @override
  void onReady() {
    super.onReady();

  }
}
