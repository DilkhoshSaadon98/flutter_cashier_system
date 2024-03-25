import 'package:cashier_system/core/class/crud.dart';
import 'package:cashier_system/linkapi.dart';

class CashierData {
  Crud crud;
  CashierData(this.crud);
  countPendingCart() async {
    var response = await crud.postData(AppLink.countPendingCart, {});
    return response.fold((l) => l, (r) => r);
  }

  getItems() async {
    var response = await crud.postData(AppLink.getItems, {});
    return response.fold((l) => l, (r) => r);
  }

  getCartData(String id) async {
    var response =
        await crud.postData(AppLink.getCartData, {"cart_number": id});
    return response.fold((l) => l, (r) => r);
  }

  addDataToCart(String itemsId, String cartnumber) async {
    var response = await crud.postData(AppLink.addItemsToCart, {
      'items_id': itemsId,
      'cart_number': cartnumber,
    });
    return response.fold((l) => l, (r) => r);
  }

  addItem(String cartNumber, String itemsid) async {
    var response = await crud.postData(
        AppLink.increaseItem, {"cart_number": cartNumber, "items_id": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  addItembyNum(String cartNumber, String itemsid, String itemCount) async {
    var response = await crud.postData(AppLink.updateItemByNum, {
      "cart_number": cartNumber,
      "items_id": itemsid,
      "item_count": itemCount
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteItem(String cartNumber, String itemsid) async {
    var response = await crud.postData(
        AppLink.decreaseItem, {"cart_number": cartNumber, "items_id": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  delayCart(
    String cartNumber,
  ) async {
    var response =
        await crud.postData(AppLink.delayCart, {"cart_number": cartNumber});
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
