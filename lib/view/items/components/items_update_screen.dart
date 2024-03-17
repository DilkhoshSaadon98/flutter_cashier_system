
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/shared/custom_appbar_title.dart';
import 'package:flutter/material.dart';

class ItemsUpdateScreen extends StatelessWidget {
  const ItemsUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: customAppBarTitle("title"),
    );
  }
}
