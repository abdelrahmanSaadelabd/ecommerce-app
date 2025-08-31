import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Orderdetaildata {
  Curd curd;
  Orderdetaildata(this.curd);
  getdata(String orderid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.ordersdetails}");
    var response = await curd.postData(appLink.ordersdetails, {
      "orderid": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
