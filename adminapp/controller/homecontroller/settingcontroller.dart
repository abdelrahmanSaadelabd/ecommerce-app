import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:get/get.dart';

class Settingcontroller extends GetxController {
  MyServices _myServices = Get.put(MyServices());
  loguot() {
    _myServices.sharedPreferences.clear();
    Get.offAllNamed("/loginpage");
  }
}
