import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late StatusRequst statusRequst;
  @override
  void onInit() async {
    statusRequst = StatusRequst.none;

    super.onInit();
  }
}
