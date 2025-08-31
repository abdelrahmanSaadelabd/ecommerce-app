import 'package:get/get.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/cartdata/cartdata.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/sendfavoritedata.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/productdata.dart';

class Productcontroller extends GetxController {
  Productdata _productdata = Productdata(Get.find());
  Sendfavoritedata _Favoritedata = Sendfavoritedata(Get.find());

  sentCartdata _sentCartdataa = sentCartdata(Get.find());

  MyServices myServices = Get.find();
  List product = [];
  var currentpage = 0.obs;
  double totolprice = 0;
  double timesprice = 0;
  int count = 1;
  List image = [];
  late StatusRequst statusRequst;
  late int selcetitems;
  late String productid;
  Map favorite = {};
  Map discound = {};
  Map cart = {};
  @override
  void onInit() {
    inilaData();
    getData();
    super.onInit();
  }

  inilaData() {
    selcetitems = Get.arguments['selcetitems'];
    productid = Get.arguments['productid'];
  }

  setdiscound(id, val) {
    discound[id] = val;
    update();
  }

  setFavorite(id, val) {
    favorite[id] = val;
    update();
  }

  setCart(id, val) {
    cart[id] = val;
    update();
  }

  changpage(int index) {
    currentpage.value = index;
    update();
  }

  getData() async {
    statusRequst = StatusRequst.loading;

    var response = await _productdata.getdata(
      productid,
      myServices.sharedPreferences.getString("id")!,
    );

    print("0000000000000000000000000000000$response");

    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        product.addAll(response["data"]);
        for (var item in product) {
          discound[item["items_id"]] = item["items_discount"];
        }

        if (selcetitems >= product.length || selcetitems < 0) {
          selcetitems = 0;
        }
        int currentItemId = product[selcetitems]["items_id"];
        bool isdiscound = discound[currentItemId] > 0;
        if (isdiscound) {
          timesprice =
              (product[selcetitems]["itempricediscount"] as num).toDouble();
          count = product[selcetitems]["cart_count"];

          totolprice = timesprice;
        } else {
          timesprice = (product[selcetitems]["items_price"] as num).toDouble();
          count = product[selcetitems]["cart_count"];
          totolprice = timesprice;
        }

        for (var item in product) {
          cart[item['items_id']] = item['cart'];
        }
        for (var item in product) {
          favorite[item['items_id']] = item['favorite'];
        }
      } else {
        statusRequst = StatusRequst.failer;
      }
    }

    update();
  }

  Totolprice() {
    if (count > 1) {
      count--;
      totolprice = timesprice * count;
      update();
    }

    update();
  }

  Totolpriceplus() {
    count++;
    totolprice = timesprice * count;
    update();
  }

  sentfavorite(i) async {
    statusRequst = StatusRequst.bascket;
    update();
    var response = await _Favoritedata.getdata(
      myServices.sharedPreferences.getString("id")!,
      product[i]["items_id"].toString(),
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

  senttocart(i) async {
    statusRequst = StatusRequst.bascket;
    update();
    var response = await _sentCartdataa.getdata(
      myServices.sharedPreferences.getString("id")!,
      product[i]["items_id"].toString(),
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
}
