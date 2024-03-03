import 'package:get/get.dart';

class CatagoriesController extends GetxController {
  int stackIndex = 0;
  changeIndex(int index) {
    stackIndex = index;
    update();
  }
}
