import 'package:cashier_system/core/shared/custom_appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarTitle('Home'),
      body: Image.asset("images/customer-support.png"),
    );
  }
}
