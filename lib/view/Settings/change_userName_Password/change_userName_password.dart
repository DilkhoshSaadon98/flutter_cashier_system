import 'package:cashier_system/view/Settings/change_userName_Password/Left_Side.dart';
import 'package:cashier_system/view/Settings/change_userName_Password/Right_Side.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeUsernamePassword extends StatelessWidget {
  const ChangeUsernamePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          // مساحة العمل
          Left_Side(),
          // قسم الازار
          Right_Side(),
        ],
      ),
    );
  }
}
