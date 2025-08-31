import 'package:get/get.dart';

abstract class ControllerOnboarding extends GetxController {
  changpage(int index);
}

class onbaordingcontrollerimpt extends ControllerOnboarding {
  var currentpage = 0.obs;
  @override
  changpage(int index) {
    currentpage.value = index;
    update();
  }
}
