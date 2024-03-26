import 'package:cashier_system/controller/items/items_view_controller.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/shared/custom_buttton_global.dart';
import 'package:cashier_system/view/items/components/custom_items_columns.dart';
import 'package:cashier_system/view/items/components/custom_items_rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomShowItems extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomShowItems({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width.sw,
          color: white,
          child: GetBuilder<ItemsViewController>(builder: (controller) {
            return Column(
              children: [
                const Expanded(
                  child: CustomTableHeader(
                    length: 10,
                    data: [
                      "NO.",
                      "Items Barcode",
                      "Items Name",
                      "QTY",
                      "Selling Price",
                      "Buying Price",
                      "Cost Price",
                      "Items Type",
                      "Categories",
                      "Items Explain",
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: SizedBox(
                    height: Get.height,
                    child: ListView.builder(
                        itemCount: !controller.isSearch
                            ? controller.data.length
                            : controller.listdataSearch.length,
                        itemBuilder: (context, index) {
                          var dataItem = !controller.isSearch
                              ? controller.data[index]
                              : controller.listdataSearch[index];
                          bool isHovered = controller.hoverStates[index];

                          return MouseRegion(
                            onEnter: (_) {
                              controller.setHoverState(index, true);
                            },
                            onExit: (_) {
                              controller.setHoverState(index, false);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              height: isHovered ? 100 : 40,
                              alignment: Alignment.topCenter,
                              child: ListView(
                                children: [
                                  CustomItemsTableRows(
                                    color: isHovered ? thirdColor : secondColor,
                                    dataItem: dataItem,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      customButtonGlobal(() {
                                        controller.goUpdateItems(dataItem);
                                      }, 'Edit Item', Icons.edit, Colors.teal,
                                          white, 150, 40),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      customButtonGlobal(() {
                                        controller.deleteItems(
                                            dataItem.itemsId.toString());
                                      }, 'Delete Item', Icons.edit, Colors.red,
                                          white, 150, 40),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
