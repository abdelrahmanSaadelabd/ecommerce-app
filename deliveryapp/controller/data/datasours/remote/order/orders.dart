import 'package:deliveryapp/controller/core/class/curd.dart';
import 'package:deliveryapp/linkapi/link_api.dart';

class Ordersdata {
  Curd curd;
  Ordersdata(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.order}");
    var response = await curd.postData(appLink.order, {});
    return response.fold((l) => l, (r) => r);
  }

  approve_order(
    String orderid,
    String orders_delivery_id,
    String userid,
  ) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.approve_order}");
    var response = await curd.postData(appLink.approve_order, {
      "orders_delivery_id": orders_delivery_id,
      "orders_id": orderid,
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
