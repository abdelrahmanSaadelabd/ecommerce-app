import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Sendfavoritedata {
  Curd curd;
  Sendfavoritedata(this.curd);
  getdata(userid, String itemsid) async {
    print("🔵 Sending Data => userid: $userid, itemsid: $itemsid");
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.sentfavorite}");
    var response = await curd.postData(appLink.sentfavorite, {
      "userid": userid,
      "itemsid": itemsid.toString(),
    });
    print("🔴 Raw Response: $response");

    return response.fold((l) => l, (r) => r);
  }
}
