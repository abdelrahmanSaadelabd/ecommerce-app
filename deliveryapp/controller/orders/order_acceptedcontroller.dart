import 'package:deliveryapp/controller/core/class/statesr_requst.dart';
import 'package:deliveryapp/controller/core/functions/handling_data.dart';
import 'package:deliveryapp/controller/core/services/myservices.dart';
import 'package:deliveryapp/controller/data/datasours/remote/order/order_accepted.dart';
import 'package:get/get.dart';

class OrderAcceptedcontroller extends GetxController {
  order_accepteddata _order_accepteddatavdata = order_accepteddata(Get.find());
  List orders = [];
  MyServices myServices = Get.find();
  late StatusRequst statusRequst;
  getData() async {
    statusRequst = StatusRequst.loading;
    orders.clear();
    update();
    var response = await _order_accepteddatavdata.getdata(
      myServices.sharedPreferences.getString("id")!,
    );
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

  cansel(id) async {
    statusRequst = StatusRequst.loading;
    orders.clear();
    update();
    var response = await _order_accepteddatavdata.cansel(
      id.toString(),
      myServices.sharedPreferences.getString("id")!,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {}
    }
    update();
  }

  done(id) async {
    statusRequst = StatusRequst.loading;
    orders.clear();
    update();
    var response = await _order_accepteddatavdata.done(
      id.toString(),
      myServices.sharedPreferences.getString("id")!,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {}
    }
    update();
  }
}
