import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class sentCartdata {
  Curd curd;
  sentCartdata(this.curd);
  getdata(userid, String itemsid, count) async {
    print("🔵 Sending Data => userid: $userid, itemsid: $itemsid");
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.sendcart}");
    var response = await curd.postData(appLink.sendcart, {
      "userid": userid,
      "cartcount": count,
      "itemsid": itemsid.toString(),
    });
    print("🔴 Raw Response: $response");

    return response.fold((l) => l, (r) => r);
  }

  checkcoupon(namecoupon) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.coupon}");
    var response = await curd.postData(appLink.coupon, {
      "couponname": namecoupon,
    });
    print("🔴 Raw Response: $response");

    return response.fold((l) => l, (r) => r);
  }
}
