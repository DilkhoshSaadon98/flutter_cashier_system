import 'package:cashier_system/controller/inventory/inventory_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/shared/custom_divider.dart';
import 'package:cashier_system/core/shared/custom_drop_down_search.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/shared/custom_sized_box.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InventoryController());
    return Scaffold(
      body: GetBuilder<InventoryController>(builder: (controller) {
        return Row(
          children: [
            Expanded(
                flex: 6,
                child: Container(
                  width: Get.width,
                  alignment: Alignment.topCenter,
                  color: white,
                  child: DataTable(
                      columnSpacing: 168,
                      dataRowColor: MaterialStatePropertyAll(
                          secondColor.withOpacity(.08)),
                      border: TableBorder(
                          bottom: BorderSide(width: .5.w, color: secondColor),
                          top: BorderSide(width: .5.w, color: secondColor),
                          right: BorderSide(width: .5.w, color: secondColor),
                          left: BorderSide(width: .5.w, color: secondColor),
                          horizontalInside:
                              BorderSide(width: .5.w, color: secondColor),
                          borderRadius: BorderRadius.circular(15.r)),
                      dataTextStyle: bodyStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      dividerThickness: 1,
                      headingRowColor:
                          const MaterialStatePropertyAll(fourthColor),
                      headingTextStyle: titleStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: secondColor),
                      dataRowHeight: 100.h,
                      columns: const [
                        DataColumn(
                            label: Flexible(child: Text('Invoice Number'))),
                        DataColumn(label: Flexible(child: Text('Date'))),
                        DataColumn(
                            label: Flexible(child: Text('Total of Bill'))),
                        DataColumn(
                            label: Flexible(child: Text('Cost of Bill'))),
                        DataColumn(label: Flexible(child: Text('Profit'))),
                      ],
                      rows: []),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  color: primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      CustomDropDownSearch(
                        title: "From",
                        // contrllerId: controller.catID!,
                        // contrllerName: controller.catName!,
                        listData: [
                          SelectedListItem(name: "From1", value: "From1"),
                          SelectedListItem(name: "From2", value: "From2"),
                          SelectedListItem(name: "From3", value: "From3"),
                        ],
                        iconData: Icons.layers,
                      ),
                      customSizedBox(25),
                      Text(
                        "Invoice Number:",
                        style: titleStyle.copyWith(color: white, fontSize: 16),
                      ),
                      customSizedBox(),
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
                      customSizedBox(),
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
                      customDivider(),
                      customDivider(white),
                      customSizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total",
                            style:
                                titleStyle.copyWith(color: white, fontSize: 20),
                          ),
                          Text(
                            "2210 \$",
                            style:
                                titleStyle.copyWith(color: white, fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        );
      }),
    );
  }
}
