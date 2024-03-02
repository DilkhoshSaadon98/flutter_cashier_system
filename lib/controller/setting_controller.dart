import 'package:cashier_system/core/constant/routes.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  List<String> settingTabName = [
    "Security",
    "Back Up",
    "Update",
    "Invoice",
    "Name Cart",
  ];
  int currentTab = 0;

  List<void Function()> settingOnTab = [
    () {
      Get.toNamed(AppRoute.changeUsernamePassword);
    },
    () {
      Get.toNamed(AppRoute.backUpScreen);
    },
    () {
      Get.toNamed(AppRoute.updateScreen);
    },
    () {},
    () {},
    () {},
  ];
}
