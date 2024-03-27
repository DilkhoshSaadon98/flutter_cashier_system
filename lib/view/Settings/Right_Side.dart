import 'package:cashier_system/controller/setting_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/constant/imgaeasset.dart';
import 'package:cashier_system/core/shared/custom_header_screen.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Container(
      height: double.infinity,
      width: 0.3.sw,
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(width: 1.w),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: [
          CustomHeaderScreen(
            imagePath: AppImageAsset.settingIcons,
            title: "Setting",
            root: () {},
          ),
          customSizedBox(25),
          //buttons
          SizedBox(
              height: 0.6.sh,
              child: GetBuilder<SettingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: controller.settingOnTab[index],
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 0.01.sw, vertical: 15),
                          alignment: Alignment.center,
                          height: 0.08.sh,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.w, color: white),
                            // color: fourthColor,
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: Text(
                            controller.settingTabName[index],
                            style: titleStyle.copyWith(color: white),
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
