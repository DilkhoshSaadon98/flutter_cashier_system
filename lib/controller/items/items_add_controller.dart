import 'dart:io';

import 'package:cashier_system/controller/catagories/catagories_view_controller.dart';
import 'package:cashier_system/core/class/statusrequest.dart';
import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/functions/handing_data_controller.dart';
import 'package:cashier_system/core/functions/upload_file.dart';
import 'package:cashier_system/data/source/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemsController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? itemsName;

  ItemsData itemsData = ItemsData(Get.find());

  StatusRequest? statusRequest = StatusRequest.none;

  File? file;
  choseFile() async {
    file = await fileUploadGallery();
    update();
  }

  addItems() async {
    if (formState.currentState!.validate()) {
      if (file == null) {
        Get.snackbar('Warning', 'Select Image');
      } else {
        statusRequest = StatusRequest.loading;
        Map data = {
          'name': itemsName!.text,
        };
        var response = await itemsData.insertItemsData(data, file!);

        statusRequest = handlingData(response);

        if (StatusRequest.success == statusRequest) {
          data.clear();
          if (response['status'] == "success") {
            Get.offAllNamed(AppRoute.catagoriesScreen);
            CatagoriesController catagoriesController = Get.find();
            catagoriesController.getCategories();
          } else {
            statusRequest = StatusRequest.failure;
          }
          // End
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    itemsName = TextEditingController();
    super.onInit();
  }
}
