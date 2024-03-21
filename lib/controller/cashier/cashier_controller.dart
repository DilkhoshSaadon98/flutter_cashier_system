import 'package:cashier_system/controller/cashier/cashier_constant_controller.dart';
import 'package:cashier_system/core/class/statusrequest.dart';
import 'package:cashier_system/core/functions/handing_data_controller.dart';
import 'package:cashier_system/data/model/cart_model.dart';
import 'package:cashier_system/data/model/items_model.dart';
import 'package:cashier_system/data/source/cashier_data.dart';
import 'package:cashier_system/data/source/items_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashierController extends CashierConstantController {
  CashierData cashierData = CashierData(Get.find());
  TextEditingController? dropDownName;
  TextEditingController? dropDownID;
  TextEditingController? catName;
  TextEditingController? catID;
  List<SelectedListItem> dropDownList = [];
  //? Data Lists:
  List<CartModel> cartData = [];
  List<ItemsModel> listdataSearch = [];
  int pendingCartCount = 0;
  List pendedCarts = [];
  StatusRequest statusRequest = StatusRequest.none;
  //! Count Pending Order:
  // countPendingCart() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await cashierData.countPendingCart();
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       pendingCartData = 0;
  //       List dataList = response['data'];
  //       pendingCartData = dataList[0]['pending_cart_count'];
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  //   update();
  // }

//! Get Items For Search;
  getItems() async {
    ItemsData itemsData = ItemsData(Get.find());
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getItemsData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdataSearch.clear();
        List responsedata = response['data'];
        listdataSearch.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
        for (int i = 0; i < listdataSearch.length; i++) {
          dropDownList.add(SelectedListItem(
              name: listdataSearch[i].itemsName!,
              value: listdataSearch[i].itemsId!.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  //! Add Items To Cart:
  addItemsToCart(String id, String cartNo) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashierData.addDataToCart(id, cartNo);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getCartData("1");
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  //! Get Cart Data:
  getCartData(String id) async {
    CashierData cashierData = CashierData(Get.find());
    statusRequest = StatusRequest.loading;
    var response = await cashierData.getCartData(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        cartData.clear();
        List responsedata = response['datacart']["data"];
        cartData.addAll(responsedata.map((e) => CartModel.fromJson(e)));
        pendingCartCount = response['total_pending_cart']["pending_cart"];
        pendedCarts = response["pended_carts"];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

//! Item Increase
  cartItemIncrease(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashierData.addItem("1", itemsid);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getCartData("1");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  //! Item Decrease:
  cartItemDecrease(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashierData.deleteItem("1", itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getCartData("1");
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  //! Cart Delay:
  delayCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashierData.delayCart("1");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    // countPendingCart();
    getItems();
    getCartData("1");
    dropDownName = TextEditingController();
    dropDownID = TextEditingController();
    super.onInit();
  }
}
