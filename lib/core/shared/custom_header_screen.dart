import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/responsive/responisve_text_body.dart';
import 'package:cashier_system/core/responsive/responsive_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomHeaderScreen extends StatelessWidget {
  final String? title;
  final String? imagePath;
  final void Function()? root;
  CustomHeaderScreen({
    super.key,
    this.title,
    this.imagePath,
    this.root,
  });

  final DateTime myDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: root,
          child: Column(
            children: [
              SvgPicture.asset(
                imagePath!,
                width: responsiveIconSize(Get.width),
                // ignore: deprecated_member_use
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
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       formattedDate,
        //       style: bodyStyle.copyWith(color: secondColor),
        //     ),
        //     customSizedBox(),
        //     Text(
        //       formattedTime,
        //       style: bodyStyle.copyWith(color: secondColor),
        //     ),
        //   ],
        // ),
        CircleAvatar(
            radius: responsiveIconSize(Get.width),
            backgroundColor: secondColor,
            child: IconButton(
                onPressed: () {
                  Get.offAllNamed(AppRoute.homeScreen);
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
