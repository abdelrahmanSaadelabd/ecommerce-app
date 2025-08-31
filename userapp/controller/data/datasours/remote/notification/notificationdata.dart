import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Notificationdata {
  Curd curd;
  Notificationdata(this.curd);
  getdata(userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.notification}");
    var response = await curd.postData(appLink.notification, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
