import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shopcart_controller.dart';

class ShopcartView extends GetView<ShopcartController> {
  const ShopcartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopcartView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ShopcartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
