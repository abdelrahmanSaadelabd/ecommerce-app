import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/authdata/logindata.dart';
import 'package:untitled1/view/widget/auth/login/pupup_login.dart';

class Logincontroller extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formKey = GlobalKey();

  final Logindata _logindata = Logindata(Get.find());
  MyServices myServices = Get.find();

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
        data = response["data"]["user_email"];
        if (response["data"]["user_approve"] == 1) {
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
          myServices.sharedPreferences.setString("step", "2");
          String id = myServices.sharedPreferences.getString("id")!;
          String rawEmail = myServices.sharedPreferences.getString("email")!;
          String sanitizedEmail = rawEmail
              .replaceAll("@", "_")
              .replaceAll(".", "_");

          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users${id}");

          FirebaseMessaging.instance.subscribeToTopic("user_$sanitizedEmail");

          Get.offAllNamed("/home");
        } else {
          showDialog(
            context: context,
            builder: (_) => Pupuplogin(email: email.text),
          );
        }
      } else {
        Get.snackbar("erro", "this email or password is not correct");
      }
    }
    update();
  }
}
