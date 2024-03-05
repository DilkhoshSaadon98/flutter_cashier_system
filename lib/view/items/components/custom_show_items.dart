import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomShowItems extends StatelessWidget {
  const CustomShowItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      height: Get.height,
      // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: DataTable(
          dataRowColor: MaterialStatePropertyAll(secondColor.withOpacity(.08)),
          border: TableBorder(
              bottom: BorderSide(width: .5.w, color: secondColor),
              top: BorderSide(width: .5.w, color: secondColor),
              right: BorderSide(width: .5.w, color: secondColor),
              left: BorderSide(width: .5.w, color: secondColor),
              horizontalInside: BorderSide(width: .5.w, color: secondColor),
              borderRadius: BorderRadius.circular(15.r)),
          dataTextStyle: bodyStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          dividerThickness: 1,
          headingRowColor: const MaterialStatePropertyAll(fourthColor),
          headingTextStyle: titleStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold, color: secondColor),
          dataRowHeight: 100.h,
          columns: const [
            DataColumn(label: Text('NO.')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Price')),
            DataColumn(label: Text('Amount')),
            DataColumn(label: Text('Image')),
            DataColumn(label: Text('Active')),
            DataColumn(label: Text('Discount')),
            DataColumn(label: Text('Categories')),
            DataColumn(
                label: Text(
              'Actions',
            )),
          ],
          rows: []),
    );
  }
}
