import 'package:deliveryapp/controller/core/services/myservices.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';

class Settingcontroller extends GetxController {
  MyServices _myServices = Get.put(MyServices());
  loguot() {
    _myServices.sharedPreferences.clear();
    Get.offAllNamed("/loginpage");
  }
}
