import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBar(String title, String content, [bool? longDelay]) {
  return Get.snackbar(
    '',
    '',
    titleText: Text(
      title,
      style: titleStyle.copyWith(color: primaryColor),
    ),
    messageText: Text(
      content,
      style: bodyStyle.copyWith(color: primaryColor),
    ),
    icon: Icon(
      Icons.check,
      color: primaryColor,
    ),
    backgroundColor: whiteNeon.withOpacity(.6),
    colorText: primaryColor,
    snackStyle: SnackStyle.FLOATING,
    borderWidth: 1,
    borderColor: primaryColor,
    duration: longDelay == true
        ? const Duration(milliseconds: 3000)
        : const Duration(milliseconds: 1000),
  );
}
