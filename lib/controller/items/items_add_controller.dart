import 'dart:io';
import 'package:cashier_system/controller/items/items_view_controller.dart';
import 'package:cashier_system/core/class/statusrequest.dart';
import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/functions/handing_data_controller.dart';
import 'package:cashier_system/core/functions/upload_file.dart';
import 'package:cashier_system/data/model/categories_model.dart';
import 'package:cashier_system/data/source/categories_data.dart';
import 'package:cashier_system/data/source/items_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemsViewController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? itemsName;
  TextEditingController? itemsDesc;
  TextEditingController? itemsCount;
  TextEditingController? itemsSellingPrice;
  TextEditingController? itemsBuyingPrice;
  TextEditingController? itemsWholeSalePrice;
  TextEditingController? itemsCostPrice;
  TextEditingController? itemsType;
  TextEditingController? itemsBarcode;
  TextEditingController? dropDownNameCategories;
  TextEditingController? dropDownIDCategories;
  TextEditingController? catName;
  TextEditingController? catID;
  String? catId;
  List<SelectedListItem> dropDownList = [];
  Map<String, IconData> addItemList = {
    "Items Name": Icons.edit_document,
    "Items Explain": Icons.description_outlined,
    "Items Count": Icons.numbers_outlined,
    "Items Selling Price": Icons.attach_money_sharp,
    "Items Buying Price": Icons.attach_money_sharp,
    "Items Wholesale Price": Icons.attach_money_sharp,
    "Items Cost Price": Icons.attach_money_sharp,
    "Items Brcode": Icons.barcode_reader,
    "Items Type": Icons.type_specimen_outlined,
  };
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest? statusRequest = StatusRequest.none;

  File? file;
  choseFile() async {
    file = await fileUploadGallery();
    update();
  }

  //? Get Categories:
  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    List<CategoriesModel> data = [];
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.getCategoriesData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.clear();
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropDownList.add(SelectedListItem(
              name: data[i].categoriesName!,
              value: data[i].categoriesId!.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addItems() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        'items_name': itemsName!.text,
        'items_desc': itemsDesc!.text,
        'items_count': itemsCount!.text,
        'items_selling_price': itemsSellingPrice!.text,
        'items_buying_price': itemsBuyingPrice!.text,
        'items_wholesale_price': itemsWholeSalePrice!.text,
        'items_cost_price': itemsCostPrice!.text,
        'items_barcode': itemsBarcode!.text,
        'items_type': itemsType!.text,
        'items_cat': catID!.text,
      };
      var response = await itemsData.insertItemsData(data);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.itemsScreen);
          ItemsViewController temsViewController = Get.find();
          temsViewController.getItems();
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();
    }
  }

  List<TextEditingController?>? controllerList;
  @override
  void onInit() {
    itemsName = TextEditingController();
    itemsDesc = TextEditingController();
    itemsCount = TextEditingController();
    itemsSellingPrice = TextEditingController();
    itemsBuyingPrice = TextEditingController();
    itemsCostPrice = TextEditingController();
    itemsWholeSalePrice = TextEditingController();
    itemsType = TextEditingController();
    itemsBarcode = TextEditingController();
    dropDownNameCategories = TextEditingController();
    dropDownIDCategories = TextEditingController();
    catID = TextEditingController();
    catName = TextEditingController();
    controllerList = [
      itemsName,
      itemsDesc,
      itemsCount,
      itemsSellingPrice,
      itemsBuyingPrice,
      itemsWholeSalePrice,
      itemsCostPrice,
      itemsBarcode,
      itemsType,
    ];
    getCategories();
    super.onInit();
  }

  @override
  void dispose() {
    itemsName!.dispose();
    itemsDesc!.dispose();
    itemsCount!.dispose();
    itemsSellingPrice!.dispose();
    itemsBuyingPrice!.dispose();
    itemsWholeSalePrice!.dispose();
    itemsCostPrice!.dispose();
    itemsType!.dispose();
    itemsBarcode!.dispose();
    dropDownNameCategories!.dispose();
    dropDownIDCategories!.dispose();
    catID!.dispose();
    catName!.dispose();
    super.dispose();
  }
}
