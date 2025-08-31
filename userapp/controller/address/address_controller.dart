import 'package:get/get.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/address/addressdata.dart';

class AddressController extends GetxController {
  Addressdata _addressdata = Addressdata(Get.find());
  MyServices myServices = Get.find();
  late StatusRequst statusRequst;
  List address = [];
  String? namecity;
  @override
  void onInit() {
    statusRequst = StatusRequst.none;
    getData();
    super.onInit();
  }

  getData() async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _addressdata.getdata(
      myServices.sharedPreferences.getString("id")!,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (response['status'] == "success") {
      address.clear();
      address.addAll(response['data']);

      if (response['data'].isNotEmpty) {
        namecity = response['data'][0]["address_city"];
      }
    }

    update();
  }

  deletData(addressId) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _addressdata.deletdata(addressId.toString());
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        address.removeWhere((element) => element["address_id"] == addressId);
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }
}
