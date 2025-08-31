import 'package:deliveryapp/controller/core/class/statesr_requst.dart';
import 'package:deliveryapp/controller/core/functions/handling_data.dart';
import 'package:deliveryapp/controller/core/services/myservices.dart';
import 'package:deliveryapp/controller/data/datasours/remote/authdata/logindata.dart';
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
        data = response["data"]["delivery_email"];
        if (response["data"]["delivery_approve"] == 1) {
          myServices.sharedPreferences.setString(
            "id",
            response['data']["delivery_id"].toString(),
          );
          myServices.sharedPreferences.setString(
            "email",
            response['data']["delivery_email"],
          );
          myServices.sharedPreferences.setString(
            "phone",
            response['data']["delivery_phone"],
          );
          myServices.sharedPreferences.setString(
            "deliveryname",
            response['data']["delivery_name"],
          );
          myServices.sharedPreferences.setString(
            "deliveryimage",
            response['data']["delivery_image"],
          );
          myServices.sharedPreferences.setString("step", "2");
          myServices.sharedPreferences.setString("step", "2");
          String id = myServices.sharedPreferences.getString("id")!;

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
