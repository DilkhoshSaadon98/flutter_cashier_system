import 'package:cashier_system/controller/catagories/catagories_view_controller.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/constant/imgaeasset.dart';
import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/functions/validinput.dart';
import 'package:cashier_system/core/shared/custom_appbar_title.dart';
import 'package:cashier_system/core/shared/custom_header_screen.dart';
import 'package:cashier_system/core/shared/custom_search_widget.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:cashier_system/view/categories/components/add_catagories_widget.dart';
import 'package:cashier_system/core/shared/custom_buttton_items.dart';
import 'package:cashier_system/view/categories/components/view_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

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
                    child: ListView(
                      children: [
                        customAppBarTitle('Add Categories'),
                        AddCatagories()
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
                      CustomHeaderScreen(
                        imagePath: AppImageAsset.itemsIcons,
                        root: () {},
                        title: 'Catagories',
                      ),
                      customSizedBox(25),
                      customButtonGlobal(
                        () {
                          Get.offAndToNamed(AppRoute.catagoriesScreen);
                        },
                        "View Categories",
                        Icons.visibility,
                        Colors.greenAccent,
                        black,
                      ),
                      customButtonGlobal(
                        () {
                          Get.offAndToNamed(AppRoute.categoriesAddScreen);
                        },
                        "Add Categories",
                        Icons.add_box_outlined,
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
