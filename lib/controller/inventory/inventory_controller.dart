import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController {
  TextEditingController? catName;
  TextEditingController? catID;

  @override
  void onInit() {
    catID = TextEditingController();
    catName = TextEditingController();
    super.onInit();
  }
}
