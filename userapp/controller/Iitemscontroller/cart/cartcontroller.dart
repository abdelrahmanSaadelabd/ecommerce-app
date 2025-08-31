import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'package:untitled1/controller/data/datasours/remote/homedata/cart.dart';
import 'package:untitled1/controller/data/datasours/remote/itemsdata/cartdata/cartdata.dart';

class cartcontroller extends GetxController {
  Cartdata _Cartdata = Cartdata(Get.find());
  StatusRequst statusRequst = StatusRequst.none;
  sentCartdata _sendcartdata = sentCartdata(Get.find());
  List cart = [];
  Map<String, int> itemCountMap = {};
  Map<String, double> itemTotalPriceMap = {};
  Map discound = {};
  Map coupon = {};
  int coupondiscound = 0;
  int totalpriceaftterdiscound = 0;
  late TextEditingController namecoupon;
  MyServices myServices = Get.find();
  int? couponcheck;

  setdiscound(id, val) {
    discound[id] = val;
    update();
  }

  @override
  void onInit() {
    namecoupon = TextEditingController();
    getData(cart.length);
    super.onInit();
  }

  @override
  void onClose() {
    namecoupon.dispose();

    super.onClose();
  }

  Map cartmap = {};

  settocart(id, val) {
    cartmap[id] = val;
    update();
  }

  getData(int i) async {
    cart.clear();
    statusRequst = StatusRequst.bascket;
    var response = await _Cartdata.getdata(
      myServices.sharedPreferences.getString("id")!,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        cart.addAll(response['data']);
        for (var item in cart) {
          discound[item["items_id"]] = item["items_discount"];
        }
        if (i < cart.length) {
          int currentItemId = cart[i]["items_id"];
          bool isdiscound = discound[currentItemId] < 0;

          for (var item in cart) {
            String itemid = item["items_id"].toString();
            double price = (item["items_price"] as num).toDouble();
            double pricediscound =
                (item["itempricediscount"] as num).toDouble();
            itemCountMap[itemid] = (item["cart_count"]);
            itemTotalPriceMap[itemid] =
                (isdiscound ? price : pricediscound) * itemCountMap[itemid]!;
          }
        }

        for (var carts in cart) {
          cartmap[carts["items_id"]] = carts["cart"];
        }
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  void Totolprice(String itemId, double unitPrice) {
    if (itemCountMap[itemId]! > 1) {
      itemCountMap[itemId] = itemCountMap[itemId]! - 1;
      itemTotalPriceMap[itemId] = itemTotalPriceMap[itemId]! - unitPrice;
      update();
    }

    update();
  }

  void Totolpriceplus(String itemId, double unitPrice) {
    itemCountMap[itemId] = itemCountMap[itemId]! + 1;
    itemTotalPriceMap[itemId] = itemTotalPriceMap[itemId]! + unitPrice;
    update();
  }

  sentcart(i) async {
    statusRequst = StatusRequst.bascket;
    var itemId = cart[i]["items_id"].toString();

    var response = await _sendcartdata.getdata(
      myServices.sharedPreferences.getString("id")!,
      cart[i]["items_id"].toString(),
      itemCountMap[itemId].toString(),
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        itemCountMap.remove(itemId);
        itemCountMap[itemId]?.toString() ?? "0";
        cart.removeAt(i);

        update();
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  checkcoupon() async {
    statusRequst = StatusRequst.loading;
    update();

    var response = await _sendcartdata.checkcoupon(namecoupon.text);
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        coupon.addAll(response['data']);
        coupondiscound = coupon["coupon_discount"];
        couponcheck = coupon["coupon_discount"];

        update();
      } else {
        Get.snackbar("erro", "this Coupon is not correct");
      }
    }
    update();
  }

  double get totalCartPrice {
    double total = 0.0;
    itemTotalPriceMap.forEach((key, value) {
      total += value;
    });
    return total;
  }

  double get totalCartPriceafterdiscound {
    double total = 0.0;
    itemTotalPriceMap.forEach((key, value) {
      total += value;
    });

    double totalpriceafterdiscound = total * (coupondiscound / 100);

    return total - totalpriceafterdiscound;
  }

  int get totalItemCount {
    int total = 0;
    itemCountMap.forEach((key, value) {
      total += value;
    });
    return total;
  }

  gotoproduct(int selcetitems, String productid) {
    Get.toNamed(
      "/product",
      arguments: {"items": [], "selcetitems": 0, "productid": productid},
    );
  }

  gotocheckout() {
    if (cart.isEmpty) {
      Get.snackbar("Warm", "The Cart isEmpty");
    } else {
      Get.toNamed(
        "/checkout",
        arguments: {
          "totalItemCount": totalItemCount,
          "totalCartPrice": totalCartPrice,
          "totalCartPriceafterdiscound": totalCartPriceafterdiscound,
          "coupondiscound": couponcheck,
          "itemCountMap": itemCountMap,
        },
      );
    }
  }

  void clearCartData() {
    cart.clear();
    itemCountMap.clear();
    itemTotalPriceMap.clear();
    cartmap.clear();
    discound.clear();
    coupon.clear();
    coupondiscound = 0;
    couponcheck = null;
    namecoupon.clear();
    update();
  }
}
