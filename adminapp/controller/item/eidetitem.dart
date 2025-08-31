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

class Eidetitem extends GetxController {
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
  String? oldimagelist;
  String? oldimage;
  String? itemsid;
  bool? itemsactive;
  String? catenameselected;

  String? selectedCategoryName;
  String? selectedCategoryId;

  File? file;
  List<File> additionalImages = [];
  List<String> oldimageListPaths = [];
  @override
  void onInit() {
    final args = Get.arguments;
    oldimage = args['oldimage'];
    oldimagelist = args['oldimagelist'];
    if (oldimagelist != null && oldimagelist!.isNotEmpty) {
      oldimageListPaths = oldimagelist!.split(',');
    }
    itemsid = args['itemsgroyid'].toString();
    itemsactive = args['itemsactive'].toString() == "1" ? true : false;
    catenameselected = args['itemscate'].toString();

    nameitems = TextEditingController(text: args['nameitems'].toString());
    descitems = TextEditingController(text: args['itemsdesc'].toString());
    countitems = TextEditingController(text: args['itemscount'].toString());
    priceitems = TextEditingController(text: args['itemsprice'].toString());
    discountitems = TextEditingController(
      text: args['itemsdiscount'].toString(),
    );
    cateitems = TextEditingController(text: args['itemscate'].toString());
    getData();
    print(
      "${oldimage}0000 ${oldimagelist}------${itemsid}//////${itemsactive}++++++${catenameselected}11111111+${descitems.text}11111111${cateitems.text}11111111",
    );

    super.onInit();
  }

  changstatusitems(bool val) {
    itemsactive = val;
    update();
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

  eidetitems() async {
    update();

    var response = await _itemsgroydata.eidetdata(
      itemsid,
      oldimage,
      oldimagelist,
      nameitems.text,
      file,
      descitems.text,
      countitems.text,
      itemsactive! ? "1" : "0",
      priceitems.text,
      discountitems.text,
      additionalImages,
      selectedCategoryId ?? itemsid,
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
