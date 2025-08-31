import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/delivery/deliverydata.dart';
import 'package:get/get.dart';

class deliveryblockcontroller extends GetxController {
  Deliverydata _deliverydata = Deliverydata(Get.find());
  List deliverys = [];
  MyServices myServices = Get.find();
  late StatusRequst statusRequst;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    statusRequst = StatusRequst.loading;
    deliverys.clear();
    update();
    var response = await _deliverydata.getdatablock();
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

  unblock(deliveryid) async {
    update();
    var response = await _deliverydata.unblock(deliveryid.toString());
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
}
