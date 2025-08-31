import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/report/reportdata.dart';
import 'package:get/get.dart';

class Reportcontroller extends GetxController {
  Reportdata _Reportdata = Reportdata(Get.find());
  MyServices myServices = Get.find();
  Map report = {};
  late StatusRequst statusRequst;
  getData() async {
    statusRequst = StatusRequst.loading;
    var response = await _Reportdata.getdata();
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        report = response;
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
