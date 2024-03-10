import 'package:flutter_screenutil/flutter_screenutil.dart';

double responsivefontSize(double width) {
  double fontSize = 0.0.sp;
  if (width > 1000) {
    fontSize = 16.sp;
  } else if (width > 700) {
    fontSize = 14.sp;
  } else if (width > 400) {
    fontSize = 12.sp;
  } else if (width > 200) {
    fontSize = 10.sp;
  } else {
    fontSize = 8.sp;
  }
  return fontSize;
}
