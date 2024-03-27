import 'package:cashier_system/controller/cashier/cashier_controller.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/view/cashier/components/left_side/components/cashier_table_rows.dart';
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
                    "Code",
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
              const CashierTableRows(),
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
