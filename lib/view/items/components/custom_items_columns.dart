import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTableHeader extends StatelessWidget {
  final List<String> data;
  final int length;
  final List<int> columnWidth;
  const CustomTableHeader({
    super.key,
    required this.length,
    required this.data,
    required this.columnWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: primaryColor,
      child: Row(
        children: [
          ...List.generate(length, (index) {
            return Container(
              width: columnWidth[index].w,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(width: .3, color: secondColor)),
              child: Text(
                data[index],
                style: titleStyle.copyWith(color: secondColor),
              ),
            );
          }),
        ],
      ),
    );
  }
}
