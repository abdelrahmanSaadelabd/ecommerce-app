import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/address/address_controller.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/address/addressdata.dart';

class Editaddresscontroller extends GetxController {
  Addressdata _addressdata = Addressdata(Get.find());
  MyServices myServices = Get.find();
  late TextEditingController nameaddres;
  late TextEditingController cityddres;
  late TextEditingController streetaddres;
  late StatusRequst statusRequst;

  void onInit() {
    nameaddres = TextEditingController();
    cityddres = TextEditingController();
    streetaddres = TextEditingController();
    statusRequst = StatusRequst.none;
    super.onInit();
  }

  @override
  void onClose() {
    nameaddres.dispose();

    super.onClose();
  }

  postData(idaddress) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _addressdata.eidetdata(
      nameaddres.text,
      idaddress.toString(),
      cityddres.text,

      streetaddres.text,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        Get.snackbar("status", "The effective address has been added.");
        Get.back();
        Get.find<AddressController>().address.clear();
        Get.find<AddressController>().getData();
      } else {
        Get.snackbar("erro", "this email or password is not correct");
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }
}
