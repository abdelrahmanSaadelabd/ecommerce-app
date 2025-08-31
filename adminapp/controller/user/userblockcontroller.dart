import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/user/userdata.dart';
import 'package:get/get.dart';

class Userblockcontroller extends GetxController {
  Userdata _Userdata = Userdata(Get.find());
  List users = [];
  MyServices myServices = Get.find();
  late StatusRequst statusRequst;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    statusRequst = StatusRequst.loading;
    users.clear();
    update();
    var response = await _Userdata.getdatablock();
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        users.addAll(response['data']);
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  unblock(userid) async {
    update();
    var response = await _Userdata.unblock(userid.toString());
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {
        Get.snackbar("Erro", "This user is Blocked");
      }
    }
    update();
  }
}
