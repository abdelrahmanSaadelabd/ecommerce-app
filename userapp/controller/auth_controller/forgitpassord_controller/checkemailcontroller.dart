import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/data/datasours/remote/authdata/forgitpassord/checkemaildata.dart';

import 'package:untitled1/view/widget/auth/forgetpassword/show_pupup_forgitpassword.dart';

class Checkemailcontroller extends GetxController {
  late TextEditingController email;
  GlobalKey<FormState> keyform = GlobalKey();

  Checkemaildata _logindata = Checkemaildata(Get.find());

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();

    super.onClose();
  }

  List data = [];
  StatusRequst? statusRequst;
  postData(BuildContext context) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _logindata.postdata(email.text);
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        showDialog(
          context: context,

          builder: (_) => ShowPupupForgitpassword(email: email.text),
        );
      } else {
        Get.snackbar("erro", "this email or password is not correct");
      }
    }
    update();
  }
}
