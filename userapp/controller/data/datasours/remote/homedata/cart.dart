import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Cartdata {
  Curd curd;
  Cartdata(this.curd);
  getdata(userid) async {
    print("🔵 Sending Data => userid: $userid, ");
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.cart}");
    var response = await curd.postData(appLink.cart, {"userid": userid});
    print("🔴 Raw Response: $response");

    return response.fold((l) => l, (r) => r);
  }
}
