import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/data/datasours/remote/scearch/scearchdata.dart';

class Scearchhomecontroller extends GetxController {
  Scearchdata _Scearchdata = Scearchdata(Get.find());
  List product = [];
  late TextEditingController scearch;

  late StatusRequst statusRequst;
  late int selcetitems;
  late String productid;
  bool isscearch = false;
  changestatusScearch(val) {
    if (val == "") {
      statusRequst = StatusRequst.none;
      isscearch = false;
    }
    update();
  }

  onScearch() {
    isscearch = true;
    update();
  }

  @override
  void onInit() async {
    scearch = TextEditingController();
    statusRequst = StatusRequst.none;

    await getData();
    super.onInit();
  }

  @override
  void onClose() {
    scearch.dispose();
    super.onClose();
  }

  getData() async {
    StatusRequst.loading;
    update();

    if (scearch.text.trim().isEmpty) {
      isscearch = false;
      product.clear();
      update();
      return;
    }

    statusRequst = StatusRequst.loading;
    var response = await _Scearchdata.getdata(scearch.text);
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        product = response["data"];
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  gotoproduct(List items, int selcetitems, String productid) {
    Get.toNamed(
      "/product",
      arguments: {
        "items": items,
        "selcetitems": selcetitems,
        "productid": productid,
      },
    );
  }
}
