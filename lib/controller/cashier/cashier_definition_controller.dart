import 'package:cashier_system/core/class/statusrequest.dart';
import 'package:cashier_system/core/services/services.dart';
import 'package:cashier_system/data/model/cart_model.dart';
import 'package:cashier_system/data/model/items_model.dart';
import 'package:cashier_system/data/source/cashier_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashierDefinitionController extends GetxController {
  //? class to access to functions that sending data request:
  CashierData cashierData = CashierData(Get.find());
  //? class to access to Shared Preference:
  final MyServices myServices = Get.find();
  //? class to check request status:
  StatusRequest statusRequest = StatusRequest.none;
  //? Define Controlller for textformfields:
  TextEditingController? itemsQuantity;
  TextEditingController? dropDownName;
  TextEditingController? dropDownID;
  TextEditingController? catName;
  TextEditingController? catID;
  //? Store drop down data items
  List<SelectedListItem> dropDownList = [];
  //? Data Lists:
  //* Cart Data List
  List<CartModel> cartData = [];
  //* Item Drop Down Search Data List
  List<ItemsModel> listdataSearch = [];
  //* Strore Selected Rows:
  List<String> selectedRows = [];
  //* Store pended Carts:
  List pendedCarts = [];
  //* Store Cart Number That Are pended
  List cartsNumbers = [];
  //* Counting pended Cart
  int pendingCartCount = 0;
  //* Store Cart Total Price
  int cartTotalPrice = 0;
  //* Chaeck Buttons Hover State
  bool isHover = false;
  List<bool> hoverStates = List.filled(16, false);
}
