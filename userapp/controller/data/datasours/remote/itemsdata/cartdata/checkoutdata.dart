
import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Checkoutdata {
  Curd curd;
  Checkoutdata(this.curd);
  postdata(
    String userid,
    String? addressid,
    String orders_delivery_typ,
    String orders_payment_typ,
    String orders_coupon,
    String orders_price,
  ) async {
    Map<String, String> data = {
      "orders_userid": userid,
      "orders_delivery_typ": orders_delivery_typ,
      "orders_payment_typ": orders_payment_typ,
      "orders_coupon": orders_coupon,
      "orders_price_delivery": "40",
      "orders_price": orders_price,
    };

    if (addressid != null) {
      data["orders_address_id"] = addressid;
    }

    var response = await curd.postData(appLink.add_orders, data);
    return response.fold((l) => l, (r) => r);
  }
}
