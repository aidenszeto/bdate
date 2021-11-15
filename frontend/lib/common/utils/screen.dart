import 'package:flutter_screenutil/flutter_screenutil.dart';

double w(double width) {
  return ScreenUtil().setWidth(width);
}

double h(double height) {
  return ScreenUtil().setHeight(height);
}

double f(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}