import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/view/Settings/Right_Side.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: Row(
        children: [
          Container(
            height: double.infinity,
            width: 0.7.sw,
            decoration: BoxDecoration(
              border: Border.all(width: 1.w),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20.h),
                  child: Text(
                    "Last backup was 12:00AM 15/3/2023",
                    style: TextStyle(
                      fontSize: 35.sp,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.h),
                  width: 0.60.sw,
                  height: 0.04.sh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Automatic backup",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Switch(value: false, onChanged: (val) {}),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.h),
                  width: 0.6.sw,
                  height: 0.1.sh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Time for automatic backup : ",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Container(
                        height: 0.08.sh,
                        width: 0.20.sw,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.h),
                  width: 0.60.sw,
                  height: 0.04.sh,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Save Local BackUp",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Switch(value: true, onChanged: (val) {}),
                    ],
                  ),
                ),
                //button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buttonStyle("BackUp Now", secondColor),
                    SizedBox(width: 20.w),
                    _buttonStyle("Export BackUp", fourthColor),
                    SizedBox(width: 20.w),
                    _buttonStyle("Import BackUp", fourthColor),
                  ],
                )
              ],
            ),
          ),
          RightSideWidget(),
        ],
      ),
    );
  }
}

Widget _buttonStyle(String butName, Color color) {
  return Container(
    margin: EdgeInsets.only(top: 0.02.sh),
    padding: EdgeInsets.symmetric(horizontal: 0.03.sw, vertical: 0.02.sh),
    decoration: BoxDecoration(
      border: Border.all(width: 1.w),
      color: color,
      borderRadius: BorderRadius.circular(8.w),
    ),
    child: Text(
      butName,
      style: TextStyle(fontSize: 18.spMax, color: white),
    ),
  );
}
