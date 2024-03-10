import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

MyServices myServices = Get.find();
TextStyle get titleStyle {
  return myServices.sharedPreferences.getString('lang') == 'en'
      ? GoogleFonts.kanit(
          textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: primaryColor,
        ))
      : myServices.sharedPreferences.getString('lang') == 'ar'
          ? GoogleFonts.cairo(
              textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: primaryColor,
            ))
          : GoogleFonts.amiri(
              textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: primaryColor,
            ));
}

TextStyle get introStyle {
  return GoogleFonts.rubikMoonrocks(
      textStyle: TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: primaryColor,
  ));
}

TextStyle get bodyStyle {
  return myServices.sharedPreferences.getString('lang') == 'en'
      ? GoogleFonts.barlowCondensed(
          textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: primaryColor,
        ))
      : myServices.sharedPreferences.getString('lang') == 'ar'
          ? GoogleFonts.cairo(
              textStyle: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: primaryColor,
            ))
          : GoogleFonts.amiri(
              textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: primaryColor,
            ));
}

double constScreenPadding = 15.w;
double constRadius = 8.r;
String constAppVersion = "1.1.2";
