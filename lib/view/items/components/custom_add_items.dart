import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/functions/validinput.dart';
import 'package:cashier_system/core/shared/custom_formfield_global.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:cashier_system/core/shared/custom_buttton_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height - 50,
        color: white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView(
          children: [
            Text(
              'Items Name',
              style: titleStyle.copyWith(
                fontSize: 20.sp,
              ),
            ),
            customSizedBox(10),
            CustomTextFormFieldGlobal(
                hinttext: 'Items Name',
                labeltext: "Items Name",
                iconData: Icons.border_color_outlined,
                borderColor: primaryColor,
                valid: (value) {
                  return validInput(value!, 0, 500, "");
                },
                isNumber: false),
            customSizedBox(25),
            Text(
              'Items Description',
              style: titleStyle.copyWith(
                fontSize: 20.sp,
              ),
            ),
            customSizedBox(10),
            CustomTextFormFieldGlobal(
                hinttext: 'Items Description',
                labeltext: "Items Description",
                iconData: Icons.description_outlined,
                borderColor: primaryColor,
                valid: (value) {
                  return validInput(value!, 0, 500, "");
                },
                isNumber: false),
            customSizedBox(25),
            Text(
              'Selling Price',
              style: titleStyle.copyWith(
                fontSize: 20.sp,
              ),
            ),
            customSizedBox(10),
            CustomTextFormFieldGlobal(
                hinttext: 'Selling Price',
                labeltext: "Selling Price",
                iconData: Icons.price_change_outlined,
                borderColor: primaryColor,
                valid: (value) {
                  return validInput(value!, 0, 500, "");
                },
                isNumber: false),
            customSizedBox(25),
            Text(
              'Buying Price',
              style: titleStyle.copyWith(
                fontSize: 20.sp,
              ),
            ),
            customSizedBox(10),
            CustomTextFormFieldGlobal(
                hinttext: 'Buying Price',
                labeltext: "Buying Price",
                iconData: Icons.price_change_outlined,
                borderColor: primaryColor,
                valid: (value) {
                  return validInput(value!, 0, 500, "");
                },
                isNumber: false),
            customSizedBox(25),
            Text(
              'Wholesale Price',
              style: titleStyle.copyWith(
                fontSize: 20.sp,
              ),
            ),
            customSizedBox(10),
            CustomTextFormFieldGlobal(
                hinttext: 'Wholesale Price',
                labeltext: "Wholesale Price",
                iconData: Icons.price_change_outlined,
                borderColor: primaryColor,
                valid: (value) {
                  return validInput(value!, 0, 500, "");
                },
                isNumber: false),
            customSizedBox(25),
            Text(
              'Cost Price',
              style: titleStyle.copyWith(
                fontSize: 20.sp,
              ),
            ),
            customSizedBox(10),
            CustomTextFormFieldGlobal(
                hinttext: 'Cost Price',
                labeltext: "Cost Price",
                iconData: Icons.price_change_outlined,
                borderColor: primaryColor,
                valid: (value) {
                  return validInput(value!, 0, 500, "");
                },
                isNumber: false),
            customSizedBox(25),
            Text(
              'Items Catagories',
              style: titleStyle.copyWith(
                fontSize: 20.sp,
              ),
            ),
            customSizedBox(10),
            CustomTextFormFieldGlobal(
                hinttext: 'Items Catagories',
                labeltext: "Items Catagories",
                iconData: Icons.layers,
                borderColor: primaryColor,
                valid: (value) {
                  return validInput(value!, 0, 500, "");
                },
                isNumber: false),
            customSizedBox(25),
            Text(
              'Items Image',
              style: titleStyle.copyWith(
                fontSize: 20.sp,
              ),
            ),
            FlutterLogo(
              size: 250.spMax,
            ),
            const Spacer(),
            customButtonGlobal(() {}, "Add", Icons.add, primaryColor, white)
          ],
        ));
  }
}
