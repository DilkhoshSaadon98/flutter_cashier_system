import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/functions/validinput.dart';
import 'package:cashier_system/core/shared/custom_buttton_global.dart';
import 'package:cashier_system/core/shared/custom_formfield_global.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

cashierDialog(String title, IconData iconData, TextEditingController controller,
    void Function()? onTap) {
  return Get.defaultDialog(
    title: "",
    titleStyle: titleStyle,
    content: Container(
      height: 200,
      width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: titleStyle.copyWith(fontSize: 20),
          ),
          customSizedBox(25),
          CustomTextFormFieldGlobal(
              mycontroller: controller,
              borderColor: primaryColor,
              hinttext: title,
              labeltext: '',
              iconData: Icons.discount_outlined,
              valid: (value) {
                return validInput(value!, 1, 10, 'number');
              },
              isNumber: true),
          customButtonGlobal(
              onTap, 'Submit', Icons.check, primaryColor, white, 400, 50)
        ],
      ),
    ),
  );
}
