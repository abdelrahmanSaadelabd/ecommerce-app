import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/delivery/deliverydata.dart';
import 'package:adminapp/view/screen/home/delivers/edeitdelivery.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class deliverycontroller extends GetxController {
  Deliverydata _deliverydata = Deliverydata(Get.find());
  List deliverys = [];
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
    deliverys.clear();
    update();
    var response = await _deliverydata.getdata();
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        deliverys.addAll(response['data']);
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  block(deliveryid) async {
    update();
    var response = await _deliverydata.block(deliveryid.toString());
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {
        Get.snackbar("Erro", "This delivery is Blocked");
      }
    }
    update();
  }

  delet(deliveryid) async {
    update();
    var response = await _deliverydata.delet(deliveryid.toString());
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {
        Get.snackbar("Erro", "This delivery is Blocked");
      }
    }
    update();
  }

  gotoeidet(deliveryid, nameeidet, emaileidet, passwordediet, phoneeidet) {
    Get.to(
      Edeitdelivery(),
      arguments: {
        "deliveryid": deliveryid,
        "name": nameeidet,
        "email": emaileidet,
        "password": passwordediet,
        "phone": phoneeidet,
      },
    );
  }
}
