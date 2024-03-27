import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTableHeader extends StatelessWidget {
  final List<String> data;
  final int length;
  const CustomTableHeader({
    super.key,
    required this.length,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(length, (index) {
            int flexValue = (index == 2)
                ? 3
                : (index == 0 || index == 1 || index == length - 3)
                    ? 1
                    : 2;
            return Expanded(
              flex: flexValue,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryColor,
                    border: Border.all(width: .3, color: secondColor)),
                child: Text(
                  data[index],
                  style: titleStyle.copyWith(color: secondColor),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
