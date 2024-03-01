import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Custom_TextField extends StatelessWidget {
  //TextEditingController controller;
  String title;
  bool isPassword;

  Custom_TextField(this.title, this.isPassword, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.sp),
        ),
        Container(
          margin: EdgeInsets.all(10.w),
          width: 300.w,
          height: 45.h,
          child: TextFormField(
            obscureText: isPassword,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: title,
              suffixIcon: isPassword ? Icon(Icons.visibility) : null,
            ),
          ),
        ),
      ],
    );
  }
}
