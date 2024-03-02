import 'dart:math';

import 'package:cashier_system/controller/setting_controller.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Right_Side extends StatelessWidget {
  const Right_Side({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Container(
      height: double.infinity,
      width: 0.3.sw,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(width: 1.w),
      ),
      child: Column(
        children: [
          Container(
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  child: Image.asset("assets/icons/settings.png"),
                ),
                Icon(
                  Icons.home_sharp,
                  size: 50.h,
                ),
                Icon(
                  Icons.arrow_circle_right,
                  size: 50.h,
                ),
              ],
            ),
          ),
          //buttons
          Container(
              height: 0.6.sh,
              child: GetBuilder<SettingController>(builder: (controller) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 6,
                      mainAxisSpacing: 4.w,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: controller.settingOnTab[index],
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 0.01.sw, vertical: 0.002.sh),
                          alignment: Alignment.center,
                          height: 0.08.sh,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.w, color: fourthColor),
                            // color: fourthColor,
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: Text(
                            controller.settingTabName[index],
                            style: TextStyle(
                              //color: white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    });
              }))
        ],
      ),
    );
  }
}
