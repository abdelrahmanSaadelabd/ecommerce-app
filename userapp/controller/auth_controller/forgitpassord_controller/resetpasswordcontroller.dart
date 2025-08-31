import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

import 'package:untitled1/controller/data/datasours/remote/authdata/forgitpassord/resetpassworddata.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';

class Resetpasswordcontroller extends GetxController {
  late TextEditingController password;

  Resetpassworddata _checkcodforgetpassorddata = Resetpassworddata(Get.find());

  @override
  void onInit() {
    password = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    password.dispose();

    super.onClose();
  }

  List data = [];
  StatusRequst? statusRequst;
  postData() async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _checkcodforgetpassorddata.postdata(password.text);
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        Get.offAllNamed("/home");
      } else {
        Get.snackbar("erro", "this email or password is not correct");
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }
}
