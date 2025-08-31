import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/order/archivorderdata.dart';
import 'package:get/get.dart';

class Archivcontroller extends GetxController {
  Archivorderdata _order_accepteddatavdata = Archivorderdata(Get.find());
  List orders = [];
  MyServices myServices = Get.find();
  late StatusRequst statusRequst;
  getData() async {
    statusRequst = StatusRequst.loading;
    orders.clear();
    update();
    var response = await _order_accepteddatavdata.getdata();
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        orders.addAll(response['data']);
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
