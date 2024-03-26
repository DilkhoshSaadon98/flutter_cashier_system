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
    return response.fold((l) => l, (r) => r);
  }

  discountingItems(
      String cartNumber, List<String> itemsId, String discountValue) async {
    var response = await crud.postData(AppLink.discountingItems, {
      "cart_number": cartNumber,
      "discount_value": discountValue,
      "items_id": itemsId[0]
    });
    return response.fold((l) => l, (r) => r);
  }

  percentDiscounting(String cartNumber, String discountValue) async {
    var response = await crud.postData(AppLink.percentDiscounting, {
      "cart_number": cartNumber,
      "discount_value": discountValue,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateItemQuantity(
      String cartNumber, String itemsid, String itemCount) async {
    var response = await crud.postData(AppLink.updateItemByNum, {
      "cart_number": cartNumber,
      "items_id": itemsid,
      "item_count": itemCount
    });
    return response.fold((l) => l, (r) => r);
  }

  cartItemGift(String cartNumber, String itemsid) async {
    print(cartNumber);
    print(itemsid);
    var response = await crud.postData(AppLink.cartItemGift, {
      "cart_number": cartNumber,
      "items_id": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
