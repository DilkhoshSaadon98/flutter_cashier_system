import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/functions/validinput.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:cashier_system/view/categories/components/custom_buttton_items.dart';
import 'package:cashier_system/view/categories/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddCatagories extends StatelessWidget {
  const AddCatagories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height - 50,
        color: white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Catagories Name',
              style: titleStyle.copyWith(fontSize: 20.sp, color: thirdColor),
            ),
            CustomTextFormFieldItems(
                hinttext: 'Catagories Name',
                labeltext: "Catagories Name",
                iconData: Icons.layers,
                valid: (value) {
                  return validInput(value!, 0, 500, "");
                },
                isNumber: false),
            customSizedBox(30),
            Text(
              'Catagories Image',
              style: titleStyle.copyWith(fontSize: 20.sp, color: thirdColor),
            ),
            FlutterLogo(
              size: 250.spMax,
            ),
            const Spacer(),
            customButtonItems(() {}, "Add", Icons.add, primaryColor, white)
          ],
        ));
  }
}
