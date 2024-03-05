import 'package:cashier_system/core/constant/imgaeasset.dart';
import 'package:cashier_system/core/constant/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> homeTitles = [
    "Cashier",
    "Imp/Exp",
    "Inventory",
    "Buying",
    "Catagories",
    "Items",
    "Settings",
  ];
  List<String> homeIcons = [
    AppImageAsset.cashierIcons,
    AppImageAsset.importIcons,
    AppImageAsset.inventoryIcons,
    AppImageAsset.buyingIcons,
    AppImageAsset.itemsIcons,
    AppImageAsset.itemsIcons,
    AppImageAsset.settingIcons,
  ];
  List<void Function()> homeTab = [
    () {
      Get.toNamed(AppRoute.cashierScreen);
    },
    () {},
    () {
      Get.toNamed(AppRoute.inventoryScreen);
    },
    () {},
    () {
      Get.toNamed(AppRoute.catagoriesScreen);
    },
    () {
      Get.toNamed(AppRoute.itemsScreen);
    },
    () {
      Get.toNamed(AppRoute.changeUsernamePassword);
    },
  ];
}
