import 'package:adminapp/controller/core/class/curd.dart';
import 'package:adminapp/linkapi/link_api.dart';

class Orderdetaildata {
  Curd curd;
  Orderdetaildata(this.curd);
  getdata(String orderid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.orderdetails}");
    var response = await curd.postData(appLink.orderdetails, {
      "orderid": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
