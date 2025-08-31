import 'package:get/get.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/data/datasours/remote/order/archivdata.dart';

class Archivcontroller extends GetxController {
  Archivdata _Archivdata = Archivdata(Get.find());
  List orders = [];
  late StatusRequst statusRequst;
  getData() async {
    statusRequst = StatusRequst.loading;
    orders.clear();
    update();
    var response = await _Archivdata.getdata();
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

  Rating(id, rating) async {
    statusRequst = StatusRequst.loading;
    orders.clear();
    update();
    var response = await _Archivdata.rating(id.toString(), rating.toString());
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {

      }
    }
    update();
  }
}
