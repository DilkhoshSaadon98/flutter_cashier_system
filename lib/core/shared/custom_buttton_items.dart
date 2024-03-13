import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget customButtonGlobal(
    void Function()? onTap, String title, IconData iconData,
    [Color? color, Color? textColor]) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: Get.width,
      height: 50.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          color: color ?? white,
          border: Border.all(color: textColor ?? thirdColor, width: 1),
          borderRadius: BorderRadius.circular(5.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: bodyStyle.copyWith(
                fontSize: 12.sp,
                color: textColor ?? thirdColor,
                fontWeight: FontWeight.w600),
          ),
          Icon(
            iconData,
            size: 20,
            color: textColor ?? thirdColor,
          ),
        ],
      ),
    ),
  );
}
