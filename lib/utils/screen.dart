import 'package:flutter_screenutil/flutter_screenutil.dart';


/// 设置宽度
double autoWidth(double width) {
  return ScreenUtil().setWidth(width);
}

/// 设置宽度
double autoHeight(double height) {
  return ScreenUtil().setHeight(height);
}

/// 设置字体尺寸
double autoFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}