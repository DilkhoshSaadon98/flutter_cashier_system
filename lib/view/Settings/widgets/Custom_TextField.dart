import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom_TextField extends StatelessWidget {
  //TextEditingController controller;
  String title;
  bool isPassword;

  Custom_TextField(this.title, this.isPassword, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.45.sw,
      height: 0.1.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.w),
            width: 0.25.sw,
            height: 0.065.sh,
            child: TextFormField(
              obscureText: isPassword,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: title,
                labelStyle: titleStyle,
                suffixIcon: isPassword ? const Icon(Icons.visibility) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
