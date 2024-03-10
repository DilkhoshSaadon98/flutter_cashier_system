import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CashierLeftSideScreen extends StatelessWidget {
  const CashierLeftSideScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  border: Border.all(color: white),
                                  borderRadius: BorderRadius.circular(10.r)),
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              width: 50.w,
                              alignment: Alignment.center,
                              child: Text(
                                "${index + 1}",
                                style: titleStyle.copyWith(
                                    color: white, fontSize: 30.sp),
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
                    dataRowColor:
                        MaterialStatePropertyAll(white.withOpacity(.08)),
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
                        color: white),
                    dividerThickness: 1,
                    headingRowColor: const MaterialStatePropertyAll(thirdColor),
                    headingTextStyle: titleStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: white),
                    dataRowHeight: 100.h,
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
                    rows: [],
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
  }
}
