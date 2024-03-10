import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/responsive/responisve_text_body.dart';
import 'package:cashier_system/core/responsive/responsive_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomHeaderScreen extends StatelessWidget {
  final String? title;
  final String? imagePath;
  final void Function()? root;
  const CustomHeaderScreen({
    super.key,
    this.title,
    this.imagePath,
    this.root,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onDoubleTap: root,
          child: Column(
            children: [
              SvgPicture.asset(
                imagePath!,
                width: responsiveIconSize(Get.width),
                color: secondColor,
              ),
              Text(
                title!,
                style: titleStyle.copyWith(
                    color: secondColor,
                    fontSize: responsivefontSize(Get.width)),
              ),
            ],
          ),
        ),
        CircleAvatar(
            radius: responsiveIconSize(Get.width),
            backgroundColor: secondColor,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.home,
                  color: primaryColor,
                  size: responsiveIconSize(Get.width),
                ))),
      ],
    );
  }
}
