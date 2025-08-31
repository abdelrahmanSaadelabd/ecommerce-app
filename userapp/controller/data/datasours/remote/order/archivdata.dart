import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Archivdata {
  Curd curd;
  Archivdata(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.archiv}");
    var response = await curd.postData(appLink.archiv, {});
    return response.fold((l) => l, (r) => r);
  }

  rating(String id, String rating) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.rating}");
    var response = await curd.postData(appLink.rating, {
      "ordersid": id,
      "orders_rating": rating,
    });
    return response.fold((l) => l, (r) => r);
  }
}
