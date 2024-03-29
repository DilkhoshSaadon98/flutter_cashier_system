import 'package:cashier_system/controller/cashier/cashier_constant_controller.dart';
import 'package:cashier_system/core/class/statusrequest.dart';
import 'package:cashier_system/core/functions/handing_data_controller.dart';
import 'package:cashier_system/core/shared/custom_snack_bar.dart';
import 'package:cashier_system/data/model/cart_model.dart';
import 'package:cashier_system/data/model/items_model.dart';
import 'package:cashier_system/data/source/cashier_data.dart';
import 'package:cashier_system/data/source/items_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashierController extends CashierConstantController {
  void setHoverState(int index, bool isHovered) {
    hoverStates[index] = isHovered;
    update();
  }

  void checkSelectedRows(bool value, int index) {
    if (value == true) {
      selectedRows.add(cartData[index].itemsId.toString());
    } else {
      selectedRows.removeWhere(
          (element) => element == cartData[index].itemsId.toString());
    }
    update();
  }

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
        getCartData(myServices.systemSharedPreferences.getString(
          "cart_number",
        )!);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  //! Get Cart Data:
  getCartData(String id) async {
    statusRequest = StatusRequest.loading;
    update();
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
        cartsNumbers = response["carts_number"];
        cartTotalPrice = response["total_cart_price"]["total_price"];
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
    var response = await cashierData.addItem(
        myServices.systemSharedPreferences.getString(
          "cart_number",
        )!,
        itemsid);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getCartData(myServices.systemSharedPreferences.getString(
          "cart_number",
        )!);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  updateItemByNum(String itemsid, String itemCount) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashierData.addItembyNum(
        myServices.systemSharedPreferences.getString(
          "cart_number",
        )!,
        itemsid,
        itemCount);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getCartData(
            myServices.systemSharedPreferences.getString("cart_number")!);
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
    var response = await cashierData.deleteItem(
        myServices.systemSharedPreferences.getString(
          "cart_number",
        )!,
        itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int cartCount = response['count'];
        List pendedCart = response['pended_carts'];
        if (cartCount > 0) {
          getCartData(myServices.systemSharedPreferences.getString(
            "cart_number",
          )!);
        } else if (cartCount == 0 && pendedCart.isNotEmpty) {
          myServices.sharedPreferences
              .setString("cart_number", pendedCart[0].toString());
          getCartData(myServices.systemSharedPreferences.getString(
            "cart_number",
          )!);
        } else {
          myServices.sharedPreferences.setString("cart_number", "1");
          cartData.clear();
        }
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
    var response = await cashierData
        .delayCart(myServices.sharedPreferences.getString('cart_number')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        customSnackBar(
          "Success",
          "Order Delaied Success",
        );
        myServices.sharedPreferences.setString('cart_number', "1");
        await getCartData(
            myServices.sharedPreferences.getString('cart_number')!);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  //! Discounting Items
  dicountingItems(List<String> itemsId, String discountValue) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashierData.discountingItems(
        myServices.sharedPreferences.getString('cart_number')!,
        itemsId,
        discountValue);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        customSnackBar(
          "Success",
          "Items Discounted Succsss",
        );
        await getCartData(
            myServices.sharedPreferences.getString('cart_number')!);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  //! Percent Discount:
  percentDiscounting(String discountValue) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashierData.percentDiscounting(
        myServices.sharedPreferences.getString('cart_number')!, discountValue);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        customSnackBar(
          "Success",
          "Items Discounted Succsss",
        );
        await getCartData(
            myServices.sharedPreferences.getString('cart_number')!);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  updateItemQuantity(String itemsid, String itemCount) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashierData.addItembyNum(
        myServices.systemSharedPreferences.getString(
          "cart_number",
        )!,
        itemsid,
        itemCount);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getCartData(
            myServices.systemSharedPreferences.getString("cart_number")!);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  cartItemGift(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashierData.cartItemGift(
        myServices.systemSharedPreferences.getString("cart_number")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getCartData(
            myServices.systemSharedPreferences.getString("cart_number")!);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  deleteCartItem(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashierData.deleteCartItem(
        myServices.systemSharedPreferences.getString("cart_number")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getCartData(
            myServices.systemSharedPreferences.getString("cart_number")!);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    // countPendingCart();
    getItems();
    getCartData(myServices.systemSharedPreferences.getString(
      "cart_number",
    )!);
    dropDownName = TextEditingController();
    dropDownID = TextEditingController();
    itemsQuantity = TextEditingController();
    super.onInit();
  }
}
