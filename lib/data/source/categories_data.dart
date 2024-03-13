import 'dart:io';

import 'package:cashier_system/core/class/crud.dart';
import 'package:cashier_system/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  //! View Categories :
  getCategoriesData() async {
    var response = await crud.postData(AppLink.viewCategories, {});
    return response.fold((l) => l, (r) => r);
  }

  //! Insert Categories:
  insertCategoriesData(Map data, File file) async {
    var response =
        await crud.addRequestWithOneImage(AppLink.insertCategories, data, file);
    return response.fold((l) => l, (r) => r);
  }

  //! Update Categories:
  updateCategoriesData(Map data, [File? file]) async {
    var response = await crud.postData(AppLink.updateCategories, data);
    return response.fold((l) => l, (r) => r);
  }

  //! Delete Categories:
  deleteCategoriesData() async {
    var response = await crud.postData(AppLink.deleteCategories, {});
    return response.fold((l) => l, (r) => r);
  }

  //! Search Categories:
  searchCategoriesData(String search) async {
    var response = await crud.postData(AppLink.searchCategories, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
