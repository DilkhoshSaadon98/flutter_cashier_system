import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Right_Side extends StatelessWidget {
  const Right_Side({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 0.3.sw,
      decoration: BoxDecoration(
        border: Border.all(width: 1.w),
      ),
      child: Column(
        children: [
          Container(
            height: 50.h,
            child: Row(
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  child: Image.asset("assets/icons/settings.png"),
                ),
                Icon(
                  Icons.home_sharp,
                  size: 50.h,
                ),
                Icon(
                  Icons.arrow_circle_right,
                  size: 50.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
