import 'package:cashier_system/controller/items/items_add_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/functions/validinput.dart';
import 'package:cashier_system/core/shared/custom_buttton_global.dart';
import 'package:cashier_system/core/shared/custom_formfield_global.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:cashier_system/view/items/components/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemsViewController());
    return Container(
        height: Get.height - 50,
        width: Get.width,
        color: white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: GetBuilder<AddItemsViewController>(builder: (controller) {
          return Form(
            key: controller.formState,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 650.h,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width > 1000 ? 2 : 1,
                            childAspectRatio: 5,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20),
                        itemCount: controller.addItemList.length + 1,
                        itemBuilder: (context, index) {
                          return index < 9
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customSizedBox(),
                                    Text(
                                      "${controller.addItemList.keys.elementAt(index)} *",
                                      style: titleStyle.copyWith(
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    customSizedBox(10),
                                    CustomTextFormFieldGlobal(
                                        mycontroller:
                                            controller.controllerList![index],
                                        hinttext: controller.addItemList.keys
                                            .elementAt(index),
                                        labeltext: controller.addItemList.keys
                                            .elementAt(index),
                                        iconData: controller.addItemList.values
                                            .elementAt(index),
                                        borderColor: primaryColor,
                                        valid: (value) {
                                          return validInput(
                                              value!,
                                              0,
                                              500,
                                              index > 2 && index < 7
                                                  ? "number"
                                                  : "");
                                        },
                                        isNumber: false)
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customSizedBox(),
                                    Text(
                                      "Items Categories *",
                                      style: titleStyle.copyWith(
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    customSizedBox(10),
                                    CustomDropDownSearch(
                                        title: 'Choose Catagories',
                                        listData: controller.dropDownList,
                                        contrllerName: controller.catName!,
                                        contrllerId: controller.catID!),
                                  ],
                                );
                        }),
                  ),
                  customButtonGlobal(() {
                    controller.addItems();
                  }, "Add Items", Icons.add, primaryColor, white)
                ],
              ),
            ),
          );
        }));
  }
}
