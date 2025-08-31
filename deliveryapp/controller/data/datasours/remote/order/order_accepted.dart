import 'package:deliveryapp/controller/core/class/curd.dart';
import 'package:deliveryapp/linkapi/link_api.dart';

class order_accepteddata {
  Curd curd;
  order_accepteddata(this.curd);
  getdata(String orders_delivery_id) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.order_accepted}");
    var response = await curd.postData(appLink.order_accepted, {
      "orders_delivery_id": orders_delivery_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  cansel(String id, String orders_delivery_id) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.cancel_order}");
    var response = await curd.postData(appLink.cancel_order, {
      "orders_id": id,
      "orders_delivery_id": orders_delivery_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  done(String id, String orders_delivery_id) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.delivered_order}");
    var response = await curd.postData(appLink.delivered_order, {
      "orders_id": id,
      "orders_delivery_id": orders_delivery_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
