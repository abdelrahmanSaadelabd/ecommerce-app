import 'dart:io';

import 'package:adminapp/controller/catecontroller/catecontroller.dart';
import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/functions/uploadimage.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/catedata/catedata.dart';
import 'package:adminapp/controller/data/datasours/remote/itemsdata/itemsdata.dart';
import 'package:adminapp/controller/item/itemscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Additemcontroller extends GetxController {
  Itemsdata _itemsgroydata = Itemsdata(Get.find());
  Catedata _categroydata = Catedata(Get.find());
  List categroys = [];

  MyServices myServices = Get.find();
  StatusRequst statusRequst = StatusRequst.none;
  late TextEditingController nameitems;
  late TextEditingController descitems;
  late TextEditingController countitems;
  late TextEditingController priceitems;
  late TextEditingController discountitems;
  late TextEditingController cateitems;
  String? selectedCategoryName;
  String? selectedCategoryId;

  File? file;
  List<File> additionalImages = [];
  bool active = false;
  changstatusitems(bool val) {
    active = val;
    update();
  }

  @override
  void onInit() {
    nameitems = TextEditingController();
    descitems = TextEditingController();
    countitems = TextEditingController();
    priceitems = TextEditingController();
    discountitems = TextEditingController();
    cateitems = TextEditingController();
    getData();

    super.onInit();
  }

  void setSelectedCategory(Map category) {
    selectedCategoryName = category["categories_name"];
    selectedCategoryId = category["categories_id"].toString();
    cateitems.text = selectedCategoryName!;
    update();
  }

  chengimage() async {
    file = await uploadimaheonGallery(false);
    update();
  }

  chengmoreimage() async {
    additionalImages = await uploadMultipleImagesFromGallery();
    update();
  }

  additems() async {
    update();
    var response = await _itemsgroydata.adddata(
      nameitems.text,
      file,
      descitems.text,
      countitems.text,
      active ? "1" : "0",
      priceitems.text,
      discountitems.text,
      selectedCategoryId.toString(),
      additionalImages,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        Get.back();
        Get.find<itemscontroller>().getData();
      } else {
        Get.snackbar("Erro", "This itemsgroy is Blocked");
      }
    }
    update();
  }

  getData() async {
    statusRequst = StatusRequst.loading;
    categroys.clear();
    update();
    var response = await _categroydata.getdata();
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        categroys.addAll(response['data']);
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }
}
