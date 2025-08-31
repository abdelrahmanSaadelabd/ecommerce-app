import 'package:get/get.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/data/datasours/remote/order/orders.dart';

class Orderscontroller extends GetxController {
  Ordersdata _OrdersdataData = Ordersdata(Get.find());
  List orders = [];
  late StatusRequst statusRequst;
  getData() async {
    statusRequst = StatusRequst.loading;
    orders.clear();
    update();
    var response = await _OrdersdataData.getdata();
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

  deletData(orderid) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _OrdersdataData.deletdata(orderid.toString());
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        orders.removeWhere((element) => element["orders_id"] == orderid);
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }
}
