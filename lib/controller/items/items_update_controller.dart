import 'package:cashier_system/data/model/items_model.dart';
import 'package:get/get.dart';

class ItemsUpdateController extends GetxController {
  ItemsModel? itemsModel;

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
    print(itemsModel);
    super.onInit();
  }
}
