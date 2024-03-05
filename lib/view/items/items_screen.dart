import 'package:cashier_system/controller/items/items_controller.dart';
import 'package:cashier_system/core/functions/validinput.dart';
import 'package:cashier_system/core/shared/custom_appbar_title.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:cashier_system/view/categories/components/custom_buttton_items.dart';
import 'package:cashier_system/view/categories/components/custom_text_field.dart';
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
    Get.lazyPut((() => ItemsController()));
    return Scaffold(
      backgroundColor: primaryColor,
      body: GetBuilder<ItemsController>(builder: (controller) {
        return Row(
          children: [
            Expanded(
                flex: 6,
                child: Container(
                    color: thirdColor,
                    child: IndexedStack(
                      index: controller.stackIndex,
                      children: [
                        //! View Catagories:
                        ListView(
                          children: [
                            customAppBarTitle('View Items'),
                            const CustomShowItems()
                          ],
                        ),
                        //! Add Catagories:
                        ListView(
                          children: [
                            customAppBarTitle('Add Items'),
                            const AddItems()
                          ],
                        )
                      ],
                    ))),
            Expanded(
                flex: 2,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  color: primaryColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                              radius: 30,
                              backgroundColor: secondColor,
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.home,
                                    color: primaryColor,
                                    size: 35,
                                  ))),
                        ],
                      ),
                      customSizedBox(25),
                      customButtonItems(
                        () {
                          controller.changeIndex(0);
                        },
                        "View Items",
                        Icons.visibility,
                        Colors.greenAccent,
                        black,
                      ),
                      customButtonItems(
                        () {
                          controller.changeIndex(1);
                        },
                        "Add Items",
                        Icons.add_box_outlined,
                      ),
                      customSizedBox(),
                      CustomTextFormFieldItems(
                        borderColor: white,
                        hinttext: "Search in Catagories . . .",
                        iconData: Icons.search,
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
