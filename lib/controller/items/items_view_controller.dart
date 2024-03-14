import 'package:cashier_system/core/class/statusrequest.dart';
import 'package:cashier_system/core/functions/handing_data_controller.dart';
import 'package:cashier_system/data/model/items_model.dart';
import 'package:cashier_system/data/source/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  ScrollController scrollController = ScrollController();
  double? scrollPosition = 0.0;
  ItemsData itemsData = ItemsData(Get.find());
  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  void _scrollListener() {
    scrollPosition = scrollController.position.pixels;
    // You can use scrollPosition to determine the action you want to take
    // For example:
    print(scrollPosition);
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchItems();
    update();
  }

  List<ItemsModel> data = [];
  List<ItemsModel> listdataSearch = [];

  StatusRequest statusRequest = StatusRequest.none;

  getItems() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var response = await itemsData.getItemsData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  searchItems() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.searchItemsData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdataSearch.clear();
        List responsedata = response['data'];
        listdataSearch.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
        print(listdataSearch[0].itemsBarcode);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  // deleteItems(String id, String imageName) {
  //   itemsData.deleteData({'id': id, 'imagename': imageName});
  //   getData();
  //   update();
  // }

  @override
  void onInit() {
    getItems();
    scrollController.addListener(_scrollListener);
    search = TextEditingController();
    super.onInit();
  }

  // goUpdate(ItemsModel itemsModel) {
  //   Get.toNamed(AppRoute., arguments: {'itemsModel': itemsModel});
  // }
}
