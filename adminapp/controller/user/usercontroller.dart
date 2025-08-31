import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/user/userdata.dart';
import 'package:adminapp/view/screen/home/users/eidetuser.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Usercontroller extends GetxController {
  Userdata _Userdata = Userdata(Get.find());
  List users = [];
  MyServices myServices = Get.find();
  late StatusRequst statusRequst;
  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController passswrod;

  @override
  void onInit() {
    email = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    passswrod = TextEditingController();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequst = StatusRequst.loading;
    users.clear();
    update();
    var response = await _Userdata.getdata();
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        users.addAll(response['data']);
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  block(userid) async {
    update();
    var response = await _Userdata.block(userid.toString());
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {
        Get.snackbar("Erro", "This user is Blocked");
      }
    }
    update();
  }

  delet(userid) async {
    update();
    var response = await _Userdata.delet(userid.toString());
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {
        Get.snackbar("Erro", "This user is Blocked");
      }
    }
    update();
  }

  gotoeidet(userid, nameeidet, emaileidet, passwordediet, phoneeidet) {
    Get.to(
      Eidetuser(),
      arguments: {
        "userid": userid,
        "name": nameeidet,
        "email": emaileidet,
        "password": passwordediet,
        "phone": phoneeidet,
      },
    );
  }
}
