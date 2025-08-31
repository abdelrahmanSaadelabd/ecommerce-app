import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Offerdata {
  Curd curd;
  Offerdata(this.curd);
  getdata(userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.offer}");
    var response = await curd.postData(appLink.offer, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
