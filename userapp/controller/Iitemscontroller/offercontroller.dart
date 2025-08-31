import 'package:get/get.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/offerdata.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/sendfavoritedata.dart';

class Offercontroller extends GetxController {
  final Offerdata _offerdata = Offerdata(Get.find());
  final Sendfavoritedata _Favoritedata = Sendfavoritedata(Get.find());

  List items = [];
  late StatusRequst statusRequst;
  List categries = [];
  MyServices myServices = Get.find();
  Map favorite = {};
  Map discound = {};

  setFavorite(id, val) {
    favorite[id] = val;
    update();
  }

  setdiscound(id, val) {
    discound[id] = val;
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    items.clear();
    favorite.clear();
    discound.clear();
    statusRequst = StatusRequst.loading;
    var response = await _offerdata.getdata(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        items.addAll(response['data']);

        for (var item in items) {
          favorite[item["items_id"]] = item["favorite"];
        }
        for (var item in items) {
          discound[item["items_id"]] = item["items_discount"];
        }
      } else {
        statusRequst = StatusRequst.failer;
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

  sentfavorite(i) async {
    var response = await _Favoritedata.getdata(
      myServices.sharedPreferences.getString("id")!,
      items[i]["items_id"].toString(),
    );
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }
}
