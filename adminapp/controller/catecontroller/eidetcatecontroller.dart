import 'dart:io';

import 'package:adminapp/controller/catecontroller/catecontroller.dart';
import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/functions/uploadimage.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/catedata/catedata.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Eidetcatecontroller extends GetxController {
  Catedata _categroydata = Catedata(Get.find());
  MyServices myServices = Get.find();
  StatusRequst statusRequst = StatusRequst.none;
  late TextEditingController name;
  late String cateid;
  String? oldimage;
  @override
  void onInit() {
    final args = Get.arguments;
    cateid = args['categroyid'].toString();
    oldimage = args['oldimage']?.toString();
    name = TextEditingController(text: args['namecate']);

    super.onInit();
  }

  File? file;

  chengimage() async {
    file = await uploadimaheonGallery(true);
    update();
  }

  eidetcate() async {
    update();
    var response = await _categroydata.eidetdata(
      cateid,
      oldimage,
      name.text,
      file,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        Get.back();
        Get.find<Catecontroller>().getData();
      } else {
        Get.snackbar("Erro", "This categroy is Blocked");
      }
    }
    update();
  }
}
