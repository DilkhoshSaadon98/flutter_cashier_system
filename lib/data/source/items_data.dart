import 'dart:io';

import 'package:cashier_system/core/class/crud.dart';
import 'package:cashier_system/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  //! View Items :
  getItemsData() async {
    var response = await crud.postData(AppLink.viewItems, {});
    return response.fold((l) => l, (r) => r);
  }

  //! Insert Items:
  insertItemsData(Map data) async {
    var response =
        await crud.postData(AppLink.insertItems, data);
    return response.fold((l) => l, (r) => r);
  }

  //! Update Items:
  updateItemsData(Map data) async {
    var response = await crud.postData(AppLink.updateItems, data);
    return response.fold((l) => l, (r) => r);
  }

  //! Delete Items:
  deleteItemsData(String id) async {
    var response = await crud.postData(AppLink.deleteItems, {"items_id":id});
    return response.fold((l) => l, (r) => r);
  }

  //! Search Items:
  searchItemsData(String search) async {
    var response = await crud.postData(AppLink.searchItems, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
