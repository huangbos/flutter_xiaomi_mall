import 'package:flutter/material.dart';
import 'package:flutter_xiaomi_mall/app/services/screenAdapter.dart';
import 'package:get/get.dart';

//自定义AppBar 右侧的操作按钮类
class AppBarWidgetAction {
  final String? title; //标题
  final IconData? icon; //图标
  final Function()? callback; //点击事件回调

  AppBarWidgetAction({this.title, this.icon, this.callback});
}

//自定义AppBar
class AppBarWidget extends AppBar {
  final String titleText;
  final String? backText;

  final List<AppBarWidgetAction>? action;

  final Function()? backCallback;

  AppBarWidget({
    super.key,
    required this.titleText,
    this.backText = "",
    this.action,
    this.backCallback,
  }) : super(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Stack(
              children: [
                Container(
                  color: Colors.white,
                  height: ScreenAdapter.heigth(150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          //返回按钮点击
                          if (backCallback != null) {
                            backCallback();
                          } else {
                            Get.back();
                          }
                        },
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back),
                            Text(
                              backText!.isNotEmpty ? backText : "",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(40)),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: action == null //右侧操作按钮
                            ? []
                            : action
                                .map((element) => InkWell(
                                      onTap: () => {
                                        if (element.callback != null)
                                          {element.callback!()}
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: ScreenAdapter.width(20),
                                          ),
                                          element.icon == null
                                              ? const Text("")
                                              : Icon(element.icon),
                                          Text(
                                            element.title ?? "",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenAdapter.fontSize(40)),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(ScreenAdapter.fontSize(90), 0,
                      ScreenAdapter.fontSize(160), 0),
                  height: ScreenAdapter.heigth(150),
                  child: Center( //标题
                    child: Text(
                      titleText,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: ScreenAdapter.fontSize(60)),
                    ),
                  ),
                ),
              ],
            ));
}
