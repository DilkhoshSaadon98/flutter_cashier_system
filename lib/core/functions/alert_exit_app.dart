import 'dart:io';

import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp([bool? isUser = false]) {
  Get.defaultDialog(
      backgroundColor: white,
      title: "Warning".tr,
      titleStyle: titleStyle.copyWith(fontSize: 22),
      middleText: "Are you sure to exit app ?".tr,
      middleTextStyle: bodyStyle.copyWith(fontSize: 18),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor)),
            onPressed: () {
              exit(0);
            },
            child: Text(
              "Confirm".tr,
              style: bodyStyle.copyWith(color: white),
            )),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.redAccent[100])),
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cancel".tr,
              style: bodyStyle.copyWith(color: white),
            ))
      ]);
  return Future.value(true);
}
