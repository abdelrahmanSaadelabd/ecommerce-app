import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/data/datasours/remote/authdata/singupdata.dart';

import 'package:untitled1/view/widget/auth/singup/pupup_singup.dart';

class SingupController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late GlobalKey<FormState> formKey = GlobalKey();

  Singupdata _singupdata = Singupdata(Get.find());

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.onClose();
  }

  late String data;
  StatusRequst? statusRequst;
  postData(BuildContext context) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _singupdata.postdata(
      name.text,
      password.text,
      email.text,
      phone.text,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        data = response["data"]["user_email"];
        showDialog(
          context: context,
          builder: (_) => PupupSingup(email: email.text),
        );
      } else {
        Get.snackbar("erro", "this email or phone correct");
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }
}
