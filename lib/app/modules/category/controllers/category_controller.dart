import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomi_mall/app/models/categoryLeftModel.dart';
import 'package:flutter_xiaomi_mall/app/models/categoryModel.dart';
import 'package:flutter_xiaomi_mall/app/models/categoryRightModel.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxList<CategoryLeftItemModel> categoryLeftList =
      <CategoryLeftItemModel>[].obs;

  RxList<CategoryRightItemModel> categoryRightList =
      <CategoryRightItemModel>[].obs;

  RxInt selectIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //左边分类数据
  getLeftCategoryData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/pcate");
    debugPrint("$response");
    var categoryLeftModel = CategoryLeftModel.fromJson(response.data);
    categoryLeftList.value = categoryLeftModel.result!;
    getRightCategoryData(categoryLeftList.first.id);
  }

  //右边分类数据
  getRightCategoryData(id) async {
        debugPrint("右边分类数据id====$id");
    // id = "59f1e1ada1da8b15d42234e9";
    var response = await Dio().get("https://xiaomi.itying.com/api/pcate?pid=${id}");
    debugPrint("右边分类数据====$response");
    var categoryRightModel = CategoryRightModel.fromJson(response.data);
    categoryRightList.value = categoryRightModel.result!;
  }
}
