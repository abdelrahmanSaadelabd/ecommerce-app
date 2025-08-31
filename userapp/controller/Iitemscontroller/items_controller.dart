import 'package:get/get.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/sendfavoritedata.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/itemsdata.dart';

class ItemsController extends GetxController {
  Itemsdata _itemsdata = Itemsdata(Get.find());
  Sendfavoritedata _Favoritedata = Sendfavoritedata(Get.find());

  List items = [];
  late StatusRequst statusRequst;
  List categries = [];
  late String categriesid;
  late int selcetedcate;
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
    initialData();
    getData(categriesid);
    super.onInit();
  }

  initialData() {
    categries = Get.arguments['categories'];
    selcetedcate = Get.arguments['selcetedcategries'];
    categriesid = Get.arguments['categriesid'];
    print("Received ID: $categriesid");
  }

  onchangecat(val, categriesival) {
    selcetedcate = val;
    categriesid = categriesival.toString();
    getData(categriesid);

    update();
  }

  getData(String categriesid) async {
    items.clear();
    favorite.clear();
    discound.clear();
    statusRequst = StatusRequst.loading;
    var response = await _itemsdata.getdata(
      categriesid,
      myServices.sharedPreferences.getString("id")!,
    );
    print("0000000000000000000000000000000$response");
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
    print("0000000000000000000000000000000$response");
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
