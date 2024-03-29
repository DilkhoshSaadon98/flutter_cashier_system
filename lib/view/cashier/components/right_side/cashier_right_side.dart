import 'package:cashier_system/controller/cashier/cashier_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/constant/imgaeasset.dart';
import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/functions/formating_numbers.dart';
import 'package:cashier_system/core/responsive/responisve_text_body.dart';
import 'package:cashier_system/core/responsive/responsive_icons.dart';
import 'package:cashier_system/core/shared/custom_header_screen.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CashierRightSideScreen extends StatelessWidget {
  const CashierRightSideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CashierController());
    return GetBuilder<CashierController>(builder: (controller) {
      return Expanded(
        flex: 2,
        child: Container(
          color: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              CustomHeaderScreen(
                  title: 'Cashier',
                  imagePath: AppImageAsset.cashierIcons,
                  root: () {
                    Get.offAndToNamed(AppRoute.cashierScreen);
                  }),
              customSizedBox(),
              Expanded(
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color(0xffFF204E),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total',
                        style: titleStyle.copyWith(
                            color: white,
                            fontSize: responsivefontSize(Get.width)),
                      ),
                      Text(
                        formattingNumbers(controller.cartTotalPrice),
                        style: titleStyle.copyWith(
                            color: white,
                            fontSize: responsivefontSize(Get.width)),
                      ),
                    ],
                  ),
                ),
              ),
              customSizedBox(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: const Color(0xff4CCD99),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'New Bill',
                              style: titleStyle.copyWith(
                                  color: white,
                                  fontSize: responsivefontSize(Get.width)),
                            ),
                            const Icon(
                              Icons.recycling_rounded,
                              color: white,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 194, 205, 76),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'PAY',
                              style: titleStyle.copyWith(
                                  color: white,
                                  fontSize: responsivefontSize(Get.width)),
                            ),
                            SvgPicture.asset(
                              AppImageAsset.cashierIcons,
                              // ignore: deprecated_member_use
                              color: white,
                              width: responsiveIconSize(Get.width),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              customSizedBox(),
              Expanded(
                flex: 5,
                child: GetBuilder<CashierController>(builder: (controller) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width > 800 ? 2 : 1,
                      mainAxisSpacing: 10,
                      childAspectRatio: Get.width > 600 ? 4.h : 3.5.h,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: controller.buttonsDetails.length,
                    itemBuilder: (context, index) {
                      bool isHovered = controller.hoverStates[index];

                      return MouseRegion(
                        onEnter: (_) {
                          controller.setHoverState(index, true);
                        },
                        onExit: (_) {
                          controller.setHoverState(index, false);
                        },
                        child: GestureDetector(
                          onTap: () {
                            controller.buttonsDetails[index]['function'](
                                controller.buttonsDetails[index]['title']);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            height: 50.h,
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            decoration: BoxDecoration(
                              color: !isHovered
                                  ? controller.buttonsDetails[index]['color']
                                  : secondColor,
                              border: Border.all(
                                  color: controller.buttonsDetails[index]
                                      ['color'],
                                  width: .5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    controller.buttonsDetails[index]['title'],
                                    style: bodyStyle.copyWith(
                                      color: white,
                                      fontSize: responsivefontSize(Get.width),
                                    ),
                                  ),
                                ),
                                Icon(
                                  controller.buttonsDetails[index]['icon'],
                                  color: white,
                                  size: responsiveIconSize(Get.width),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
