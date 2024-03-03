import 'package:cashier_system/controller/catagories/catagories_controller.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/functions/validinput.dart';
import 'package:cashier_system/core/shared/custom_appbar_title.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:cashier_system/view/categories/components/add_catagories.dart';
import 'package:cashier_system/view/categories/components/custom_buttton_items.dart';
import 'package:cashier_system/view/categories/components/custom_show_catagories.dart';
import 'package:cashier_system/view/categories/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CatagoriesScreen extends StatelessWidget {
  const CatagoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CatagoriesController());
    return Scaffold(
      backgroundColor: primaryColor,
      body: GetBuilder<CatagoriesController>(builder: (controller) {
        return Row(
          children: [
            Expanded(
                flex: 6,
                child: Container(
                    color: thirdColor,
                    child: IndexedStack(
                      index: controller.stackIndex,
                      children: [
                        ListView(
                          children: [
                            customAppBarTitle('View Categories'),
                            const CustomShowCatagories(),
                          ],
                        ),
                        ListView(
                          children: [
                            customAppBarTitle('Add Categories'),
                            AddCatagories()
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                              backgroundColor: secondColor,
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.home,
                                    color: primaryColor,
                                  ))),
                          CircleAvatar(
                              backgroundColor: secondColor,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: primaryColor,
                                  ))),
                        ],
                      ),
                      customSizedBox(25),
                      customButtonItems(
                        () {
                          controller.changeIndex(0);
                        },
                        "View Categories",
                        Icons.visibility,
                        Colors.greenAccent,
                        black,
                      ),
                      customButtonItems(
                        () {
                          controller.changeIndex(1);
                        },
                        "Add Categories",
                        Icons.add_box_outlined,
                      ),
                      customSizedBox(),
                      SizedBox(
                        height: 50,
                        width: Get.width,
                        child: CustomTextFormFieldItems(
                          hinttext: "Search in Catagories . . .",
                          iconData: Icons.search,
                          isNumber: false,
                          labeltext: "Search",
                          valid: (value) {
                            return validInput(value!, 3, 100, '');
                          },
                        ),
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
