import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Ordersdata {
  Curd curd;
  Ordersdata(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.orders}");
    var response = await curd.postData(appLink.orders, {});
    return response.fold((l) => l, (r) => r);
  }

  deletdata(String orderid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.deletorders}");
    var response = await curd.postData(appLink.deletorders, {
      "ordersid": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
