import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/constant/imgaeasset.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class CashierRightSideScreen extends StatelessWidget {
  const CashierRightSideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDateTime = DateFormat('EEE, d, yyyy HH:mm:ss').format(now);

    return Expanded(
      flex: 2,
      child: Container(
        color: primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formattedDateTime.toString(),
                    style: titleStyle.copyWith(color: white),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.home,
                      color: secondColor,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            customSizedBox(),
            Expanded(
              child: Container(
                height: 60,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Total',
                      style: titleStyle.copyWith(color: white, fontSize: 20),
                    ),
                    Text(
                      '10.000 IQD',
                      style: titleStyle.copyWith(color: white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            customSizedBox(),
            Expanded(
              child: Container(
                height: 60,
                alignment: Alignment.center,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      AppImageAsset.cashierIcons,
                      // ignore: deprecated_member_use
                      color: white,
                      width: 35,
                    ),
                    Text(
                      'PAY',
                      style: titleStyle.copyWith(color: white),
                    ),
                  ],
                ),
              ),
            ),
            customSizedBox(),
            Expanded(
              flex: 5,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3,
                      crossAxisSpacing: 10),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: thirdColor,
                          border: Border.all(color: secondColor, width: .5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'data$index',
                            style: bodyStyle.copyWith(color: white),
                          ),
                          const Icon(
                            Icons.holiday_village,
                            color: white,
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
