import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';

import 'package:untitled1/controller/data/datasours/remote/homedata/homedata.dart';

class HomeController extends GetxController {
  homeeData _homeeData = homeeData(Get.find());
  List product = [];

  List categories = [];
  List itemsview = [];
  late StatusRequst statusRequst;
  late int selcetitems;
  late String productid;

  @override
  void onInit() async {
    statusRequst = StatusRequst.none;
    await topsilling();

    super.onInit();
  }

  void getFCMToken() async {
    String? token = await FirebaseMessaging.instance.getToken();

    print("FCM Token: $token");
  }

  getData() async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _homeeData.getdata();
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        itemsview.addAll(response['itemsview']);
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  topsilling() async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _homeeData.topselling();
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        if (response['itemsview'] != null) {
          categories.addAll(response['categories']);
          itemsview.addAll(response['itemsview']);
        } else {
          getData();
        }
      } else {
        StatusRequst.failer;
      }
    }
    update();
  }

  gotoproduct(List items, int selcetitems, String productid) {
    Get.toNamed(
      "/product",
      arguments: {
        "items": items,
        "selcetitems": selcetitems,
        "productid": productid,
      },
    );
  }

  gotoite(List categries, int selcetedcategries, String categriesid) {
    Get.toNamed(
      "/items",
      arguments: {
        "categories": categries,
        "selcetedcategries": selcetedcategries,
        "categriesid": categriesid,
      },
    );
  }
}
