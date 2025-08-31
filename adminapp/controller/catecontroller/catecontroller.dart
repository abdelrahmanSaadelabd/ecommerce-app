import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/catedata/catedata.dart';
import 'package:adminapp/view/screen/home/cate/edietcate.dart';

import 'package:get/get.dart';

class Catecontroller extends GetxController {
  Catedata _categroydata = Catedata(Get.find());
  List categroys = [];
  MyServices myServices = Get.find();
  late StatusRequst statusRequst;

  @override
  void onInit() {
    getData();
    super.onInit();
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

  delet(categroyid, oldimage) async {
    update();
    var response = await _categroydata.deletdata(
      categroyid.toString(),
      oldimage.toString(),
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {
        Get.snackbar("Erro", "This categroy is Blocked");
      }
    }
    update();
  }

  gotoeidet(categroyid, namecate, oldimage) {
    Get.to(
      Edietcate(),
      arguments: {
        "categroyid": categroyid,
        "namecate": namecate,
        "oldimage": oldimage,
      },
    );
  }
}
