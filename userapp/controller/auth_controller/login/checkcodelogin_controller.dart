import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/authdata/forgitpassord/chekcodeslogin_data.dart';

class CheckcodeloginController extends GetxController {
  late TextEditingController code;
  final String email;
  MyServices myServices = Get.find();
  CheckcodeloginController(this.email);

  ChekcodesloginData _chekcodeloginData = ChekcodesloginData(Get.find());

  @override
  void onInit() {
    code = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    code.dispose();

    super.onClose();
  }

  List data = [];
  StatusRequst? statusRequst;
  postData(BuildContext context) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _chekcodeloginData.postdata(email, code.text);
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        Get.snackbar("success", "Your code is correct... you can login now");
        myServices.sharedPreferences.setString(
          "id",
          response['data']["user_id"].toString(),
        );
        myServices.sharedPreferences.setString(
          "email",
          response['data']["user_email"],
        );
        myServices.sharedPreferences.setString(
          "phone",
          response['data']["user_phone"],
        );
        myServices.sharedPreferences.setString(
          "username",
          response['data']["user_name"],
        );
        myServices.sharedPreferences.setString("step", "2");
        Get.offAllNamed("/home");
      } else {
        Get.snackbar("erro", "Your code is not correct");
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  resendcode(BuildContext context) async {
    var response = await _chekcodeloginData.resendcode(email);
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
      } else {
        Get.snackbar("erro", "Your code is not correct");
      }
    }
  }
}
