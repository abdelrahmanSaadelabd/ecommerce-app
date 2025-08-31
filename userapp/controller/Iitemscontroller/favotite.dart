import 'package:get/get.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/homedata/favoritedata.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/cartdata/cartdata.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/sendfavoritedata.dart';

class Favotitecontroller extends GetxController {
  Favoritedata _Favoritedata = Favoritedata(Get.find());
  StatusRequst statusRequst = StatusRequst.none;
  Sendfavoritedata _sendFavoritedata = Sendfavoritedata(Get.find());
  List Favorite = [];
  MyServices myServices = Get.find();
  sentCartdata _sentCartdataa = sentCartdata(Get.find());
  Map cart = {};
  Map discound = {};
  int count = 1;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Map favoritemap = {};

  setdiscound(id, val) {
    discound[id] = val;
    update();
  }

  setFavorite(id, val) {
    favoritemap[id] = val;
    update();
  }

  setcart(id, val) {
    cart[id] = val;
    update();
  }

  getData() async {
    Favorite.clear();
    statusRequst = StatusRequst.loading;
    var response = await _Favoritedata.getdata(
      myServices.sharedPreferences.getString("id")!,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        Favorite.addAll(response['data']);
        for (var item in Favorite) {
          discound[item["items_id"]] = item["items_discount"];
        }

        for (var item in Favorite) {
          cart[item['items_id']] = item['cart'];
        }
        for (var Favorites in Favorite) {
          favoritemap[Favorites["items_id"]] = Favorites["favorite"];
        }
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  sentfavorite(i) async {
    statusRequst = StatusRequst.bascket;

    update();

    var response = await _sendFavoritedata.getdata(
      myServices.sharedPreferences.getString("id")!,
      Favorite[i]["items_id"].toString(),
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  senttocart(i) async {
    var response = await _sentCartdataa.getdata(
      myServices.sharedPreferences.getString("id")!,
      Favorite[i]["items_id"].toString(),
      count.toString(),
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

  gotoproduct(int selcetitems, String productid) {
    Get.toNamed(
      "/product",
      arguments: {"items": [], "selcetitems": 0, "productid": productid},
    );
  }
}
