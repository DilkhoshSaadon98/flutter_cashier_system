import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/shared/custom_divider.dart';
import 'package:cashier_system/core/shared/custom_drop_down_search.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:cashier_system/core/shared/custom_buttton_items.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchImportExportWidget extends StatelessWidget {
  const CustomSearchImportExportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search',
          style: titleStyle.copyWith(color: white),
        ),
        CustomDropDownSearch(
          title: "Account",
          // contrllerId: controller.catID!,
          // contrllerName: controller.catName!,
          listData: [
            SelectedListItem(name: "Box", value: "Box"),
            SelectedListItem(name: "Employee", value: "Employee"),
            SelectedListItem(name: "Expenses", value: "Expenses"),
            SelectedListItem(name: "Import Mony", value: "Import Mony"),
          ],
          iconData: Icons.layers,
        ),
        customSizedBox(),
        Text(
          "Invoice Number:",
          style: titleStyle.copyWith(color: white, fontSize: 16),
        ),
        customSizedBox(5),
        Row(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: white),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                width: Get.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: white),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
        customSizedBox(25),
        Text(
          "Date:",
          style: titleStyle.copyWith(color: white, fontSize: 16),
        ),
        customSizedBox(5),
        Row(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: white),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                width: Get.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: white),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
        customSizedBox(5),
        customDivider(white),
        customSizedBox(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Balance",
              style: titleStyle.copyWith(color: white, fontSize: 20),
            ),
            Text(
              "50 \$",
              style: titleStyle.copyWith(color: white, fontSize: 20),
            ),
          ],
        ),
        customSizedBox(),
        customButtonGlobal(
            () {}, "Print", Icons.print, Colors.blueAccent, white),
        customButtonGlobal(() {}, "Remove", Icons.remove, Colors.red, white),
        customButtonGlobal(() {}, "Save", Icons.save, Colors.teal, white),
      ],
    );
  }
}
