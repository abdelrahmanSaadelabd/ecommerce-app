import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Productdata {
  Curd curd;
  Productdata(this.curd);
  getdata(String productid, userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.product}");
    var response = await curd.postData(appLink.product, {
      "id": productid.toString(),
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
