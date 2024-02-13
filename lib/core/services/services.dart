
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late SharedPreferences systemSharedPreferences;

  Future<MyServices> init() async {

    sharedPreferences = await SharedPreferences.getInstance();
    systemSharedPreferences = await SharedPreferences.getInstance();

    // changeThemeColor(sharedPreferences.getBool('mode')!);

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
