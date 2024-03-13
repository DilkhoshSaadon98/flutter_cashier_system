import 'package:cashier_system/core/class/statusrequest.dart';
import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/functions/handing_data_controller.dart';
import 'package:cashier_system/data/model/categories_model.dart';
import 'package:cashier_system/data/source/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatagoriesController extends GetxController {
  int stackIndex = 0;
  changeIndex(int index) {
    stackIndex = index;
    update();
  }

  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];
  List<CategoriesModel> listdataSearch = [];
  late StatusRequest statusRequest;
  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchCategories();
    update();
  }

  //? Get Categories:
  getCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.getCategoriesData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.clear();
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  //? Search Categories
  searchCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.searchCategoriesData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdataSearch.clear();
        List responsedata = response['data'];
        listdataSearch
            .addAll(responsedata.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goUpdate(CategoriesModel catagoriesModel) {
    Get.toNamed(AppRoute.categoriesUpdateScreen,
        arguments: {'categoriesModel': catagoriesModel});
  }

  @override
  void onInit() {
    getCategories();
    search = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    search!.dispose();
    super.dispose();
  }
}
