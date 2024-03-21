import 'package:cashier_system/controller/cashier/cashier_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/functions/formating_numbers.dart';
import 'package:cashier_system/view/cashier/components/left_side/components/cashier_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CashierLeftSideScreen extends StatelessWidget {
  const CashierLeftSideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CashierController());
    return GetBuilder<CashierController>(builder: (controller) {
      return Expanded(
        flex: 5,
        child: Container(
          height: Get.height,
          color: primaryColor,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        margin: EdgeInsets.symmetric(horizontal: 15.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        decoration: BoxDecoration(
                            color: thirdColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: ListView.builder(
                            itemCount: controller.pendingCartCount,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.getCartData(controller.pendedCarts[index].toString());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      border: Border.all(color: white),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  width: 50.w,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${index + 1}",
                                    style: titleStyle.copyWith(
                                        color: white, fontSize: 30.sp),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: thirdColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: CashierDropDownSearch(
                        title: "Search Items",
                        contrllerId: controller.dropDownID!,
                        contrllerName: controller.dropDownName!,
                        listData: controller.dropDownList,
                        iconData: Icons.search,
                      ),
                    ))
                  ],
                ),
              )),
              Expanded(
                  flex: 6,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: white,
                    ),
                    child: DataTable(
                      dataRowColor: MaterialStatePropertyAll(
                          secondColor.withOpacity(.08)),
                      border: TableBorder(
                          bottom: const BorderSide(color: white),
                          top: const BorderSide(color: white),
                          left: const BorderSide(color: white),
                          right: const BorderSide(color: white),
                          horizontalInside:
                              const BorderSide(width: 1, color: white),
                          verticalInside:
                              const BorderSide(width: 1, color: white),
                          borderRadius: BorderRadius.circular(5.r)),
                      dataTextStyle: bodyStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w200,
                          color: primaryColor),
                      dividerThickness: 1,
                      headingRowColor:
                          const MaterialStatePropertyAll(thirdColor),
                      headingTextStyle: titleStyle.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: white),
                      // ignore: deprecated_member_use
                      dataRowHeight: 40.h,
                      columns: [
                        DataColumn(
                            label: Container(
                                alignment: Alignment.center,
                                width: Get.width > 500 ? 95.w : 20.w,
                                child: Text(
                                  'Code',
                                  style: bodyStyle.copyWith(color: white),
                                ))),
                        DataColumn(
                            label: Container(
                                alignment: Alignment.center,
                                width: Get.width > 500 ? 95.w : 20.w,
                                child: Text(
                                  'Item Name',
                                  style: bodyStyle.copyWith(color: white),
                                ))),
                        DataColumn(
                            label: Container(
                                alignment: Alignment.center,
                                width: Get.width > 500 ? 95.w : 20.w,
                                child: Text(
                                  'Type',
                                  style: bodyStyle.copyWith(color: white),
                                ))),
                        DataColumn(
                            label: Container(
                                alignment: Alignment.center,
                                width: Get.width > 500 ? 95.w : 20.w,
                                child: Text(
                                  'Price',
                                  style: bodyStyle.copyWith(color: white),
                                ))),
                        DataColumn(
                            label: Container(
                                alignment: Alignment.center,
                                width: Get.width > 500 ? 95.w : 20.w,
                                child: Text(
                                  'Stack',
                                  style: bodyStyle.copyWith(color: white),
                                ))),
                        DataColumn(
                            label: Container(
                                alignment: Alignment.center,
                                width: Get.width > 500 ? 95.w : 20.w,
                                child: Text(
                                  'Total',
                                  style: bodyStyle.copyWith(color: white),
                                ))),
                        DataColumn(
                            label: Container(
                                alignment: Alignment.center,
                                width: Get.width > 600 ? 95.w : 20.w,
                                child: Text(
                                  'Quantity',
                                  style: bodyStyle.copyWith(color: white),
                                ))),
                      ],
                      rows: List.generate(
                          controller.cartData.length,
                          (index) => DataRow(cells: [
                                DataCell(Text(
                                    "${int.parse(controller.cartData[index].cartId.toString()) + 1000}")),
                                DataCell(Text(controller
                                    .cartData[index].itemsName
                                    .toString())),
                                DataCell(Text(controller
                                    .cartData[index].itemsType
                                    .toString())),
                                DataCell(Text(formattingNumbers(int.parse(
                                    controller.cartData[index].itemsPrice
                                        .toString())))),
                                DataCell(Text(controller
                                    .cartData[index].countItems
                                    .toString())),
                                DataCell(Text(formattingNumbers(int.parse(
                                        controller.cartData[index].countItems
                                            .toString()) *
                                    int.parse(controller
                                        .cartData[index].itemsPrice
                                        .toString())))),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          controller.cartItemDecrease(controller
                                              .cartData[index].itemsId
                                              .toString());
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.red,
                                        )),
                                    Text(
                                      controller.cartData[index].countItems
                                          .toString(),
                                      style: titleStyle.copyWith(fontSize: 16),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          controller.cartItemIncrease(controller
                                              .cartData[index].itemsId
                                              .toString());
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.green,
                                        )),
                                  ],
                                )),
                              ])),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: primaryColor,
                  )),
            ],
          ),
        ),
      );
    });
  }
}
