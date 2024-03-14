import 'package:cashier_system/controller/items/items_view_controller.dart';
import 'package:cashier_system/core/constant/imgaeasset.dart';
import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/functions/validinput.dart';
import 'package:cashier_system/core/shared/custom_appbar_title.dart';
import 'package:cashier_system/core/shared/custom_formfield_global.dart';
import 'package:cashier_system/core/shared/custom_header_screen.dart';
import 'package:cashier_system/core/shared/custom_search_widget.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:cashier_system/core/shared/custom_buttton_global.dart';
import 'package:cashier_system/view/items/components/custom_add_items.dart';
import 'package:cashier_system/view/items/components/custom_show_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
      backgroundColor: primaryColor,
      body: GetBuilder<ItemsController>(builder: (controller) {
        return Row(
          children: [
            Expanded(
                flex: 7,
                child: Container(
                    color: thirdColor, child: const CustomShowItems())),
            Expanded(
                flex: 1,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  color: primaryColor,
                  child: ListView(
                    children: [
                      CustomHeaderScreen(
                        imagePath: AppImageAsset.itemsIcons,
                        root: () {},
                        title: "Items",
                      ),
                      customSizedBox(25),
                      customButtonGlobal(
                        () {
                          Get.offAndToNamed(AppRoute.itemsScreen);
                        },
                        "View Items",
                        Icons.visibility,
                        Colors.greenAccent,
                        black,
                      ),
                      customButtonGlobal(
                        () {
                          Get.offAndToNamed(AppRoute.itemsAddScreen);
                        },
                        "Add Items",
                        Icons.add_box_outlined,
                      ),
                      customSizedBox(),
                      CustomSearchField(
                        borderColor: white,
                        hinttext: "Search in Items . . .",
                        iconData: Icons.search,
                        mycontroller: controller.search,
                        onChanged: (val) {
                          controller.onSearchItems();
                          // controller.checkSearch(val);
                        },
                        isNumber: false,
                        labeltext: "Search",
                        valid: (value) {
                          return validInput(value!, 3, 100, '');
                        },
                      ),
                    ],
                  ),
                )),
          ],
        );
      }),
    );
  }
}
