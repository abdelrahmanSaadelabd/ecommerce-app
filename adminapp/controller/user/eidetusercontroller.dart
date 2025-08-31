import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/user/userdata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Eidetusercontroller extends GetxController {
  Userdata _Userdata = Userdata(Get.find());
  late String userid;
  MyServices myServices = Get.find();
  StatusRequst statusRequst = StatusRequst.none;
  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController passswrod;

  @override
  void onInit() {
    final args = Get.arguments;
    userid = args['userid'];
    email = TextEditingController(text: args['email']);
    name = TextEditingController(text: args['name']);
    phone = TextEditingController(text: args['phone']);
    passswrod = TextEditingController(text: args['password']);
    super.onInit();
  }

  eidetuser() async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _Userdata.eidetuser(
      userid,
      name.text,
      email.text,
      phone.text,
      passswrod.text,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        Get.back();
      } else {}
    }
    update();
  }
}
