import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  const MineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MineView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          Text("我是多语言=====${"hello".tr}"),
          ElevatedButton(
              onPressed: () {
                var locale = Locale('en', 'US');
                Get.updateLocale(locale);
              },
              child: Text("更新多语言为英语")),
          ElevatedButton(
              onPressed: () {
                var locale = Locale('zh', 'CN');

                print("${locale.languageCode}-${locale.countryCode}");

                Get.updateLocale(locale);
              },
              child: Text("更新多语言为中文"))
        ],
      )),
    );
  }
}
