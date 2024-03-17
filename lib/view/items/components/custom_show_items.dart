import 'package:cashier_system/controller/items/items_view_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/view/items/components/custom_items_columns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomShowItems extends StatelessWidget {
  const CustomShowItems({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());
    return Container(
      color: white,
      height: Get.height,
      child: GetBuilder<ItemsViewController>(builder: (controller) {
        return ListView(
          children: [
            DataTable(
              border: TableBorder(
                bottom: BorderSide(width: .5.w, color: thirdColor),
                top: BorderSide(width: .5.w, color: thirdColor),
                right: BorderSide(width: .5.w, color: thirdColor),
                left: BorderSide(width: .5.w, color: thirdColor),
                horizontalInside: BorderSide(width: .5.w, color: thirdColor),
                verticalInside: BorderSide(width: .5.w, color: thirdColor),
              ),
              dataTextStyle: bodyStyle.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
              dividerThickness: .5,
              headingRowColor: const MaterialStatePropertyAll(fourthColor),
              headingTextStyle:
                  titleStyle.copyWith(fontSize: 13.sp, color: secondColor),
              // ignore: deprecated_member_use
              dataRowHeight: 40.h,
              decoration: BoxDecoration(color: secondColor.withOpacity(.08)),
              //!Table Columns:
              columns: customItemsColumns,
              rows: [
                ...List<DataRow>.generate(
                  !controller.isSearch
                      ? controller.data.length
                      : controller.listdataSearch.length,
                  (index) {
                    return DataRow(cells: [
                      DataCell(Text(!controller.isSearch
                          ? controller.data[index].itemsId.toString()
                          : controller.listdataSearch[index].itemsId
                              .toString())),
                      DataCell(Text(!controller.isSearch
                          ? controller.data[index].itemsBarcode.toString()
                          : controller.listdataSearch[index].itemsBarcode
                              .toString())),
                      DataCell(Text(!controller.isSearch
                          ? controller.data[index].itemsName ?? ''
                          : controller.listdataSearch[index].itemsName ?? '')),
                      DataCell(Text(!controller.isSearch
                          ? controller.data[index].itemsCount.toString()
                          : controller.listdataSearch[index].itemsCount
                              .toString())),
                      DataCell(Text(!controller.isSearch
                          ? '${controller.data[index].itemsSellingprice.toString()} IQ'
                          : '${controller.listdataSearch[index].itemsSellingprice.toString()} IQ')),
                      DataCell(Text(!controller.isSearch
                          ? '${controller.data[index].itemsBuingprice.toString()} IQ'
                          : '${controller.listdataSearch[index].itemsBuingprice.toString()} IQ')),
                      DataCell(Text(!controller.isSearch
                          ? '${controller.data[index].itemsCostprice.toString()} IQ'
                          : '${controller.listdataSearch[index].itemsCostprice.toString()} IQ')),
                      DataCell(Text(!controller.isSearch
                          ? controller.data[index].itemsType.toString()
                          : controller.listdataSearch[index].itemsType
                              .toString())),
                      DataCell(Text(!controller.isSearch
                          ? controller.data[index].itemsDesc.toString()
                          : controller.listdataSearch[index].itemsDesc
                              .toString())),
                      DataCell(IconButton(
                        onPressed: () {
                          print("--------------------------");
                          controller.goUpdateItems(controller.data[index]);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: secondColor,
                        ),
                      )),
                    ]);
                  },
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
