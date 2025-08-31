import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/authdata/logindata.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Logincontroller extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formKey = GlobalKey();

  final Logindata _logindata = Logindata(Get.find());
  final MyServices myServices = Get.find();

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();

    super.onClose();
  }

  late String data;
  StatusRequst? statusRequst;
  postData(BuildContext context) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _logindata.postdata(password.text, email.text);

    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        data = response["data"]["admin_email"];
        if (response["data"]["admin_approve"] == 1) {
          myServices.sharedPreferences.setString(
            "id",
            response['data']["admin_id"].toString(),
          );
          myServices.sharedPreferences.setString(
            "email",
            response['data']["admin_email"],
          );
          myServices.sharedPreferences.setString(
            "phone",
            response['data']["admin_phone"],
          );
          myServices.sharedPreferences.setString(
            "adminname",
            response['data']["admin_name"],
          );
          myServices.sharedPreferences.setString(
            "adminimage",
            response['data']["admin_image"],
          );
          myServices.sharedPreferences.setString("step", "2");
          myServices.sharedPreferences.setString("step", "2");

          Get.offAllNamed("/home");
        } else {
          Get.snackbar("Wait", "You will be approved by the admin");
        }
      } else {
        Get.snackbar("erro", "this email or password is not correct");
      }
    }
    update();
  }
}
