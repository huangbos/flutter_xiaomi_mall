import 'package:flutter_xiaomi_mall/app/services/pageAliveWrapper.dart';
import 'package:flutter_xiaomi_mall/app/utils/spUtil.dart';
import 'package:get/get.dart';

class MineController extends FullLifeCycleController with PageAliveWrapperMixins{
  RxInt count = 0.obs;
  @override
  void onInit() async {
    super.onInit();

    count.value = 10;

    SpUtil.instance.setStorage("name", "huangbo");
    SpUtil.instance.setStorage("age", 10);
    SpUtil.instance.setStorage("myMap", {"name": "huangbo", "age": 10});

    var name = await SpUtil.instance.getStorage("name");
    var age = await SpUtil.instance.getStorage("age");
    var myMap = await SpUtil.create().getStorage("myMap");
    print("name===$name");
    print("age====$age");
    print("myMap====${myMap["name"]}");
  }

  @override
  void onReady() {
    super.onReady();
    print("onReady........................");
  }


  @override
  void onResumed() {
    print("重新加载数据吧");
  }


}

