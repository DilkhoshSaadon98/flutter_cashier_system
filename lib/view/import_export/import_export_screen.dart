import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/constant/imgaeasset.dart';
import 'package:cashier_system/core/shared/custom_header_screen.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:cashier_system/view/import_export/components/custom_add_impexp_widget.dart';
import 'package:cashier_system/view/import_export/components/custom_search_impexp_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImportExportScreen extends StatelessWidget {
  const ImportExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                color: white,
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: primaryColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: ListView(
                  children: [
                    CustomHeaderScreen(
                        title: 'Imp/Exp',
                        imagePath: AppImageAsset.importIcons,
                        root: () {}),
                    customSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Container(
                            height: 40,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: secondColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Import',
                              style: titleStyle.copyWith(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Export',
                                style: titleStyle,
                              )),
                        ),
                      ],
                    ),
                    customSizedBox(25),
                    Container(
                      width: Get.width,
                      height: 40,
                      decoration: BoxDecoration(
                          color: thirdColor,
                          border: Border.all(width: 1, color: white),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Search',
                            style: titleStyle.copyWith(color: white),
                          ),
                          const Icon(
                            Icons.search,
                            color: white,
                          )
                        ],
                      ),
                    ),
                    customSizedBox(),
                    Container(
                      width: Get.width,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: secondColor),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Add',
                            style: titleStyle.copyWith(color: secondColor),
                          ),
                          const Icon(
                            Icons.add,
                            color: secondColor,
                          )
                        ],
                      ),
                    ),
                    customSizedBox(),
                    const IndexedStack(
                      index: 0,
                      children: [
                        CustomSearchImportExportWidget(),
                        CustomAddImportExportWidget()
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
