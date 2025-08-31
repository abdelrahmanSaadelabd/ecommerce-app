import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/notification/notificationdata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Pushnatificationcontroller extends GetxController {
  late TextEditingController email;
  late TextEditingController title;
  late TextEditingController body;
  Notificationdata _Notificationdata = Notificationdata(Get.find());
  MyServices myServices = Get.find();
  List data = [];
  StatusRequst statusRequst = StatusRequst.none;
  @override
  void onInit() {
    email = TextEditingController();
    title = TextEditingController();
    body = TextEditingController();
    super.onInit();
  }

  pushnatification() async {
    statusRequst = StatusRequst.loading;
    var response = await _Notificationdata.pushnatification(
      email.text,
      title.text,
      body.text,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
      } else {
        Get.snackbar("Erro", "try agin");
      }
    }
    update();
  }
}
