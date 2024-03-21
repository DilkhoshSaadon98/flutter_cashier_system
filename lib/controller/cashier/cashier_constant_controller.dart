import 'package:cashier_system/controller/cashier/cashier_controller.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashierConstantController extends GetxController {
  bool isHover = false;
  Color continerColor = thirdColor;
  List<bool> hoverStates = List.filled(16, false);

  void setHoverState(int index, bool isHovered) {
    hoverStates[index] = isHovered;
    update();
  }

  Map<String, IconData> buttonMap = {
    "Print": Icons.print_outlined,
    "Delay": Icons.pause_outlined,
    "Discount": Icons.discount_outlined,
    "Percent": Icons.percent_outlined,
    "QTY": Icons.layers_outlined,
    "Gift": Icons.card_giftcard_sharp,
    "Dollar/Dinar": Icons.monetization_on_outlined,
    "Cash": Icons.monetization_on_outlined,
    "Delete Item": Icons.delete_outline_outlined,
    "New Bill": Icons.description_outlined,
    "Price": Icons.price_change_outlined,
    "Dept": Icons.money_off,
    "Import": Icons.import_export_outlined,
    "Cash/Dept": Icons.attach_money_sharp,
    "Name": Icons.person_3_outlined,
    "Cash Back/Cash": Icons.money,
  };
//! Side Button Functions:
  void cashierPrintFunction() {
    print('cashierPrintFunction');
  }

  void cashierDelayFunction() {
    CashierController cashierController = Get.put(CashierController());
    cashierController.delayCart();
  }

  void cashierDiscountFunction() {
    print('cashierDiscountFunction');
  }

  void cashierPercentFunction() {
    print('cashierPercentFunction');
  }

  void cashierQTYFunction() {
    print('cashierQTYFunction');
  }

  void cashierGiftFunction() {
    print('cashierGiftFunction');
  }

  void cashierDollarDinarFunction() {
    print('cashierDollarDinarFunction');
  }

  void cashierCashFunction() {
    print('cashierCashFunction');
  }

  void cashierDeleteItemFunction() {
    print('cashierDeleteItemFunction');
  }

  void cashierNewBillFunction() {
    print('cashierNewBillFunction');
  }

  void cashierPriceFunction() {
    print('cashierPriceFunction');
  }

  void cashierDeptFunction() {
    print('cashierDeptFunction');
  }

  void cashierImportFunction() {
    print('cashierImportFunction');
  }

  void cashierCashDeptFunction() {
    print('cashierCashDeptFunction');
  }

  void cashierNameFunction() {
    print('cashierNameFunction');
  }

  void cashierCashBackCashFunction() {
    print('cashierCashBackCashFunction');
  }

  List<Function()> cashierFunctions = [];

  @override
  void onInit() {
    cashierFunctions = [
      () => cashierPrintFunction(),
      () => cashierDelayFunction(),
      () => cashierDiscountFunction(),
      () => cashierPercentFunction(),
      () => cashierQTYFunction(),
      () => cashierGiftFunction(),
      () => cashierDollarDinarFunction(),
      () => cashierCashFunction(),
      () => cashierDeleteItemFunction(),
      () => cashierNewBillFunction(),
      () => cashierPriceFunction(),
      () => cashierDeptFunction(),
      () => cashierImportFunction(),
      () => cashierCashDeptFunction(),
      () => cashierNameFunction(),
      () => cashierCashBackCashFunction(),
    ];
    super.onInit();
  }
}
