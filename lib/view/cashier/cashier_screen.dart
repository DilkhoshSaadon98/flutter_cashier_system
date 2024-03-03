import 'package:cashier_system/view/cashier/components/left_side/cashier_left_side_screen.dart';
import 'package:cashier_system/view/cashier/components/right_side/cashier_right_side.dart';
import 'package:flutter/material.dart';

class CashierScreen extends StatelessWidget {
  const CashierScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          CashierLeftSideScreen(),
          CashierRightSideScreen(),
        ],
      ),
    );
  }
}
