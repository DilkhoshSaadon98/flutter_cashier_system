import 'package:cashier_system/controller/cashier/cashier_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/functions/formating_numbers.dart';
import 'package:cashier_system/view/cashier/components/left_side/components/custom_pending_cart.dart';
import 'package:cashier_system/view/cashier/components/left_side/components/search_box_widget.dart';
import 'package:cashier_system/view/items/components/custom_items_columns.dart';
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
                    //? Show Pending Cart
                    controller.pendedCarts.isNotEmpty
                        ? const CustomPendingCarts()
                        : Container(),
                    //? Search Box
                    const SearchBoxWidget()
                  ],
                ),
              )),
              Expanded(
                  flex: 6,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: white,
                    ),
                    alignment: Alignment.topCenter,
                    child: ListView(
                      children: [
                        const CustomTableHeader(
                          length: 8,
                          columnWidth: [
                            50,
                            75,
                            175,
                            100,
                            125,
                            100,
                            150,
                            150,
                          ],
                          data: [
                            "Select",
                            "Code",
                            "Items Name",
                            "Items Type",
                            "Items Price",
                            "Stack",
                            "Total Price",
                            "Quantity",
                          ],
                        ),
                        SizedBox(
                          height: Get.height - 50,
                          child: ListView.builder(
                              itemCount: controller.cartData.length,
                              itemBuilder: (context, index) {
                                var dataItem = controller.cartData[index];
                                return Container(
                                  height: 40,
                                  alignment: Alignment.topCenter,
                                  color: white,
                                  child: ListView(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: secondColor.withOpacity(0.08),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 50.w,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: .3,
                                                      color: primaryColor)),
                                              child: Checkbox(
                                                value: controller.selectedRows
                                                    .contains(controller
                                                        .cartData[index].itemsId
                                                        .toString()),
                                                onChanged: (value) {
                                                  controller.checkSelectedRows(
                                                      value!, index);
                                                  print(
                                                      controller.selectedRows);
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 75.w,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: .3,
                                                      color: primaryColor)),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                "${int.parse(dataItem.itemsId.toString()) + 1000}",
                                                style: bodyStyle,
                                              ),
                                            ),
                                            Container(
                                              width: 175.w,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: .3,
                                                      color: primaryColor)),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                dataItem.itemsName.toString(),
                                                style: bodyStyle,
                                              ),
                                            ),
                                            Container(
                                                width: 100.w,
                                                height: 40,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: .3,
                                                        color: primaryColor)),
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  dataItem.itemsType.toString(),
                                                  style: bodyStyle,
                                                )),
                                            Container(
                                                width: 125.w,
                                                height: 40,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: .3,
                                                        color: primaryColor)),
                                                child: Text(
                                                    textAlign: TextAlign.center,
                                                    formattingNumbers(int.parse(
                                                        dataItem
                                                            .itemsSellingprice
                                                            .toString())))),
                                            Container(
                                                width: 100.w,
                                                height: 40,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: .3,
                                                        color: primaryColor)),
                                                child: Text(
                                                    textAlign: TextAlign.center,
                                                    dataItem.itemsCount
                                                        .toString())),
                                            Container(
                                              width: 150,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: .3,
                                                      color: primaryColor)),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                formattingNumbers(controller
                                                        .cartData[index]
                                                        .cartItemsCount! *
                                                    int.parse(controller
                                                        .cartData[index]
                                                        .itemsSellingprice
                                                        .toString())),
                                                style: bodyStyle,
                                              ),
                                            ),
                                            Container(
                                              width: 150.w,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: .3,
                                                      color: primaryColor)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .cartItemDecrease(
                                                                controller
                                                                    .cartData[
                                                                        index]
                                                                    .itemsId
                                                                    .toString());
                                                      },
                                                      icon: const Icon(
                                                        Icons.remove,
                                                        color: Colors.red,
                                                      )),
                                                  Container(
                                                    width: 50,
                                                    height: 40,
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: TextFormField(
                                                      onChanged: (value) {
                                                        controller
                                                            .updateItemByNum(
                                                                controller
                                                                    .cartData[
                                                                        index]
                                                                    .itemsId
                                                                    .toString(),
                                                                value);
                                                      },
                                                      cursorOpacityAnimates:
                                                          true,
                                                      textAlign: TextAlign
                                                          .center, // Align text to the center
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 10),
                                                        hintText: controller
                                                            .cartData[index]
                                                            .cartItemsCount
                                                            .toString(),
                                                        hintStyle:
                                                            titleStyle.copyWith(
                                                                fontSize: 20),
                                                        border: InputBorder
                                                            .none, // Remove border to make circle visible
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .cartItemIncrease(
                                                                controller
                                                                    .cartData[
                                                                        index]
                                                                    .itemsId
                                                                    .toString());
                                                      },
                                                      icon: const Icon(
                                                        Icons.add,
                                                        color: Colors.green,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
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
