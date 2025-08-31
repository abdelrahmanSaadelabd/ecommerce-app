import 'package:get/get.dart';
import 'package:untitled1/controller/Iitemscontroller/cart/cartcontroller.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/cartdata/checkoutdata.dart';

class Checkoutcontroller extends GetxController {
  Checkoutdata _checkoutdata = Checkoutdata(Get.find());

  StatusRequst statusRequst = StatusRequst.none;
  MyServices myServices = Get.find();
  String? paymemt;
  String? delivery;
  String? addressid;
  String? totalItemCount;
  String? totalprice;
  String? totalCartPriceafterdiscound;
  String? coupondiscound;
  late Map itemCountMap;
  int? countval;
  choosepaymentmethod(val) {
    paymemt = val;
    update();
  }

  choosedeliverytapy(val) {
    delivery = val;
    update();
  }

  chooseaddress(val) {
    addressid = val;
    update();
  }

  inilaData() {
    final args = Get.arguments;
    totalItemCount = args['totalItemCount']?.toString() ?? "0";
    totalprice = args['totalCartPrice']?.toString() ?? "0.0";
    totalCartPriceafterdiscound =
        args['totalCartPriceafterdiscound']?.toString() ?? "0.0";
    coupondiscound = args['coupondiscound']?.toString() ?? "0";
    itemCountMap = args['itemCountMap'];
    itemCountMap.forEach((key, value) {
      countval = value;
      print("$countval");
    });
  }

  @override
  void onInit() {
    inilaData();
    print(totalItemCount);
    print(totalprice);
    print(totalCartPriceafterdiscound);
    print(coupondiscound);
    super.onInit();
  }

  postdata() async {
    statusRequst = StatusRequst.delivery;
    update();
    int couponValue = int.tryParse(coupondiscound ?? "0") ?? 0;
    String? userid = myServices.sharedPreferences.getString("id");
    if (userid == null) {
      Get.snackbar("خطأ", "مفيش مستخدم مسجل");
      return;
    }

    var response = await _checkoutdata.postdata(
      userid,

      (addressid == null || addressid == "null") ? null : addressid,
      (delivery == "Delivery" ? 1 : 0).toString(),
      (paymemt == "cash" ? 1 : 0).toString(),
      (coupondiscound ?? "0").toString(),
      (couponValue > 0 ? totalCartPriceafterdiscound : totalprice)!.toString(),
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        if (delivery == "Pick-up") {
          Get.find<cartcontroller>().clearCartData();
          Get.offAllNamed("/home");
        } else {
          if ((addressid != null)) {
            Get.find<cartcontroller>().clearCartData();
            Get.offAllNamed("/home");
          } else {
            Get.snackbar(
              "Warring",
              "Select the address you want the order to reach from the site in the settings.",
            );
          }
        }

        update();
      } else {}
    }
    update();
  }

  gotohomepage() {
    if ((paymemt?.isEmpty ?? true) || (delivery?.isEmpty ?? true)) {
      Get.snackbar("ERRO", "Choose payment or delivery");
    } else {
      postdata();
    }
  }
}
