import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/view/Settings/change_userName_Password/Right_Side.dart';
import 'package:cashier_system/view/Settings/same_widgets/Custom_TextField.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ChangeUsernamePassword extends StatelessWidget {
  const ChangeUsernamePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: Row(
        children: [
          // مساحة العمل
          Container(
            height: double.infinity,
            width: 0.7.sw,
            decoration: BoxDecoration(
              border: Border.all(width: 1.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(20.h),
                  child: Text(
                    "Change Username and Password",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Custom_TextField("Old Username", false),
                Custom_TextField("Old Password", true),
                Custom_TextField("New Username", false),
                Custom_TextField("New Password", true),
                //change button
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w),
                    color: fourthColor,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Text(
                    "Change",
                    style: TextStyle(fontSize: 18.sp, color: white),
                  ),
                ),

                // Request Manager password
                Container(
                  width: 450.w,
                  margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
                  child: Text(
                    "Request Manager password for:",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.h),
                  width: 450.w,
                  height: 0.04.sh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Switch(value: true, onChanged: (val) {}),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.h),
                  width: 450.w,
                  height: 0.04.sh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Setting",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Switch(value: true, onChanged: (val) {}),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.h),
                  width: 450.w,
                  height: 0.04.sh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Show Data",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Switch(value: true, onChanged: (val) {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // قسم الازار
          Right_Side(),
        ],
      ),
    );
  }
}
