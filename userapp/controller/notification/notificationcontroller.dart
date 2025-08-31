import 'package:get/get.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/notification/notificationdata.dart';

class Notificationcontroller extends GetxController {
  Notificationdata _Notificationdata = Notificationdata(Get.find());
  MyServices myServices = Get.find();
  List data = [];
  late StatusRequst statusRequst;
  getData() async {
    statusRequst = StatusRequst.loading;
    var response = await _Notificationdata.getdata(
      myServices.sharedPreferences.getString("id")!,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
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
