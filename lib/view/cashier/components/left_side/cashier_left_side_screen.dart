import 'package:cashier_system/controller/cashier/cashier_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/functions/formating_numbers.dart';
import 'package:cashier_system/view/cashier/components/left_side/components/custom_pending_cart.dart';
import 'package:cashier_system/view/cashier/components/left_side/components/search_box_widget.dart';
import 'package:cashier_system/view/items/components/custom_items_columns.dart';
import 'package:flutter/material.dart';
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
                  flex: 2,
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
              const Expanded(
                flex: 1,
                child: CustomTableHeader(
                  length: 9,
                  data: [
                    "Select",
                    "Item Code",
                    "Items Name",
                    "Items Type",
                    "Items Price",
                    "Discount Price ",
                    "Stack",
                    "Total Price",
                    "Quantity",
                  ],
                ),
              ),
              Expanded(
                  flex: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: white,
                    ),
                    alignment: Alignment.topCenter,
                    child: SizedBox(
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
                                        Expanded(
                                          flex: 2,
                                          child: Container(
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
                                                print(controller.selectedRows);
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: .3,
                                                    color: primaryColor)),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "${int.parse(dataItem.itemsId.toString()) + 1000}",
                                              style: titleStyle,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            height: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: .3,
                                                    color: primaryColor)),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              dataItem.itemsName.toString(),
                                              style: titleStyle,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: .3,
                                                      color: primaryColor)),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                dataItem.itemsType.toString(),
                                                style: titleStyle,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: .3,
                                                      color: primaryColor)),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                formattingNumbers(int.parse(
                                                    dataItem.itemsSellingprice
                                                        .toString())),
                                                style: titleStyle,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: .3,
                                                      color: primaryColor)),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                formattingNumbers(
                                                    (dataItem.cartItemDiscount! /
                                                            100) *
                                                        int.parse(dataItem
                                                            .itemsSellingprice
                                                            .toString())),
                                                style: titleStyle,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: .3,
                                                      color: primaryColor)),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                dataItem.itemsCount.toString(),
                                                style: titleStyle,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
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
                                              style: titleStyle,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
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
                                                Expanded(
                                                  child: IconButton(
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
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: TextFormField(
                                                      onFieldSubmitted:
                                                          (value) {
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
                                                      style:
                                                          titleStyle.copyWith(
                                                              fontSize: 20),
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
                                                ),
                                                Expanded(
                                                  child: IconButton(
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Container(),
                // child: Container(
                //   color: primaryColor,
                //   child: GridView.builder(
                //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 3,
                //           mainAxisSpacing: 10,
                //           childAspectRatio: .8,
                //           crossAxisSpacing: 10),
                //       itemCount: 6,
                //       itemBuilder: (context, index) {
                //         return Expanded(
                //           child: Container(
                //             color: thirdColor,
                //             child: Row(
                //               children: [

                //               ],
                //             ),
                //           ),
                //         );
                //       }),
                // )
              ),
            ],
          ),
        ),
      );
    });
  }
}
