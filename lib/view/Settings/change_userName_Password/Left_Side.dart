import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Left_Side extends StatefulWidget {
  const Left_Side({super.key});

  @override
  State<Left_Side> createState() => _Left_SideState();
}

class _Left_SideState extends State<Left_Side> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 0.7.sw,
      decoration: BoxDecoration(
        border: Border.all(width: 1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40.h, bottom: 50.h),
            child: Text(
              "Change Username and Password",
              style: TextStyle(
                fontSize: 32.sp,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Old Username",
                style: TextStyle(fontSize: 20.sp),
              ),
              Container(
                margin: EdgeInsets.all(20.w),
                width: 300.w,
                height: 50.h,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your username',
                      suffixIcon: Icon(Icons.visibility)),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(),
            child: const Text('Change'),
          ),
          Container(
            margin: EdgeInsets.only(top: 40.h, bottom: 50.h),
            child: Text(
              "Request Manager password for:",
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 20.sp),
              ),
              Container(
                  //margin: EdgeInsets.only(left: 90.w),
                  child: Switch(value: true, onChanged: (val) {})),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Setting",
                style: TextStyle(fontSize: 20.sp),
              ),
              Container(
                  // margin: EdgeInsets.only(left: 80.w),
                  child: Switch(value: true, onChanged: (val) {})),
            ],
          ),
        ],
      ),
    );
  }
}
