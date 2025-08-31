import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Itemsdata {
  Curd curd;
  Itemsdata(this.curd);
  getdata(String catid, userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.items}");
    var response = await curd.postData(appLink.items, {
      "id": catid.toString(),
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
