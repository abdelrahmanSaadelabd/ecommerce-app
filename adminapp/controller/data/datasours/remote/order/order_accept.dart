import 'package:adminapp/controller/core/class/curd.dart';
import 'package:adminapp/linkapi/link_api.dart';

class order_accepteddata {
  Curd curd;
  order_accepteddata(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.orderperyper}");
    var response = await curd.postData(appLink.orderperyper, {});
    return response.fold((l) => l, (r) => r);
  }

  cansel(String id, String userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.cancel_order}");
    var response = await curd.postData(appLink.cancel_order, {
      "id": id,
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  accept(String id, String userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.aprrove}");
    var response = await curd.postData(appLink.aprrove, {
      "id": id,
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  done(String id, String userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.orderdone}");
    var response = await curd.postData(appLink.orderdone, {
      "id": id,
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
