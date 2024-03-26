import 'dart:io';
import 'package:cashier_system/controller/catagories/catagories_view_controller.dart';
import 'package:cashier_system/core/class/statusrequest.dart';
import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/functions/handing_data_controller.dart';
import 'package:cashier_system/core/functions/upload_file.dart';
import 'package:cashier_system/core/shared/custom_snack_bar.dart';
import 'package:cashier_system/data/model/categories_model.dart';
import 'package:cashier_system/data/source/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatagoriesEditController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? catagoriesName;

  CategoriesData catagoriesData = CategoriesData(Get.find());
  CategoriesModel? catagoriesModel;
  StatusRequest? statusRequest = StatusRequest.none;

  File? file;
  choseFile() async {
    file = await fileUploadGallery();
    update();
  }

  updateCategories() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      Map data = {
        'id': catagoriesModel!.categoriesId.toString(),
        'name': catagoriesName!.text,
        'imageOld': catagoriesModel!.categoriesImage,
      };
      var response = await catagoriesData.updateCategoriesData(data);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        data.clear();
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.catagoriesScreen);
          CatagoriesController catagoriesController = Get.find();
          catagoriesController.getCategories();
          customSnackBar("Success", "Categories Updated Successfuly", true);
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();
    }
  }

  @override
  void onInit() {
    catagoriesModel = Get.arguments['categoriesModel'];
    catagoriesName = TextEditingController();
    catagoriesName!.text = catagoriesModel!.categoriesName!;
    super.onInit();
  }
}
