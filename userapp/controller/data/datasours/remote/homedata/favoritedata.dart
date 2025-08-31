import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Favoritedata {
  Curd curd;
  Favoritedata(this.curd);
  getdata(userid) async {
    print("🔵 Sending Data => userid: $userid, ");
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.favorite}");
    var response = await curd.postData(appLink.favorite, {"userid": userid});
    print("🔴 Raw Response: $response");

    return response.fold((l) => l, (r) => r);
  }
}
