import 'package:cashier_system/controller/home/home_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      body: Container(
        width: Get.width,
        color: primaryColor,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            customSizedBox(30),
            _buildGridView(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'MR.ROBOT ',
          style: titleStyle.copyWith(fontSize: 60.sp, color: white),
        ),
        Text(
          'COM.',
          style: titleStyle.copyWith(fontSize: 60.sp, color: secondColor),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      width: Get.width / 2, // Adjust the width if necessary
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondColor.withOpacity(.4),
      ),
      child: GetBuilder<HomeController>(builder: (controller) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _calculateCrossAxisCount(Get.width),
            childAspectRatio: 1.9.h,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 10.h,
          ),
          itemCount: controller.homeTitles.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: controller.homeTab[index],
              child: Column(
                children: [
                  SvgPicture.asset(
                    controller.homeIcons[index],
                    semanticsLabel: 'Acme Logo',
                    color: white,
                    width: 50.w,
                  ),
                  customSizedBox(),
                  Text(
                    controller.homeTitles[index],
                    style: titleStyle.copyWith(color: white),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  int _calculateCrossAxisCount(double screenWidth) {
    if (screenWidth > 1100) {
      return 3;
    } else if (screenWidth > 650) {
      return 2;
    } else {
      return 1;
    }
  }
}
