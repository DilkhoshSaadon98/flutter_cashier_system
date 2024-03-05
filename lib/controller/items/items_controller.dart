import 'package:get/get.dart';

class ItemsController extends GetxController {
  int stackIndex = 0;
  changeIndex(int index) {
    stackIndex = index;
    update();
  }
}
