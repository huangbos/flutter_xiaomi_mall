import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  //宽
  static width(int width) {
    return width.w;
  }

  //高

  static heigth(int height) {
    return height.h;
  }

//字体大小
  static fontSize(int fontSize) {
    return fontSize.sp;
  }

  //屏幕宽度

  static screenWidth() {
    return 1.sw;
  }

//屏幕高度
  static screenHeight() {
    return 1.sh;
  }
}
