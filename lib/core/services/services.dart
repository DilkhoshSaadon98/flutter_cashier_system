import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late SharedPreferences systemSharedPreferences;
  Future<MyServices> init() async {
    // WindowOptions windowOptions = const WindowOptions(
    //   size: Size(1600, 700),
    //   center: true,
    //   backgroundColor: Colors.transparent,
    //   skipTaskbar: false,
    //   titleBarStyle: TitleBarStyle.hidden,
    //   fullScreen: false,
    //   windowButtonVisibility: true,
    //   title: "Cashier System"
    // );
    // windowManager.waitUntilReadyToShow(windowOptions, () async {
    //   await windowManager.show();
    //   await windowManager.focus();
    // });
    sharedPreferences = await SharedPreferences.getInstance();
    systemSharedPreferences = await SharedPreferences.getInstance();

    // changeThemeColor(sharedPreferences.getBool('mode')!);

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
