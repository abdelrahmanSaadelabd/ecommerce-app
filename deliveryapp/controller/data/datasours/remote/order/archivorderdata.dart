import 'package:deliveryapp/controller/core/class/curd.dart';
import 'package:deliveryapp/linkapi/link_api.dart';

class Archivorderdata {
  Curd curd;
  Archivorderdata(this.curd);
  getdata(String orders_delivery_id) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.archive}");
    var response = await curd.postData(appLink.archive, {
      "orders_delivery_id": orders_delivery_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
