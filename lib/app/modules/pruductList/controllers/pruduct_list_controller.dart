import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomi_mall/app/http/baseResponse.dart';
import 'package:flutter_xiaomi_mall/app/http/httpCallback.dart';
import 'package:flutter_xiaomi_mall/app/models/productListModel.dart';
import 'package:flutter_xiaomi_mall/app/http/http.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class PruductListController extends GetxController {
  ScrollController scrollController = ScrollController();

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  RxList<ProductListItemModel> productList = <ProductListItemModel>[].obs;

  int page = 0;
  int pageSize = 10;
  // bool flag = true;
  // RxBool hasData = true.obs;
  bool isRefresh = false;
  @override
  void onInit() {
    super.onInit();
    // scrollController.addListener(() {
    //   var scrollY = scrollController.position.pixels;
    //   var maxScroll = scrollController.position.maxScrollExtent;
    //   if (scrollY > (maxScroll - 30)) {
    //     //加载更多
    //     isRefresh = false;
    //     getProductList();
    //   }
    // });

    getProductList();
  }

  getProductList() async {
    //  flag = false;
      print("page====${page}");
      final cid = Get.arguments["cid"];
      print("cid=====$cid");
      // final response = await Dio().get(
      //     "https://xiaomi.itying.com/api/plist?cid=${cid}&${page}=1&pageSize=${pageSize}");

      // print("response===$response");

      var params = {"cid": cid, "page": page, "pageSize": pageSize};

      // final response = await HttpUtil.instance.request<ProductListItemModel>(
      //     "api/plist",
      //     data: params,
      //     options: Options(headers: {"version": "1"}));

      HttpUtil.instance.get2<ProductListItemModel>(
        "api/plist",
        data: params,
        onSuccess: (result) {
          // flag = true;
          page++;
          refreshController.refreshCompleted();

          if (isRefresh) {
            //刷新
            productList.clear();
          }
          var productListItemModelList = result.data;
          productListItemModelList?.forEach((item) {
            var bb = ProductListItemModel.fromJson(item);
            productList.add(bb);
          });
          //没有更多数据了
          if (productListItemModelList!.length < pageSize) {
            // hasData.value = false;
            refreshController.loadNoData();
          } else {
            refreshController.loadComplete();
          }
        },
        onError: (code, message) {
          print("接口报错了=====$message");
        },
      );
  }

  onRefresh() {
    isRefresh = true;
    page = 1;
    getProductList();
  }

  onLoadMore() {
    isRefresh = false;
    getProductList();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
