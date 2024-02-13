
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBarTitle(
  String title, [
  bool? isSubScreen,
  bool? showBadge = false,
]) {
  return AppBar(
    
    leading: isSubScreen == true
        ? GestureDetector(
            onLongPress: () {
              Get.toNamed(AppRoute.homeScreen);
            },
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon:  const Icon(
                  Icons.arrow_back_ios,
                  color: secondColor,
                )),
          )
        : Container(),
    centerTitle: true,
    elevation: 10,
    scrolledUnderElevation: 1,
    title: Text(
      title,
      style: titleStyle.copyWith(color: secondColor, fontSize: 18),
    ),
  );
}
