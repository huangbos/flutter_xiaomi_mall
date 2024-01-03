
import 'package:flutter/material.dart';

class AppUtil{
  
  //获取状态栏高度
  static getStatusBarHeight(context){
    return MediaQuery.of(context).viewPadding.top;
  }
}