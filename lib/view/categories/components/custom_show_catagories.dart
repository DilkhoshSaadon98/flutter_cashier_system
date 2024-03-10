import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomShowCatagories extends StatelessWidget {
  const CustomShowCatagories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      height: Get.height,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Get.width > 1200
                  ? 8
                  : Get.width > 900
                      ? 5
                      : Get.width > 500
                          ? 3
                          : 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  color: white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.layers,
                    size: 50,
                    color: primaryColor,
                  ),
                  Text(
                    "data${index.toString()}",
                    style: bodyStyle.copyWith(),
                  )
                ],
              ),
            );
          }),
    );
  }
}
