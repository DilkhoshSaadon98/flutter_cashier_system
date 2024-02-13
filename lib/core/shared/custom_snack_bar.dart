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
      style: titleStyle.copyWith(color: white),
    ),
    messageText: Text(
      content,
      style: bodyStyle.copyWith(color: white),
    ),
    icon: const Icon(
      Icons.check,
      color: white,
    ),
    backgroundColor: fourthColor.withOpacity(.6),
    colorText: white,
    snackStyle: SnackStyle.FLOATING,
    borderWidth: 1,
    borderColor: white,
    duration: longDelay == true
        ? const Duration(milliseconds: 3000)
        : const Duration(milliseconds: 1000),
  );
}
